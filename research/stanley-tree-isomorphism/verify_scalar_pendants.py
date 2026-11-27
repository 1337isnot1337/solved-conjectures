"""Enumerate small signed pendant-tag configurations by their first two checks."""
from collections import Counter
from itertools import combinations_with_replacement


def path_coefficients(tags):
    count = Counter(tags)
    coefficients = Counter()
    for left_tag, left_count in count.items():
        for right_tag, right_count in count.items():
            if left_tag < right_tag:
                coefficients[left_tag + right_tag] += left_count * right_count
        coefficients[2 * left_tag] += left_count * (left_count - 1) // 2
        coefficients[left_tag] -= (len(tags) - 2) * left_count
    # The hub-hub contribution is supported at zero.
    return {tag: weight for tag, weight in coefficients.items() if tag and weight}


def main():
    checked = 0
    matched = 0
    for marker in (1, 2):
        alphabet = range(-3, 5)
        for target_leaves in range(4, 9):
            target = (marker,) * target_leaves
            wanted = path_coefficients(target)
            for surplus in range(1, 5):
                expected = (0,) * surplus + target
                found = []
                for candidate in combinations_with_replacement(
                    alphabet, target_leaves + surplus
                ):
                    if sum(candidate) != marker * target_leaves:
                        continue
                    checked += 1
                    if path_coefficients(candidate) == wanted:
                        found.append(candidate)
                assert found == [expected], (target, surplus, found)
                matched += len(found)
    print(f"{checked:,} total-length-compatible signed configurations, "
          f"{matched} verified matches")


if __name__ == "__main__":
    main()
