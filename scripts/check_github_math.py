#!/usr/bin/env python3
"""Compare each source equation with the TeX GitHub actually sends to its renderer."""

import argparse
from difflib import SequenceMatcher
import html
import json
import re
import subprocess
import sys
import time

from build_site import ROOT, nodes, read_markdown


RENDERER = re.compile(r'<math-renderer\b[^>]*\bjs-(inline|display)-math\b[^>]*>(.*?)</math-renderer>', re.S)
MATH_ERROR = re.compile(r'\\operatorname\b|\\begin\{aligned\}(?:(?!\\end\{aligned\}).)*?\\tag\b', re.S)


def rendered_formulas(markup):
    for mode, body in RENDERER.findall(markup):
        delimiter = '$$' if mode == 'display' else '$'
        tex = html.unescape(body).removeprefix(delimiter).removesuffix(delimiter)
        # GitHub also escapes HTML entities inside inline Markdown code spans.
        if mode == 'inline':
            tex = html.unescape(tex)
        yield mode, ' '.join(tex.split())


# GitHub's secondary limit allows 900 REST points a minute, and each POST costs 5, so
# at most 180 renders a minute. Stay below that, and wait out a limit if one is hit anyway.
MIN_INTERVAL = 0.4
RATE_LIMIT_WAITS = (60, 120, 180, 240, 300)
_last_request = [0.0]


def github_markdown(source):
    payload = json.dumps({'mode': 'gfm', 'text': source})
    for wait in (*RATE_LIMIT_WAITS, None):
        delay = _last_request[0] + MIN_INTERVAL - time.monotonic()
        if delay > 0:
            time.sleep(delay)
        _last_request[0] = time.monotonic()
        result = subprocess.run(['gh', 'api', 'markdown', '--input', '-'],
                                input=payload, text=True, capture_output=True)
        if result.returncode == 0:
            return result.stdout
        if wait is None or 'rate limit' not in result.stderr.lower():
            raise subprocess.CalledProcessError(result.returncode, result.args, result.stdout, result.stderr)
        print(f'GitHub rate limit; retrying in {wait} seconds.', file=sys.stderr, flush=True)
        time.sleep(wait)


def check_document(source):
    expected = []
    for node in nodes(read_markdown([], text=source)['blocks']):
        if node.get('t') != 'Math':
            continue
        kind, tex = node['c']
        if MATH_ERROR.search(tex):
            return f'GitHub rejects this formula. Use mathop with mathrm for named operators and place tags outside aligned: {tex}'
        if kind['t'] == 'DisplayMath' and re.search(r'<[A-Za-z]', tex):
            return rf'Use \lt before a letter in display math. GitHub reads it as an HTML tag: {tex}'
        expected.append(('display' if kind['t'] == 'DisplayMath' else 'inline', ' '.join(tex.split())))
    if not expected:
        return None

    actual = list(rendered_formulas(github_markdown(source)))
    if actual != expected:
        for op, i, j, k, end in SequenceMatcher(None, expected, actual, autojunk=False).get_opcodes():
            if op != 'equal':
                return f'formula {i + 1}: expected {expected[i:j][:1]}, GitHub rendered {actual[k:end][:1]}'
    return None


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--changed-since', help='check Markdown changed between this commit and HEAD')
    args = parser.parse_args()
    if args.changed_since and args.changed_since.strip('0'):
        command = ['git', 'diff', '--name-only', '--diff-filter=ACMR', '-z', args.changed_since, 'HEAD']
    else:
        command = ['git', 'ls-files', '-z']
    tracked = subprocess.check_output([*command, '--', '*.md', '*.markdown', '*.mdx'], cwd=ROOT).decode()
    paths = tracked.split('\0')[:-1]
    failures = 0
    for name in paths:
        source = (ROOT / name).read_text(encoding='utf-8')
        if not any(marker in source for marker in ('$', 'math', r'\(', r'\[')):
            continue
        try:
            error = check_document(source)
        except subprocess.CalledProcessError as exc:
            sys.exit(f'{name}: {exc.stderr or exc}')
        if error:
            failures += 1
            print(f'{name}: {error}', file=sys.stderr)
    print(f'Checked GitHub math rendering for {len(paths)} Markdown files.')
    return bool(failures)


if __name__ == '__main__':
    sys.exit(main())
