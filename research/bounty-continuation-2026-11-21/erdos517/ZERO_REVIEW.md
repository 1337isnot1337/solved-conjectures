# Independent review of the Erdős 517 zero-persistence note

21 November 2026. The reviewed author file is
[the target audit and zero-persistence note](target-and-zero-persistence.md),
SHA-256 `209eb0253343a2c2974d8ae09f16c0224941d92fcf683c1a6ad70c75fc70169d`.
The coordinating agent checked the argument independently and inspected
the relevant original PDF page. The result is a partial obstruction to a
proposed construction. It does not settle Erdős 517.

## The exact source check

The decisive source is T. Murai,
[*The deficiency of entire functions with Fejér gaps*](https://www.numdam.org/item/10.5802/aif.930.pdf),
Annales de l'Institut Fourier 33 (1983), 39–58, section 5.
The web text extraction lost inequality strokes and superscripts at two
places material to the proof. I downloaded the complete 21-page primary
PDF and rendered PDF page 16, printed page 53, locally with Poppler.
The visual check establishes the following exact readings:

1. Equation (30) preserves zero counts on the unprimed circles
   $`r_\ell`$ for every $`0\le\ell\le m`$. The upper endpoint is
   included.
2. The subsequent choice of $`r'_m>r_m`$ makes $`g_m`$ nonzero on
   the complement of the disk of radius $`r'_m`$. Thus this disk
   contains every zero of the polynomial.
3. The next unprimed radius is $`r_{m+1}=r'_m+1`$.

These observations resolve the index issue. The review does not rely on
inferring a missing inequality from the later deficiency calculation.
The source PDF and rendered page were inspection intermediates, not new
research deliverables.

## The elementary lemma

Let nonzero polynomials $`p_j`$ converge locally uniformly to a nonzero
entire function $`F`$. Suppose that, for each $`m`$, the sufficiently late
polynomials have at least $`d_m`$ zeros in a fixed disk of radius $`R_m`$,
where $`d_m\to\infty`$.

Fix $`m`$ and choose $`R>R_m`$ with no zero of $`F`$ on the circle of
radius $`R`$. Such a radius exists because the zeros of a nonzero entire
function are isolated. Uniform convergence on that circle and Rouché's
theorem give

```math
n(R,F)=n(R,p_j)\ge n(R_m,p_j)\ge d_m
```

for all sufficiently large $`j`$. Hence the total zero count of $`F`$
is unbounded. Each zero has finite multiplicity, so $`F`$ has infinitely
many distinct zeros. Choosing the slightly larger circle is necessary
to avoid assuming that the limiting function is nonzero on the original
preservation circles. The author's proof does this correctly.

## Applying it to Murai's construction

Write $`D_m=\deg g_m`$ for the actual polynomial degree. The function
$`h_m`$ is $`g_m`$ multiplied by a zero-free exponential, so they have
the same zeros. Since $`r_{m+1}>r'_m`$,

```math
n(r_{m+1},h_m)=n(r_{m+1},g_m)=D_m.
```

Apply equation (30) at stage $`m+1`$, using its permitted index
$`\ell=m+1`$. It yields

```math
n(r_{m+1},g_{m+1})=D_m.
```

At each later stage, the same radius remains among the permitted indices.
The exponential multipliers introduce no zeros. Induction therefore gives

```math
n(r_{m+1},g_j)=D_m\qquad(j\ge m+1).
```

The actual degrees tend to infinity independently of any ambiguity about
truncating at a zero coefficient. All coefficients used in the
construction are nonnegative and the constant coefficient is one.
Equations (28) and (31) ensure that $`g_{m+1}`$ retains the positive
coefficient at degree $`q_m>d_m\ge D_m`$ introduced by the latest
exponential factor. There is no cancellation. Thus $`D_{m+1}>D_m`$.

The polynomials converge locally uniformly by the estimates in section
5.2, and their limit has constant coefficient one. The lemma applies
with $`R_m=r_{m+1}`$ and $`d_m=D_m`$. The limit has infinitely many
distinct zeros. Its deficiency-one property does not say otherwise:
deficiency controls a normalized growth comparison, not the finiteness
of the zero set.

This rules out the proposed counterexample at zero while these
preservation conditions are retained. It does not rule out every
possible sparse entire-function construction.

## The unresolved analytic statement

The reduction to $`P\exp(g)`$ is exact. If an entire function takes a
value only finitely often, factor those finitely many zeros with their
multiplicities into a polynomial. The remaining entire zero-free factor
has an entire logarithm. Conversely, a transcendental $`P\exp(g)`$
with Taylor-support density zero would have a value with finitely many
preimages and would refute the full target. Changing the constant
coefficient changes neither support density nor this equivalence.

For an increasing infinite support sequence $`n_k`$, the condition
$`n_k/k\to\infty`$ is equivalent to its counting function being
$`o(x)`$. Thus the author's remaining statement is the full required
analytic obligation, with arbitrary entire $`g`$. Restricting $`g`$ to
a polynomial would return to a known finite-order case.

The review passes the zero-persistence lemma, its now visually checked
application, and the exact remaining-obligation statement. It supplies
no proof for arbitrary transcendental $`g`$, no Lean verification, and
no new completed bounty problem.
