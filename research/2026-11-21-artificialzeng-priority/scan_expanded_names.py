#!/usr/bin/env python3
"""A second, author-name-only pass over manuscript-like UTF-8 members.

This supplements the source IDs and phrases in targets.json. It never executes
archive code. Numeric certificate formats are outside this particular pass.
"""
from pathlib import Path, PurePosixPath
import json
import re
import tarfile

BASE = Path(__file__).resolve().parent
NAMES = re.compile(r"(?i)(?<!\w)(?:khare|sahi|lyon|beurling|seiringer|sabag|kostina|hassibi)(?!\w)|chenig")


def main():
    found, searched = [], 0
    with tarfile.open(BASE / "artificialzeng.tar.gz", "r:gz") as archive:
        for member in archive:
            if not member.isfile():
                continue
            path = str(PurePosixPath(*PurePosixPath(member.name).parts[1:]))
            if not (Path(path).suffix in (".md", ".tex", ".bib", ".html", ".txt")
                    or Path(path).name in ("claim.json", "source.json", "package.json")):
                continue
            try:
                text = archive.extractfile(member).read().decode("utf8")
            except UnicodeDecodeError:
                continue
            searched += 1
            matches = sorted({m.group(0) for m in NAMES.finditer(text)})
            if matches:
                found.append({"path": path, "matches": matches})
    report = {"searched_files": searched, "matches": found,
              "pattern": NAMES.pattern}
    (BASE / "expanded-name-matches.json").write_text(json.dumps(report, indent=2))
    print(json.dumps(report, indent=2))


if __name__ == "__main__":
    main()
