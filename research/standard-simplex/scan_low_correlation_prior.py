#!/usr/bin/env python3
"""Read pinned public archives for SSC and low-correlation prior statements.

Archive files are never executed. Native UTF-8, PDF text and bounded embedded
compressed text are searched after Unicode NFKC and casefold. Every conversion
or size limitation is recorded. Source bodies remain in the scratch audit tree.
"""
import argparse
import base64
import gzip
import hashlib
import io
import json
from pathlib import Path
import re
import subprocess
import tarfile
import tempfile
import unicodedata
import zipfile

from scan_native_prior import SOURCES

HERE = Path(__file__).resolve().parent
PATTERN = (
    r"0903[.]3362|1211[.]7138|2608[.]00333|"
    r"standard[\s_-]+simplex|plurality[\s_-]+(?:is[\s_-]+)?stabl|"
    r"hyperstabl|isaksson|heilman|"
    r"gaussian[\s_-]+(?:balanced|centroid|first[\s_-]+moment)|"
    r"balanced[\s_-]+(?:gaussian|simplex)|"
    r"gaussian[\s_-]+noise[\s_-]+stabil"
)
CONTEXT_PATTERN = (
    r"(?:small|low)[\s_-]+(?:positive[\s_-]+)?correlations?|"
    r"near[\s_-]+independence|first[\s_-]+moment[\s_-]+stability"
)
RX = re.compile(PATTERN)
CX = re.compile(CONTEXT_PATTERN)
MAX_ENTRY = 256 * 1024 * 1024
MAX_GZIP = 16 * 1024 * 1024
MAX_DEPTH = 8


def norm(s):
    return unicodedata.normalize('NFKC', s).casefold()


def scan(source):
    name, archive_path, repository, commit = source
    out = HERE / 'low-correlation-prior' / name
    (out / 'files').mkdir(parents=True, exist_ok=True)
    counts, matches, limitations, pdfs = {}, [], [], []
    cache, groups = {}, {}

    def limit(path, reason, **kw):
        limitations.append(dict(path=path, reason=reason, **kw))

    def inspect(path, content, kind):
        counts[kind] = counts.get(kind, 0) + 1
        folded = norm(content)
        folded_path = norm(path)
        hits = list(RX.finditer(folded))
        contextual = list(CX.finditer(folded)) if ('gauss' in folded or 'simplex' in folded) else []
        if not hits and not contextual and not RX.search(folded_path):
            return
        selected = sorted(hits + contextual, key=lambda m: m.start())
        saved = hashlib.sha256(path.encode()).hexdigest() + '.txt'
        (out / 'files' / saved).write_text(content)
        matches.append({
            'path': path, 'kind': kind, 'saved': saved,
            'body_hits': len(selected),
            'contexts': [folded[max(0, m.start()-180):m.end()+350] for m in selected[:30]],
        })

    def visit(path, data, depth=0, native=False):
        if len(data) > MAX_ENTRY or depth > MAX_DEPTH:
            limit(path, 'entry_or_depth_limit', bytes=len(data), depth=depth)
            return
        if data.startswith(b'%PDF'):
            digest = hashlib.sha256(data).hexdigest()
            if digest not in cache:
                try:
                    with tempfile.TemporaryDirectory() as tmp:
                        p = Path(tmp) / 'source.pdf'
                        p.write_bytes(data)
                        result = subprocess.run(['pdftotext', '-layout', str(p), '-'],
                                                capture_output=True, timeout=60)
                    if result.returncode:
                        limit(path, 'pdf_conversion_failed', detail=result.stderr.decode(errors='replace')[:800])
                        return
                    cache[digest] = result.stdout.decode('utf-8')
                except Exception as error:
                    limit(path, 'pdf_conversion_exception', detail=str(error))
                    return
            content = cache[digest]
            pdfs.append({'path': path, 'sha256': digest, 'characters': len(content.strip())})
            if not content.strip():
                limit(path, 'empty_pdf_text')
            inspect(path, content, 'pdf')
            if len(pdfs) % 100 == 0:
                print(json.dumps({'archive': name, 'pdfs': len(pdfs), 'matches': len(matches)}), flush=True)
            return
        if data.startswith(b'PK\x03\x04'):
            try:
                with zipfile.ZipFile(io.BytesIO(data)) as z:
                    for entry in z.infolist():
                        if entry.is_dir():
                            continue
                        if entry.file_size > MAX_ENTRY:
                            limit(path+'!'+entry.filename, 'embedded_entry_limit', bytes=entry.file_size)
                            continue
                        visit(path+'!'+entry.filename, z.read(entry), depth+1)
            except Exception as error:
                limit(path, 'zip_exception', detail=str(error))
            return
        if data.startswith(b'\x1f\x8b'):
            try:
                with gzip.GzipFile(fileobj=io.BytesIO(data)) as g:
                    expanded = g.read(MAX_GZIP+1)
                if len(expanded) > MAX_GZIP:
                    limit(path, 'gzip_expansion_limit', limit_bytes=MAX_GZIP)
                else:
                    visit(path+'!gzip', expanded, depth+1)
            except Exception as error:
                limit(path, 'gzip_exception', detail=str(error))
            return
        if len(data) > 262 and data[257:262] == b'ustar':
            try:
                with tarfile.open(fileobj=io.BytesIO(data), mode='r:') as archive:
                    for entry in archive:
                        if not entry.isfile():
                            continue
                        if entry.size > MAX_ENTRY:
                            limit(path+'!'+entry.name, 'embedded_entry_limit', bytes=entry.size)
                            continue
                        visit(path+'!'+entry.name, archive.extractfile(entry).read(), depth+1)
            except Exception as error:
                limit(path, 'tar_exception', detail=str(error))
            return
        try:
            content = data.decode('utf-8')
        except UnicodeDecodeError:
            limit(path, 'binary_unconverted', bytes=len(data))
            return
        inspect(path, content, 'native_utf8' if native else 'embedded_utf8')

    with tarfile.open(archive_path, 'r|gz') as archive:
        for entry in archive:
            if not entry.isfile():
                if not entry.isdir():
                    limit(entry.name, 'nonregular_archive_member')
                continue
            path = entry.name.split('/', 1)[1] if '/' in entry.name else entry.name
            if entry.size > MAX_ENTRY:
                limit(path, 'native_entry_limit', bytes=entry.size)
                continue
            data = archive.extractfile(entry).read()
            split = (re.match(r'^(.*\.gz)(\.b64)?\.part(\d+)$', path)
                     or re.match(r'^(.*\.tar\.gz)()\.parts/part-(\d+)$', path))
            if split:
                key = (split.group(1), bool(split.group(2)))
                groups.setdefault(key, []).append((int(split.group(3)), data))
            visit(path, data, native=True)

    for (path, is_base64), parts in groups.items():
        parts.sort()
        indices = [i for i, _ in parts]
        if indices != list(range(indices[0], indices[-1]+1)):
            limit(path, 'missing_split_part', indices=indices)
            continue
        if sum(len(part) for _, part in parts) > MAX_ENTRY:
            limit(path, 'joined_entry_limit')
            continue
        data = b''.join(part for _, part in parts)
        if is_base64:
            try:
                data = base64.b64decode(b''.join(data.split()), validate=True)
            except Exception as error:
                limit(path, 'base64_exception', detail=str(error))
                continue
        visit(path+'!joined', data)

    result = {
        'repository': repository, 'commit': commit, 'counts': counts,
        'pattern': PATTERN, 'context_pattern': CONTEXT_PATTERN,
        'context_requirement': 'gauss or simplex occurs somewhere in the same body',
        'normalization': 'Unicode NFKC then casefold',
        'max_entry_bytes': MAX_ENTRY, 'max_gzip_expansion_bytes': MAX_GZIP,
        'max_depth': MAX_DEPTH, 'matches': matches, 'pdfs': pdfs,
        'limitations': limitations,
    }
    (out/'manifest.json').write_text(json.dumps(result, indent=2, ensure_ascii=False))
    print(json.dumps({'archive': name, 'counts': counts, 'matches': len(matches),
                      'limitations': len(limitations)}), flush=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('archives', nargs='*', choices=[s[0] for s in SOURCES])
    args = parser.parse_args()
    for source in SOURCES:
        if not args.archives or source[0] in args.archives:
            scan(source)
