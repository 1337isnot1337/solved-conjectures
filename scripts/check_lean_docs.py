#!/usr/bin/env python3
"""Check Markdown that GitHub can silently truncate or misrender.

Every tracked Markdown file is checked, not only Lean reports. Run with --fix to
repair the mechanical cases in place before checking: legacy TeX delimiters,
control characters left where a string escape swallowed a TeX command, and the
named operators and less-than signs that GitHub's math renderer rejects.
"""

from pathlib import Path
import argparse
import re
import subprocess
import sys
from urllib.parse import unquote, urlsplit

from markdown_it import MarkdownIt


ROOT = Path(__file__).resolve().parents[1]
MARKDOWN = MarkdownIt("commonmark").enable("table")
LEAN_DOC = re.compile(r"(?:lean|formalization)", re.IGNORECASE)
BACKSLASH_MATH = re.compile(r"(?<!\\)\\[][()]")
DOLLAR_DISPLAY = re.compile(r"(?m)^\s*\$\$")
INLINE_CODE = re.compile(r"(`+)(?!`).*?(?<!`)\1(?!`)", re.DOTALL)
RUN_IN_MATH_FENCE = re.compile(r"(?m)^\s*```[^`\r\n]+```math\s*$")
CONTROL = re.compile(r"[\x00-\x08\x0b\x0c\x0e-\x1f]")
# A Python or C string escape that swallowed a TeX command's backslash and first letter,
# as when "\frac" or "\alpha" is written without a raw string.
CONTROL_REPAIRS = {"\x07": "\\a", "\x08": "\\b", "\x0b": "\\v", "\x0c": "\\f"}
# An inline code span, possibly dollar-backtick math, or a legacy \( \) formula.
CODE_OR_INLINE_MATH = re.compile(
    r"(`+)(?!`).*?(?<!`)\1(?!`)|(?<!\\)\\\((.+?)(?<!\\)\\\)", re.DOTALL)
DOLLAR_BACKTICK_MATH = re.compile(r"\$`(.+?)`\$", re.DOTALL)
# \operatorname*{op} takes limits below in displays, as \mathop does; \operatorname{op} does not,
# which matters only for a subscripted operator in a display.
OPERATORNAME = re.compile(r"\\operatorname\*?\{([^{}]*)\}")
LESS_THAN_LETTER = re.compile(r"<(?=[A-Za-z])")
TAG_IN_ALIGNED = re.compile(r"\\begin\{aligned\}(?:(?!\\end\{aligned\}).)*?\\tag\b", re.DOTALL)
ALIGNED = re.compile(r"\\begin\{aligned\}(.*?)\\end\{aligned\}", re.DOTALL)
TAG = re.compile(r"\\tag\*?\{[^{}]*\}")
FIX_HINT = "; python3 scripts/check_lean_docs.py --fix repairs this"
MATH_MESSAGE = "use fenced math for displays and dollar-backtick delimiters for inline formulas" + FIX_HINT
MAX_LEAN_REPORT_BYTES = 200 * 1024


def cell_count(line):
    # GFM splits even inside code spans and inline math. It preserves \|.
    return len(re.split(r"(?<!\\)\|", line.strip(" >\t").removeprefix("|").removesuffix("|")))


def source_lines(source):
    """Split lines the way markdown-it does, so token maps index the right line."""
    return re.split(r"\r\n?|\n", source)


def math_errors(tex, display):
    """Report the formulas that check_github_math.py finds GitHub rejecting."""
    if "\\operatorname" in tex:
        fixable = "\\operatorname" not in OPERATORNAME.sub("", tex)
        yield ("write named operators as \\mathop{\\mathrm{...}}; GitHub rejects \\operatorname"
               + (FIX_HINT if fixable else ""))
    if TAG_IN_ALIGNED.search(tex):
        yield ("place \\tag outside the aligned environment; GitHub rejects it inside"
               + (FIX_HINT if len(TAG.findall(tex)) == 1 else ""))
    if display and LESS_THAN_LETTER.search(tex):
        yield "write \\lt before a letter in display math; GitHub reads <letter as an HTML tag" + FIX_HINT


def check_document(root, path, source):
    for number, line in enumerate(source.split("\n"), 1):
        if CONTROL.search(line):
            yield number, "unexpected control character in Markdown; check for a damaged TeX command" + FIX_HINT
    lines = source_lines(source)
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
            else:
                for message in math_errors(token.content, display=True):
                    yield start + 1, message

        if token.type != "inline":
            continue
        start = token.map[0] + 1
        if RUN_IN_MATH_FENCE.search(token.content):
            yield start, "put the math fence language and the closing fence on separate lines"
        prose = INLINE_CODE.sub("CODE", token.content)
        if BACKSLASH_MATH.search(prose) or (lean_doc and DOLLAR_DISPLAY.search(prose)):
            yield start, MATH_MESSAGE
        for formula in DOLLAR_BACKTICK_MATH.finditer(token.content):
            for message in math_errors(formula.group(1), display=False):
                yield start, message
        for child in token.children or ():
            if child.type != "link_open":
                continue
            href = child.attrGet("href")
            url = urlsplit(href)
            target = unquote(url.path)
            if not url.netloc and not url.scheme and target.endswith(".lean"):
                if target.startswith("/") or not (root / path.parent / target).is_file():
                    yield start, f"broken relative Lean source link: {href}"


def move_tag_out_of_aligned(match):
    inner = match.group(1)
    tag = TAG.search(inner)
    if not tag:
        return match.group(0)
    inner = inner[:tag.start()].rstrip(" \t") + inner[tag.end():]
    return "\\begin{aligned}" + inner + "\\end{aligned} " + tag.group(0)


def repair_math(tex, display):
    tex = OPERATORNAME.sub(r"\\mathop{\\mathrm{\1}}", tex)
    if not display:
        return tex
    if len(TAG.findall(tex)) == 1:
        # A display may carry one tag; GitHub accepts it after the aligned block, not inside.
        tex = ALIGNED.sub(move_tag_out_of_aligned, tex)
    return LESS_THAN_LETTER.sub(r"\\lt ", tex)


def math_fences(source):
    return [token for token in MARKDOWN.parse(source)
            if token.type == "fence" and token.map and token.info.strip().lower().split()[:1] == ["math"]]


def repair_document(source):
    r"""Rewrite what can be repaired mechanically and leave the rest for the check.

    Control characters that replaced a TeX command's backslash and first letter are
    restored. Inline \(x\) becomes $`x`$. A display whose \[ and \] stand alone on
    lines, with no blank line between, becomes a math fence, including displays that
    Markdown splits at a line starting with >, + or =. Inside math, \operatorname{op}
    becomes \mathop{\mathrm{op}}. In displays a < before a letter becomes \lt, and a
    display's only \tag moves from inside an aligned block to just after it.
    Code spans, code blocks and HTML blocks are otherwise left untouched.
    """
    for char, escape in CONTROL_REPAIRS.items():
        source = source.replace(char, escape)
    if not re.search(r"\\[(\[]|\\operatorname|math", source):
        return source

    # Standalone display delimiters outside code and HTML blocks.
    lines = source.split("\n")
    protected = set()
    for token in MARKDOWN.parse(source):
        if token.type in {"fence", "code_block", "html_block"} and token.map:
            protected.update(range(*token.map))
    converted, opened = [], None
    for index, line in enumerate(lines):
        bare = line.strip(" >\t\r")
        if index in protected or not bare:
            opened = None
        elif bare == "\\[":
            opened = index
        elif bare == "\\]" and opened is not None:
            prefix = re.match(r"[ \t>]*", lines[opened]).group()
            if all(other.startswith(prefix) for other in lines[opened + 1:index + 1]):
                converted.append((opened, index, lines[opened], lines[index]))
                lines[opened] = lines[opened].replace("\\[", "```math", 1)
                lines[index] = lines[index].replace("\\]", "```", 1)
            opened = None
    if converted:
        # Keep a conversion only if Markdown now reads it as exactly that math fence.
        fences = {tuple(token.map) for token in math_fences("\n".join(lines))}
        for opened, closed, first, last in converted:
            if (opened, closed + 1) not in fences:
                lines[opened], lines[closed] = first, last
    source = "\n".join(lines)

    # Inline formulas, and named operators inside existing dollar-backtick math.
    lines = source.split("\n")

    def inline(match):
        text, body = match.group(0), match.group(2)
        if body is None:
            string, begin, end = match.string, match.start(), match.end()
            if match.group(1) == "`" and string[begin - 1:begin] == "$" and string[end:end + 1] == "$":
                return "`" + repair_math(text[1:-1], display=False) + "`"
            return text
        if "`" in body or not body.strip():
            return text
        return "$`" + repair_math(body.strip(), display=False) + "`$"

    for token in MARKDOWN.parse(source):
        if token.type != "inline" or not token.map:
            continue
        start, end = token.map
        lines[start:end] = CODE_OR_INLINE_MATH.sub(inline, "\n".join(lines[start:end])).split("\n")
    source = "\n".join(lines)

    # Display formulas in math fences, last first so earlier line numbers stay valid.
    lines = source.split("\n")
    for token in reversed(math_fences(source)):
        start, end = token.map
        closed = end - 1 > start and lines[end - 1].strip(" >\t\r").startswith(token.markup)
        last = end - 1 if closed else end
        body = "\n".join(lines[start + 1:last])
        repaired = repair_math(body, display=True)
        if repaired != body:
            lines[start + 1:last] = repaired.split("\n")
    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--fix", action="store_true",
                        help="repair legacy delimiters, damaged TeX escapes and GitHub-rejected "
                             "math in place, then check")
    arguments = parser.parse_args()
    tracked = subprocess.check_output(
        ["git", "ls-files", "-z", "--", "*.md", "*.markdown", "*.mdx"], cwd=ROOT
    ).decode("utf-8").split("\0")
    paths = [Path(name) for name in tracked if name]
    if arguments.fix:
        rewritten = []
        for path in paths:
            source = (ROOT / path).read_text(encoding="utf-8")
            fixed = repair_document(source)
            if fixed != source:
                (ROOT / path).write_text(fixed, encoding="utf-8")
                rewritten.append(path)
        print(f"Repaired {len(rewritten)} files.")
        for path in rewritten:
            print(f"  {path}")
    errors = [
        f"{path}:{line}: {message}"
        for path in paths
        for line, message in check_document(ROOT, path, (ROOT / path).read_text(encoding="utf-8"))
    ]
    if errors:
        print("\n".join(errors), file=sys.stderr)
        return 1
    print(f"Checked GitHub math delimiters, Markdown tables, Lean fences, and source links across {len(paths)} files.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
