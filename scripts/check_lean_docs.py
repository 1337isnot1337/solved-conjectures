#!/usr/bin/env python3
"""Check Markdown that GitHub can silently truncate or misrender."""

from pathlib import Path
import re
import subprocess
import sys
from urllib.parse import unquote, urlsplit

from markdown_it import MarkdownIt


ROOT = Path(__file__).resolve().parents[1]
MARKDOWN = MarkdownIt("commonmark").enable("table")
LEAN_DOC = re.compile(r"(?:lean|formalization)", re.IGNORECASE)
LEGACY_MATH = re.compile(r"(?<!\\)\\[\[(]|(?m:^\s*\$\$)")
INLINE_CODE = re.compile(r"(`+)(?!`).*?(?<!`)\1(?!`)", re.DOTALL)
RUN_IN_MATH_FENCE = re.compile(r"(?m)^\s*```[^`\r\n]+```math\s*$")
MAX_LEAN_REPORT_BYTES = 200 * 1024


def cell_count(line):
    # GFM splits even inside code spans and inline math. It preserves \|.
    return len(re.split(r"(?<!\\)\|", line.strip(" >\t").removeprefix("|").removesuffix("|")))


def check_document(root, path, source):
    lines = source.splitlines()
    lean_doc = path.parts[0] == "lean" or LEAN_DOC.search(path.stem)
    if lean_doc and len(source.encode("utf-8")) > MAX_LEAN_REPORT_BYTES:
        yield 1, "split this Lean report into linked pages so GitHub keeps its Preview"

    for token in MARKDOWN.parse(source):
        if token.type == "table_open":
            start, end = token.map
            columns = cell_count(lines[start + 1])
            for row in range(start + 2, end):
                actual = cell_count(lines[row])
                if actual != columns:
                    yield row + 1, f"table row has {actual} cells, expected {columns}; check literal pipes"

        if token.type == "fence":
            start, end = token.map
            info = token.info.strip().lower().split()
            if not info or info[0] not in {"lean", "lean4", "math"}:
                continue
            marker = re.escape(token.markup[0])
            if not re.fullmatch(marker + r"{" + str(len(token.markup)) + r",}", lines[end - 1].strip(" >\t")):
                yield start + 1, f"unclosed {info[0]} fence"
            if info[0] in {"lean", "lean4"}:
                previous = next((line.strip(" >\t") for line in reversed(lines[:start]) if line.strip(" >\t")), "")
                if previous != "**Lean excerpt**":
                    yield start + 1, "label Lean excerpts or put runnable code in a linked .lean file"

        if token.type != "inline":
            continue
        start = token.map[0] + 1
        if RUN_IN_MATH_FENCE.search(token.content):
            yield start, "put the math fence language and the closing fence on separate lines"
        if lean_doc and LEGACY_MATH.search(INLINE_CODE.sub("CODE", token.content)):
            yield start, "use fenced math for displays and dollar-backtick delimiters for inline formulas"
        for child in token.children or ():
            if child.type != "link_open":
                continue
            href = child.attrGet("href")
            url = urlsplit(href)
            target = unquote(url.path)
            if not url.netloc and not url.scheme and target.endswith(".lean"):
                if target.startswith("/") or not (root / path.parent / target).is_file():
                    yield start, f"broken relative Lean source link: {href}"


def main():
    tracked = subprocess.check_output(
        ["git", "ls-files", "-z", "--", "*.md", "*.markdown", "*.mdx"], cwd=ROOT
    ).decode("utf-8").split("\0")
    paths = [Path(name) for name in tracked if name]
    errors = [
        f"{path}:{line}: {message}"
        for path in paths
        for line, message in check_document(ROOT, path, (ROOT / path).read_text(encoding="utf-8"))
    ]
    if errors:
        print("\n".join(errors), file=sys.stderr)
        return 1
    print(f"Checked Markdown tables, Lean fences, and source links across {len(paths)} files.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
