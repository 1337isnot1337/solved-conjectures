# Stanley’s tree-isomorphism conjecture

## Path counts and arbitrary reduced topologies

A certificate using only degree counts and the ordinary unlabelled histogram of vertex distances recognizes a density-one fraction of independent subdivisions of every fixed reduced tree. The conclusion holds uniformly on sufficiently slowly growing cores. For trivalent reduced trees the histogram alone suffices against every tree. [Proof and exact bounds](PATH-DISTANCE-CERTIFICATE.md) · [Independent review and prior work](PATH-DISTANCE-REVIEW.md) · [Finite checks](verify_path_distance_certificate.py)

## Reconstruction with an arbitrary internal tree

For any fixed internal tree and arbitrary fixed terminal caps, the ordinary chromatic symmetric function identifies the decorated tree for a proportion tending to one of the independently chosen exterior orders in the stated intervals. The proof recovers the internal topology and every internal path length from the split sizes. [Theorem and exact hypotheses](ARBITRARY-CORE.md) · [Review and prior work](ARBITRARY-CORE-REVIEW.md) · [Split reconstruction check](verify_core_splits.py)

## Independent subdivisions at a branch vertex

The two-hub results allow arbitrary independent subdivision lengths when terminal shape is determined by its leaf count and the stated leaf-count bound holds. A second theorem covers a dominant arm with arbitrary rooted ends. [Free lengths](TWO-HUB-FREE-LENGTHS.md) · [Dominant arm](DOMINANT-ARM.md)

A two-hub reconstruction recovers the exterior arms, their division between the hubs and the joining path for arbitrary fixed caps under an explicit condition on the exterior orders. The central length is unrestricted. [Proof](TWO-HUB-SUBDIVISIONS.md) · [Review](TWO-HUB-SUBDIVISIONS-REVIEW.md) · [Checks](verify_two_hub_subdivisions.py)

Sufficiently long independent subdivisions of all edges at any fixed branch vertex give identifiability among all trees. [Proof](HUB-SUBDIVISIONS.md) · [Review](HUB-SUBDIVISIONS-REVIEW.md) · [Structural check](verify_hub_fringe_recognition.py) · [Cap assignment](verify_hub_assignment.py)

A balanced-edge reconstruction improves the sufficient order for an arbitrary edge subdivision. If the larger and smaller original end components have orders $`g\ge h`$, a total of $`\max(2g-1,2g+h-3)`$ vertices suffices. The exact proof covers arbitrary endpoint degrees at a balanced or nearly balanced cut. Independently, a unique centroid with $`b-1`$ or more pendant leaves determines the tree when the largest branch has order $`b`$. Both results are written, internally reviewed partial theorems with exact finite checks. [Balanced-edge proof](BALANCED-ARMS.md) · [Review](BALANCED-ARMS-REVIEW.md) · [Checker](verify_balanced_paths.py) · [Leaf-centroid proof](LEAF-HUB.md) · [Review](LEAF-HUB-REVIEW.md) · [Checker](verify_leaf_hub.py)


For any finite tree and any chosen edge, replacing that edge by a sufficiently long path gives a tree recognized among all trees by its ordinary chromatic symmetric function. If removing the edge leaves components of orders $`c,d`$, a final order of at least $`4\max(c,d)-3`$ suffices. The proof recovers both rooted ends from the unmarked polynomial. [Long-subdivision theorem](LONG-SUBDIVISION.md) · [Independent review](LONG-SUBDIVISION-REVIEW.md) · [Exact checks](verify_long_subdivision.py)


**Status (2026-11-24).** The full conjecture remains open in this investigation.
This checkpoint gives a written proof that the chromatic symmetric function of
a proper tree determines its disjoint core-edge pairs counted by endpoint
weight types. It also gives a reconstruction criterion that allows repeated
weights at internal core vertices and some repeated edge types. It has no
independent review or Lean verification. No priority claim is made.
[Tracking issue #315](https://github.com/1337isnot1337/solved-conjectures/issues/315).

A separate follow-up gives a reconstruction criterion based on the
centroid branches. [Centroid proof](CENTROID.md). The ordinary chromatic symmetric function distinguishes a hub with at least three copies of any one rooted branch among all trees. A separate argument recovers repeated branch shapes from moments and separates the forest polynomials of the two halves across a balanced centroid edge. [Proof and finite checks](CENTROID-EDGE.md) A hub with two copies is also recognizable for branches satisfying a fringe-size condition, including arbitrary rooted full binary trees, or when the combined branches one level below the hub can be recovered. [Two-branch proof and checks](TWO-BRANCHES.md)

## The target and the source check

For finite trees $T$ and $T'$, the target is that $X_T=X_{T'}$ implies
$T\cong T'$. Here $X_G$ is the generating symmetric function for all proper
colorings of $G$, weighting a coloring by the product of its vertex colors.
Stanley poses the tree question in §2, p. 169 of his 1995 paper and obtains the
ordinary matching polynomial in the same section.
[Stanley, Adv. Math. 111 (1995), 166–194](https://sites.math.washington.edu/~billey/classes/Hopf.algebra/bulletins/stanley.1995.pdf).

Orellana and Tomba's November 2026 preprint treats the full question as open and
reduces it to trees made by giving all core vertices the same positive number
of leaf neighbors. Gonzalez, Orellana and Tomba prove reconstruction through
diameter five. Zeng and Awan give conditions requiring that weights at
nonleaf core vertices occur just once. The 2026-11-24 literature check used the
names “Stanley tree-isomorphism conjecture,” “chromatic symmetric function
distinguishes trees,” and weighted-core and matching variants. It located no
resolution of the full statement and no explicit inversion of the two-edge
layer by both endpoint weight types. That search is bounded.
[Orellana–Tomba](https://arxiv.org/abs/2611.18940),
[Gonzalez–Orellana–Tomba](https://arxiv.org/abs/2404.06002),
[Zeng](https://arxiv.org/abs/2608.18179),
[Awan](https://arxiv.org/abs/2609.13464).

The marked-graph expansion underlying the approach is due to Aliste-Prieto,
de Mier, Orellana and Zamora. The first-layer recovery of single core-edge
types also appears in Zeng. The partial theorem below concerns the inverse
problem in the next layer and its use for reconstruction. A full resolution
would establish that a central invariant in algebraic combinatorics suffices
for isomorphism on all trees, including the uniform-weight cores left by the
November reduction.
[Aliste-Prieto–de Mier–Orellana–Zamora](https://arxiv.org/abs/2202.11787),
[Zeng](https://arxiv.org/abs/2608.18179).

## Partial theorems

A tree on at least three vertices is **proper** when every nonleaf has a leaf
neighbor. Its core $K$ is the tree induced by the nonleaves. Set the weight
$w(v)$ of a core vertex to one plus the number of its leaf neighbors. An edge
type is the unordered multiset of its endpoint weights.

1. For a proper tree, $X_T$ determines the multiset of core weights, the
   multiplicity of each edge type, the number of disjoint pairs of edges of
   each unordered pair of types, and the number of incident pairs classified
   by the multiset of their three vertex weights.
2. A proper tree is determined among all trees by $X_T$ if each type class
   consists of pairwise incident edges and the sizes of all nonsingleton type
   classes are distinct. In particular the criterion holds if all edge types
   are distinct.

## Recovering the two-edge data

Let $s_i=X_{\mathrm{Star}_i}$, where the star has $i$ vertices. The $s_i$
freely generate the symmetric function ring over $\mathbb Q$. In the
power-sum expansion the single-part term of $s_i$ is $(-1)^{i-1}p_i$ and all
other terms involve lower subscripts, by Stanley's spanning-subgraph formula.
Write $z=s_1$ and $x_i=s_i$ for $i\ge 2$. The leading star partition is the
leaf-component partition by [Gonzalez–Orellana–Tomba, Theorem 4.15](https://arxiv.org/html/2404.06002v2).
It detects properness and gives the multiset of weights for a proper tree.

Here is a derivation of the marked expansion in this setting. Color the leaf
stars properly and apply inclusion–exclusion to the equal-color events on
core edges. For a selected subset of core edges, each component $B$ of the
spanning core forest has a single center color. If $B$ has $h$ vertices and
total weight $r$, its signed color sum is
$(-1)^{h-1}\sum_c y_c^h(p_1-y_c)^{r-h}$, where $y_c$ are the coloring variables.
Expanding $(-y_c)^{h-1}=((p_1-y_c)-p_1)^{h-1}$ yields the factor

```math
F_{r,h}=\sum_{j=0}^{h-1}(-1)^j\binom{h-1}{j} z^j x_{r-j}.
```

Thus $X_T$ is the sum, over all subsets of core edges, of products of these
factors for the spanning forest components. The equality is also
[Orellana–Tomba, Proposition 3.8](https://arxiv.org/html/2611.18940v1),
credited there to the marked-graph paper. As all weights are at least
two, $r-j\ge h+1\ge2$ and each factor contributes exactly one variable
other than $z$. If $K$ has $k$ vertices, terms of degree $k-d$ in the
$x_i$ arise exactly from subsets of $d$ edges. We treat missing layers as
zero.

Let $P=\prod_{v\in V(K)}x_{w(v)}$. Divide each layer by $P$ and work in
Laurent monomials in the $x_i$ with coefficients in $\mathbb Q[z]$.
All numerator and denominator multisets below refer to the Laurent monomial
in lowest terms. At grade one and degree zero in $z$, an edge of type
$`\{a,b\}`$ contributes $x_{a+b}/(x_ax_b)$. Since $a+b>\max(a,b)$,
the coefficient recovers the multiplicity of that type.

At grade two, incident edges of vertex weights $a,b,c$ contribute

```math
\frac{x_r-2zx_{r-1}+z^2x_{r-2}}{x_ax_bx_c},
\qquad r=a+b+c.
```

Disjoint edges of types $`\{a,b\}`$ and $`\{c,d\}`$ contribute

```math
\frac{(x_{a+b}-zx_{a+b-1})(x_{c+d}-zx_{c+d-1})}{x_ax_bx_cx_d}.
```

Recover the disjoint pairs in the following order.

**Pairs with no cancellation in the constant coefficient.** Their constant
monomial has two numerator and four denominator factors. Incident pairs
have only one numerator factor. The two numerator subscripts give the two
pair sums and the denominator gives the four weights. The sums and four
weights uniquely identify the unordered pair of endpoint types. To see this,
order the four weights as $a\le b\le c\le d$. The three pairings have
smaller sums $a+b$, $a+c$ and $\min(a+d,b+c)$. A tie between the first
two forces $b=c$. A tie between the first and third forces $d=b$ or $c=a$.
A tie between the second and third forces $d=c$ or $b=a$. In each tied
case the corresponding weight pairings agree as multisets.
Record and subtract the full contributions of all pairs recovered here.

**Pairs with cancellation in the constant coefficient.** A pair sum exceeds
both of its own endpoint weights. The sum from the pair containing a
largest endpoint exceeds all four endpoint weights. Hence there can be
only one canceled factor, from the sum on the other pair. Such pairs have
types $`\{a,b\}`$ and $`\{s,d\}`$ with $s=a+b$, and $r=s+d$. In particular
the identification of the pair whose sum cancels is unique. The normalized
coefficient of $-z$ for that pair is the sum of

```math
\frac{x_{r-1}}{x_ax_bx_d}
\quad\text{and}\quad
\frac{x_{s-1}x_r}{x_ax_bx_sx_d}.
```

Here $s-1>\max(a,b)$, $r>\max(a,b,s,d)$, and $r-1>\max(a,b,d)$.
If $d\ne s-1$, the second monomial has two numerator factors and the
first has only one. Its larger numerator subscript is $r$ and the smaller
one is $s-1$. Removing one occurrence of $s$ from the denominator gives
$`\{a,b,d\}`$, where $d=r-s$. This recovers the types and their count from
the coefficient. No incident pair or pair with $d=s-1$ contributes to
this monomial after the first subtraction. Record and subtract the full
contributions of all pairs recovered here.

**Pairs with $d=s-1$.** Index these by the triple of residual weights
$`\tau=\{a,b,d\}`$. There is at most one type pair of this form for
a given $\tau$, because $d$ is strictly largest. Let $C_\tau$ be its count
(zero when no such type pair exists). Let $A_\tau$ count incident edge
pairs with vertex-weight triple $\tau$, let $r_\tau$ be the sum of the
triple and let $P_\tau=\prod_{i\in\tau}x_i$. When the exceptional type
pair exists, set $`L(\tau)=\{a,b,s\}`$. Its weight sum is $r_\tau+1$.

In the remaining grade-two polynomial let $H_\tau$ be the constant
coefficient at $x_{r_\tau}/P_\tau$ and let $J_\tau$ be the coefficient
of $-z$ at $x_{r_\tau-1}/P_\tau$. The second degree-one monomial of the
exceptional pair, after cancellation, is $x_{r_\tau}/P_{L(\tau)}$.
The displayed formulas give

```math
H_\tau=A_\tau+C_\tau,\qquad
J_\tau=2A_\tau+C_\tau+\sum_{L(\sigma)=\tau}C_\sigma.
```

Both Laurent monomials in this coefficient comparison have one numerator
and three denominator factors. Their denominator determines the triple.
In increasing order of triple weight sum, the last sum is already known,
so the two equations uniquely recover both counts. It suffices to use the
finite set of triples bounded in total by the order of $T$.
This completes the recovery for arbitrary proper trees. The degree-two
coefficient in $z$ is extra data for this argument.

The constant layer alone cannot separate a pair of disjoint edges of
types $`\{2,2\}`$ and $`\{4,3\}`$ from an incident pair with weights
$`\{2,2,3\}`$. Both normalize to $x_7/(x_2^2x_3)$ at $z=0$.
This pair also exhibits the exceptional $d=s-1$ cancellation, for which
the degree-one coefficient moves information to the triple $`\{2,2,4\}`$.

## Reconstructing the core under the type-class condition

Write $m_t$ for the size of type class $t$. Its edges are pairwise incident
exactly when the disjoint count for the unordered pair $`\{t,t\}`$ is
zero. In a tree any set of two or more pairwise incident edges forms a
star. Two such edges share a vertex, and an edge that meets both away
from that vertex would form a triangle. Every singleton type class is also a
connected subtree, with two endpoints.

For distinct types $t,u$, subtract the disjoint count from $m_tm_u$ to
obtain the incident count $I(t,u)$. The type subtrees share at most one
vertex since they are edge-disjoint subtrees of a tree. If they share a
vertex $v$, then $I(t,u)=d_t(v)d_u(v)$, where $d_t(v)$ is the degree at that
vertex contributed by type $t$. For a nonsingleton class this is either
$1$ or $m_t$, and for a singleton it is $1$. With distinct nonsingleton
sizes every positive product uniquely determines the two degrees. For two
nonsingletons the possibilities are $1,m_t,m_u,m_tm_u$.

Form the graph on types with an edge whenever $I(t,u)>0$. A maximal
clique of size at least two corresponds to exactly one vertex shared by
all its type subtrees. Indeed, two intersecting subtrees share a single
vertex $v$. Any subtree meeting both contains $v$ because the unique
path between its two meeting points passes through $v$. Consequently all the types in a clique meet at the same vertex, and
all types meeting at that vertex form the maximal clique containing any
fixed pair. The common weight is uniquely determined by the intersection
of the underlying weight sets of its types. Two different unordered
multisets of size two cannot have the same two distinct elements.

For every type $t$ its maximal-clique memberships now specify exactly
its shared vertices, their weights, and their degrees within its type
subtree. A singleton edge with one shared endpoint has its remaining
weight determined by the type. A nonsingleton class has one center and
$m_t$ leaves. A shared vertex with degree $m_t$ is its center, and the
remaining shared vertices are leaves. If the center is private, create it
as a new vertex. Complete the star with the required number of private
leaves. A shared vertex fixes the center's weight, directly if it is
the center and by the other element of the type if it is a leaf. The
leaves all have the remaining weight. If there is more than one type,
connectedness ensures every type subtree has a shared vertex. If there
is only one type, the core is a single edge or a star, with weighted
isomorphism type determined by its edge type and vertex weight multiset.
A one-vertex core is determined by its weight alone.

Glue the reconstructed type stars at exactly the vertices represented by
their shared maximal cliques. The argument specifies the weighted core
up to isomorphism. Adding $w(v)-1$ leaves to each vertex reconstructs
the proper tree. All the hypotheses on type classes are detectable
from $X_T$, including properness from the leading partition. The order
of the tree is the homogeneous degree of $X_T$, so a competing tree
necessarily falls into the same reconstructed class.

For example, take a four-vertex core path of weights $2,3,2,5$. It has a
repeated weight at a nonleaf and a repeated type $`\{2,3\}`$ which forms a
two-edge star. Attach an arbitrarily large tree using new, distinct
weights at its vertices. The attachment introduces only new singleton
types. If the attached tree has noncaterpillar structure and sufficient
height, this gives examples of unbounded diameter beyond the
multiplicity-isolated hypothesis and the diameter-five theorem.

## Audit boundary

The lower bound of two on core vertex weights supports the grading by
number of factors other than $`z`$ and the separation of Laurent monomials after
one decrement. Positivity prevents double cancellation in a disjoint
pair's constant term. The final recursion decreases total triple weight. It allows coincident sums,
a repeated type within a disjoint pair, and repeated endpoint weights.
The exact diagnostic below checks the two-edge coefficient map modulo
65521 for endpoint weights 2 through 11. The constant-term matrix has rank
1560 and the combined degrees zero and one have full column rank 1760.
The proof covers all admissible weights.

```sh
python3 research/stanley-tree-isomorphism/verify_two_edge_layer.py
```
 The criterion does not cover the uniform-weight
cores of the November reduction beyond the case where the core itself
is a star. Resolving the full conjecture requires additional incidence
information beyond these aggregate counts.
