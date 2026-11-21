#!/usr/bin/env python3
"""Read pinned public archives for SSC prior statements; never execute their code."""
from pathlib import Path, PurePosixPath
import json
import re
import tarfile
import unicodedata

HERE = Path(__file__).resolve().parent
BASE = HERE.parent.parent
PATTERN = (
    r"0903[.]3362|(?<!\d)(?:324585|356196)(?!\d)|"
    r"standard[\s_-]+simplex[\s_-]+(?:conjecture|partition)|"
    r"plurality[\s_-]+(?:is[\s_-]+)?stablest|hyperstabl|"
    r"gaussian[\s_-]+noise[\s_-]+stabil|isaksson"
)
RX = re.compile(PATTERN)
SOURCES = [
    ('trure', BASE / 'agent-analysis/retrospective-priority/trure.tar.gz',
     'the-omega-institute/trureturing', 'de22a48707da1c7a48d032909e821bd481947b45'),
    ('principia', BASE / 'agent-combinatorics/retrospective-priority/principia-main.tar.gz',
     'PrincipiaMathOrg/math-solutions', '47371706c400c79d06e3fb62190fcf6f7a725c85'),
    ('aim', BASE / 'root-additional-priority/aim.tar.gz',
     'MColbrook/AIM', 'b2ec0fac559f532fc0ed04fce81deea0ce07c68b'),
    ('mxym', BASE / 'agent-analysis/retrospective-priority/mxym.tar.gz',
     'mxym/math', '4a51ff772a566451627b9ff41f6248518561d9d4'),
    ('artificialzeng', BASE / 'agent-analysis/retrospective-priority/artificialzeng.tar.gz',
     'ArtificialZeng/AI-Has-Taste', '65eb1f5a92a3a8b80c9e92187825ac9231f86fb2'),
    ('openai', BASE / 'root-additional-priority/openai.tar.gz',
     'openai/math', '4eaee87548250b2682affda7d05d947c05554bae'),
]


def scan(name, archive_path, repository, commit):
    out = HERE / 'prior' / name
    out.mkdir(parents=True, exist_ok=True)
    matches, skipped = [], []
    count = 0
    with tarfile.open(archive_path, 'r|gz') as archive:
        for member in archive:
            if not member.isfile():
                if not member.isdir():
                    skipped.append({'path': member.name, 'reason': 'not_regular'})
                continue
            parts = PurePosixPath(member.name).parts[1:]
            if not parts or '..' in parts:
                raise ValueError(member.name)
            path = str(PurePosixPath(*parts))
            data = archive.extractfile(member).read()
            try:
                source = data.decode('utf-8')
            except UnicodeDecodeError:
                skipped.append({'path': path, 'reason': 'not_utf8', 'bytes': len(data)})
                continue
            count += 1
            normalized = unicodedata.normalize('NFKC', source).casefold()
            normpath = unicodedata.normalize('NFKC', path).casefold()
            found = list(RX.finditer(normalized))
            if not found and not RX.search(normpath):
                continue
            target = out / 'files' / path
            target.parent.mkdir(parents=True, exist_ok=True)
            target.write_bytes(data)
            contexts = [normalized[max(0, m.start()-150):m.end()+250]
                        for m in found[:20]]
            matches.append({'path': path, 'body_matches': len(found), 'contexts': contexts})
    result = {
        'repository': repository, 'commit': commit,
        'archive': str(archive_path.relative_to(BASE)),
        'native_utf8_files': count, 'pattern': PATTERN,
        'normalization': 'Unicode NFKC then casefold',
        'matches': matches, 'skipped': skipped,
        'scope': 'Native UTF-8 only; PDF and compressed-body supplements are separate.'
    }
    (out / 'matches.json').write_text(json.dumps(result, indent=2, ensure_ascii=False))
    print(json.dumps({'name': name, 'native_utf8_files': count,
                      'matching_files': len(matches), 'skipped': len(skipped)}), flush=True)


if __name__ == '__main__':
    for source in SOURCES:
        scan(*source)
