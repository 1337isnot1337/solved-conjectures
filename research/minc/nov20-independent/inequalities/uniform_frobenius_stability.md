# Uniform Frobenius stability of the permanent

Date: 20 November 2026 (America/Chicago).

Status: an algebraic corollary of the independently reviewed
[multicolumn bound](explicit_eventual_zero_diagonal.md) and
[uniform local permanent theorem](uniform_radial_permanent.md).
The derivation below has been independently
[reviewed](../compound/uniform_frobenius_review.md).
This does not resolve a complete Minc entry.
No priority claim is made.

## 1. Statement

Let $`J_n`$ have every entry $`1/n`$, and put $`d_n=n!/n^n`$.

**Theorem.** For every $`n\ge2`$ and every doubly stochastic
$`n\times n`$ matrix $`A`$,

~~~math
\boxed{\quad
\log\frac{\mathop{\mathrm{per}}A}{d_n}
\ge\frac{\|A-J_n\|_F^2}{32\,000\,000}.
\quad}                                                       \tag{1}
~~~

The constant is absolute and deliberately coarse. It is not asserted to
be optimal. In particular, (1) is a bound for every order and every
doubly stochastic matrix, not a claim inferred from a growing collection
of examples.

## 2. Global estimate before using the local theorem

Write $`u=\|A-J_n\|_F^2`$ and $`v=\min(u,1)`$. Equation (10) of the
multicolumn note gives, for every integer $`1\le k<n`$,

~~~math
\log\frac{\mathop{\mathrm{per}}A}{d_n}
\ge\frac{ku}{2n}
-\frac{k(k-1)}{4(n-k)(n-k+1)}.                               \tag{2}
~~~

We claim that this already implies

~~~math
\log\frac{\mathop{\mathrm{per}}A}{d_n}
\ge\frac{\min(u^2,u)}{32}=\frac{uv}{32}.                     \tag{3}
~~~

For $`n\ge4`$, choose

~~~math
k=1+\left\lfloor\frac{(n-2)v}{4}\right\rfloor.
~~~

Then

~~~math
1\le k\le\frac{n+2}{4}\le\frac n2\lt n,\qquad
k-1\le\frac{(n-2)v}{4}.
~~~

The denominator in (2) satisfies

~~~math
4(n-k)(n-k+1)\ge n(n+2).
~~~

Consequently its loss term obeys

~~~math
\frac{k(k-1)}{4(n-k)(n-k+1)}
\le\frac{k(n-2)v}{4n(n+2)}
\le\frac{ku}{4n}.
~~~

Moreover,

~~~math
k>\frac{(n-2)v}{4}\ge\frac{nv}{8}.
~~~

Substitution in (2) gives (3); the case $`u=0`$ is included directly.
For $`n=2,3`$, use $`k=1`$ in (2). Its loss is zero, so the bound
$`u/(2n)\ge uv/32`$ proves (3) in those orders as well.

## 3. Closing the small-deviation regime

Let $`\varepsilon=10^{-6}`$. If $`u\le\varepsilon`$, the local theorem gives

~~~math
\frac{\mathop{\mathrm{per}}A}{d_n}\ge1+\frac u{32}.
~~~

The elementary inequality $`\log(1+x)\ge x/(1+x)`$ for $`x\ge0`$ follows
by differentiation or integration. Therefore

~~~math
\log\frac{\mathop{\mathrm{per}}A}{d_n}
\ge\frac{u}{32+u}
\ge\frac{\varepsilon u}{32}.                               \tag{4}
~~~

The final comparison uses $`32\ge\varepsilon(32+\varepsilon)`$.
If instead $`u\ge\varepsilon`$, then $`v\ge\varepsilon`$, and (3) gives the
same lower bound $`\varepsilon u/32`$. Since
$`\varepsilon/32=1/32\,000\,000`$, this proves (1).

## 4. A stronger confinement rate for the zero-diagonal problem

Let $`U_n`$ be the matrix with zero diagonal and all other entries
$`1/(n-1)`$. If a zero-diagonal doubly stochastic $`A`$ satisfies
$`\mathop{\mathrm{per}}A\le\mathop{\mathrm{per}}U_n`$, then (1) and the exact
orthogonality identity give

~~~math
\frac1{n-1}+\|A-U_n\|_F^2
=\|A-J_n\|_F^2
\le32\,000\,000
\log\frac{\mathop{\mathrm{per}}U_n}{d_n}.                       \tag{5}
~~~

This comparison includes equality candidates. For a fully explicit
right side, let $`D_n`$ count derangements. Inclusion-exclusion gives

~~~math
\frac{D_n}{n!}=\sum_{j=0}^n\frac{(-1)^j}{j!},
\qquad
\frac{\mathop{\mathrm{per}}U_n}{d_n}
=\left(\frac n{n-1}\right)^n\frac{D_n}{n!}.
~~~

The alternating-series remainder implies

~~~math
\frac{D_n}{n!}\le e^{-1}+\frac1{(n+1)!}.
~~~

Using $`e<3`$ and $`\log(1+x)\le x`$,

~~~math
\log\frac{D_n}{n!}
\le -1+\frac{3}{(n+1)!}.
~~~

Also,

~~~math
-n\log(1-1/n)-1
=\sum_{\ell\ge2}\frac1{\ell n^{\ell-1}}
\le\frac1{2(n-1)}.
~~~

It follows that

~~~math
\log\frac{\mathop{\mathrm{per}}U_n}{d_n}
\le\frac1{2(n-1)}+\frac3{(n+1)!}.                            \tag{6}
~~~

Thus every such $`A`$ satisfies the explicit all-order bound

~~~math
\boxed{\quad
\|A-U_n\|_F^2
\le\frac{15\,999\,999}{n-1}
+\frac{96\,000\,000}{(n+1)!}.
\quad}                                                       \tag{7}
~~~

This improves the order of the confinement estimate to $`O(1/n)`$ for
the squared norm, with a poor constant. It does not prove the remaining
finite orders of the zero-diagonal conjecture. The separate eventual
theorem has a better explicit threshold than one gets by combining (7)
with the local ball, so that theorem's threshold is retained.

## 5. Sources and scope of the literature check

The proof inputs are the two linked repository notes, whose primary
imports are:

- M. Lelarge, *Counting matchings in irregular bipartite graphs and random
  lifts*, [arXiv:1507.04739v2](https://arxiv.org/pdf/1507.04739), Theorem 4,
  specialized at the maximum matching size.
- Gurvits's coefficient-capacity theorem, stated and proved in Y. Lavi,
  *The Marcus-Minc Transform Inequality*,
  [arXiv:2609.29262v1](https://arxiv.org/html/2609.29262v1#S2),
  Proposition 2.1.
- The repository's [centered coefficient theorem](../sign/centered_permanental_coefficients.md),
  which supplies the uniform local radius.

Searches on 20 November 2026 used both search engines for permanent
stability, quantitative van der Waerden inequalities, and Frobenius
distance bounds. The retrieved primary statements did not give (1) with
an absolute positive coefficient.

One nearby recent paper was checked directly: L. Gurvits and J. Leake,
*Unique Minimizers for Permanents, Mixed Discriminants, and Log-concave
Polynomials*, [arXiv:2609.21083v2](https://arxiv.org/html/2609.21083v2),
15 October 2026. Its Theorems 1.1-1.4 concern unique minimizers under
specified marginal or polynomial constraints. Those statements do not
provide the dimension-independent Frobenius gap (1). Its Section 1.4
also discusses attempts to apply its method to Birkhoff faces.

These comparisons delimit the retrieved literature; they do not prove
priority. No named open conjecture in Minc's list is claimed solved by
this note. Completed full Minc entries: zero.

