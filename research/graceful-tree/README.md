# Graceful tree conjecture

**Partial research.** Compatible pairs of gracefully labeled rooted trees can be attached along a path, with different orders allowed in each pair. Reflecting one side of each bipartition moves the internal edge differences into disjoint intervals, and the path uses the differences left between intervals. The construction also gives a weighted condition for using other host trees. Arbitrary trees remain open. [Issue #407](https://github.com/1337isnot1337/solved-conjectures/issues/407)

## Target and sources

The graceful tree conjecture asks whether every finite tree with $m$ edges admits a bijection of its vertices with $`\{0,\ldots,m\}`$ whose absolute edge differences are exactly $`\{1,\ldots,m\}`$. This is Rosa’s beta-valuation formulation. The November 24, 2026 source check found recent work on graceful supertrees and on algebraic label certificates, with the universal assertion still open. [Rosa’s original source pointer](https://mathconjectures.com/references/Rosa1967Graceful) · [Okechukwu, November 2026](https://arxiv.org/abs/2611.01340) · [Rooted Weyl alternants](https://prism.metriq.org/papers/math-2026-10/)

The classical delta construction of Stanton and Zarnke amalgamates equal copies with the vertices of a graceful host. Mavronicolas and Michael, and other authors, give substitution theorems using alpha-labeled trees and matching boundaries. The constructions over paths and caterpillars allow different orders at different pairs of locations, with the two attachments at a chosen pair equal in order. The compatibility tested here permits unequal orders within a reflected pair and allows signed differences of both signs. Priority for this variable-order rule is provisional. [Mavronicolas–Michael](https://www.sciencedirect.com/science/article/pii/S0012365X08005992) · [*Alpha-trees over paths and caterpillars*](https://combinatorialpress.com/um-articles/vol-123/alpha-trees-over-paths-and-caterpillars/)

## Attachment data

Index the vertices of a host tree by $i=0,\ldots,q-1$. At vertex $i$ attach a tree $H_i$ of order $m_i$ by identifying its root with the host vertex. Give $H_i$ a graceful labeling $g_i$ and let $(A_i,B_i)$ be its bipartition with the root in $A_i$. Require the roots all to have the same input label $r$. For each $1\le d<m_i$, let $\sigma_i(d)$ be the sign of $g_i(a)-g_i(b)$ on the unique edge $ab$ with $a\in A_i$, $b\in B_i$ and absolute difference $d$.

Put $\bar i=q-1-i$. For each pair $i<\bar i$, require the following.

- The labels $0\le t<\min(m_i,m_{\bar i})$ occupy the same bipartition side in the two attachments.
- All labels $t\ge\min(m_i,m_{\bar i})$ in the larger attachment belong to its root side.
- The signs $\sigma_i(d),\sigma_{\bar i}(d)$ agree for $1\le d<\min(m_i,m_{\bar i})$.

The middle attachment, when $q$ is odd, only needs the common root label and a graceful labeling. Let $b_i=\sum_{j<i}m_j$ be the block starts and $N=\sum_i m_i$. Set

```math
f_i(x)=
\begin{cases}
b_i+g_i(x),&x\in A_i,
\\ b_{\bar i}+g_i(x),&x\in B_i.
\end{cases}
```

For each reflected pair of blocks, the agreement on their common labels assigns exactly one vertex of each level to each block. A level from the larger attachment outside the overlap stays in its own block by the second condition. The middle block uses its own labeling throughout. Hence the resulting labels are exactly $0,\ldots,N-1$. The host vertex labels are $b_i+r$.

## Internal differences and the host condition

For a reflected pair $i<j=\bar i$, set $a=m_i$, $b=m_j$, and $L=\sum_{i<h<j}m_h$. Its block starts differ by $D=b_j-b_i=L+a$. If $d<\min(a,b)$ and $\sigma$ is the common sign at $d$, the edge in the left attachment gives $D-\sigma d$ and the edge in the right gives $D+\sigma d$. Both are positive since $D\ge a>d$.

If one attachment has an edge of difference $d\ge\min(a,b)$, its higher label is beyond the overlap and belongs to the root side. Thus the sign is positive. The excess differences therefore fill the lower side of the interval when the left attachment is larger, and the upper side when the right attachment is larger. Altogether the pair contributes precisely

```math
\{L+1,\ldots,L+a+b-1\}\setminus\{D\},
```

each value once. The middle attachment contributes $1,\ldots,m_{(q-1)/2}-1$ when present. The reflected pairs are nested, and the upper boundary $L+a+b$ for one pair is the inner length $L$ of the next pair out. Hence the only missing positive differences up to $N-1$ are, for each pair, its $D$ and its $L$ when $L>0$. These values are distinct and number $q-1$.

It suffices that the host edges have exactly these differences when its vertex $i$ receives label $b_i$. This condition is always met by the path whose vertex order is $0,q-1,1,q-2,\ldots$ from the outside in. Its edge between the two members $i,j$ of a reflected pair has difference $D=b_j-b_i$. If the path next reaches the inner left index $i+1$, that edge gives $b_j-b_{i+1}=L$. The common root label cancels from every such difference. This proves graceful labeling for the path host with the stated compatible attachments.

If all orders equal $m$, the missing differences are $m,2m,\ldots,(q-1)m$, and any graceful host labeled by the indices works. For symmetric orders $m_i=m_{\bar i}$, there is a further class of hosts. The missing difference indexed by an unweighted length $k$ is the sum of the $k$ most central block sizes, since each $L$ is an inner interval and each $D$ adds one of a reflected outer pair. Ties between the two central intervals of the same length have equal weight by symmetry. A host with one edge $ij$ for each length $j-i=k$, whose block interval $[i,j)$ is one of the most central at that length, supplies the needed differences. This includes hosts with branches.

## Unequal orders and exact controls

A useful way to obtain unequal compatible attachments is to start with a compatible pair of the same order with label zero on the side opposite the root. Add any number of new leaves in each copy at its zero-labeled vertex. Assign the new leaves the successive labels above its old maximum. This keeps the root label and both signatures on the old levels. The new labels lie on the root side, and all the corresponding signed differences are positive. The two attachments can start with the same signatures on nonisomorphic trees and can receive independently chosen numbers of new leaves.

The [exact checker](verify.py) uses two attachments on labels $0,\ldots,5$ with common root label $1$. They have the same edges of differences two through five, namely $(1,3),(2,5),(0,4),(0,5)$. Their edges of difference one are $(0,1)$ and $(3,4)$ respectively. The first has maximum degree three, and the second is a path. Their root side is $`\{1,4,5\}`$ and their sign lists are $(+,-,+,+,+)$. Appending different numbers of leaves at zero and using a three-vertex path host gives an exact graceful labeling on 20 vertices. A second check uses symmetric orders and a branching host with centered intervals, giving a labeling on 28 vertices. Replay with `python3 research/graceful-tree/verify.py`.

For arbitrary trees, the proof leaves open how to choose and label attachments that satisfy the compatibility requirements. The labeling identities apply once those requirements and the host condition hold.
