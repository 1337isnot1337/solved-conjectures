"""Check the gamma and complete-block reductions with exact rationals."""
from fractions import Fraction as F
from math import comb, factorial


def partials(a):
    n = len(a)
    dp = {0: F(1)}
    for row in a:
        following = dp.copy()
        for mask, val in dp.items():
            for j, weight in enumerate(row):
                if weight and not mask & (1 << j):
                    match = mask | (1 << j)
                    following[match] = following.get(match, F(0)) + val*weight
        dp = following
    result = [F(0)]*(n+1)
    for mask, val in dp.items():
        result[mask.bit_count()] += val
    return result


def check():
    cases = blocks = 0
    for n in range(2,9):
        for k in range(2,n+1):
            for support in [tuple(range(k)), tuple(range(n-k,n))]:
                matrix = [[F((j-i) % n in support,k) for j in range(n)] for i in range(n)]
                sigma = partials(matrix)
                for t in [F(1,7), F(1,2)]:
                    direct = [[t*v+(1-t)/n for v in row] for row in matrix]
                    moments = sum(t**j*((1-t)/n)**(n-j)*factorial(n-j)*coef
                                  for j,coef in enumerate(sigma))
                    assert partials(direct)[-1] == moments
                    cases += 1
            complete = partials([[F(1,k)]*k for _ in range(k)])
            for y in [F(0),F(1,7),F(2,3)]:
                phi = sum(val*y**(k-j) for j,val in enumerate(complete))
                laguerre = sum(comb(k,j)*(k*y)**j/F(factorial(j)) for j in range(k+1))
                assert phi == F(factorial(k),k**k)*laguerre
                blocks += 1
    print(f"Passed {cases} exact gamma reductions and {blocks} complete-block evaluations.")


if __name__ == "__main__":
    check()
