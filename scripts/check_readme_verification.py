"""Check the public README's emoji-only results table."""

from pathlib import Path
import re
import sys


HEADER = re.compile(r"\|\s*Problem\s*\|\s*Lean verification status\s*\|")
DIVIDER = re.compile(r"\|\s*:?-+:?\s*\|\s*:?-+:?\s*\|")
RESULT = re.compile(r"\|\s*\[(?:\\\||[^|])+\]\(results/[^/|\s]+/\)\s*\|\s*[✅🟢🟡⬜]\s*\|")


def main() -> int:
    readme = Path(__file__).resolve().parents[1] / "README.md"
    _, heading, section = readme.read_text(encoding="utf-8").partition("\n## Results\n")
    table = section.lstrip("\n").split("\n\n", 1)[0].splitlines()
    if (
        not heading
        or len(table) < 3
        or not HEADER.fullmatch(table[0].strip())
        or not DIVIDER.fullmatch(table[1].strip())
    ):
        print("README.md needs a nonempty Problem | Lean verification status table under ## Results.", file=sys.stderr)
        return 1

    invalid_rows = [row for row in table[2:] if not RESULT.fullmatch(row.strip())]
    if invalid_rows:
        print("Each README.md result needs a result link and exactly one of ✅ 🟢 🟡 ⬜.", file=sys.stderr)
        for row in invalid_rows:
            print(row, file=sys.stderr)
        return 1

    print(f"Checked {len(table) - 2} README verification emojis.")
    return 0


if __name__ == "__main__":
    sys.exit(main())

