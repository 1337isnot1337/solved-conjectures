# Independent audit of Ulgenes’s inverse-gamma Newton-series conjecture

Reviewed on 20 November 2026.

## Verdict and reviewed version

The complete written proof at commit
`23e4fd977103882d7711ef60ef6c287d4e6589ce`,
[`research/ulgenes-inverse-gamma/PROOF.md`](https://github.com/1337isnot1337/solved-conjectures/blob/23e4fd977103882d7711ef60ef6c287d4e6589ce/research/ulgenes-inverse-gamma/PROOF.md),
passes this independent mathematical audit. No gap or required correction
was found. It proves the exact source series on the full real interval,
and also proves local uniform convergence and pointwise absolute
convergence there.

This review does not certify exclusive priority or external peer review.
The separate novelty audit remains responsible for earlier resolutions and
the scope of classical interpolation theorems.

## Primary-source checks

The [default arXiv PDF](https://arxiv.org/pdf/2301.09699) currently serves
version 4, dated 13 March 2025, with the published *Maple Transactions*
layout. I read Conjecture 3.1 on printed page 9. It has the exact nested
coefficient formula reproduced in the proof and the domain above the
minimum of the gamma function. The initial coefficient is two and the
degree-zero term in the displayed outer sum is zero.

The explicit version-4 URL failed in this retrieval, and the publisher
landing and download URLs produced redirect loops. The successful default
arXiv PDF supplies the primary version and exact statement, so these
failures do not leave the statement unchecked.

I also read [Pedersen’s primary preprint](https://arxiv.org/pdf/1309.2167),
Section 2, equation (2), and the beginning of Section 4. The conformal image
of the upper half-plane under the selected branch of log-gamma is exactly
the plane with the stated rightward horizontal slits at nonpositive
integer multiples of pi in the imaginary direction. It contains the upper
half-plane. Section 4 supplies the stated Nevanlinna representation and
vague boundary-measure recovery formula.

## Pick branch and representing-measure support

Taking the inverse of Pedersen’s conformal map on the upper half-plane is
legitimate and yields a Pick function. This is the inverse of log-gamma,
not an unsupported composition argument involving the inverse of gamma
and the exponential function.

At a positive real point beyond the gamma minimum, the derivative of
log-gamma is positive. Its local inverse therefore sends nearby upper
half-plane points into the upper half-plane. Univalence of the original
conformal map identifies that local inverse with the chosen global
inverse. This verifies the correct real branch and its real holomorphic
extension across the full target half-line.

The support restriction for the Nevanlinna measure follows from that real
holomorphic extension. The imaginary parts tend uniformly to zero on
compact subintervals of the extension interval. The primary
measure-recovery formula therefore assigns no measure there. Possible
mass at the left endpoint is allowed throughout the proof.

## Exact interpolation remainder

The rational-kernel identity in equation (6) has the correct sign and
degree. After multiplication by the denominator linear in the evaluation
variable, its difference is a polynomial of degree at most one more than
the interpolant degree. It vanishes at every interpolation node and at the
measure variable. These are distinct because the measure support lies
strictly to the left of all nodes. This proves the identity without an
asymptotic remainder estimate.

For interpolation degree at least one, affine terms are reproduced
exactly. Applying interpolation to the integral uses only finitely many
renormalized kernels, each integrable under the weighted measure
condition. The combined remainder kernel has still faster decay at
negative infinity. It is therefore valid to express the remainder as the
single integral in equation (7).

## Uniform convergence

For a fixed compact interval in the domain, choose enough initial nodes
so that every later node is to its right. Each later product ratio is
bounded by one minus the fixed distance from the compact interval to the
support endpoint, divided by the corresponding node’s distance to that
endpoint. Both distances are strictly positive, and every resulting factor
lies between zero and one.

The finitely many initial factors are absorbed into the constant in
equation (10). Its integral is finite near the support endpoint because all
denominators stay separated from zero, and finite at negative infinity by
the weighted Nevanlinna integrability assumption. Thus the bound is uniform
over the compact interval and over the entire measure support.

For factorial-logarithm nodes, the reciprocal distances have divergent
sum. The comparison with the harmonic-logarithmic series has the correct
direction. The exponential bound in equation (11) therefore tends to zero.
Evaluation at a node is covered as well: the interpolation remainder then
vanishes identically from the relevant stage onward.

## Coefficient matching and absolute convergence

The nodes begin at log of one factorial, which is zero; the next node is
log of two factorial. The corresponding function values are two, three,
and so on. Subtracting the constant two from every divided difference of
positive order replaces the numerator index plus two by the index. Splitting
the product over earlier and later nodes gives exactly the two factorial
ratio products in the source. The Newton basis product becomes precisely
the product of logarithms in Conjecture 3.1 after substitution of log of
the original argument. There is no missing first node or shifted index.

The divided-difference kernel in equation (19) has one negative factor for
each node. Its sign is the stated alternating sign; the first divided
difference also includes the nonnegative affine coefficient. For any
fixed evaluation point that is not a node, the Newton basis has an
eventually fixed parity relative to the divided-difference sign. Hence
all sufficiently late terms have one common sign. Their partial sums
already converge by the uniform-remainder argument, which proves that
the tail is absolutely summable. At a node the tail is identically zero.

No numerical check is required for any of these deductions.
