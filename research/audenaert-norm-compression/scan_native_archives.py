#!/usr/bin/env python3
"""Bounded, offline source-discovery scan; not a proof or exhaustive audit.

Usage: python3 scan_native_archives.py OUTPUT_DIR ARCHIVE.tar.gz [...]
Only UTF-8 bodies at most 20,000,000 bytes are searched. PDFs, other binary
bodies, embedded compressed files and larger entries are explicitly outside
this pass. The deliberately broad numeric patterns can have false positives.
"""
import json
import re
import sys
import tarfile
import unicodedata
from pathlib import Path

PATTERN = re.compile(r"audenaert|norm[\s-]{0,3}compression|0702186|414283", re.I)
LIMIT = 20_000_000


def scan(archive, out):
    hits, skipped = [], {"large": 0, "nul_prefix": 0, "not_utf8": 0}
    text_files = 0
    target = out / archive.stem
    target.mkdir(exist_ok=True)
    with tarfile.open(archive, "r:gz") as handle:
        for member in handle:
            if not member.isfile():
                continue
            if member.size > LIMIT:
                skipped["large"] += 1
                continue
            raw = handle.extractfile(member).read()
            if b"\0" in raw[:8192]:
                skipped["nul_prefix"] += 1
                continue
            try:
                body = raw.decode("utf-8")
            except UnicodeDecodeError:
                skipped["not_utf8"] += 1
                continue
            text_files += 1
            normalized = unicodedata.normalize("NFKC", body).casefold()
            matches = list(PATTERN.finditer(normalized))
            if not matches:
                continue
            hits.append({
                "path": member.name,
                "count": len(matches),
                "contexts": [normalized[max(0, m.start()-160):m.end()+220]
                             for m in matches[:12]],
            })
            (target / f"{len(hits)}.txt").write_bytes(raw)
    (out / f"{archive.stem}-hits.json").write_text(
        json.dumps(hits, ensure_ascii=False, indent=2))
    return {"archive": str(archive), "text_files": text_files,
            "hits": len(hits), "skipped": skipped}


def main():
    if len(sys.argv) < 3:
        raise SystemExit(__doc__)
    out = Path(sys.argv[1])
    out.mkdir(parents=True, exist_ok=True)
    manifest = []
    for name in sys.argv[2:]:
        item = scan(Path(name), out)
        manifest.append(item)
        print(json.dumps(item), flush=True)
    (out / "manifest.json").write_text(json.dumps(manifest, indent=2))


if __name__ == "__main__":
    main()
