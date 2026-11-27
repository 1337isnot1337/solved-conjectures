"""Check the sharp constant and the first strict order using integer arithmetic."""

from itertools import combinations, permutations
from math import prod


def laplacian(n, edges):
    matrix = [[0] * n for _ in range(n)]
    for i, j in edges:
        matrix[i][i] += 1
        matrix[j][j] += 1
        matrix[i][j] = matrix[j][i] = -1
    return matrix


def above_threshold(matrix):
    """Check L - (59/100)(I - J/n) on a complement to its constant-vector kernel."""
    n = len(matrix)
    reduced = [[100 * n * matrix[i][j] - 59 * (n * (i == j) - 1)
                for j in range(n - 1)] for i in range(n - 1)]
    while reduced:
        pivot = reduced[0][0]
        if pivot <= 0:
            return False
        # The new matrix is the Schur complement multiplied by a positive pivot.
        reduced = [[pivot * reduced[i][j] - reduced[i][0] * reduced[0][j]
                    for j in range(1, len(reduced))] for i in range(1, len(reduced))]
    return True


def determinant(matrix):
    n = len(matrix)
    result = 0
    for perm in permutations(range(n)):
        inversions = sum(perm[i] > perm[j] for i, j in combinations(range(n), 2))
        result += (-1) ** inversions * prod(matrix[i][perm[i]] for i in range(n))
    return result


def verify_path(matrix):
    assert sorted(row[i] for i, row in enumerate(matrix)) == [1, 1, 2, 2]
    # Five values determine this characteristic polynomial of degree four.
    for t in range(5):
        shifted = [[t * (i == j) - matrix[i][j] for j in range(4)] for i in range(4)]
        assert determinant(shifted) == t * (t - 2) * (t*t - 4*t + 2)


def main():
    assert 56**2 > 5 * 25**2 and 141**2 < 2 * 100**2
    total = path_cases = 0
    for n in range(2, 6):
        pairs = list(combinations(range(n), 2))
        for mask in range(1 << len(pairs)):
            edges = [edge for bit, edge in enumerate(pairs) if mask & (1 << bit)]
            other_edges = [edge for bit, edge in enumerate(pairs) if not mask & (1 << bit)]
            red, blue = laplacian(n, edges), laplacian(n, other_edges)
            is_path = n == 4 and sorted(red[i][i] for i in range(n)) == [1, 1, 2, 2]
            if is_path:
                verify_path(red)
                verify_path(blue)
                path_cases += 1
            else:
                assert above_threshold(red) or above_threshold(blue), (n, mask)
            total += 1
    assert (total, path_cases) == (1098, 12)
    print(f"{total} labelled graphs of orders 2 through 5; {path_cases} labelled P4 equality cases")


if __name__ == "__main__":
    main()
