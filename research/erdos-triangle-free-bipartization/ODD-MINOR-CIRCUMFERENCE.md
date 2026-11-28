# Odd clique minors force proportionally long odd cycles

Let \(G\) have odd girth \(g\) and odd circumference \(L\), the length of its longest odd cycle. If \(G\) contains an odd \(K_r\) minor and \(r_*\) is the largest odd integer at most \(r\), then
```math
 L\ge \frac{r_*}{3}\,g.
```
The bound is exact in general: an odd-length uniform subdivision of \(K_r\) has shortest and longest odd cycles obtained by subdividing a triangle and an \(r_*\)-cycle, respectively. Such a subdivision still has the odd \(K_r\) minor, by assigning all but the final edge of each subdivided path to one endpoint's branch tree.

This supplies an integral case of [Erdős’s higher odd-girth deletion bound](https://www.erdosproblems.com/23): if every odd cycle in a finite template has the same length \(g\ge5\), then all product-weighted homomorphic preimages satisfy \(\beta\le N^2/g^2\). For \(g\in\{5,7,9,11\}\), the same holds for any template of odd girth at least \(g\) and odd circumference below \(5g/3\), allowing several odd lengths. This is not a general bounded-odd-circumference theorem for all \(g\), or a resolution of unrestricted #23.

## Average a fixed minor model at two cycle lengths

Use disjoint bipartite branch trees \(T_i\) of the odd model, with one chosen edge for each pair of branches and those edges joining equal colors in the signed model. This is the usual branch-tree definition; see [Geelen et al.](https://www.math.uwaterloo.ca/~jfgeelen/Publications/oddminor.pdf).

For distinct neighbors \(j,k\) of branch \(i\) in the model, let \(d_i(j,k)\) be the distance in \(T_i\) between its two corresponding attachments. A simple model cycle of length \(s\) lifts to a simple cycle whose length is \(s\) plus the sum of those \(s\) internal distances. Paths in distinct trees are disjoint, and an attachment pair may coincide, in which case its path has length zero. If \(s\) is odd, the lifted cycle is odd: each inter-tree edge joins equal colors and the total number of internal color flips is even.

For a uniformly chosen \(s\)-cycle in \(K_r\), branch \(i\) is included with probability \(s/r\). Conditional on its inclusion, its two adjacent branches are a uniform unordered pair from the other \(r-1\) branches by permutation symmetry. Therefore the mean lifted length divided by \(s\) is
```math
1+\frac1r\sum_{i=1}^r
   \frac1{\binom{r-1}{2}}
      \sum_{\substack{j<k\\j,k\ne i}} d_i(j,k),
```
independent of \(s\). For \(s=3\), its mean lifted length is at least \(g\); for \(s=r_*\), its mean is at most \(L\). This gives the assertion.

## Apply the fractional cover

If \(L<5g/3\), there is no odd \(K_5\) minor under the all-negative edge signature. [Guenin’s odd-circuit-cover integrality theorem](https://homepages.cwi.nl/~lex/files/guenin2.pdf) identifies the fractional and integral odd-cycle edge covers in that class. When \(L=g\), the [reciprocal-degree certificate](RECIPROCAL-ODD-COVER.md) covers every odd cycle at cost \(N^2/g^2\), for arbitrary \(g\). When \(g\in\{5,7,9,11\}\), that same certificate covers all odd lengths anyway. This proves the product-weighted template conclusions. A graph homomorphic to one of the templates can aggregate weights on its fibers and pull back a target cut; absent edges in the preimage only reduce the cost.

For other odd \(g\) and several odd lengths the reciprocal certificate was only guaranteed on the shortest cycles, so integrality alone does not give the sharp bound in that case. Also, forbidding longer **induced** odd cycles is not enough for the minor argument, because lifts of model cycles need not be chordless.

[Coordination #1097](https://github.com/1337isnot1337/solved-conjectures/issues/1097).
