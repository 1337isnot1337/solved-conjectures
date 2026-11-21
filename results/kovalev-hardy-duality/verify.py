#!/usr/bin/env python3
"""Supplementary exact arithmetic for the Kovalev counterfamily.

The mathematical proof covers every integer k >= 500000. This checker does
not evaluate a matrix, approximate a Gaussian integral, or search parameters.
It replays only the finite rational comparisons used in the written proof.
"""

from fractions import Fraction as Q
import json


def atan_interval(q, terms=10):
    assert 0 < q < 1
    total = sum(((-1) ** j * q ** (2*j+1) / (2*j+1)
                 for j in range(terms)), Q(0))
    next_term = (-1) ** terms * q ** (2*terms+1) / (2*terms+1)
    return total + min(Q(0), next_term), total + max(Q(0), next_term)


def log_ratio_interval(q, terms=10):
    """Enclose log((1+q)/(1-q)) by its positive atanh series."""
    assert 0 < q < 1
    total = 2 * sum((q ** (2*j+1) / (2*j+1)
                     for j in range(terms)), Q(0))
    tail = 2*q ** (2*terms+1) / ((2*terms+1)*(1-q*q))
    return total, total + tail


def main():
    atan5 = atan_interval(Q(1, 5))
    atan239 = atan_interval(Q(1, 239))
    pi_lower = 16*atan5[0] - 4*atan239[1]
    pi_upper = 16*atan5[1] - 4*atan239[0]
    assert 3 < pi_lower < pi_upper < Q(355, 113)

    log2 = log_ratio_interval(Q(1, 3))
    log54 = log_ratio_interval(Q(1, 9))
    log1615 = log_ratio_interval(Q(1, 31))
    log320 = (8*log2[0]+log54[0], 8*log2[1]+log54[1])
    log30 = (5*log2[0]-log1615[1], 5*log2[1]-log1615[0])
    assert Q(721, 125) < log320[0] < log320[1] < Q(5769, 1000)

    h30 = sum((Q(1, j) for j in range(1, 31)), Q(0))
    gamma_lower = h30-log30[1]-Q(1, 60)
    gamma_upper = h30-log30[0]-Q(1, 62)
    assert Q(577, 1000) < gamma_lower < gamma_upper < Q(289, 500)

    lower_l, upper_l = Q(519, 100), Q(649, 125)
    assert log320[0]-gamma_upper > lower_l
    assert log320[1]-gamma_lower < upper_l

    root_bound = Q(250663, 100000)
    assert root_bound**2 > 2*Q(355, 113)
    c, z = Q(1, 40), Q(1, 160)
    w = z*z/4
    i0_upper = 1/(1-w)
    i0_prime_upper = 2*w/(z*(1-w)**2)
    s_upper = w/(1-w)**2
    s_prime_upper = 2*w*(1+w)/(z*(1-w)**3)
    k_difference_lower = (1/z-upper_l*(i0_upper+i0_prime_upper)
                          -s_upper-s_prime_upper)
    assert k_difference_lower > 0
    a_lower = c*(1+z)*k_difference_lower/(2*root_bound)
    b_lower = (1+z)*lower_l/root_bound
    a0, b0 = Q(7767, 10000), Q(2083, 1000)
    assert a_lower > a0 > 0
    assert b_lower > b0 > 0

    k0, denominator = 500000, 1000
    assert 2*k0 == denominator**2
    factor = 1-Q(1, denominator)
    v_lower = (a0*a0+c*(factor*b0)**2)**2+2*a0**4
    gap = v_lower-Q(355, 113)**2/8
    assert gap > 0
    print(json.dumps({
        "minimum_k": k0,
        "all_matrix_orders_at_least": k0+1,
        "a_lower_bound": str(a0),
        "b_lower_bound": str(b0),
        "transfer_factor": str(factor),
        "quartic_lower_bound": str(v_lower),
        "gap_above_355_over_113_squared_over_8": str(gap),
        "status": "ALL_RATIONAL_COMPARISONS_PASSED",
    }, indent=2))


if __name__ == "__main__":
    main()
