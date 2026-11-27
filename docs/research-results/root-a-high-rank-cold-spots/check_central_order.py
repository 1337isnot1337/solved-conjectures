"""Exact adjacent level comparisons for A_(N-1) with both parities.

The weights here use unshifted integers and the sum constraint directly.
All rounding in the omitted-tail bound is outwards.
"""

from math import lcm

from check_displaced import displaced_mass


def constrained_masses(ncoords, scale, radius):
    """Integer masses for all coordinate sums in the box [-R,R]^N."""
    weights = [(z, 1 << (scale * (radius**2 - z**2)))
               for z in range(-radius, radius + 1)]
    lower = {0: 1}
    for _ in range(ncoords):
        updated = {}
        for total, mass in lower.items():
            for z, weight in weights:
                key = total + z
                updated[key] = updated.get(key, 0) + mass * weight
        lower = updated
    # Sum over Z of 2^(-s z^2) < 3, bounded here by 4.
    # The omitted sum over both signs is at most 4*2^(-s(R+1)^2).
    # A union bound chooses one of N bad coordinates and frees all others.
    tail_exp = scale * (ncoords * radius**2 - (radius + 1)**2)
    prefactor = 4 * ncoords * 4 ** (ncoords - 1)
    if tail_exp >= 0:
        upper_error = prefactor << tail_exp
    else:
        denominator = 1 << (-tail_exp)
        upper_error = (prefactor + denominator - 1) // denominator
    return lower, upper_error


def check(ncoords, scale):
    radius = 10
    lower, error = constrained_masses(ncoords, scale, radius)
    half = ncoords // 2
    for k in range(half):
        # The scaled unshifted mass at k is lower[k] plus a nonnegative
        # tail of at most error. The coset mass multiplies it by
        # 2^(s*k^2/N). Raising to N clears all fractional powers.
        upper_next = ((lower[k + 1] + error) ** ncoords) << (scale * (2*k + 1))
        if lower[k] ** ncoords <= upper_next:
            raise ValueError(f"uncertified adjacent levels N={ncoords}, k={k}, s={scale}")
    return half


def compare_restricted_translates(ncoords, scale):
    """Test both parities and off-center fractions near an actual deep class."""
    denominator = 2 * ncoords
    middle = ncoords // 2
    base = [2 * middle - denominator] * middle + [2 * middle] * (ncoords - middle)
    _, base_upper, base_exponent = displaced_mass(ncoords, scale, denominator, base, 9)
    samples = []
    for shift in (-3, -1, 1, 3):
        common = 2 * middle + shift
        samples.append([common] * (ncoords - 1) + [-(ncoords - 1) * common])
        paired = base.copy()
        paired[0] += shift
        paired[-1] -= shift
        samples.append(paired)

    for offsets in samples:
        lower, _, exponent = displaced_mass(ncoords, scale, denominator, offsets, 9)
        power = lcm(exponent.denominator, base_exponent.denominator)
        left = (1 << int(power * base_exponent)) * lower ** power
        right = (1 << int(power * exponent)) * base_upper ** power
        if left <= right:
            raise ValueError(f"uncertified N={ncoords} translate {offsets}")
    return len(samples)


def main():
    sizes = range(2, 23)
    scales = (1, 2, 3, 5, 8)
    count = sum(check(ncoords, scale) for ncoords in sizes for scale in scales)
    print(f"{count} strict consecutive scalar-coset inequalities")
    print(f"Ranks 1 through 21; alpha/log(2) in {scales}")
    # In these samples 2*alpha/log(2) equals the common grid denominator.
    restricted = sum(compare_restricted_translates(n, n) for n in (4, 5, 6, 7))
    print(f"{restricted} complete mass comparisons at one-outlier or paired displacements")


if __name__ == "__main__":
    main()
