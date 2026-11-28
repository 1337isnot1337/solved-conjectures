#!/usr/bin/env python3
"""Check Markdown that GitHub can silently truncate or misrender.

Every tracked Markdown file is checked, not only Lean reports. Run with --fix to
repair the mechanical cases in place before checking: legacy TeX delimiters,
dollar-sign math that GitHub runs through Markdown escaping, control characters
left where a string escape swallowed a TeX command, and the named operators,
less-than signs, tags and line-end row breaks that GitHub's math renderer rejects
or changes.
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
DOLLAR_DISPLAY = re.compile(r"\$\$")
RUN_IN_MATH_FENCE = re.compile(r"(?m)^\s*```[^`\r\n]+```math\s*$")
CONTROL = re.compile(r"[\x00-\x08\x0b\x0c\x0e-\x1f]")
# A Python or C string escape that swallowed a TeX command's backslash and first letter,
# as when "\frac" or "\alpha" is written without a raw string.
CONTROL_REPAIRS = {"\x07": "\\a", "\x08": "\\b", "\x0b": "\\v", "\x0c": "\\f"}
# Dollar-backtick math (groups 1-2), a code span (3), a legacy \( \) formula (4), or
# pandoc's single-dollar math (5): the opening $ precedes a non-space, the closing $
# follows one and precedes no digit, so "$5 and $10" is not math.
INLINE_FORMS = re.compile(
    r"\$(`+)(?!`)(.*?)(?<!`)\1(?!`)\$"
    r"|(`+)(?!`).*?(?<!`)\3(?!`)"
    r"|(?<!\\)\\\((.+?)(?<!\\)\\\)"
    r"|(?<![\\$])\$(?=[^\s$`])(.+?)(?<=[^\s\\$])\$(?![\d$])",
    re.DOTALL)
# A backslash before ASCII punctuation is a Markdown escape. Inside $...$ and $$...$$
# GitHub removes the backslash before its math renderer sees the formula, so \{ becomes {,
# \, becomes , and \\ becomes \.
MARKDOWN_ESCAPE = re.compile(r"\\[!-/:-@\[-`{-~]")
# \operatorname*{op} takes limits below in displays, as \mathop does; \operatorname{op} does not,
# which matters only for a subscripted operator in a display.
OPERATORNAME = re.compile(r"\\operatorname\*?\{([^{}]*)\}")
LESS_THAN_LETTER = re.compile(r"<(?=[A-Za-z])")
TAG_IN_ALIGNED = re.compile(r"\\begin\{aligned\}(?:(?!\\end\{aligned\}).)*?\\tag\b", re.DOTALL)
ALIGNED = re.compile(r"\\begin\{aligned\}(.*?)\\end\{aligned\}", re.DOTALL)
TAG = re.compile(r"\\tag\*?\{[^{}]*\}")
# GitHub renders a math-fence line ending in \\ as \\\ followed by the line break.
ROW_BREAK_AT_LINE_END = re.compile(r"(?m)\\\\[ \t]*$")
CONTAINER = re.compile(r"[ \t>]*")
FIX_HINT = "; python3 scripts/check_lean_docs.py --fix repairs this"
MATH_MESSAGE = "use fenced math for displays and dollar-backtick delimiters for inline formulas" + FIX_HINT
DOLLAR_MESSAGE = ("write this formula as $`...`$; inside $...$ GitHub drops the backslash of a "
                  "Markdown escape such as \\{ or \\,")
MAX_LEAN_REPORT_BYTES = 200 * 1024


def cell_count(line):
    # GFM splits even inside code spans and inline math. It preserves \|.
    return len(re.split(r"(?<!\\)\|", line.strip(" >\t").removeprefix("|").removesuffix("|")))


def source_lines(source):
    """Split lines the way markdown-it does, so token maps index the right line."""
    return re.split(r"\r\n?|\n", source)


def math_errors(tex, display):
    """Report the formulas that check_github_math.py finds GitHub rejecting or changing."""
    if "\\operatorname" in tex:
        fixable = "\\operatorname" not in OPERATORNAME.sub("", tex)
        yield ("write named operators as \\mathop{\\mathrm{...}}; GitHub rejects \\operatorname"
               + (FIX_HINT if fixable else ""))
    if TAG_IN_ALIGNED.search(tex):
        yield ("place \\tag outside the aligned environment; GitHub rejects it inside"
               + (FIX_HINT if len(TAG.findall(tex)) == 1 else ""))
    if display and LESS_THAN_LETTER.search(tex):
        yield "write \\lt before a letter in display math; GitHub reads <letter as an HTML tag" + FIX_HINT
    if display and ROW_BREAK_AT_LINE_END.search(tex):
        yield ("start each continued row with \\\\ instead of ending the line before it with \\\\; "
               "GitHub adds a backslash at the line break" + FIX_HINT)


def needs_backticks(formula):
    return bool(MARKDOWN_ESCAPE.search(formula)) or "\\operatorname" in formula


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
        forms = list(INLINE_FORMS.finditer(token.content))
        prose = token.content
        for form in reversed(forms):
            if form.group(2) is not None or form.group(3) is not None:
                prose = prose[:form.start()] + "CODE" + prose[form.end():]
        if BACKSLASH_MATH.search(prose) or DOLLAR_DISPLAY.search(prose):
            yield start, MATH_MESSAGE
        for form in forms:
            if form.group(2) is not None:
                for message in math_errors(form.group(2), display=False):
                    yield start, message
            elif form.group(5) is not None and needs_backticks(form.group(5)):
                yield start, DOLLAR_MESSAGE + (FIX_HINT if "`" not in form.group(5) else "")
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


def move_row_breaks(rows):
    r"""Start each continued row with \\ instead of ending the line before it with \\."""
    rows = list(rows)
    for index, row in enumerate(rows):
        ending = "\r" if row.endswith("\r") else ""
        stripped = row.rstrip(" \t\r")
        count = len(stripped) - len(stripped.rstrip("\\"))
        if count < 2 or count % 2:
            continue
        rows[index] = stripped[:-count].rstrip(" \t") + ending
        if index + 1 < len(rows):
            following = rows[index + 1]
            prefix = CONTAINER.match(following).group()
            rows[index + 1] = prefix + "\\\\ " * (count // 2) + following[len(prefix):]
        # A row break just before the end of the display only adds an empty row, so it is dropped.
    return rows


def math_fences(source):
    return [token for token in MARKDOWN.parse(source)
            if token.type == "fence" and token.map and token.info.strip().lower().split()[:1] == ["math"]]


def display_block(lines, index, protected):
    r"""Return (first, last, replacement) for a \[ \] or line-start $$ $$ display at index."""
    line = lines[index]
    prefix = CONTAINER.match(line).group()
    bare = line[len(prefix):].rstrip(" \t\r")
    if bare == "\\[":
        closer = "\\]"
        first_rest = ""
    elif bare.startswith("$$"):
        closer = "$$"
        first_rest = bare[2:]
        if first_rest.endswith("$$") and "$$" not in first_rest[:-2] and first_rest[:-2].strip():
            return index, index, [prefix + "```math", prefix + first_rest[:-2].strip(), prefix + "```"]
        if "$$" in first_rest:
            return None
    else:
        return None
    body = [prefix + first_rest.strip()] if first_rest.strip() else []
    for end in range(index + 1, len(lines)):
        other = lines[end]
        if end in protected or not other.strip(" >\t\r") or not other.startswith(prefix):
            return None
        tail = other.rstrip(" \t\r")
        if closer == "\\]":
            if tail[len(prefix):].strip() == "\\]":
                return index, end, [prefix + "```math", *body, other.replace("\\]", "```", 1)]
            if "\\]" in other:
                return None
        else:
            if tail.endswith("$$"):
                head = tail[:-2]
                if "$$" in head:
                    return None
                last = [head.rstrip()] if head.strip(" >\t") else []
                return index, end, [prefix + "```math", *body, *last, prefix + "```"]
            if "$$" in other:
                return None
        body.append(other)
    return None


def fence_displays(source):
    r"""Turn standalone \[ \] displays and line-start $$ $$ displays into math fences.

    A conversion is kept only if markdown-it then reads it as exactly that math fence, so
    a display whose fence would escape its list item or blockquote is left for the check.
    """
    lines = source.split("\n")
    protected = set()
    for token in MARKDOWN.parse(source):
        if token.type in {"fence", "code_block", "html_block"} and token.map:
            protected.update(range(*token.map))
    blocks, index = [], 0
    while index < len(lines):
        found = None if index in protected else display_block(lines, index, protected)
        if found:
            blocks.append(found)
            index = found[1] + 1
        else:
            index += 1
    for _ in range(3):
        if not blocks:
            break
        result, spans, previous = [], [], 0
        for first, last, replacement in blocks:
            result += lines[previous:first]
            spans.append((len(result), len(result) + len(replacement)))
            result += replacement
            previous = last + 1
        result += lines[previous:]
        fences = {tuple(token.map) for token in math_fences("\n".join(result))}
        kept = [block for block, span in zip(blocks, spans) if span in fences]
        if len(kept) == len(blocks):
            return "\n".join(result)
        blocks = kept
    return "\n".join(lines)


def repair_inline(match):
    backticks, math, code, legacy, dollar = match.group(1, 2, 3, 4, 5)
    text = match.group(0)
    if math is not None:
        return "$" + backticks + repair_math(math, display=False) + backticks + "$"
    if code is not None:
        return text
    if dollar is not None and not needs_backticks(dollar):
        return text
    body = legacy if legacy is not None else dollar
    if "`" in body or not body.strip():
        return text
    return "$`" + repair_math(body.strip(), display=False) + "`$"


def repair_document(source):
    r"""Rewrite what can be repaired mechanically and leave the rest for the check.

    Control characters that replaced a TeX command's backslash and first letter are
    restored. Inline \(x\) becomes $`x`$, and so does a single-dollar formula containing
    a Markdown escape or a named operator. A display whose \[ and \] stand alone on
    lines, and a $$ display starting a line, become math fences, including displays
    that Markdown splits at a line starting with >, + or =. Inside math,
    \operatorname{op} becomes \mathop{\mathrm{op}}. In displays a < before a letter
    becomes \lt, a display's only \tag moves from inside an aligned block to just after
    it, and a row break ending a line moves to the start of the next.
    Code spans, code blocks and HTML blocks are otherwise left untouched.
    """
    for char, escape in CONTROL_REPAIRS.items():
        source = source.replace(char, escape)
    if not any(marker in source for marker in ("\\(", "\\[", "$", "\\operatorname", "math")):
        return source

    if "\\[" in source or "$$" in source:
        source = fence_displays(source)

    # Inline formulas, including named operators inside existing dollar-backtick math.
    lines = source.split("\n")
    for token in MARKDOWN.parse(source):
        if token.type != "inline" or not token.map:
            continue
        start, end = token.map
        lines[start:end] = INLINE_FORMS.sub(repair_inline, "\n".join(lines[start:end])).split("\n")
    source = "\n".join(lines)

    # Display formulas in math fences, last first so earlier line numbers stay valid.
    lines = source.split("\n")
    for token in reversed(math_fences(source)):
        start, end = token.map
        closed = end - 1 > start and lines[end - 1].strip(" >\t\r").startswith(token.markup)
        last = end - 1 if closed else end
        body = lines[start + 1:last]
        repaired = move_row_breaks(repair_math("\n".join(body), display=True).split("\n"))
        if repaired != body:
            lines[start + 1:last] = repaired
    return "\n".join(lines)


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--fix", action="store_true",
                        help="repair legacy delimiters, dollar-sign math, damaged TeX escapes and "
                             "GitHub-rejected math in place, then check")
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
