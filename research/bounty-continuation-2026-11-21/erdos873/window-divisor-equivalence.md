# Erdős 873 and bounded divisor clusters: an exact equivalence

Date: 21 November 2026. Status: a proposed unconditional equivalence between open statements, not a proof or disproof of either statement. No priority claim and no completed bounty are asserted. The quantitative packing direction is already present in the prior work described below; the purpose here is to check the converse, all quantifiers, and a reduction to the square-root interval.

## 1. The three statements

For a strictly increasing sequence of positive integers $`a=(a_i)_{i\ge0}`$, define

```math
F(a,X,k)=\#\{i\ge0:\mathop{\mathrm{lcm}}(a_i,\ldots,a_{i+k-1})\lt X\}.
```

For $`k\ge1`$ this count is finite, since every counted start satisfies $`a_i\lt X`$. The empty-window convention gives infinitely many starts when $`k=0`$ and $`X>1`$, so it cannot furnish the conclusion below.

**W (the full Erdős 873 target).** For every such sequence and every $`\varepsilon>0`$, there is an integer $`k\ge1`$ such that

```math
F(a,X,k)\lt X^\varepsilon\qquad\text{for every }X>0.
```

The window length may initially depend on both the sequence and the exponent. This is the quantifier order of the [pinned formal target](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/873.lean).

**U (uniform short relative intervals).** For every $`\delta>0`$ there is an integer $`C_\delta`$ such that, for every positive integer $`L`$ and every real $`u>0`$,

```math
\#\{d\mid L:u\le d\le u(1+L^{-\delta})\}\le C_\delta.
```

All divisors in this note are positive.

**R (the full Erdős 886 target).** For every $`\eta>0`$ there are constants $`C_\eta,N_\eta`$ such that, for every integer $`N\ge N_\eta`$,

```math
\#\{d\mid N:\sqrt N\lt d<\sqrt N+N^{1/2-\eta}\}\le C_\eta.
```

Both endpoints are strict, matching the [pinned Erdős 886 target](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/886.lean). Using closed endpoints changes the count by at most two and does not change the statement.

**Proposition.** The statements W, U, and R are equivalent. Moreover, W implies its apparently stronger version in which $`k=k(\varepsilon)`$ is independent of the sequence.

## 2. Uniform divisor bounds imply uniform window bounds

Assume U. Fix $`\varepsilon>0`$ and choose $`0<\delta<\varepsilon`$. Let $`k\ge2`$ be an integer greater than $`C_\delta`$.

Consider a counted $`k`$-window, and write $`L`$ for its least common multiple, $`u`$ for its first element, and $`H`$ for its last element minus its first. Its $`k`$ elements are distinct divisors of $`L`$. Therefore U gives

```math
H>uL^{-\delta}>uX^{-\delta},
```

because $`L\lt X`$.

Separate the starting indices into their $`k`$ residue classes modulo $`k`$. Within one class the element intervals of successive windows are disjoint and ordered. Among starts with $`U\le u<2U`$, consecutive starts are thus separated by more than $`UX^{-\delta}`$. There are at most $`1+X^\delta`$ of them in each residue class. Since $`1\le u\lt X`$, dyadic subdivision gives, for $`X\ge2`$,

```math
F(a,X,k)\le k\lceil\log_2X\rceil(1+X^\delta)=o(X^\varepsilon).
```

The bound is uniform in the sequence. Choose $`X_0\ge2`$ so that it is strictly below $`X^\varepsilon`$ whenever $`X\ge X_0`$, and enlarge the window length to an integer $`K\ge\max(k,\lceil X_0\rceil)`$. For $`X\ge X_0`$,

```math
F(a,X,K)\le F(a,X,k)\lt X^\varepsilon.
```

For $`0\lt X\lt X_0`$, strict increase and positivity give $`a_{i+K-1}\ge i+K\ge K\ge X_0>X`$, so no $`K`$-window is counted. This proves the literal all-scale statement with a sequence-independent $`K`$.

This direction uses the same packing mechanism as the [April 2026 note](https://althofer.de/on-erdos_873-based-on-letendre.pdf) and the [July 2026 working report, Section 5](https://www.erdosproblemaday.com/report/873). Those sources derive partial or conditional window bounds; the present argument does not supply the missing divisor bound.

## 3. Failure of a uniform divisor bound gives one bad infinite sequence

Suppose U is false. After decreasing the exponent if necessary, there is a fixed $`0<\delta\le1/2`$ for which the displayed cluster counts are unbounded. For any fixed bound on $`L`$, the divisor counts are bounded. Consequently, clusters with arbitrarily many elements occur for arbitrarily large $`L`$.

For a nonempty cluster, replace the left endpoint by its least divisor $`u`$. The cluster remains contained in $`[u,u(1+L^{-\delta})]`$. Put

```math
\varepsilon_0=\frac{\delta}{2(1+\delta)},\qquad T=\lfloor L^\delta\rfloor.
```

For each integer $`j\ge1`$, choose such an $`L=L_j`$ and a cluster $`D=D_j`$ containing at least $`j`$ distinct divisors. Require $`L_j`$ to be sufficiently large for all estimates below, and require $`T_j`$ to exceed the largest element of all earlier stages.

Use the multipliers

```math
t=T+3s,\qquad 0\le s\le\lfloor T/3\rfloor.
```

They satisfy $`T\le t\le2T`$. If $`v=\max D`$, then consecutive scaled copies are strictly separated because

```math
(t+3)u-tv
\ge u\bigl(3-tL^{-\delta}\bigr)
\ge u>0.
```

Thus the finite sets $`tD`$ occur as successive disjoint blocks. For every $`k\le j`$, each copy contains a consecutive $`k`$-window with least common multiple at most $`tL\le2TL`$. Set

```math
X_j=3T_jL_j.
```

The number of these counted windows is at least

```math
\lfloor T_j/3\rfloor+1
\ge T_j/3
\ge L_j^\delta/6,
```

where the last inequality holds once $`L_j^\delta\ge2`$. On the other hand,

```math
X_j^{\varepsilon_0}
\le 3^{\varepsilon_0}L_j^{(1+\delta)\varepsilon_0}
=3^{\varepsilon_0}L_j^{\delta/2}.
```

Choose $`L_j`$ large enough that $`L_j^\delta/6\ge3^{\varepsilon_0}L_j^{\delta/2}`$. This is compatible with every earlier requirement because the available cluster denominators are unbounded.

The first element of the new stage is at least $`T_j`$, so the stage-separation requirement makes the union of all these blocks an infinite strictly increasing sequence of positive integers. For every fixed $`k\ge1`$ and every stage $`j\ge k`$, its internal windows remain consecutive in the final sequence, and

```math
F(a,X_j,k)\ge X_j^{\varepsilon_0}.
```

Hence no window length works for this one sequence and this one positive exponent. W is false. This proves W implies U by contraposition; it does not assume that the window length in W is already uniform in the sequence.

## 4. Recentring any divisor cluster near a square root

The implication U implies R is immediate by taking $`L=N`$ and $`u=\sqrt N`$. For the converse, assume R and fix $`\delta>0`$. It suffices to treat $`0<\delta\le1`$, since larger exponents give smaller intervals.

Let $`L\ge2`$ and let a nonempty cluster of its divisors lie in an interval from U. Replace the left endpoint by the smallest divisor $`u`$ in the cluster, so $`1\le u\le L`$. Define

```math
D=L^3,\qquad z=\frac{D}{u^2},\qquad
t=\lceil z\rceil,\qquad N=tD.
```

Every $`td`$ from the cluster divides $`N`$. Also

```math
z\ge L,\qquad L^4\le N\le L^6+L^3\le2L^6,
```

and

```math
1\le\frac{tu}{\sqrt N}
=\sqrt{\frac tz}
\le\sqrt{1+\frac1L}
\le1+\frac1{2L}.
```

For every divisor $`d`$ of the cluster,

```math
1\le\frac{td}{\sqrt N}
\le\left(1+\frac1{2L}\right)(1+L^{-\delta})
<1+2L^{-\delta}.
```

Use R with $`\eta=\delta/8`$. Because $`N\le2L^6`$,

```math
N^{-\eta}\ge2^{-\delta/8}L^{-3\delta/4}.
```

For all sufficiently large $`L`$ this is strictly greater than $`2L^{-\delta}`$. Thus every scaled divisor lies in

```math
[\sqrt N,\ \sqrt N+N^{1/2-\eta}).
```

At most one of them equals the lower endpoint. Since $`N\ge L^4`$, R applies for all sufficiently large $`L`$, and bounds the original cluster size by $`C_\eta+1`$. The finitely many smaller $`L`$ are handled by the maximum of their divisor counts. This proves U with a constant independent of the interval position.

## 5. What is still missing

The proofs establish equivalence and explicit exponent losses. They do not establish a uniform bound on the divisor clusters, and they do not construct unbounded clusters at any fixed positive exponent. Either such result would resolve the corresponding full targets. A finite set of clusters, a bound with a constant depending on $`L`$, or the known exponent range above one quarter does not suffice.

The square-root statement is Conjecture 1 in [Letendre, *Divisors of an Integer in a Short Interval* (2025)](https://arxiv.org/html/2503.12146v1). Its general-scale conjecture and its proved bounds must be distinguished. The sources audited for this note did not yield a prior explicit statement of the complete W–U–R equivalence, but that limited negative search is not a novelty certificate. All three mathematical assertions remain open in this work.
