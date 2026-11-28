# Exact cross-degree of complete multipartite symmetric edge Ehrhart polynomials

**Theorem.** Let $`G=K_{a_1,\ldots,a_k}`$ be a complete multipartite graph with $`k\ge2`$ nonempty parts, $`N=\sum_j a_j`$ vertices, and largest part $`M=\max_j a_j`$. The cross-degree of its symmetric edge Ehrhart polynomial, in the sense of Kölbl, is
```math
\boxed{\min\left(\left\lfloor\frac{N-1}{2}\right\rfloor,\ N-M-1\right)}. \tag{1}
```
This treats the quantitative cross-degree part of [Kölbl, Conjecture 4.8](https://arxiv.org/pdf/2404.02136#page=21), with an explicit distinction between its literal wording and its apparent intended graph. It does not settle the same conjecture's separate interlacing statement for adding singleton parts.

## 1. The one-part correction numerator

For a connected graph $`G`$, its symmetric edge Ehrhart numerator $`H_G(z)`$ is palindromic of degree $`d=\dim P_G`$, since the polytope is reflexive. This standard fact also follows from the polar description with unit-bounded edge differences: tight equalities of a polar vertex span the whole space after setting one coordinate to zero, hence contain a spanning tree and give integral coordinates. Write its gamma expansion
```math
H_G(z)=\sum_i\gamma_i z^i(1+z)^{d-2i}.
```
The gamma degree is the largest $`i`$ with $`\gamma_i\ne0`$; it is the cross-degree by [Kölbl, §4 after Proposition 4.3](https://arxiv.org/pdf/2404.02136#page=20). We use the same basis for differences of palindromic numerators of degree $`d`$. In particular the basis is triangular by vanishing order at $`z=-1`$.

Let $`H_{K_N}`$ be the full type-$`A_{N-1}`$ root numerator. For $`1\le m<N`$, let $`D_{N,m}(z)`$ be the Ehrhart numerator correction for excluding vectors whose absolute mass in one fixed $`m`$-vertex part exceeds the dilation parameter $`t`$. Its denominator is $`(1-z)^N`$, because
```math
D_{N,m}=H_{K_N}-H_{K_{m,1,\ldots,1}},
```
where the last graph has $`N-m`$ singleton parts. It is palindromic in the above basis, and $`D_{N,1}=0`$. More generally
```math
H_{K_{a_1,\ldots,a_k}}=H_{K_N}-\sum_j D_{N,a_j}. \tag{2}
```
Indeed a zero-sum integer vector belongs to the $`t`$-dilate exactly if its total positive mass is at most $`t`$ and the sum of absolute coordinates in every part is at most $`t`$: match positive and negative units in different parts by Hall's theorem. The maximum number of cross-part matches is the total positive mass $`S`$ minus $`\max(0,\max_i (s_i-S))`$, with $`s_i`$ the absolute mass in part $`i`$; unmatched units pair across a two-edge graph path in their own part. Thus the required minimum number of unit edges is exactly $`\max(S,\max_i s_i)`$. Both necessary inequalities also follow immediately from the generating edge vectors. Under the full graph restriction $`S\le t`$, two different parts cannot both be in violation because the total absolute mass is $`2S\le2t`$. This proves (2).

## 2. Exact top gamma coefficient of a one-part correction

We prove that when $`2\le m\le (N+1)/2`$, the gamma degree of $`D_{N,m}`$ is $`m-1`$, and its leading gamma coefficient is
```math
\gamma_{m-1}(D_{N,m})=
\binom{2m-2}{m-1}\binom{N-m-1}{m-2}>0. \tag{3}
```

Let $`A_j(u,v)`$ count integer vectors on $`j`$ coordinates with positive and negative masses $`u,v`$, respectively. Its bivariate generating function is
```math
\sum_{u,v\ge0}A_j(u,v)X^uY^v
=\Phi(X,Y)^j,\qquad
\Phi(X,Y)=1+\frac X{1-X}+\frac Y{1-Y}.
```
For positive $`u,v`$, $`A_m(u,v)`$ is a polynomial of total degree $`m-2`$: choose disjoint positive and negative supports of sizes $`i,j\ge1`$, then choose the respective positive compositions, giving the terms $`\binom mi\binom{m-i}{j}\binom{u-1}{i-1}\binom{v-1}{j-1}`$. The homogeneous part of degree $`m-2`$ is
```math
T_m(u,v)=\sum_{i=1}^{m-1}
 \binom mi\, \frac{u^{i-1}v^{m-i-1}}{(i-1)!(m-i-1)!}. \tag{4}
```

Set $`n=N-m`$. If the complement masses are $`p,q`$, and $`S`$ is the total positive mass, a violation of the $`m`$-part has $`S\le t`$ and $`2S-(p+q)>t`$. Set $`j=t-S\ge0`$, $`\ell=t-p-q-2j\ge1`$. Then the part masses are $`q+j+\ell,p+j+\ell`$, both positive. Conversely all $`p,q,j\ge0,\ell\ge1`$ in these formulas give precisely one possible pair of part masses at $`t=p+q+2j+\ell`$. Thus
```math
\frac{D_{N,m}(z)}{(1-z)^N}
 =\sum_{p,q\ge0}\sum_{j\ge0,\ \ell\ge1}
 A_n(p,q) A_m(q+j+\ell,p+j+\ell)\, z^{p+q+2j+\ell}. \tag{5}
```
This identity can first be taken as a formal power series at zero; all the expressions below are rational functions.

Put $`W=1+z`$ and expand the polynomial in (5) in monomials $`p^r q^s j^a\ell^b`$, whose total degree is at most $`m-2`$. The generating factor from $`p,q`$ is
```math
\left.(X\partial_X)^r(Y\partial_Y)^s\Phi(X,Y)^n\right|_{X=Y=z}.
```
At $`z=-1`$, the underived factor $`\Phi(z,z)=W/(1-z)`$ has a simple zero. Every derivative can remove at most one of the $`n`$ factors with a zero, so the displayed factor has vanishing order at least $`n-r-s`$. Here $`r+s\le m-2\le n-1`$. The $`j`$-factor $`\sum_{j\ge0}j^a z^{2j}`$ has a pole of order $`a+1`$, whereas the $`\ell`$-factor $`\sum_{\ell\ge1}\ell^b z^\ell`$ is regular at $`-1`$. It follows that $`D_{N,m}`$ vanishes at $`-1`$ to order at least
```math
n-(m-2)-1=N-2m+1=d-2(m-1).
```
This proves the gamma degree upper bound.

Only terms with $`r+s+a=m-2`$ and $`b=0`$ can contribute to the leading coefficient at this order. They come from $`T_m(q+j,p+j)`$. To compute their contribution let $`c=r+s`$, so $`a=m-2-c`$. In the $`p,q`$ factor, the lowest-order terms come from differentiating $`c`$ distinct factors, since otherwise an additional uncancelled zero remains. Both first Euler derivatives of $`\Phi`$ on the diagonal tend to $`-1/4`$ as $`z\to-1`$, hence the leading term is
```math
(n)_c (-1/4)^c (W/2)^{n-c},
```
where $`(n)_c=n(n-1)\cdots(n-c+1)`$. The $`j`$-moment's leading term is $`a!/(2W)^{a+1}`$, and the $`\ell`$-factor with $`b=0`$ tends to $`-1/2`$. Finally multiplying (5) by $`(1-z)^N`$ contributes the constant $`2^N`$. The powers of 2 cancel because $`c+a=m-2`$, leaving $`(-1)^{c+1}(n)_c a!`$ times the monomial coefficient in the limit $`D_{N,m}(z)/W^{d-2(m-1)}`$.

Write $`h=m-2`$ and $`B=T_m(1,1)`$. The sum of the monomial coefficients with $`r+s=c`$ in $`T_m(q+j,p+j)`$ is $`B\binom hc`$, since setting $`p=q=1`$ gives $`B(1+j)^h`$. The required limit is consequently
```math
-B h!\sum_{c=0}^h(-1)^c\binom nc
=(-1)^{h+1}B h!\binom{n-1}{h}.
```
The coefficient in the gamma basis at index $`m-1=h+1`$ is the limit times $`(-1)^{m-1}`$. By (4) and Vandermonde,
```math
Bh!=\sum_{i=1}^{m-1}\binom mi\binom{m-2}{i-1}
=\binom{2m-2}{m-1}.
```
This proves (3), including nonvanishing.

## 3. Largest-part analysis

Let $`s=N-M`$, the total size outside a largest part. The full type-$`A_d`$ numerator is $`\sum_{i=0}^d\binom di^2 z^i`$. Its gamma coefficients are $`\binom{d}{2i}\binom{2i}{i}>0`$: take the constant term in $`(1+z+u+z/u)^d`$. Its top gamma degree is $`\lfloor d/2\rfloor`$.

If $`M<N/2`$, every correction in (2) has gamma degree at most $`M-1<\lfloor d/2\rfloor`$ (zero for singleton parts). Hence the top coefficient of the full-root numerator survives, proving (1) in this case.

If $`M\ge N/2`$, we have $`s\le M`$. With exactly two parts, the known [complete bipartite numerator](https://arxiv.org/abs/1807.07678) has gamma degree $`s-1`$, with top coefficient $`\binom{2s-2}{s-1}\binom{M-1}{s-1}>0`$. The equality case $`s=1`$ is a star and is covered here. With at least three parts, separate one largest part and rewrite (2) as
```math
H_G=H_{K_{M,s}}+D_{N,s}-\sum_{\text{other parts}}D_{N,a_j}.
```
Now $`s\le N/2`$ and every other $`a_j<s`$, so the final corrections have gamma degree at most $`s-2`$. The first two summands both have gamma degree $`s-1`$ and positive top coefficients by the complete bipartite formula and (3). Thus the degree is exactly $`s-1`$. Since $`s-1\le\lfloor d/2\rfloor`$, this completes (1). $`\square`$

## Exact source scope and priority

[Kölbl, Conjecture 4.8, arXiv:2404.02136, PDF p. 21](https://arxiv.org/pdf/2404.02136#page=21) literally defines the tested graph as $`K_{a_1,\ldots,a_k}`$ while introducing an additional upper-bound parameter $`n\ge a_k`$. The same wording appears as [Conjecture 7 of Kölbl’s Osaka dissertation, PDF p. 62](https://ir.library.osaka-u.ac.jp/repo/ouka/all/101775/34955_Dissertation.pdf#page=62). It then claims $`\lfloor(\sum a_i)/2\rfloor\le m+1\le\sum a_i`$ for cross-degree $`m`$. Read literally the lower bound is already false by the complete bipartite formula (e.g. the star $`K_{1,3}`$ has $`m=0`$). The unused $`n`$, the surrounding families, and the bipartite formula strongly suggest the intended graph was $`K_{a_1,\ldots,a_k,n}`$. For that interpretation (1) gives more than both bounds: with $`s=\sum a_i`$, it gives exactly
```math
m+1=\min\!\left(\left\lceil\frac{s+n}{2}\right\rceil,\ s\right).
```
We do not assert that interpretation as an author-confirmed correction. The independent adjoining-singletons interlacing statement in the same conjecture is not addressed by this proof. Targeted searches for an exact general cross-degree formula did not locate a prior proof, but this is not an exclusive-priority claim.
