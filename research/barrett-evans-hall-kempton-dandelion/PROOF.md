# The dandelion minimizes the complementary algebraic-connectivity sum

**Theorem.** Let $`G`$ be a finite simple graph on $`n\ge4`$ vertices for which $`G`$ and its complement both have diameter three. Among all such graphs, the dandelion minimizes $`\lambda_2(G)+\lambda_2(G^c)`$, where $`\lambda_2`$ is the second smallest eigenvalue of the combinatorial Laplacian. Equality holds precisely for the generalized dandelions and their complements. This proves Barrett, Evans, Hall and Kempton’s Conjecture 2. [Original paper, §4.1, Conjecture 2 and Lemma 4.2](https://arxiv.org/pdf/2201.04225#page=15)

In a generalized dandelion there is a path $`l,w,h`$ with $`l`$ a leaf, $`w`$ of degree two, and $`h`$ adjacent to every vertex except $`l`$ and itself. The $`n-3`$ ordinary vertices may have arbitrary edges among themselves. With no such edges this is the original dandelion. The leaf and any ordinary vertex are at distance three. In the complement the hub and the intermediate vertex are at distance three. The two graphs both have a dominating edge, so both diameters equal three.

For any choice of the ordinary edges, vectors constant on the ordinary vertices give the same quotient Laplacian as in the dandelion. On the orthogonal subspace of vectors supported on the ordinary vertices with sum zero, the Laplacian is the identity plus the internal Laplacian. Its eigenvalues lie between one and $`n-2`$, by comparison with the complete graph on those vertices. The dandelion’s extreme nonzero eigenvalues $`r_-\in(0,1)`$ and $`r_+\in(n-1,n)`$ come from the quotient. They are the smallest and largest roots of

```math
 t^3-(n+2)t^2+(3n-2)t-n=0 .
```

Since the complementary Laplacians sum to $`nI-J`$, the attained minimum is $`D_n=n+r_--r_+`$. [Dandelion spectrum, Lemma 4.2](https://arxiv.org/pdf/2201.04225#page=15)

## The comparison when both graphs have leaves

Let $`l`$ be a leaf of $`G`$ and $`h`$ a leaf of $`G^c`$. They are distinct because their degrees in $`G`$ are one and $`n-2`$, respectively. If $`lh`$ is absent in $`G`$, then $`h`$ is adjacent there to all other vertices except $`l`$. If $`lh`$ is present, interchange $`G`$ and $`G^c`$ and the roles of the two vertices. In either case the [all-orders missing-leaf comparison](MISSING-LEAF.md) gives strict inequality above $`D_n`$ unless one side is a generalized dandelion. The [exact rational checker](check_leaf_near_universal.py) handles the finite comparisons used in that proof.

## Orders four through twenty

Choose vertices $`u,v`$ at distance three in $`G`$ and $`s,t`$ at distance three in $`G^c`$. The pair $`u,v`$ is nonadjacent and has no common neighbour in $`G`$. The edge $`st`$ is present in $`G`$, and every other vertex is adjacent in $`G`$ to at least one endpoint, because otherwise it would be a common neighbour in $`G^c`$. The pairs are disjoint. For example if $`u=s`$, then $`v`$ misses $`s`$ and must meet $`t`$, which would make $`t`$ a common neighbour of $`u,v`$. Of the four edges between the pairs there must be at least two to cover $`u,v`$, and $`s,t`$ can each meet at most one of $`u,v`$. They therefore form a perfect matching.

These four vertices induce a path, labelled in order $`0,1,2,3`$. Each exterior vertex meets at most one of $`0,3`$ and at least one of $`1,2`$. Conversely, every such choice and every choice of edges among the exterior vertices gives both diameters three. Edge $`1,2`$ dominates in the graph and edge $`0,3`$ dominates in its complement, and the designated opposite vertices still have no common neighbour in the appropriate graph. [Original research reduction](https://github.com/1337isnot1337/solved-conjectures/blob/e41d1279f655efd121e144777bd51b7047f03c4d/research/barrett-evans-hall-kempton-dandelion/ANCHORED-PERMUTATIONS.md)

The [finite certificate](check_anchored_dandelion.cpp) encodes a red neighbour of label $`i`$ by the bit $`2^i`$. The permitted masks are 2, 3, 4, 5, 6, 7, 10, 12 and 14. Relabel the exterior vertices in nondecreasing mask order. For their count vectors the checker uses path reversal and complementation followed by relabelling the new path as $`2,0,3,1`$. These operations preserve the objective, the domain and the family of equality cases. Retaining the lexicographic minimum in each orbit leaves every mathematical case represented.

At any node, red and blue edges already assigned give spanning graphs $`A,B`$. Any completion $`G,G^c`$ contains these respective graphs. Laplacian monotonicity, from the nonnegative edge quadratic forms, gives

```math
 \lambda_2(G)+\lambda_2(G^c)\ge\lambda_2(A)+\lambda_2(B).
```

The node closes if the certified right side exceeds $`D_n`$. It also closes if both colours have a vertex forced to be a leaf. In particular an assigned degree $`n-2`$ in the other colour forces a leaf because each colour is connected already. All such completions satisfy the previous comparison.

Otherwise choose a pivot exterior vertex $`i`$ and a group of vertices whose edges from $`i`$ are unassigned. Two group members $`j,k`$ must have identical assigned red and blue neighbours outside $`\{j,k\}`$. Their transposition fixes the pivot and preserves all three edge states, including unassigned pairs. All permutations of the group are therefore available. Branch, for each possible count $`r`$, by making the first $`r`$ edges from the pivot red and all other edges into the group blue. This covers every completion up to a permutation, fixes at least one edge and terminates. A completed graph failing both certificates causes the program to return failure.

### Exact spectral test

For a threshold $`s`$ restrict the quadratic form $`L-s(I-J/n)`$ to vectors with last coordinate zero. Subtracting the mean identifies that space with the mean-zero space, preserves Laplacian energy, and gives exactly the squared norm from $`I-J/n`$. Positive definiteness is equivalent to $`\lambda_2>s`$. The [shared arithmetic checker](dandelion_schur.hpp) uses dyadic thresholds, integer entries and outward-rounded integer intervals in Schur elimination. It accepts only if every lower pivot bound is positive. Floating-point operations propose trial thresholds. Every acceptance requires two exact tests. Bisection of the cubic with integer arithmetic rounds $`r_-`$ upward and $`r_+`$ downward, so their combination bounds $`D_n`$ from above.

The [review](REVIEW.md) records coverage, overflow bounds and an independent exact-arithmetic cross-check. The program certifies every order from 4 through 20. At order 20 alone it covers all 735,471 attachment-count vectors, with 183,999 representatives after symmetry. No unresolved terminal graph remains.

## Orders twenty-one and above

For each order from 21 through 64, the [normalized Fiedler-coordinate certificate](FINITE-INTERVAL.md) proves that a complementary connected pair attaining at most $`D_n`$ has a leaf on each side. Its [rational verifier](verify_finite_interval.py) closes 3,276 branches. For every $`n\ge65`$ the [uniform interval theorem](INTERVAL-LEAF-THRESHOLD.md) gives the same conclusion with one [600-branch rational certificate](verify_effective_interval.py). Its inequalities are uniform for all orders above the threshold. In both ranges the all-orders missing-leaf comparison gives the stated characterization. Together with the finite anchored certificate this covers every admissible order.

The earlier 11–20 anchor argument above uses the source diameter hypotheses. The separate [connected-complement proof](CONNECTED-EXTENSION.md) removes them at all orders and preserves the equality classification. [Discovery and review record](https://github.com/1337isnot1337/solved-conjectures/issues/962)
