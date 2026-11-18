"""Independent finite checks of the two-jump formula and its signed-edge proof."""
from functools import cache
from math import gcd


def distance(r, n):
    return min(r % n, -r % n)


def neighbors(n, a, b):
    return [
        sum(1 << y for y in {(z + d) % n for d in (a, b, -a, -b)})
        for z in range(n)
    ]


def largest_set(adj):
    """Direct include/exclude search without any multiplier or torus bound."""
    @cache
    def best(available):
        if not available:
            return 0
        v = available & -available
        rest = available ^ v
        keep = v | best(rest & ~adj[v.bit_length() - 1])
        drop = best(rest)
        return keep if keep.bit_count() > drop.bit_count() else drop

    return best((1 << len(adj)) - 1)


def verify_orientation(forward, backward, characters, chosen):
    n = len(forward[0])
    def occupied(z):
        return (chosen >> (z % n)) & 1

    # Faces are indexed by the lower-left grid vertex. The designated
    # direction of each dual edge goes from the left face to the right face.
    incident = [[] for _ in range(n)]
    marks = []
    for i, move in enumerate(forward):
        for z in range(n):
            if occupied(z) or occupied(move[z]):
                continue
            left, right = (z, backward[1][z]) if i == 0 else (backward[0][z], z)
            edge = len(marks)
            marks.append((i, z))
            incident[left].append((edge, right, 1))
            incident[right].append((edge, left, -1))
    assert all(len(row) % 2 == 0 for row in incident)

    used = set()
    signs = [[0] * n for _ in range(2)]
    for start in range(n):
        face = start
        while incident[face]:
            edge, other, sign = incident[face].pop()
            if edge in used:
                continue
            used.add(edge)
            i, z = marks[edge]
            signs[i][z] = sign
            face = other
        assert face == start
    assert len(used) == len(marks)

    horizontal, vertical = signs
    assert all(
        horizontal[z] + vertical[forward[0][z]]
        == vertical[z] + horizontal[forward[1][z]]
        for z in range(n)
    )
    signed_totals = [sum(row) for row in signs]
    assert all((n - total) % 2 == 0 for total in signed_totals)
    residues = [(n - total) // 2 for total in signed_totals]
    assert min(distance(r, n) for r in residues) >= chosen.bit_count()
    assert tuple(r % n for r in residues) in characters


def odd_girth(adj):
    # A walk from 0 back to 0 in the odd layer has odd length. Translation
    # allows a shortest odd cycle to start at 0.
    frontier = 1
    visited = [1, 0]
    length = 0
    while frontier:
        layer = 0
        while frontier:
            bit = frontier & -frontier
            frontier ^= bit
            layer |= adj[bit.bit_length() - 1]
        length += 1
        if length % 2 and layer & 1:
            return length
        frontier = layer & ~visited[length % 2]
        visited[length % 2] |= frontier
    return None


def noncyclic_quotients():
    # Lattice generators (m,0), (s,k) in Hermite normal form.
    count = 0
    for m in range(2, 17):
        for k in range(2, 33 // m + 1):
            n = m * k
            for s in range(m):
                if gcd(s, gcd(m, k)) == 1:
                    continue
                def site(x, y):
                    wrap, row = divmod(y, k)
                    return row * m + (x - wrap * s) % m

                def shifts(sign):
                    return [
                        [site(z % m + dx, z // m + dy) for z in range(n)]
                        for dx, dy in ((sign, 0), (0, sign))
                    ]

                forward, backward = shifts(1), shifts(-1)
                adj = [sum(1 << v for v in {f[z] for f in forward + backward}) for z in range(n)]
                chosen = largest_set(adj)
                characters = {
                    (i * k, (m * j - s * i) % n) for i in range(m) for j in range(k)
                }
                assert len(characters) == n
                assert max(min(distance(x, n), distance(y, n)) for x, y in characters) == chosen.bit_count()
                verify_orientation(forward, backward, characters, chosen)
                count += 1
    return count


def main():
    graphs = orientations = 0
    for n in range(2, 31):
        for a in range(1, n // 2 + 1):
            for b in range(a, n // 2 + 1):
                adj = neighbors(n, a, b)
                chosen = largest_set(adj)
                exact = chosen.bit_count()
                h, t = max((min(distance(t*a, n), distance(t*b, n)), t) for t in range(n))
                assert exact == h, (n, a, b)
                constructed = {z for z in range(n) if t*z % n < h}
                assert len(constructed) == h
                assert all((z+d) % n not in constructed for z in constructed for d in (a, b))
                graphs += 1
                if gcd(n, gcd(a, b)) != 1:
                    continue
                forward = [[(z + d) % n for z in range(n)] for d in (a, b)]
                backward = [[(z - d) % n for z in range(n)] for d in (a, b)]
                characters = {(t * a % n, t * b % n) for t in range(n)}
                k = odd_girth(adj)
                if k is not None:
                    upper = n * (k-1) // (2*k)
                    band = range(upper, n-upper+1)
                    sharp = any((b*r-a*s) % n == 0 for r in band for s in band)
                    assert (exact == upper) == sharp
                if n <= 10:
                    for mask in range(1 << n):
                        if all(not (mask >> z & 1 and adj[z] & mask) for z in range(n)):
                            verify_orientation(forward, backward, characters, mask)
                            orientations += 1
                else:
                    verify_orientation(forward, backward, characters, chosen)
                    orientations += 1
    more = noncyclic_quotients()
    print(f"Checked {graphs} circulants, {more} noncyclic quotients and {orientations + more} signed orientations.")


if __name__ == "__main__":
    main()
