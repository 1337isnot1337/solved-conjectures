# Scope and independent audit

The exact target is [Dilcher–Kidwai–Tomkins, Conjecture 3.1](https://doi.org/10.5486/PMD.2017.7620), also [Altizio, Conjecture 1](https://arxiv.org/html/2511.03847v1). Altizio proved nonvanishing on the closed disk centered at 2 with radius 1; that is not the full half-plane. The sharpness of the boundary is already noted by the original authors. Neither is claimed as a separate result.

The independent audit checked the run-length continuant, the phased tridiagonal criterion, the exterior and near-one estimates, the exact enclosure tests and analytic truncation for unbounded run lengths. It reran the C++ checker with undefined-behavior sanitization. The checker certified 1,318 leaves after 456 subdivisions, with 51 additional analytically covered boxes, at maximum depth 15. This checks a compact region of the complex plane, not a finite set of sample points or Stern-polynomial degrees.

No Lean verification, external review or absolute priority claim is made.
