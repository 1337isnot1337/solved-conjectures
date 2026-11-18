"""Exact checks from the rules of CUT. Run with standard Python 3."""


def game_values(cuts, limit):
    # options[p][n] contains the XORs of p positive pile values totaling n.
    max_parts = min(limit, max(cuts) + 1)
    options = [[set() for _ in range(limit + 1)] for _ in range(max_parts + 1)]
    grundy = [0]
    for n in range(1, limit + 1):
        reachable = set()
        for p in range(2, min(n, max_parts) + 1):
            values = options[p][n]
            for h in range(1, n - p + 2):
                first = grundy[h]
                values.update(first ^ rest for rest in options[p - 1][n - h])
            if p - 1 in cuts:
                reachable.update(values)
        g = 0
        while g in reachable:
            g += 1
        grundy.append(g)
        options[1][n].add(g)
    return grundy


def published_values(x, limit):
    c = x // 2
    block = ([0, 1] * c + [2, 3] * c + [1, 4] + [5, 4] * (c - 1)
             + [3, 2] * c + [4, 5] * c + [6, 7] * c)
    values = [0]
    for n in range(1, limit + 1):
        q, r = divmod(n - 1, len(block))
        values.append(8 * q + block[r])
    return values


def main():
    families = 0
    for x in (4, 6, 8, 10):
        limit = 12 * x + 3
        baseline = game_values({1, x}, limit)
        assert baseline == published_values(x, limit)
        for cuts in ({1, x, 3*x+1}, {1, x, x+2, 3*x+1, 3*x+7},
                     {1, x, 2*x, 3*x+3}):
            assert game_values(cuts, limit) == baseline
            families += 1
        for y in range(5, 3*x, 2):
            cuts = {1, x, y, x+2, 3*x+1}
            assert game_values(cuts, 4*x) != baseline[:4*x+1]
            families += 1
        print(f"x={x}: base sequence and preserving cut sets checked through {limit}; "
              f"every smaller admissible odd cut distinguished by {4*x}.")
    print(f"Checked {families} Family B cut sets directly from the game rules.")


if __name__ == "__main__":
    main()
