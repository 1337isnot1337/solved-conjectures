# Tamimi's conjecture

## Status and exact scope

Complete proposed proof of Conjecture 4.4.2 in Baha Tamimi, *The Sandpile & Smith Groups of Certain Classes of Graphs*, University of Essex PhD thesis (2022), printed page 115. Independent review and the full priority audit are in progress. Nothing here is counted as a new result until those checks pass.

Let $`r,n\geq 3`$ be integers. Start with the cycle whose vertices are $`v_0,\ldots,v_{r-1}`$, with subscripts read modulo $`r`$. For each edge $`v_iv_{i+1}`$, attach $`n-2`$ new vertices and make those vertices together with the two edge endpoints a copy of $`K_n`$. New vertices attached to different edges are disjoint. Call the resulting graph $`G_{r,n}`$.

The whole conjecture is

```math
K(G_{r,n})\cong
(\mathbb Z/n\mathbb Z)^{r(n-2)-2}
\oplus\mathbb Z/(2rn)\mathbb Z.
```

Here $`K(G)`$ is the sandpile group, equivalently the torsion subgroup of the cokernel of the full integer Laplacian. The proof covers both parameters without a bound and does not infer the group structure from its order.

## A Laplacian presentation

Put $`m=n-2`$. Write the new vertices on edge $`i`$ as $`w_{i,1},\ldots,w_{i,m}`$. Use the same symbols for the generators of the abelian presentation of the full Laplacian cokernel. Set

```math
S_i=v_i+v_{i+1}+\sum_{j=1}^{m}w_{i,j}.
```

An internal vertex has degree $`n-1`$, and a cycle vertex has degree $`2(n-1)`$. The defining relations are therefore

```math
n w_{i,j}-S_i=0
\quad(0\leq i<r,\ 1\leq j\leq m),
\qquad
2n v_i-S_{i-1}-S_i=0
\quad(0\leq i<r).
\tag{1}
```

All changes of generators and relations below are integral and reversible.

For every $`i`$, define

```math
a_i=w_{i,1},\qquad
d_{i,j}=w_{i,j}-a_i\quad(2\leq j\leq m),
\qquad
D_i=\sum_{j=2}^{m}d_{i,j}.
```

When $`n=3`$, the indexed family of $`d`$'s is empty and $`D_i=0`$. Subtracting the relation for $`w_{i,1}`$ from the other internal relations gives

```math
n d_{i,j}=0.
\tag{2}
```

The remaining internal relation is $`n a_i-S_i=0`$. Since $`S_i=v_i+v_{i+1}+(n-2)a_i+D_i`$, it is

```math
2a_i-v_i-v_{i+1}-D_i=0.
\tag{3}
```

Subtracting the two applicable internal relations from a cycle-vertex relation in (1) makes that relation

```math
n(2v_i-a_{i-1}-a_i)=0.
\tag{4}
```

Now put $`b_i=a_i-v_i`$. Relation (3) becomes

```math
v_{i+1}-v_i=2b_i-D_i.
\tag{5}
```

Using (5) at $`i-1`$, the expression in (4) is

```math
n(2v_i-a_{i-1}-a_i)
=n(b_{i-1}-b_i-D_{i-1}).
```

Relations (2) imply $`nD_{i-1}=0`$. Thus (4) can be replaced, reversibly, by

```math
n(b_i-b_{i-1})=0.
\tag{6}
```

## Removing the cycle variables

Relations (5) for $`i=0,\ldots,r-2`$ eliminate $`v_1,\ldots,v_{r-1}`$ one at a time, each with coefficient one. The last relation in (5) is then exactly

```math
2\sum_{i=0}^{r-1}b_i-\sum_{i=0}^{r-1}D_i=0.
\tag{7}
```

No remaining relation involves $`v_0`$, which consequently generates a free $`\mathbb Z`$ summand.

Define $`b=b_0`$ and $`c_i=b_i-b_0`$ for $`1\leq i<r`$. The cycle difference relations (6) are equivalent to $`nc_i=0`$ for all these indices: consecutive differences generate the same integer relation lattice as differences from $`b_0`$. One of the original cyclic difference relations is redundant. Relation (7) becomes

```math
2r b+2\sum_{i=1}^{r-1}c_i
-\sum_{i=0}^{r-1}\sum_{j=2}^{n-2}d_{i,j}=0.
\tag{8}
```

We have proved that the full Laplacian cokernel is $`\mathbb Z\oplus H`$, where $`H`$ has generators

```math
b,\quad c_1,\ldots,c_{r-1},\quad
d_{i,j}\ (0\leq i<r,\ 2\leq j\leq n-2),
```

and exactly the relations

```math
n c_i=0,\qquad n d_{i,j}=0,\qquad (8).
\tag{9}
```

This last presentation gives the invariant factors directly.

## The case $`n\geq4`$

There is at least one $`d`$ generator, say $`d_{0,2}`$. Its coefficient in (8) is $`-1`$, so use (8) to eliminate it:

```math
d_{0,2}
=2r b+2\sum_{i=1}^{r-1}c_i
-\sum_{(i,j)\neq(0,2)}d_{i,j}.
```

Its relation $`nd_{0,2}=0`$, after subtracting integer multiples of the other relations in (9), becomes exactly $`2rn b=0`$. Every other relation says that one remaining $`c`$ or $`d`$ generator is killed by $`n`$. There are

```math
(r-1)+r(n-3)-1=r(n-2)-2
```

such generators. Hence

```math
H\cong
\mathbb Z/(2rn)\mathbb Z
\oplus(\mathbb Z/n\mathbb Z)^{r(n-2)-2}.
\tag{10}
```

No coprimality or parity assumption was used.

## The case $`n=3`$

There are no $`d`$ generators. Replace $`c_{r-1}`$ by

```math
c=c_1+\cdots+c_{r-1},
```

keeping $`c_1,\ldots,c_{r-2}`$. This is a unimodular change of generators. The relations $`3c_i=0`$ become $`3c=0`$ and $`3c_i=0`$ for $`1\leq i\leq r-2`$. The remaining relation is

```math
2r b+2c=0.
```

Subtract the relation $`3c=0`$ from it to obtain $`2r b-c=0`$. This eliminates $`c`$, and the relation $`3c=0`$ becomes $`6r b=0`$. The other $`r-2`$ generators remain independent of order three. Therefore

```math
H\cong\mathbb Z/(6r)\mathbb Z
\oplus(\mathbb Z/3\mathbb Z)^{r-2},
```

which is (10) with $`n=3`$.

In both cases $`H`$ is finite. It is therefore exactly the torsion subgroup of the full Laplacian cokernel. This proves the asserted sandpile-group isomorphism for every $`r,n\geq3`$.

## Source and verification boundary

- Original thesis repository: <https://repository.essex.ac.uk/33230/>.
- Original thesis PDF: <https://repository.essex.ac.uk/33230/1/baha_tamimi_phd_thesis_05_08_2022.pdf>.
- Exact conjecture: Conjecture 4.4.2, printed page 115. The primary search extraction reproduces the group formula and all quantifiers; full-PDF access and the edge-tiling definition are undergoing independent audit.
- Companion finite Smith-form calculations are diagnostic checks of the transcription and presentation. The unbounded result is proved by the integral transformations above.
- The distinct cycle-tiling Conjecture 4.4.3 is not claimed as an additional result.
