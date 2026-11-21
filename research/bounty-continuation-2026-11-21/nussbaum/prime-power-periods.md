# Prime-power periods in Nussbaum’s ternary problem

**Theorem.** If a periodic orbit of a ternary Boolean-formula map in $`n`$ variables has prime-power least period $`p`$, the union of the Boolean completion faces of its states contains at least $`p`$ vertices. In particular $`p\le 2^n`$. The same conclusion holds for any period whose setwise stabilizers of maximal compatibility cliques have a least member under inclusion.

The sponsor offers US$100 for a proof covering every period. The result here leaves some mixed-prime periods open. The prime-period case is known even for arbitrary sup-norm nonexpansive maps. The proof below uses coordinate faces of a Boolean cube. [Sponsor’s May 3 question](https://sites.math.rutgers.edu/~zeilberg/math640_10.html) · [Lemmens, Scheutzow and Sparrow on the general prime-period result](https://www.kent.ac.uk/smsas/personal/bl81/ejclemmens2.pdf)

Represent each ternary state by the Boolean cube face obtained by filling in its stars independently. Different faces in an orbit are incomparable by inclusion. Indeed the formula map is monotone for the information order, so comparison with a distinct iterate would give a cyclic chain of strict comparisons. Also, cyclically shifting the states preserves the graph in which two faces are adjacent when they meet. Two distinct states are at sup-distance one half exactly when their faces meet, and all distances along the orbit are preserved by nonexpansiveness and periodicity. The argument uses only these two properties. [Full setup](target-and-interpolation.md)

## Replicating a vertex inside a class of faces

Partition a family of distinct incomparable faces into classes so that each class is a clique of the intersection graph, and two classes sharing any edge form a clique together. For a class $`B`$, let $`J_B`$ be the intersection of all its members. Intersections of pairwise meeting cube faces are nonempty, since their fixed bits agree coordinate by coordinate.

For a Boolean vertex $`y\in J_B`$ and each member $`F\in B`$, construct a vertex $`x(B,F,y)\in F`$. On the free coordinates of $`J_B`$ keep $`y`$. On the fixed coordinates of $`J_B`$ keep its bit unless $`F`$ is free there, in which case flip that bit.

1. For fixed $`B`$, the map $`(F,y)\mapsto x(B,F,y)`$ is injective. Projecting to $`J_B`$ by resetting its fixed coordinates recovers $`y`$. The set of flipped fixed coordinates then recovers the additional free coordinates of $`F`$, determining $`F`$.
2. If another face $`E`$ contains $`x(B,F,y)`$, it contains $`y`$. Indeed $`E`$ meets $`F`$, so it meets $`J_B`$: either $`E\in B`$ or $`E`$ together with $`B`$ is a clique. Every fixed bit of $`J_B`$ is therefore compatible with $`E`$. Resetting those bits of a vertex in $`E`$ keeps it in $`E`$.

In particular, if $`y`$ is common to a maximal clique $`C`$, every face containing a replica of $`y`$ belongs to $`C`$. This follows because the faces containing $`y`$ form a clique that contains $`C`$. The argument does not require a cube symmetry taking one orbit face to the next. In fact the construction in item 1 works for distinct faces even without the antichain hypothesis.

## Applying the count to a cyclic orbit

Label the faces by $`G=\mathbb Z/p\mathbb Z`$ with translation acting on their graph. Suppose some maximal clique $`C_0`$ has stabilizer $`H`$ contained in the stabilizer of **every** maximal clique, and put $`h=|H|`$. The cosets of $`H`$ partition the faces into classes as above. Every maximal clique is a union of whole classes. In particular each class is a clique, and any edge between two classes extends to a maximal clique containing both entire classes.

There are $`p/h`$ distinct translates of $`C_0`$, since its stabilizer is exactly $`H`$. Suppose $`C_0`$ consists of $`k`$ classes, so that each translate has $`kh`$ faces. For each translate $`C`$, choose a common Boolean vertex $`y_C`$. Different maximal cliques have disjoint sets of common vertices, so the choices are distinct. For each class $`B\subseteq C`$ and each face $`F\in B`$, record the replica $`x(B,F,y_C)`$.

The number of records is $`(p/h)kh=pk`$. To bound multiplicity, fix a vertex $`x`$ occurring in one record associated with $`C`$. Every face contributing any record at $`x`$ contains $`x`$. By item 2, every such face belongs to $`C`$. There are only $`k`$ possible classes, and by item 1 at most one record for each class. Consequently each vertex is counted at most $`k`$ times. At least $`p`$ distinct vertices occur, all in the original union of faces.

If $`p`$ is a power of a prime, all subgroups of $`G`$ are linearly ordered by inclusion, so one maximal clique has the required least stabilizer. This proves the theorem. It also bounds **every prime-power divisor** of an arbitrary period by $`2^n`$: iterating the map by $`p/q^e`$ gives a cyclic suborbit of size $`q^e`$ for each $`q^e\mid p`$.

## The remaining case

A counterexample must have maximal-clique stabilizers with at least two incomparable inclusion-minimal members. The [earlier construction with coordinate-line cliques](recurrent-completions-and-higher-face-gap.md) has a ternary formula orbit indexed by a product of cyclic groups of pairwise coprime prime orders. The regular cyclic action has maximal-clique stabilizers of those distinct prime orders. Thus a least stabilizer need not exist even for a genuine formula map.

Taking the intersection of all stabilizers still yields valid classes and replicas. If that intersection has order $`h`$ and a selected clique's stabilizer has larger order $`s`$, the same count gives only $`ph/s`$ vertices from that clique orbit. Additional geometric information is needed in the mixed-prime case. No unrestricted proof, award claim or mathematical priority claim accompanies this result.
