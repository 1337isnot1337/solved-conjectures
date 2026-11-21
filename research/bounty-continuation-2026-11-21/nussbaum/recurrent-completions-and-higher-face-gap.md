# Recurrent Boolean completions and the remaining higher-face gap

21 November 2026. This is a continuation of the
[full Nussbaum target](target-and-interpolation.md), using the
[two-anchor theorem](two-anchor-and-clique-stabilizers.md).
It gives a dynamic reduction and two exact limits on possible shortcuts.
It does not prove or disprove the full period bound.

## 1. A Boolean cycle supplies a cyclic anchor cover

Let $`F`$ be a formula map, let $`g`$ be its restriction to the
Boolean cube, and let $`x_0,\ldots,x_{p-1}`$ be an orbit of least
period $`p`$. Write $`Q_i=V(x_i)`$ for its completion faces.
Information monotonicity implies


```math
g(Q_i)\subseteq Q_{i+1},
\tag{1}
```


where indices are read modulo $`p`$.

Iterating $`g^p`$ from any Boolean vertex of $`Q_0`$ stays in
that finite nonempty face. It eventually reaches a point $`y`$
periodic under $`g^p`$, and therefore under $`g`$. Let its least
$`g`$-period be $`\ell`$, and put


```math
d=\gcd(p,\ell),\qquad L=\ell/d.
```


The whole $`g^p`$-orbit of $`y`$ lies in $`Q_0`$. By (1),


```math
C_i=\{g^{i+tp}(y):t\in\mathbb Z\}\subseteq Q_i.
\tag{2}
```


Inside the Boolean $`\ell`$-cycle, these are the exponent residue
classes modulo $`d`$. In particular, they have $`L`$ elements,
and $`C_i`$ depends only on $`i\bmod d`$. Choosing one
Boolean vertex from each of the $`d`$ classes gives $`d`$ fixed
anchors covering all the orbit faces.

**Corollary.** If one Boolean cycle obtained this way has
$`\gcd(p,\ell)\le2`$, then $`p\le2^n`$.

Indeed, the orbit faces are an antichain covered by at most two Boolean
anchors. The two-anchor theorem supplies distinct representatives in
their own union.

This does not assume that a Boolean completion follows a Boolean orbit
of length $`p`$. The Boolean cycle can be shorter, and usually is.

## 2. A quantitative bound from the whole recurrent class

For $`r\in\{0,\ldots,d-1\}`$, let $`H_r`$ be the cube
hull of $`C_r`$. All $`p/d`$ faces in phase class $`r`$
contain $`H_r`$, which contains $`L`$ distinct Boolean vertices.
Its dimension $`h_r`$ therefore satisfies


```math
h_r\ge h:=\lceil\log_2 L\rceil.
```


Factoring out the $`h_r`$ free coordinates of $`H_r`$, the
remaining faces contain a common Boolean vertex and are incomparable.
Their free-coordinate sets are an antichain in a Boolean lattice on
$`n-h_r`$ elements. Sperner's bound gives


```math
\frac pd\le
\binom{n-h_r}{\lfloor(n-h_r)/2\rfloor}
\le
\binom{n-h}{\lfloor(n-h)/2\rfloor}.
\tag{3}
```


The second inequality follows because the middle binomial coefficient
is nondecreasing in the ground-set size. The case $`n=h`$ is
included, with the binomial coefficient equal to one.

Thus


```math
p\le d\binom{n-\lceil\log_2(\ell/d)\rceil}
                    {\lfloor(n-\lceil\log_2(\ell/d)\rceil)/2\rfloor}.
\tag{4}
```


One simple sufficient condition is $`\ell\ge d^2`$, since


```math
p\le d\,2^{n-h}
\le \frac{d^2}{\ell}\,2^n
\le2^n.
\tag{5}
```


Equations (2)–(5) hold for every Boolean cycle reached by iterating
$`g^p`$ inside an orbit face. A putative counterexample must fail
these sufficient conditions for every such cycle. No argument here
forces a favorable Boolean cycle to exist.

## 3. Recurrent deletion can erase an exponentially long formula cycle

This construction shows why the recurrent-set reduction is not itself
a period lift.

Fix $`1\le k\lt n`$, and cyclically order all $`k`$-subsets of
$`[n]`$, with successor permutation $`\sigma`$. For each
such subset $`A`$, put


```math
x^A_j=\begin{cases}1,&j\in A,\\ *,&j\notin A.\end{cases}
```


Define $`h_j(x)=x_j\vee\neg x_j`$, and set


```math
F_i(x)=
\bigvee_{A:\ i\in\sigma(A)}\ \bigwedge_{j\in A}h_j(x).
\tag{6}
```


Every displayed disjunction is nonempty, because the successor subsets
run through all $`k`$-sets and $`k\ge1`$. At $`x^B`$,
$`h_j`$ is 1 on $`B`$ and $`*`$ elsewhere. The inner
conjunction is 1 exactly when $`A\subseteq B`$, equivalently
$`A=B`$, and otherwise is $`*`$. Therefore


```math
F(x^B)=x^{\sigma(B)}.
```


This is a cycle of least period $`\binom nk`$. Expanding (6)
by distributivity gives noncontradictory DNF clauses: each clause picks
one of $`x_j,\neg x_j`$ for each $`j\in A`$, and never
uses both for the same variable.

On a Boolean input every $`h_j`$ equals 1. Consequently the
Boolean restriction is the constant map


```math
g(b)=\mathbf1\qquad(b\in\{0,1\}^n).
```


Its recurrent set is the singleton $`\{\mathbf1\}`$, and
every recurrent completion set, as well as its cube hull, is that
same singleton. The formula period is nonetheless $`\binom nk`$.
Taking $`k=\lfloor n/2\rfloor`$ makes it exponential in $`n`$,
and every state has at least two stars when $`n\ge4`$.

This is not a counterexample to the Nussbaum bound. All faces contain
the one anchor $`\mathbf1`$, so the ordinary antichain bound
applies. It does rule out inferring that the formula period must
divide the recurrent Boolean period, or bounding the formula period
by a fixed multiple of the number of recurrent Boolean states, from
recurrent deletion alone. This example does not disprove the converse
divisibility, since its Boolean period is one. A general argument
must retain more information about the faces.

### Three anchors do not satisfy the same Hall theorem

The root reviewer supplied the following exact scope example. In
$`\{0,1\}^4`$, take anchors


```math
r=0000,\qquad s=1110,\qquad t=1001,
```


and include every 2-dimensional face containing at least one of them.
Each anchor belongs to six squares. The distances $`d_H(r,s)`$
and $`d_H(s,t)`$ are three, so neither pair lies in a common
square. The pair $`r,t`$ has distance two and lies in exactly
one square. Thus the family has $`3\cdot6-1=17`$ distinct
squares. They form an antichain, but their union has at most the 16
Boolean vertices of the ambient cube. There is no system of distinct
representatives.

This family has not been asserted to be a cyclic formula orbit. It
shows that the $`d\ge3`$ remainder of the dynamic anchor cover
cannot be closed by a general three-anchor version of Theorem (1)
in the companion note.

## 4. Smallest-face dimension does not force the easy clique structures

The following uniform construction is a scope counterexample to an
abstract graph reduction. It is deliberately inefficient in ambient
dimension and does not threaten the claimed period bound.

Choose pairwise coprime integers $`q_1,q_2,q_3\ge3`$, put
$`p=q_1q_2q_3`$, and let $`G`$ be the Cartesian product


```math
K_{q_1}\mathbin\square K_{q_2}\mathbin\square K_{q_3}.
```


Vertices are triples, adjacent when they differ in exactly one
coordinate. Adding 1 in every coordinate is a single cycle on the
$`p`$ vertices, by coprimality. Fix its vertex $`0`$. Its
neighbors split into three disjoint cliques $`N_1,N_2,N_3`$, of
sizes $`q_1-1,q_2-1,q_3-1`$.

We realize $`G`$ as the compatibility graph of an antichain of
faces $`Q_v`$, with $`Q_0`$ a square and every other face
of dimension at least two.

### Two initial coordinates

On two coordinates give $`Q_0`$, and every nonneighbor of 0,
the symbol pair $`**`$. Give neighbors in $`N_1,N_2,N_3`$
the respective pairs $`00,01,10`$. These coordinates create
exactly the desired incompatibilities among different neighbor
cliques, and no unwanted incompatibility.

### Remaining nonedges

For every nonedge $`\{u,v\}`$ not already handled by those
two coordinates, at least one endpoint is outside the closed
neighborhood of 0. Call one such endpoint $`u`$. Add a coordinate
with value 1 at $`Q_u`$, value 0 at $`Q_v`$ and $`Q_0`$,
and $`*`$ at every other face. If $`v=0`$, these two zero
assignments coincide.

This creates incompatibility only for the intended pair $`u,v`$
and the already valid nonedge $`u,0`$. It handles all remaining
nonedges. No edge of $`G`$ is turned into an incompatibility.

### Private completions and the minimum dimension

For every $`v\ne0`$, add two private coordinates that are
$`*`$ at $`Q_v`$ and 0 at every other face. These coordinates
create no incompatibility. They give every $`Q_v`$, $`v\ne0`$,
at least two free coordinates. The face $`Q_0`$ is fixed to zero
on all added coordinates and is free only on the first two, so it
has dimension exactly two.

Every face has a Boolean completion belonging to no other face.
For $`v\ne0`$, set one of its private coordinates to 1 and
complete the rest consistently. For $`Q_0`$, use $`11`$ on
the first two coordinates and zero on all others. This excludes its
neighbors by their initial codes. A nonneighbor $`u`$ is excluded
by the coordinate added for $`\{u,0\}`$, where it is fixed to
1. These private completions imply that the faces are an antichain.

The prescribed cyclic permutation of the $`Q_v`$ preserves
compatibility. The exact DNF interpolation criterion in the target
note applies: its first condition follows from compatibility, and
its uncovered-completion condition follows from the private Boolean
vertex of each face. It yields a noncontradictory-DNF formula map
with precisely this $`p`$-cycle. This is an existence recipe for
explicit formulas, not an assumption that graph symmetry extends to
the ambient cube.

### Its clique data

The maximal cliques of $`G`$ are its coordinate lines. Every
vertex belongs to three such cliques. Their three cyclic orbits have
stabilizer orders $`q_1,q_2,q_3`$, and therefore their total
number is


```math
p\left(\frac1{q_1}+\frac1{q_2}+\frac1{q_3}\right).
```


For example, $`(q_1,q_2,q_3)=(3,5,7)`$ gives 105 states and
only 71 maximal cliques. Its clique-cover number is 15: every clique
has at most 7 vertices, and the 15 coordinate lines in the third
direction partition the graph. Thus neither a two-clique cover nor
the sufficient reciprocal-stabilizer inequality follows from
cyclicity plus the existence of a two-star state.

More generally, with $`q_3=\max_i q_i`$, the clique-cover
number is $`q_1q_2`$, which is unbounded. The construction has
at least $`2p`$ coordinates before most nonedge coordinates are
counted. It supplies no small-dimensional counterexample; its private
completions already give distinct Boolean representatives.

The remaining obligation is quantitative cube geometry in efficient
representations, or a different property of formula dynamics. The
compatibility graph and the minimum star count alone do not force
the sufficient conditions proved so far.
