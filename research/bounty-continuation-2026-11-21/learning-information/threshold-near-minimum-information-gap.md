# Randomized near-minimum thresholds: an exact information reduction

Date: 21 November 2026. This continues the [separately paid agnostic-threshold target](agnostic-threshold-cmi-route.md). The learner below has the required empirical accuracy. Its required constant CMI bound is unproved. This note isolates two valid information reductions and the remaining finite inequality; it is not a bounty solution.

## 1. Candidate learner, including atoms

For a labeled sample $`z`$ of size $`n`$, let $`H(z)`$ contain the thresholds at its distinct feature values and infinity. These represent exactly the valid empirical prediction traces. Let $`L_z(t)`$ be total binary loss and $`m_z=\min_{t\in H(z)}L_z(t)`$.

Independently sample $`R`$ uniformly on $`[1,2]`$. Given it, choose uniformly from

```math
B_z(R)=\{t\in H(z):L_z(t)\le m_z+R\sqrt n\}.
```

The output is proper, the rule is measurable and permutation invariant, and its excess empirical loss is at most $`2/\sqrt n`$ on every dataset. The randomness $`R`$ is private: it is not supplied with the output and must not silently be conditioned on in a claimed constant-information proof.

Writing $`N_z(r)=|B_z(r)|`$, its marginal output law is

```math
p_z(t)=\int_1^2
\frac{1[t\in H(z),\ L_z(t)\le m_z+r\sqrt n]}{N_z(r)}\,dr.
\tag{1}
```

Equal feature values form indivisible groups. Cuts within such a group are not threshold hypotheses. In particular, the usual unit-Lipschitz loss walk and its lower bound on the number of near-minimum cut positions apply directly only when features are distinct. A random ordering of equal-valued examples does not license splitting their group.

## 2. Changing the available feature values costs only a constant

This lemma holds for any measurable permutation-invariant learner which outputs an input feature threshold or infinity; it does not use the particular band weighting in (1).

Consider two iid adjacent samples $`z^0,z^1`$ sharing $`n-1`$ entries, with the remaining independent entries $`u,v`$. Their canonical **candidate** sets have intersection

```math
C=H(z^0)\cap H(z^1).
```

Let their actual output laws be $`P_0,P_1`$, and put

```math
a=P_0(C^c),\qquad b=P_1(C^c),\qquad
\gamma=1-\max(a,b).
```

An output of $`P_0`$ outside $`C`$ must be the feature value of $`u`$, and that value must occur uniquely in $`z^0`$. By exchangeability, each of the $`n`$ input indices has the same expected probability of being the uniquely occurring selected feature. The sum of those probabilities is at most one. Thus

```math
\mathbb E a\le1/n,\qquad \mathbb E b\le1/n.
\tag{2}
```

The same-weight mixture-flag argument from the [Gibbs lemma](trace-gibbs-cmi-lemma.md) gives

```math
\mathop{\mathrm{JS}}(P_0,P_1)
\le(1-\gamma)\log2
+\gamma\mathop{\mathrm{JS}}(P_0(\cdot\mid C),P_1(\cdot\mid C)).
\tag{3}
```

When $`\gamma=0`$, the second term is defined to be zero; otherwise both conditional laws exist. This avoids incorrectly treating the event of lying in $`C`$ as independent of the binary input.

Tensorizing the paired selector as in the Gibbs proof and using (2) yields

```math
\mathop{\mathrm{CMI}}_D(A_n)
\le2\log2+n\,\mathbb E\left[
\gamma\mathop{\mathrm{JS}}(P_0(\cdot\mid C),P_1(\cdot\mid C))
\right].
\tag{4}
```

The distinction between candidates and actual positive-probability support matters. A common candidate can become ineligible when the empirical loss changes. All such eligibility changes remain in the second term of (4); they have not been bounded by (2).

For thresholds, the loss perturbation on common candidates has additional structure:

```math
L_{z^0}(t)-L_{z^1}(t)
=y_v-y_u
+(2y_u-1)1[x_u\lt t]
-(2y_v-1)1[x_v\lt t].
\tag{5}
```

It has at most two jumps in threshold order. The minima differ by at most one, so corresponding excess losses differ by at most two. An arbitrary perturbation of unrelated hypothesis scores is not an iid threshold example.

A sufficient positive estimate would be a universal bound of order $`1/n`$ for the expectation in (4). No such estimate is proved here; it may be stronger than necessary because selector tensorization can be loose.

## 3. Averaging over the hidden random pairing

There is another sufficient reduction which does not tensorize individual selector bits.

For an iid full pool of $`2n`$ labeled observations, independently add continuous tie-breaking tags used only in this proof. These tags do not affect the learner. Sort by feature value and then tag. Conditional on the resulting ordered list $`\omega`$, the original indexed positions are uniformly permuted, so the original pairing is a uniform perfect matching $`M`$ of the $`2n`$ distinguishable entries.

Choose one endpoint of each matching edge uniformly. The resulting index set $`U`$ is uniform among all $`n`$-subsets. Conversely, conditional on $`U`$, the matching is uniform among the matchings between $`U`$ and its complement.

For a permutation-invariant learner, its output $`W`$ depends on the selected entries and its own coins, not on their row order or on their matching. Therefore, conditional on $`\omega,U`$,

```math
W\ \text{is independent of }M.
```

Given $`M`$, the selector and its chosen set $`U`$ determine one another. The mutual-information chain rule consequently gives the exact identity

```math
I(W;U\mid M,\omega)
=I(W;U\mid\omega)-I(W;M\mid\omega)
\le I(W;U\mid\omega).
\tag{6}
```

The omitted row order and orientation of the matching carry no additional information about the output once the selected entries are fixed. Averaging (6) over the sorted iid pool proves

```math
\mathop{\mathrm{CMI}}_D(A_n)
\le\mathbb E_\omega I(A_n(\omega_U);U\mid\omega),
\quad U\text{ uniform among all }n\text{-subsets}.
\tag{7}
```

Adding the independent proof tags did not change the original CMI. For atoms, their equal-feature groups are still respected by the learner; tags merely make the combinatorial entries distinguishable.

## 4. Exact remaining finite-word inequality

It would therefore suffice to prove the following statement uniformly in $`n`$ and in every fixed ordered labeled pool $`\omega`$, including arbitrary equal-feature groups:

```math
I(J;U)\le C,
\tag{8}
```

where $`U`$ is a uniform $`n`$-subset, and $`J`$ is the canonical threshold output of the randomized band sampler (1) on $`\omega_U`$. The output is represented by its distinct-feature group in the full pool, or by infinity. For distinct features it is an index in $`U\cup\{2n+1\}`$.

Equivalently, if $`p_U(j)`$ is the explicit law (1) on the selected subsequence and

```math
\overline p(j)=\binom{2n}{n}^{-1}
\sum_{|U|=n}p_U(j),
```

the missing inequality is

```math
\binom{2n}{n}^{-1}
\sum_{|U|=n}\sum_j
p_U(j)\log\frac{p_U(j)}{\overline p(j)}
\le C.
\tag{9}
```

A proof of this universal finite-word inequality would settle the separately rewarded proper threshold target. It is not established by the bounded differences of the scores, by maximal inequalities for a thinned loss walk, or by a formal sum of spatial variances alone. In a dyadic output-index analysis, conditioning on the selected bin changes the distribution of $`U`$; a valid conditional information estimate is required at each step.

Failure of (8) on a specially chosen fixed pool would also not, by itself, refute the bounty statement: (7) is an upper-bound reduction and the original target averages over iid pools. An actual negative resolution would require the original learner quantifiers, not merely failure of this candidate or of a sufficient inequality.

No positive constant-information estimate and no concrete iid-distribution obstruction for the band sampler have been proved in this note.
