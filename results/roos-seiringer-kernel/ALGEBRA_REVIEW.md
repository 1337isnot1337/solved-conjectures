# Independent mathematical review

Reviewer: algebra agent. Date: 21 November 2026.

**Outcome:** the written proof and exact certificate pass this independent
review. No mathematical gap was found. This is an internal review, not journal
refereeing, and it does not replace the separate search for prior resolutions.

## Source fidelity

I read the published primary HTML directly:
[Roos and Seiringer, BCS Critical Temperature on Half-Spaces](https://link.springer.com/article/10.1007/s00205-025-02088-x).
Lemma 5.1 gives exactly the four summands used in the proof. The paragraph after
the two figures states the unresolved nonnegativity assertion for the radial
Dirichlet kernel. This is the spherical average from equation (5.1), not the
unaveraged kernel and not the Neumann kernel.

Equation (5.2) of the source gives

```math
m_3^D(r;\mu)=\mu^{-1/2}m_3^D(\sqrt\mu\,r;1).
```

Consequently the proved positive-real assertion at parameter one covers every
positive chemical-potential parameter by this positive scaling factor. The
source's local coefficient in equation (5.4) agrees with the proof's leading
term $`2x^2/9`$. That local expansion was already known and is correctly not
presented as the new result.

## Integral identity and entire series

I derived the formula for $`J'`$ independently before seeing the full draft.
The logarithm at the lower endpoint is integrable; the derivative integral
converges uniformly on each compact positive interval by the Dirichlet test.
Using the primitive $`(\cos y-\cos(yk))/y`$ removes the lower boundary term.
After partial fractions, the shifted common tail is
$`\sin y\int_2^\infty\sin(yu)\,du/u`$. This gives exactly

```math
J'(x)=\frac{\cos(2x)\mathop{\mathrm{Cin}}(4x)
+\sin(2x)(\pi-\mathop{\mathrm{Si}}(4x))}{4x}.
```

I also independently checked the two subsequent expansions. Pairing the
positive and negative halves of the integral in equation (4) yields the odd
harmonic numbers. The second trigonometric combination has coefficient
$`-H_{2k}/2`$ because

```math
\int_0^1\frac{t^{2k+1}-1+(1-t)^{2k+1}}t\,dt=-H_{2k}.
```

Combining these gives both coefficients in equation (1), including the two
vanishing odd coefficients. The factorial denominators justify the stated
compact convergence. The series is the entire continuation of the formula
from the positive axis; the proof does not incorrectly assert that the
original even integral $`J(x)`$ itself is entire at zero.

## Small and large arguments

The rational identity for $`B_{k+1}-B_k`$ is correct. Its lower estimate gives
monotonicity, and the direct values give $`1/9\le B_k<1`$ for $`k\ge3`$.
The two alternating-term ratio bounds are valid. The resulting terms are
exactly $`\pi x^4/18`$, $`-2\pi x^6/225`$, and $`-x^7/405`$. Their lower
estimate is the displayed $`557x^4/4050`$.

For the large tail, the truncated positive arccoth expansion can be integrated
termwise from below. The integration-by-parts bound on its oscillatory
integral is $`H/x`$, including both the endpoint and total-variation terms.
The resulting bound on $`J`$, the estimates on the sine/cosine tails, and the
inequality $`|\sin x\cos x|\le1/2`$ give exactly the function $`G`$ in
equation (12). I checked its derivative, its positive derivative lower bound,
and the rational value at forty. The finite positive exponential sums certify
the two logarithmic bounds used later.

The proof covers the entire two unbounded ends of the domain analytically.
Neither tail is inferred from sampled values.

## Derivative bound and exact computation

Differentiating the expression for $`F`$ gives the formula in §4: the
derivatives of Si and Cin cancel because
$`R'(x)=-\sin(2x)/x`$ and
$`(\mathop{\mathrm{Cin}}(2x))'=2\sin^2x/x`$. The bounds used there yield
$`|F'(x)|\le27/2+b/2<14+b/2`$ on each tested interval.

The absolute series tail after index 160 is at most
$`22\,80^{322}/322!`$. The ratio estimate applies from the first omitted
term onward. The checker verifies its strict comparison with $`2^{-128}`$
using integers.

I inspected each interval operation in `verify.py`:

- Lower endpoints are rounded downward and upper endpoints upward, including
  products of intervals with negative endpoints.
- All coefficient multipliers passed to `scale` are nonnegative rational
  numbers. Alternating signs are handled by interval subtraction.
- The arctangent intervals retain the sign of the first omitted term.
  Machin's identity then gives an enclosing interval for pi.
- Series truncation error is added at both endpoints after evaluation.
- The accepted margin subtracts the ceiling of the full derivative loss,
  so its positivity certifies every point of the closed interval.
- Both closed children replace every subdivided parent. The final sorted
  leaves have matching adjacent endpoints, outer endpoints one and forty,
  and total length exactly thirty-nine.

All calls made by the executable use integers and `Fraction`; no approximate
numeric value is used as an enclosure or as an acceptance criterion.

## Independent replay

Running the package's verifier from scratch returned:

| Item | Result |
|---|---:|
| Certified closed intervals | 184 |
| Midpoint evaluations | 367 |
| Maximum subdivision depth | 11 |
| Arithmetic precision | 384 binary fractional bits |
| Retained series index | 160 |

The exact minimum-margin numerator and denominator match `PROOF.md` and
`check-output.json`. The independently reproduced sorted-leaf hash is
`7bf6b5aa90b010e4f66872bdbb4c4110ada7a0e2f55528f86dcfa86c5a107166`.

The only requested edits were a typographical comma in the derivation of
equation (4), and an explicit sentence applying the source's scaling law to
all positive parameter values. Neither changes the proof or certificate.
