"""Search PDF text and gzip/legacy-text members in the pinned public archive.

No archive programs are executed. Binary numeric arrays and raster pictures
are not interpreted as mathematical manuscripts. The output distinguishes
successful conversions, undecodable streams, and conversion failures.
"""
from pathlib import Path, PurePosixPath
import gzip
import hashlib
import io
import json
import re
import subprocess
import tarfile
import tempfile
import time

BASE = Path(__file__).resolve().parent
OUT = BASE / 'supplement'
OUT.mkdir(exist_ok=True)
TARGETS = json.loads((BASE / 'targets.json').read_text())
TARGETS['chen-khare-sahi'] += ['khare', 'sahi']
TARGETS['lyon'] += ['lyon']
TARGETS['grochenig'] += ['beurling']
TARGETS['roos-seiringer'] += ['seiringer']
TARGETS['han-sabag-kostina-hassibi'] += ['sabag', 'kostina', 'hassibi']
PATTERNS = {
    key: re.compile('|'.join(r'(?<!\w)' + re.escape(s.casefold()) + r'(?!\w)'
                            for s in values))
    for key, values in TARGETS.items()
}


def inspect(text, path):
    low = text.casefold()
    found = {key: [m.start() for m in rx.finditer(low)]
             for key, rx in PATTERNS.items()}
    found = {key: hits for key, hits in found.items() if hits}
    if not found:
        return None
    contexts = {key: [text[max(0, i - 250):i + 500] for i in hits[:20]]
                for key, hits in found.items()}
    return {'path': path, 'counts': {key: len(v) for key, v in found.items()},
            'contexts': contexts}


def main():
    begin = time.monotonic()
    records, hits, failures = [], [], []
    with tarfile.open(BASE / 'artificialzeng.tar.gz', 'r:gz') as arc, tempfile.TemporaryDirectory() as tmp:
        for member in arc:
            if not member.isfile():
                continue
            path = str(PurePosixPath(*PurePosixPath(member.name).parts[1:]))
            suffix = Path(path).suffix.lower()
            if suffix not in ('.pdf', '.gz') and not path.endswith('/upstream/Description.txt'):
                continue
            raw = arc.extractfile(member).read()
            if suffix == '.pdf':
                work = Path(tmp) / 'source.pdf'
                work.write_bytes(raw)
                process = subprocess.run(['pdftotext', '-layout', str(work), '-'],
                                         capture_output=True, timeout=45)
                if process.returncode:
                    failures.append({'path': path, 'reason': 'pdf-conversion',
                                     'stderr': process.stderr.decode('utf8', 'replace')[:1000]})
                    continue
                text = process.stdout.decode('utf8')
                rec = {'path': path, 'kind': 'pdf-text', 'length': len(text), 'nonwhitespace_length': len(text.strip()),
                       'sha256': hashlib.sha256(process.stdout).hexdigest()}
                dest = OUT / (path + '.txt')
                dest.parent.mkdir(parents=True, exist_ok=True)
                dest.write_text(text)
                match = inspect(text, path)
                if match:
                    hits.append(match)
            elif suffix == '.gz':
                # These archive members are numerical/SAT/LP certificates, not
                # manuscripts. Inspect a bounded decompressed header and retain
                # the precise limit. No full numeric-body search is claimed.
                header_limit = 1024 * 1024
                try:
                    with gzip.GzipFile(fileobj=io.BytesIO(raw)) as stream:
                        header = stream.read(header_limit + 1)
                except (UnicodeDecodeError, OSError) as exc:
                    failures.append({'path': path, 'reason': 'gzip-decode', 'error': str(exc)})
                    continue
                complete = len(header) <= header_limit
                header = header[:header_limit]
                try:
                    text = header.decode('utf8')
                    encoding = 'utf8'
                    match = inspect(text, path)
                    if match:
                        hits.append(match)
                except UnicodeDecodeError:
                    text = None
                    encoding = 'binary'
                rec = {'path': path, 'kind': 'gzip-header',
                       'compressed_size': len(raw), 'inspected_bytes': len(header),
                       'complete': complete, 'encoding': encoding,
                       'header': text[:1200] if text is not None else header[:64].hex()}
            else:
                # The one plain-text decoding exception is inspected explicitly.
                try:
                    text = raw.decode('cp1252')
                except UnicodeDecodeError:
                    text = raw.decode('latin1')
                rec = {'path': path, 'kind': 'legacy-text', 'length': len(text)}
                dest = OUT / (path + '.txt')
                dest.parent.mkdir(parents=True, exist_ok=True)
                dest.write_text(text)
                match = inspect(text, path)
                if match:
                    hits.append(match)
            records.append(rec)
            if len(records) % 50 == 0:
                print('converted', len(records), 'seconds', round(time.monotonic() - begin, 2), flush=True)
    result = {'records': records, 'hits': hits, 'failures': failures,
              'seconds': time.monotonic() - begin}
    (OUT / 'report.json').write_text(json.dumps(result, indent=2, ensure_ascii=False))
    print(json.dumps({'records': len(records), 'hits': len(hits), 'failures': failures,
                      'seconds': result['seconds']}, ensure_ascii=False), flush=True)


if __name__ == '__main__':
    main()
