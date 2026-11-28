# Dense additive templates for the Erdős cut

**Theorem.** Let S be a sum-free set in a finite elementary abelian two-group, of density strictly greater than 17/64. Every graph mapping homomorphically to Cay(G,S) satisfies the sharp weighted bipartization bound of [Erdős Problem 23](https://www.erdosproblems.com/23), with arbitrary product vertex weights. More precisely it has a distribution of cuts that misses any edge with probability at most 1/4. The input may have arbitrary order and need not itself be Cayley or vertex-transitive.

Also, the sharp bound holds for every triangle-free Cayley graph on an elementary abelian five-group with equal vertex weights. With arbitrary product weights and arbitrary homomorphic preimages, it holds whenever the template's inverse-closed generator set has density greater than 6/25.

This complements the [flat eigenvector argument](FLAT-SPECTRAL-CUTS.md), whose treatment of binary Cayley graphs covers all generator densities but requires nearly uniform fiber masses. Neither argument gives the full conjecture.

## Binary quotient reduction

The [Davydov–Tombak theorem](https://www.mathnet.ru/eng/ppi669), in the reformulation in [Lev, Theorem 1′](https://arxiv.org/pdf/2301.06750), implies that a sum-free subset of a binary group of density greater than 1/4 is either contained in a nonzero coset of a proper subgroup, or is contained in the preimage of a sum-free subset S' of a quotient of rank k>=4 with |S'|=2^(k-2)+1. In the first case the Cayley graph is bipartite: extend the subgroup to a hyperplane that does not contain the coset. The theorem is stated for ambient rank at least four; in smaller ranks the first case holds since a basis of S can be assigned the value one and any remaining generator represented by an even number of basis elements would make a sum-free violation (it would need zero or two basis elements).

In the quotient case the density bound 1/4+2^(-k) is at most 17/64 for k>=6, so k is four or five. The quotient map takes edges to edges, and a cut distribution on the quotient therefore pulls back to the whole template.

We record a simple way to find a useful hyperplane in either quotient. If f is the indicator of S' of density alpha, its real, normalized Fourier coefficients satisfy sum(hat f)^3=0 by sum-freeness and sum(hat f)^2=alpha. If m is the smallest nontrivial coefficient, then

    -alpha³ = sum_(chi nontrivial) hat f(chi)³
            >= m (alpha-alpha²).

So the number of generators in the kernel of a minimizing character is at most |S'|(1-2alpha)/(2(1-alpha)). This is 15/11 for k=4 and 63/23 for k=5, hence at most one or two respectively, by integrality. The characters are given by linear forms on the quotient; a character cut misses precisely those generators on which the character is +1.

## Construct an edgewise cut law without enumerating caps

Let H be the kernel just obtained, B=S' intersect H, and C=S' outside H. If B is empty we are done.

If B={b}, the off-hyperplane coset consists of disjoint pairs differing by b, and C uses at most one point per pair by sum-freeness. There are four pairs in rank four, or eight in rank five; since |S'| is five or nine, C selects exactly one representative per pair. Fix a linear character taking the value -1 on b. On each of the pairs identify its value at the selected representative as a sign to be corrected. Multiplying this character by characters trivial on b induces all affine signs on the quotient of the off-hyperplane coset by <b>. In other words, one has all the binary characters of H/<b> and may reverse the sign on the off-hyperplane coset, without changing the prescribed sign on b.

For any probability weights on the four or eight selected representatives, Parseval on that quotient gives an affine sign whose agreement with the required corrections has weighted correlation at least the square root of the sum of the squared weights, at least 1/sqrt(8). This means for every weighting of C there is a character cutting b and missing at most (1-1/sqrt(8))/2 of C in that weighting. Finite minimax yields a distribution over those characters missing **each** generator of C with at most this probability. Mix this law with the original H-kernel cut, using that original cut with probability 1/4. It misses b with probability 1/4, while each element of C is missed with probability at most (3/4)(1-1/sqrt(8))/2 < 1/4.

If B has two elements b_1,b_2, we are in rank five. Both are nonzero and distinct, and K=<b_1,b_2> has order four. Each of the four K-cosets outside H supports a square using steps b_1,b_2. Thus C meets a coset in at most two vertices, and a double pair must be opposite in the square. The seven elements of C occupy all four cosets (three double, one single). Fix a character taking -1 on b_1,b_2. Its value is constant on each chosen pair because it takes +1 on b_1+b_2. As before ratios with other characters satisfying these prescribed values induce all affine sign patterns on H/K. On these four quotient points the affine signs are precisely the eight patterns with even sign parity. If the necessary correction pattern is even, match it everywhere. If odd, choose one of the four cosets uniformly as the unique mismatch. Each generator of C is then missed with probability 1/4 and both generators of B are always cut. This proves the asserted edgewise law without a finite catalogue of Cayley graphs.

For any product-weighted triangle-free preimage of total mass one, the law gives beta<=e/4 in unordered edge units. At e<=4/25 this is at most 1/25, and for larger e the [Balogh–Clemen–Lidický dense tail](https://arxiv.org/html/2103.14179) gives the same bound via rational blow-ups. In the middle band the argument tolerates deleting at most 1/20000 of arbitrary invalid edge mass to obtain a homomorphism, since restoring that mass R gives beta<=e/4+3R/4<=1/25.

## Elementary abelian five-groups

An inverse-closed connection set S of a triangle-free Cayley graph is sum-free. If its group density exceeds 6/25, [the large sum-free-set structure theorem, Theorem 1.4](https://arxiv.org/html/2303.00828), puts it in two opposite nonzero cosets of a hyperplane. Projection to the order-five quotient is a homomorphism to a pentagon. Pull back a cut of that pentagon with the aggregated fiber weights. The product of its five possible missed cyclic edge weights is the square of the product of its five vertex masses; by AM–GM the minimum missed edge is at most N²/25. This works unchanged for arbitrary edge-deleted preimages.

For the uniform template at |S|/|G|<=6/25, the ordered edge density is at most .24, inside the established [Balogh–Clemen–Lidický sparse tail](https://arxiv.org/html/2103.14179), so the unweighted theorem covers all densities. This last step does not transfer to arbitrary weights on a low-density template.
