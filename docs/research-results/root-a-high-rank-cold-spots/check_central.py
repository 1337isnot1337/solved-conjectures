"""Exact finite comparisons of central A_(N-1) Gaussian translates at alpha=s log 2."""
from collections import defaultdict


def certified_coefficients(N, s, J=7):
    scale_exponent = s * J * (J + 1)
    weights = {
        h: 1 << (scale_exponent - s * h * (h - 1))
        for h in range(-J, J + 2)
    }
    coeffs = {0: 1}
    for _ in range(N):
        next_coeffs = defaultdict(int)
        for level, mass in coeffs.items():
            for shift, weight in weights.items():
                next_coeffs[level + shift] += mass * weight
        coeffs = next_coeffs
    # After the common scaling, the sum of both omitted tails is bounded by
    # 4 times the first omitted weight on one side. Bound the mass of every
    # excluded product by summing over its choices of an omitted factor.
    inverse_tail_bound = 1 << (2 * s * (J + 1) - 2)
    total = sum(weights.values())
    numerator = N * (inverse_tail_bound * total + 1) ** (N - 1)
    denominator = inverse_tail_bound ** N
    error = (numerator + denominator - 1) // denominator
    return coeffs, error


def compare(N, s):
    coeffs, error = certified_coefficients(N, s)
    middle = N // 2
    # j=k-N/2; j^2-j0^2=(k-middle)(k+middle-N) is always integral.
    # The Nth power removes the fractional exponent in the tilt factor.
    upper = (coeffs[middle] + error) ** N
    for k in range(middle):
        exponent = s * (k - middle) * (k + middle - N)
        lower = (coeffs[k] ** N) << exponent
        if lower <= upper:
            raise ValueError(f"Inconclusive for N={N}, s={s}, k={k}")
    return middle


if __name__ == "__main__":
    sizes = list(range(5, 25))
    scales = (1, 2, 3, 4, 6)
    count = sum(compare(N, s) for N in sizes for s in scales)
    print(f"{count} strict central-class comparisons, ranks 4 through 23, "
          f"alpha/log(2) in {scales}")
