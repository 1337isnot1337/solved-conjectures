# Minc's integrality conjecture: source and transformation audit

Research checkpoint, 20 November 2026 (America/Chicago). The full conjecture remains
unresolved in this investigation. No new order is claimed and no item is
added to the resolved-conjecture count.

## Exact target

For integers $`1\leq k\leq n`$, let $`\Delta_n^k`$ be the nonnegative integer
matrices of order $`n`$ with every line sum $`k`$, and let
$`\Lambda_n^k\subseteq\Delta_n^k`$ be the zero-one matrices. Minc's
Conjecture 24 is

```math
\min_{A\in\Delta_n^k}\mathop{\mathrm{per}}A
=\min_{A\in\Lambda_n^k}\mathop{\mathrm{per}}A.
```

It asserts existence of a binary minimizer. The stronger assertion that
every minimizer is binary is not part of the stated target.

Equivalently, among bipartite $`k`$-regular multigraphs with $`n`$ vertices
in each part, a minimum number of perfect matchings is attained by a
simple graph. Parallel edge copies are counted separately in matchings.

The integer domain and $`k\leq n`$ are essential. Real entries give a
different problem, settled by the uniform matrix through van der Waerden's
theorem. For $`k>n`$, the displayed binary class is empty.

## Primary sources and current-status check

The following sources were inspected in this pass.

1. [Lavi's live C24 page](https://yair-lavi.com/mincs-list/conjecture-24/index.html)
   continues to label the full conjecture open. Its reported progress is
   finite-order verification and a fixed-defect asymptotic statement on
   $`k=n-1`$. These reports are not a full theorem.
2. [Cheon and Wanless, 2005, complete author PDF](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf),
   Conjecture 24 and Section 4, distinguish the integer and binary minima.
   The survey reports no progress on C24 at its publication date. Its
   shorthand definition omits the word “integer”; the intended domain is
   confirmed explicitly by the next source.
3. [Wanless, 2006, complete author PDF](https://users.monash.edu.au/~iwanless/papers/Schrijminper.journalvers.pdf),
   *Addendum to Schrijver's work on minimum permanents*, defines the integer
   class explicitly on its first page. Theorem 1 equates the asymptotic
   $`n`$-th-root scales, even when $`k`$ varies with $`n`$. The introductory
   discussion expressly separates this result from a resolution of C24.
4. [Csikvári, arXiv:1406.0766](https://arxiv.org/abs/1406.0766), the primary
   record and abstract of the lower matching theorem, gives lower bounds
   on partial matchings. At the perfect-matching endpoint its displayed
   bound reduces to Schrijver's bound. The extra square-root factor
   described there applies away from that endpoint.
5. [Cheon and Song, 2024, publisher record](https://articles.math.cas.cz/10.21136/CMJ.2023.0186-23),
   *A conjecture on minimum permanents*, concerns Pula--Song--Wanless
   faces of the doubly stochastic polytope. It is a title collision, not
   a proof of C24.

Both search engines were queried for the exact conjecture number, integer
minimum permanents, simple versus multiple-edge regular graphs, and recent
proofs. Strong searches included a one-year recency window. No full
resolution was found in the inspected results. This is a bounded source
audit, not a guarantee that no inaccessible or unindexed paper exists.

The 1983 Minc article was not read in full during this pass. Its original
citation is *Theory of permanents 1978--1981*, Linear and Multilinear Algebra
12 (1983), 227--263, DOI
[10.1080/03081088308817488](https://doi.org/10.1080/03081088308817488).

## Prior failed shortcut retained

The earlier repository note
[switch_descent_obstruction.md](switch_descent_obstruction.md)
contains an exact infinite family with one repeated entry for which every
collision-reducing four-cycle switch increases the permanent. A displayed
six-cycle switch escapes that family. It also disproves arbitrary
entrywise balancing of a prescribed row pair.

Consequently none of the following has been assumed:

* a collision-reducing four-cycle always improves the permanent;
* balancing any prescribed two rows improves the permanent;
* a lift to a larger simple graph yields a binary competitor of the
  original order;
* the matching polynomial's real-rootedness makes the perfect-matching
  polynomial in individual edges a matroid polynomial.

Longer alternating cycles remain a possible route, but a general
permanent-decreasing transformation has not been established.

## Two exact constraints on a hypothetical minimizer

The following elementary facts help delimit the remaining problem. No
priority is claimed for them.

### A minimizer is connected when $`k\geq2`$

Every edge copy of a regular bipartite multigraph belongs to a perfect
matching, because the graph decomposes into $`k`$ perfect matchings.
Consequently its matrix has total support and decomposes, after row and
column permutations, into fully indecomposable square blocks.

Suppose there are two blocks with permanents $`P_1,P_2`$. Choose one edge
copy in each, and let $`G_1,G_2`$ be the corresponding permanental cofactors.
Delete those copies and add the two crossed edges between the blocks.
The new permanent on these blocks is

```math
(P_1-G_1)(P_2-G_2)+G_1G_2.
```

Put $`q_i=G_i/P_i`$, the fraction of perfect matchings containing the chosen
edge copy. Then $`0\lt q_i<1`$: one factor of a $`k`$-edge-colouring contains
the copy and another avoids it. The relative change is

```math
-q_1-q_2+2q_1q_2
=-q_1(1-q_2)-q_2(1-q_1)<0.
```

The operation preserves nonnegative integer entries and line sums. Thus
no disconnected matrix is a global minimizer for $`k\geq2`$. The same
argument applies within the binary class.

Connectivity does not exclude repeated entries: the previous
four-switch obstruction already has connected support.

### Weighted sum of all four-switch inequalities

Write $`P=\mathop{\mathrm{per}}A`$,

```math
G_{ij}=\mathop{\mathrm{per}}A(i\mid j),\quad
R_i=\sum_sG_{is},\quad C_j=\sum_rG_{rj}.
```

For $`a_{ij}>0`$, remove one at $`(i,j),(r,s)`$ and add one at
$`(i,s),(r,j)`$. If the rows or columns coincide this is the zero move.
Otherwise its exact permanent change is

```math
\Delta_{ij;rs}
=-G_{ij}-G_{rs}+G_{is}+G_{rj}
+2\mathop{\mathrm{per}}A(i,r\mid j,s).
```

When $`a_{rs}>0`$ the move is legal. Multiply by $`a_{rs}`$ and sum over
all $`r,s`$, treating the second cofactor as zero for coinciding rows or
columns. Row and column sums, Laplace expansion, and homogeneity of the
$`(i,j)`$-minor give

```math
\sum_{r,s}a_{rs}\Delta_{ij;rs}
=k(R_i+C_j)-nP-(nk-2n+2)G_{ij}.                 \tag{1}
```

For example, the second-cofactor sum used here is

```math
\sum_{\substack{r\ne i\\s\ne j}}a_{rs}
\mathop{\mathrm{per}}A(i,r\mid j,s)=(n-1)G_{ij}.
```

At a global integer minimizer every legal change is nonnegative, so

```math
k(R_i+C_j)\geq nP+(nk-2n+2)G_{ij}
\quad\text{whenever }a_{ij}>0.                 \tag{2}
```

Multiplying (2) by $`a_{ij}`$ and summing again yields the necessary bound

```math
\frac{\sum_{i,j}G_{ij}}{P}
\geq \frac{n(nk-n+1)}{k^2}.                    \tag{3}
```

These formulas have no assumption of binary entries. They have been
checked by exact arithmetic in the companion script.

The missing step is substantive: (2)--(3) do not force $`a_{ij}\leq1`$.
Nor does the known harmonic cofactor inequality bound the required
cofactor sum in the opposite direction. In particular, the stronger
averaged cofactor inequality is false in general, as recorded on
[Lavi's C18 page](https://yair-lavi.com/mincs-list/conjecture-18/index.html).

## Dense counterexample route

On $`k=n-1`$, every binary matrix is the complement of a permutation
matrix, so every binary permanent equals the derangement number $`D_n`$.
An integer regular family with permanent below $`D_n`$ would therefore
disprove the full conjecture, with no need to determine other binary
minima.

The live C24 page already excludes fixed nonbinary defects padded to
large order. A new asymptotic counterexample on this line would require
a defect growing with the order. No such family or negative permanent
comparison was obtained in this pass. No numerical order sweep was
performed.

## Residual problem

A complete proof still needs a fixed-order construction of a binary
competitor with no larger permanent for every integer regular matrix,
or an argument excluding repeated entries at a global minimizer. A
complete disproof needs an exact integer regular matrix below the
binary minimum. Neither has been obtained here.

The [independent review](minc_integrality_review.md) derives the edge-copy component comparison and all terms in the weighted switch identities. It does not supply the missing repeated-entry exclusion.
