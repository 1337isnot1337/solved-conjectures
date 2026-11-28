# A planar obstruction to uncrossing parity-constrained marker cycles

This note distinguishes the known bounded-genus parity-free result
from the open parity constraint in [Chen, Problem 6.5](https://arxiv.org/html/2609.26158v1#S6).
It is not a counterexample to the packing-covering conjecture.

Schlomberg, Thiele and Vygen, [Packing cycles in planar and
bounded-genus graphs](https://arxiv.org/abs/2207.00450), prove
constant-factor *integral* vertex-packing approximations relative to
the fractional packing LP for uncrossable families when the entire
cycle graph is planar or has bounded orientable genus (Theorems 5
and 6). their Proposition 8 verifies uncrossability for cycles using exactly
one demand edge. This is prior work for a restricted supply-plus-
demand graph, not a uniform result for arbitrary supply and matching:
the markers can make the augmented graph high-genus even when the
supply itself is planar. Further, the intersection of the odd-cycle
and one-marker conditions need not be uncrossable, even with matching
markers and an augmented plane graph.

To see this, join two distinct vertices $u,v$ by four internally
vertex-disjoint paths $A,a,B,b$, of lengths $3,2,4,3$, respectively.
Choose one internal edge of $A$ and one internal edge of $B$ as
the two markers. The marker endpoints are all distinct. Removing
the markers yields a simple supply graph in which the markers are
nonedges. In the augmented graph $C_1=A\cup a$ and $C_2=B\cup b$
each use one marker and have odd total length, equivalently an
even-length supply part.

Take $b$ as the path in $C_2$ that meets $C_1$ only at $u,v$.
The only two $u$-$`v`$ paths in $C_1$ are $A$ and $a$.
The first exchange $A\cup b$ has just one marker but is even;
the second $a\cup b$ is odd but has no marker. The first condition
of uncrossability already fails, before asking for a second eligible
cycle in the complementary edge set. This rules out applying the
uncrossable-family rounding theorem directly to the combined family.
