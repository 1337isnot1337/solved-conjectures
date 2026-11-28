# The complete gamma vector for a complete multipartite symmetric edge polytope

Let $`G=K_{a_1,\ldots,a_k}`$ have at least two nonempty parts and $`N=\sum_j a_j`$ vertices. Put $`d=N-1`$, and express its Ehrhart numerator as
```math
H_G(z)=\sum_{i=0}^{\lfloor d/2\rfloor}\gamma_i(G)z^i(1+z)^{d-2i}.
```
Then
```math
\boxed{\displaystyle
\gamma_i(G)=\binom{2i}{i}\left[\binom{N-1}{2i}-
 \sum_{r=1}^k\ \sum_{j=i+1}^{2i}\binom{a_r}{j}\binom{N-a_r-1}{2i-j}\right].}
\tag{1}
```
In particular all these gamma coefficients are nonnegative. The formula strengthens the [exact cross-degree answer](PROOF.md) for the quantitative clause of Kölbl's Conjecture 4.8. This does not prove Ehrhart coefficient positivity in general (gamma positivity is a different property), and does not answer the singleton-addition interlacing clause.

## One-part corrections

Use $`D_{N,m}`$ for the correction numerator obtained by excluding all zero-sum vectors of total positive mass at most $`t`$ whose absolute mass in a fixed $`m`$-vertex part exceeds $`t`$. The [companion note](PROOF.md) proves that these violations are pairwise disjoint, as well as the exact gauge criterion. Thus $`H_G=H_{K_N}-\sum_rD_{N,a_r}`$. We will prove the individual correction formula
```math
D_{m+n,m}(z)=(1+z)^{m+n-1}
 \sum_{i=1}^{m-1}\binom{2i}{i}
 \left(\sum_{j=i+1}^{2i}\binom mj\binom{n-1}{2i-j}\right)
 \left(\frac{z}{(1+z)^2}\right)^i,\qquad m,n\ge1.
\tag{2}
```
Finite binomial coefficients outside their ordinary ranges are zero. For all integer $`m,n\ge1`$, terms with $`2i>m+n-1`$ vanish in the inner sum.

Fix $`m`$. The key point is that
```math
\frac{D_{m+n,m}(z)}{(1+z)^{m+n-1}}
\quad\text{is polynomial of degree at most \(m-2\) in \(n\), over \(\mathbb Q(z)\), for \(m\ge2\).} \tag{3}
```
To see this, let $`A_l(p,q)`$ count signed integer vectors on $`l`$ coordinates with positive and negative masses $`p,q`$. Its generating function is $`\sum_{p,q\ge0} A_l(p,q)U^pV^q=\Phi(U,V)^l`$, where $`\Phi(U,V)=1+U/(1-U)+V/(1-V)`$. For $`u,v\ge1`$, $`A_m(u,v)`$ is a polynomial of degree $`m-2`$, by first choosing the sizes of the disjoint supports and then counting the positive compositions on each. Indeed the contribution with positive and negative support sizes $`a,b\ge1`$, $`a+b\le m`$, is
```math
\binom ma\binom{m-a}b\binom{u-1}{a-1}\binom{v-1}{b-1}.
```
As in the companion note, if the complement masses are $`p,q`$, set $`s=t-S\ge0`$ and $`\ell=t-p-q-2s\ge1`$, where $`S`$ is the total positive mass. The violator's part masses are $`q+s+\ell,p+s+\ell`$, both positive. Thus
```math
\frac{D_{m+n,m}(z)}{(1-z)^{m+n}}
=\sum_{p,q,s\ge0,\ell\ge1}
  A_n(p,q) A_m(q+s+\ell,p+s+\ell)\,z^{p+q+2s+\ell}.
\tag{4}
```
Expand $`A_m(q+s+\ell,p+s+\ell)`$ into monomials $`p^a q^b s^c\ell^e`$ of total degree at most $`m-2`$. When summed in (4), the first two variables produce
```math
\left.(U\partial_U)^a(V\partial_V)^b\Phi(U,V)^n\right|_{U=V=z}.
```
Dividing by $`\Phi(z,z)^n`$ leaves a polynomial in $`n`$ of degree at most $`a+b`$, with rational functions of $`z`$ as coefficients: each Euler derivative can hit at most one more distinct factor of $`\Phi^n`$, and the contributions with $`r`$ distinct factors are proportional to $`(n)_r`$. This identity holds for all positive integers $`n`$, including those smaller than $`a+b`$, since the higher falling factorials then vanish. The $`s,\ell`$ moment generating factors do not involve $`n`$. Finally $`\Phi(z,z)=(1+z)/(1-z)`$, so multiplying by $`(1-z)^{m+n}`$ and dividing by $`(1+z)^{m+n-1}`$ cancels all $`n`$-dependent common factors, leaving the factor $`(1-z)^m(1+z)^{1-m}`$. This proves (3).

The normalized right side of (2) also has degree at most $`m-2`$ in $`n`$: each binomial $`\binom{n-1}{2i-j}`$ has degree at most $`i-1`$ since $`j\ge i+1`$ (and $`i\le m-1`$). Thus it suffices to prove (2) at $`n=1,\ldots,m-1`$.

## Induction using the bipartite formula

Induct on $`m`$, the case $`m=1`$ being zero since a singleton cannot violate. At $`n<m`$, the other correction $`D_{m+n,n}`$ satisfies (2) by induction. The two-part graph gives
```math
D_{m+n,m}+D_{m+n,n}=H_{K_{m+n}}-H_{K_{m,n}}. \tag{5}
```
The full type-$`A_{m+n-1}`$ numerator has $`\gamma_i/\binom{2i}i=\binom{m+n-1}{2i}`$ by taking the constant term of $`(1+z+u+z/u)^{m+n-1}`$. The [known complete-bipartite numerator](https://arxiv.org/abs/1807.07678) has normalized gamma coefficient $`\binom{m-1}{i}\binom{n-1}{i}`$.

To check (5) against the two proposed corrections, let the ground set of $`m+n-1`$ labels consist of disjoint sets $`A,B`$ of sizes $`m-1,n-1`$ and one extra label $`\star`$. Consider the two blocks $`A\cup\{\star\}`$ and $`B\cup\{\star\}`$ of sizes $`m,n`$. Among the subsets of size $`2i`$, the two events of taking more than $`i`$ labels from one of the respective blocks are disjoint. If $`\star`$ is present, exactly one of the majority events occurs. If $`\star`$ is absent, neither occurs exactly when $`i`$ labels are taken from each of $`A,B`$. Therefore the sum of the two majority counts in (2) is precisely $`\binom{m+n-1}{2i}-\binom{m-1}{i}\binom{n-1}{i}`$, as required. At $`i=0`$ all corrections vanish. This verifies (2) for all $`n=1,\ldots,m-1`$; polynomial interpolation from (3) proves it for all $`n\ge1`$.

Subtracting these corrections gives (1). To see nonnegativity, choose an artificial ground set of $`N-1`$ labels with $`k`$ subsets of sizes $`a_1,\ldots,a_k`$ formed by identifying a single label between two of the originally disjoint parts. In particular every pair of subsets intersects in at most one label. Two majority conditions each taking at least $`i+1`$ labels would require at least $`2i+1`$ distinct labels, which is impossible in a subset of size $`2i`$. The expression in square brackets in (1) therefore simply counts subsets of size $`2i`$ which have no majority in any part.

For completeness, (2) gives the top correction coefficient used in the cross-degree proof: if $`2\le m\le (N+1)/2`$, the largest possible index is $`i=m-1`$, with sole term $`j=m`$ and normalized coefficient $`\binom{N-m-1}{m-2}>0`$. The largest-part analysis in [the companion proof](PROOF.md) then gives the exact degree for all multipartite graphs.

The formula and its supporting gauge count are valid without assuming the separate canonical-line or interlacing conjectures. Targeted searches around Kölbl's degree question and known multipartite gamma-polynomial formulas located some small-family formulas, but no preceding formula for all complete multipartite graphs. This does not establish exclusive priority.
