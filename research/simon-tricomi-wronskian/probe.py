#!/usr/bin/env python3
"""Bounded diagnostic only; floating-point signs are not a proof.

Evaluate Simon's determinant and its derivative on a deliberately small set
inside the parameter strip not covered by the stated monotonicity subcases.
No optimization, adaptive parameter search, or finite-case theorem is used.
"""

import mpmath as mp


def determinant_and_derivative(n, b, d, z):
    a = d - n
    # I_s'=I_s-I_{s-1}, by the positive Tricomi integral.
    moment = {
        k: mp.hyperu(b, b + 1 - a - k, z)
        for k in range(-1, 2 * n + 1)
    }
    matrix = mp.matrix(
        [[mp.rf(a + j, i) * moment[i + j] for j in range(n + 1)]
        for i in range(n + 1)]
    )
    derivative = mp.matrix(
        [[mp.rf(a + j, i) * (moment[i + j] - moment[i + j - 1])
          for j in range(n + 1)] for i in range(n + 1)]
    )
    value = mp.det(matrix)
    quotient = matrix ** -1 * derivative
    logarithmic_derivative = sum(quotient[i, i] for i in range(n + 1))
    return value, value * logarithmic_derivative


def main():
    mp.mp.dps = 70
    count = 0
    failures = []
    for n in [2, 3, 4, 6]:
        for d in sorted(set([mp.mpf(n) - mp.mpf('0.25'),
                             mp.mpf(n) - mp.mpf('1.25'),
                             mp.mpf(n) / 2 + mp.mpf('0.25')])):
            b = max(mp.mpf('0.25'), n - 1 - mp.floor(d) + mp.mpf('0.25'))
            if not 0 < b < d <= n:
                continue
            assert mp.floor(b) + mp.floor(d) >= n - 1
            for z in map(mp.mpf, ['0.01', '0.25', '1', '4', '100']):
                value, slope = determinant_and_derivative(n, b, d, z)
                count += 1
                if value <= 0 or slope >= 0:
                    failures.append((n, str(b), str(d), str(z),
                                     mp.nstr(value, 25), mp.nstr(slope, 25)))
    print({'precision': mp.mp.dps, 'completed': count,
           'nonpositive_values_or_nondecreasing_slopes': failures,
           'status': 'diagnostic only; no proof'})


if __name__ == '__main__':
    main()
