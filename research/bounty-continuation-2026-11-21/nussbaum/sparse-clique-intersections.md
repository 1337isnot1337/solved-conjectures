# Sparse intersections between clique rows

**Theorem.** Suppose an antichain of distinct Boolean cube faces is partitioned into rows of size $`b\ge2`$, each with a common Boolean point. Between any two rows assume the faces have no intersection edges, or their bipartite intersection graph contains a perfect matching and has maximum degree at most $`s`$. Choose positive integers $`t<r`$ and $`w\ge2r`$. If
```math
 b\le\binom{2r}{r},\qquad
 b\le\binom{w}{t+1},\qquad
 \sum_{j=0}^{t}\binom{w}{j}\ge\binom{w}{r},\qquad
 s\binom{2t}{t}\lt b, \tag{1}
```
the Boolean union of the faces has at least one vertex per face in cardinality. The [perfect-matching theorem](matched-cliques.md) handles $`s=1`$ at every size. The new criterion allows $`s`$ to grow without bound.

## Distance between two row anchors

Choose a Boolean anchor in each row. For a pair joined by a perfect matching, choose a point in each matched intersection. Restrict these $`b`$ points to the $`D`$ positions on which the anchors differ, orienting the first anchor as zero and the second as one. Write $`v_j`$ for the restricted words, indexed by matching pairs. Repeated words keep distinct labels.

If $`v_j\le v_l`$ coordinatewise, the second-row face of pair $`j`$ must meet the first-row face of pair $`l`$. Otherwise those faces fix opposite bits somewhere. Outside the $`D`$ positions both permit the same row bit. Inside, disjointness would require a one in $`v_j`$ and zero in $`v_l`$ at the same position. Thus among the labels whose words fall on any one maximal chain of the Boolean $`D`$-cube, one with a smallest word has its second-row face adjacent to the first-row face of every such label. There are at most $`s`$ of them, including any repeated words.

On a uniformly random maximal chain a word of weight $`k`$ appears with probability $`1/\binom{D}{k}`$. Taking expectations gives $`b\le s\binom{D}{\lfloor D/2\rfloor}`$. The last inequality of (1) forces $`D>2t`$. Hence the radius-$`t`$ portions of the actual row unions are disjoint between rows. This also holds for pairs with empty intersection graph, independently of their anchor distance.

## A larger truncated-downclosure bound

We prove that every antichain $`\mathcal A`$ of size $`b`$ has at least $`b`$ subsets in its downclosure of size at most $`t`$, assuming the first three inequalities of (1). The ground-set size is arbitrary. We use the [Lovász form of Kruskal–Katona](https://people.maths.ox.ac.uk/keevash/papers/kk-journal.pdf). For $`m=\binom{x}{k}`$ sets of size $`k`$ with $`x\ge k`$, their shadow on level $`j<k`$ has at least $`\binom{x}{j}`$ members. In particular if $`m\le\binom{w}{k}`$, the ratio of shadow size to $`m`$ is at least $`\binom{w}{j}/\binom{w}{k}`$, since $`\binom{x}{j}/\binom{x}{k}`$ decreases in $`x`$.

Successively replace the current highest level of size $`k>r`$ by the same number of its immediate shadow sets. This is possible since its cardinality is at most $`\binom{2r}{r}\le\binom{2k-1}{k}`$, and the immediate shadow ratio at $`2k-1`$ equals one. A shadow replacement preserves incomparability: any retained lower member contained in a new set would have been contained in the old parent. A retained set containing the new set would have to equal it, since the replaced level was highest. This equality is already ruled out. Replacements only shrink the downclosure. After this step let $`H`$ count the members of sizes above $`t`$ and let $`b-H`$ count the retained smaller members.

For $`r\ge k>t+1`$, a highest level of cardinality $`m`$ satisfies $`m\le b\le\binom{w}{t+1}\le\binom{w}{k}`$. Replace it by the smaller of $`m`$ and the number of available immediate shadow sets, choosing that many distinct sets. Because $`w\ge2r`$, the retained number is at least $`m\binom{w}{k-1}/\binom{w}{k}`$. The number of members never increases, and their weighted sum over levels above $`t`$, assigning weight $`1/\binom{w}{k}`$ at level $`k`$, never decreases. If $`m'`$ members end up on level $`t+1`$, this proves
```math
 \frac{m'}{\binom{w}{t+1}}\ge \frac{H}{\binom{w}{r}} .
```
For $`m'>0`$, their shadows through level $`t`$ together contain at least $`m'\sum_{j=0}^t\binom{w}{j}/\binom{w}{t+1}\ge H`$ sets. None is a retained small member, by incomparability. The $`b-H`$ small members bring the count to $`b`$. If $`H=0`$ the same conclusion is immediate. This proves the bound. The argument refines the [earlier single-radius lemma](local-grid-and-one-star-orbit.md) by keeping track of the losses during several levels of lowering.

Apply this bound to the free-coordinate masks in each row. They form an antichain, and all their submasks give vertices by flipping those coordinates from the row anchor. Each row contributes at least $`b`$ points out to radius $`t`$. The preceding distance argument makes these contributions disjoint. This proves the theorem.

## A growing overlap allowance

Take $`r`$ least with $`b\le\binom{2r}{r}`$, let $`d=\lfloor\sqrt r/6\rfloor`$, $`t=r-d`$ and $`w=2r+2`$. For $`d\ge1`$, the first three inequalities of (1) hold. For $`0\le h\le3d`$ the ratio $`\binom{w}{r-h}/\binom{w}{r}`$ is
```math
 \prod_{i=0}^{h-1}\left(1-\frac{2i+3}{r+3+i}\right)
 \ \ge\ 1-\frac{h^2+2h}{r}\ \ge\ \frac12 .
```
The factors are nonnegative, and $`r\ge36d^2`$ gives the last inequality. Also $`\binom{2r+2}{r}\ge2\binom{2r}{r}`$. Applying the ratio first at $`t+1`$ proves the second inequality of (1). The $`2d`$ levels ending at $`t`$ each contribute at least half of $`\binom{w}{r}`$, proving the third.

By minimality $`b>\binom{2r-2}{r-1}`$. Consecutive central coefficients have ratio $`4-2/i\ge3`$ from level parameter $`i-1`$ to $`i`$ for $`i\ge2`$. Therefore every integer
```math
 s\le 3^{d-1}
```
satisfies the fourth inequality. This bound tends to infinity as $`b`$ increases. Exact (1) can give much smaller witnesses, for example $`b=20`$, $`s=3`$, $`r=3`$, $`t=2`$, $`w=6`$.

## Cyclic period consequence

Let $`C`$ be a maximal clique of the compatibility graph of a ternary formula orbit. Let $`H`$ be its cyclic setwise stabilizer and suppose its intersection with every other maximal clique has size at most $`s<|H|`$. Its distinct translates are disjoint since their intersections consist of whole $`H`$-cosets. They partition the orbit, and orbit-stabilizer makes each a single coset of size $`b=|H|`$. For a face outside one such row its neighbors in the row, together with that face, form a clique. If nonempty, they extend to a maximal clique distinct from the row, so the outside face has at most $`s`$ neighbors there. An edge between two rows has $`b`$ translates by $`H`$ giving a perfect matching. Thus (1), or the uniform growing allowance above, ensures that the period is at most the number of Boolean vertices in the face union.

There is no bound here on the overlaps of an arbitrary orbit. The [sponsor's 100-dollar target](https://sites.math.rutgers.edu/~zeilberg/math640_10.html) remains unresolved.

The [integer checker](check_sparse_cliques.py) constructs two 20-face rows at the minimum permitted distance five, with up to three neighbors per face. Their disjoint radius-two parts have 31 and 33 vertices. It also enumerates the truncated shadow of a mixed antichain on fourteen bits and checks both endpoints of the growing-overlap formula for every rank parameter from 36 to 500.
