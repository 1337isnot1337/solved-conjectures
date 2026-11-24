"""Check the public README's ranked, emoji-only, four-column results table."""

from pathlib import Path
import re
import sys


HEADINGS = ["Problem", "Lean verification status"] * 2
DIVIDER = re.compile(r":?-+:?")
PROBLEM = re.compile(r"\*\*([1-9][0-9]*)\.\*\*\s+\[(?:\\\||[^|])+\]\(results/([^/|\s]+)/\)")
STATUS = {"✅", "🟢", "🟡", "⬜"}


def cells(line: str) -> list[str]:
    parts = re.split(r"(?<!\\)\|", line.strip())
    if len(parts) != 6 or parts[0] or parts[-1]:
        raise ValueError(f"Expected four cells: {line}")
    return [part.strip() for part in parts[1:-1]]


def parse_results(readme: str) -> list[tuple[int, str, str]]:
    """Return (competition rank, slug, emoji) in column-major order."""
    _, heading, section = readme.partition("\n## Results\n")
    table = section.lstrip("\n").split("\n\n", 1)[0].splitlines()
    if (
        not heading or len(table) < 3
        or cells(table[0]) != HEADINGS
        or not all(DIVIDER.fullmatch(cell) for cell in cells(table[1]))
    ):
        raise ValueError("README.md needs a nonempty ranked four-column Results table.")

    rows = [cells(row) for row in table[2:]]
    entries = []
    seen = set()
    for offset in (0, 2):
        for index, row in enumerate(rows):
            problem, status = row[offset:offset + 2]
            if not problem and not status and offset == 2 and index == len(rows) - 1:
                continue
            match = PROBLEM.fullmatch(problem)
            if not match or status not in STATUS:
                raise ValueError(f"Each result needs a bold rank, result link and one verification emoji: {table[index + 2]}")
            rank, slug = int(match[1]), match[2]
            if slug in seen:
                raise ValueError(f"Duplicate README result: {slug}")
            if rank != len(entries) + 1 and (not entries or rank != entries[-1][0]):
                raise ValueError(f"Invalid competition rank {rank} for {slug} at position {len(entries) + 1}")
            seen.add(slug)
            entries.append((rank, slug, status))
    return entries


def main() -> int:
    readme = Path(__file__).resolve().parents[1] / "README.md"
    try:
        entries = parse_results(readme.read_text(encoding="utf-8"))
    except ValueError as error:
        print(error, file=sys.stderr)
        return 1
    print(f"Checked {len(entries)} README importance ranks and verification emojis.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
