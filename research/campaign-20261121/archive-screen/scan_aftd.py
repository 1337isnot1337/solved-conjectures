#!/usr/bin/env python3
"""Search the pinned public AFTD knowledgebase and news, without running Lean."""
import gzip
import hashlib
import json
import pathlib
import urllib.request

ROOT = pathlib.Path(__file__).resolve().parent
COMMIT = 'a92dfddb67e6569f576a813bc2079f5233540ac9'
BASE = f'https://raw.githubusercontent.com/rainwangphy/aftd-platform/{COMMIT}/'
TARGETS = json.loads((ROOT / 'targets.json').read_text())


def download(remote, local):
    p = ROOT / local
    if not p.exists():
        with urllib.request.urlopen(BASE + remote, timeout=45) as r, p.open('wb') as f:
            while block := r.read(1024 * 1024):
                f.write(block)
    return p.read_bytes()


raw = download('web/data/kb.json.gz', 'aftd-kb.json.gz')
kb = json.loads(gzip.decompress(raw))
news_raw = download('web/news.json', 'aftd-news.json')
news = json.loads(news_raw)
matches = []
for section in ['declarations', 'open', 'literature']:
    for record in kb[section]:
        s = json.dumps(record, ensure_ascii=False).casefold()
        tags = [tag for tag, needles in TARGETS.items() if any(n.casefold() in s for n in needles)]
        if tags:
            matches.append({'section': section, 'tags': tags, 'record': record})
for record in news['entries']:
    s = json.dumps(record, ensure_ascii=False).casefold()
    tags = [tag for tag, needles in TARGETS.items() if any(n.casefold() in s for n in needles)]
    if tags:
        matches.append({'section': 'news', 'tags': tags, 'record': record})
summary = {
    'repository': 'rainwangphy/aftd-platform', 'commit': COMMIT,
    'knowledgebase_url': BASE + 'web/data/kb.json.gz',
    'knowledgebase_bytes': len(raw), 'knowledgebase_sha256': hashlib.sha256(raw).hexdigest(),
    'news_url': BASE + 'web/news.json', 'news_sha256': hashlib.sha256(news_raw).hexdigest(),
    'generated': kb['generated'],
    'section_counts': {section: len(kb[section]) for section in ['declarations', 'open', 'literature']},
    'news_entries': len(news['entries']), 'raw_substring_matches': len(matches),
}
(ROOT / 'aftd-summary.json').write_text(json.dumps(summary, indent=2))
(ROOT / 'aftd-all-matches.json').write_text(json.dumps(matches, ensure_ascii=False, indent=2))
print(json.dumps(summary, indent=2))
