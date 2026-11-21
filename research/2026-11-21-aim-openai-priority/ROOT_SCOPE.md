# Root scope review of the additional archives

Date: 21 November 2026. Scope: Brown–Mol, Kovalev, and Johnson, including the closest general Pfaffian statements. This is a bounded source comparison, not a guarantee of exclusive priority.

The reviewed snapshots are [MColbrook/AIM at b2ec0fac559f532fc0ed04fce81deea0ce07c68b](https://github.com/MColbrook/AIM/tree/b2ec0fac559f532fc0ed04fce81deea0ce07c68b) and [openai/math at 4eaee87548250b2682affda7d05d947c05554bae](https://github.com/openai/math/tree/4eaee87548250b2682affda7d05d947c05554bae). Complete regular UTF-8 bodies were scanned, with matching files retained in full. The PDF supplement used complete text extractions. Plausible mathematical statements and hypotheses were read; catalogue titles alone were not treated as evidence of scope.

## Brown–Mol

The target is Conjecture 4.2 of arXiv:1810.08655v1, restated as Conjecture 5.1 of arXiv:2608.07898v2: the translated-annulus assertion for zeros of every tree's subtree polynomial. The proposed disproof concerns the inner circle and supplies an infinite family of trees, rather than a finite search record.

Neither archive has a match to the source identifiers, author combinations, subtree-polynomial phrases, or translated-annulus phrases in the documented configuration. This remains true of the AIM embedded sources and both PDF supplements. This is a lexical result within these snapshots. It does not exclude a differently phrased theorem with none of those strings. The earlier ArtificialZeng diameter-at-most-three result remains explicitly credited as partial and distinct from the diameter-four counterexample family.

## Kovalev

The target is the lower Hardy-dual-norm inequality of arXiv:2607.17373v1, Conjecture 6.1, for arbitrary real matrices. It is unrelated to the harmonic-annulus and Sobolev-homeomorphism problems involving the same author.

### AIM

The eleven native matching files and eight supplementary matching records concern those other subjects or repeat their catalogue history. The main mathematical sources read are:

- `problems/153-ball-evans-three-dimensions.md` and `problems/154-elastic-energy-approximation.md`: approximation of Sobolev homeomorphisms, with Iwaniec–Kovalev–Onninen's planar approximation theorem as a precedent.
- `problems/949-does-a-smooth-target-make-energy-minimal-planar-deformations-c-1.md` and its status audit: regularity of planar energy-minimizing deformations and Hopf–Laplace maps.
- `research/solutions/689-a-sharp-affine-modulus-bound-for-harmonic-homeomorphisms/main.tex` and `main.pdf`: a perturbative counterexample to Iwaniec–Kovalev–Onninen's affine modulus bound for harmonic homeomorphisms of annuli. The abstract and actual problem statement concern affine capacity and planar annulus modulus, not a spherical-average matrix norm or its trace dual.

None states the matrix Hardy-duality inequality. The matching ZIP entries duplicate these planar problem statements and historical catalogue records.

### OpenAI

Six native matches belong to three manuscripts, and the PDF supplement has the same three manuscripts:

| Manuscript | Actual matched mathematical content | Comparison |
|---|---|---|
| *Arithmetic classification and non-Pisot singularity for Bernoulli convolutions*, 3 October 2026 | The prescribed-initial-coefficients lemma cites Gorodetsky and **Valeriya Kovaleva** on prime polynomials over finite fields. | A different author and a different arithmetic theorem. |
| *Strong diffeomorphic approximation in three dimensions for 1 ≤ p ≤ 2*, 24 September 2026 | Sobolev approximation of homeomorphisms; the introduction cites Leonid Kovalev's earlier planar result. | No matrix Hardy norm or trace-duality assertion. |
| *Strong diffeomorphic approximation in three dimensions for p > 2*, 24 September 2026 | The main theorem approximates a bounded-domain three-dimensional Sobolev homeomorphism by smooth diffeomorphisms with the same target. | No matrix Hardy norm or trace-duality assertion. |

The relevant native files are the first manuscript's `build/classification.tex` and bibliography, and the latter two manuscripts' `build/sections/01-introduction.tex` and bibliographies. Their statements and matching PDF passages were compared. No new prior resolution of the target was found.

## Johnson

The target is the whole of arXiv:2610.24371v1, Conjecture 7.1: every positive nonincreasing log-convex distance kernel on every finite even ordered real configuration has Pfaffian at least every perfect-matching product. The proposed proof uses Johnson's existing additive-interval endpoint inequality and uncrossing reduction; those are credited antecedents.

### AIM

Twelve native files contain broad Pfaffian matches. The supplement has none. The actual contexts concern Payne buckling eigenvalues, the CFN sunlet ideal, six-vertex models and alternating-sign matrices, KPZ point processes, graph Pfaffian orientations, o-minimal Pfaffian geometry, and *Metric–Pfaffian Stabilizers and Fixed-Hodge Field Recovery*. None states a positive decreasing log-convex distance-kernel comparison. No source-identifier, Kalmanson, or author-handle match occurs.

The matches are principally search and routing records. They were not accepted as proofs in themselves. Their named mathematical subjects do not establish the required matrix assertion, and the separate direct-source audit covers the plausible kernel and spin-model antecedents.

### OpenAI: native and PDF findings

The broad Pfaffian search has 113 native matches and 26 PDF matches. There is no exact Johnson identifier, author-handle, or Kalmanson match. Of the native matches, 47 are formal-source files. Their statement text was inspected for prior mathematical scope; no formalization was developed or executed. They concern special strip-kernel identities, quaternionic Moore determinants, curvature tensors, and Bass-trace exterior identities. In particular, positivity of the signed Moore determinant assumes a positive-definite quaternionic Hermitian matrix. It does not identify Johnson's skew distance matrices with that class or give their matching-product bound.

The nonformal matches were compared by mathematical subject:

- The perfect-matching approximation manuscript cites classical Pfaffian enumeration of planar graph matchings. The paired-state manuscript concerns Pfaffian graph orientations and Hamiltonian paths. Neither asserts the weighted complete-matrix inequality here.
- The Pixton/Chow, quartic-torus, cubic-fourfold, Quillen, BSD, Weil-class, and Hodge passages use algebraic Pfaffians, exterior identities, or special varieties. Their matched formulas and hypotheses give no distance-kernel positivity theorem.
- The two Bass manuscripts use Pfaffian cocycles or curvature estimates. The `build/sections/06-curvature.tex` theorem in the ℓ¹-Bass manuscript is an **upper bound** on an averaged absolute curvature Pfaffian. Its finite-dimensional estimate is a determinant/Hadamard bound in terms of singular values. It is not the positive matching-product lower bound.
- The planar polynomial limit-cycle manuscript uses Pfaffian functions in the sense of real analytic differential systems, not matrix Pfaffians.
- The double-dimer manuscript cites standard exact planar enumeration.

The closest analytic comparisons require more than this subject classification. They were read in their mathematical context, as follows.

### Special honeycomb kernels

In *Marked polygon correlations and one-arc bounds*, `build/sections/03_denominator.tex`, the full denominator theorem and proof compare

```math
f(u)=\frac{\sinh u}{\cosh u+d},\qquad f_0(u)=\tanh(\gamma u/2)
```

on specified imaginary sites. Their explicit Fourier representations give an exterior-power integral with a fixed-sign exponential determinant. The ratio is an expectation of a product of specified spectral multipliers. The lower bound concerns the resulting normalized vacuum denominator and its logarithmic growth. Its hypotheses include those specific odd kernels and their spectral measures; positive nonincreasing log-convex distance kernels are not identified with them.

In *Cylinder amplitudes and logarithmic bridge-length windows on the honeycomb lattice*, `build/sections/09.tex`, the two-port comparison likewise assumes the explicit positive Fourier-weight comparison from its calibration. Replacing that measure by a reference measure produces a hyperbolic-tangent Pfaffian evaluated by Schur's identity. It compares these two special kernels; it does not supply an arbitrary-kernel matching-product inequality.

In *Uniform marked polygon estimates and sharp finite-bridge moments*, `build/sections/saturation.tex`, the physical normalization compares specified cotangent and tangent kernels. The confluent comparison becomes a Gram determinant with a particular density and multiplier. Schur's Pfaffian identity evaluates the reference kernel. This is a distinct special-function determinant calculation. The companion shifted comparison in `build/sections/magnetic.tex` has the same explicit positive-pole-density hypothesis.

The related strip, disk-transfer, polynomial-vacuum, signed-cylinder, and radial-transfer papers use those rational/trigonometric strip kernels, their cleared polynomial Pfaffians, and corresponding physical walk observables. The complete matching PDF texts were searched for general kernel, positivity, lower-bound, log-convexity, and circular-interval statements. The closest lower-bound passages agree with the special Fourier/Gram comparisons just described. They do not give the required class inclusion or all-matching conclusion.

### Ising hypotheses

The analysis reviewer separately read the actual Pfaffian passages in the bulk-Ising, weak-interaction SLE3, and disordered FK–Ising manuscripts; see [ANALYSIS_SCOPE.md](ANALYSIS_SCOPE.md). Their statements concern physical boundary-spin correlations or the particular continuum kernel `1/(x_j-x_i)`. No realization theorem for every positive nonincreasing log-convex distance kernel is supplied. The earlier Johnson-specific primary audit also records a concrete obstruction to silently identifying an arbitrary circular-split normalization with planar Ising boundary correlations.

These results are relevant antecedents and are credited as such. None of the inspected hypotheses supplies the full theorem claimed by the candidate.

## Coverage limits

All conclusions refer to the pinned current trees, their readable native text, the documented PDF conversions, and the expanded AIM archives. No archived code was run. Binary arrays and images were not interpreted, and no OCR was applied. A complete mathematical-equivalence search is impossible to certify by keyword coverage alone. The combined audit records exact counts, hashes, normalization checks, conversion results, and residual exclusions.
