# Tutte’s 5-flow conjecture

**Partial research.** Two nonnegative boundary functions satisfy Kochol’s partition-incidence identities, have disjoint supports, and each meets the flow support of every six-terminal cactus with a feasible boundary. Thus the partition identities, positivity, and comparison with cactus replacements alone cannot force gluing at a cyclic six-edge cut. The witnesses are functions on boundary values. Their realization as flow counts of graph fragments is open. The conjecture remains open. [Tracking issue #362](https://github.com/1337isnot1337/solved-conjectures/issues/362)

## Target and sources

Tutte asks whether every finite bridgeless graph has a nowhere-zero integer 5-flow, equivalently a nowhere-zero flow over $\mathbb F_5$. Seymour established the universal 6-flow bound. A smallest counterexample would be a cyclically 6-edge-connected cubic graph by Kochol. Kochol also proved a girth lower bound of 11. The November 24, 2026 search found no full prior resolution. [Tutte (1954)](https://doi.org/10.4153/CJM-1954-010-9) · [Seymour (1981)](https://doi.org/10.1016/0095-8956(81)90058-7) · [Kochol (2004)](https://doi.org/10.1016/S0095-8956(03)00080-7) · [Kochol (2010)](https://doi.org/10.1016/j.jctb.2009.12.001)

The 2026 proof of the cycle double cover conjecture leaves its orientable five-cover strengthening open. An orientable five-cover would give Tutte’s 5-flow conclusion. Jafari's November revision retains the one-unit gap between its general modulo-five orientation bound and the nine-edge-connectivity of a tripled 3-edge-connected cubic graph. The result below concerns the separate six-cut gluing approach. [Oum's exposition, §9.3](https://arxiv.org/abs/2607.16356v3) · [Jafari, v4](https://arxiv.org/abs/2610.07034v4)

## 1. Six-terminal gluing and the partition space

A fragment has six labeled terminals of degree one, with their incident flows directed into the fragment. A component consisting of one edge between two terminals is also allowed and requires their incoming values to be opposite. A boundary is a vector $s\in(\mathbb F_5^\times)^6$ with total sum zero. For a partition $P$ of the six labels into blocks of size at least two, write $\chi_P(s)$ for the indicator that $s$ sums to zero on every block. Let $W$ be the real span of these indicators.

For any fragment, its count of nowhere-zero extensions of $s$ is a nonnegative function in $W$. This is Kochol's partition-incidence identity. To see it directly, use inclusion–exclusion on internal edges forced to zero. For each subset of such edges, delete those edges and allow arbitrary values on the retained internal edges. The balance equations are solvable precisely when the loads in each retained connected component sum to zero. The number of solutions then equals a fixed power of 5 by the incidence-matrix rank formula. Components with no terminals make no additional boundary demand, and a component with exactly one terminal contributes identically zero. The same count statement applies to a direct terminal pair using its independent opposite-value constraint. [Kochol, *About Counterexamples to the 5-Flow Conjecture*](https://doi.org/10.1016/j.endm.2005.06.004) · [Korcsok, §2.1 and Lemma 2.3](https://dspace.cuni.cz/handle/20.500.11956/62557?locale-attribute=en)

When two fragments represent the shores of a six-edge cut, a nowhere-zero 5-flow on the glued graph exists exactly when the two count functions are positive at a common boundary. Negating the flow on one fragment aligns its incoming values across the cut. Also, if replacing one shore with a smaller fragment produces a bridgeless graph, minimality of a hypothetical smallest counterexample implies that the other shore's count function meets that replacement's support.

**Obstruction theorem.** There exist nonnegative integer-valued functions $F,G\in W$ with $F(s)G(s)=0$ for every boundary $s$. For every finite six-terminal cactus fragment with a feasible boundary, both $F$ and $G$ are positive at some feasible boundary of that fragment. A cactus here is a graph in which each edge belongs to at most one cycle. It may be disconnected.

The comparison tests in the theorem include all forest and unicyclic fragments and impose no restriction on the number of vertices. Neither witness is asserted to be a feasible graph count function. The result blocks an inference based solely on these conditions. Priority for this obstruction is provisional.

## 2. Why the cactus tests are exhaustive

Fix a boundary vector with total sum zero. In a connected cactus fragment, balance first requires the sum of the attached terminal values to be zero. The value across a bridge is forced up to orientation and is the sum of the terminal values on one side. It must be nonzero. A bridge separating no terminals on one side prevents feasibility. A bridge with just one terminal on one side is automatically nonzero.

For a cycle $C$, delete its edges. The remaining components incident to its vertices are disjoint. Otherwise an external path between distinct vertices of $C$ would put a cycle edge in two cycles. Each component assigns its set of terminal labels to one vertex of $C$. Listing the sums of their boundary loads around the cycle as $h_1,\ldots,h_k$, an initial cycle-edge value can be chosen freely, and the other values differ by successive partial sums of the $h_i$. The cycle admits nonzero values exactly when those partial sums omit a residue of $\mathbb F_5$. This condition is independent of other cycles. Indeed, after choosing a spanning forest by deleting one edge from each cycle, the affine space of all flows with fixed boundary is parametrized by adding independent circulations, one supported on each cycle. Loops impose no restriction.

Call a vertex of a cycle active if its attached component contains any terminal. A cycle with at most four active vertices has at most four distinct partial sums, including the initial zero, so it gives no support restriction. Hence every such cycle can be contracted for the purpose of computing the boundary support. Contraction preserves the terminal sets on each side of every remaining bridge and the sets attached to each vertex of every remaining cycle.

Two cycles in the same cactus component can each have at most one attached component leading to the other cycle. The sets of terminals away from those two components are disjoint, since the incidence graph of blocks and cut vertices in a connected graph is a tree. If both cycles had at least five active vertices, their disjoint outer sets would contain at least four terminals each. Two cycles in different components would need at least ten terminals in total. Therefore at most one uncontracted cycle remains.

If no cycle remains, the feasible boundaries are exactly the balances for a partition into connected terminal blocks, plus the nonzero bridge sums for certain splits of each block. Components with no terminals are irrelevant when feasible. Components with a single terminal prevent feasibility. Disregard splits with a singleton part. The remaining splits in a tree are pairwise compatible, meaning that some intersection of a part of one split and a part of the other is empty. There are at most three such splits, since a tree on $m$ terminals, after suppressing degree-two vertices, has at most $m-3$ edges with at least two terminals on each side. The bound follows from the degree sum for a tree with all internal degrees at least three. The checker enumerates every compatible family of at most three splits of the blocks, so it includes every forest support.

If a cycle remains, it has five or six active positions. Every terminal belongs to that component, since any other nonempty terminal block would need at least two labels. If there are six active positions each carries exactly one terminal. If there are five, one position carries two and the others carry one. Suppressing positions without terminals does not change the partial-sum criterion. The only possible nontrivial bridge test is that the sum of the two terminals at the same active position is nonzero. It appears if a bridge separates both of those terminals from the cycle. The checker enumerates all orders of the blocks around the cycle and both possibilities for this extra test. Rotation and reversal preserve the number of distinct partial sums, so it keeps one order per dihedral orbit.

## 3. Exact witness and reproducible checks

The coefficients of $F$ are specified in [verify.py](verify.py) by partitions written with terminal labels $0,\ldots,5$. The coefficient of the one-block partition is $-7$. The code lists the two-block and three-block coefficients explicitly. The companion function is

```math
G = 5+5\chi_{234\mid015}+4\chi_{13\mid04\mid25}-4\chi_{02\mid14\mid35}-5F.
```

The constant function is the indicator of the one-block partition, so both functions lie in $W$. Multiplying a boundary by any nonzero residue preserves all partition, bridge, and cycle tests. The checker normalizes the first entry to $1$ and exhausts the 205 possible normalized vectors using integer arithmetic. It obtains positive support sizes of 82 and 123, respectively, and checks the pointwise product is zero. Among the 741 distinct nonempty supports enumerated for the cactus tests, the respective minimum sums of the values of $F$ and $G$ are 1 and 30. A positive sum gives the required support intersection. The constants were found with floating-point linear optimization and are verified by the standalone exact check without an optimizer dependency.

```sh
python3 research/tutte-five-flow-conjecture/verify.py
```

The conclusion covers cactus replacement feasibility and the partition space. Constraints specific to graph-realizable count functions, or comparison against fragments with overlapping cycles, could still force an intersection. No reduction to cyclically 7-edge-connected graphs follows from this witness.
