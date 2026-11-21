proof.all(True)
for coefficients, expected in (([0,0,1,-48,112], [-4,8]), ([0,0,1,-54,-88], [-6,-2,12,40,48])):
    curve = EllipticCurve(QQ, coefficients)
    points = curve.integral_points(both_signs=True)
    xs = sorted(set(point[0] for point in points))
    assert xs == expected
    print(coefficients, "rank", curve.rank(), "integral x", xs, flush=True)
