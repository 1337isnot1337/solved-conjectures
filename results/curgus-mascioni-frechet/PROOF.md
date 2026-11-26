# Ćurgus–Mascioni's Fréchet root-matching extremizer problem

## Statement and results

Let $\mathcal P_n$ denote polynomials over $\mathbb C$ of degree at most $`n`$, $n\ge1$, and let $D=d/dz$. Consider a constant-coefficient differential operator

$$
T=\sum_{j=0}^n a_jD^j,\qquad a_0\ne0.
$$

It is invertible on $\mathcal P_n$ and preserves degree. For equal-cardinality multisets $`U=(u_i)_{i=1}^m,V=(v_i)_{i=1}^m`$, write

$$
d_F(U,V)=\min_{\pi\in S_m}\max_i|u_i-v_{\pi(i)}|.
$$

This is the Fréchet/bottleneck matching distance in [Ćurgus and Mascioni, *Perturbations of roots under linear transformations of polynomials*, §8 and Example 12.3](https://arxiv.org/abs/math/0502027), *Constructive Approximation* **25** (2007), 255–277. If $Z(f)$ is the root multiset, they define

$$
K_F(T)=\sup_{f\in\mathcal P_n\setminus\mathcal P_0}d_F(Z(f), Z(Tf)).
$$

At the end of Example 12.3 they ask whether an extremizing polynomial exists and whether it is unique. The answers are: **existence always holds; uniqueness fails**, even if scalar multiplication and all Euclidean isometries of the root multiset are ignored. The definition uses degree *at most* $`n`$, not exact degree. In addition, for exact degree $n\ge2$, the limiting largest value as root diameter tends to infinity equals the optimum over degrees at most $n-1$. For the specific cubic operator in their Example 12.3, the optimum is exactly $2$, and their example attains it uniquely up to translation and scalar multiplication.

## A cluster limit for the matching distance

Take any sequence of monic polynomials $f_\ell$ of one fixed degree $m\ge1$. Label its roots $u_{1,\ell},\dots,u_{m,\ell}$. By passing to a subsequence, assume every pairwise distance has a limit in $[0,\infty]$. Say $i\sim j$ if the limit of $|u_{i,\ell}-u_{j,\ell}|$ is finite. The triangle inequality makes this an equivalence relation, and distances between different classes tend to infinity.

For each class $A$, choose a representative center $c_{A,\ell}=u_{i_A,\ell}$ and pass to a further subsequence so that the bounded differences $u_{i,\ell}-c_{A,\ell}$ for $i\in A$ all converge. The monic local polynomials
```math
g_{A,\ell}(z)=\prod_{i\in A}(z+c_{A,\ell}-u_{i,\ell})
```
then converge coefficientwise to a monic degree-$`|A|`$ polynomial $g_A$. Define $C_{A,\ell}=\prod_{i\notin A}(c_{A,\ell}-u_{i,\ell})$, with an empty product equal to $1$. For all sufficiently large $\ell$ this is nonzero, and
```math
\frac{f_\ell(z+c_{A,\ell})}{C_{A,\ell}}
=g_{A,\ell}(z)\prod_{i\notin A}\left(1+\frac z{c_{A,\ell}-u_{i,\ell}}\right)
\longrightarrow g_A(z)
```
coefficientwise as polynomials of degree at most $m$. Since $T$ commutes with translation, the same statement after applying $T$ says
```math
\frac{(Tf_\ell)(z+c_{A,\ell})}{C_{A,\ell}}\longrightarrow (Tg_A)(z).
```
In particular the convergence is uniform on each compact set.

Fix pairwise disjoint small disks about the distinct roots of $Tg_A$. Rouché's theorem places the correct number, with multiplicity, of translated roots of $Tf_\ell$ inside each such disk, for all sufficiently large $\ell$. Do this for every class. The disks in the original root coordinates of different classes are disjoint for large $\ell$, and the counts add to $m=\deg(Tf_\ell)$. Thus they account for all roots. The output multiset in class $A$, recentered at $c_{A,\ell}$, converges in $d_F$ to $Z(Tg_A)$ by taking arbitrarily small disks; the input multiset converges to $Z(g_A)$ by construction.

A class-preserving matching has bounded cost, since both recentered multisets within each class are bounded. Any matching with a cross-class pair has cost tending to infinity, uniformly over such pairs because there are just finitely many classes. Hence every optimal matching preserves classes for large $\ell$, and the overall distance is the maximum of the individual class distances. We have proved, along the chosen subsequence,

$$
d_F(Z(f_\ell),Z(Tf_\ell))
\longrightarrow \max_A d_F(Z(g_A),Z(Tg_A)).
\tag{1}
$$

## Attainment and the precise limit at infinity

Take a maximizing sequence, with distances tending to $+\infty$ if the supremum were infinite. A subsequence has fixed degree; multiplying by nonzero scalars makes it monic without changing either root multiset. Apply (1). Its right side is finite, so in particular the supremum was finite, and one of the finitely many $g_A$ attains it. This argument does not need a separate proof of the known uniform perturbation bound.

For $n\ge2$ let $K_{n-1}$ be the analogous supremum for the restriction of the same $T$ to $\mathcal P_{n-1}$. Along any exact-degree-$`n`$ sequence with input root diameter tending to infinity, there must be at least two classes in (1). Thus every subsequential limit is at most $K_{n-1}$. Conversely choose any attaining polynomial $g$ in degree $1\le m\le n-1$ and append $n-m$ simple roots escaping mutually and from $Z(g)$, for example $f_\ell(z)=g(z)\prod_{j=1}^{n-m}(z-j\ell)$. Formula (1) gives limit $K_{n-1}$: the $g$ class attains it, and each single-root class has matching cost $|a_1/a_0|\le K_{n-1}$. Therefore

```math
\lim_{R\to\infty}
\ \sup_{\substack{\deg f=n\\\mathop{\mathrm{diam}}Z(f)\ge R}}
d_F(Z(f),Z(Tf)) =K_{n-1}.
```

In particular a strict jump between the lower-degree optimum and the degree-at-most-$`n`$ optimum forces every maximizing sequence to have bounded root diameter and, after translation and monic normalization, a subsequence converging to an exact-degree-$`n`$ extremizer. No such exact-degree qualification is needed for the original existence question.

## Nonuniqueness without translation artifacts

On $\mathcal P_2$ take $T=I+\tfrac12D^2$. It leaves every linear polynomial unchanged. After translation and scaling by a nonzero scalar, a quadratic has the form $f(z)=z^2-w$, and $Tf(z)=z^2-(w-1)$. Let $u^2=w$ and $v^2=w-1$. The only two matchings of the two roots give
```math
d_F(Z(f),Z(Tf))=\min(|u-v|,|u+v|)\le1,
```
since $|(u-v)(u+v)|=1$. For every $0\le w\le1$ take $u$ real and $v$ purely imaginary, so both distances are $1$. Thus $K_F(T)=1$ and this is a continuum of extremizers. The square-root/product estimate is the same quadratic idea used in the source’s Example 12.2 for root distances; the exact symmetric matching and continuum of inequivalent equality cases are the assertions here. Their root separations $2\sqrt w$ are different, so no two are equivalent under Euclidean root-set isometries or multiplication of the polynomial by a nonzero scalar. This counterexample uses a differential operator that is not translation.

## The exact cubic operator in Example 12.3

The authors already give a cubic attaining distance $2$ for $T=I+(2/3)D+(2/9)D^2-(4/27)D^3$. Here $2$ is the exact supremum, and their cubic is unique up to translation and nonzero scalar multiplication. This is a separate statement about their example, not about universal uniqueness.

First let $F$ be monic cubic, $c\ne0$, $X=Z(F)$, $Y=Z(F-c)$ and $r=(2|c|)^{1/3}$. For each vertex in either multiset, the product of its distances to the three opposite vertices is $|c|$. Thus in the bipartite graph of distances strictly less than $r$, each vertex has a neighbor. By Hall's theorem, failure of a perfect matching can only arise from two vertices on one side whose combined neighborhood has only one vertex: neither a singleton nor all three vertices can fail its condition.

Relabel so that all four distances between $x_1,x_2$ and $y_1,y_2$ are at least $r$. Translate $y_3$ to zero and write $x_3=z$, $x_1=a$, $x_2=b$, $y_1=z+u$, $y_2=z+v$. The product identities imply $|a|,|b|,|u|,|v|\le |c|/r^2=r/2$. The sums of the roots agree, so $z=a+b-u-v$. The four cross differences, up to sign, are therefore $v-b,u-b,v-a,u-a$. Each has modulus at most $r$, so all must have modulus exactly $r$. Equality in the triangle inequalities forces $a=b=-u=-v$, with $|a|=r/2$. In this case $`X=\{a,a,4a\}`$, $`Y=\{0,3a,3a\}`$ and $-4a^3=c$ by $F(0)=c$. These multisets do have bottleneck distance $r=2|a|$: every matching uses at least one double-root-to-double-root edge, and there is a matching with all distances at most $r$. If the strict graph instead has a perfect matching, the distance is strictly less than $r$. This proves the sharp bound and its equality classification.

For the source's operator, write the original monic cubic as $f(z)=(2/3)^3F(3z/2)$. Direct Taylor expansion gives
```math
(Tf)(z)=(2/3)^3\bigl(F(3z/2+1)-4\bigr).
```
Thus the original distance is $(2/3)d_F(X,Y-1)$, where now $Y=Z(F-4)$. The triangle inequality and the lemma give $d_F(X,Y-1)\le3$. Equality requires $d_F(X,Y)=2$, hence the classified multisets with $a^3=-1$. Their explicit matching $a\leftrightarrow-1$, $a\leftrightarrow3a-1$, $4a\leftrightarrow3a-1$ has maximum distance $\max(|a+1|,|1-2a|)$. This is strictly less than $3$ unless $a=-1$. At $a=-1$, the two multisets are $`\{-1,-1,-4\}`$ and $`\{-1,-4,-4\}`$ and have distance exactly $3$. Returning to the original coordinates and translating gives the authors' polynomial $(z-1)^2(z+1)$. On degrees one and two the operator is translation by $2/3$ in the argument, hence has root matching cost $2/3$ there. This proves the exact assertion for the full $\mathcal P_3$.

## Prior work and scope

The exact existence/uniqueness question is in [the authors' primary PDF, Example 12.3, p. 21 of the preprint](https://faculty.curgus.wwu.edu/Papers/RootsOperFinal.pdf#page=21); the definition is in §8. Their Theorem 9.1 already proves attainment for the different directed Hausdorff quantity with a monomial. Their [later *Stability of roots of polynomials under linear combinations of derivatives*](https://faculty.curgus.wwu.edu/Papers/CurgusMascioni20090325.pdf) treats perturbations of well-separated simple roots, notably Corollary 4.4, rather than the existence of a bottleneck extremizer. Searches by author, operator, distance, and the exact question did not find a prior answer for $K_F$; this is not a priority guarantee. The proof above does not determine the value of $K_F(T)$ for general $T$. The exact cubic calculation strengthens the source’s stated lower bound in Example 12.3.
