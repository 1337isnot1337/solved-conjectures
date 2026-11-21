"""Verify the polynomial identities in the reduction to two genus-two curves."""
import sympy as sp


def check_branch(parameter, x, first):
    """Take the norm and trace using the indicated quadratic generator."""
    v = sp.Symbol("v")
    if first:
        a = -parameter**2
        h, z = -2 * parameter, v
        generator_square = a**2 - 4 * a
        cubic = 4 * parameter**3 + 48 * parameter**2 - 63
        linear = parameter**2 + 16 * parameter + 2
        coefficient = (parameter + 8)**2
        sextic = -31 * x**6 + 45 * x**4 + 3 * x**2 - 1
        quadratic = coefficient * x**4 - 2 * linear * x**2 + parameter**2 + 4
    else:
        a = 4 - parameter**2
        h, z = 2 * v, parameter * v
        generator_square = -a
        cubic = 4 * parameter**3 - 48 * parameter**2 - 24 * parameter + 257
        linear = 2 - parameter**2 + 8 * parameter
        coefficient = a
        sextic = x**6 - 3 * x**4 - 45 * x**2 + 63
        quadratic = a * x**4 - 2 * linear * x**2 - (parameter - 16)**2

    def reduce(value):
        return sp.rem(value, v**2 - generator_square, v).expand()

    radicand = reduce((a - z)**2 + 4 * (4 * a - 2 * z) * h)
    conjugate = radicand.subs(v, -v)
    assert reduce(radicand * conjugate - 16 * a**2 * cubic) == 0
    trace = reduce(radicand + conjugate)
    w = sp.Symbol("w")
    expected = (4 * parameter**2 * (linear - 2 * w) if first
                else 4 * a * (linear + 2 * w))
    assert sp.expand(trace + 8 * a * w - expected) == 0
    assert sp.expand((coefficient * x**2 - linear)**2 - 4 * cubic
                     - coefficient * quadratic) == 0
    disc = sp.discriminant(quadratic, parameter)
    assert sp.expand(disc - 16 * (1 if first else x**2) * sextic) == 0
    assert sp.gcd(sextic, sp.diff(sextic, x)) == 1
    return sp.factorint(sp.discriminant(sextic, x))


if __name__ == "__main__":
    parameter, coordinate = sp.symbols("parameter coordinate")
    print("First sextic discriminant:", check_branch(parameter, coordinate, True))
    print("Second sextic discriminant:", check_branch(parameter, coordinate, False))
