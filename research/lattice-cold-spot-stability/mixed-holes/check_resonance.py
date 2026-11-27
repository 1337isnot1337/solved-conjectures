"""Direct local minimization for finite shell models bracketing exact resonance."""

from decimal import Decimal as D, localcontext


def solve(t, outer_count):
    # Both finite point configurations have the four axis vectors of length 1.
    # The balanced comparator adds two opposite diagonal vectors of length sqrt(2).
    # The moving competitor adds (+1, 1), (-1, 1), then up to two outer points.
    # Reflection in the vertical axis forces the unique nearby minimizer onto it.
    q = (-t).exp()
    root3 = D(3).sqrt()
    heights = [0, 0, 1, -1, 1, 1] + [root3, -root3][:outer_count]
    gaps = [0, 0, 0, 0, 1, 1] + [2] * outer_count

    def value_and_derivative(y):
        value = D(0)
        derivative = D(0)
        for height, gap in zip(heights, gaps):
            term = (-y * y / t - t * gap + 2 * height * y).exp()
            value += term
            derivative += 2 * (height - y / t) * term
        return value, derivative

    left, right = -q, D(0)
    if not value_and_derivative(left)[1] < 0 < value_and_derivative(right)[1]:
        raise ValueError("Stationary point is outside the expected bracket")
    for _ in range(140):
        mid = (left + right) / 2
        if value_and_derivative(mid)[1] < 0:
            left = mid
        else:
            right = mid
    y = (left + right) / 2
    balanced_value = 4 + 2 * q
    return y / q, (value_and_derivative(y)[0] - balanced_value) / q**2


def main():
    with localcontext() as ctx:
        ctx.prec = 110
        for t in map(D, (12, 24, 48, 72)):
            results = []
            for k in (0, 1, 2):
                y_scaled, difference = solve(t, k)
                q = (-t).exp()
                curvature_factor = 1 / (1 - 1/t)
                if abs(difference - (k - curvature_factor)) > 10 * q:
                    raise ValueError(f"Energy expansion failed at t={t}, k={k}")
                if abs(y_scaled + curvature_factor / 2) > 10 * q:
                    raise ValueError(f"Displacement expansion failed at t={t}, k={k}")
                if (difference > 0) != (k == 2):
                    raise ValueError(f"Unexpected ordering at t={t}, k={k}")
                results.append(difference)
            print(f"t={t}, e^(2t) times the three differences:",
                  ", ".join(f"{x:+.12f}" for x in results))


if __name__ == "__main__":
    main()
