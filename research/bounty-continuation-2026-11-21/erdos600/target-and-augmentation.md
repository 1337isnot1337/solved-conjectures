# Erdős 600: target audit, exact edits, and the remaining limit gap

Checked 21 November 2026. This is a partial mathematical investigation of the
whole first asymptotic question. It is not a solution of that question, a
fixed-parameter completion, or a prize claim. The elementary arguments below
were independently reviewed by the campaign coordinator. No priority claim
is made for them.

Coordination: [issue 223, comment 7069204391](https://github.com/1337isnot1337/solved-conjectures/issues/223#issuecomment-7069204391).
Related exclusions are in the [fresh target status audit](../eligibility/fresh-target-status-audit.md).

## 1. Exact paid target and source audit

For positive integers $`n,r`$, let $`e(n,r)`$ be the least integer $`m`$ such
that every simple graph on $`n`$ vertices with at least $`m`$ edges, each of
which lies in a triangle, has an edge lying in at least $`r`$ triangles.
The selected target is

```math
\forall r\geq2,\qquad
e(n,r+1)-e(n,r)\longrightarrow\infty\quad(n\longrightarrow\infty).
\tag{1}
```

The [Conjectures.io problem page](https://conjectures.io/problems/erdos600-erdos-600-parts-i)
displayed an estimated direct solver reward of $2,483 and no attempts when
checked on 21 November 2026. The estimate is denominated through Subnet 66
Alpha and is not a locked cash quote. The exact task identifier is
`fc-v2-parts-i-1d07d03134127e8944dc38e2-formalized`. The displayed type hash is
`7aeac9f2ec0e2514bbb4d975e0b2724ff741607674a3104ad6c50fab022e7aee`,
and the bundle identifier is
`44b122fe67ef543eec55085729c2827766331d68ae41d3985eb6282818941d5e`.

The [frozen upstream statement](https://github.com/google-deepmind/formal-conjectures/blob/7d1a8c9912747679d0093f6d1216420c33ee5ffa/FormalConjectures/ErdosProblems/600.lean)
quantifies over every natural $`r\geq2`$ and uses the difference after casting
the two extremal thresholds to the reals. Its definition is total: a threshold
larger than $`\binom n2`$ satisfies the universal implication vacuously, so the
set used by `sInf` is nonempty. No defect in that definition was identified.

The [submission terms](https://conjectures.io/submission-terms), version 13
effective 11 November 2026, require exact verification and manual review,
including originality. They do not make an existing conventional proof
eligible merely because its Lean formalization is new. Payment remains
conditional on acceptance and the platform's applicable quote. No fee,
verification submission, private-log upload, or financial transaction was
made in this investigation.

The mathematical source is Erdős, *Some problems on finite and infinite
graphs*, Contemporary Mathematics 65 (1987), 223–228, Problem 11 on printed
pages 226–227. Its [author-archive PDF](https://www.renyi.hu/~p_erdos/1987-28.pdf)
states the successive-difference question and the separate ratio question,
and records the Ruzsa–Szemerédi bounds. The current indexed
[problem page](https://www.erdosproblems.com/600),
[history](https://www.erdosproblems.com/history/600), and
[discussion](https://www.erdosproblems.com/forum/thread/600) were also checked.
The direct tracker fetch was restricted in this environment; its indexed
primary text was available.

The discussion already introduces the normalization below and examines
single-edge insertion and diagonal-matching deletions in blow-ups. A separate
[July 2026 working report](https://www.erdosproblemaday.com/report/600)
records finite computations, near-complete regimes, and the missing extremal
augmentation argument. Those observations are prior work, not achievements
of this investigation. Its computational claims were not rerun.

Fox and Loh, [*On a problem of Erdős and Rothschild on edges in triangles*](https://www.math.cmu.edu/~ploh/docs/research/20110821-erdos-rothschild.pdf),
Combinatorica 32 (2012), 619–628, treats the related fixed-density booksize
question. Its theorem does not compare two fixed successive booksize caps.
The introduction supplies a primary account of the triangle-removal
consequence used in Section 4.

Exact-expression searches, semicolon/comma variants, and searches combining
the target with `limsup`, `lim sup`, `unbounded`, and `clone` located no
explicit prior statement of Section 4's limsup deduction. The inspected
original problem, discussion, working report, and Fox–Loh paper do not state
that deduction. This is a bounded search result, not proof of novelty or of
the absence of other literature. No source checked supplied a full solution
of (1).

## 2. Extremal normalization

Write $`b_G(xy)=|N_G(x)\cap N_G(y)|`$ for the number of triangles through an
edge. Define

```math
F_r(n)=\max\bigl\{|E(G)|:|V(G)|=n,\quad
1\leq b_G(e)\leq r-1\text{ for every }e\in E(G)\bigr\}.
\tag{2}
```

The empty graph is admissible, and the maximum is attained. By the definition
of the threshold,

```math
e(n,r)=F_r(n)+1.
\tag{3}
```

Thus the full target is $`g_r(n)\to\infty`$, where

```math
g_r(n)=F_{r+1}(n)-F_r(n)\geq0.
\tag{4}
```

The parameter $`r`$ is fixed in every asymptotic statement below. The arguments
are uniform in the sense that they apply separately to every $`r\geq2`$.

## 3. Exact vertex replacement, including edges losing their last triangle

Let $`G`$ be admissible for $`F_r`$, and choose $`v\in V(G)`$. Set

```math
P_v=\{xy\in E(G):N_G(x)\cap N_G(y)=\{v\}\}.
\tag{5}
```

These edges have $`v`$ as their sole common neighbor. They lie inside
$`G[N_G(v)]`$ and lose their only triangle when $`v`$ is removed.

Choose $`S\subseteq V(G)\setminus\{v\}`$ such that

```math
1\leq d_{G[S]}(x)\leq r\qquad(x\in S).
\tag{6}
```

Empty $`S`$ is allowed, with (6) interpreted vacuously. Construct $`H`$ on the
same vertex set by deleting all original edges incident to $`v`$, deleting
the edges $`P_v\setminus E(G[S])`$, and adding $`vx`$ for every $`x\in S`$.
Then $`H`$ is admissible for $`F_{r+1}`$, and

```math
|E(H)|-|E(G)|
=|S|-d_G(v)-|P_v\setminus E(G[S])|.
\tag{7}
```

**Proof.** Every edge in $`P_v`$ has zero triangles in $`G-v`$. Deleting some
of those edges therefore destroys no triangle of $`G-v`$. In particular there
is no cascade of newly uncovered edges. None of the additional deleted edges
has both endpoints in $`S`$, so $`H[S]=G[S]`$.

A surviving old edge outside $`P_v`$ retains a triangle avoiding $`v`$.
A surviving edge of $`P_v`$ has both endpoints in $`S`$ and regains the triangle
through $`v`$. Every surviving old edge gains at most one triangle relative
to $`G`$, so its final booksize is at most $`r`$. A new edge $`vx`$ lies in
exactly $`d_{G[S]}(x)`$ triangles, which is in $`[1,r]`$ by (6). Finally the
three changes in the edge count give (7). $`\square`$

The final term in (7) cannot be dropped. If $`r=2`$, the neighborhood of each
vertex induces a perfect matching: each neighbor $`x`$ has exactly one
neighbor in $`N_G(v)`$ because $`vx`$ has booksize one. Every edge in that
matching belongs to $`P_v`$. Therefore a replacement that keeps all old
edges of $`G-v`$ must contain both endpoints of every such matching edge,
and hence must satisfy $`N_G(v)\subseteq S`$.

For an extremizer, (7) would settle (1) if one could always make its right
side tend to infinity. No such choice of $`v,S`$ has been proved. The next
section gives a weaker conclusion by allowing one extra vertex instead.

## 4. Cloning proves an unbounded subsequence

### 4.1 A one-vertex inequality

Given a graph $`G`$ admissible for $`F_r(n-1)`$, choose a maximum-degree vertex
$`v`$ and add a new nonadjacent twin $`v'`$ with
$`N(v')=N_G(v)`$.

An old edge with both endpoints in $`N_G(v)`$ gains one common neighbor.
Every other old edge keeps its former booksize. A new edge $`v'x`$ has the
same common-neighbor count that $`vx`$ had in $`G`$. Thus the resulting graph
is admissible for $`F_{r+1}(n)`$. Applying this to an extremizer and using
maximum degree at least average degree gives, for $`n\geq2`$,

```math
F_{r+1}(n)
\geq F_r(n-1)+\Delta(G)
\geq\frac{n+1}{n-1}F_r(n-1).
\tag{8}
```

Consequently,

```math
\frac{g_r(n)}{n(n+1)}
\geq
\frac{F_r(n-1)}{(n-1)n}
-\frac{F_r(n)}{n(n+1)}.
\tag{9}
```

### 4.2 The two growth facts used

For each fixed $`r`$,

```math
F_r(n)=o(n^2).
\tag{10}
```

This is the Ruzsa–Szemerédi/triangle-removal consequence recorded in the
primary sources above. One can see the implication directly from triangle
removal: an admissible graph has at most $`(r-1)|E(G)|/3=O_r(n^2)`$ triangles,
so $`o(n^2)`$ edges suffice to destroy all its triangles. If $`D`$ is such a
deletion set, every original edge is either in $`D`$ or shares a triangle
with an edge of $`D`$. Each edge of $`D`$ belongs to at most $`r-1`$ triangles
and therefore accounts for at most $`1+2(r-1)`$ original edges. Hence
$`|E(G)|\leq(2r-1)|D|=o(n^2)`$.

The other growth fact is

```math
\frac{F_r(n)}n\longrightarrow\infty.
\tag{11}
```

For completeness, (11) has an elementary construction. Let $`m=3^k`$ and
let $`D`$ be the $`2^k`$ integers in $`[0,m-1]`$ with ternary digits only zero
or one. This set has no nonconstant three-term arithmetic progression:
in an equality $`a+c=2b`$ there are no carries on either side, so digit by
digit the three entries must agree.

Take disjoint tagged parts

```math
X=\{0,\ldots,m-1\},\quad
Y=\{0,\ldots,2m-1\},\quad
Z=\{0,\ldots,3m-1\}.
```

For every $`x\in X`$ and $`d\in D`$, put in the triangle
$`(x,x+d,x+2d)`$. Each pair of its vertices determines $`x,d`$, so these
prescribed triangles are edge-disjoint. Any triangle of the resulting
tripartite graph has consecutive differences $`d_1,d_2\in D`$ and half its
$`X`$–$`Z`$ difference $`d_3\in D`$, with $`d_1+d_2=2d_3`$. Thus all three
differences agree, and the triangle is one of the prescribed ones.
The graph has $`6m`$ vertices and $`3m2^k`$ edges, with every edge in exactly
one triangle. It is admissible for every $`r\geq2`$.

For arbitrary sufficiently large $`n`$, choose the largest $`k`$ such that
$`6\cdot3^k\leq n`$ and add isolated vertices. Since
$`n<18\cdot3^k`$, this gives $`F_r(n)/n>2^k/6`$, proving (11).

### 4.3 Telescoping and its precise conclusion

Sum (9) over $`n=N+1,\ldots,M`$ and use (10) as $`M\to\infty`$:

```math
\sum_{n>N}\frac{g_r(n)}{n(n+1)}
\geq\frac{F_r(N)}{N(N+1)}.
\tag{12}
```

The sum is interpreted in the extended nonnegative reals; convergence is
not assumed. Since $`\sum_{n>N}1/[n(n+1)]=1/(N+1)`$, (12) implies

```math
\sup_{n>N}g_r(n)\geq\frac{F_r(N)}N.
\tag{13}
```

If the supremum is infinite the inequality is immediate; otherwise it
follows by bounding every summand by that supremum times its weight. By
(11), for every fixed $`r\geq2`$,

```math
\limsup_{n\to\infty}\bigl(e(n,r+1)-e(n,r)\bigr)=\infty.
\tag{14}
```

Equation (14) is the result proved here. It permits arbitrarily late small
values of the difference. It does not imply the limit in (1).

## 5. Why arbitrary admissible graphs cannot always be augmented

There is a uniform obstruction even when both order and degree grow. It is
an obstruction to an overly strong augmentation lemma, not to (1).

Let $`K=KG(6,2)`$, whose 15 vertices are the two-element subsets of a
six-element set, with adjacency meaning disjointness. It has degree six.
The number of common neighbors of two vertices $`A,B`$ is

```math
|N_K(A)\cap N_K(B)|=
\begin{cases}
1,&A\cap B=\varnothing,
\\ 3,&A\ne B\text{ and }|A\cap B|=1,
\\ 6,&A=B.
\end{cases}
\tag{15}
```

For instance, a common neighbor is a two-subset of the complement of
$`A\cup B`$, which has size two, three, or four respectively.

For any $`m\geq1`$, form the categorical product $`K^{\otimes m}`$: two
$`m`$-tuples are adjacent exactly when their entries are adjacent in every
coordinate. The graph has $`15^m`$ vertices and degree $`6^m`$. Common-neighbor
counts multiply over coordinates. Thus every edge has exactly one common
neighbor, and every distinct nonadjacent pair has at least three.

Now fix any $`r\geq2`$ and put $`t=r-1`$. Replace every vertex of this product
by an independent set of size $`t`$, replacing each original edge by the
complete bipartite graph between its two fibers. The new graph has

```math
|V|=t15^m,\qquad d=t6^m,
\qquad b(e)=t\text{ for every edge }e.
\tag{16}
```

A nonedge between different fibers has at least $`3t`$ common neighbors.
A nonedge within one fiber has $`t6^m\geq3t`$ common neighbors. If $`t=1`$,
the latter type is absent. Since

```math
3t>t+1=r,
\tag{17}
```

adding any one nonedge already gives that new edge more than $`r`$ triangles.
Adding further edges cannot decrease its count. Hence this graph admits no
proper edge-supergraph on the same vertex set that is admissible for
$`F_{r+1}`$.

The construction disproves a universal claim that every admissible graph
of sufficiently large degree admits even one triangle-preserving monotone
insertion at the next booksize cap. No claim that these graphs attain
$`F_r(n)`$ is made. An argument using extremality, vertex replacement, or
both is still possible.

## 6. Exact remaining obligation

The full target needs an estimate forcing the *lower* limit of $`g_r(n)`$ to
infinity. The cloning proof instead controls a weighted tail average.
A sufficient improvement of its one-step estimate would be

```math
F_r(n)-F_r(n-1)
\leq\frac{2F_r(n-1)}{n-1}-\eta_r(n),
\qquad \eta_r(n)\longrightarrow\infty.
\tag{18}
```

Then (8) would give $`g_r(n)\geq\eta_r(n)`$. This is only a sufficient
condition, not a bound established here.

Ordinary vertex deletion gives much less. For an $`F_r(n)`$-extremizer,
delete a minimum-degree vertex $`v`$ and the edges $`P_v`$. As in Section 3,
this has no cascade, and the remaining graph is admissible for $`F_r(n-1)`$.
Since $`G[N_G(v)]`$ has maximum degree at most $`r-1`$,

```math
|P_v|\leq\frac{r-1}{2}d_G(v),\qquad
d_G(v)\leq\frac{2F_r(n)}n.
```

Therefore

```math
F_r(n)-F_r(n-1)
\leq d_G(v)+|P_v|
\leq\frac{r+1}{n}F_r(n).
\tag{19}
```

This coefficient and the possible loss of private edges do not imply (18).
The other concrete route is to make the right side of (7) grow on an
extremizer. Neither route has been completed. No full proof, full
counterexample, Lean solution, accepted submission, or payout for Erdős 600
is asserted.
