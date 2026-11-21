# Exact-radius identity testing: a two-sided tail functional

Research note, 2026-11-21. The paid full target is [Canonne 2024 Question 1](target-and-prior-audit.md). This note supplies an upper-bound construction and an exact-radius calibration family. It does **not** prove a constant-factor characterization for arbitrary null distributions and adds no completed bounty target.

Coarsening, quadratic statistics, and sparse priors are established techniques. The [recent Zipfian manuscript](https://andotheror.github.io/pdf/closing-the-harmonic-gap-exact-identity-testing-for-zipfian-distributi.pdf) combines these tools for its stated family. No novelty is claimed here from the absence of a matching search result.

## 1. Both signs of the tail discrepancy matter

Let $`q`$ and $`p`$ be distributions on a finite domain. Partition it into a head $`H`$ and a tail $`S`$, and write

```math
P_H=\sum_{i\in H}(p_i-q_i)_+,
\qquad D_H=\sum_{i\in H}(q_i-p_i)_+,
```

with analogous definitions for $`P_S,D_S`$. Let $`p^\#,q^\#`$ be the distributions obtained by preserving the head coordinates and replacing the entire tail by one cell. Exact mass conservation gives

```math
d_{\mathrm{TV}}(p^\#,q^\#)
=\frac{P_H+D_H+|P_H-D_H|}{2}
=\max\{P_H,D_H\}.
```

Consequently, if $`d_{\mathrm{TV}}(p,q)>\varepsilon`$ and $`d_{\mathrm{TV}}(p^\#,q^\#)\le\delta<\varepsilon`$, then

```math
P_S>\varepsilon-\delta,
\qquad D_S>\varepsilon-\delta.
```

This is a deterministic implication about the two distributions. Acceptance by a randomized coarse test does not establish its premise with certainty; the tester's proof uses a case split according to the true coarse distance.

## 2. An explicit squared-discrepancy minimization

For a finite nonnegative vector $`u=(u_1,\ldots,u_s)`$ and $`d>0`$, define

```math
\Psi(u,d)=
\inf\left\{
\sum_{i=1}^s v_i^2:
v_i\ge-u_i,
\ \sum_i(v_i)_+\ge d,
\ \sum_i(-v_i)_+\ge d
\right\}.
```

An infeasible infimum is $`+\infty`$. For $`s\le1`$ it is infeasible. Sort $`u_1\ge\cdots\ge u_s`$. For $`1\le j\lt s`$, let

```math
W_j(u,d)=
\min\left\{
\sum_{i=1}^j a_i^2:
0\le a_i\le u_i,
\ \sum_{i=1}^j a_i=d
\right\},
```

again with value $`+\infty`$ if the constraints are infeasible. Then

```math
\boxed{\quad
\Psi(u,d)=
\min_{1\le j\lt s}
\left\{W_j(u,d)+\frac{d^2}{s-j}\right\}.
\quad}                                                   \tag{1}
```

**Proof.** Given a feasible vector, scale its positive coordinates and the magnitudes of its negative coordinates separately so that each total is exactly $`d`$. This preserves feasibility and cannot increase the objective. If a smaller $`u_i`$ carries a negative deviation while a larger $`u_j`$ carries a nonnegative deviation, swap those two deviations. The negative-capacity constraint remains valid, and the objective and both signed totals are unchanged. Repeating this places all negative deviations on a prefix of the sorted vector. For a prefix of length $`j`$, its least cost is $`W_j`$; the positive mass $`d`$ costs at least $`d^2/(s-j)`$ by Cauchy–Schwarz. Equality is obtained by distributing it uniformly across the complementary coordinates. Taking the best prefix proves (1).

The minimizer defining $`W_j`$ has the usual water-filling form

```math
a_i=\min\{u_i,\lambda\},
\qquad \sum_{i=1}^j\min\{u_i,\lambda\}=d.
```

Thus (1) is an explicit finite calculation, not an optimization over statistical tests or over all alternative distributions. It also shows why a bound using only the negative discrepancy can be weak: it omits the space required to hold the positive discrepancy.

## 3. A quadratic tail test

Let

```math
Q=\sum_{i\in S}q_i^2,
\qquad W=\Psi(q_S,\varepsilon-\delta).
```

Assume $`0\lt W<\infty`$. In a Poissonized sample with mean $`n`$, the counts $`N_i`$ are independent Poisson variables of means $`np_i`$. Consider

```math
Z=\sum_{i\in S}\bigl((N_i-nq_i)^2-N_i\bigr).
```

If $`A=\sum_{i\in S}(p_i-q_i)^2`$, direct Poisson moments give

```math
\mathbb E_pZ=n^2A,
\qquad
\mathop{\mathrm{Var}}_pZ
=2n^2\sum_{i\in S}p_i^2
 +4n^3\sum_{i\in S}p_i(p_i-q_i)^2.                       \tag{2}
```

Writing $`v_i=p_i-q_i`$, one has

```math
\sum_i p_i^2\le2Q+2A,
\qquad
\sum_i p_i v_i^2
\le\sqrt Q\,A+A^{3/2}.
```

The second inequality follows from $`\max q_i\le\sqrt Q`$ and $`\sum|v_i|^3\le A^{3/2}`$. Hence, for an absolute sufficiently large constant $`C`$, taking

```math
n\ge C\max\left\{\frac{\sqrt Q}{W},\frac1{\sqrt W}\right\}                \tag{3}
```

and rejecting when $`Z>n^2W/2`$ gives constant error strictly below $`1/3`$, both under the null and whenever $`A\ge W`$.

Indeed, the null rejection probability is at most $`8/C^2`$. Under an alternative with $`A\ge W`$, division of (2) by $`n^4A^2`$ bounds the variance ratio by

```math
\frac8{C^2}+\frac8C.
```

Since the mean is at least twice the rejection threshold, Chebyshev bounds the acceptance probability by four times this quantity. Increasing $`C`$ makes both errors, for example, at most $`1/20`$.

Poissonization costs only an absolute factor in the fixed-sample formulation. Draw an independent Poisson count of mean one hundredth of the available sample budget; if it exceeds that budget, accept by default. Markov's inequality bounds this overflow event by $`1/100`$. Otherwise run the Poissonized test on that many samples. This changes only the numerical constants.

If $`W=+\infty`$, no alternative can simultaneously have coarse distance at most $`\delta`$ and full distance greater than $`\varepsilon`$, so no tail test is needed.

## 4. A valid general upper bound, with a missing converse

Let $`U(q^\#,\delta)`$ be any valid constant-error sample upper bound for testing the coarse distribution at radius $`\delta`$. The Valiant–Valiant upper bound provides an explicit choice; its internal constant-radius truncation is applied to $`\delta`$, while the full problem still retains the original $`\varepsilon`$ exactly.

Using independent batches for the coarse test and the tail test proves the upper bound

```math
N^*(q,\varepsilon)
\le C\inf_{H,\ 0<\delta<\varepsilon}
\left[
U(q^\#,\delta)
+\max\left\{
\frac{\sqrt{\sum_{i\in S}q_i^2}}
     {\Psi(q_S,\varepsilon-\delta)},
\frac1{\sqrt{\Psi(q_S,\varepsilon-\delta)}}
\right],                                                \tag{4}
```

with integer ceilings and the infeasible-tail convention above. It suffices for a computable candidate to restrict $`H`$ to prefixes in decreasing probability order. The empty head can be handled separately with no coarse test and $`\delta=0`$. An empty tail needs only the coarse test.

**Missing full-target step.** No matching lower bound for (4), even after restricting to prefix heads, has been proved. The minimizer of a squared discrepancy is one alternative, whereas a sample lower bound needs an indistinguishable normalized mixture of alternatives, all beyond the same radius. A minimum-distance calculation alone does not provide such a mixture. No claim is made that (4) is the correct functional or is within a universal factor of the optimum.

## 5. Critical flat-tail calibration

The signed-budget distinction yields a concrete calibration at a radius where the tail has exactly the allowed mass. Let

```math
q=(1-r,\underbrace{r/k,\ldots,r/k}_{k\text{ tail coordinates}}),
\qquad 0\lt r\le\frac13,
\qquad \varepsilon=r.
```

On the domain of these $`k+1`$ coordinates, the following family bound follows from the arguments below:

```math
\boxed{\qquad N^*(q,r)=\Theta\left(\frac{k^{2/5}}r\right).\qquad}          \tag{5}
```

The constants are independent of $`k`$ and $`r`$. This is a restricted family, not the full paid problem. The prior-work searches performed so far did not identify this precise rate, but that does not establish novelty.

### Upper bound

First suppose $`k\ge32`$, and choose

```math
\delta=rk^{-1/5},
\qquad d=r-\delta\ge r/2.
```

The coarsened law is Bernoulli with tail probability $`r`$. A standard tail-count test with a sufficiently large multiple of $`r/\delta^2`$ samples distinguishes the null from coarse distance greater than $`\delta`$ with constant error. This follows directly from the binomial variance; when the alternative tail mass is $`r+h`$ and $`|h|>\delta`$, the function $`(r+|h|)/h^2`$ is bounded by an absolute multiple of $`r/\delta^2`$ because $`\delta\le r`$.

If the coarse distance is at most $`\delta`$, Section 1 gives both signed tail budgets at least $`d`$. Every negative coordinate can supply at most $`r/k`$, so at least $`kd/r`$ coordinates are negative. At most $`k\delta/r`$ coordinates remain for the positive mass $`d`$. Cauchy–Schwarz therefore gives

```math
A\ge\Psi(q_S,d)
\ge\frac{d^2}{k\delta/r}
\ge\frac{r^3}{4k\delta}
=\frac{r^2}{4k^{4/5}}.                                  \tag{6}
```

Here $`Q=r^2/k`$. Equation (3) requires at most an absolute multiple of

```math
\max\left\{\frac{k^{3/10}}r,\frac{k^{2/5}}r\right\}
=\frac{k^{2/5}}r.
```

The coarse test has the same order, since $`r/\delta^2=k^{2/5}/r`$. For $`k<32`$, the known identity-test upper bound $`O(\sqrt{k}/r)`$ is at most an absolute multiple of $`k^{2/5}/r`$. This completes the upper bound uniformly in $`r`$.

### Lower bound

For sufficiently large $`k`$, put

```math
h=rk^{-1/5},
\qquad m=\left\lfloor\frac12k^{4/5}\right\rfloor.
```

Choose a uniformly random $`m`$-element subset $`J`$ of the tail and define

```math
p_0=1-r-h,
\qquad
p_i=\begin{cases}(r+h)/m,&i\in J,\\0,&i\notin J.\end{cases}
```

Every draw is a probability distribution because $`r+h\le2r\le2/3`$. Every survivor has probability greater than $`r/k`$, and

```math
d_{\mathrm{TV}}(p,q)
=h+r\left(1-\frac mk\right)
>r,
```

because $`rm/k\le h/2`$. Thus the prior is supported entirely on valid alternatives at the exact radius.

Compare the sample mixture with the null in two stages. First reveal only whether each sample is the head or tail. The two laws are products of Bernoulli probabilities $`r+h`$ and $`r`$. Their total-variation distance is at most

```math
\sqrt{\frac{nh^2}{2r(1-r)}}.                            \tag{7}
```

This follows from the elementary bound $`D_{\mathrm{KL}}(\mathop{\mathrm{Ber}}(r+h)\|\mathop{\mathrm{Ber}}(r))\le h^2/[r(1-r)]`$ and Pinsker's inequality.

Conditional on the tail count, whenever the fine tail symbols are all distinct, both the null and the mixture assign the same uniform conditional distribution to their ordered tuple. A uniformly chosen random support treats every distinct tuple symmetrically. A coupling can therefore fail only through the coarse-law difference or a repeated tail symbol. Averaging the union bound on collisions gives the additional bound

```math
\binom n2(r+h)^2\left(\frac1k+\frac1m\right).            \tag{8}
```

For $`n\le c k^{2/5}/r`$, (7) is $`O(\sqrt c)`$ and (8) is $`O(c^2)`$, with absolute constants. Choose a sufficiently small absolute $`c>0`$ so that their sum is less than $`1/3`$. A test having both errors at most $`1/3`$ would make its rejection probabilities differ by at least $`1/3`$ between the null and this all-far mixture, a contradiction.

For bounded $`k`$, a two-point comparison between tail masses $`r`$ and $`3r`$ gives $`\Omega(1/r)`$: their single-sample total variation is $`2r`$, so their $`n`$-sample total variation is at most $`2nr`$. This also gives the required order for bounded $`k`$. Hence (5) follows.

## 6. Exact stopping obligation

The critical family demonstrates why a complete characterization must account for an alternative that slightly changes the total tail mass while concentrating it on a random sparse support. It does not establish that the single-cutoff upper expression (4) is optimal for a general null with several probability scales.

The outstanding task is either a uniform normalized-prior lower bound matching an efficiently computable expression at the same radius, or a concrete general obstruction to this particular head/tail expression. Neither is supplied here. The source's full Question 1 remains unresolved by this work.
