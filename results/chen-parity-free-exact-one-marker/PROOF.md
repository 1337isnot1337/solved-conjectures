# Half-integral Erdős–Pósa for prescribed pairs without parity

**Theorem.** For every integer `t >= 1` there is `f(t)`
such that, in an arbitrary finite undirected graph with a
matching of demand pairs, either `t` different demands can
be routed by paths of vertex congestion at most two, or a
set of at most `f(t)` vertices meets every path joining a
demand pair. Terminals can be deleted at unit cost.

This answers the first question in [Shuyan Chen, Problem 6.5](https://arxiv.org/pdf/2609.26158#page=14)
affirmatively. To obtain the cycle formulation, add the matching
of nonedge markers and close each supply path with its own
marker. Conversely deleting the unique marker of an eligible
cycle gives a supply path. The theorem does not prescribe parity
in a nonbipartite supply graph; see [#1012](https://github.com/1337isnot1337/solved-conjectures/issues/1012).

The two graph-minor inputs are Robertson–Seymour's tangle-controlled
grid theorem, in the form explicitly recorded as statement (2) in
[Graph Minors XVI](https://web.math.princeton.edu/~pds/papers/GM16/paper.pdf),
and their rooted clique-minor linkage theorem, stated as Theorem 4.1
in [Kawarabayashi–Kobayashi–Reed](https://kam.mff.cuni.cz/~samal/DS/disjoint.pdf).
Only existence, not quantitative or algorithmic bounds on those
theorems, is needed here.

## 1. A well-linked piece from large fractional packing

Let a fractional packing of demand paths have total value `T >= 1`
and unit vertex capacities. Give each terminal the total weight of
the currently retained paths ending there and call the weight
function `pi`. Since the demands form a matching, both ends of
each pair have equal weight and each terminal has weight at most
one. The total terminal weight is twice the retained path weight.
Set `epsilon = 1/[4(1 + log_2(2T))]`.

Starting with the whole graph, if a current piece has a vertex
partition `A,S,B` with no edge from A to B and

    |S| < epsilon min(pi(A), pi(B)),

discard all retained paths meeting S and recurse in the disjoint
induced parts A and B with their surviving paths. Weight lost in
this step is at most |S|. For nonempty S, bound this by charging
epsilon times its current weight to each path endpoint on the
side of smaller terminal weight. If a charged endpoint's path
survives and continues in this side, the new piece has at most
half its parent's total terminal weight. If the path dies, that
endpoint is never charged again. No nonzero charge can occur in
a piece of terminal weight below one, since |S|>=1. Each original
weighted endpoint is charged at most `1+log_2(2T)` times, so the
total discarded weight is at most T/2. Splits with S empty cost
nothing. The process terminates because both child graphs are
proper induced subgraphs.

In a final piece, scale its terminal weights by epsilon. The
resulting weight function q has equal weights at the ends of a
pair, each weight at most one, and satisfies

    |S| >= min(q(A), q(B))

for every such partition in the piece. The total q-weight of all
final pieces is at least epsilon T. If there are t positive pieces,
choose one retained path in each. Otherwise there is a positive
piece whose total q-weight tends to infinity with T for fixed t.
We work in that piece, and write P for its total q-weight.

## 2. The terminal linkage matroid

Fix t>=2. Choose an integer Theta at least 8t+1 so that every
tangle of order Theta controls an (8t+1)-square grid minor, and
assume P>max(6 Theta,20t).

Each separation of order d<Theta has a unique side with weight
off its separator at most d: existence uses the inequality in
section 1, and both sides being small would give P<=3d.
Orient the separation with that side first. A small side including
the separator has weight at most 2d. Three such sides cannot
cover the weight P, and no small side is spanning. This is a
tangle of order Theta. In its controlled grid model, every whole
model row disjoint from a separator of order at most 8t is on
the large side. Indeed a disjoint row is connected and cannot be
on the small side, by the controlled-row property.

For j=1,...,4t choose a vertex z_j of the branch set of cell
(row 2j-1, column 2j). Put Z={z_j}. The chosen rows are distinct,
as are the columns, and none of the chosen row indices is a chosen
column index.

Attach to each positive-weight terminal its own new pendant leaf,
and move its demand endpoint to the leaf. The original grid model
stays unchanged and avoids all new leaves. Let M be the gammoid
on these leaves in which a set is independent if it admits
vertex-disjoint paths to distinct vertices of Z. We use the
following bound for any subset U of terminal leaves:

    rank_M(U)=d<4t  implies  q(U)<=2d.                  (1)

Here q is transferred from each original terminal to its leaf.
By Menger, a set of d vertices separates U from Z, with endpoints
eligible for the separator. Replace any deleted leaf by its
original neighbor to obtain a separator S in the original graph,
of size at most d, between the original terminals of U and Z.
Indeed any surviving connection in the original graph would
extend to the surviving leaf. As d<4t, there is a chosen row with
no branch set touched by S, containing its chosen z_j. The
component of this row in the original graph minus S contains
none of the surviving original terminals of U. Make a separation
whose small-side candidate is the union of all components meeting
these terminals, together with S. The clean row is on the other
side, so the tangle-controlled property ensures the candidate is
the small side. Its q-weight, including S, is at most 2d.
This proves (1).

## 3. Whole pairs independent in the gammoid

Suppose t whole demand pairs have their 2t endpoints independent
in M. Form `H = G⁺[K₂]`, where `G⁺` is the graph with the
pendant terminal leaves. Each vertex has two adjacent copies
labelled 0 and 1; adjacent originals give all four clone edges.

The grid model gives a clique minor in H with 8t+1 branch sets
C_i: use layer 0 of all original branch sets in row i and layer 1
of all branch sets in column i. Their union is connected, via a
twin edge at the diagonal cell. The C_i are disjoint, and C_i,C_j
are adjacent via a twin edge at cell (i,j). Every z_j has its two
clones in two different C_i and no two of the 8t chosen target
clones are in the same C_i.

Let X consist of the layer-0 clone of each of the 2t selected
terminal leaves. A disjoint attachment linkage in `G⁺` to Z
doubles to vertex-disjoint paths in H, one per selected clone
in both layers, with distinct target clique branches. Suppose
that a separation (A,B) of H of order d<|X| has X contained in A
and a whole clique branch set contained in B minus A. Put
S=A intersection B and d_X=|X intersection S|. Every primary
root in A minus B has its secondary clone in A, since the clones
are adjacent. Therefore at least 2|X|-d_X of the doubled linkage
paths start in A. At most d of these meet S. Any that avoids S
ends in A minus B. Its target clique branch must meet S; otherwise
this connected branch lies wholly in A minus B and cannot be
adjacent to the entire branch in B minus A. At most d-d_X
branches meet S because model vertices avoid all terminal leaves
and because branch sets are disjoint. With no two linkage
targets in the same branch, this gives

    2|X|-d_X <= d+(d-d_X),

a contradiction. The rooted clique-minor linkage theorem now
routes all t given pairs disjointly in H. Projection to `G⁺` and
deleting repeated portions gives paths of vertex congestion at
most two, since each original vertex had only two clones. Remove
the pendant endpoints to return to the original demands.

## 4. If whole pairs do not link: a residual-flow exchange

Let I be the endpoints of a maximal family of complete demand
pairs whose union is independent in M. If t such pairs exist
section 3 applies, so assume |I|<=2t-2. Contract I in M. Let L
be the loop set of the contracted matroid, outside I. Its union
with I has rank |I| in M, so (1) gives q(L)<=2|I|. Discard the
selected pairs and all pairs with an endpoint in L. Since pair
ends have equal q-weight, the discarded total weight is at most
`|I|+2q(L)<=5|I|`.

Every remaining pair has parallel elements in M/I: neither
endpoint is a loop, and by maximality both cannot be added to I.
Let U be the union of these remaining pairs. Its rank in M/I
is at least t, because otherwise its rank in M is at most
`|I|+t-1<4t`, and (1) would give
`P-5|I|<=q(U)<=2(|I|+t-1)`, inconsistent with P>20t.
Choose t independent representatives x_1,...,x_t in M/I
among these endpoints. Their mates y_1,...,y_t are parallel to
the corresponding representatives. The pairs are distinct
because independent representatives cannot both be taken from
one parallel class. Write X={x_i}, Y={y_i}.

A linkage of I union X to Z uses a set Z_0 of |I|+t distinct
targets. We claim there is also a linkage of I union Y to the
same Z_0. Work in the directed node-capacitated flow network
in which each supply vertex is split into an entrance and exit
with a unit capacity arc, each original undirected edge gives
both directed transitions, roots supply at entrances, and targets
absorb at exits. A disjoint linkage is a unit integral flow.
Take the flow F_X from I union X to Z_0. For each i, since
replacing x_i by its parallel mate preserves independence in
M/I, there is a flow from `(I union X)-x_i+y_i` to some equally
sized subset of Z. Subtract F_X from that flow; understand
negative arcs as reversing units of F_X. All resulting arcs
are residual arcs. Decompose the difference into directed
paths and cycles with its specified imbalances. A path beginning
at y_i must terminate either at x_i or at a newly used target
in Z minus Z_0. The latter would augment F_X by including y_i
without losing a root, impossible since I union X union {y_i}
is dependent. Thus there is a residual y_i-to-x_i path. Sending
one unit along it yields the replacement flow to the same Z_0.
In the gammoid with target set Z_0, the pair x_i,y_i is therefore
still nonloop and parallel after contracting I: it is dependent
in the original gammoid and each member is individually
independent with I in the restricted-target gammoid. Replacing
all the representatives by their mates preserves independence
there. This proves the claim.

Take flows F_X and F_Y to the same Z_0. Their difference
decomposes into cycles and t residual paths from the individual
y_i to the individual x_j. Applying one residual path to F_X
yields a flow replacing x_j by y_i, with all other roots fixed.
If j is different from i, this would link both x_i and y_i
together with I, impossible by parallelism in M/I. Thus every
residual path pairs y_i with x_i.

In the original undirected graph these residual paths project to
walks. Count edge incidences with multiplicity before simplifying.
At every vertex the union of the two disjoint linkages contributes
at most four incidences. At a difference endpoint it contributes
at most three because one old linkage uses that vertex as a root.
An internal occurrence on a projected path costs two incidences
and an endpoint one; there is at most one difference endpoint
per vertex. It follows that at most two projected paths contain
any vertex. Equivalently, one may first erase loops separately in
each projected walk; this only reduces incidence counts. We have
t prescribed-pair paths with vertex congestion two, as desired.

## 5. Uniformity and limitations

For fixed t, the threshold needed for P is a constant from the
controlled-grid theorem and the inequalities above. Section 1
therefore gives a finite global T threshold such that fractional
packing above it forces a congestion-two routing. The
[fractional multicut bound](FRACTIONAL-MULTICUT.md) converts
the contrapositive into a transversal bound depending on t alone.
For t=1 the statement is immediate.

No parity information is preserved in either the doubled-graph
projection or the residual-flow exchange. The second question in
Chen's Problem 6.5, where the parity of the supply path is fixed,
is not settled here.
