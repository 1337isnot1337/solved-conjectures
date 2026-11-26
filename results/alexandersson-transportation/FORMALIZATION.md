# Lean verification of Alexandersson’s transportation counterexample

Lean proves the original real-rootedness conjecture false. The witness is the classical transportation polytope with row margins $(1,1,12)$ and column margins $(2,1,\ldots,1)$. Its affine dimension is 24. Both margin vectors contain an entry greater than one, and there is a single table in which all 39 cells are positive. The unique Ehrhart numerator has degree twelve, ten distinct real roots and exactly two nonreal complex roots, counted with multiplicity. [Original conjecture](https://github.com/PerAlexandersson/RealRooted/issues/2627) · [Counterexample](../../lean/Conjectures/TransportationTheorems.lean) · [Integral convex hull](../../lean/Conjectures/TransportationLatticeHull.lean).

## The polytope and its numerator

For every $m\ge2$ the proof identifies the real matrix polytope as a convex hull of finitely many nonnegative integral tables by grouping permutation matrices. It proves that its actual affine dimension is $2m$. Projection onto the first two rows in the small columns is injective on the direction space. Differences of explicit integral points realize every coordinate direction. [Unit slots and margins](../../lean/Conjectures/TransportationSlots.lean) · [Dimension proof](../../lean/Conjectures/TransportationVertices.lean).

For each integer $k\ge0$, the number $L_m(k)$ counts integer points in the scalar dilate $kT_m$. Choosing the top two rows determines the third. An inadmissible pair overflows exactly one small column, and the remaining entries determine the pair. This yields

```math
L_m(k)=\binom{k+m}{m}^{2}-m\binom{k+2m-1}{2m}.
```

A finite Vandermonde identity relates the square to the shifted binomial basis. In the formal power series ring over the reals, Lean proves

```math
(1-z)^{2m+1}\sum_{k\ge0}L_m(k)z^k
=H_m(z)=\sum_{j=0}^m\binom mj^2z^j-mz.
```

The proof counts actual integer arrays and identifies the Ehrhart numerator using the affine dimension. Guan and Jin previously obtained the same polynomial for the corresponding edge polytope. [Counting every dilation](../../lean/Conjectures/TransportationEhrhartCount.lean) · [Finite binomial identity](../../lean/Conjectures/TransportationBinomial.lean) · [Integer points and power series](../../lean/Conjectures/TransportationLattice.lean) · [Guan–Jin, Theorem 53](https://arxiv.org/abs/2201.12531).

## Exact roots of the witness

Every split real polynomial $p$ satisfies $(p')^2-pp''\ge0$ on the real line. The Lean proof uses the product rule, which also covers points where the polynomial vanishes. At $x=-1/5$ the reported witness satisfies

```math
5^{22}\bigl((H'_{12})^2-H_{12}H''_{12}\bigr)(-1/5)
=-389210787898375728.
```

Eleven rational cuts exhibit ten distinct negative real roots. A degree-twelve polynomial with that many real roots and a strictly negative Laguerre expression has exactly ten real roots with multiplicity. Filtering the roots of the complex polynomial by their imaginary parts then gives exactly two nonreal roots. [Laguerre inequality](../../lean/Conjectures/TransportationLaguerre.lean) · [Exact rational values](../../lean/Conjectures/TransportationPolynomial.lean) · [Ten sign intervals](../../lean/Conjectures/TransportationTwelveRoots.lean) · [Complex roots](../../lean/Conjectures/TransportationComplexRoots.lean).

The original checker computed 25 dilation counts and obtained the same root count by a rational Sturm chain. A separate checker enumerated 351,163 integral tables across 30 small dilations and checked all ten sign intervals. [Original margin checker](check.py) · [Independent enumeration](check_dilations.py).

For the finite counterexample, two independent runs compiled all 19 modules with warnings treated as errors and audited 319 declarations, including 258 theorems, 5 private declarations and all 94 named endpoints. Both replayed the pinned stock Lean kernel. The axiom audit found only propositional extensionality, classical choice and quotient soundness. [Verification receipt](verification/lean-receipt.json).

## Nonreal roots throughout the family

Let $N_m$ count the complex roots of the unique Ehrhart numerator whose imaginary part is nonzero, with multiplicity. Whenever $m>16$ and $\log m\ge32$, Lean proves the effective bound

```math
\sqrt{m\log m}\le96\pi\,(N_m+5).
```

Consequently $N_m\ge\sqrt{m\log m}/(192\pi)$ for every sufficiently large integer $m$. The theorem quantifies over the numerator determined by the actual lattice-point counts. It also proves that these polytopes have affine dimension $2m$ and admit a table positive in every cell. [Effective estimate](../../lean/Conjectures/TransportationNonrealGrowth.lean) · [Polytope theorem](../../lean/Conjectures/TransportationGrowthTheorems.lean).

In the coordinate $x=(1-z)/(1+z)$, the unperturbed binomial polynomial is $(1+z)^m P_m(x)$, where $P_m$ is the Legendre polynomial normalized by Rodrigues’ formula. Its differential equation and midpoint coefficients give a decreasing energy and an explicit bound on its size. This proves positivity of the perturbed numerator on the interval from $-\log(m)/(16m)$ to $-\log(m)/(32m)$. [Polynomial transform](../../lean/Conjectures/TransportationLegendreExpansion.lean) · [Energy bound](../../lean/Conjectures/TransportationLegendreBound.lean) · [Positivity interval](../../lean/Conjectures/TransportationWindowSuppression.lean).

Sturm comparison with a sine wave produces disjoint closed intervals containing distinct zeros of the unperturbed polynomial. Local applications of Rolle’s theorem count roots with multiplicity on the central interval and its two exterior rays. The two polynomials have the same second derivative, which bounds the number of real zeros that can remain after the perturbation. [Sturm comparison](../../lean/Conjectures/TransportationSturmInterval.lean) · [Distinct root witnesses](../../lean/Conjectures/TransportationWindowOscillation.lean) · [Rolle count](../../lean/Conjectures/TransportationRootDeficit.lean).

An independent rational checker reconstructed 33 polynomial differential equations, 198 exact coordinate substitutions and 660 energy identities. Rational Sturm chains found 2, 2, 2, 4, 6 and 6 nonreal roots at degrees 12, 16, 24, 32, 48 and 64. [Independent checker](check_growth.py).

Two independent runs strictly compiled all 33 modules and audited all 487 declarations, including 407 theorems, 5 private declarations and all 181 registered endpoints. Both completed stock Lean kernel replay. Only propositional extensionality, classical choice and quotient soundness occurred in the axiom audit. [Complete verification receipt](verification/growth-receipt.json).

If you use this disproof, please credit Cinna Davis and GPT-6.2 Astra for the proof, Per Alexandersson for the question, and Xiaxia Guan and Xian’an Jin for the earlier numerator formula. Please cite the site and the specific proof you used. [Cinna Davis](https://itsdavis.com/) · [Written proof](https://github.com/1337isnot1337/solved-conjectures/blob/87cab4199ab82b132c844ef6d52fee65b082a6be/results/alexandersson-transportation/proof.md).
