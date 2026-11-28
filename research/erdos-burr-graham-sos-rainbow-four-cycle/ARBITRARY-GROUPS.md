# Arbitrary ambient groups

**Uniform multiplicative case of Erdős #810.** Fix $\epsilon,K>0$. Let $A,B$ be finite subsets of an arbitrary group, each of size at most $n$, and let $E\subseteq A\times B$ have at least $\epsilon n^2$ edges. If the number of distinct products $xy$ on these edges is at most $Kn$, then for all sufficiently large $n$ there is a four-cycle with equal opposite products. The bound on $n$ is uniform over the ambient group. No linear-size group model or commutativity is required. The result remains true if each product color is split into at most a fixed number of colors.

This extends [Solymosi’s prior finite group-table theorem, Theorem 5](https://arxiv.org/pdf/1309.0133#page=4), and the [abelian reduction](README.md). The older theorem requires density relative to the whole finite group square, which need not hold for finite label sets in a much larger or infinite ambient group. This note still requires multiplication labels and does not settle arbitrary colorings.

## Retain a dense region inside one approximate group

The regular-rectangle argument in the main note is valid without commutativity. For a three-edge walk $x,b,a,y$ with consecutive products $s_1,s_2,s_3$, one has $xy=s_1s_2^{-1}s_3$. The ordered products recover the walk once the starting vertex is known. As there are many such walks for every endpoint pair in the refined regular rectangle, this keeps $\Omega_\epsilon(n^2)$ original edges on two sets $A',B'$ of sizes $\Omega_\epsilon(n)$ with $|A'B'|=O_{\epsilon,K}(n)$.

Apply [Tao's noncommutative product-set covering theorem, Theorem 4.6](https://arxiv.org/pdf/math/0601431#page=11) in the discrete counting setting. There is an $O_{\epsilon,K}(1)$-approximate subgroup $H$ of size $O_{\epsilon,K}(n)$ such that $A'$ is covered by boundedly many left translates of $H$, and $B'$ by boundedly many right translates of $H$. Assign the vertices to one containing translate each. Some block carries $\Omega_{\epsilon,K}(n^2)$ of the original edges. Multiply each row label by the inverse of its common outer left translate, and each column label by the inverse of its common outer right translate. The new edge set $F$ lies in $H\times H$, and equal products in this block lift to equal original products. The approximate-group constant and the ratio $|H|/n$ are bounded; also $|H|=\Omega_{\epsilon,K}(n)$ by the number of retained edges.

## A commuting coordinate grid inside a bounded power

Choose $L$ using four-letter density Hales–Jewett for any fixed lower bound on $|F|/|H^5|^2$. This ratio is bounded below by a positive constant depending only on $\epsilon,K$, because a $K_0$-approximate group satisfies $|H^5|\le K_0^4|H|$.

For all sufficiently large $H$, there are commuting $g_1,\dots,g_L$ with distinct binary subproducts, all of which lie in $H^4$. Use [Breuillard–Green–Tao, Theorem 2.10](https://www.numdam.org/article/PMIHES_2012__116__115_0.pdf#page=15): $H^4$ contains a normal-form coset nilprogression $P$ of bounded rank and with size comparable to $|H|$. If the finite kernel of that nilprogression has sufficiently large order, [Pyber's abelian-subgroup theorem](https://doi.org/10.1007/978-1-4614-7258-2_25) gives an abelian subgroup of sufficiently large order inside the kernel, and a greedy construction supplies the required distinct subproducts: at each step the new translate of the set of previous products must avoid the previous products. This excludes at most the square of the size of that set many choices for the new generator. These all remain in the kernel and hence in $P$.

Otherwise the finite kernel size is bounded. The normal-form volume upper bound and bounded rank force some nilprogression coordinate length to be arbitrarily large as $|H|$ grows. Let $u$ be a lift of the corresponding generator. By local properness the powers of $u$ with nonnegative exponents up to $2^L-1$ then have distinct images in the quotient by the finite kernel; all those powers lie in $P$. Take $g_j=u^{2^{j-1}}$. Whether this case or the large-kernel case applies, every nonempty binary subproduct is nonidentity and all binary subproducts lie in $H^4$.

## Average and complete a rectangle

For a word of length $L$ with letters $`(a_i,b_i)\in\{0,1\}^2`$, let $g(a)=\prod g_i^{a_i}$ and $g(b)=\prod g_i^{b_i}$. Choose independent uniform $u_0,v_0$ from $H^5$. Map the word to
```math
\bigl(u_0g(a),\ g(b)^{-1}v_0\bigr).
```
For any fixed word and any $(x,y)\in F$, the unique basepoints giving this edge are $u_0=xg(a)^{-1}$ and $v_0=g(b)y$, both in $H^5$. Hence the expected word density of $F$ is exactly $|F|/|H^5|^2$. For some basepoints this density attains the required threshold. A combinatorial line then gives all four edges with row coordinates $x,xd$ and column coordinates $y,d^{-1}y$, where $d$ is the nonidentity product over the variable positions. The $g_i$ commute, which is what permits factoring those variable coordinates on the desired sides. The two opposite products are $xy$ and $(xd)(d^{-1}y)=xy$. Both row vertices and both column vertices are distinct, giving a genuine four-cycle.

For bounded color splits retain a single split index before the first step, thereby losing only a fixed factor in density. No restriction is asserted if the edge coloring has no multiplication-coordinate realization.


## Many popular differences in the restricted-product setting

The proof also gives at least $`\exp(c_{\epsilon,K}\sqrt{\log n})`$ different nonidentity multipliers $`d`$, each appearing in $`\Omega_{\epsilon,K}(n^2)`$ rectangles of the displayed form, for large $`n`$. This extends the *order of the lower bound* of [Solymosi’s finite-table Theorem 6](https://arxiv.org/pdf/1309.0133#page=6) to sparse finite label sets in an arbitrary ambient group; it does not give the conjectured uniform cubic count for full finite tables. For split colors the bound has the same form with the split bound among the fixed parameters.

To see this, keep the same dense block $`F`$ and the same constant dimension $`L`$ throughout. Let $`D_0`$ be any set of multipliers to avoid, including inverses if desired. We can build a commuting grid as above with all nonempty binary subproducts outside $`D_0`$, provided
```math
|D_0|\le \exp(c_{\epsilon,K}\sqrt{\log n})
```
for a sufficiently small positive $`c_{\epsilon,K}`$. In the normal-form coset nilprogression $`P`$ given by BGT, write $`J`$ for its finite kernel. If $`|J|\ge n^{1/2}`$, Pyber supplies an abelian subgroup of $`J`$ of size at least $`\exp(c'\sqrt{\log n})`$. If $`S`$ is the set of existing binary products during the greedy construction, the next translate $`gS`$ must miss $`S\cup D_0`$; this excludes at most $`|S|(|S|+|D_0|)`$ choices. Here $`|S|\le 2^L`$ is fixed.

If $`|J|< n^{1/2}`$, the normal-form volume bound and bounded rank give some coordinate length at least $`n^\alpha`$ for a positive constant $`\alpha`$ depending only on the approximate-group bound, for all sufficiently large $`n`$. Let $`u`$ be its generator. By local properness, an initial segment of $`\Omega_{\epsilon,K}(n^\alpha)`$ nonnegative powers is distinct even modulo $`J`$, and lies in $`P`$. Take $`g_j=u^{q2^{j-1}}`$ for a positive integer $`q`$, small enough that all powers through exponent $`q(2^L-1)`$ lie in this segment. A given forbidden element can exclude at most $`2^L-1`$ choices of $`q`$, since the powers in the segment are distinct. There are polynomially many available $`q`$, so one works.

For each such grid let $`p=|F|/|H^5|^2`$, which is bounded below by a positive constant. Averaging shows a fraction at least $`p/2`$ of basepoint pairs produce word density at least $`p/2`$. Choose $`L`$ at the outset for density $`p/2`$ or a fixed uniform lower bound for it. Each good pair has a combinatorial line. There are at most $`5^L`$ lines, since a position is fixed to one of four letters or is variable. Thus one fixed line works for $`\Omega_{\epsilon,K}(|H^5|^2)=\Omega_{\epsilon,K}(n^2)`$ distinct basepoint pairs. For that fixed line the map from basepoints to the first corner is injective. Its multiplier $`d`$ is outside $`D_0`$, so it is new. Iterate with all previously obtained multipliers and their inverses in $`D_0`$. Distinct multipliers up to inverse count distinct rectangles: the oriented ratio of the two row labels is $`d`$, unaffected by the earlier common left translation.

The small-palette reduction, the coset nilprogression, and the density averaging are all needed for this ambient-uniform extension. Known finite-table results cannot be applied by treating the ambient group as having order $`O(n)`$.
