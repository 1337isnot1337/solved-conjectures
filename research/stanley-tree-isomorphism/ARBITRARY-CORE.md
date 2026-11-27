# Recovering an arbitrary tree core from decorated exterior arms

Start with an unrooted tree with at least two internal vertices, all of degree at least three. Keep its $`r`$ leaves as temporary labels for the construction. Replace each internal edge by a path of any positive length. The resulting tree on the internal vertices and these paths is the **core**, of order $`H`$. Replace the edge to each labeled leaf by a rooted arm attached to the same hub. An arm has $`u_i`$ unary roots followed by a **cap** $`C_i`$, which is either a single vertex or a rooted tree whose root has at least two children. Its order is $`a_i=u_i+|C_i|`$. Discard all labels. The input to reconstruction is just the ordinary chromatic symmetric function of this unmarked tree.

**Theorem.** Write $`a_1\le\cdots\le a_r=b`$, $`L=\max_i(|C_i|-1)`$, $`m=rL`$, and $`K=\max(3,L+1,m)`$. Suppose $`a_1\ge K`$. Suppose also that the sums of orders over different subsets of arms differ in absolute value by at least $`H`$. Either of the following conditions suffices for the function to identify the tree among all finite trees.

1. The orders satisfy $`b\lt S=a_1+a_2`$ and $`b+m\le S`$. The cap shapes are arbitrary.
2. Among the caps, the number of rooted leaves determines the rooted isomorphism type. The largest leaf count is strictly less than the sum of the two smallest leaf counts, counted with multiplicity. There is no upper bound on the arm orders.

The reduced core may have any topology, with any number of hubs. The tree, positions of its arms, and lengths of all internal paths are recovered together. In particular, the branching pattern of the core is unrestricted even when every arm has the same arbitrary cap. The theorem gives a partial result for Stanley’s question. [Stanley’s original paper](https://doi.org/10.1006/aima.1995.1020) · [Independent review and prior work](ARBITRARY-CORE-REVIEW.md) · [Reproducible split check](verify_core_splits.py)

## Recognizing the ends on a competing tree

Use the ordinary spanning-forest polynomial $`U_T`$ obtained from Stanley’s power-sum expansion. Root provisionally at a centroid. At each scale $`B=L+1,K`$, on the target there are exactly $`r`$ descendant subtrees of order $`B`$, and exactly $`rB`$ vertices whose descendant subtree has order at most $`B`$. Each exterior arm contains a single pendant order-$`B`$ block. Cutting any core edge leaves at least two whole exterior arms on either side, since each side contains a terminal hub. The large sides of exterior cuts contain the other arms. In particular $`2K\lt n=H+\sum_i a_i`$, and the two-part coefficients through order $`K`$ recover these centroid counts on any competitor.

The disjoint blocks at each of the two scales exhaust all its small fringes and contain all leaves. A large block contains at least one smaller block, since one of its descendant leaves must lie in a smaller block and the blocks are nested or disjoint. Thus each contains exactly one. The portion between their roots is a unary path. The forest truncation through weight $`K`$ identifies the normalized cap factors, including the unit multiplicity, exactly as in the [terminal-block argument](TWO-HUB-SUBDIVISIONS.md). That argument only uses the observed blocks. It recovers the entire rooted cap multiset.

Contract the order-$`K`$ blocks to leaves. There are no other leaves since all original leaves were covered, and an outside vertex preserves its degree. The ambient degree sequence, after subtracting the known block vertices with their ambient degrees, recovers the multiset of hub degrees. In particular there are at least two hubs. Suppress vertices of degree two. Every competitor therefore has a reduced tree with these $`r`$ pendant labels still unassigned; every internal vertex has degree at least three. Terminal hubs have at least two exterior arms. This establishes the common setting for recovering the ends without knowing the reduced tree.

## Determining the decorated arm orders

Under condition 1, count cuts with small side $`i`$, for $`i\ge K`$ below the midpoint. Let $`c_i`$ be the coefficient of $`x_i x_{n-i}`$ and $`v_i`$ the number of arms of order $`i`$. Each core-edge side has at least $`S+1`$ vertices. An exterior edge has an outward side of order at most $`b`$, and $`n-1-b>S`$ because there are at least four arms and at least two core vertices. For $`K\le i\lt S`$ the one-step differences consequently satisfy

```math
c_i-c_{i+1}=v_i.
```

Indeed the outward sizes at least $`K`$ in an arm of order $`a`$ run once from $`K`$ through $`a`$, and $`n\ge 2S+2`$. The formula holds through the second-smallest arm on every recognized skeleton, whether or not it satisfies condition 1. Scanning the differences therefore determines $`a_1,a_2`$ and hence $`S`$. Continuing up to $`S-1`$ exhausts all $`r`$ arms on the target. Every competitor has those same orders.

Any forest with a component of size at least $`n-S`$ retains all core edges, because cutting any of them leaves both sides larger than $`S`$. Its unique large component contains the core: an off-core component has order at most $`b\lt n-S`$. Erasing the large component gives through weight $`S`$ the product of the rooted factors of all attached arms. The [logarithmic derivative calculation](TWO-HUB-SUBDIVISIONS.md) identifies all factors by arm order when each $`a_i+m\le S`$: differentiating at the largest remaining order separates its group, and reduction modulo each known irreducible cap factor determines the multiplicities. Thus every order is matched to its rooted cap.

Under condition 2, use instead the known connected-subset polynomial $`C_T(x,y)`$, recording the number of included vertices and the boundary size. Write $`\ell_i`$ for the number of rooted leaves in cap $`i`$, $`e=\sum_i\ell_i`$, and $`s`$ for the sum of the two smallest such counts. A connected subset meeting all hubs must contain the entire core. With $`Y=y/(1-x)`$, $`F_C=y+x\prod F_{\rm child}`$ and $`Z_C=F_C-Y`$, its contribution, summed over exterior choices, is

```math
x^N\prod_i (Z_{C_i}+Yx^{-u_i}),\qquad
N=n-\sum_i |C_i|.
```

If a connected subset meets some but not all hubs, its intersection with the core is connected. Each omitted component containing a hub is attached to the represented core by exactly one boundary edge. It contains a terminal hub: follow the branching tree away from that edge. The omitted components lose at least $`s`$ exterior leaves each. There are no omitted components without a hub because all leaves of the core are hubs. An arm at a represented hub contributes at most its rooted leaf count in boundary edges. With $`k\ge1`$ omitted components the boundary degree is therefore at most $`e-ks+k\le e-s+1`$. A subset avoiding all hubs is in an exterior arm or in the interior of one core path. Its boundary is at most $`\max(1+\max_i\ell_i,2)\le e-s+1`$, since $`r\ge4`$.

The [high boundary coefficient argument](TWO-HUB-FREE-LENGTHS.md) now applies with this value of $`s`$, independently of the core. At degree $`e`$ the product for unit caps determines the multiset of their lengths through the factors $`1-x^{u_i+1}`$. For a nonunit class of leaf count $`\ell\lt s`$, subtract the contribution with only previously determined nonunit classes allowed to omit their $`Z`$ factors and retain the full unit factors. In degree $`e-\ell+1`$ the remainder is a known nonzero rational factor times $`\sum_{i:C_i=C}x^{-u_i}`$. Each other unprocessed nonunit omission drops below this degree. Repeating recovers every decorated arm. This proof applies unchanged to competitors because their cap multisets and terminal-hub inequality are already established. [Connected-subset invariant, Theorem 4.2](https://arxiv.org/html/2308.03980v3)

## Recovering the entire core from labeled splits

At this point $`H=n-\sum_i a_i`$ is observable. The separated subset sums make all orders distinct, giving intrinsic names to the arms. Form the oriented cut-size histogram by entering both component orders for every single-edge cut, twice at a balanced size. For every known arm, subtract the contributions from its attachment and all its internal edges. For each of these the outward subtree and the order of its complement are known irrespective of which hub supports the arm. Exactly the oriented core-edge sides remain.

For any remaining side, let $`I`$ be the set of its exterior-arm labels and $`k`$ its number of core vertices. Its observed order is

```math
\sum_{i\in I}a_i+k,\qquad 1\le k\le H-1.
```

The possible intervals for different subsets are disjoint. The order therefore recovers the actual label subset. The two orientations give complementary sides of the same split. Fix one arm label, and keep only subsets omitting it, to count each original core edge once. Successive edges on the same path between hubs induce the same split, so its multiplicity equals the path length. Distinct edges of the reduced tree induce distinct splits: the path between two such edges meets an additional incident direction at a hub, containing a labeled leaf that distinguishes the splits.

For explicit reconstruction, adjoin the singleton leaves to the splits oriented away from the fixed leaf and also include the set of all other leaves. These are the descendant sets of the tree rooted at the neighbor of the fixed leaf. They are nested or disjoint. Attach each proper cluster to its smallest strict containing cluster and attach the fixed leaf at the root. Internal vertices have at least two children there, so none is lost in the hierarchy. Restore the path length at each internal cluster and replace the labeled pendant edges by their recovered rooted arms. This reconstructs a unique unmarked tree. [Classical splits-equivalence theorem](https://academic.oup.com/book/53370/chapter-abstract/422055169)

## Density for independently chosen exterior lengths

Fix the complete core, including its internal lengths, and arbitrary rooted caps. Choose the $`r`$ exterior orders independently and uniformly from the integers in $`[t,(2-\varepsilon)t]`$ for any fixed $`0\lt\varepsilon\lt1`$. The proportion of choices identified among all trees tends to one as $`t`$ grows. Indeed $`b+m\le S`$ and $`b\lt S`$ eventually. For any two distinct subsets, fix one coordinate in their symmetric difference and condition on all other orders. At most $`2H-1`$ choices of that coordinate make their sums differ by less than $`H`$. A union bound over the fixed finite number of subset pairs gives an exceptional proportion $`O(1/t)`$.

For caps satisfying condition 2, choose each order from all feasible integers between $`|C_i|`$ and $`t`$. The same conclusion holds. Sampling instead from all integers in $`[1,t]`$ counts infeasible orders among the exceptions. The probability any order is below $`K`$ is $`O(1/t)`$, and the same interval count handles subset-sum collisions. These probability statements concern subdivisions of each fixed decorated core.
