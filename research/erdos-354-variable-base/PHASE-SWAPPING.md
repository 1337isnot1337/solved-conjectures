# Erdős Problem 354: phase-swapping above the golden ratio

This addendum to [the sub-golden-ratio criterion](SPECTRAL-CRITERION.md) gives a positive-measure coefficient phase range at some greater bases, including almost every second coefficient at the endpoint of that criterion. It is a metric theorem on a stated region, not the original variable-base conjecture. It uses [Fan's three-set theorem](https://arxiv.org/html/2607.14071v6#S2); the new step is swapping the assignments of the two rays following an isolated deletion. The previously known examples for the existential and universal readings are discussed in the companion note.

**Theorem.** Let `1<γ<2`, fix `α>0`, and let the normalized phase `r=β/α` satisfy
```text
1 < r < γ,                 γ(γ−1) < r < 1/(γ−1).
```
Then, for almost every such `β>0`, the union of the positive values of the floor rays `⌊αγ^n⌋` and `⌊βγ^n⌋` is strongly complete. The same holds after multiplying either coefficient by an integral power of the base, since this changes the union by only finitely many values.

For `γ=φ=(1+√5)/2`, the phase conditions accept every `1<r<γ`; thus at the golden ratio the conclusion holds for every fixed first coefficient and almost every second coefficient on the whole positive line. For `φ<γ<λ=1.754877…`, where `λ(λ−1)^2=1`, the phase conditions still describe a nonempty open interval, extending the metric result past the golden ratio. This does not assert that the boundary of this region is optimal or that the result settles the full variable-base question.

## 1. Prescribed staggered deletions have trivial spectrum generically

Write `x_n=⌊αγ^n⌋` and `y_n=⌊βγ^n⌋`. For all sufficiently large indices `x_n<y_n<x_{n+1}` because `1<r<γ`; in particular the two rays eventually have no coincident actual values. We discard enough early terms to have both tails strictly increasing and disjoint. Write `H_q` and `Δ` as in the companion note, with `H_q` formed by convergence of `Σ_{a}||aθ||^q` on `R/Z`.

For an integer `L≥2`, remove the value `x_n` at indices `n≡0 (mod 2L)`, and remove the value `y_n` at indices `n≡L (mod 2L)`; denote these two removed sets by `C_x,C_y` and their union by `C`. We may start the deletions arbitrarily late, which modifies the sets by finite amounts. There are exactly `L` shells between the indices of successive deletions, and only one value is removed at each deletion shell.

The positive values of `C_x` have bounded successive ratios, so Fan's Lemma 3.1 gives countable `H_1(C_x)` and `H_2(C_x)`. For every fixed nonzero angle in `H_1(C_x)`, the metric lemma in the companion note applied to the `β` coefficient of the deleted `y` subray (base `γ^{2L}`, coefficient `βγ^L`) shows the deleted `y`-ray norms do not even tend to zero for almost every `β`. That lemma uses only that the base of the subray exceeds one, so it is valid even though `γ^{2L}` is large. Thus `H_1(C_x∪C_y)={0}`, and `H_2(C)⊂H_2(C_x)` is countable, for almost every `β`. Intersect over the countably many choices of `L` before choosing a suitable `L` for the phase. This avoids any dependence problem between the parameter and the deletion spacing.

## 2. Route the two remaining subsequences

Split the remaining values into colors `B_1,B_2`. In a run of ordinary shells, both values survive, and each color is assigned consistently to one ray. At each deletion shell `n`, give the sole surviving value `w_n∈{x_n,y_n}` to the old `x` color. From shell `n+1` switch the two assignments: the old `y` color now receives the `x` values, and the old `x` color now receives the `y` values. This describes the coloring inductively.

It remains to check `Δ(B_i)<∞`. Put `S_L=Σ_{j=1}^{L-1}γ^{-j}`, so `S_L→1/(γ−1)`. The two strict phase inequalities allow us to choose `L` so that
```text
S_L > r,                 r S_L > γ,                 S_L + 1 > γ r .
```
Indeed the first inequality holds in the limit because `r<1/(γ−1)`; the second because `r>γ(γ−1)`; and the third is equivalent to the same upper inequality in the limit since `1+1/(γ−1)=γ/(γ−1)`.

For a sufficiently late deletion shell `n`, both colors followed their current ray assignment throughout the previous `L−1` ordinary shells. Their prefix sums immediately before the deletion are therefore at least `αγ^n S_L−(L−1)` and `βγ^n S_L−(L−1)`, respectively. By the three strict inequalities and `x_n≤w_n≤y_n`, for all sufficiently large `n`:
* The surviving value `w_n≤βγ^n` does not exceed the previous sum of the old `x` color.
* At shell `n+1`, the value `x_{n+1}≤αγ^{n+1}` does not exceed the previous sum of the old `y` color.
* Also at shell `n+1`, the value `y_{n+1}≤βγ^{n+1}` does not exceed the old `x` color's prefix sum after adding `w_n≥αγ^n−1`.

After a value is appended at no more than the prior sum of its color, the new sum is at least twice that value. Along the same ray the ratio of consecutive values tends to `γ<2`; hence every subsequent term of that color through the ordinary shells again does not exceed its prior sum. This induction runs until the next specially checked deletion. It follows that all sufficiently late terms in both colors have nonpositive deficit, and each `Δ(B_i)` is finite. Both colors are infinite. Taking `L≥2` ensures shell `n+1` is ordinary.

The disjoint sets `B_1,B_2,C` now satisfy Fan's Theorem 2.2: `Δ(B_i)<∞`, `H_1(C)={0}`, and `H_2(C)` countable. Their union, and therefore the original floor-ray set, is strongly complete. □

The coloring proof works for any pair with the stated phases whose two staggered deletions have trivial combined `H_1`; the metric argument is a sufficient way of ensuring this. Trivial spectrum of an entire single ray alone is not asserted to imply trivial spectrum on an arbitrarily prescribed sparse subray.

## 3. Arithmetic extraction and the exact golden-ratio endpoint

The metric qualifier is unnecessary in some cases. The underlying routing works for any deletion index set with gaps at least `L`, not just exactly `L`: at the next deletion the preceding `L−1` shells are ordinary and have the same fixed assignment. At most one ray value is deleted per marked shell. This lets us build an arithmetic certificate.

**Arithmetic sufficient condition.** Keep the phase hypotheses of the theorem. Let `γ` be algebraic, and suppose there is no common eventual prime divisor of the two rays. Suppose, for some integer `K≥L` (with `L` chosen as in §2), that at least one ray sampled at indices `0,K,2K,…` does not eventually obey the exact minimal-polynomial recurrence for base `γ^K`. Then the actual floor-ray union is strongly complete.

To prove it, let `P_K∈Z[X]` be an integer polynomial proportional to the minimal polynomial of `γ^K`, of degree `d`. The sampled sequence has infinitely many nonzero bounded integer residuals under `P_K(E)`, by the rounding estimate in the companion note. Select infinitely many such residual-witness blocks of `d+1` terms. Within each block the shell indices have spacing `K`; choose the start of each block arbitrarily far past all previous chosen indices. Interleave these selections with the following choices: for each prime `p`, in a schedule giving each prime infinitely many turns, select a term on either ray not divisible by `p`, with index at least `L` after all indices chosen so far. The hypothesis guarantees an arbitrarily late such term. The selected indices are globally `L`-separated and specify one deleted occurrence each. Extend the index set to a maximal `L`-separated set as in the companion note and choose either ray at newly selected indices. The resulting deletion set `C` has bounded successive ratios because the index gaps are at most `2L−1` and the two coefficients differ by a fixed factor.

If an irrational angle belonged to `H_1(C)`, all the corresponding norms would tend to zero, so the norms of the multiples of the bounded nonzero residuals would also tend to zero by the triangle inequality. This contradicts irrationality and finiteness of the possible nonzero residuals. If a nonzero rational angle belonged to `H_1(C)`, its denominator would divide all but finitely many values in `C`, contrary to the witness schedule for a prime factor. Thus `H_1(C)={0}`, and bounded ratios give countable `H_2(C)`. Apply the phase routing and Fan's theorem exactly as above. For example, the sampled-ray nonrecurrence hypothesis holds for every `K` if its coefficient is outside `Q(γ)`, by the trace argument in the companion note applied to `γ^K`. This gives the eventual-common-prime characterization, in the stated phase region, for all algebraic bases with either coefficient outside `Q(γ)`.

### The golden-ratio endpoint follows from a prior argument

[Kenta Kitamura's September 2026 repository](https://github.com/KitaKen1/erdos-354-part-ii#mathematical-explanation-ai-generated) states the single-ray result at `√φ`, and its proof already gives all-coefficient completeness for two rays at `φ`. The even/odd decomposition in that proof uses only two separate golden floor rays; the coefficient relation between them is immaterial. In precise terms, for an arbitrary coefficient `t>0` the ray `a_n=⌊tφ^n⌋` satisfies `a_{n+2}−a_{n+1}−a_n∈{0,1}`, with infinitely many 1s, since an eventual zero residual would force the bounded, nonnegative fractional parts to satisfy the exact Fibonacci recurrence and hence vanish. Disjoint carry-one triples produce arbitrarily long intervals of finite subset sums. Another arbitrary golden floor ray has syndetic finite subset sums by its eventual ratio below two, or equivalently it can extend a sufficiently long represented interval term by term as in Kitamura's proof. One long interval plus a syndetic sumset is cofinite. This works after arbitrary finite deletions. It gives a result for the actual set of values if phases differ (there are then only finitely many numerical coincidences), or for indexed occurrences if both rays represent the same tail. Thus novelty for the exact golden-ratio positive conclusion is **not** claimed here.

There is also an alternate proof of the distinct-phase conclusion from the arithmetic extraction just given. At `γ=φ`, the phase inequalities apply to all `1<r<φ`. Choose an odd `K≥L`; the base `φ^K` has degree two with negative conjugate `(−φ^{-1})^K` and minimal polynomial `X²−T_K X−1`, where `T_K=φ^K+(−φ^{-1})^K∈Z`. Any eventual exact floor recurrence would have the form `a_n=t(φ^K)^n+c(−φ^{-1})^{Kn}`, with the leading coefficient forced by bounded rounding error and `c≠0` because otherwise two consecutive integers have irrational ratio `φ^K`. The correction term alternates sign, contrary to the floor never exceeding its argument. At `K=1`, the positive/negative coefficient sums of `X²−X−1` are 1 and 2, so the finite-prime cutoff of the companion note rules out every eventual prime divisor. [Dubickas, Theorem 2(ii)](https://doi.org/10.1017/S0017089506003090) already rules out an entirely even ray at this base. The alternate proof therefore gives the distinct-phase conclusion.

For contrast, [van Doorn, arXiv:2602.23394, Proposition 4](https://arxiv.org/html/2602.23394#S3) classifies an individual ray at `φ`: with indexing starting at `n=1`, it is complete exactly when `t<min(3/φ²,5/φ³)=3/φ²`; this is ordinary completeness, not strong completeness. A tail shifts the coefficient upward, so no single golden floor ray is strongly complete. Thus the same-phase conclusion is **only** an indexed-interleaving result. [Graham's Fibonacci theorem](https://www.fq.math.ca/Scanned/2-1/graham.pdf), as summarized and used in [Geneson §1](https://arxiv.org/html/2609.25107v1#S1), instead concerns the actual Fibonacci integer recurrence and its multiplicities.

The contribution of this note is the phase-swapping result and its arithmetic version in the **open region above** `φ`, not either reading of the original variable-base question.
