#!/usr/bin/env python3
"""Find native UTF-8 matches added by Unicode NFKC normalization.

This is a discovery audit, not proof of mathematical novelty. It reads the
complete archives without running content or extracting links. Existing
casefold matches are excluded from the residual report, not from the scan.
"""
import argparse
import hashlib
import json
from pathlib import Path, PurePosixPath
import tarfile
import time
import unicodedata


def normalized(text):
    return unicodedata.normalize("NFKC", text).casefold()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("names", nargs="+")
    args = parser.parse_args()
    base = Path(__file__).resolve().parent
    targets = json.loads((base / "targets.json").read_text())
    targets = {k: [normalized(x) for x in v] for k, v in targets.items()}
    for name in args.names:
        start = time.monotonic()
        old = json.loads((base / f"{name}-text-manifest.json").read_text())
        prior = {r["path"]: set(r["tags"]) for r in old["files"]}
        records = []
        scanned = 0
        out = base / f"{name}-normalized-residual"
        with tarfile.open(base / f"{name}.tar.gz", "r:gz") as archive:
            for member in archive:
                if not member.isfile():
                    continue
                parts = PurePosixPath(member.name).parts[1:]
                if not parts or ".." in parts:
                    raise ValueError(member.name)
                path = str(PurePosixPath(*parts))
                data = archive.extractfile(member).read()
                try:
                    text = data.decode("utf-8")
                except UnicodeDecodeError:
                    continue
                scanned += 1
                body = normalized(path + "\n" + text)
                tags = [k for k, needles in targets.items()
                        if k not in prior.get(path, set())
                        and any(x in body for x in needles)]
                if tags:
                    dest = out / path
                    dest.parent.mkdir(parents=True, exist_ok=True)
                    dest.write_bytes(data)
                    records.append({"path": path, "tags": tags,
                                    "sha256": hashlib.sha256(data).hexdigest()})
        if scanned != old["text_file_count"]:
            raise ValueError((name, scanned, old["text_file_count"]))
        report = {"archive_sha256": old["archive_sha256"],
                  "normalization": "Unicode NFKC then casefold",
                  "text_files_scanned": scanned, "new_matches": records,
                  "seconds": time.monotonic() - start}
        (base / f"{name}-normalized-residual.json").write_text(
            json.dumps(report, ensure_ascii=False, indent=2) + "\n")
        print(name, json.dumps({k: v for k, v in report.items()
                                if k != "new_matches"}),
              "new_matches", len(records), flush=True)


if __name__ == "__main__":
    main()
