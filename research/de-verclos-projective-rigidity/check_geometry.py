"""Exact bounded sanity checks for PROOF.md; no numerical approximations."""

from fractions import Fraction as Q
from itertools import combinations, product


def require(condition, explanation):
    if not condition:
        raise ValueError(explanation)


def orient(p, q, r):
    return (q[0] - p[0]) * (r[1] - p[1]) - (q[1] - p[1]) * (r[0] - p[0])


def check_secants():
    points = [(x, y) for x, y in product(range(-4, 5), repeat=2) if y]
    count = 0
    for (x, y), (xx, yy) in combinations(points, 2):
        a, b = Q(x + 1, y), Q(x - 1, y)
        aa, bb = Q(xx + 1, yy), Q(xx - 1, yy)
        actual = orient((x, y), (xx, yy), (-1, 0)) * orient((x, y), (xx, yy), (1, 0))
        require(actual == (y * yy) ** 2 * (a - aa) * (b - bb), (x, y, xx, yy))
        count += 1
    return count


def check_line_profiles():
    p = tuple(map(Q, (-3, -1, 0, 3, 5)))
    count = 0
    for a, b, c, d in product(range(-3, 4), range(-3, 4), range(-2, 3), range(1, 9)):
        det = a * d - b * c
        div = [c * x + d for x in p]
        if det <= 0 or min(div) <= 0:
            continue
        q = [(a * x + b) / h for x, h in zip(p, div)]
        m = [div[2] / h for h in div]
        for i, j, k in combinations(range(len(p)), 3):
            alpha = (p[k] - p[j]) / (p[k] - p[i])
            beta = 1 - alpha
            alphan = (q[k] - q[j]) / (q[k] - q[i])
            betan = 1 - alphan
            require(alphan * m[i] == alpha * m[j] and betan * m[k] == beta * m[j], (a, b, c, d, i, j, k))
            require((q[j] - q[i]) / (q[k] - q[j]) == m[i] / m[k] * (p[j] - p[i]) / (p[k] - p[j]), (a, b, c, d, i, j, k))
            for h1, h2, h3 in product((-1, 0, 1), repeat=3):
                original = orient((p[i], h1), (p[j], h2), (p[k], h3))
                transformed = orient((q[i], m[i] * h1), (q[j], m[j] * h2), (q[k], m[k] * h3))
                require(original == 0 == transformed or original * transformed > 0, (a, b, c, d, i, j, k, h1, h2, h3))
                count += 1
    return count


def check_three_directions():
    def value(digits, base):
        return sum(digit / base**i for i, digit in enumerate(digits, 1))

    old, new = Q(7, 2), Q(4)
    depth = 4
    words = sorted(product((0, 1), repeat=depth))
    src = [value(word, old) for word in words]
    dst = [value(word, new) for word in words]
    require(src == sorted(set(src)) and dst == sorted(set(dst)), 'incorrect lex order for coordinate words')
    sums = sorted(product((0, 1, 2), repeat=depth))
    src_sums = [value(word, old) for word in sums]
    dst_sums = [value(word, new) for word in sums]
    require(src_sums == sorted(set(src_sums)) and dst_sums == sorted(set(dst_sums)), 'incorrect lex order for sum words')
    for i, j in product(range(len(words)), repeat=2):
        pair_sum = tuple(x + y for x, y in zip(words[i], words[j]))
        require(src[i] + src[j] == value(pair_sum, old), 'source sum did not convert')
        require(dst[i] + dst[j] == value(pair_sum, new), 'target sum did not convert')
    def integer_grid(values, scale):
        scaled = [x * scale for x in values]
        require(all(x.denominator == 1 for x in scaled), 'failed exact common-denominator scaling')
        return list(product(map(int, scaled), repeat=2))

    source_points = integer_grid(src, old.numerator**depth)
    target_points = integer_grid(dst, new.numerator**depth)
    for i, j, k in combinations(range(len(source_points)), 3):
        s = orient(source_points[i], source_points[j], source_points[k])
        t = orient(target_points[i], target_points[j], target_points[k])
        if s * t < 0:
            p = tuple(tuple(Q(x, old.numerator**depth) for x in source_points[a]) for a in (i, j, k))
            q = tuple(tuple(Q(x, new.numerator**depth) for x in target_points[a]) for a in (i, j, k))
            return p, q, orient(*p), orient(*q)
    raise ValueError('no strict orientation disagreement in the finite search grid')


if __name__ == '__main__':
    print(f'Secant determinant cases: {check_secants()}')
    print(f'Line-profile determinant cases: {check_line_profiles()}')
    p, q, s, t = check_three_directions()
    print(f'Three-direction example strict sign disagreement: {p} -> {q}, determinants {s} and {t}')
