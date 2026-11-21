# Erdős 617: the exact limit of isolated-clique compression

21 November 2026. This note records a blocked route after the extremal necessary-graph normalization. It supplies no full resolution or new bounty claim. The ambient graphs satisfy necessary single-color conditions; they are not assumed realizable as simultaneous color classes after replacement.

## Standing hypotheses

Use the reviewed normal form

```math
H=qK_r\mathbin{\dot\cup}R,
\qquad q\ge3,\quad s=r-q\ge4,
\qquad |R|=rs+1,\quad\alpha(R)=s,\quad\delta(R)\ge r.
```

The core R is connected, independence-critical, and K_r-free. Every proper induced subgraph obeys

```math
|W|\le r\alpha(R[W]).
\tag{1}
```

The available edge budget is

```math
e(R)\le\frac{r^2s+(q+1)r}{2}
=\frac{r|R|}{2}+\frac{qr}{2}.
\tag{2}
```

All induced palette caps remain in force. No use is made of the connected-color-class inequality q(q-1)<r, which does not apply to this disconnected normal form.

## 1. Every further compression into isolated cliques fails the independence threshold

Let X be any nonempty subset of V(R), and let h=|X|. To replace these vertices by isolated cliques of order at most r requires at least

```math
k=\left\lceil\frac hr\right\rceil
```

cliques. The new core's independence number would therefore be at least alpha(R-X)+k.

By (1), applied to R-X, including the empty-set case,

```math
\alpha(R-X)
\ge\left\lceil\frac{rs+1-h}{r}\right\rceil
=s+1-\left\lceil\frac hr\right\rceil.
```

Thus every such replacement has independence number at least s+1. It is inadmissible before its edge saving is considered.

The ceiling identity is exact. If h=ar+b with 0<=b<r, the two cases b=0 and b>0 give the same displayed equality. Taking more replacement cliques only worsens the independence count.

Including some existing full-clique components in the replaced set does not fix this obstruction. Deleting an entire K_r lowers the outside independence by one but supplies r more vertices to place; these changes cancel. Deleting only part of a clique does not lower its contribution to the outside independence.

This explains precisely why repeated use of the earlier replacement move cannot remove the final core. It is not an additional unproved conjecture about R: it follows directly from the established ratio-minimality condition.

## 2. Independent-set expansion is already contained in ratio-minimality

For an independent k-set S in R, put Y=R-N[S]. Every independent set in Y can be adjoined to S, so alpha(Y)<=s-k. If Y is nonempty, (1) gives |Y|<=r(s-k); the same order inequality holds when Y is empty. Consequently

```math
|N[S]|\ge rk+1.
\tag{3}
```

Thus the independently derived neighborhood-expansion statement does not provide a second constraint beyond (1) at this stage.

A useful equivalent deletion consequence is that removing at most rk vertices leaves independence at least s-k+1, for 1<=k<=s. In particular,

```math
\alpha(R-X)=s\qquad\text{whenever }|X|\le r.
\tag{4}
```

Every set of at most r vertices can be avoided by a maximum independent set. If a degree-r vertex exists, its closed neighborhood is a smallest possible vertex set whose deletion lowers independence: it has size r+1, and its removal leaves independence exactly s-1.

These are deletion statements, not proper-coloring statements. For example, |R-v|=rs and alpha(R-v)=s do not supply a partition of R-v into r independent sets of size s. Such a partition would be needed to prove r-colorability after deleting v. No argument producing it from all palette caps and (1) was obtained.

## 3. A legitimate transfer of chromatic-critical edge excess

Since |R|=rs+1 and alpha(R)=s, R is not r-colorable. It contains an actual (r+1)-critical subgraph F. This subgraph need not be induced or spanning. Write

```math
f=|V(F)|,\quad X=V(R)\setminus V(F),
\quad a=e(R[V(F)])-e(F),
\quad b=e_R(V(F),X).
```

Here a>=0 and b>=0. Minimum degree at least r in R gives

```math
2e(R[X])+b\ge r|X|.
```

Therefore

```math
e(R)-\frac{r|R|}{2}
\ge e(F)-\frac{rf}{2}+a+\frac b2.
\tag{5}
```

This step is valid without any transfer of chromatic criticality to R.

Kostochka and Yancey's critical-graph bound, with k=r+1, gives

```math
e(F)-\frac{rf}{2}
\ge\frac{(r-2)(f-r-1)}{2r}.
```

Combining with (2) and (5) yields the exact necessary inequality

```math
(r-2)(f-r-1)+2ra+rb\le qr^2.
\tag{6}
```

In particular,

```math
f\le r+1+\frac{qr^2}{r-2}.
\tag{7}
```

The preceding repository note `erdos617-critical-cores.md` already gives the non-transfer warning and the lower bound f>=3r-1 by comparing the same critical-graph theorem with the palette caps. Those are earlier results in this campaign, not new claims here. Together they leave the interval

```math
3r-1\le f\le
\min\!\left\{rs+1,\ r+1+\frac{qr^2}{r-2}\right\}.
```

This interval is not empty in the surviving parameter range merely from q>=3 and s>=4. Its numerical compatibility does not establish the existence of a graph; it shows that these inequalities do not establish nonexistence.

## 4. Even a spanning critical subgraph would not finish the argument

Suppose, as an additional unproved hypothesis, that F could be chosen spanning. Substituting f=rs+1 into the critical edge bound and comparing with (2) gives

```math
\frac{r^2s+(q+1)r}{2}
-\frac{(r-1)(r+2)(rs+1)-(r+1)(r-2)}{2r}
=\frac{(r-1)(r+2-2s)}2.
```

Thus this extra hypothesis would force only 2s<=r+2. It would exclude part of the parameter range, while leaving a substantial range unexcluded. The normalization does not currently justify the spanning hypothesis in the first place.

The missing steps are therefore distinct: either control the size and attachment of a true chromatic-critical subgraph strongly enough to make (6) impossible, or obtain a new independence/edge bound that excludes the whole single core. Repeating isolated-clique compression or substituting R directly into a chromatic-critical theorem supplies neither step.

## Source and verification boundary

- The extremal normal form and its scope are in [the normalization note](erdos617-extremal-core-normalization.md).
- The previous critical-subgraph discussion is in [the critical-core note](erdos617-critical-cores.md).
- The exact Kostochka–Yancey inequality was checked in their primary manuscript [*A Brooks-type result for sparse critical graphs*, Theorem 4](https://arxiv.org/pdf/1408.0846), which restates their 2014 theorem. The original paper is [*Ore's conjecture on color-critical graphs is almost true*](https://doi.org/10.1016/j.jctb.2014.05.002).
- The displayed algebraic factorizations were independently checked symbolically. No finite-parameter screen, formal proof-assistant verification, or full conjecture resolution is claimed.
