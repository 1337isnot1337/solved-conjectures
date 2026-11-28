# Faustini–Ferroni–Piazza simplex-minimality conjecture: first two coordinates and endpoint lifts

**Structural partial, not a resolution.** [Faustini–Ferroni–Piazza, *Stellahedral geometry of partially ordered sets*, arXiv:2609.22078v2, after Theorem 1.6](https://arxiv.org/html/2609.22078v2#S1) conjecture that, among convex polytopes of fixed dimension, the simplex minimizes every coefficient of the gamma-polynomial of the right (equivalently, left) augmented Eulerian Chow polynomial. This note proves the first two nonconstant coefficients in every dimension (strictly for nonsimplices when defined). It also establishes a family of exactly centered lifted toric inequalities in every degree that verifies all the $\ell=0$ terms in their general formula. The conjecture itself was still present in v2; targeted author/statement, [Ehrenborg](https://www.ms.uky.edu/~jrge/Papers/Lifting.pdf), and repository searches did not identify a full resolution. We make no priority claim for elementary specializations of classical flag inequalities.

Let $\Phi_P$ be the cd-index of the face lattice of a convex $n$-polytope. Write $\sigma_n$ for the $n$-simplex and
```math
D(U)=\langle U,\Phi_P-\Phi_{\sigma_n}\rangle
```
for homogeneous $U$ of cd-degree $n$. By the [Billera–Ehrenborg lower bound](https://www.ms.uky.edu/~jrge/Papers/Monotone.pdf) (see also Ehrenborg, §3), $D(w)\ge0$ for every cd-monomial $w$. For ordinary toric $g$-functionals, $D(g_0^n)=0$ and $D(g_i^n)=g_i(P)\ge0$ for $1\le i\le\lfloor n/2\rfloor$: the simplex's ordinary $h$-polynomial is $1+t+\cdots+t^n$ and toric $g$ is nonnegative for convex polytopes. The same statements hold after reversing cd-words, by duality.

## An exact endpoint identity

For every $i,j\ge0$ set $N=2i+j+2$. Then
```math
 g_i^{2i}\,\mathbf d\mathbf c^j
 =\sum_{k=0}^{i+1}\binom{j+k}{k}g_{i+1-k}^{N}.
```
It follows that $\mathbf c^j\mathbf d g_i^{2i}$ is minimized at the simplex, by reversal. The other endpoint family $\mathbf c^j g_i^{2i}$ is also minimized there: reverse and apply [Ehrenborg, Proposition 4.3](https://www.ms.uky.edu/~jrge/Papers/Lifting.pdf#page=11), which expresses $g_i^{2i}\mathbf c^j$ in the toric $g$-basis with nonnegative coefficients. At $j=0$ the latter assertion is just the toric $g$-inequality. The case $i=0$ is included in both identities.

**Proof of the displayed identity.** Use Ehrenborg's Theorem 4.2. All nonzero coefficients on either side occur on a word $v\mathbf c^j$, where $v$ has degree $2i+2$ and, in its alternating cd form, every maximal $\mathbf c$-run length is even; a run can have length zero. Write $v=u\mathbf c^{2h}$ with $u$ empty or ending with $\mathbf d$, and let $r$ be the number of $\mathbf d$'s in $v$. Fix the common signed factor $(-1)^{i+1-r}$ times the product of Catalan numbers of the half-lengths of the $\mathbf c$-runs before the last $\mathbf d$. For the right-hand summand indexed by $k$, the remainder of its coefficient after extracting this factor is zero for $k>h$ and is
```math
(-1)^k\binom{j+k}{k}
\left(\binom{j+2h}{h-k}-\binom{j+2h}{h-k-1}\right)
```
for $0\le k\le h$. This follows because the coefficient description for $g_{i+1-k}^N$ splits off the terminal $\mathbf c^{j+2k}$, leaving just the final run $\mathbf c^{2(h-k)}$ in its Catalan/ballot formula. The case $v$ all $\mathbf c$ is included with $r=0$ and an empty Catalan product. Thus the normalized coefficient sum is
```math
[t^h](1-t)(1+t)^{j+2h}(1+t)^{-j-1}
=[t^h](1-t)(1+t)^{2h-1}.
```
For $h>0$ this vanishes by the equality of the two middle coefficients of $(1+t)^{2h-1}$. For $h=0$ it is $1$. In the latter case $v$ ends in $\mathbf d$; its coefficient on the left is exactly the common factor by the top toric $g_i^{2i}$ formula. This proves the identity in every coefficient.

## Consequence for the first two gamma coordinates

Let $L_{n,q}$ be the cd-functional giving gamma coordinate $q$, as in [Faustini–Ferroni–Piazza, Proposition 6.8](https://arxiv.org/html/2609.22078v2#S6.Thmproposition8). Its last sum consists of cd-monomials with positive weights. In the two other sums, terms with $q-\ell-1=0$ are also such monomials; hence all these have nonnegative $D$. In the $\ell=0$ terms, the only possible prefix is $\mathbf c^p$ or $\mathbf c^{p-2}\mathbf d$, where $p=n-2q+2$ and negative indices are omitted. Every such term has nonnegative $D$ by the endpoint identities. For $q=1,2$ this exhausts the formula and proves $\gamma_q(P)\ge\gamma_q(\sigma_n)$. The constant coefficient agrees, and duality gives the left version.

For strictness when the coefficient exists, consider $w=\mathbf d\mathbf c^{n-2}$ in the nonnegative-monomial part. For $q=1$ it occurs in the last sum, for $n\ge2$; for $q=2$ it occurs at $\ell=1,a_0=0$ in the first sum, for $n\ge3$. Since $\langle w,\Phi_P\rangle=f_0(P)-2$, a nonsimplex has $D(w)=f_0(P)-(n+1)>0$.

Beyond $q=2$ the same argument proves the nonnegativity of the endpoint contribution, but does not control all terms with $\ell\ge1$ and $q-\ell-1>0$. Their prefixes have internal $\mathbf d$'s and require a stronger centered inequality than mere positivity of the corresponding lifted toric functional.

