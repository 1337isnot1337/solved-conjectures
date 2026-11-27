<stdin>:21: SyntaxWarning: invalid escape sequence '\g'
<stdin>:22: SyntaxWarning: invalid escape sequence '\l'
<stdin>:22: SyntaxWarning: invalid escape sequence '\l'
# Barrett–Evans–Hall–Kempton’s dandelion conjecture

**Exact theorem for every sufficiently large order.** Among all simple graphs on $n$ vertices for which both the graph and its complement are connected, not just those with both diameters three, the dandelion minimizes $\lambda_2(G)+\lambda_2(G^c)$ for all sufficiently large $n$. Up to complementation, every minimizer is the dandelion with arbitrary edges among its $n-3$ pendant twins. Moreover, at large orders the other graphs are separated by an absolute positive gap above the limiting minimum. This does not settle the finitely many smaller orders of Conjecture 2.

Let $\alpha=(3-\sqrt5)/2$. The original authors' [Theorem 4.4](https://arxiv.org/pdf/2201.04225#page=16) gives the dandelion value $D_n\to1+\alpha$. We prove that any sequence with both graphs connected, $n\to\infty$, and
\[
\limsup\bigl(\lambda_2(G)+\lambda_2(G^c)\bigr)\le1+\alpha
\]
consists eventually of dandelions with their pendant twins joined arbitrarily, up to complementing.

## Localized extrema

For a unit vector $f$ with Laplacian energy bounded by a constant, every vertex at which $|f(v)|$ has a fixed positive lower bound has bounded degree. In fact at most $4/\eta^2$ vertices have $|f(w)|\ge\eta/2$; for a vertex with $|f(v)|\ge\eta$, each edge to another vertex outside this set costs at least $\eta^2/4$. Thus coordinates at vertices of degrees tending to infinity tend to zero, uniformly subject to the same energy bound.

Write $x=\lambda_2(G)\le y=\lambda_2(G^c)$, swapping the graphs if necessary, so $x\le(1+\alpha)/2+o(1)<1$. Let $a,b$ be unit mean-zero Fiedler vectors of $G,G^c$ and let $R_a,R_b$ be their ranges. Expanding the complete-pair sum gives
\[
\sum_{i<j}(a_i-a_j)^2(b_i-b_j)^2
=1+n\sum_i a_i^2 b_i^2+2\langle a,b\rangle^2\ge1.
\]
Splitting on graph and complement edges bounds the left hand side by $xR_b^2+yR_a^2$, and each squared range is at most two.

Both vectors have maximum absolute coordinate bounded away from zero. If $\|b\|_\infty\to0$ along a subsequence, the moment bound forces $a$ to have a positive maximum of magnitude bounded below, after changing its sign if needed. At that maximum $l$, each summand of its row equation is nonnegative, so any neighbour $w$ satisfies $a_w\ge(1-x)a_l$. Such a neighbour exists by connectivity. Both $l,w$ have bounded degree in $G$. In $G^c$ their two almost universal stars each cost at least $1-o(1)$ in $b$-energy: the sum of squared differences to all vertices is $1+nb_v^2$, and deleting a bounded number of terms costs $o(1)$. They share at most their joining edge, so $y\ge2-o(1)$, contradictory.

Conversely if $\|a\|_\infty\to0$, the moment bound gives $x\ge1/2-o(1)$, hence $y\le1/2+\alpha+o(1)<1$. It also gives a positive lower bound on the absolute maximum of $b$. The symmetric two-star argument now uses that $y$ is bounded below one, and forces $x\ge2-o(1)$, again a contradiction. This proves both lower bounds.

Change signs so that $M=a_l=\max a=\|a\|_\infty$ and $b_h=\max b=\|b\|_\infty$. The complementary degree of $h$ is bounded, so $a_h=o(1)$. At any bounded-degree vertex of $G$, similarly $b_v=o(1)$.

## Two forced low-degree vertices

There cannot be a $G$-edge $lh$: the row at $l$ would give $xM\ge M-a_h$, contradicting $x\le(1+\alpha)/2+o(1)$. Thus $l$ contributes $b_h-o(1)$ to the complementary row at $h$. In particular $y\ge1-o(1)$ and now $x\le\alpha+o(1)$. Every other vertex of bounded $G$-degree must be adjacent to $h$ in $G$ for all sufficiently large orders: if such a vertex were another complementary neighbour, its contribution would give $y\ge2-o(1)$. The conclusion applies uniformly to vertices with $|a_v|$ bounded below, using the degree bound at the start.

Let $Z=\max_{v\ne l}a_v$ and take $z$ attaining it. Then $Z\ge(1-x)M$, so $z$ has bounded $G$-degree and is adjacent to $h$. In its $G$-row only the contribution from $l$ can be negative. Whether or not that edge is present, we get
\[
xZ\ge (Z-a_h)+(Z-M),\qquad (2-x)Z\le M+a_h.
\]
Together with the lower bound on $Z$, this gives $(2-x)(1-x)\le1+o(1)$. The smaller solution of $(2-x)(1-x)=1$ is $\alpha$. Since $x\le\alpha+o(1)$, necessarily
\[
x\to\alpha,\qquad y\to1,\qquad Z=(1-\alpha+o(1))M.
\]

Each $G$-edge at $l$ contributes at least $M-Z$ to its row. Therefore $d_G(l)\le xM/(M-Z)=1+o(1)$, and $l$ is a leaf. Write $w$ for its unique neighbour. Its coordinate is now exactly $a_w=(1-x)M$, and $a_w=Z+o(1)$. It is adjacent to $h$ by the preceding bounded-degree argument. In the row at $w$, the two contributions from $l,h$ sum to $2a_w-M-a_h=x a_w+o(1)$. Every other contribution is at least $-o(1)$ by the definition of $Z$. Because the degree of $w$ is bounded, any further neighbour $v$ must have $a_v=a_w+o(1)$, hence bounded degree. Such a $v$ is adjacent to $h$ but not to the leaf $l$. In its row all other contributions are at least $-o(1)$, so $x a_v\ge a_v-o(1)$. Its coordinate is bounded away from zero and $x\to\alpha<1$, a contradiction. Thus $w$ has exactly the neighbours $l,h$.

## The high-degree endpoint and the spectrum

In the complementary row at $h$, the neighbour $l$ already contributes $(1+o(1))b_h$, and $y\to1$. Any additional complementary neighbour $v$ must satisfy $b_v=b_h+o(1)$, by nonnegativity of all the row differences. It consequently has bounded degree in $G^c$. It is distinct from $l,w,h$ because $w$ is adjacent to $h$ in $G$. Since the only $G$-neighbour of $l$ is $w$, and the only $G$-neighbours of $w$ are $l,h$, the complementary row at $v$ includes both $l$ and $w$. Both have $b$-coordinates tending to zero. All other summands are at least $b_v-b_h=-o(1)$ and there are only boundedly many. Thus $y b_v\ge 2b_v-o(1)$, impossible since $b_v$ is bounded away from zero and $y\to1$. This proves that $l$ is the only non-neighbour of $h$ in $G$.

Consequently $G$ is a dandelion with arbitrary edges inside the remaining $n-3$ vertices. The part-constant quotient on $l,w,h$ and those vertices is unchanged by those internal edges. All within-part zero-sum modes have Laplacian eigenvalues in $[1,n-2]$: there is one unit edge to $h$ from each vertex and the internal Laplacian is bounded by that of the complete graph on $n-3$ vertices. The dandelion's extremal nonzero eigenvalues from the quotient are below one and above $n-1$ respectively, so the two connectivities are unchanged. This proves the exact minimization and classification for sufficiently large orders, and the positive gap for non-dandelions follows by taking a sequence if no such uniform gap existed.

[Exact original Conjecture 2](https://arxiv.org/pdf/2201.04225#page=15) · [Journal DOI](https://doi.org/10.1016/j.laa.2022.04.021) · [Tracking issue #962](https://github.com/1337isnot1337/solved-conjectures/issues/962). The earlier weighted inequality in [PR #959](https://github.com/1337isnot1337/solved-conjectures/pull/959) is Conjecture 6, not this result. Exact-name, DOI and citing-paper searches did not find an earlier resolution of Conjecture 2. The comparatively small finite orders of Conjecture 2 require separate proof.
