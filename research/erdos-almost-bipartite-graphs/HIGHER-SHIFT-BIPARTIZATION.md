# Higher shift graphs with almost-linear edge bipartization

Progress on the construction in Erdős's almost-bipartite graphs conjecture
([issue #1014](https://github.com/1337isnot1337/solved-conjectures/issues/1014)).
This proves the arbitrarily-large-chromatic form in ZFC. The exact
$\aleph_1$ requirement in Erdős's original text is a separate issue.

Let $S_k(I)$ be the shift graph on strictly increasing $k$-tuples of a
linearly ordered set $I$. Its oriented edges go from a tuple to the one
obtained by deleting the first entry and adding a larger last entry.
Put $S_1(I)$ equal to the complete graph oriented by the order. The
directed graph at level $k$ is the directed line graph at level $k-1$:
one arc per $k$-tuple, and consecutive arcs yield exactly the shift
adjacencies.

**Theorem.** For each positive integer $k$ there is $C_k$ such that
every $n$-vertex subgraph of $S_k(I)$ has a two-coloring in which its
monochromatic edges can be oriented with maximum outdegree at most
$C_k n^{1/k}$. In particular at most $C_k n^{1+1/k}$ edges have to be
deleted to make it bipartite, uniformly in the ordered set $I$.

## Proof

At $k=1$ color everything the same and orient arbitrarily; take $C_1=1$.
It suffices at each level to consider the subgraph induced on the chosen
vertices. For $k\ge2$, interpret the chosen $n$ vertices as $n$ arcs of a
finite subdigraph $D$ of the oriented $(k-1)$-shift. Let $T=n^{1/k}$.
A center is heavy if both its in-degree and its out-degree in $D$ exceed
$T$. There are at most $n/T$ heavy centers, since the sum of in-degrees
is $n$.

Apply the inductive coloring and orientation to the heavy centers in
the underlying graph of $D$ (as a subgraph of the $(k-1)$-shift). Denote
the center coloring by $`b(v)\in\{0,1\}`$. At each heavy center $v$ the
desired color for arcs entering it is $b(v)$, and the desired color for
arcs leaving it is $1-b(v)$.

Choose a color for each arc of $D$. With no heavy ends its color is
arbitrary. With only one heavy end, satisfy that end. With two heavy
ends, satisfy both when possible. They disagree exactly when their
center colors are equal. In that case satisfy the head of the
**auxiliary** inductive orientation of the corresponding underlying
edge and fail its tail. This auxiliary orientation need not follow
the direction of the original arc. The number of failed incidences
at each heavy center is at most the inductive outdegree:
```math
 C_{k-1}(n/T)^{1/(k-1)}=C_{k-1}T.
```

An edge of the induced $k$-shift is an incoming/outgoing arc pair
at its unique shared center. At a light center, one incidence side has
size at most $T$; orient every monochromatic pair from the other side
to the small side. The local outgoing degree of an arc is at most $T$.
At a heavy center, any monochromatic pair includes a failed incidence,
because two satisfied incidences on opposite sides get opposite
colors. Orient each monochromatic pair toward an arc failed at that
center, choosing either direction if both are failed. The local
outgoing degree is at most the number of failed incidences there.

Each arc has just two centers. The resulting orientation of the
monochromatic graph has outdegree at most
```math
 2\max\{T,C_{k-1}T\}\le C_k n^{1/k},
 \qquad C_k=2C_{k-1}.
```
Deleting its edges leaves a bipartite graph. Deleting edges of the
host before or after the argument cannot hurt the bound. $\square$

## Consequence and exact scope

Erdős–Hajnal–Szemerédi, [On almost bipartite large chromatic graphs](
https://www.renyi.hu/~p_erdos/1982-11.pdf), Lemma 1.1(a), show that for
any infinite cardinal $\kappa$ a sufficiently large well-ordered
$k$-shift has chromatic number above $\kappa$. The combination proves:
for every $\epsilon>0$ and every infinite $\kappa$, there is a graph
of chromatic number above $\kappa$ whose every finite $n$-vertex
subgraph becomes **bipartite** after $O_\epsilon(n^{1+\epsilon})$
edge deletions. Choose $k>1/\epsilon$; the coefficient also becomes
irrelevant for the literal numerical bound when $n$ is sufficiently
large.

This improves the cited old bound $2n^{3/2}$ for higher chromatic
numbers (Theorem 3(a)); the $n^{1+\epsilon}$ bound in their
Theorem 3(b) allows a larger finite number of colors. Erdős's
[1981 formulation](https://www.renyi.hu/~p_erdos/1981-16.pdf), §VII of
the Rényi copy, calls for chromatic number **equal to** $\aleph_1$.
One cannot simply trim the standard shift to that cardinal. This
note does not solve that exact-cardinal assertion in ZFC, change the
separate linear-budget impossibility result, or assert a coefficient
one valid for all $n$.
