# Detecting a four-arm spider from ordinary vertex distances

For four independently chosen positive integer arm lengths in the interval from 1 to $`t`$, the ordinary histogram of all unordered vertex-pair distances identifies the subdivided four-arm star among **all** trees with probability $`1-O(1/t)`$. The observer needs neither its degree sequence nor the assurance that the input was a spider. The proof below includes a finite linear-algebra calculation. This research test concerns reconstructing a tree from its ordinary distance histogram. Existing CSF results already distinguish every spider. The full histogram-only statement for arbitrary reduced trees and Stanley's full CSF conjecture both remain open in this campaign. [Decision criterion for every fixed topology](PATH-HISTOGRAM-DECISION.md) · [Earlier certificate and definitions](PATH-DISTANCE-CERTIFICATE.md) · [Primary sources and review](PATH-DISTANCE-REVIEW.md) · [Stanley's issue](https://github.com/1337isnot1337/solved-conjectures/issues/315)

## All possible competitors

Write $`p_j`$ for the histogram, $`n=p_1+1`$ for the order and $`w_v=\deg(v)-2`$. Gutman's endpoint identity gives

```math
B_j=p_{j+2}-2p_{j+1}+p_j
   =\sum_{\{u,v\}:d(u,v)=j}w_u w_v,\qquad j\ge1.
```

Suppress vertices of degree two and retain positive integer edge lengths. The relevant path forms are sums of lengths along vertex-to-vertex paths of the reduced tree. The invariant $`M=2p_2-2n+6`$ equals the sum of squares of the vertex defects. The number of leaves is two plus the sum of the positive defects, hence

```math
M-2=\sum_{v:w_v>0}w_v(w_v+1).
```

A four-arm spider has $`M=8`$. The only positive-defect lists for a competitor are a single 2, or three 1s. The former gives another four-arm spider. The latter gives three trivalent hubs joined in a path, with two external leaves at each end and one at the middle. It has seven reduced edges and 28 unordered pairs of reduced vertices.

Put $`a=(a_1,a_2,a_3,a_4)`$. Off finitely many proper hyperplanes, the four individual lengths and six pairwise sums are ten distinct numbers. Then the four negative coefficients of the signed histogram are each $`-2`$ at the individual lengths, and its six positive coefficients are each 1 at the sums. A four-arm star competitor has only ten endpoint pairs, so reproducing ten distinct nonzero coefficients forces all of its own distances to be distinct. The four negative positions give its entire arm multiset.

## Testing the trivalent competitor

For this fixed trivalent topology, write $`x`$ for the vector of seven positive edge lengths. Each of its 28 paths has a distinct incidence vector $`P`$ with entries 0 or 1 and length $`P\cdot x`$. The *collision space* $`E(x)`$ is the rational span of the differences $`P-Q`$ for which the lengths agree. There is a bijection between classes of paths of equal actual length and classes of their incidence vectors modulo $`E(x)`$. Indeed membership of the difference implies equality since $`x`$ annihilates the whole space. Sum the endpoint products in each class, including classes in which the positive and negative weights cancel.

The [exhaustive checker](verify_four_arm_flats.cpp) considers every collision space of rank at most three. Any difference of comparable distinct vectors has one strict sign and cannot annihilate a positive vector. The remaining differences give 207 distinct lines. Starting with the zero space, the calculation extends every space by each of those lines and keeps every distinct row space once. Thus every space spanned by actual collisions is visited at its rank, even if there are many choices of basis. Some extra spaces need not be realizable by positive lengths. The sole additional rejection condition before the coefficient test is that a nonempty path vanishes identically, which is impossible for positive lengths.

| Rank | Row spaces | Spaces with four coefficients $`-2`$ and six coefficients $`1`$ and no other nonzero coefficient |
| --- | ---: | ---: |
| 0 | 1 | 0 |
| 1 | 207 | 0 |
| 2 | 17,336 | 0 |
| 3 | 705,602 | 0 |

Gaussian elimination is performed modulo 101. For up to three rows of original path differences, membership of an additional difference or path vector, and independence when extending the space, use minors of size at most four. All entries in the original matrices are 0 or $`\pm1`$. By Hadamard's inequality the absolute value of every such determinant of size $`s`$ is bounded by $`s^{s/2}\le16`$. Reduction modulo 101 therefore preserves exactly which minors vanish. In particular distinct enumerated rational spaces cannot merge modulo 101, since a generating row in one space and outside the other would retain its nonmembership. Canonical reduced row echelon form supplies the finite key. These observations justify the result over the rationals, including the zero-path test. Only the coefficient pattern is used in this calculation.

It follows that every match to a generic ten-position spider has collision rank at least four. For each choice of four linearly independent actual equalities, the seven competitor parameters lie in their common rational nullspace, of dimension at most three. For each of the four negative positions choose one representative competitor path, in the order of the four target arm labels. In that fixed choice the target coordinate vector $`a`$ is the image of $`x`$ under the linear map with those four incidence rows. Its image on the nullspace has dimension at most three, whether or not that map is injective on competitor parameters. The matching retains **all four ordered target coordinates**; there is no further projection that could lose a target parameter. There are finitely many row choices and matches. Their images are contained in finitely many proper rational hyperplanes in the four target coordinates. A proper hyperplane meets the integer box in at most $`t^3`$ points by solving for one coordinate with nonzero coefficient. Adding the initial hyperplanes for coincident spider distances proves the claim.

## A positive expansion for other topologies

A structural identity gives another way of approaching the cancellations. For a reduced tree with edge lengths $`l_e`$ put $`z_e=\exp(s l_e)-1`$. Then

```math
\sum_{u\lt v} w_u w_v\bigl(\exp(s d(u,v))-1\bigr)
   =\sum_{\substack{\varnothing\ne F\subseteq E\\F\text{ lies on a simple path}}}
      \prod_{e\in F}z_e.
```

Indeed, expand the exponential for a vertex pair as the product of $`1+z_e`$ along its path. For a nonempty collinear set of edges, every path containing them runs between the two exterior components beyond the first and last edges. For a singleton these are the two sides of that edge. The sum of the defects over either exterior component is $`-1`$, since it has precisely one edge to its complement. So the coefficient is $`(-1)^2=1`$. No path contains a noncollinear set. In particular the difference between $`\exp(s\sum_e l_e)-1`$ and the displayed expression has cubic coefficient equal to the sum of products over noncollinear triples of edges. It is the first Taylor coefficient that can distinguish branching arrangements at fixed total length. The identity is not a proof of reconstruction in higher valence.

## Why rank three also arises for larger trees

Suppose the reduced target has $`k`$ vertices, one hub of degree four, and all other hubs trivalent. With all reduced pair distances distinct, its support has $`\binom{k}{2}`$ elements and $`M=k+3`$. In any competitor with $`k'`$ reduced vertices, the support forces $`k'\ge k`$. The deficit $`M-k'`$ is the sum of $`w_v^2-1`$ over the hubs; each summand is zero or at least three. If $`k'=k`$, the competitor must have one weight-two hub and all others trivalent. The earlier degree-and-path theorem then applies whenever the target passes its generic certificate. If $`k'>k`$, necessarily $`k'=k+3`$ and the competitor is entirely trivalent. Its $`k+2`$ edge parameters must produce the target's $`k-1`$ independent edge coordinates. The matched-path projection argument therefore reduces every potentially full-dimensional ambiguity to a collision space of rank at most three, regardless of $`k`$.

There is a further arithmetic constraint. The generic target has exactly $`k-1`$ absolute coefficients of size two, from pairs with the unique four-valent hub, and all other absolute coefficients are one. The trivalent competitor has only unit pair contributions. Across its equal-distance classes the number of opposite-sign pairs that must be cancelled is
```math
\frac12\left[\binom{k+3}{2}-\binom{k}{2}-(k-1)\right]=k+2.
```
This constraint counts the minimum of the two sign counts in each actual class, including classes with zero net coefficient. It does not require the chosen cancelling pairs to be unique.

If a family of positive competitor metrics approaches a boundary where some of its edges shrink to zero while all target edges stay positive, its sufficiently short distances occur only inside the components of collapsing edges. For those distances the aggregate signed distribution over these components must vanish exactly, since all target distances are bounded away from zero. A single collapsing edge cannot meet this condition. Two equally short disjoint edges, one joining trivalent hubs and one pendant at a trivalent hub, can already cancel each other at that short distance. Recognition of every one-four-valent core would require controlling the remaining paths as well. The census above treats only the four-arm spider.

## Reproduction and scope

From this directory a C++17 compiler suffices.

```sh
c++ -std=c++17 -O2 -Wall -Wextra -Werror verify_four_arm_flats.cpp -o /tmp/verify_four_arm_flats
/tmp/verify_four_arm_flats
```

The generic four-arm calculation is a test of an approach to the general histogram-only question, not a new catalogue entry. For the stronger CSF input, Martin, Morin and Wagner already identify all spiders. For weighted path lengths, Bartha, Burcsi and Lipták reconstruct weights when a star topology is given. Neither result rules out an unpromised trivalent competitor from the subdivided tree's ordinary histogram. A bounded source search for four-arm spiders, starlike trees, path and distance distributions, and the Hosoya/Wiener polynomial found formulas for known topologies and examples of homometric trees, but no result establishing or refuting this precise generic assertion. The calculation belongs to the WadeDavis research session. It has no separate independent review or Lean verification. [Martin, Morin and Wagner, Corollary 5 and spider theorem](https://arxiv.org/abs/math/0609339) · [Bartha, Burcsi and Lipták, Proposition 15](https://doi.org/10.4230/LIPIcs.CPM.2016.10)
