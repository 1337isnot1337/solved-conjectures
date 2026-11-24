"""Finite subsystems for an unrestricted-middle difference-kernel ansatz.

The default rank computations are modular screens.  With --certify,
an independent rational upper bound for the source rank is combined
with modular minors to certify a characteristic-zero obstruction.
No infinite-kernel existence assertion is made.
"""

import argparse
from fractions import Fraction as F
from functools import lru_cache
from itertools import product
from math import isqrt
from pathlib import Path

import numpy as np


GAMMA = [
    [[F(int(i == j)) for j in range(4)] for i in range(4)],
    [[F(-4, 3), F(0), F(0), F(0)],
     [F(4), F(-1), F(-1, 3), F(0)],
     [F(4), F(-1, 3), F(-1), F(0)],
     [F(52), F(-4), F(-4), F(-4, 3)]],
]
PARAMETERS = [(2, 5), (5, 2)]
SIGMA = [1, -1]
ROTATION = None


@lru_cache(None)
def projector(z, n, site):
    t = F(1, 3) - 2 * n
    upper = (z + t / 2) ** 2
    lower = (z - t / 2) ** 2
    denominator = 2 * z * t
    if site == 0:
        return [[-lower / denominator, 1 / denominator],
                [-upper * lower / denominator, upper / denominator]]
    return [[upper / denominator, -1 / denominator],
            [upper * lower / denominator, -lower / denominator]]


@lru_cache(None)
def family_projector(family, z, n, site):
    matrix = projector(z, n, site)
    if family != 1 or ROTATION is None:
        return matrix
    G, inverse = ROTATION
    return [[sum(G[a][i] * matrix[i][j] * inverse[j][b]
                 for i, j in product(range(2), repeat=2))
             for b in range(2)] for a in range(2)]


def coefficient_rows(radius):
    interior = list(range(-radius, radius + 1))
    source = list(range(-radius - 1, radius + 2))
    variables = [(z, h, c, x, y) for z, h, c in product(range(2), repeat=3)
                 for x, y in product(source, repeat=2) if (x - y) % 2 == 0]
    column = {label: i for i, label in enumerate(variables)}
    labels = [(a, b, gamma, n, m)
              for n, m in product(interior, repeat=2) if (n - m) % 2 == 0
              for a, b, gamma in product(range(2), range(2), range(4))]
    rows = []
    for a, b, gamma, n, m in labels:
        row = {}
        for z, (u, v) in enumerate(PARAMETERS):
            scalar = F(u, u + 1) * F(v + 1, v)
            for h, c, J, K in product(range(2), repeat=4):
                factor = GAMMA[z][gamma][2 * h + c]
                if not factor:
                    continue
                x, y = n - SIGMA[J], m - SIGMA[K]
                value = (factor * scalar * family_projector(z, u, n, J)[a][h]
                         * family_projector(z, v + 1, y, K)[h][b])
                if value:
                    col = column[z, h, c, x, y]
                    row[col] = row.get(col, F(0)) + value
        if n == m:
            row[len(variables) + (2 * a + b) * 4 + gamma] = F(1)
        rows.append({col: value for col, value in row.items() if value})
    return variables, labels, rows


def modular_matrix(rows, width, prime):
    matrix = np.zeros((len(rows), width), dtype=np.int64)
    for r, row in enumerate(rows):
        for c, value in row.items():
            denominator = value.denominator % prime
            assert denominator
            matrix[r, c] = value.numerator % prime * pow(denominator, -1, prime) % prime
    return matrix


def eliminate(matrix, source_columns, prime):
    # Every entry is reduced modulo prime before each update. Thus each
    # numpy.int64 product is at most (prime-1)^2 (1008^2 in the certificate).
    # The subtraction also stays in [-(prime-1)^2, prime-1]. The CLI checks
    # that this bound fits int64; there is no unchecked machine overflow.
    matrix = matrix.copy()
    pivots = []
    rank = 0
    for c in range(source_columns):
        candidates = np.flatnonzero(matrix[rank:, c])
        if not len(candidates):
            continue
        chosen = rank + int(candidates[0])
        matrix[[rank, chosen]] = matrix[[chosen, rank]]
        matrix[rank, c:] = matrix[rank, c:] * pow(int(matrix[rank, c]), -1, prime) % prime
        active = np.flatnonzero(matrix[rank + 1:, c]) + rank + 1
        if len(active):
            matrix[active, c:] = (matrix[active, c:]
                                  - matrix[active, c, None] * matrix[rank, c:]) % prime
        pivots.append(c)
        rank += 1
        if rank == len(matrix):
            break
    residual = matrix[rank:, source_columns:]
    assert not np.any(matrix[rank:, :source_columns])
    return rank, residual, pivots


def modrank(matrix, prime):
    return eliminate(matrix, matrix.shape[1], prime)[0]


def outside_frame(family, side, source_parity, radius):
    u, v = PARAMETERS[family]
    source = [x for x in range(-radius - 1, radius + 2) if x % 2 == source_parity]
    target = [(a, n) for n in range(-radius, radius + 1)
              if n % 2 != source_parity for a in range(2)]
    matrix = [[F(0) for _ in source] for _ in target]
    for row, (a, n) in enumerate(target):
        for col, x in enumerate(source):
            for site in range(2):
                if x != n - SIGMA[site]:
                    continue
                if side == 'A':
                    value = F(u, u + 1) * family_projector(family, u, n, site)[a][1]
                else:
                    value = F(v + 1, v) * family_projector(family, v + 1, x, site)[1][a]
                matrix[row][col] += value
    return matrix


def certify_rank_upper(radius, prime, rotated):
    if rotated:
        return 0
    assert [GAMMA[z][gamma][3] for z in range(2) for gamma in range(3)] == [0] * 6
    assert GAMMA[0][3][3] and GAMMA[1][3][3]
    lower_kernel = 0
    for parity in (0, 1):
        ambient = {}
        dimensions = {}
        for side in ('A', 'B'):
            ranks = []
            for family in range(2):
                frame = outside_frame(family, side, parity, radius)
                sparse = [{i: x for i, x in enumerate(row) if x} for row in frame]
                fm = modular_matrix(sparse, len(frame[0]), prime)
                rank = modrank(fm, prime)
                assert rank == len(frame[0])
                ranks.append(rank)
                ambient[side] = len(frame)
            dimensions[side] = max(0, sum(ranks) - ambient[side])
        lower_kernel += dimensions['A'] * dimensions['B']
    return lower_kernel


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--radius', type=int, default=3)
    parser.add_argument('--prime', type=int, default=1009)
    parser.add_argument('--output-dir', type=Path,
                        help='write optional modular artifacts to this directory')
    parser.add_argument('--save-rational', action='store_true',
                        help='save rational data in --output-dir, or the current directory')
    parser.add_argument('--rotate-family', action='store_true')
    parser.add_argument('--certify', action='store_true')
    args = parser.parse_args()
    if args.radius < 0:
        parser.error('--radius must be nonnegative')
    if args.prime < 2 or (args.prime - 1) ** 2 > np.iinfo(np.int64).max:
        parser.error('--prime must be at least 2 and satisfy (prime-1)^2 <= INT64_MAX')
    if any(args.prime % divisor == 0 for divisor in range(2, isqrt(args.prime) + 1)):
        parser.error('--prime must be prime')
    if args.certify and (args.radius != 3 or args.prime != 1009):
        parser.error('the published certificate uses --radius 3 --prime 1009')
    if args.rotate_family:
        global ROTATION
        ROTATION = ([[F(1), F(2)], [F(3), F(5)]],
                    [[F(-5), F(2)], [F(3), F(-1)]])
        import sympy as sp
        G = sp.Matrix([[1, 2], [3, 5]])
        big = sp.kronecker_product(G, G)
        rotated = big * sp.Matrix(GAMMA[1]) * big.inv()
        GAMMA[1] = [[F(value) for value in row] for row in rotated.tolist()]
    variables, labels, rows = coefficient_rows(args.radius)
    matrix = modular_matrix(rows, len(variables) + 16, args.prime)
    rank, residual, pivots = eliminate(matrix, len(variables), args.prime)
    dimensions = {}
    for a, b in product(range(2), repeat=2):
        start = (2 * a + b) * 4
        dimensions[a, b] = 4 - modrank(residual[:, start:start + 4], args.prime)
    print({'radius': args.radius, 'target_flags': 2 * args.radius + 1,
           'source_flags': 2 * args.radius + 3, 'equations': len(rows),
           'middle_unknowns': len(variables), 'source_rank_mod': rank,
           'source_kernel_dimension_mod': len(variables) - rank,
           'H_dimensions_mod': dimensions, 'prime': args.prime,
           'rotated_second_family':args.rotate_family}, flush=True)
    if args.certify:
        assert args.prime == 1009
        kernel_lower = certify_rank_upper(args.radius, args.prime, args.rotate_family)
        rational_rank_upper = len(variables) - kernel_lower
        assert rank == rational_rank_upper, (rank, rational_rank_upper)
        assert all(dimension == 0 for dimension in dimensions.values())
        print({'characteristic_zero_certificate':'passed',
               'source_rank_exact':rank,'structural_kernel_lower_bound':kernel_lower,
               'each_augmented_rank_lower_bound':rank+4,
               'conclusion':'every admissible target C column is zero'},flush=True)
    suffix = '_rotated' if args.rotate_family else ''
    if args.output_dir is not None:
        args.output_dir.mkdir(parents=True, exist_ok=True)
        artifact = args.output_dir / f'difference_kernel_r{args.radius}_p{args.prime}{suffix}.npz'
        np.savez(artifact, residual=residual, pivots=pivots, matrix=matrix,
                 variables=np.array(variables), equations=np.array(labels))
        print({'modular_artifact': str(artifact)}, flush=True)
    if args.save_rational:
        import pickle
        destination = args.output_dir if args.output_dir is not None else Path.cwd()
        destination.mkdir(parents=True, exist_ok=True)
        artifact = destination / f'difference_kernel_r{args.radius}_rational{suffix}.pkl'
        with artifact.open('wb') as handle:
            pickle.dump((variables, labels, rows), handle)
        print({'rational_artifact': str(artifact)}, flush=True)


if __name__ == '__main__':
    main()
