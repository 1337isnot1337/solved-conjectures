# Erdős #931: cyclic coordinate projections with one pole

**Status:** Partial fixed-curve result, not a proof of the ordered finiteness conjecture. This handles a one-pole class complementary to the two-pole Galois projections in [Venkat, Appendix A](https://hexagonmath.org/pdf/2611.00599v1). The block-length threshold below is absolute, not a degree restriction or a finite computation.

Fix two lengths at least three and require equality of the prime supports of the products of the two positive integer blocks. Consider an irreducible plane curve defined over $`\mathbb Q`$ with a birational rational parametrization in which its two coordinates have one common pole and no other poles. If one coordinate projection is Galois over $`\mathbb C`$, and the block attached to that coordinate is sufficiently long, then there are only finitely many such pairs on the curve. This holds regardless of the order of the blocks. The degree-one case is excluded for all lengths by Venkat's polynomial-graph theorem in the ordered setting. We prove the assertion here for Galois coordinate degree at least two.

## Exact criterion

Let $`f,g\in\mathbb Q[t]`$ be the coordinate polynomials, with $`f`$ the Galois coordinate of degree $`m\ge2`$, and $`g`$ of degree $`n`$. Write $`V,H\subset\mathbb Z`$ for their marked negative-integer blocks, of lengths $`a,b\ge3`$. A rational change of parameter gives $`f(t)=A t^m+B`$, with $`A,B\in\mathbb Q,\ A\ne0`$. Put $`K=\mathbb Q(\zeta_m)`$. For any prime $`p\mid m`$, set
```math
N_p=\#\{u\in V:(u-B)/A\notin K^p\},
```
where $`K^p`$ includes zero. A necessary condition for an infinite family on this curve is $`m N_p\le n`$. Also $`n\le am/(b-1)`$. Thus $`N_p>a/(b-1)`$ already excludes the curve.

An infinite family implies that the union of the two coordinate poles and the symmetric difference of the marked inverse sets has at most two geometric points, by the reduction on the normalization and Siegel's theorem in [Venkat §3.1](https://hexagonmath.org/pdf/2611.00599v1). Here there is one pole, so at most one marked parameter is unmatched. Both marked sets are defined over $`\mathbb Q`$, so that sole possible unmatched parameter is rational. Also Riemann–Hurwitz (or counting the zeros of $`g'`$) gives $`\#g^{-1}(H)\ge (b-1)n+1`$, while $`\#f^{-1}(V)\le am`$. Thus $`(b-1)n+1\le am+1`$, proving the degree inequality.

The one rational pole may be put at infinity, so a deck transformation of $`f`$ is affine in $`t`$. The finite deck group has a common fixed point in the affine line (average one point over the group). Translate this point to zero, which identifies the group with the $`m`$-th root rotations and gives $`f(t)=At^m+B`$. The fixed point is rational: it is the unique finite zero of $`f'`$, and its coordinate is determined by the leading and next coefficient of the original rational polynomial. The rational translation preserves $`g\in\mathbb Q[t]`$.

For $`u`$ counted by $`N_p`$, put $`T=(u-B)/A`$ and choose any $`\alpha`$ with $`\alpha^m=T`$. The $`m`$ roots are nonzero and none is rational: a rational $`\alpha`$ would make $`T`$ a $`p`$-th power in $`K`$. Thus this entire $`f`$-fibre is matched. In particular $`g(\alpha)\in H\subset\mathbb Q`$. The extension $`K(\alpha)/K`$ is Galois because it contains all roots of $`t^m-T`$; via their rotations its Galois group identifies with a subgroup of the $`m`$-th roots, of size $`d\mid m`$. Then $`\alpha^d\in K`$. If $`p\nmid d`$, $`T=(\alpha^d)^{m/d}\in K^p`$, a contradiction. Hence $`p\mid d`$, and a Galois automorphism sends $`\alpha`$ to $`\xi\alpha`$ for the same prescribed primitive $`p`$-th root of unity $`\xi`$ on every such fibre (and at every root). It fixes the rational value $`g(\alpha)`$. Therefore $`g(\xi t)-g(t)`$ has at least $`mN_p`$ distinct roots. If $`mN_p>n`$, it vanishes identically. But $`f(\xi t)=f(t)`$ as well, violating $`\mathbb C(f,g)=\mathbb C(t)`$. This proves the criterion.

## Uniform application to large blocks

If $`m`$ has an odd prime divisor, choose one such $`p`$. For rational $`T`$, being a $`p`$-th power in the abelian field $`K`$ is equivalent to being one in $`\mathbb Q`$. Indeed if nonzero $`T\in\mathbb Q`$ is not a rational $`p`$-th power, there is a rational prime where its valuation is not divisible by $`p`$ (the sign is no obstruction for odd $`p`$). For any $`\alpha^p=T`$, the corresponding ramification index in $`\mathbb Q(\alpha)`$ must be divisible by $`p`$, so $`[\mathbb Q(\alpha):\mathbb Q]=p`$. Were $`\alpha`$ in $`K`$, this degree-$`p`$ field would be Galois, since $`K/\mathbb Q`$ is abelian. It would contain the quotient of two distinct roots, a primitive $`p`$-th root of unity, impossible as $`p-1\nmid p`$. This proves the equivalence.

As $`u`$ ranges over $`V`$, $`T=(u-B)/A`$ is a rational arithmetic progression of length $`a`$ with nonzero step. The indices of its nonzero rational $`p`$-th powers contain no nonconstant three-term arithmetic progression by [Darmon–Merel's resolution of Dénes's conjecture](https://www.math.mcgill.ca/darmon/pub/Articles/Research/18.Merel/paper.pdf), after clearing denominators. Zero contributes at most one exception. Consequently the total number of rational $`p`$-th powers is $`o(a)`$ by the three-term case of Szemerédi's theorem, uniformly in the progression and in $`p`$.

If $`m`$ is a power of two, take $`p=2`$. For $`T\ne0`$, a rational $`T`$ whose square root lies in $`K`$ has square class in $`\{1,-1,2,-2\}`$. For $`m=2`$ or 4 this follows directly. For $`m=2^r,\ r\ge3`$, the cyclotomic Galois group is $`C_2\times C_{2^{r-2}}`$, with exactly three index-two subgroups. Their quadratic fields are distinct and displayed by $`i`$, $`\sqrt2=\zeta_8+\zeta_8^{-1}`$, and $`i\sqrt2`$, so there are no other quadratic square classes. For any of the four classes, a nonconstant four-term arithmetic progression of indices would give four distinct rational squares in arithmetic progression after division by its fixed class representative. This is impossible by Fermat's four-squares theorem (also invoked in Venkat §5.3). The four-term case of [Szemerédi's theorem](https://www.impan.pl/en/publishing-house/journals-and-series/acta-arithmetica/all/en/publishing-house/journals-and-series/acta-arithmetica/all/27/0/100627/on-sets-of-integers-containing-k-elements-in-arithmetic-progression) gives $`o(a)`$ indices in each class, uniformly in the progression. Again add at most one zero.

Thus in either case $`N_p=a-o(a)>a/2`$ once $`a`$ is large enough, with a threshold independent of $`m,p,b,A,B`$. Since $`b\ge3`$, the criterion excludes the curve. No conclusion is obtained here for a nongalois projection or for every small block length. The order condition in #931 is not used in this geometry; the historical Pell counterexamples with shorter earlier block have two poles and do not contradict the result.

## Weighted factorization criterion for either pole pattern

The following generalizes the irreducible-fibre criterion beyond cyclic covers and beyond one pole. Let $`f,g\in\mathbb Q(t)`$ give a birational parametrization $`\mathbb Q(f,g)=\mathbb Q(t)`$, and suppose their poles coincide and the local pole order of $`g`$ is $`n/m`$ times that of $`f`$ at every common pole, where $`m=\deg f\ge2`$ and $`n=\deg g`$. Infinite ordinary integer pairs force exactly this condition on the normalization: there is one rational pole, or two real quadratic-conjugate poles with equal orders within each coordinate ([Venkat §§3, 5](https://hexagonmath.org/pdf/2611.00599v1)). They also force at most one unmatched mark (and then only in the one-pole case).

Choose a rational parameter in which $`t=\infty`$ is not in any marked fibre. For $`u\in V`$, write the numerator of $`f(t)-u`$ as a constant times a product of distinct rational irreducibles $`q`$, with degrees $`d_q`$ and multiplicities $`e_q`$. Then
```math
\sum_{u\in V}\ \sum_{q\mid \mathop{\mathrm{num}}(f-u)}d_q(e_q d_q-1)
\le (m-1)n. \tag{*}
```
The inner sum is over distinct irreducible factors, including the linear ones.

To prove this, let $`g_1(z),\ldots,g_m(z)`$ be the values of $`g`$ on the branches of $`f=z`$, and write
```math
\Delta(z)=\prod_{i\lt j}(g_i(z)-g_j(z))^2 .
```
This is rational in $`z`$ by symmetry and has no finite poles because $`g`$ is finite on each finite fibre of $`f`$. It is nonzero because $`g`$ is primitive over $`\mathbb Q(f)`$, so its generic values on the $`m`$ branches are distinct. Its degree is at most $`(m-1)n`$: near infinity, each $`g_i(z)=O(|z|^{n/m})`$ by the pole-order condition, and there are $`\binom m2`$ squared factors.

At level $`u`$, all $`d_q`$ distinct roots belonging to $`q`$ have the same value under $`g`$. For $`d_q>1`$ this is because the roots are Galois-conjugate and wholly matched, so all their $`g`$-values are rational; the sole possible unmatched parameter is rational and cannot be such a root. For $`d_q=1`$ the assertion is automatic. Each of the roots is a ramification point of local degree $`e_q`$ for $`f`$. The $`e_qd_q`$ local branches over them therefore have expansions with the same constant term and error $`O(|z-u|^{1/e_q})`$. The squared differences between these branches contribute to the order of $`\Delta`$ at least
```math
\frac{2}{e_q}\binom{e_qd_q}{2}=d_q(e_qd_q-1).
```
All other differences have nonnegative order. Taking all factors and levels proves (*).

In particular, if $`N_{\rm irr}`$ of the marked levels give irreducible numerators of degree $`m`$, then
```math
N_{\rm irr}\le \lfloor n/m\rfloor\le \lfloor a/(b-1)\rfloor .
```
For the second inequality, the finite ramification of $`g`$ is at most $`n-1`$ when it has one pole, and at most $`n`$ when it has two. Thus $`\#g^{-1}(H)\ge (b-1)n+1`$ in the first case and $`\ge(b-1)n`$ in the second. The two marked sets differ by at most one point in the first case and coincide in the second. Since $`\#f^{-1}(V)\le am`$, both yield the inequality.

For any fixed rational projection $`f`$, this excludes a sufficiently long marked block, with a threshold depending on $`f`$ and independent of $`g,b`$. The polynomial $`P(t)-ZQ(t)`$ for $`f=P/Q`$ is irreducible over $`\mathbb Q(Z)`$ because $`P,Q`$ are coprime and it is linear in $`Z`$. [Cohen's quantitative Hilbert irreducibility theorem](https://doi.org/10.1112/plms/s3-43.2.227) bounds reducible specializations by $`O_f(\sqrt a\log a)`$ among the $`a`$ negative-integer levels of size up to $`a+O(1)`$, apart from the at most one level where the $`t`$-degree drops. Hence $`N_{\rm irr}>a/2`$ once $`a`$ is sufficiently large. This coefficient-dependent threshold cannot exclude varying projections at fixed length and is not the uniform cyclic result.
