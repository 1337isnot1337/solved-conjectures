# Gessel–Lin–Zeng: follow-up on the insertion route

Status: unresolved. This note supplements the existing research/gessel-lin-zeng package; no finite positive check is counted as a result.

## Full recent source now inspected

The complete primary PDF of Ma–Wang, arXiv:2610.03111 (2 October 2026), became accessible and Section 4 was read in full:
https://arxiv.org/pdf/2610.03111

Their Lemma 3 preserves strict interlacing under paired insertion operators S_L and S_(L+1), or under two copies of S_L. The five established families use common interleavers whose underlying word lengths differ by zero or one. Extending the same construction to arbitrary deletion counts produces larger or oppositely signed length differences, outside the lemma. Thus copying the induction is not a proof of the remaining cases.

## A transformed recurrence

With the normalization and insertion operator in the existing package, set

```math
h_{k,i}(t)=(1+t)^{2k-i} A_{k,i}\left(\frac{t}{1+t}\right),
\qquad
D_j=t(1+t)\frac{d}{dt}+1+jt.
```

For one deletion set S, its transformed polynomial is obtained from 1 by applying D_j once when j is deleted and twice when j is retained, in increasing order of j. The aggregate recurrence therefore becomes

```math
h_{k,i}=D_k\left(D_k h_{k-1,i}+h_{k-1,i-1}\right).
```

This removes the dependence of the differential operator's coefficient on i. The extra degree in the homogenizing exponent accounts for a common factor 1+t. Negative roots in the original variable correspond to roots in (−1,0).

The simplification does not supply a stability invariant. The plain generating polynomial sum_i h_(k,i)(t)y^i is already not real-stable at k=2: specializing t=1 gives 220+76y+8y², whose discriminant is −1264. Thus a direct bivariate-stability induction using this generating function is invalid.

## Common-interleaving diagnostic and gap

A numerical diagnostic of all individual deletion-set polynomials for k=4 through12 and i=floor(k/2) found a common interlacing in every tested family. Those floating-point root calculations are only evidence for a proposed stronger invariant and are not a certificate or mathematical result.

An adjacent local swap of retained/deleted barred letters gives a simple operator difference. Starting from word length L, the retained-then-deleted construction is

```math
S_{L+3}S_{L+1}S_L,
```

whereas deleted-then-retained is

```math
S_{L+3}S_{L+2}S_L.
```

Their difference on f is S_(L+3)(x S_L f). This suggests root ordering under swaps. Root ordering alone does not prove a common interlacing: interlacing is not transitive, and the extreme deletion patterns may move roots across an entire gap. No bound closing that gap has been proved.
