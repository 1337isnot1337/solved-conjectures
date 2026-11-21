#!/usr/bin/env python3
"""Compare broader literal source terms with the six-archive primary scan.

Read only native UTF-8 archive members. Never execute archived code. The
independent supplemental scanner handles PDF and embedded binary containers.
"""
import argparse
import hashlib
import json
from pathlib import Path, PurePosixPath
import re
import tarfile
import unicodedata

from scan_native_prior import SOURCES

HERE = Path(__file__).resolve().parent
TERMS = {
    "simplex": ["standard simplex", "standard-simplex", "gaussian simplex",
                "gaussian-simplex", "0903.3362"],
    "noise": ["noise stability", "noise-stability"],
    "plurality": ["plurality"],
    "first_moment": ["balanced first moment", "balanced first-moment",
                     "first moment stability", "first-moment stability",
                     "equal gaussian cells", "gaussian first moment"],
    "identifiers": ["1211.7138", "1901.03934", "2608.00333", "1805.10961"],
    "names": ["heilman", "isaksson"],
    "correlation_regime": ["small positive correlation", "small-positive-correlation",
                           "low positive correlation", "low-positive-correlation",
                           "small correlation", "small-correlation", "near independence"],
}
MAX_ENTRY = 256 * 1024 * 1024


def norm(text):
    return re.sub(r"\s+", " ", unicodedata.normalize("NFKC", text).casefold())


def scan(source):
    name, archive_path, repository, commit = source
    previous = json.loads((HERE / "low-correlation-prior" / name / "manifest.json").read_text())
    previous_paths = {m["path"] for m in previous["matches"] if m["kind"] == "native_utf8"}
    out = HERE / "low-correlation-native-residual" / name
    (out / "files").mkdir(parents=True, exist_ok=True)
    count, matched, residual, limits = 0, 0, [], []
    with tarfile.open(archive_path, "r|gz") as archive:
        for member in archive:
            if not member.isfile():
                continue
            path = str(PurePosixPath(*PurePosixPath(member.name).parts[1:]))
            if member.size > MAX_ENTRY:
                limits.append({"path": path, "reason": "entry_limit", "bytes": member.size})
                continue
            data = archive.extractfile(member).read()
            try:
                content = data.decode("utf-8")
            except UnicodeDecodeError:
                continue
            count += 1
            folded = norm(content)
            hits = {group: [term for term in terms if term in folded]
                    for group, terms in TERMS.items()}
            hits = {group: terms for group, terms in hits.items() if terms}
            if not hits:
                continue
            matched += 1
            if path in previous_paths:
                continue
            digest = hashlib.sha256(data).hexdigest()
            saved = hashlib.sha256(path.encode()).hexdigest() + ".txt"
            (out / "files" / saved).write_text(content)
            contexts = []
            for terms in hits.values():
                for term in terms:
                    at = folded.find(term)
                    contexts.append(folded[max(0, at-180):at+len(term)+350])
            residual.append({"path": path, "sha256": digest, "saved": saved,
                             "tags": hits, "contexts": contexts})
    result = {"repository": repository, "commit": commit,
              "normalization": "Unicode NFKC, casefold, collapsed whitespace",
              "terms": TERMS, "native_utf8": count, "matching_bodies": matched,
              "previously_matched_native_bodies": len(previous_paths),
              "residual_matches": residual, "limitations": limits,
              "scope": "Native UTF-8 only; non-UTF-8 bodies are covered separately."}
    (out / "manifest.json").write_text(json.dumps(result, ensure_ascii=False, indent=2)+"\n")
    print(json.dumps({"archive": name, "native_utf8": count, "matches": matched,
                      "additional_matches": len(residual), "limits": len(limits)}), flush=True)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("archives", nargs="*")
    args = parser.parse_args()
    for source in SOURCES:
        if not args.archives or source[0] in args.archives:
            scan(source)
