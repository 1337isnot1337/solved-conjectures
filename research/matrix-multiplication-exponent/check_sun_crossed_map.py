"""Exact audit of the literal crossed maps in Sun 2610.13971, A.7/9.3.

No numerical linear algebra and no external packages.  Characters use the
paper's integer encoding of F_2^4.  Fractions are over Q, hence characteristic 0.
"""

from collections import defaultdict
from fractions import Fraction as F


XI = (0, 3, 4, 9, 12)
C = [[F(x) for x in (1, 0, 0, 0, 0, F(1, 2), 0, 0, 0, F(-1, 2))]]
B = [[F(x) for x in row] for row in (
    (0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
    (0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
    (0, 0, 0, 1, 0, 0, 0, 0, 0, 0),
    (2, 0, 0, 0, 0, -1, 1, 0, 0, 0),
    (2, 0, 0, 0, 0, -1, 0, 1, 0, 0),
    (2, 0, 0, 0, 0, -1, 0, 0, 1, 0),
    (2, 0, 0, 0, 0, -1, 0, 0, 0, 1),
)]
D = [[F(x) for x in row] for row in (
    (0, 0, 0, 0, 0, 0, 1, 0, 0, -1),
    (0, 0, 0, 0, 0, 0, 0, 1, 0, -1),
    (0, 0, 0, 0, 0, 0, 0, 0, 1, -1),
    (0, 1, 0, 0, 0, 0, 0, 0, 0, 0),
    (0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
    (0, 0, 0, 1, 0, 0, 0, 0, 0, 0),
    (F(-1, 2), -1, -1, -1, 0, F(1, 4), 0, 0, 0, F(-1, 4)),
)]
J = [[F(j == (i + 5) % 10) for j in range(10)] for i in range(10)]


def character(x, y):
    return -1 if (x & y).bit_count() % 2 else 1


def transpose(a):
    return list(map(list, zip(*a)))


def multiply(a, b):
    return [[sum(x * y for x, y in zip(row, col))
             for col in zip(*b)] for row in a]


def right_sigma(a, delta):
    signs = [character(x, delta) for x in XI] * 2
    return [[value * signs[j] for j, value in enumerate(row)] for row in a]


def representation(delta):
    return multiply(multiply(right_sigma(B, delta), J), transpose(D))


def literal_maps(alpha, beta, gamma, omit_internal_sigmas=False):
    """Return the three Laurent side maps for each of the five packets.

    The default implements exactly the instructions in A.7: the ENTIRE
    packet on each side gets its packet-character sign, and the role
    matrices are additionally replaced by (9.15) and c^[delta]=c Sigma_delta.
    The optional variant omits only these internal right Sigma factors.
    """
    bx = multiply(representation(alpha), B)
    dy = multiply(transpose(representation(beta)), D)
    cy, cz = C, C
    if not omit_internal_sigmas:
        bx, dy = right_sigma(bx, alpha), right_sigma(dy, beta)
        cy, cz = right_sigma(C, beta), right_sigma(C, gamma)

    def regular(mat, col, prefix):
        return [(1, f"{prefix}{i + 1}", row[col])
                for i, row in enumerate(mat) if row[col]]

    result = []
    for j, xi in enumerate(XI):
        x = {0: [(-2, "XbarL", F(1))] + regular(bx, j, "P"),
             4: regular(bx, 5 + j, "P")}
        y = {0: [(-2, "YbarL", F(1)), (1, "U", cy[0][j])]
                + regular(dy, j, "Q"),
             4: [(1, "U", cy[0][5 + j])] + regular(dy, 5 + j, "Q")}
        z = {0: [(-2, "ZbarL", F(1)), (1, "V", cz[0][j])],
             4: [(1, "V", cz[0][5 + j])]}
        if j == 0:
            z[4].append((4, "ZbarH", F(1)))
        for i in range(1, 4):
            label = 3 * j + i
            x[i] = [(1, f"Xsh{label}", F(1))]
            y[i] = [(1, f"Ysh{label}", F(1))]
            z[i] = [(1, f"Zsh{label}", F(1))]
        for side, delta in ((x, alpha), (y, beta), (z, gamma)):
            sign = character(xi, delta)
            for index, terms in side.items():
                side[index] = [(degree, name, coeff * sign)
                               for degree, name, coeff in terms if coeff]
        result.append((x, y, z))
    return result


def expand(alpha, beta, gamma, omit_internal_sigmas=False):
    support = [(0, i, i) for i in range(1, 4)]
    support += [(i, 0, i) for i in range(1, 4)]
    support += [(i, i, 0) for i in range(1, 4)]
    support += [(0, 0, 4), (0, 4, 0), (4, 0, 0)]
    output = defaultdict(F)
    for x, y, z in literal_maps(alpha, beta, gamma, omit_internal_sigmas):
        for i, j, k in support:
            for dx, nx, cx in x[i]:
                for dy, ny, cy in y[j]:
                    for dz, nz, cz in z[k]:
                        output[(dx + dy + dz, nx, ny, nz)] += cx * cy * cz
    return {key: value for key, value in output.items() if value}


def negative(output):
    return {key: value for key, value in output.items() if key[0] < 0}


def check():
    identity = [[F(i == j) for j in range(7)] for i in range(7)]
    assert multiply(multiply(B, J), transpose(D)) == identity
    assert multiply(multiply(C, J), transpose(C)) == [[F(1)]]
    assert all(sum(row[5:]) == 0 for row in B + D + C)
    assert not negative(expand(0, 0, 0))

    witness = expand(0, 4, 4)
    term = (-3, "XbarL", "YbarL", "V")
    assert witness[term] == 1
    print("Printed-map witness (alpha,beta,gamma)=(0,4,4):")
    print("coefficient of t^-3 XbarL YbarL V =", witness[term])
    print("all negative coefficients:", negative(witness))

    bad = 0
    for alpha in range(16):
        for beta in range(16):
            gamma = alpha ^ beta
            current = expand(alpha, beta, gamma)
            expected = F(1 - character(12, gamma), 2)
            assert current.get(term, F(0)) == expected
            bad += bool(negative(current))
            # These are only checks of a local repair, not of the global proof.
            corrected = expand(alpha, beta, gamma, omit_internal_sigmas=True)
            assert not negative(corrected)
            regular = [[corrected.get((0, f"P{i + 1}", f"Q{j + 1}", "ZbarL"), F(0))
                        for j in range(7)] for i in range(7)]
            assert regular == representation(gamma)
            expected_zero = {(0, "XbarL", "U", "V"): F(1),
                             (0, "XbarL", "YbarL", "ZbarH"): F(1)}
            for i in range(1, 16):
                expected_zero[(0, "XbarL", f"Ysh{i}", f"Zsh{i}")] = F(1)
                expected_zero[(0, f"Xsh{i}", "YbarL", f"Zsh{i}")] = F(1)
                expected_zero[(0, f"Xsh{i}", f"Ysh{i}", "ZbarL")] = F(1)
            for i in range(7):
                for j in range(7):
                    if regular[i][j]:
                        expected_zero[(0, f"P{i + 1}", f"Q{j + 1}", "ZbarL")] = regular[i][j]
            assert {key: value for key, value in corrected.items() if key[0] == 0} == expected_zero
    # Formal isolated-kernel test only. Compatibility of zero relative
    # displacements with the full sector-specific decoder is not asserted.
    old_weyl_entry = sum(F(1 - character(12, alpha ^ beta), 2)
                        for alpha in range(16) for beta in range(16))
    assert old_weyl_entry == 128
    print("Closed character triples with a nonzero negative term:", bad, "/ 256")
    print("Omitting internal Sigma factors: no negative term and correct regular")
    print("pairing M_gamma for all 256 closed triples. Global composition unchecked.")
    print("Formal isolated kernel sum (global decoder unverified):", old_weyl_entry)


if __name__ == "__main__":
    check()
