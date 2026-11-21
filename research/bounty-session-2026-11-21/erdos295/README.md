# Erdős 295: source audit and the exponential-tail obstruction

Checked 2026-11-21. Coordination: repository issue 237. This session did not prove or disprove Erdős 295. No bounty submission, acceptance, or payment is claimed.

## Exact target

Let k(N) be the least number of distinct positive integers, all at least N, whose reciprocals sum to one. The [formal statement](https://github.com/google-deepmind/formal-conjectures/blob/main/FormalConjectures/ErdosProblems/295.lean) asks whether

```math
k(N)-(e-1)N\longrightarrow+\infty.
```

An unbounded upper limit, a density-one assertion, a result under a denominator ceiling, or a computation at one starting value does not answer this question.

## Prior work found during this attempt

The initial idea was to combine the harmonic-loss identity with large-prime divisibility. A deeper source search found that the same mechanism is already developed in [tienxion's September 5, 2026 manuscript](https://github.com/tienxion/ai-erdos/blob/main/erdos295_reviewed_lower_bounds.pdf), titled *Quantitative obstructions for nearly shortest Egyptian fractions*. Retrieved Git blob: `f67f248b594bbcc129d4851635099de7682a99b4`.

The manuscript states that small excess forces an exponential product of the denominators above N². For fixed excess C, only a bounded number of those tails can occur. It also states polynomial-ceiling lower bounds and an unrestricted exceptional-start estimate of order X^(17/30+epsilon), with constants depending on C and epsilon. Its author explicitly leaves the pointwise conjecture unresolved and describes the work as not independently peer reviewed or formally verified.

The main tail argument and the multi-scale comparison were read in the original manuscript. The claims are recorded as prior work, not newly established results of this session. They are stronger than the summary on the [secondary research wiki](https://erdosproblems.ai/wiki/problems/unit_fractions/E0295), which was useful for locating the original but does not replace it.

## The current upper bound must use the recent short-expansion theorem

The older O(N/log N) excess bound is not the strongest consequence of the presently available uniform expansion theorem. The [primary introduction of *Short Egyptian fractions*](https://github.com/openai/math/blob/main/preprints/Short-Egyptian-fractions-September-25-2026/build/introduction.tex), Git blob `3f757239f763e0e6ec8daa9d60d574bb473db166`, states that every rational a/b in (0,1) has a distinct Egyptian expansion of length O(log log b), with an absolute constant and unrestricted denominators.

Taking that theorem as an input, the standard consecutive-core construction gives the attributed corollary

```math
k(N)\le(e-1)N+O(\log N).
```

Here is the reduction, including the distinctness point. Let m be the largest integer for which

```math
\sum_{j=N}^{m}\frac1j<1.
```

Harmonic-sum comparison gives m=eN+O(1). Write the positive residual in lowest terms as a/b. Then

```math
0<\frac ab\le\frac1{m+1},\qquad b\mid\operatorname{lcm}(N,N+1,\ldots,m),\qquad b\le m!.
```

The cited theorem expands this residual into O(log log b)=O(log N) distinct unit fractions. Positivity means each individual reciprocal is at most the total residual. Every new denominator is therefore at least m+1, so none collides with the consecutive core. Adding the counts proves the bound.

This is a corollary of the cited result, not a new solution or a claimed new theorem. No audit of that paper's entire proof or its Lean development was performed here.

## Why the direct prime count stops

Suppose a representation A has bounded excess. Its harmonic deficit relative to the consecutive interval of the same cardinality is O(1/N). Hence almost every denominator in each fixed interior interval must be retained, and only a bounded number can lie beyond bN for fixed b>e.

Large primes occurring in the interior must also divide some tail denominator: otherwise the rational identity has an uncancelled negative p-adic valuation. This forces the product of the few tail denominators to be exponential in N.

It does **not** force a large number of tails. One integer can contain many distinct large prime factors. Replacing this product condition by a count of distinct denominators is invalid.

A sharper attempt considered the exact prime residues, rather than just prime support. In the one-tail case, write the core residual in lowest terms as u/v. A one-term completion exists exactly when u=1, in which case the denominator is v. Thus a full exclusion even of this case needs an arithmetic argument ruling out numerator one for every sufficiently large nearly consecutive core. Exponential size of v alone does not do that.

For two tails, the exact equation is

```math
\frac uv=\frac1x+\frac1y
\quad\Longleftrightarrow\quad
(ux-v)(uy-v)=v^2.
```

The forward implication follows by multiplying by vxy and rearranging. Conversely, expanding the factored equation and cancelling v>0 gives uxy=v(x+y), provided u>0. Admissible solutions still require integer x,y, distinctness, and the required lower bounds.

Consequently, a divisor of v² in an appropriate residue class modulo u can give a two-tail completion. The prime-product lower bound on v does not exclude those residue classes. The fixed-tail denominator upper bound used in the prior manuscript is exponential in N as well, so it is compatible with the lower bound and creates no contradiction.

## Other routes tested

1. **Compare two nearby starting values.** Very large tails can be separated from small rational differences of the cores. The prior manuscript already develops this method into a density bound. The result permits isolated starts arbitrarily far apart; it does not imply that all sufficiently large starts are excluded.
2. **Use the irrationality of e.** Harmonic comparison leaves corrections from omitted and added denominators. Those corrections are rational numbers of growing arithmetic complexity. A bound for approximation of e by a single rational cannot be applied after silently dropping them. No uniform separation theorem strong enough for those corrected residuals was obtained.
3. **Compress the large tails.** A bound on the number of terms does not give a polynomial bound on their denominators independent of the core's reduced denominator. Standard fixed-length estimates depend on that denominator, which is already exponential. No compression preserving the term count was proved.
4. **Use the uniform short-expansion theorem backwards.** Its O(log log b) bound is an upper bound, and its matching lower bound is worst-case over numerators. It supplies no lower bound for these particular harmonic residuals.

These are failed routes, not statements that a proof is impossible. The unrestricted pointwise lower bound remains missing.

## Outcome

New mathematical bounty solutions from this target: **0**. New Lean verification: **none**. The useful correction is attribution: the exponential-tail and sparse-exception arguments already have public prior work, and the known uniform expansion theorem gives a better unrestricted upper bound than the historical one.
