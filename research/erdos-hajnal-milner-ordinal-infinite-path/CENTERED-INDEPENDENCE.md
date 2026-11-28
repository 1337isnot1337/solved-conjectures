# Countably centered independence forcing

This records a weaker forcing axiom for the clean-column stage of Erdős #601. It does not eliminate nonempty kernels or settle the general ordinal question.

## A stronger chain condition

**Lemma.** If $`|V(G)|\le 2^{\aleph_0}`$ and $`G`$ admits a well-order with only finitely many earlier neighbors at each vertex, then its poset of finite independent sets, ordered by reverse inclusion, is $`\sigma`$-centered. Equivalently, there are countably many independent sets $`I_n`$ such that every finite independent set lies in some $`I_n`$.

Fix such a well-order. For each $`x:V(G)\to 2`$, greedily build $`I(x)`$ in that order: include $`v`$ if $`x(v)=1`$ and no earlier included vertex is adjacent to $`v`$. For an independent finite $`p`$, prescribe bit 1 on $`p`$ and bit 0 on the union of its vertices' earlier-neighbor sets. This is a well-defined finite prescription, and every $`x`$ matching it gives $`p\subseteq I(x)`$.

To obtain countably many assignments realizing every finite prescription, code $`V(G)`$ injectively by distinct infinite binary strings. For each $`m<\omega`$ and $`a:2^m\to 2`$, use $`x_{m,a}(v)=a(v\upharpoonright m)`$, using the assigned code for $`v`$. Any finite set of codes becomes distinct by some common level $`m`$. Thus the independent sets $`I(x_{m,a})`$ suffice. The finite subsets of each one form a centered family.

Every rayless graph meets the well-order hypothesis: use the finite bags in [BRANCHLESS-FORESTS.md](BRANCHLESS-FORESTS.md), order bags by depth and well-order within each depth, and order vertices of a bag consecutively. An earlier neighbor is either in the same finite bag or in one of the finitely many ancestor bags. Thus the usual ccc statement for finite independence forcing on a rayless graph upgrades to $`\sigma`$-centered for graphs of size at most the continuum. The greedy argument is for the original graph; independence is not restricted to antichains in the stronger forest order.

## Application to infinite-column transversals

Let a rayless graph be the union of $`\kappa<\mathfrak p`$ countable infinite independent columns. Suppose every vertex has only finitely many neighbors in each column. Then there is an independent set meeting **every** column infinitely. For each column $`B`$ and $`n<\omega`$, ask for at least $`n`$ chosen vertices in $`B`$. These requirements are dense: a finite independent set forbids only finitely many members of $`B`$. The graph's cardinality is at most the continuum and its independence poset is $`\sigma`$-centered by the lemma. Bell's theorem supplies a filter meeting the $`\max(\kappa,\aleph_0)<\mathfrak p`$ requirements. Its union is the desired independent set.

Consequently after any full-type clean-column thinning of an ordinal rayless graph with $`|\alpha|<\mathfrak p`$, this yields the desired full type without MA for arbitrary ccc forcings. Finite rather than at-most-one cross-column degree suffices for this stage. The continuum-sized star forest in [FINITE-ARBORICITY.md](FINITE-ARBORICITY.md) explains why the stronger every-column conclusion cannot be unconditional at equality throughout models with $`\mathfrak p=\mathfrak c`$.

## Scope and provenance

- Bell's characterization of $`\mathfrak p`$ is recalled in [Szepytcki–Vaughan, Almost disjoint families and property (a)](https://matwbn.icm.edu.pl/ksiazki/fm/fm158/fm15832.pdf). The explicit countable family of test assignments is the binary-product separability construction.
- The [#601 working report](https://erdosproblemaday.com/report/601), §4, records the ccc proof and dense sets for clean columns using MA; this note replaces the chain condition by a direct countable cover.
- [Garti 2023, §1](https://arxiv.org/html/2302.09492) confirms that finite independent sets are conditions in Larson's work. The lemma is applicable to any step of that kind on a rayless graph of size at most the continuum. This note does **not** assert that every other use of MA in [Larson's full proof](https://doi.org/10.1016/0168-0072(90)90015-T) can be replaced by the weaker axiom without checking those steps.
- Other distinct older results include [Larson 1986](https://doi.org/10.1112/jlms/s2-33.2.193) (no short scale) and [Larson 1987](https://doi.org/10.1090/S0002-9947-1987-0896028-6) (GCH counterexamples at higher cardinalities), as well as Jensen-diamond counterexamples below $`\omega_2`$. None is bypassed by the clean-column theorem.
