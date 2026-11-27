"""Compare displaced root-lattice Gaussian masses with their central reference.

At alpha=s*log(2) the coefficient calculations use integers. Raising to
an integer power clears the rational exponent introduced by the translate.
The uniform tail bound covers every omitted vector in each comparison.
"""

from fractions import Fraction
from math import lcm


def require(condition, message):
    if not condition:
        raise ArithmeticError(message)


def displaced_mass(n, s, denominator, shifts, cutoff):
    """Use a common rational grid with integral coefficient exponent."""
    require(len(shifts) == n and sum(shifts) == 0, "translate outside the hyperplane")
    require((2*s) % denominator == 0, "nonintegral linear coefficient exponent")
    # Factor 2^(-s*sum x_i^2) outside, leaving rational Laurent coefficients.
    poly = {0: Fraction(1)}
    total_bound = Fraction(1)
    lower_sum_product = Fraction(1)
    for a in shifts:
        linear = 2*s*a//denominator
        def weight(k):
            e = s*k*k - linear*k
            return Fraction(1, 1 << e) if e >= 0 else Fraction(1 << -e)
        weights = [(k, weight(k)) for k in range(-cutoff,cutoff+1)]
        reduced = sum(value for _, value in weights)
        require(s*(2*cutoff+3) > abs(linear), "cutoff too small for geometric tail")
        upper = reduced + 2*(weight(cutoff+1)+weight(-cutoff-1))
        total_bound *= upper
        lower_sum_product *= reduced
        following = {}
        for idx, value in poly.items():
            for k, part in weights:
                following[idx+k] = following.get(idx+k, 0) + value*part
        poly = following
    lo = poly[0]
    error = total_bound-lower_sum_product
    return lo, lo+error, Fraction(s*sum(a*a for a in shifts), denominator**2)


def check_displaced(n, s, cutoff):
    denominator = 4
    half = [2]*(n//2) + [-2]*(n//2)
    samples = [half.copy(), half.copy(), [0]*n]
    samples[0][0] += 1
    samples[0][1] -= 1
    samples[1][0] += 1
    samples[1][-1] -= 1
    _, baseline_max, baseline_exp = displaced_mass(n,s,denominator,half,cutoff)
    for shifts in samples:
        lower, _, exp = displaced_mass(n,s,denominator,shifts,cutoff)
        power = lcm(exp.denominator, baseline_exp.denominator)
        lhs_scale = int(power*baseline_exp)
        rhs_scale = int(power*exp)
        require((1 << lhs_scale)*lower**power > (1 << rhs_scale)*baseline_max**power,
                f"displacement comparison failed for N={n}")
    return len(samples)


def main():
    tested = sum(check_displaced(n,4,7) for n in (6,10))
    print(f"Certified {tested} translate comparisons at ranks 5 and 9, alpha=4 log(2).")
    print("Each comparison includes an explicit Gaussian tail bound.")


if __name__ == "__main__":
    main()
