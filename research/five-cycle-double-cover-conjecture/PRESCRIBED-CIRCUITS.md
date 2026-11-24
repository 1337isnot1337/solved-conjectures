# Five-cycle double cover conjecture

**Partial research.** A rank criterion lets a prescribed union of any number of vertex-disjoint circuits appear as a single member of a five-cycle double cover. It uses a three-edge-colouring of the complement and a matrix of attachment sums. The conclusion holds for disconnected complements under the stated rank condition. The unrestricted conjecture remains open. [Tracking issue #519](https://github.com/1337isnot1337/solved-conjectures/issues/519)

## Target and sources

The Celmins–Preissmann conjecture asks whether every bridgeless graph has at most five even subgraphs that together cover every edge exactly twice. The ordinary cycle double cover was resolved in 2026 with eight even subgraphs. The November 24 primary-source screen found no resolution of the five-member conjecture. Hoffmann-Ostenhof and, later, Hušek and Šámal give flow and parity formulations for a prescribed even subgraph. Ulyanov proves the single-circuit case with colourable complement by his bilinear balancing lemma. His earlier proof of Sabidussi's compatibility conjecture is a prior resolution of that separate target. For several circuits, the argument below uses his balancing lemma on groups of components and then solves for independent shifts on the circuits. The search located no earlier statement of the rank condition or this extension, and priority is provisional. [Oum, Theorem 18](https://arxiv.org/abs/2607.16356) · [Hoffmann-Ostenhof](https://arxiv.org/abs/1209.0096) · [Hušek and Šámal, Section 3.4](https://arxiv.org/abs/2607.24724) · [Ulyanov, Theorem 1.1](https://zenodo.org/records/23189149) · [Ulyanov, Sabidussi](https://arxiv.org/abs/2607.13225)

## Rank criterion

Let $G$ be a connected loopless cubic graph. Let $F$ be a nonempty union of vertex-disjoint circuits $C_1,\ldots,C_k$. Put $H=G-E(F)$ and give $H$ a proper edge-colouring $q$ by the three nonzero vectors in $W=\mathbb F_2^2$. At a vertex $v$ of $F$, let $\alpha_v$ be the colour of the unique incident edge in $H$. For a component $K$ of $H$ and a circuit $C_j$, put

```math
t_{Kj}=\sum_{v\in V(K)\cap V(C_j)}\alpha_v.
```

The attachment sums in each row add to zero. This follows by summing the flow law for the three colours at vertices outside $F$ in that component, with both incidences of an edge cancelling if both ends lie on $F$. Assume that the attachment sums in each column also add to zero.

Join components $K$ to circuits $C_j$ in a bipartite graph when $t_{Kj}\ne0$. Partition the rows into groups by connected components of this graph, counting each isolated row as a group. Let $m$ be the number of rows and $d$ the number of groups. Interpret $T=(t_{Kj})$ as a binary $m$-by-$2k$ matrix, with two adjacent scalar columns for each circuit.

**Theorem.** If $T$ has rank $m-d$, then $G$ has a five-cycle double cover containing $F$ as one member.

This is the largest possible rank because each group of rows sums to zero. The condition includes all blockwise balanced colourings, where every $t_{Kj}=0$. For a single circuit this balance is automatic and the conclusion is Ulyanov's theorem. With two circuits, the condition also holds whenever the column sums vanish and there are at most three nonzero rows. Each nonzero row then has the form $(t,t)$, and two such rows must coincide while three must have all three distinct nonzero values.

## Proof

**The shift equations.** Fix an orientation and a starting point on each $C_j$. Extend $q$ to a $W$-flow on $G$ by assigning successive edges of $C_j$ the prefix sums of the incident $\alpha_v$ in that cyclic order. They close because the column sum is zero. There is also a free additive shift $s_j\in W$ on all edges of $C_j$. Only edges of $F$ can have zero value, and those edges form a matching $M$ because successive edge values differ by $\alpha_v\ne0$.

Write $p_K$ for the parity of the number of endpoints of $M$ in $K$ when the shifts are zero. With $Q(x)=x_1x_2$ and $B(x,y)=x_1y_2+x_2y_1$, the bit for $x=0$ is $1+x_1+x_2+Q(x)$. At a vertex $v$ of $C_j$, the two consecutive edge values differ by $\alpha_v$. Adding $s_j$ to both changes the sum of their zero-indicator bits by $B(\alpha_v,s_j)$. Hence all component parities vanish exactly when

```math
\sum_j B(t_{Kj},s_j)=p_K \qquad (K\text{ a component of }H).
```

For this fixed colouring the linear system is an exact criterion for obtaining the even-endpoint condition by shifts. Its matrix has the rank of $T$, because $B$ is nondegenerate.

**Balancing the groups.** Every circuit has either all its $t_{Kj}$ zero or all nonzero entries supported in a single row group. Thus the sum of the $\alpha_v$ from each group on each circuit is zero. Independently for each group $g$, apply to its colours one of the rotations $R_g\in\{I,R,R^2\}$, where $R(x_1,x_2)=(x_2,x_1+x_2)$. These preserve the zero column sums. They transform each pair of columns of $T$ together by an invertible map, so the matrix rank and left kernel are preserved.

For each group $g$, compute the sum of its row parities after rotation, with shifts still zero. On each circuit, the parity contribution from a group vertex with increment $u$ and preceding prefix sum $x$ is the sum of the zero-indicators at $x$ and $x+u$. Expanding gives

```math
u_1+u_2+Q(u)+B(x,u).
```

The linear terms sum to zero within each group on that circuit. Combining the $Q(u)$ terms with the prefix-sum terms internal to the group gives $Q$ of its total increment, also zero. What remains in the group parity is a sum over other groups $h$ of bilinear terms

```math
b_{gh}(R_g,R_h)=
\sum_j\ \,\sum_{\substack{u\in g\cap C_j,\ v\in h\cap C_j\\ v\text{ precedes }u}}
B(R_h\alpha_v,R_g\alpha_u).
```

Here a vertex is in a group if its component of $H$ belongs to that group. Since the total increment of each group on each circuit is zero, the two opposite orders of cross terms have equal sums. Thus $b_{gh}(R_g,R_h)=b_{hg}(R_h,R_g)$.

Ulyanov's bilinear balancing lemma applies, since $I+R+R^2=0$. For completeness, count choices of all rotations modulo two using the product of $1+\sum_{h\ne g}b_{gh}$ over groups. Its constant term sums to one because each variable has three choices. In any other term choose one ordered pair $(g,h)$ for each selected factor at $g$. A variable that occurs exactly once has zero sum by bilinearity. If every appearing variable occurs at least twice, counting occurrences shows that the selected pairs form vertex-disjoint directed cycles. A two-cycle contributes $b_{gh}^2=b_{gh}$, whose sum in either variable is zero. Terms with a longer cycle cancel in pairs by reversing the longer cycle that contains the least group index among all longer cycles. Symmetry preserves the product. Hence an odd number of choices makes all the group parities zero simultaneously. [Ulyanov, bilinear balancing](https://arxiv.org/abs/2607.13225) · [Prescribed single circuit, Section 2](https://zenodo.org/records/23189149)

After this choice, $p$ has zero sum over each group. The left kernel of the shift matrix is precisely the span of the $d$ group indicators, since they belong to the kernel, are independent, and the rank is $m-d$. Therefore the shift equations have a solution. In the resulting flow the zero-edge matching $M\subseteq E(F)$ has an even number of endpoints in each component of $H$.

**Producing the five even subgraphs.** Pair the endpoints of $M$ within each component of $H$, choose paths between the paired vertices, and let $P$ be the symmetric difference of those paths. The odd vertices of $P$ are exactly the endpoints of $M$. Thus $Y=M\cup P$ and $Z=F\mathbin{\triangle}Y$ are even, and $F\cap Y=M$. On $G-M$ the two coordinates of $q$ and their sum give three even edge sets $D_1,D_2,D_3$ covering every edge twice. The four even sets $Z,Z\mathbin{\triangle}D_1,Z\mathbin{\triangle}D_2,Z\mathbin{\triangle}D_3$ also double-cover $G-M$. Indeed, an edge of $Z$ occurs once among the last three, and any edge outside $Z$ occurs twice. Replace the first member $Z$ by $F,Y$. Their multiplicities agree with $Z$ away from $M$, and on $M$ they each contribute once. This is the desired five-cover. [Hoffmann-Ostenhof](https://arxiv.org/abs/1209.0096) · [Liu, Hao, Luo and Zhang, Theorem 1.6](https://doi.org/10.1137/22M1472425)

## Scope

The column-balance and rank hypotheses are conditions on a colouring of a particular complement. The proof leaves open how to find a suitable $F$ and colouring in an arbitrary bridgeless cubic graph. One cannot simply choose every prescribed two-factor. In the Petersen graph, if $F$ is two pentagons, then the residual cover after supplying $F$ must use ten spoke incidences and ten pentagon-edge incidences. Every residual circuit uses at most half spokes, so all must alternate. An alternating circuit has length divisible by four because each spoke switches between the two pentagons. The girth and order of the graph force its length to be eight. The total residual length twenty cannot be a sum of eights. This known obstruction is for the specified $F$. [Li, Hao, Luo and Zhang, Figure 1](https://doi.org/10.1016/j.disc.2025.114515)

Run `python3 research/five-cycle-double-cover-conjecture/verify.py` from the repository root. The replay checks the rank and directly enumerates the rotations and shifts on three graphs. It constructs the five even members and checks the exact multiplicity of every edge. Two examples insert a Petersen graph with one edge removed into an edge of a smaller cubic graph. The complement of the prescribed circuits is disconnected in all three examples. A second reader and a formal proof have yet to verify the written argument.
