#!/usr/bin/env python3
"""Search PDF text and compressed text in a pinned public archive.

This program only reads and converts source material. It never executes files
from the archive. Bounds and failed conversions are reported explicitly.
"""
import base64
import gzip
import hashlib
import io
import json
import pathlib
import re
import subprocess
import sys
import tarfile
import tempfile
import zipfile

ROOT = pathlib.Path(__file__).resolve().parent
NAME = sys.argv[1]
SPLITS_ONLY = '--splits-only' in sys.argv[2:]
PATTERNS = json.loads((ROOT / 'targets.json').read_text())
MANIFEST = json.loads((ROOT / f'{NAME}-text-manifest.json').read_text())
SKIPPED = {x['path'] for x in MANIFEST['skipped'] if x['reason'] == 'not_utf8'}
SUFFIX = 'split-supplement' if SPLITS_ONLY else 'supplement'
OUT = ROOT / f'{NAME}-{SUFFIX}-matches'
OUT.mkdir(exist_ok=True)
MAX_ENTRY = 256 * 1024 * 1024
MAX_DEPTH = 8
records, matches, limitations = [], [], []
cache = {}


def inspect_text(path, content, kind, sha):
    fold = content.casefold()
    tags = [tag for tag, needles in PATTERNS.items()
            if any(s.casefold() in (path.casefold() + '\n' + fold) for s in needles)]
    records.append({'path': path, 'kind': kind, 'sha256': sha,
                    'characters': len(content), 'tags': tags})
    if not tags:
        return
    lines = []
    for no, line in enumerate(content.splitlines(), 1):
        hit = [tag for tag in tags if any(s.casefold() in line.casefold()
                                       for s in PATTERNS[tag])]
        if hit:
            lines.append({'line': no, 'tags': hit, 'text': line[:1500]})
    saved = hashlib.sha256(path.encode()).hexdigest() + '.txt'
    (OUT / saved).write_text(content)
    matches.append({'path': path, 'tags': tags, 'saved': saved, 'lines': lines})


def visit(path, data, depth=0):
    sha = hashlib.sha256(data).hexdigest()
    if depth > MAX_DEPTH or len(data) > MAX_ENTRY:
        limitations.append({'path': path, 'reason': 'size_or_depth_limit',
                            'size': len(data), 'depth': depth})
        return
    if data.startswith(b'%PDF'):
        if sha in cache:
            text = cache[sha]
        else:
            with tempfile.TemporaryDirectory() as d:
                pdf = pathlib.Path(d) / 'source.pdf'
                pdf.write_bytes(data)
                r = subprocess.run(['pdftotext', '-layout', str(pdf), '-'],
                                   capture_output=True, timeout=60)
                if r.returncode:
                    limitations.append({'path': path, 'reason': 'pdftotext_failed',
                                        'detail': r.stderr.decode(errors='replace')[:1000]})
                    return
                text = r.stdout.decode('utf-8')
                cache[sha] = text
        if not text.strip():
            limitations.append({'path': path, 'reason': 'empty_pdf_text'})
        inspect_text(path, text, 'pdf', sha)
        return
    if data.startswith(b'PK\x03\x04'):
        try:
            with zipfile.ZipFile(io.BytesIO(data)) as z:
                for e in z.infolist():
                    if e.is_dir():
                        continue
                    if e.file_size > MAX_ENTRY:
                        limitations.append({'path': path + '!' + e.filename,
                                            'reason': 'entry_size_limit', 'size': e.file_size})
                        continue
                    visit(path + '!' + e.filename, z.read(e), depth + 1)
        except Exception as e:
            limitations.append({'path': path, 'reason': 'zip_failure', 'detail': str(e)})
        return
    if data.startswith(b'\x1f\x8b'):
        try:
            with gzip.GzipFile(fileobj=io.BytesIO(data)) as f:
                unpacked = f.read(MAX_ENTRY + 1)
            if len(unpacked) > MAX_ENTRY:
                limitations.append({'path': path, 'reason': 'gzip_expansion_limit'})
                return
            visit(path + '!gzip', unpacked, depth + 1)
        except Exception as e:
            limitations.append({'path': path, 'reason': 'gzip_failure', 'detail': str(e)})
        return
    if len(data) > 262 and data[257:262] == b'ustar':
        try:
            with tarfile.open(fileobj=io.BytesIO(data), mode='r:') as t:
                for e in t:
                    if not e.isfile():
                        continue
                    if e.size > MAX_ENTRY:
                        limitations.append({'path': path + '!' + e.name,
                                            'reason': 'entry_size_limit', 'size': e.size})
                        continue
                    visit(path + '!' + e.name, t.extractfile(e).read(), depth + 1)
        except Exception as e:
            limitations.append({'path': path, 'reason': 'tar_failure', 'detail': str(e)})
        return
    try:
        content = data.decode('utf-8')
    except UnicodeDecodeError:
        limitations.append({'path': path, 'reason': 'nontext_unconverted', 'size': len(data)})
        return
    inspect_text(path, content, 'embedded_text', sha)


groups = {}
with tarfile.open(ROOT / f'{NAME}.tar.gz', 'r:gz') as t:
    for e in t:
        if not e.isfile():
            continue
        short = e.name.split('/', 1)[1] if '/' in e.name else e.name
        if SPLITS_ONLY:
            match = (re.match(r'^(.*\.gz)(\.b64)?\.part(\d+)$', short)
                     or re.match(r'^(.*\.tar\.gz)()\.parts/part-(\d+)$', short))
            if match:
                key = (match.group(1), bool(match.group(2)))
                groups.setdefault(key, []).append((int(match.group(3)), t.extractfile(e).read()))
        elif short in SKIPPED:
            visit(short, t.extractfile(e).read())

if SPLITS_ONLY:
    for (path, is_base64), parts in groups.items():
        parts.sort()
        indices = [i for i, _ in parts]
        if indices != list(range(indices[0], indices[-1] + 1)):
            limitations.append({'path': path, 'reason': 'missing_split_part', 'indices': indices})
            continue
        data = b''.join(d for _, d in parts)
        if is_base64:
            try:
                data = base64.b64decode(b''.join(data.split()), validate=True)
            except Exception as e:
                limitations.append({'path': path, 'reason': 'base64_failure', 'detail': str(e)})
                continue
        visit(path + '!joined', data)

(ROOT / f'{NAME}-{SUFFIX}-manifest.json').write_text(json.dumps({
    'base_archive_sha256': MANIFEST['archive_sha256'],
    'records': records, 'limitations': limitations,
    'max_entry_bytes': MAX_ENTRY, 'max_depth': MAX_DEPTH,
}, indent=2))
(ROOT / f'{NAME}-{SUFFIX}-matches.json').write_text(json.dumps(matches, indent=2))
print(json.dumps({'name': NAME, 'records': len(records), 'matches': len(matches),
                  'limitations': len(limitations),
                  'pdfs': sum(x['kind'] == 'pdf' for x in records)}, indent=2))
