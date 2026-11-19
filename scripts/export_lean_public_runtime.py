#!/usr/bin/env python3
"""Export only the pinned public Lean compiler and dependency sources/artifacts.

This provisions a local runtime. It does not verify or accept project proofs.
No checkout .git directory, credentials, environment dump, or home directory
is included. Package files come from the pinned public Git index and the
explicit .lake/build/lib and .lake/config runtime directories only.
"""
from __future__ import annotations

import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import shutil
import subprocess
import tarfile

ROOT = Path(__file__).resolve().parents[1]
LEAN = ROOT / "lean"
OUTPUT = ROOT / ".public-runtime-export"
CHUNK_BYTES = 450 * 1024 * 1024
MAX_PARTS = 6
LEAN_SHA256 = "bf8d54e4714cc4b03d3f6bb34c83b7202b87e49c8bfcbff6895c085bb90ceb38"
CHECKER_SHA256 = "12c38901cdbfab178f1bf6145dd30012e9a3b2c11ca695292a5884fa3cbaddb6"
MATHLIB_REV = "56a005855ea17e0b0958f73ec801ae140b0a1679"
TOOLCHAIN = "leanprover/lean4:v4.35.0"


def require(condition: bool, message: str) -> None:
    if not condition:
        raise RuntimeError(message)


def digest(path: Path) -> str:
    result = hashlib.sha256()
    with path.open("rb") as handle:
        while block := handle.read(4 * 1024 * 1024):
            result.update(block)
    return result.hexdigest()


def public_path(root: Path, path: Path) -> None:
    """Reject external links and Git/credential state before reading bytes."""
    relative = path.relative_to(root)
    require(".git" not in relative.parts, f"Git state is excluded: {relative}")
    require(path.resolve().is_relative_to(root.resolve()),
            f"Path leaves its public package: {relative}")
    require(".git" not in path.resolve().relative_to(root.resolve()).parts,
            f"Link points into Git state: {relative}")
    require(path.is_file() or path.is_symlink(), f"Unexpected file kind: {relative}")
    if path.is_symlink():
        require(not os.path.isabs(os.readlink(path)),
                f"Absolute link is excluded: {relative}")


def walk_files(root: Path, directory: Path) -> list[Path]:
    if not directory.is_dir():
        return []
    found = []
    for current, dirs, files in os.walk(directory, followlinks=False):
        dirs[:] = sorted(d for d in dirs if d != ".git")
        for name in sorted(files):
            path = Path(current) / name
            public_path(root, path)
            found.append(path)
        # Keep only relative directory links whose targets stay in this tree.
        for name in dirs:
            path = Path(current) / name
            if path.is_symlink():
                public_path(root, path)
                found.append(path)
    return found


def package_files(package: Path) -> list[Path]:
    tracked = subprocess.check_output(
        ["git", "-C", str(package), "ls-files", "-z"]).decode().split("\0")
    selected = []
    root_configs = {"lakefile.lean", "lakefile.toml", "lake-manifest.json",
                    "lean-toolchain", "LICENSE", "LICENSE.md"}
    for name in tracked:
        if not name:
            continue
        relative = PurePosixPath(name)
        require(not relative.is_absolute() and ".." not in relative.parts,
                f"Unexpected public Git path: {name}")
        if relative.suffix == ".lean" or name in root_configs:
            path = package / name
            public_path(package, path)
            selected.append(path)
    for relative in [".lake/build/lib", ".lake/config"]:
        selected.extend(walk_files(package, package / relative))
    return sorted(set(selected))


def archive(label: str, entries: list[tuple[Path, str]]) -> dict:
    destination = OUTPUT / f"{label}.tar.zst"
    zstd = shutil.which("zstd")
    require(zstd is not None, "The hosted runner must provide zstd")
    with destination.open("wb") as handle:
        process = subprocess.Popen(
            [zstd, "-T1", "-3", "-c"], stdin=subprocess.PIPE, stdout=handle)
        assert process.stdin is not None
        with tarfile.open(fileobj=process.stdin, mode="w|", format=tarfile.PAX_FORMAT) as tar:
            for path, name in entries:
                info = tar.gettarinfo(str(path), arcname=name)
                info.uid = info.gid = 0
                info.uname = info.gname = ""
                info.mtime = 0
                if info.isfile():
                    with path.open("rb") as source:
                        tar.addfile(info, source)
                else:
                    require(info.issym(), f"Unexpected archive member: {name}")
                    tar.addfile(info)
        process.stdin.close()
        require(process.wait() == 0, f"Compression failed: {label}")
    full_hash = digest(destination)
    full_bytes = destination.stat().st_size
    parts = []
    with destination.open("rb") as source:
        index = 0
        while data := source.read(CHUNK_BYTES):
            require(index < MAX_PARTS, f"Too many archive parts: {label}")
            part = OUTPUT / f"{label}.tar.zst.part{index:02d}"
            part.write_bytes(data)
            parts.append({"file": part.name, "bytes": len(data), "sha256": digest(part)})
            index += 1
    destination.unlink()
    return {"archive": f"{label}.tar.zst", "sha256": full_hash,
            "bytes": full_bytes, "entries": len(entries), "parts": parts}


def main() -> None:
    require((LEAN / "lean-toolchain").read_text().strip() == TOOLCHAIN,
            "The repository toolchain changed")
    require(not OUTPUT.exists(), "Refusing to overwrite a previous runtime export")
    manifest = json.loads((LEAN / "lake-manifest.json").read_text())
    packages = manifest["packages"]
    require(next(p["rev"] for p in packages if p["name"] == "mathlib") == MATHLIB_REV,
            "The pinned Mathlib revision changed")
    require(all(p["type"] == "git" and p["url"].startswith("https://github.com/")
                for p in packages), "Only pinned public GitHub dependencies are exported")
    compiler = Path(subprocess.check_output(
        ["lake", "env", "lean", "--print-prefix"], cwd=LEAN, text=True).strip()).resolve()
    require(digest(compiler / "bin/lean") == LEAN_SHA256, "Unexpected compiler binary")
    require(digest(compiler / "bin/leanchecker") == CHECKER_SHA256,
            "Unexpected stock checker binary")
    compiler_entries = [(p, "toolchain/" + str(p.relative_to(compiler)).replace(os.sep, "/"))
                        for p in walk_files(compiler, compiler)]
    package_entries = []
    package_inventory = []
    for item in packages:
        name = item["name"]
        require(name and "/" not in name and name not in {".", ".."},
                "Invalid package name")
        package = LEAN / ".lake/packages" / name
        revision = subprocess.check_output(
            ["git", "-C", str(package), "rev-parse", "HEAD"], text=True).strip()
        require(revision == item["rev"], f"Package revision mismatch: {name}")
        dirty = subprocess.check_output(
            ["git", "-C", str(package), "status", "--porcelain", "--untracked-files=no"],
            text=True)
        require(not dirty.strip(), f"Tracked public package sources changed: {name}")
        files = package_files(package)
        cached_objects = sum(p.name.endswith(".olean") for p in files)
        # Cli is a declared tooling dependency that Mathlib does not prebuild.
        # Its pinned sources are sufficient to build it later if needed.
        require(cached_objects > 0 or name == "Cli",
                f"Missing cached Lean objects: {name}")
        package_entries.extend(
            (p, f"packages/{name}/" + str(p.relative_to(package)).replace(os.sep, "/"))
            for p in files)
        package_inventory.append({"name": name, "url": item["url"], "rev": revision,
                                  "files": len(files), "cached_olean_count": cached_objects})
    OUTPUT.mkdir()
    result = {
        "schema": "public-lean-runtime-export-v1",
        "scope": "Pinned public compiler, sources and dependency runtime artifacts; not proof acceptance",
        "source_commit": os.environ.get("GITHUB_SHA", ""),
        "toolchain": TOOLCHAIN,
        "lean_sha256": LEAN_SHA256,
        "leanchecker_sha256": CHECKER_SHA256,
        "mathlib_commit": MATHLIB_REV,
        "lake_manifest_sha256": digest(LEAN / "lake-manifest.json"),
        "package_inventory": package_inventory,
        "chunk_limit_bytes": CHUNK_BYTES,
        "archive_root_layout": ["toolchain/", "packages/"],
        "excluded": [".git directories", "checkout credentials", "environment dumps",
                     "home directories", "project proofs and build artifacts"],
        "archives": [archive("toolchain", compiler_entries),
                     archive("packages", package_entries)],
    }
    target = OUTPUT / "manifest.json"
    target.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n")
    (OUTPUT / "manifest.sha256").write_text(digest(target) + "  manifest.json\n")
    print(json.dumps(result, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
