# Independent review of two Erdős 25 method obstructions

> Subsequent status: the general finite Haar-zeta comparison and its stronger LCM-capacity version are now [disproved](finite-zeta-counterexample.md), with [independent](COUNTEREXAMPLE_REVIEW.md) and [coordinator](COUNTEREXAMPLE_COORDINATOR_REVIEW.md) reviews. The earlier conditional implication and restricted theorems remain valid. Erdős 25 itself remains unresolved. The original argument below is preserved.

21 November 2026. Reviewed sources:

- [Activated-count counterexample](activated-count-bound-counterexample.md), SHA-256 `bc5ef2d479c4734f731827b4451f85e250d1fd979ef378a5396075babe396b02`.
- [Weighted compression and coupling obstructions](weighted-compression-obstructions.md), SHA-256 `aad23593012aa8473553b1053d28e8d59e373867ca2c8c139281c6674f47e6cf`.

## Verdict

Both notes are correct within their stated scope. They refute proposed intermediate estimates or proof mechanisms. They do not refute Erdős 25, and neither refutes the finite zeta-weighted union comparison under investigation. No new-priority or full-bounty claim is justified.

## The short-prefix estimate

For the family of all prime moduli $`p\le y`$ with zero residues, activation is automatic for every positive multiple. At the cutoff $`N=y^2`$, every composite has a prime factor at most $`y`$. Thus the deleted count is exactly

```math
N-1-\pi(N)+\pi(y).
```

CRT gives completed-union density

```math
1-\prod_{p\le y}(1-1/p).
```

I reran the source's exact [checker](check-activated-count-counterexample.py). At $`y=1000`$, it independently verifies the prime list, the direct union count $`921669`$, the composite-count identity, and the integer cross-multiplication proving the complementary density exceeds $`79/1000`$. The proposed right side is then strictly below $`921168`$. The [certificate](activated-count-counterexample.json) remained byte-identical, SHA-256 `3c97dc54359b220376b07632b34c95de61dd3d46ea115b6132d82e4444821ab8`.

For a fixed real error coefficient $`C`$, subtracting the proposed bound gives

```math
N\prod_{p\le y}(1-1/p)-\pi(N)-1+(1-C)\pi(y).
```

The classical Mertens product theorem and prime number theorem cited in the source reduce this to

```math
\left(2e^{-\gamma}-1+o(1)\right)\frac{N}{\log N}.
```

The coefficient is positive. The source's elementary check is valid: $`\gamma\lt H_5-\log5`$ and $`\log10>H_5`$ imply $`\gamma<\log2`$. The stated power-series lower bounds give $`\log10>62/27>137/60=H_5`$. Therefore no fixed multiple of the number of classes repairs this proposed uniform estimate.

The same prime family satisfies the weighted comparison exactly in the required direction:

```math
\frac{1}{\zeta(s)}\sum_{n\in B}n^{-s}
=1-\prod_{p\le y}(1-p^{-s})
\le1-\prod_{p\le y}(1-p^{-1}).
```

The short-prefix failure therefore cannot be reported as a weighted counterexample.

## Prime-coordinate compression

For the single class $`1\bmod6`$, activation gives the terms $`6k+1`$ with $`k\ge1`$. Compressing only the modulo-two coordinate yields residue $`4\bmod6`$, and compressing only the modulo-three coordinate yields residue $`3\bmod6`$. Either change decreases every term of the activated series, while Haar measure stays $`1/6`$. Hence the proposed deficit $`\mu(U)\zeta(s)-F(s)`$ strictly increases under the first compression.

This disproves the specific monotonicity needed by that proposed proof. The classical Rogers union theorem concerns Haar measure; it does not assert monotonicity of this different weighted deficit. A simultaneous change of the whole residue to zero is not excluded.

## Membership-preserving coupling

For moduli $`4,5,6`$ and the residues of $`6`$, the event $`N=6`$ belongs to all three activated classes. Any coupling preserving every individual membership would have to send this event into the single completed class $`6\bmod60`$.

Under the zeta distribution at $`s=2`$, its mass is $`1/(36\zeta(2))`$. The target class has Haar mass $`1/60`$. The integral estimate

```math
\zeta(2)<\sum_{n=1}^{5}n^{-2}+\int_5^\infty x^{-2}\,dx
=\frac{5989}{3600}<\frac53
```

proves that the source event has strictly greater mass. Thus no such coupling exists. Arbitrary dependence between the random variables cannot avoid the event-inclusion inequality.

A union comparison only needs one eligible witness for each deleted integer. It need not preserve every simultaneous membership. The stronger coupling obstruction therefore leaves system-dependent witness allocation open.

## Verification scope

The exact checker verifies one certificate for a false auxiliary bound; it is not a numerical attack on the bounty. The asymptotic family and the compression/coupling examples are written proofs. The unrestricted zeta comparison still needs a global argument, and the unrestricted logarithmic-density problem remains unresolved in these notes.
