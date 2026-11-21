# Independent review of the exact-radius tail calculations

21 November 2026. Reviewed source: `agents/other_paid/canonne2024/head-tail-functional-attempt.md`, SHA-256 `43701ec9236ec5ba572fcc916fb611dc0bb74cc267c1d8bc075881f2c1e7dc86`.

The general upper bound and the critical flat-tail family pass this written mathematical review. The source explicitly leaves the arbitrary-null matching lower bound unproved. It does not resolve [Canonne's paid Question 1](https://proceedings.mlr.press/v247/canonne24a/canonne24a.pdf). The calibration family is not counted as a bounty completion.

## 1. Signed budgets and the finite minimization

With positive and negative head discrepancies $`P_H,D_H`$, the mass discrepancy in the lumped tail is $`D_H-P_H`$. Thus the coarse total-variation distance is exactly $`\max(P_H,D_H)`$. A full distance exceeding $`\varepsilon`$ and coarse distance at most $`\delta`$ imply both tail signed discrepancies exceed $`\varepsilon-\delta`$. The source correctly uses a case split on the true coarse distance; it does not treat randomized test acceptance as deterministic proof of a distance bound.

For the squared-discrepancy minimization, reducing the positive and negative totals separately to $`d`$ preserves every lower coordinate bound and decreases the objective. Swapping a negative deviation from a smaller capacity to a larger one preserves feasibility; its positive counterpart has no upper constraint in this relaxed minimization. Negative support may therefore be placed on a prefix after sorting the capacities. Water-filling minimizes its squared cost, and Cauchy–Schwarz gives the complementary positive cost $`d^2/(s-j)`$. These operations prove the stated formula, including zero capacities and infeasible prefixes.

This is a relaxation of the actual alternative set: it need not impose all global probability constraints. That is harmless for the upper-bound proof, which only needs a lower bound on the squared discrepancy of an actual alternative. An infeasible relaxed tail means that the corresponding true coarse-small/full-far case is impossible.

## 2. Quadratic statistic and sampling convention

The Poisson moment formula is correct:

```math
 \mathop{\mathrm{Var}} Z
 =2n^2\sum_i p_i^2+4n^3\sum_i p_i(p_i-q_i)^2.
```

Writing $`A=\sum_i(p_i-q_i)^2`$ and $`Q=\sum_iq_i^2`$, the two bounds in the source give

```math
 \frac{\mathop{\mathrm{Var}}Z}{n^4A^2}
 \le \frac{4Q}{n^2A^2}+\frac4{n^2A}
      +\frac{4\sqrt Q}{nA}+\frac4{n\sqrt A}.
```

If $`A\ge W`$ and $`n\ge C\max(\sqrt Q/W,1/\sqrt W)`$, this is at most $`8/C^2+8/C`$. The threshold $`n^2W/2`$ then gives the asserted constant error by Chebyshev. Under the null, the direct rejection bound is $`8/C^2`$. The source allows sufficient constant amplification for the coarse tester and uses independent batches.

The conversion to a fixed sample budget is valid: a Poisson count independent of the observations can be drawn before using a prefix of the available iid stream. Coupling with an unlimited stream shows that accepting on overflow changes error by at most the overflow probability. The source's Markov bound of $`1/100`$ suffices; no sharper concentration estimate is necessary.

The resulting general expression is a valid upper bound. Minimizing this upper bound does not manufacture a lower bound. In particular, a minimizing deterministic alternative is not an indistinguishable mixture of normalized, sufficiently far alternatives.

## 3. The flat-tail calibration

For $`q=(1-r,r/k,\ldots,r/k)`$ at the exact radius $`\varepsilon=r`$, choose $`\delta=rk^{-1/5}`$ when $`k\ge32`$. Each negative tail coordinate contributes at most $`r/k`$. Supplying negative discrepancy $`r-\delta`$ therefore leaves at most $`k\delta/r`$ nonnegative coordinates to carry the positive discrepancy. The resulting squared-discrepancy bound is $`r^2/(4k^{4/5})`$. Substitution into the already reviewed variance bound gives $`O(k^{2/5}/r)`$ samples, as does the coarse Bernoulli test.

For completeness, the bounded-$`k`$ step can be obtained from the same argument without invoking another specialized testing result. Set $`\delta=r/2`$. When the tail case is feasible, $`\sum_i|v_i|\ge r`$, so Cauchy–Schwarz gives $`W\ge r^2/k`$. With $`Q=r^2/k`$, the quadratic tester costs $`O(\sqrt k/r)`$, and the coarse tester costs $`O(1/r)`$. For $`k=1`$ the internal tail alternative is infeasible and the coarse Bernoulli test alone suffices. For bounded $`k`$ these bounds are $`O(k^{2/5}/r)`$ with an absolute constant.

The sparse-support lower prior also checks. Its tail mass is $`r+h`$, where $`h=rk^{-1/5}`$, spread uniformly over a random support of size $`\lfloor k^{4/5}/2\rfloor`$. Its head mass stays nonnegative for $`r\le1/3`$. Every prior draw is strictly farther than $`r`$, because its total variation is

```math
 h+r(1-m/k)>r.
```

The coarse sequence laws differ in total variation by at most $`\sqrt{nh^2/(2r(1-r))}`$. Conditional on the tail positions and on all fine tail symbols being distinct, the null and the mixture both give a uniform ordered tuple of distinct labels. Under a maximal coupling of the coarse sequences, their matching part is a subprobability law dominated by the alternative coarse law. Averaging both collision bounds against that law justifies the source's use of

```math
 \binom n2(r+h)^2(1/k+1/m)
```

for the remaining coupling cost. At $`n\le c k^{2/5}/r`$, the two costs are $`O(\sqrt c)`$ and $`O(c^2)`$. A sufficiently small absolute $`c`$ makes their sum strictly below the separation required by a tester with both errors at most $`1/3`$.

The bounded-$`k`$ lower bound from tail masses $`r`$ and $`3r`$ is also valid, including $`r=1/3`$. Those are actual distributions, are more than $`r`$ apart, and their product-law total variation is at most $`2nr`$.

## 4. Limits

The source supplies a complete argument for its restricted flat-tail family and a general upper-bound method. This review does not establish that the family rate is new, that one cutoff suffices for a multiscale null, or that the proposed upper expression admits a matching lower bound. No implementation or Lean claim is made.
