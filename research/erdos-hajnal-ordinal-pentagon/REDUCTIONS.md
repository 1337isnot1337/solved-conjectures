# Erdős–Hajnal’s ordinal pentagon conjecture

**Partial.** Let $`\kappa=\omega_1`$ and $`\alpha=\kappa^{\omega+1}`$.
Write $`C_\beta`$ for the natural columns of type $`\kappa^\omega`$,
indexed by $`\beta<\kappa`$. A counterexample to the 1975 conjecture must
have all of the following properties:

1. Every vertex has a radius-two ball of order type below $`\alpha`$.
   Moreover, for each vertex there is a finite $`m`$ such that in
   every sufficiently late column its ball has order type less
   than $`\kappa^m`$.
2. At most countably many columns contain a full-type slice of the
   neighborhood of any single vertex.
3. In a partition into consecutive blocks of type $`\kappa`$, the
   indices of the blocks hit uncountably by at least one vertex
   neighborhood have order type $`\alpha`$.

These conditions narrow the remaining case. They do not prove or
disprove the full conjecture.

## Radius-two balls

In a $`C_5`$-free graph, the open neighborhood of any vertex contains
no three-edge simple path: adjoining the central vertex would create
a five-cycle. A graph without such a path has components that are
stars or triangles and is 3-colorable. To see the component assertion,
a triangle cannot have an edge to an outside vertex, since the edge
and two edges of the triangle give the forbidden path. If a component
is triangle-free, a vertex of degree at least two and its neighbors
must form the entire component, since any further vertex attached
to a neighbor gives the path. An isolated vertex or single edge is
also a star.

Now fix the center $`v`$. Assign to every distance-two vertex one
intermediate neighbor of $`v`$ on a two-edge path from $`v`$.
If two distance-two vertices with distinct assigned neighbors
were adjacent, those paths and their edge would form a simple
five-cycle. Thus the fibers of this assignment are mutually
nonadjacent, and each is 3-colorable since it is contained in an
open neighborhood. Use three colors on the distance-two vertices
and on $`v`$ itself, and three other colors on the distance-one
vertices. This colors the entire ball with six colors.

Every ordinal of the form $`\omega^\xi`$ is indivisible under
finite vertex partitions: a finite union of subsets each of
smaller type still has smaller type, by the natural-sum upper
bound for shuffled well-orders. Hence a radius-two ball of full
type $`\alpha`$ would give an independent subset of full type.

## The rank description

A subset $`S\subseteq\alpha`$ has order type less than $`\alpha`$
if and only if there exist $`m<\omega`$ and $`\gamma<\kappa`$
such that for every $`\beta\ge\gamma`$ the slice
$`S\cap C_\beta`$ has order type less than $`\kappa^m`$.

Indeed, if the bound holds, the early columns contribute at most
$`\kappa^\omega\cdot\gamma`$. The tail contributes at most
$`\kappa^m\cdot\kappa=\kappa^{m+1}`$, so the sum is below
$`\alpha`$. Conversely, if there is no eventual finite bound,
in each column tail choose a strictly increasing sequence of
columns whose slices have order types at least $`\kappa^n`$ at
the $`n`$-th step. Their union has type at least $`\kappa^\omega`$.
The selected sequence occupies a bounded set of column indices
by regularity of $`\kappa`$. Repeating this choice for $`\kappa`$
successive disjoint intervals of column indices gives a subset
of type at least $`\alpha`$. This proves condition 1.

## When a vertex sees a full slice in many columns

Call a column full-neighborhood if some $`v_\beta`$ has
$`N(v_\beta)\cap C_\beta`$ of type $`\kappa^\omega`$. Suppose
there are uncountably many such columns. In view of condition 1,
choose an uncountable set of these columns on which their witnesses'
eventual finite-rank bound is one common $`m`$. Recursively select
$`\kappa`$ of them in increasing order, at each stage going past
all earlier witnesses' threshold columns.

In a newly selected column, delete the radius-two balls of all
earlier witnesses, restricted to that column. There are only
countably many earlier witnesses and each removed set has type
below $`\kappa^m`$. For every finite $`m`$, the ordinal $`\kappa^m`$
is indivisible under countable partitions: for $`m=1`$ this is
regularity, and for the step choose a full color in every
$`\kappa`$-row and use induction on the row indices.
Thus their union has type below $`\kappa^m`$. It cannot lower
the full type of $`N(v_\beta)\cap C_\beta`$ on deletion, by
finite indivisibility of $`\kappa^\omega`$. This remaining
neighborhood is 3-colorable; choose an independent subset of
full column type. The subsets from different stages are
mutually nonadjacent, as any neighbor of a previously selected
vertex belongs to the previous witness's radius-two ball.
Their union has order type $`\alpha`$. This proves condition 2.

## When basic blocks have countable incoming neighborhoods

Since $`\kappa\cdot\alpha=\alpha`$, partition $`\alpha`$ as
consecutive basic blocks of order type $`\kappa`$, with index
order $`\alpha`$. A basic block is thin if every vertex has
only countably many neighbors there. If the thin indices have
full order type, choose an independent set containing $`\kappa`$
points of each of their blocks. There are $`\kappa`$ total
requirements, one for each block and each of its $`\kappa`$
points to be chosen. Process the requirements in type $`\kappa`$;
at each step only countably many vertices have been chosen
already, and all their neighborhoods together block only
countably many vertices of the current thin block. Thus one
can always choose a new nonadjacent point. The result has
full order type. By finite indivisibility of the index order,
if the thin indices do not have full type then the other indices
do. This proves condition 3.

## Source and boundary

The printed exponent is $`\omega+1`$ in [Erdős 1975, p. 183](https://users.renyi.hu/~p_erdos/1975-33.pdf#page=1).
[Erdős 1982, p. 135](https://combinatorica.hu/~p_erdos/1982-24.pdf)
states the exact ordinary-cycle conjecture and credits the smaller
$`\kappa^\omega`$ positive result to Erdős and Hajnal.
[Komjáth–Shelah, Theorem 7](https://shelah.logic.at/files/95727/303.pdf)
proves the positive relation on type $`\omega_1^2`$. The related
[Larson 1980 counterexample](https://doi.org/10.1007/BF02762052)
concerns a triangle, not a five-cycle; a triangle-free graph can
still contain a pentagon. The infinite-path conjecture is a
different relation and does not settle the five-cycle case.
Exact exponent, theorem-title and author searches, including modern
partition reviews and repo issue searches, did not reveal an exact
prior resolution. This is not a claim of exhaustive novelty coverage.

[Tracking issue #984](https://github.com/1337isnot1337/solved-conjectures/issues/984).
