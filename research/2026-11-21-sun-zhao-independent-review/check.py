"""Independent exact audit of Sun--Zhao's retained-block counterexample.

This implementation does not import or execute the submitted checker. It forms
logarithmic intervals individually, then propagates fourteen interval forward
differences instead of using a single uniform weighted truncation bound.
"""

from fractions import Fraction as F
from math import comb, prod
import json


def source_values():
    values = [1, 8]
    for n in range(2, 27):
        next_value = F(8*(3*n*n-3*n+1)*values[n-1]
                       - 128*(n-1)**2*values[n-2], n*n)
        assert next_value.denominator == 1 and next_value > 0
        values.append(next_value.numerator)
    return values


def logarithm_interval(x):
    assert x > 0
    u = (x-1)/(x+1)
    assert abs(u) <= F(1, 3)
    power = u
    truncation = F(0)
    for exponent in range(1, 48, 2):
        truncation += 2*power/exponent
        power *= u*u
    assert power == u**49
    error = 2*abs(power)/(49*(1-u*u))
    return truncation-error, truncation+error


def interval_forward_difference(intervals):
    # For X in [a,b] and Y in [c,d], Y-X lies in [c-b,d-a].
    return [(right[0]-left[1], right[1]-left[0])
            for left, right in zip(intervals, intervals[1:])]


def main():
    values = source_values()
    expected_block = [
        15008466534400, 221460239482880, 3287994183188480,
        49074667327062016, 735814252604162048, 11076827875597352960,
        167338264534131408896, 2535936220929779040256,
        38539148242634697342976, 587172319637401677856768,
        8966541774166044673310720, 137211561613401637284478976,
        2103704833567570984242774016, 32310152363853898923615715328,
        497042117469860910740195508224,
    ]
    block = values[12:27]
    assert block == expected_block

    intervals = [logarithm_interval(F(32*value, 16**n))
                 for n, value in enumerate(block, 12)]
    for _ in range(14):
        intervals = interval_forward_difference(intervals)
    assert len(intervals) == 1
    lower, upper = intervals[0]
    target_lower, target_upper = F(-185605, 10**15), F(-185604, 10**15)
    assert target_lower < lower <= upper < target_upper < 0

    # Reconstruct the submitted uniform remainder certificate separately.
    centers = []
    for n, value in enumerate(block, 12):
        lo, hi = logarithm_interval(F(32*value, 16**n))
        centers.append((lo+hi)/2)
    for _ in range(14):
        centers = [right-left for left, right in zip(centers, centers[1:])]
    uniform_error = F(2**15, 49) / ((1-F(1, 9))*3**49)
    assert target_lower < centers[0]-uniform_error
    assert centers[0]+uniform_error < target_upper

    positive_product = prod(block[j]**comb(14, j) for j in range(0, 15, 2))
    negative_product = prod(block[j]**comb(14, j) for j in range(1, 15, 2))
    assert positive_product < negative_product
    assert positive_product.bit_length() == negative_product.bit_length() == 582535

    ratios = list(map(F, block))
    for _ in range(12):
        ratios = [right/left for left, right in zip(ratios, ratios[1:])]
    assert len(ratios) == 3
    defect = ratios[1]**2-ratios[0]*ratios[2]
    assert defect > 0

    output = {
        "status": "passed",
        "source": "arXiv:1602.04359v4, Conjecture 5.2",
        "source_values": block,
        "retained_ratio_indices": [12, 13, 14],
        "ratio_iterations": 12,
        "log_forward_differences": 14,
        "certified_enclosing_interval": [str(target_lower), str(target_upper)],
        "individual_interval_propagation_passed": True,
        "submitted_uniform_error_passed": True,
        "integer_product_bit_lengths": [positive_product.bit_length(),
                                        negative_product.bit_length()],
        "direct_ratio_log_convexity_reversed": True,
        "uses_floating_point": False,
    }
    print(json.dumps(output, indent=2))


if __name__ == "__main__":
    main()
