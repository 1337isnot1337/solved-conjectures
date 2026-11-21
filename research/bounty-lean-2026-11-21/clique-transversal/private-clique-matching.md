# Private maximal cliques and matching deficiency

Research note for [issue #228](https://github.com/1337isnot1337/solved-conjectures/issues/228),
2026-11-21. These are elementary structural reductions and a limitation of one
construction. No novelty, resolution of Erdős151, or bounty claim is made.
There is no Lean verification in this note.

## Definitions

All graphs are finite and simple. A **big maximal clique** is an
inclusion-maximal clique of size at least two. Write $`\gamma(G)`$ for the
maximum size of a set containing no big maximal clique of $`G`$. Choose such a
maximum set $`S`$, and let $`T=V(G)\setminus S`$. Thus $`T`$ is a minimum
transversal of the big maximal cliques and $`|S|=\gamma(G)`$.

For $`B\subseteq T`$, put

```math
N(B)=N_G(B)\cap S,\qquad U_B=B\cup N(B).
```

Let $`J`$ be the bipartite graph with parts $`T,S`$ and all edges of $`G`$
between them. Its matching deficiency on the $`T`$ side is

```math
d=|T|-\nu(J)
 =\max_{B\subseteq T} (|B|-|N(B)|).
```

The last equality is the deficiency form of Hall's theorem. The sufficient
spanning-subgraph route under investigation is

```math
\sigma(G):=\min\{\alpha(F):F\subseteq G
          \text{ is spanning and triangle-free}\}\leq\gamma(G).
```

It would imply Erdős151, but is not proved here.

## What maximality of S forces

Every $`t\in T`$ has a private big maximal clique $`C_t`$ satisfying
$`C_t\cap T=\{t\}`$. Otherwise $`T\setminus\{t\}`$ would still be a
transversal. In particular, every $`t`$ has a neighbor in $`S`$.

The following exchange observations are stronger than the individual private
cliques.

**Lemma 1.** If $`|B|>|N(B)|`$, then $`B`$ contains a big maximal clique of
$`G`$.

**Proof.** The set $`S'=(S\setminus N(B))\cup B`$ is larger than $`S`$, so it
contains a big maximal clique of $`G`$. There are no edges between $`B`$ and
$`S\setminus N(B)`$. Hence the clique lies wholly in one part. It cannot lie
in $`S`$, so it lies in $`B`$. ∎

**Lemma 2.** For every $`B\subseteq T`$,

```math
\gamma(G[U_B])\leq |N(B)|.
```

**Proof.** Let $`A\subseteq U_B`$ avoid all big maximal cliques of the induced
graph $`G[U_B]`$. Consider $`S'=(S\setminus N(B))\cup A`$. If a big maximal
clique $`C`$ of $`G`$ were contained in $`S'`$, it could not be contained in
$`S`$. It would therefore contain a vertex of $`B`$. Such a vertex has no
neighbor in $`S\setminus N(B)`$, so $`C\subseteq A`$. A clique maximal in
$`G`$ remains maximal in any induced subgraph containing it, contradicting
the definition of $`A`$. Thus $`S'`$ is clique-avoiding in $`G`$, and

```math
|S|-|N(B)|+|A|=|S'|\leq |S|.
```

Taking $`A`$ of maximum size proves the bound. ∎

The converse need not hold: a clique maximal in an induced subgraph may be
extendable in $`G`$. The argument only uses the valid direction above.

## Deficiency at most one is sufficient

**Proposition.** If $`d\leq1`$, then $`G`$ has a spanning triangle-free
subgraph $`F`$ with $`\alpha(F)\leq|S|`$. The construction uses matching edges,
isolates, and at most one odd cycle of length at least five.

If $`d=0`$, a matching saturates $`T`$. Keep its edges and make every remaining
vertex isolated. Its independence number is exactly $`|S|`$.

Suppose $`d=1`$. Choose an inclusion-minimal Hall-deficient set $`B\subseteq
T`$. Every proper subset satisfies Hall's inequality. Consequently
$`|N(B)|=|B|-1`$, and for every $`v\in B`$ there is a matching $`M`$ between
$`B\setminus\{v\}`$ and all of $`N(B)`$.

### Matching outside B

Every $`Y\subseteq T\setminus B`$ satisfies

```math
|N(B\cup Y)|\geq |B|+|Y|-1.
```

Subtracting $`|N(B)|=|B|-1`$ gives
$`|N(Y)\setminus N(B)|\geq |Y|`$. Hall's theorem therefore supplies a
matching saturating $`T\setminus B`$ into $`S\setminus N(B)`$.

### An alternating path or a five-cycle inside U_B

By Lemma 1 there is a big maximal clique $`C\subseteq B`$. Choose
$`v\in C`$, leave $`v`$ unmatched, and fix the matching $`M`$ described above.
For $`u\in B\setminus\{v\}`$, write $`m(u)\in N(B)`$ for its partner.

Make a directed graph on $`B`$ with an arc $`x\to u`$ when $`x`$ is adjacent
in $`G`$ to $`m(u)`$. Every vertex of $`B`$ is reachable from $`v`$ in this
directed graph. Indeed, if $`R`$ is the reachable set, then
$`N(R)=\{m(u):u\in R\setminus\{v\}\}`$: reachability gives one inclusion,
and matching edges give the other. Thus $`|N(R)|=|R|-1`$. Minimality of the
Hall-deficient $`B`$ forces $`R=B`$.

If some $`u\in C\setminus\{v\}`$ has shortest directed distance at least two
from $`v`$, choose a shortest path
$`v=x_0,x_1,\ldots,x_k=u`$ of length $`k\geq2`$. This path is simple.
Its corresponding alternating path is

```math
v,m(x_1),x_1,m(x_2),x_2,\ldots,m(x_k),u.
```

Together with the clique edge $`uv`$, this is an odd cycle of length
$`2k+1\geq5`$. Keep only its cycle edges and the matching edges at all
vertices of $`U_B`$ outside the cycle. The cycle uses $`k+1`$ vertices of
$`B`$ and their $`k`$ matched partners, so the remaining matching is perfect
on the other vertices of $`U_B`$.

Otherwise, all vertices of
$`C\setminus\{v\}`$ are reached in one arc, so $`v`$ is adjacent to each of
their distinct matching partners. If $`C=\{v,u\}`$, then $`m(u)`$ is a
common neighbor of $`v,u`$, contradicting maximality of $`C`$. Hence
$`|C|\geq3`$. Choose distinct $`u,w\in C\setminus\{v\}`$. The five distinct
vertices

```math
u,m(u),v,m(w),w
```

form a five-cycle using the four displayed bipartite edges and the clique
edge $`wu`$. Keep this cycle and the matching $`M`$ outside its vertices.
Chords in $`G`$ are not kept; the chosen subgraph is a cycle.

In either case the chosen graph on $`U_B`$ is triangle-free and has
independence number $`|N(B)|`$. Add the previously constructed outside
matching, and leave unmatched vertices of $`S\setminus N(B)`$ isolated.
The resulting spanning subgraph has

```math
\alpha(F)=|N(B)|+|S\setminus N(B)|=|S|.
```

This proves the proposition. ∎

## Reduction to a maximal deficient core

Let $`B\subseteq T`$ maximize $`|B|-|N(B)|=d`$. The same Hall calculation,
now with $`d`$ in place of $`1`$, shows that $`T\setminus B`$ can be matched
into $`S\setminus N(B)`$.

If the simultaneous-subgraph statement is known for $`G[U_B]`$, Lemma 2
gives a triangle-free spanning subgraph of that block with independence
number at most $`|N(B)|`$. Combining it with the outside matching and
remaining isolated vertices proves $`\sigma(G)\leq|S|`$.

There is also a reduction for Erdős151 itself. If the conjecture holds for
$`G[U_B]`$, take a triangle-free graph on $`|U_B|`$ vertices with independence
number at most $`\gamma(G[U_B])\leq|N(B)|`$, and combine it with the same
outside matching and isolates. This graph need not be a subgraph of $`G`$;
it still proves $`H(|V(G)|)\leq\gamma(G)`$.

Consequently a counterexample of minimum order, to either statement, must
have $`U_B=V(G)`$ for every maximally deficient $`B`$. Thus $`B=T`$ is the
unique maximizer, $`N(T)=S`$, and

```math
d=|T|-|S|\geq2.
```

Moreover, the bipartite graph must satisfy the strict Hall condition

```math
|N_J(X)|\geq |X|+1
\qquad\text{for every nonempty }X\subseteq S.
```

To see this, set $`A=N_J(X)\subseteq T`$. The nonempty $`X`$ has nonempty
$`A`$, since $`N(T)=S`$. There is no edge from $`T\setminus A`$ to $`X`$.
Hence

```math
|(T\setminus A)|-|N(T\setminus A)|
\geq d-|A|+|X|.
```

As $`T\setminus A`$ is a proper subset of $`T`$, uniqueness of the maximum
forces $`|A|>|X|`$. In particular, a matching saturating $`S`$ survives
deletion of any single vertex of $`T`$.

These are necessary properties of a smallest obstruction, not a proof that
no obstruction exists. The minimum-order argument cannot assume the desired
statement for the same-size block $`U_T=V(G)`$.

## Why odd-cycle pieces cannot solve every deficient core

Every graph whose components are isolated vertices, edges, or odd cycles of
length at least five satisfies

```math
\alpha(F)\geq \frac25|V(F)|.
```

An isolate contributes one independent vertex, an edge contributes one, and
an odd cycle of length $`2k+1\geq5`$ contributes $`k\geq2(2k+1)/5`$.
Independence numbers add over components.

Here is an explicit obstruction within the hard regime. Let $`Q`$ have as
vertices all even subsets of $`\{1,2,3,4,5\}`$, with two vertices adjacent
exactly when their symmetric difference has size four. There are sixteen
vertices. Translation by symmetric difference with any even set is an
automorphism.

The graph is triangle-free. Translate a putative triangle so that one
vertex is the empty set. The two others would be distinct four-element
subsets; their symmetric difference has size two, so they are not adjacent.

Its independence number is exactly five. Translate a nonempty independent
set so that it contains the empty set. All other members must be two-element
subsets, and any two of them must intersect. A pairwise-intersecting family
of pairs on five elements has at most four members: if all pairs have a
common element there are at most four; otherwise, after choosing two
intersecting pairs and a pair omitting their common element, all pairs must
belong to the triangle on their three elements, giving at most three.
The empty set together with $`\{1,2\},\{1,3\},\{1,4\},\{1,5\}`$ attains
five.

Since $`Q`$ is triangle-free, its big maximal cliques are its edges, so
$`\gamma(Q)=\alpha(Q)=5`$. But every spanning subgraph of the restricted
component form above has independence number at least
$`\lceil2\cdot16/5\rceil=7`$. Thus matching plus disjoint odd-cycle pieces
cannot establish $`\sigma(Q)\leq\gamma(Q)`$. The unrestricted statement does
hold for this graph, simply by taking $`F=Q`$.

This is the folded five-cube, also often called the five-regular Clebsch
graph. [Brouwer's primary graph page](https://aeb.win.tue.nl/graphs/Clebsch.html)
uses *Clebsch graph* for its ten-regular complement and explicitly explains
the naming ambiguity. The construction and independence proof above remove
any dependence on that terminology or on a table of Ramsey numbers.

The obstruction does not refute Erdős151. It rules out extending the
deficiency-one construction by requiring all components of the final
triangle-free graph to remain edges or odd cycles.

## Literature context for the stronger subgraph statement

Checked 2026-11-21. A bounded search of exact triangle-free-subgraph,
independence-number, clique-transversal, and conformal-hypergraph terminology
did not locate a named theorem, published conjecture, or published
counterexample for the exact assertion $`\sigma(G)\leq\gamma(G)`$. This is
a limit of the search, not evidence that the assertion is new or true.

The primary sources inspected distinguish several nearby statements:

- Zsolt Tuza, *Unsolved Combinatorial Problems, Part I* (2001),
  [Problem 66, Section 16](https://www.brics.dk/LS/01/1/BRICS-LS-01-1.pdf),
  asks whether the maximum clique-transversal number among graphs of order
  $`n`$ is attained by a triangle-free graph. This is the extremal statement
  of Erdős151. It does not require that the triangle-free graph be a subgraph
  of each given $`G`$.
- Colin McDiarmid, Dieter Mitsche, and Paweł Prałat, *Clique Colourings of
  Geometric Graphs*, EJC 25(4), P4.56 (2018),
  [Section 4, remark 4, p. 17](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v25i4p56/pdf/),
  ask whether every graph has a triangle-free subgraph with at least its
  clique chromatic number. This is a close subgraph analogue, but it compares
  chromatic numbers rather than bounding $`\alpha(F)`$. A large chromatic
  number does not by itself bound a graph's independence number from above;
  adding isolates makes the distinction explicit.
- Joret, Micek, Reed, and Smid, *Tight Bounds on the Clique Chromatic Number*
  (2021), [Theorem 1 and Corollary 2](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v28i3p51/pdf/),
  supply the known asymptotic clique-colouring bounds. They do not provide
  the required exact triangle-free spanning-subgraph comparison.
- Mohar and Wu, *Triangle-free subgraphs with large fractional chromatic
  number*, [Theorem 3](https://arxiv.org/pdf/1808.01605), prove a threshold
  statement for fractional chromatic number. Neither its parameter nor its
  conclusion is the exact independence bound needed here.
- Boros, Gurvich, Milanič, and Uno, *Conformal Hypergraphs: Duality and
  Implications for the Upper Clique Transversal Problem* (2025),
  [Section 4](https://doi.org/10.1002/jgt.23238), concerns the **maximum** size
  of a minimal transversal and recognition of dual conformality. That upper
  parameter is different from the **minimum** transversal size used in
  $`\gamma(G)=|V(G)|-\tau(G)`$.

Accordingly, this note treats $`\sigma(G)\leq\gamma(G)`$ only as an unproved
sufficient route. No located result discharges it, and the search supplies
no basis for assigning it a new conjecture name or claiming a literature-wide
absence of counterexamples. The proofs above are unchanged by this audit.
