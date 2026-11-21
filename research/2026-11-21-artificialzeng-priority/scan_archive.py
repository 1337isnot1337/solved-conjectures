#!/usr/bin/env python3
"""Read every regular UTF-8 tar member and preserve complete matching files.

This is a source-discovery aid, not a mathematical verifier or priority proof.
It never executes archive content or extracts links. The manifest explicitly
lists undecodable files; no size cutoff is imposed on regular files.
"""
import argparse
import hashlib
import json
from pathlib import Path, PurePosixPath
import tarfile
import time
import urllib.request


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("name")
    parser.add_argument("repository")
    parser.add_argument("commit")
    args = parser.parse_args()
    base = Path(__file__).resolve().parent
    targets = json.loads((base / "targets.json").read_text())
    targets = {k: [s.casefold() for s in values] for k, values in targets.items()}
    archive_path = base / (args.name + ".tar.gz")
    archive_url = f"https://codeload.github.com/{args.repository}/tar.gz/{args.commit}"
    start = time.monotonic()
    if not archive_path.exists():
        print("download_start", archive_url, flush=True)
        with urllib.request.urlopen(archive_url, timeout=45) as response, archive_path.open("wb") as out:
            while block := response.read(1024 * 1024):
                out.write(block)
        print("downloaded", archive_path.stat().st_size, flush=True)
    with archive_path.open("rb") as f:
        digest = hashlib.file_digest(f, "sha256").hexdigest()
    outroot = base / (args.name + "-text-matches")
    outroot.mkdir(exist_ok=True)
    records, skipped, matches = [], [], []
    with tarfile.open(archive_path, "r:gz") as archive:
        for member in archive:
            if not member.isfile():
                if not member.isdir():
                    skipped.append({"path": member.name, "reason": "not_regular"})
                continue
            parts = PurePosixPath(member.name).parts[1:]
            if not parts or ".." in parts or PurePosixPath(*parts).is_absolute():
                raise ValueError(member.name)
            relative = str(PurePosixPath(*parts))
            data = archive.extractfile(member).read()
            try:
                text = data.decode("utf-8")
            except UnicodeDecodeError:
                skipped.append({"path": relative, "reason": "not_utf8", "size": len(data)})
                continue
            lowered = (relative + "\n" + text).casefold()
            tags = [tag for tag, needles in targets.items() if any(s in lowered for s in needles)]
            records.append({"path": relative, "size": len(data), "sha256": hashlib.sha256(data).hexdigest(), "tags": tags})
            if tags:
                dest = outroot / relative
                dest.parent.mkdir(parents=True, exist_ok=True)
                dest.write_bytes(data)
                lines = []
                for n, line in enumerate(text.splitlines(), 1):
                    lower_line = line.casefold()
                    line_tags = [tag for tag in tags if any(s in lower_line for s in targets[tag])]
                    if line_tags:
                        lines.append({"line": n, "tags": line_tags, "text": line[:1500]})
                matches.append({"path": relative, "tags": tags, "lines": lines})
    manifest = {
        "repository": args.repository, "commit": args.commit,
        "archive_url": archive_url, "archive_size": archive_path.stat().st_size,
        "archive_sha256": digest, "text_file_count": len(records),
        "files": records, "skipped": skipped,
    }
    (base / (args.name + "-text-manifest.json")).write_text(json.dumps(manifest, indent=2))
    (base / (args.name + "-text-matches.json")).write_text(json.dumps(matches, indent=2, ensure_ascii=False))
    print(json.dumps({"text_files": len(records), "matched_files": len(matches), "skipped": len(skipped),
                     "by_target": {tag: sum(tag in m["tags"] for m in matches) for tag in targets},
                     "archive_sha256": digest, "seconds": time.monotonic() - start}, indent=2), flush=True)


if __name__ == "__main__":
    main()
