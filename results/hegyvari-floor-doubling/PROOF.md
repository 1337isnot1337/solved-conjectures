# Hegyvári’s conjecture

**Theorem.** Let `α,β>0`, suppose `α/β∉2^ℤ`, and suppose at least one of `α,β` is not a dyadic rational. The set of positive values
`A={⌊2ⁿα⌋,⌊2ⁿβ⌋: n≥0}\setminus{0}`
is strongly complete: for every finite set `F`, every sufficiently large integer is a sum of pairwise distinct elements of `A\setminus F`.

This proves the full named conjecture, not a new solution of the already established irrational-ratio doubling case of Erdős Problem 354. The argument takes as prior input Jensen Kohlmeyer and Liam Kruer, [*Completeness of two floor-doubling sequences*, version 1](https://hexagonmath.org/pdf/2611.00768v1) (manuscript dated 11 September 2026, posted 21 November), specifically their tower lemmas and common-mark estimate. The new step is extending that method to **all** non-power-of-two rational ratios. For an odd integer ratio the crucial common mark comes from the **integer part** of the ratio, not its fractional digits.

## 1. Exact statement and scope

[Steve Fan, *Strongly Complete sets and a conjecture of Erdős*, arXiv:2607.14071v6](https://arxiv.org/html/2607.14071v6#S1), introduction and Remark 4.2, records the conjecture for the set of positive floor values: when the ratio is not an integral power of two and at least one parameter is not a dyadic rational, the union is complete. He credits Hegyvári with the case of exactly one dyadic parameter and obtains the full conjecture conditionally on the separate sharp-threshold assertion `M₂*=2`. Neither this separate threshold statement nor the variable-base part of Erdős 354 is asserted here. Hegyvári’s relevant earlier papers include [*Some remarks on a problem of Erdős and Graham*, Acta Math. Hungar. 53 (1989), 149–154](https://doi.org/10.1007/BF02170065), and [*On sumset of certain sets*, Publ. Math. Debrecen 45 (1994), 115–122](https://publi.math.unideb.hu/paper/174/download/10_5486_PMD_1994_1404.pdf).

The [public tracker](https://www.erdosproblems.com/354) and [the detailed rational-ratio research inventory](https://erdosproblems.ai/wiki/research/erdos_354/connections) distinguish this strengthening from the prior complete proof for irrational ratio. The latter also reports a partial rational-ratio theorem under a recurrence condition on the digits of the common coefficient, in particular almost everywhere on each rational-ratio line; this is not the all-parameter claim here. We looked for later priority using the exact conjecture, author names, “rational ratio,” “odd integer ratio,” and floor-doubling terminology, and checked the current [Kohlmeyer–Kruer publication record](https://hexagonmath.org/2611.00768v1), whose statement restricts to irrational ratio. No prior unconditional treatment of all rational ratios was found; this is a literature-search statement, not a guarantee of priority.

## 2. What is taken from Kohlmeyer–Kruer

Normalize both parameters to at least one. Write `h_c(n)=⌊2ⁿc⌋`, and `d_c(n)=h_c(n+1)−2h_c(n)∈{0,1}`. Let `P_c` be the finite indexed subset sums of the sequence `h_c`. Refer to the cited version throughout.

Their symmetric condition `D(u,v)` is disjointness, up to reversal, for the empirical binary-name marginals as defined in §3; Lemma 3.1 says it implies `P_u+P_v` cofinite. Their tower-name lift and Proposition 2.2 give an ergodic shift `U` in each empirical tower-name limit, with bounded stage observables dense in L² and refining to later stages without increasing the bound. We use two facts:

1. **Zero-block criterion (Lemmas 3.2 and 3.3(ii)).** If `n_r→∞` and `d_v` vanishes on a block beginning at `n_r` with length tending to infinity, then in every tower-name limit for `v`, `U^{±h_v(n_r)}→I` strongly. Thus `D(u,v)` holds if in each tower-name limit for `u` the only mean-zero vector rigid at times `h_v(n_r)` is zero.
2. **Common-mark criterion (Theorem 6.4 and Proposition 6.5’s limit argument).** Put `m=⌊n/2⌋, L=n−m, t=h_v(n)`, and let `q` be the return query at stage `m` of the `u` tower, meaning `G_{u,m}(q)≤t<G_{u,m}(q+1)`. If for each sufficiently large `n=n_r` there is an integer `k≥0` such that `q` and `q+1` agree at bits `k,k+1,k+2` (indexed from the least significant side, with leading zeroes), the bits at `k,k+1` differ, and `d_u(m+k+1)=1`, then the only mean-zero vector rigid at times `h_v(n_r)` is zero in every tower-name limit for `u`.

For the second fact, Lemma 5.4 gives `q/2ᴸ,(q+1)/2ᴸ→v/u` and `q+1≤2^{n+C}` for fixed `C`, with no irrationality assumption. Also `ε_m→0` and `(n+C+1)w_m→0` for the tower outside measure and level measure. For a bounded stage observable `g`, refine to stage `m`; Theorem 6.4 then yields
```text
‖U⁻¹g−g‖² ≤ 16‖Uᵗg−g‖² + 36‖g‖∞² ε_m + 676‖g‖∞² (n+C+1) w_m .
```
Approximation by a fixed bounded `g` as in Proposition 6.5 shows any rigid vector is `U`-invariant: if `‖f−g‖₂<η`, the right-hand displacement norm has limsup at most `2η`, so `‖U⁻¹f−f‖₂≤10η`. Ergodicity gives the conclusion. This proves the criterion for any choice of mark index `k`; in particular nothing here requires that `k<L`.

### Non-dyadic quotients

If `c=v/u` is not a dyadic rational, the only two ingredients of Kohlmeyer–Kruer’s irrational-quotient digit argument still hold:

* For every fixed nonnegative `b`, the appropriate query bit at position `L-b-1` is eventually `d_c(b)` simultaneously for `q,q+1`, because `2ᵇc` and `2^{b+1}c` are not integers (Lemma 5.5).
* The digits of `c` have infinitely many adjacent transitions. A tail of zeroes would make `c` dyadic, and a tail of ones would contradict the canonical floor digits (Lemma 2.1 and its proof).

Consequently, with **non-dyadic** in place of **irrational**, their Proposition 5.6 and their Proposition 7.1 hold:

* If `d_u` has bounded zero runs and `v/u` is non-dyadic, then `D(u,v)`. In the proof of Proposition 5.6, an arbitrary prescribed number of sufficiently separated transitions of `c` provide delayed marks in both queries because every bounded-length interval in `d_u` has a one. The carry amplification, correlation limit and Lemma 3.3(i) are unchanged and do not depend on the nature of the ratio.
* If `v/u` is non-dyadic and `D(u,v)` fails, there are integers `s,M>0`, `N≥0` such that every `a≥N` with `d_u(a)=1` has `d_v(j)=1` for some `j∈[a+s,a+s+M)`. Indeed choose a fixed `b>0` with `d_c(b)≠d_c(b+1)`, set `s=b+1`, and suppose the conclusion fails. Then for some marked `a_r→∞`, `d_v` has arbitrarily long zero blocks starting at `n_r=a_r+s`. The common query bits at `k=L-b-2,k+1,k+2` are `d_c(b+1),d_c(b),d_c(b-1)`, and `m+k+1=a_r`. The two criteria above imply disjointness, a contradiction.

We call the second conclusion a forward transport from the marks of `u` to the marks of `v`.

## 3. The proof

### Case I: both reciprocal ratios are non-dyadic

Suppose `D(α,β)` fails. Both forward transports hold. Their composition produces a bounded positive forward return from every sufficiently late mark of `α` to a mark of `α`. If necessary interchange the parameters so `α` is non-dyadic and hence has arbitrarily late marks. Starting at any sufficiently late mark and iterating the forward returns gives an unbounded increasing sequence of marks with bounded successive gaps. Hence `d_α` has bounded zero runs. The non-dyadic version of Proposition 5.6 above contradicts failure of `D(α,β)`. Lemma 3.1 gives the desired indexed completeness.

This case includes irrational ratios (already established) and rational ratios whose numerator and denominator, in lowest terms, both have odd parts greater than one.

### Case II: an odd integer ratio

If a rational ratio or its reciprocal is dyadic but it is not a power of two, its odd part is an odd integer `l≥3`. By swapping the two rays and multiplying one or both parameters by nonnegative integral powers of two, we can take their ratio in the form `β=lα`, with both parameters at least one. Multiplying by a power of two replaces the ray by a tail, which suffices. At least one parameter is still non-dyadic, so `α` is non-dyadic (if `α` were dyadic, `lα` would be too).

Assume `D(α,β)` fails. Since `α/β=1/l` is non-dyadic, we have forward transport from `β` to `α`, with some `s,M,N`.

**First,** `d_α` has bounded zero runs. Take `H≥s+M` with `2ᴴ>l`. If a sufficiently late mark `d_α(a)=1` were followed by `H` zero digits, then `z=2^{a+1}α` would satisfy `0≤{z}<2^{-H}` and `⌊z⌋` would be odd. Thus `⌊lz⌋=l⌊z⌋` is odd, so `d_β(a)=1`. Forward transport forces a mark of `α` in `[a+s,a+s+M)`, contradicting the run. There are infinitely many marks in `α`; a uniform bound on the zero run immediately after each sufficiently late mark gives bounded zero runs globally.

**Second,** `d_β` has bounded zero runs as well. Suppose otherwise. Set `j=⌊log₂l⌋≥1`, and fix a bound `H_α` such that each block of `H_α` consecutive indices contains an `α`-mark. Choose `β`-zero blocks of lengths tending to infinity with start tending to infinity (truncate an infinite zero tail if necessary). From a block starting at `a`, choose a marked position of `α` in `[a+j+1,a+j+1+H_α)` and write it as `n+j+1`. Then `a≤n<a+H_α`, and the remaining `β`-zero block starting at `n` still has length tending to infinity.

Use the `u=α, v=β` return queries at these `n`, and take `k=L+j`. The three bits at `k,k+1,k+2` of both `q,q+1` are eventually `(1,0,0)`: these are the parities of the floors of `(q/2ᴸ)/2^{j+i}` and `((q+1)/2ᴸ)/2^{j+i}` for `i=0,1,2`. Both normalized queries tend to `l`, and none of `l/2^{j+i}` is an integer since `l` is odd and `j≥1`; the limiting three floors are `1,0,0`. The digit required for the common mark is exactly `d_α(m+k+1)=d_α(n+j+1)=1`. The common-mark and zero-block criteria give `D(α,β)`, a contradiction.

Thus `d_β` has bounded zero runs. Apply the non-dyadic version of Proposition 5.6 with `u=β,v=α` (ratio `1/l`), obtaining `D(β,α)` and the final contradiction. Lemma 3.1 again gives indexed completeness.

## 4. Distinct values and arbitrary finite deletions

Fix any finite forbidden set `F`. Passing to arbitrary sufficiently deep tails avoids `F`, zero, and every coincidence between different ray values. To justify the last assertion, suppose `⌊2ⁿα⌋=⌊2ᵐβ⌋` at values tending to infinity. Then `|2ⁿα−2ᵐβ|<1` implies `2^{n-m}→β/α`; the integral powers of two have no accumulation point in `(0,∞)`, so the ratio would be a power of two. Within each ray all sufficiently large values are strictly increasing. The normalizing power-of-two shifts in either case only pass to further tails. Therefore the indexed sums given by Lemma 3.1 on the chosen tails are sums of pairwise distinct actual values from `A\setminus F`. This completes the theorem. □

## 5. Strong-completeness converse

The two hypotheses are also necessary for *strong* completeness of the set of actual numerical values, by elementary known obstructions. If both parameters are dyadic rationals, sufficiently late terms on both rays are even. Removing the finitely many exceptions leaves no odd subset sums. If the ratio is an integral power of two, one ray is a tail of the other, and after a finite deletion the union is a single tail with initial height at least two. For that tail the recurrence telescopes to
`h_n−Σ_{i<n}h_i=h_0+Σ_{i<n}d_i≥2`.
Thus `h_n−1` is absent from the subset-sum set for every `n`: earlier terms sum to at most `h_n−2`, later terms are at least `h_n`. Together with the theorem, this gives the exact strong-completeness classification. This converse concerns strong completeness; these exclusions need not be necessary for ordinary completeness.
