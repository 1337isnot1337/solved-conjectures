# A multiscale obstruction to a prefix-only head choice

Research note, 2026-11-21. This concerns the proposed upper expression in [the head-and-tail note](head-tail-functional-attempt.md), not a solution of [Canonne 2024 Question 1](target-and-prior-audit.md). The result below rules out one efficiently searchable specialization. It does not rule out the expression with arbitrary head sets, and it adds no completed bounty target.

## 1. The specialization being tested

Use the notation $`\Psi`$ and $`q^\#`$ from the companion note. Fix the explicit Valiant–Valiant coarse upper expression

```math
U_{\mathrm{VV}}(q^\#,\delta)
=\max\left\{\frac1\delta,
\frac{\| (q^\#)_{-\max,-\delta/16}\|_{2/3}}{\delta^2}\right\}.
```

The truncation discards the largest atom and then a light tail of total mass at most $`\delta/16`$. Let $`F_{\mathrm{pre}}(q,\varepsilon)`$ be the infimum of

```math
U_{\mathrm{VV}}(q^\#,\delta)
+\max\left\{
\frac{\sqrt{\sum_{i\in S}q_i^2}}{\Psi(q_S,\varepsilon-\delta)},
\frac1{\sqrt{\Psi(q_S,\varepsilon-\delta)}}
\right\}                                                    \tag{1}
```

over heads $`H`$ that are prefixes after sorting $`q`$ in decreasing order and over $`0<\delta<\varepsilon`$. Here $`S`$ is the complementary tail. An infeasible $`\Psi=+\infty`$ contributes zero tail cost. An empty tail uses only the coarse expression. An empty head is allowed separately with no coarse cost and $`\delta=0`$. These are the conventions in the companion note; they do not assert that this expression is optimal.

There is an explicit family for which

```math
N^*(q_K,1/4)=O(K^{2/5}),
\qquad
F_{\mathrm{pre}}(q_K,1/4)=\Omega(K^{1/2}).                 \tag{2}
```

Thus a constant-factor characterization cannot result from this prefix restriction with this particular coarse upper expression.

## 2. The distribution and its better tester

For an integer $`K\ge32`$, put

```math
r=\frac14,\qquad t=K^{-2},\qquad L=K^4,
\qquad a=\frac{r-t}{K},\qquad b=\frac{t}{L}=K^{-6},
```

and let

```math
q_K=(3/4,\underbrace{a,\ldots,a}_{K\text{ middle atoms}},
                 \underbrace{b,\ldots,b}_{L\text{ light atoms}}),
\qquad \varepsilon=r.
```

Collapse the entire light block to one cell. If $`p'`$ and $`q'`$ denote the coarsened distributions, the loss of total variation is

```math
d_{\mathrm{TV}}(p,q_K)-d_{\mathrm{TV}}(p',q')
=\min\{P_{\mathrm{light}},D_{\mathrm{light}}\}
\le D_{\mathrm{light}}\le t.
```

Therefore every original alternative at distance greater than $`r`$ becomes an alternative at distance greater than $`r_1=r-t`$ from

```math
q'=(3/4,\underbrace{r_1/K,\ldots,r_1/K}_{K\text{ atoms}},t).
```

In this smaller problem, keep the two outside cells as the head and the $`K`$ equal cells as the tail. Choose

```math
\Delta=r_1K^{-1/5}\le r_1/2.
```

The coarse distribution has three cells. Its identity can be tested at radius $`\Delta`$ with $`O(\Delta^{-2})=O(K^{2/5})`$ samples. For example, the empirical distribution on three cells has expected total variation at most $`\sqrt{3/n}/2`$ from its true distribution; Markov's inequality and the triangle inequality give the asserted fixed-error test after increasing the absolute sample constant.

If the actual coarse distance is at most $`\Delta`$ but the full coarsened distance exceeds $`r_1`$, both signed discrepancies in the equal tail exceed $`r_1-\Delta`$. At most $`K\Delta/r_1`$ coordinates remain available for the positive discrepancy, because every negative coordinate can supply at most $`r_1/K`$. Consequently the squared discrepancy is at least

```math
\frac{(r_1-\Delta)^2}{K\Delta/r_1}
\ge \frac{r_1^3}{4K\Delta}
=\frac{r_1^2}{4K^{4/5}}.
```

The tail null second moment is $`r_1^2/K`$. The quadratic-test bound proved in the companion note now costs $`O(K^{2/5})`$ samples, since $`r_1`$ is bounded above and below by absolute positive constants. Combining the two tests proves the first part of (2). The argument covers all alternatives, including those that move mass between the blocks; it does not assume that block masses are known under the alternative.

## 3. Every prefix choice pays at least a square-root cost

First consider a nonempty prefix head. It contains the $`3/4`$ atom. Let $`j`$ be the number of middle atoms included, with $`0\le j\le K`$. If some light atoms are also included, then $`j=K`$. In the coarse distribution the $`3/4`$ atom remains the unique largest atom, and the $`j`$ retained middle atoms each still have mass $`a`$.

### At least a quarter of the middle block is in the head

Suppose $`j\ge K/4`$. Since $`a\ge1/(8K)`$ and $`\delta\lt r`$, removing mass at most $`\delta/16`$ can remove at most

```math
\frac{\delta}{16a}\le\frac K8
```

of the middle atoms. Thus at least $`K/8`$ of them remain in the Valiant–Valiant vector. Its two-thirds quasinorm is at least

```math
a(K/8)^{3/2}=\Omega(\sqrt K).
```

Since $`\delta\le1/4`$, the coarse cost alone is $`\Omega(\sqrt K)`$. This also covers an empty tail and every prefix ending in the light block.

### Fewer than a quarter are in the head

Now let $`j\lt K/4`$, so all light atoms remain in the tail. Put

```math
\mu=Kb=K^{-5}.
```

If $`\delta\le ja+\mu`$ and $`j\ge1`$, then $`\mu\le ja`$, so $`\delta\le2ja`$. Truncation can discard at most $`j/8`$ of these $`j`$ head atoms. Therefore

```math
U_{\mathrm{VV}}(q^\#,\delta)
\ge \frac{a(7j/8)^{3/2}}{(2ja)^2}
=\Omega\left(\frac1{a\sqrt j}\right)
=\Omega(\sqrt K).
```

If $`j=0`$ and $`\delta\le\mu`$, the term $`1/\delta\ge K^5`$ gives the same conclusion.

It remains to consider

```math
\delta>ja+\mu.
```

Choose any $`K`$ light coordinates in the tail as positive coordinates. They have total null mass $`\mu`$. The remaining tail coordinates have total null mass

```math
r-ja-\mu>r-\delta=:d.
```

On those remaining coordinates put the negative deviation $`-\theta q_i`$, where $`\theta=d/(r-ja-\mu)<1`$. On each chosen light coordinate put the positive deviation $`d/K`$. This is feasible for $`\Psi(q_S,d)`$, with both signed totals exactly $`d`$. If $`Q=\sum_{i\in S}q_i^2`$, it shows

```math
\Psi(q_S,d)\le Q+\frac{d^2}{K}=O(1/K).
```

Meanwhile

```math
Q=(K-j)a^2+Lb^2=\Omega(1/K),
```

because at least $`3K/4`$ middle atoms remain and $`a\ge1/(8K)`$. Thus the tail term satisfies

```math
\frac{\sqrt Q}{\Psi(q_S,d)}=\Omega(\sqrt K).
```

This completes all nonempty prefix cases. Notice that the construction is used only to upper-bound a deterministic infimum. It is not asserted to be a hard statistical alternative or a lower-bound prior.

### Empty head

When the head is empty, take a deviation that removes $`t`$ from the $`3/4`$ atom and all mass $`r-t`$ from the middle block, then adds mass $`r/K`$ to each of any $`K`$ light coordinates. Both signed totals are $`r`$, and its squared norm is

```math
t^2+Ka^2+\frac{r^2}{K}=O(1/K).
```

The full null second moment is at least $`(3/4)^2`$. The empty-head expression consequently costs $`\Omega(K)`$, which is stronger than required. All cases establish the second part of (2).

## 4. Exact scope: arbitrary heads repair this example

The unrestricted expression in the companion note allows a nonprefix head. Choose it to contain the $`3/4`$ atom and every light atom, leaving only the equal middle block in the tail. Set

```math
\delta=t+r_1K^{-1/5}.
```

For $`K\ge32`$, the light head mass $`t`$ is at most $`\delta/16`$. In the coarse distribution, Valiant–Valiant truncation removes all light atoms and leaves only the middle-block aggregate of mass $`r_1`$ after the largest atom is removed. Hence the coarse expression is $`O(K^{2/5})`$. The remaining signed tail budget is exactly

```math
\varepsilon-\delta=r_1-r_1K^{-1/5},
```

so the quadratic tail expression is also $`O(K^{2/5})`$ by Section 2. Thus this family does not disprove the arbitrary-head version of the proposed upper bound.

The result also does not assert failure for every possible coarse tester. It concerns the explicit $`U_{\mathrm{VV}}`$ used in (1). A more accurate tester inside the coarse problem can perform a further coarsening, as in Section 2. Treating an optimal coarse tester as an oracle would therefore hide the original characterization problem in that subroutine.

## 5. Remaining full-target obligation

A single probability cutoff with this coarse bound is insufficient. This example can be repaired by a middle interval as the tail, or by an additional coarsening stage. Neither observation supplies a general converse or proves that two cutoffs suffice. The unrestricted head-and-tail expression still lacks a normalized-prior lower bound, an efficient optimization proof, and a countable-domain extension. The paid arbitrary-null, exact-radius characterization remains unresolved by this work.
