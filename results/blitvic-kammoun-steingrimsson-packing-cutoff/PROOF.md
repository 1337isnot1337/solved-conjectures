# Blitvić–Kammoun–Steingrímsson's packing cutoff question

**Answer to the uniform-cutoff question:** there is no absolute cutoff, even if the two patterns must have the same length and the same overlap. The result also gives a linear lower bound on a potential cutoff that depends on the pattern length. It does not give such a cutoff's exact value or a useful general upper bound.

## Statement

For a pattern $`\pi`$ of length $`K`$ and admissible overlap $`m`$, let $`N_\pi^m(j)`$ count permutations of length $`K+(j-1)(K-m)`$ with all $`j`$ prescribed windows order-isomorphic to $`\pi`$, successive windows starting $`K-m`$ positions apart. Additional occurrences are allowed. This is Definition 2.6 and Remark 2.7 in [Blitvić–Kammoun–Steingrímsson, *Permutations, Pattern Covers, Posets and Positivity*, Part I](https://arxiv.org/html/2610.29846v1#S2). [Section 7, item 8](https://arxiv.org/html/2610.29846v1#S7) asks whether agreement through five occurrences forces agreement for every number of occurrences, regardless of pattern lengths, or whether a small length-dependent cutoff exists.

**Theorem.** For each integer $`L\ge2`$ there are two patterns $`P_L,Q_L`$ with common length $`K=3L+1`$ and common admissible overlap $`m=K-3=3L-2`$ such that
```math
N_{P_L}^m(j)=N_{Q_L}^m(j)=C_j^2\qquad(1\le j\le L),
```
but
```math
N_{P_L}^m(L+1)=C_{L+1}^2+C_L^2,\qquad
N_{Q_L}^m(L+1)=C_{L+1}^2,
```
where $`C_n=\binom{2n}{n}/(n+1)`$.

In particular, if a cutoff $`b(K)`$ is to work for all pairs of length-$`K`$ patterns at common admissible overlap, then $`b(3L+1)\ge L+1`$. No universal constant works.

## Construction

Use three logical classes of letters $`A,B,C`$. For each class $`X`$, its letters $`X_i`$ increase in $`i`$. All $`A`$ letters are smaller than all $`B`$ letters, and all $`B`$ letters are smaller than all $`C`$ letters. Assign the ranks $`1,\ldots,K`$ using this total ordering.

For $`P_L`$, place the $`3L`$ letters in the order
```math
A_1B_1C_1\ A_2B_2C_2\ \cdots\ A_LB_LC_L
```
and append one more letter $`A_{L+1}`$. For $`Q_L`$, use
```math
B_1A_1C_1\ B_2A_2C_2\ \cdots\ B_LA_LC_L
```
and append $`B_{L+1}`$. Thus the longer class is $`A`$ in $`P_L`$ and $`B`$ in $`Q_L`$. Deleting the last three entries or deleting the first three leaves the same relative order: the corresponding positions retain their classes and the intra-class orders are unchanged upon shifting the indices. Thus $`m=K-3`$ is admissible for both. The shift holds for comparisons anywhere in a window, and does not require the prefix or suffix itself to be increasing.

## Packing poset

The packing count equals the number of linear extensions of the poset that imposes the relative order in every window. This is [Part I, Theorem 5.3](https://arxiv.org/html/2610.29846v1#S5); directly, assign values in the order of any linear extension to get exactly one packing, and read values increasingly to invert the construction.

Write $`a,b,c`$ for the numbers of letters of each class in one window. For $`P_L`$ they are $`(L+1,L,L)`$, and for $`Q_L`$ they are $`(L,L+1,L)`$. The entire host consists of three chains
```math
A_1<\cdots\lt A_{a+j-1},\quad
B_1<\cdots\lt B_{b+j-1},\quad
C_1<\cdots\lt C_{c+j-1}.
```
All their adjacent comparisons occur in some window since $`a,b,c\ge2`$. The $`i`$th window, $`1\le i\le j`$, contains the consecutive indices $`i,\ldots,i+a-1`$ of $`A`$, $`i,\ldots,i+b-1`$ of $`B`$, and $`i,\ldots,i+c-1`$ of $`C`$. Its cross-class comparisons are equivalent, given the three chains, to
```math
A_{a+i-1}\lt B_i,\qquad B_{b+i-1}\lt C_i\quad(1\le i\le j).
```
Indeed these inequalities force separation of $`A`$ from $`B`$ and $`B`$ from $`C`$ within the window, and then separation of $`A`$ from $`C`$. Conversely they are among the prescribed window comparisons. This gives exactly the packing poset; no comparisons are imposed between different windows other than the consequences of these constraints.

## Counting up to the first difference

The $`A`$ vertices of index less than $`a`$ form a forced initial chain: they precede $`A_a`$, which precedes $`B_1`$ and hence every $`B`$ and $`C`$ vertex. Likewise the $`C`$ vertices of index greater than $`j`$ form a forced final chain: $`C_j`$ follows $`B_{b+j-1}`$ and hence all $`B`$ and $`A`$ vertices. We may remove both.

The remaining constraints consist of two Catalan blocks and, if present, the intervening segment of the $`B`$ chain:
```math
\begin{array}{ll}
X:\ (A_a,\ldots,A_{a+j-1}),\ (B_1,\ldots,B_j),
 & A_{a+i-1}\lt B_i;
\\ Y:\ (B_b,\ldots,B_{b+j-1}),\ (C_1,\ldots,C_j),
 & B_{b+i-1}\lt C_i .
\end{array}
```
Each block consists of two increasing chains of $`j`$ vertices with the $`i`$th vertex of the first required before the $`i`$th vertex of the second. Its extension words are the ballot words with equal letter counts, and hence number $`C_j`$.

If $`j<b`$, then the last vertex of $`X`$ is $`B_j`$ and the first vertex of $`Y`$ is $`B_b`$. The $`B`$ chain separates the blocks, and any intermediate $`B`$ vertices have a forced position between them. If $`j=b`$, then these two endpoints coincide; the two blocks meet at that single endpoint and still concatenate uniquely. In both cases the count is $`C_j^2`$.

Suppose $`j=b+1`$. Now the blocks share two vertices, $`B_b<B_{b+1}`$. Every linear extension restricts to one extension of each block. To merge a pair of block extensions, interleave only between their two common vertices: before $`B_b`$ only $`X`$ has vertices, and after $`B_{b+1}`$ only $`Y`$ does. Between the common vertices only $`A_{a+j-1}`$ may occur from $`X`$, because $`A_{a+j-2}<B_b`$, and only $`C_1`$ may occur from $`Y`$, because $`B_{b+1}<C_2`$. If both appear there, either order is allowed. The imposed constraints have no further cross-block edges beyond the common vertices and their relations already accounted for in the two block orders. If one or neither appears, the merge is unique.

There are exactly $`C_{j-1}`$ extensions of $`X`$ that place $`A_{a+j-1}`$ in the common gap: they have a ballot word on the first $`j-1`$ vertices of each chain, then the forced pair $`A_{a+j-1},B_j`$. There are exactly $`C_{j-1}`$ extensions of $`Y`$ that place $`C_1`$ there: they start with the pair $`B_b,C_1`$, then have a ballot word on the remaining vertices. The count at $`j=b+1`$ is therefore $`C_j^2+C_{j-1}^2`$.

For $`P_L`$, $`b=L`$, and for $`Q_L`$, $`b=L+1`$, giving the theorem. In particular $`L=5`$ disproves five as a cutoff at the same $`(K,m)=(16,13)`$: the first five counts are $`(1,4,25,196,1764)`$ for both, and the sixth counts are $`19188`$ and $`17424`$. The general parameterized proof, not an enumeration at length 16, rules out every fixed cutoff. $`\square`$

## Source and priority

The source is [arXiv:2610.29846v1, 21 October 2026](https://arxiv.org/abs/2610.29846v1), Section 7, item 8. Item 7's associated footnote expressly discusses overlaps $`1,\ldots,K-2`$; item 8 does not restrict to $`m\le K/2`$. The examples here use dense overlap and make no claim about a cutoff in the restricted $`m\le K/2`$ domain. They address item 8, not item 4 (Conjecture 7.1 on maximum counts), item 10 (a product formula), item 11 (congruences), or the moment-sequence conjectures in [Part II](https://arxiv.org/abs/2611.12829).

The source credits the two-chain Catalan case, including dense overlaps, to earlier work (see Part I, §5.3 and Proposition 5.37). The argument above uses two such Catalan blocks and shifts the point where they start interacting; it does not claim novelty for a single Catalan block or for the standard window-poset correspondence.

The public [trureturing dossier for the different packing-maximum conjecture](https://www.trureturing.org/research/blitvic-kammoun-steingrimsson-2026-packing-maximum/) expressly lists item 8 as a separate unresolved question. Searches on 24 November 2026 for the authors together with “packing cutoff”, “five occurrences”, “no universal cutoff”, and “Catalan squares” located the original and this dossier but no prior proof of the cutoff conclusion. The companion paper Part II does not assert a result about the cutoff. This is a bounded search record, not a claim of worldwide priority. The companion [check.py](check.py) computes from the literal window order, with exact integers and no assumptions of a Catalan-block structure.
