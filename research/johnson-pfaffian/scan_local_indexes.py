#!/usr/bin/env python3
"""Read existing public archive texts without executing archived source files.

The --workspace argument identifies the archive-working-directory layout used
in PRIOR_SCAN.json. Large source downloads are intentionally not in the repo.
"""
from pathlib import Path
import argparse
import hashlib
import json
import re
import unicodedata
import zipfile

HERE = Path(__file__).resolve().parent
BASE = None
PATTERN = r'pfaff|2610\.24371|wlpjohnson|william\s+johnson|kalmanson|multiplicative[\s_-]+interval|circular[\s_-]+interval'
RX = re.compile(PATTERN, re.I)


def normalized(text):
    return unicodedata.normalize('NFKC', text).casefold()


def hits(text):
    return [{'line': n, 'text': line[:2000]} for n, line in enumerate(text.splitlines(), 1)
            if RX.search(normalized(line))]


def principia():
    base = BASE / 'agent-combinatorics/retrospective-priority'
    root = base / 'math-solutions-main'
    counts = {'native_text': 0, 'pdf_text': 0, 'zip_text': 0}
    matches, failed = [], []
    def inspect(path, text, kind):
        counts[kind] += 1
        if RX.search(normalized(text)) or RX.search(normalized(path)):
            matches.append({'path': path, 'kind': kind, 'hits': hits(text)})
    for p in root.rglob('*'):
        if not p.is_file() or p.suffix in ('.pdf', '.zip'):
            continue
        try:
            text = p.read_text()
        except UnicodeDecodeError:
            failed.append(str(p.relative_to(root)))
            continue
        inspect(str(p.relative_to(root)), text, 'native_text')
    for p in (base / 'pdf-text').glob('*.txt'):
        inspect('PDF/' + p.name, p.read_text(), 'pdf_text')
    for p in root.rglob('*.zip'):
        with zipfile.ZipFile(p) as z:
            for e in z.infolist():
                if e.is_dir():
                    continue
                try:
                    text = z.read(e).decode('utf-8')
                except UnicodeDecodeError:
                    failed.append('ZIP/' + str(p.relative_to(root)) + '/' + e.filename)
                    continue
                inspect('ZIP/' + str(p.relative_to(root)) + '/' + e.filename, text, 'zip_text')
    result = {'repository': 'PrincipiaMathOrg/math-solutions',
              'commit': '47371706c400c79d06e3fb62190fcf6f7a725c85',
              'pattern': PATTERN, 'normalization': 'Unicode NFKC then casefold',
              'counts': counts, 'nontext': failed, 'matches': matches}
    (HERE / 'principia-matches.json').write_text(json.dumps(result, indent=2))
    print('Principia', counts, 'matched units', len(matches), flush=True)


def aftd():
    base = BASE / 'agent-analysis/retrospective-priority'
    counts, matches = {}, []
    for filename in ['aftd-kb.json', 'aftd-news.json']:
        path = base / filename
        obj = json.loads(path.read_text())
        if isinstance(obj, dict):
            groups = obj.items()
        else:
            groups = [('root', obj)]
        for key, value in groups:
            records = value if isinstance(value, list) else [value]
            counts[filename + ':' + key] = len(records)
            for i, record in enumerate(records):
                text = json.dumps(record, ensure_ascii=False, indent=2)
                if RX.search(normalized(text)):
                    dest = HERE / ('aftd-' + filename + '-' + str(key) + '-' + str(i) + '.txt')
                    dest.write_text(text)
                    matches.append({'source': filename, 'group': key, 'index': i,
                                    'saved': dest.name, 'hits': hits(text)})
    result = {'repository': 'rainwangphy/aftd-platform',
              'commit': 'a92dfddb67e6569f576a813bc2079f5233540ac9',
              'pattern': PATTERN, 'normalization': 'Unicode NFKC then casefold',
              'counts': counts, 'matches': matches}
    (HERE / 'aftd-matches.json').write_text(json.dumps(result, indent=2))
    print('AFTD', counts, 'matched records', len(matches), flush=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--workspace', type=Path, required=True,
                        help='root containing the separately downloaded agent archive directories')
    parser.add_argument('--output', type=Path, default=HERE,
                        help='directory for generated local match records')
    args = parser.parse_args()
    BASE = args.workspace.resolve()
    required = [
        BASE / 'agent-combinatorics/retrospective-priority/math-solutions-main',
        BASE / 'agent-combinatorics/retrospective-priority/pdf-text',
        BASE / 'agent-analysis/retrospective-priority/aftd-kb.json',
        BASE / 'agent-analysis/retrospective-priority/aftd-news.json',
    ]
    for path in required:
        if not path.exists():
            parser.error(f'missing source archive input: {path}')
    HERE = args.output.resolve()
    HERE.mkdir(parents=True, exist_ok=True)
    principia()
    aftd()
