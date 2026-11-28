# Three-terminal replacements and a remaining obstruction

Research continuation for [Merino–Welsh issue 44](https://github.com/1337isnot1337/solved-conjectures/issues/44), 21 November 2026. **No conjecture resolution or graph counterexample is claimed.** The exact rational data below are a counterexample to a specified algebraic proof relaxation. They are not asserted to be realizable by a graph.

The [earlier reduction](https://github.com/1337isnot1337/solved-conjectures/blob/main/docs/merino-welsh-research.md) constrains every parallel pair of a minimum-edge counterexample. This continuation tests whether simultaneous induction on all smaller three-terminal stars and triangles can finish one remaining local configuration. It cannot do so using only the boundary constraints listed here.

## 1. A safe vertex deletion

Let `G` be a minimum-edge counterexample to the multiplicative Merino–Welsh conjecture. Suppose a vertex `v` has exactly three distinct neighbors `u_1,u_2,u_3`, with exactly two parallel edges to each neighbor and no other incident edges. Put `X=G-v`.

The existing reduction makes the cycle matroid of `G` connected, so `G` is two-vertex-connected and `X` is connected. In fact `X` is bridgeless. Suppose an edge `e` were a bridge of `X`, splitting its vertices into two sets. Both sides must contain a neighbor of `v`, or `e` would already be a bridge of `G`. One side contains exactly one of the three neighbors, say `u_1`. After deleting the complete parallel pair between `v` and `u_1`, the edge `e` is then a bridge. This contradicts the earlier proved property that deleting any parallel pair of a minimum counterexample leaves a bridgeless graph.

Thus this particular vertex can be removed safely. This observation does not prove that a minimum counterexample has such a vertex, or that removing it preserves the conjectured inequality.

For the remainder of the note, also assume the three terminals are pairwise nonadjacent in `X`. This ensures that identifying any subset of the terminals produces no loop. Such identifications preserve connectedness and bridgelessness. All these quotient graphs have fewer edges than `G`, so the inductive conjectured inequality is available for them.

## 2. Boundary data

For any connected loopless graph `Y`, write

```math
A(Y)=T_Y(2,0),\qquad C(Y)=T_Y(0,2),\qquad t(Y)=T_Y(1,1).
```

Subscripts `0`, `ij`, and `4` denote respectively `X`, the graph obtained by identifying `u_i` with `u_j`, and the graph obtained by identifying all three terminals. For example, `A_{12}=A(X/(u_1=u_2))`. The subscript `4` is only a label for the all-three identification.

Normalize by

```math
a_{ij}=\frac{A_{ij}}{A_0},\quad b=\frac{A_4}{A_0},\quad
r_{ij}=\frac{t_{ij}}{t_0},\quad d=\frac{t_4}{t_0},\quad
c_\pi=\frac{A_0C_\pi}{t_0^2}.
```

Induction on the five boundary graphs gives

```math
c_0\ge1,\qquad a_{ij}c_{ij}\ge r_{ij}^2,
\qquad bc_4\ge d^2.
\tag{1}
```

There are useful orientation constraints as well:

```math
0\lt b\le a_{ij}\le1,\qquad
b\ge a_{12}+a_{13}+a_{23}-2,
\tag{2}
```

```math
c_0\le c_{ij}\le c_4,\qquad
c_{12}+c_{13}+c_{23}\le c_0+2c_4.
\tag{3}
```

For (2), view quotient-acyclic orientations as subsets of acyclic orientations of `X`. Identifying `u_i,u_j` preserves acyclicity exactly when neither terminal reaches the other. The all-three event is the intersection of the three pair events; use the union bound. For (3), view quotient-totally-cyclic orientations as subsets of all orientations of `X`. If an orientation is already totally cyclic, it lies in all three pair events. Otherwise, a directed cut of its condensation separates the terminals into two nonempty groups whenever a pair identification can make the graph totally cyclic. Any such successful pair must straddle that cut. At most two of the three pairs can do this. Each pair event is contained in the all-three event, which proves (3) by counting.

The resistance identity gives a further exact relation:

```math
d=r_{12}r_{13}
 -\left(\frac{r_{12}+r_{13}-r_{23}}2\right)^2.
\tag{4}
```

One derivation adds weighted edges `u_1u_2` and `u_1u_3` with weights `s,t` to `X`. The matrix-tree theorem and the determinant lemma give the coefficient of `st` as `t_0` times the determinant of the corresponding two-by-two effective-resistance matrix. Its diagonal entries are `r_{12},r_{13}` and its off-diagonal entry is `(r_{12}+r_{13}-r_{23})/2`. The spanning-forest expansion gives the same coefficient as `t_4`. This proves (4).

## 3. All smaller stars

Add a new vertex and `q_i` parallel edges from it to `u_i`, where the `q_i` are nonnegative integers. Denote the resulting star replacement by `S(q)`, and set `v_i=2^{q_i}-1`.

If all three arms are present, its acyclic orientation count is

```math
A(S(q))=4A_0+A_{12}+A_{13}+A_{23}+A_4.
\tag{5}
```

For exactly two arms `i,j`, it is `3A_0+A_{ij}`. For exactly one nonempty arm, it is `2A_0`. Parallel multiplicities do not change these counts: an acyclic orientation must direct a complete parallel class in one direction.

To derive (5), count proper colorings after coloring `X`: the number of colors available at the new vertex is the total number of colors minus the number of distinct terminal colors. Inclusion–exclusion on equality of the three terminal colors gives

```math
P_{S(q)}(z)=(z-3)P_X(z)
 +P_{X/12}(z)+P_{X/13}(z)+P_{X/23}(z)-P_{X/123}(z).
```

Evaluation at minus one with the appropriate vertex-count signs gives (5). The two-arm and one-arm formulas follow in the same way.

The other two counts are

```math
C(S(q))=(v_1+v_2+v_3-1)C_0
 +v_1v_2C_{12}+v_1v_3C_{13}+v_2v_3C_{23}
 +v_1v_2v_3C_4,
\tag{6}
```

```math
t(S(q))=(q_1+q_2+q_3)t_0
 +q_1q_2t_{12}+q_1q_3t_{13}+q_2q_3t_{23}
 +q_1q_2q_3t_4.
\tag{7}
```

For (6), use the random-cluster expansion `Z_Y(-1,1)=-C(Y)` for a connected graph and sum over the selected new edges. A nonempty selection in arm `i` has `2^{q_i}-1` choices. The selection containing no new edge leaves an isolated new vertex and contributes the minus-one term in the coefficient of `C_0`. For (7), classify spanning trees by their selected new arms. Contracting the selected star edges leaves the corresponding terminal-rooted spanning forest of `X`, equivalently a tree in the indicated quotient.

Every star with total edge multiplicity between two and five is connected and bridgeless, because `X` is bridgeless: two or more nonempty arms close a cycle through `X`, while a single arm of multiplicity at least two is a parallel block. It has fewer edges than the original doubled star. Thus all 52 such triples `q` must satisfy the conjectured product inequality by induction.

## 4. All smaller terminal triangles

Alternatively, add `q_{12},q_{13},q_{23}` parallel edges directly between terminal pairs, with total multiplicity at most five. These replacements are again loopless and bridgeless and have fewer edges than the original doubled star.

Let `E` be the support of `q` among the three terminal pairs, and let `v_e=2^{q_e}-1`. The acyclic orientation count is

```math
A(\Delta(q))=A_0+\sum_{e\in E}A_e+k_EA_4,
\quad
k_E=\begin{cases}
0,&|E|\le1,
\\ 1,&|E|=2,
\\ 2,&|E|=3.
\end{cases}
\tag{8}
```

This follows by chromatic deletion–contraction. When all three terminal edges are present, the three two-edge selections contribute three copies of `A_4`, while the full triangle contributes minus one copy.

The cyclic and tree counts are

```math
C(\Delta(q))=C_0+\sum_e v_eC_e
 +\left(\sum_{e\lt f}v_ev_f+v_{12}v_{13}v_{23}\right)C_4,
\tag{9}
```

```math
t(\Delta(q))=t_0+\sum_e q_et_e
 +\left(\sum_{e\lt f}q_eq_f\right)t_4.
\tag{10}
```

The random-cluster and spanning-forest expansions prove these identities as above. There is no triple product in (10), because selecting all three terminal edges creates a cycle. There are 56 nonnegative triples `q` with total at most five, including the unchanged base graph.

## 5. Exact obstruction to this relaxation

Set

```math
r_{12}=r_{13}=r_{23}=\frac{11}{8},\qquad d=\frac{363}{256},
```

```math
a_{12}=a_{13}=a_{23}=\frac{99}{100},\qquad b=\frac{49}{50},
```

```math
c_0=\frac{101}{100},\qquad
c_{12}=c_{13}=c_{23}=\frac{21}{10},\qquad
c_4=\frac{27}{10}.
\tag{11}
```

These data satisfy (1)–(4). In fact the inequalities in (1)–(3) are strict, except for the equality in (4). Substituting them into (5)–(10) satisfies every one of the 52 smaller-star and 56 smaller-triangle induction inequalities, strictly. The smallest respective normalized margins are

```math
\frac{1}{25}\quad\hbox{and}\quad\frac{1}{100}.
```

The accompanying `check_three_terminal_relaxation.py` verifies all 132 listed equalities and inequalities using integer fractions. The finite enumeration here checks a finite explicitly defined set of hypotheses for an auxiliary obstruction; it supplies no graph-conjecture evidence.

For the original doubled star `q=(2,2,2)`, the same formulas instead give

```math
\frac{A}{A_0}=\frac{159}{20},\qquad
\frac{A_0C}{t_0^2}=\frac{3442}{25},\qquad
\frac{t}{t_0}=\frac{1083}{32}.
```

Its normalized product margin is

```math
\frac{AC-t^2}{t_0^2}
=\frac{159}{20}\frac{3442}{25}
 -\left(\frac{1083}{32}\right)^2
=-\frac{6507957}{128000}.
\tag{12}
```

The formal spanning-tree inclusion probability of each doubled arm is `41/57`, which also lies strictly between `3/5` and `4/5`. Thus the earlier scalar marginal condition does not remove (11).

### Extension to every replacement with at most five edges

The same data also satisfy the induction inequality for every loopless three-terminal replacement gadget with at most five edges, provided that adjoining it to a connected bridgeless outside graph produces a connected bridgeless graph. This includes mixed configurations beyond the stars and triangles above. The claim is again about the sufficiency of this finite collection of boundary constraints, not about realizability of the data.

Here is the exact exhaustive procedure implemented by `check_all_small_gadgets.py`. A gadget has the three labelled terminals and `k` additional vertices. Every additional vertex has degree at least two. If additional vertices are present, the gadget has total terminal degree at least two, or its single attachment edge would be a bridge. With at most five edges, this implies `k<=4`. Thus every possibility occurs among multisets of at most five edges on the three terminals and at most four labelled additional vertices.

For each multiset, add an auxiliary path connecting the three terminals. Require the augmented graph to be connected, and require that deleting any original gadget edge leaves it connected. These conditions say exactly that every gadget component attaches to the outside graph and no gadget edge becomes a bridge there. The auxiliary path is only a connectivity test; it is not included in the counting formulas. The resulting enumeration has 1,832 labelled gadgets.

Their three boundary coefficient vectors can be calculated directly by summing over edge subsets `F` of the gadget. Let `h(F)` be the number of connected components of `F` containing no terminal, counting isolated additional vertices. Let `pi(F)` be the terminal partition, and let `s(F)=3-|pi(F)|` be its identification rank. Then the coefficient contributions to the three corresponding boundary vectors are

```math
\begin{array}{c|c}
\text{count}&\text{contribution in coordinate }\pi(F)
\\ A&(-1)^{k+|F|+h(F)-s(F)}
\\ C&(-1)^{h(F)}
\\ t&\mathbf 1\{F\text{ is a forest and }h(F)=0\}.
\end{array}
\tag{13}
```

The first formula follows from the chromatic random-cluster expansion at minus one, including the vertex-count change under terminal identification. The second follows from the random-cluster expansion at `(-1,1)`. The third counts precisely the forests that attach every additional vertex to a terminal, after which the complementary part is a spanning tree in the appropriate quotient of `X`.

The 1,832 gadgets yield 470 distinct triples of boundary coefficient vectors. Substitution of (11) gives a strictly positive product margin for every triple. The smallest is `1/100`, attained by the empty gadget, which is just the base-graph inequality. The checker separately reproduces the negative doubled-star margin (12).

This broader check was added because a mixed four-edge replacement eliminated an earlier candidate abstract witness. That earlier witness is not used in the present claim. The final data (11) are common to both exact checkers.

## 6. What this establishes

The safe vertex-deletion observation and the replacement identities are exact. The rational example proves that the stated collection of orientation-order, resistance, and smaller-replacement induction constraints is insufficient to derive the desired doubled-star inequality. Strict positivity of the obvious boundary inequalities does not fix this problem.

It remains possible that another graph-specific relation among these boundary data rules out (11), or that a different local replacement argument succeeds. No graph is claimed to realize these data, and (12) is not a Merino–Welsh counterexample. Further work on this route must supply an additional relation between the orientation counts and the electrical boundary data, rather than repeat the constraints already tested here.
