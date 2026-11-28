# Chollet's conjecture

Research checkpoint, 20 November 2026 (America/Chicago). No full-conjecture resolution and no priority
claim. The result below is an auxiliary rank bound intended for a possible
full-scope reduction. It is not counted as a solved named conjecture.

## Priority correction

The [later source audit](../reviews/chollet_rank_priority_audit.md) shows that
Yuan--Parrilo's 2021 approximation theorem, combined with the published
untilted sphere bound, already implies every case below with rank at least
18. It also covers all sufficiently large orders at each smaller rank. The
possible residual outside the audit's conservative criteria consists of
finitely many rank/order pairs with ranks 5 through 17. No priority is
certified for that residual. The exponential estimate for rank at least
64 is weaker than the prior consequence, which gives exp(-51n/50).

The argument below is retained as an independently checked proof and a
record of the failed full-conjecture reduction. It must not be presented
as a new large-rank Chollet theorem or counted as a complete resolution.

## Scope and current literature

The [MINC statement](https://yair-lavi.com/mincs-list/conjecture-30/index.html)
asks for

```math
\mathop{\mathrm{per}}(A\circ B)\leq\mathop{\mathrm{per}}A\mathop{\mathrm{per}}B
\qquad(A,B\succeq0).
```

Its self-conjugate form is equivalent. After diagonal normalization, write
$`P=\mathop{\mathrm{per}}C`$, $`Q=\mathop{\mathrm{per}}|C|^2`$, and $`R=Q/P^2`$,
where $`C`$ is a correlation matrix.

The MINC page records all orders at rank at most three and all ranks through
order six. A further primary source is Yicen Ma,
[arXiv:2609.37461v1](https://arxiv.org/html/2609.37461v1), dated 28 September
2026. It proves rank at most four for every order at least ten, and a tight
rank-four class at order nine. Its Sections 2 and 3 provide the Bregman
row-sum bound and the complex-sphere method used below. Its Sections 5 and 6
already use polynomial tilts, so polynomial tilting itself is prior art.

The initial title and rank searches did not identify the implications of
Yuan--Parrilo's theorem. The later audit above corrects that attribution;
a failed search is not evidence of novelty. Fuzhen Zhang's
[2013 analytic approach](https://nsuworks.nova.edu/math_facarticles/26/),
DOI 10.1016/j.laa.2011.09.034, is relevant prior work on maximizing partners.
His [2016 survey, Section 5](https://scholars.nova.edu/ws/portalfiles/portal/42826589/An%20Update%20on%20a%20Few%20Permanent%20Conjectures.pdf)
specifies the objective as the unnormalized function
$`f_A(X)=\mathop{\mathrm{per}}(A\circ X)`$, for a fixed correlation matrix $`A`$.
That differs from $`R(X)`$. The singular-maximizer assertion cannot therefore
be imported as a rank reduction for this ratio. The complete 2013 paper was
not accessible through the retrieved full-text link; this distinction comes
from the author's own later survey.

## Auxiliary proposition

Let $`C`$ be a complex correlation matrix of order $`n`$, of rank
$`r\geq5`$. If $`n\geq r^2`$, then

```math
\mathop{\mathrm{per}}|C|^2 < (\mathop{\mathrm{per}}C)^2.
\tag{1}
```

For $`r\geq64`$, the argument gives the explicit stronger estimate

```math
\frac{\mathop{\mathrm{per}}|C|^2}{(\mathop{\mathrm{per}}C)^2}
 < \exp(-19n/100).
\tag{2}
```

The proof consists of the analytic reductions below and the included exact
rational certificate. The complete rank-square proof and certificate passed the
[independent coordinating review](../reviews/chollet_rank_square_review.md).
A second agent also checked the entropy algebra and harmonic chord bound.

The case of arbitrary positive diagonals follows by congruence with a positive
diagonal matrix. A zero diagonal entry makes the relevant permanents zero.
For pairs of matrices satisfying the rank condition separately, apply
Cauchy--Schwarz to the permutation monomials. The already reported rank-at-most-
four results, when used as external dependencies, cover the remaining ranks
under $`n\geq r^2`$. None of this supplies a reduction of arbitrary ranks.

## 1. A monomial-tilt bound

Let $`v_1,\ldots,v_n\in\mathbb C^r`$ be unit Gram vectors for $`C`$, and let
$`\lambda`$ be the largest eigenvalue of $`C`$, equivalently of their frame
operator. Put $`H_0=0`$, $`H_j=\sum_{a=1}^j1/a`$, and
$`(r)_n=r(r+1)\cdots(r+n-1)`$.

For every integer $`d\geq0`$,

```math
\log P\geq L_d(n,r,\lambda)
 :=\log(r)_n-\log\binom{r+d-1}{d}
 +(\lambda-d)H_d-(n-d)H_{r+d-1}.
\tag{3}
```

Here is a derivation, including the dependence on $`d`$. For uniform probability
measure $`\mu`$ on the complex unit sphere, Gaussian Wick expansion and radial
separation give

```math
P=(r)_n\int\prod_i |\langle v_i,u\rangle|^2\,d\mu(u).
```

Choose a unit top-eigenvector $`w`$, and change measure by the normalized density

```math
\rho_d(u)=\binom{r+d-1}{d}|\langle w,u\rangle|^{2d}.
```

If $`t=|\langle v,w\rangle|^2`$, expansion of the degree-$`d`$ monomial into
the coordinate along $`v`$ and its orthogonal complement gives occupation
weights $`\Pr(K=j)`$ for $`K\sim\mathrm{Binomial}(d,t)`$. Distinct occupations
are orthogonal even after multiplication by
$`\log|\langle v,u\rangle|^2`$. The beta log integral in occupation $`j`$ is
$`H_j-H_{r+d-1}`$. Thus

```math
\int\rho_d\log|\langle v,u\rangle|^2\,d\mu
 =\mathbb EH_K-H_{r+d-1}
 \geq t H_d-H_{r+d-1}.
\tag{4}
```

The last inequality follows from $`H_j\geq(j/d)H_d`$ for $`0\leq j\leq d`$.
For $`d=0`$, use the untilted identity directly. An equivalent exact expression is

```math
\mathbb EH_K=\sum_{j=1}^d\frac{1-(1-t)^j}{j}.
```

The entropy of this density is

```math
J_d:=\int\rho_d\log\rho_d\,d\mu
 =\log\binom{r+d-1}{d}+d(H_d-H_{r+d-1}).
\tag{5}
```

Apply Jensen to the product divided by $`\rho_d`$ under the changed measure.
The sum of the $`t_i`$'s is $`\lambda`$. Equations (4) and (5) then give (3).
All log singularities are integrable; the density is bounded, and its zero set
has sphere measure zero. This also covers repeated Gram vectors.

For later use,

```math
0\leq J_d
 =\sum_{j=1}^{r-1}\left(\log(1+d/j)-\frac d{d+j}\right)
 \leq(r-1)\log\left(1+\frac d{r-1}\right)\leq d.
\tag{6}
```

For the middle inequality, the positive summand as a function of real $`j>0`$
is decreasing. Bound its sum by its integral on $`[0,r-1]`$; an antiderivative
is $`j\log(1+d/j)`$, with limit zero at the left endpoint.

## 2. An upper bound for Q

Set $`b_k=(k!)^{1/k}`$, and interpolate $`b`$ affinely between consecutive
integers. The Bregman bound and row-polytope interpolation give

```math
\mathop{\mathrm{per}}N\leq\prod_i b(s_i)
```

for $`N\in[0,1]^{n\times n}`$ with row sums $`s_i\geq1`$. To see the extension
from binary matrices, maximize the permanent with each row sum fixed. A row
vertex has at most one fractional entry and is a convex combination of binary
rows with adjacent integer sums. Apply Bregman to each multilinear expansion
term and factor the resulting product bound.

For $`N=|C|^2`$,
$`s_i=(C^2)_{ii}\leq\lambda C_{ii}=\lambda`$, and $`b`$ is increasing.
Consequently $`Q\leq b(\lambda)^n`$. No unproved global concavity of $`b`$
is required.

A useful smooth upper bound is

```math
b(x)\leq h(x):=x\exp\left(-1+\frac{1+\log x}{x}\right),\qquad x\geq1.
\tag{7}
```

Indeed, $`\log k!\leq k\log k-k+\log k+1`$ by the integral comparison for
$`\log`$. This gives $`b_k\leq h(k)`$. Moreover

```math
\frac{h''(x)}{h(x)}=\frac{(\log x)^2-x}{x^4}<0,
\quad
(\log h)'(x)=\frac1x-\frac{\log x}{x^2}\leq\frac1x.
\tag{8}
```

For example, $`\log x/\sqrt x\leq2/e<1`$ proves the strict sign. Concavity
of $`h`$ puts it above the affine interpolation of its integer values, hence
above $`b`$. It is also increasing.

It is therefore sufficient to show that, for some $`d`$,

```math
G_d(n,r,\lambda):=2L_d(n,r,\lambda)/n-\log h(\lambda)>0.
\tag{9}
```

## 3. Extending the finite calculation to every larger order

Fix $`r\geq3`$, $`d`$, and $`c\in[1/r,1]`$, and put $`\lambda=cn`$.
Then $`G_d(n,r,cn)`$ is strictly increasing for real $`n\geq r^2`$.

Write $`f(n)=\log\Gamma(n+r)-\log\Gamma(r)`$. From (3) and (5),

```math
G_d(n,r,cn)=2f(n)/n+2cH_d-2H_{r+d-1}-2J_d/n-\log h(cn).
```

The standard series for the trigamma function gives
$`f''(t)=\sum_{k\geq0}(r+t+k)^{-2}>1/(r+t)`$. Since $`f(0)=0`$,

```math
nf'(n)-f(n)=\int_0^n t f''(t)\,dt
 > n-r\log(1+n/r).
```

Using $`J_d\geq0`$ and (8),

```math
\frac{d}{dn}G_d(n,r,cn)
 > \frac1n\left(1-\frac{2r}{n}\log(1+n/r)\right)>0.
\tag{10}
```

The last sign follows because $`\log(1+x)/x`$ decreases for $`x>0`$, and
$`\log(1+r)/r\leq\log4/3<1/2`$ for $`r\geq3`$.
Thus covering every $`\lambda\in[r,r^2]`$ at $`n=r^2`$ covers all
$`n\geq r^2`$: retain the same $`c=\lambda/n`$ and the certificate's chosen
integer $`d`$.

## 4. Exact finite certificate for ranks 5 through 63

`chollet_rank_square_certificate.json` contains 458 closed intervals. At each
rank $`r=5,\ldots,63`$, their union is exactly $`[r,r^2]`$, with matching
adjacent endpoints. Each interval $`[a,b]`$ specifies an integer $`d`$.

The checker recomputes a lower bound for $`L_d(r^2,r,a)`$ and an upper bound
for $`\log h(b)`$, and verifies

```math
\frac2{r^2}\underline L_d(r^2,r,a)-\overline{\log h(b)}>0.
\tag{11}
```

Both $`L_d`$ and $`h`$ increase in $`\lambda`$, so this is an enclosure for
the entire interval. There is no floating-point acceptance test.

The lower bound for $`\log(r)_n`$ uses Robbins' inequalities
$`1/(12m+1)<\log(m!/(\sqrt{2\pi m}(m/e)^m))<1/(12m)`$.
With $`t=n+r`$, the $`\log(2\pi)/2`$ terms cancel, leaving

```math
\log(r)_n >
 (t-\tfrac12)\log t-(r-\tfrac12)\log r-n
 +\frac1{12t+1}-\frac1{12r}.
\tag{12}
```

For logarithms the checker scales a positive rational into $`[1,2]`$, then
uses the positive atanh series

```math
\log y=2\sum_{j=0}^{M-1}\frac{z^{2j+1}}{2j+1}+E_M,
\quad z=\frac{y-1}{y+1},
\quad
0\leq E_M\leq\frac{2z^{2M+1}}{(2M+1)(1-z^2)}.
```

Here $`M=24`$, and every value is a `fractions.Fraction`. The same series
encloses $`\log2`$. Harmonic numbers and binomial coefficients are exact.
The generator uses a floating-point value only to select a candidate $`d`$;
the verifier does not use that selection rule and recomputes every inequality.

Executed result: all 458 intervals passed; the smallest interval lower bound
is greater than 0.0002714225. This decimal is descriptive and is not used in
the proof.

Robbins' primary paper is
[A remark on Stirling's formula (1955)](https://heuklyd.github.io/papers/pdf/Robbins-1955.pdf).

## 5. Analytic tail for every rank at least 64

Take $`d=\lfloor r/4\rfloor`$. Since $`(r)_n\geq n!\geq(n/e)^n`$,
$`J_d\leq d`$, and $`\lambda\geq n/r\geq r`$, equations (3) and (7) give

```math
G_d\geq
2\log n-1-2H_{r+d-1}-\frac{2J_d}{n}
-\frac{1+\log r}{r}
+\frac{2H_d}{n}\lambda-\log\lambda.
```

For positive $`a,x`$, $`ax-\log x\geq1+\log a`$. Therefore

```math
G_d\geq\log n-2H_{r+d-1}+\log(2H_d)
-\frac{2J_d}{n}-\frac{1+\log r}{r}.
```

The elementary harmonic comparisons
$`H_m>\log(m+1/2)+\gamma`$ and $`H_m<\log(m+1)+\gamma`$ follow by comparing
the associated sequences to their common limit $`\gamma`$. Together with
$`n\geq r^2`$, $`d\leq r/4`$, and $`d+1/2\geq r/4-1/2`$, they imply

```math
G_d>
\log\left(2[\log(r/4-1/2)+\gamma]\right)
-2\log(5/4)-2\gamma-\frac{3/2+\log r}{r}.
\tag{13}
```

For the bound, replace $`\gamma`$ inside the logarithm by $`57/100`$,
and the subtracted $`2\gamma`$ by $`116/100`$. The resulting expression
increases for $`r\geq64`$. The verifier proves the rational log comparisons

```math
\log(31/2)>137/50,\quad \log(331/50)>189/100,
\quad \log(5/4)<28/125,\quad \log64<104/25.
```

It also verifies $`57/100<\gamma<58/100`$ using
$`H_{100}-\log101<\gamma<H_{100}-\log(201/2)`$.
At $`r=64`$, the right side of (13) consequently exceeds

```math
\frac{189}{100}-\frac{56}{125}-\frac{116}{100}
-\frac{3/2+104/25}{64}
=0.1935625>\frac{19}{100}.
```

This proves (2) for the entire analytic tail, including every larger order.
Together with Sections 3 and 4, it proves the auxiliary proposition.

## 6. What the face-reduction bridge would still have to prove

Extreme complex correlation matrices have rank $`r`$ satisfying $`r^2\leq n`$.
For Gram vectors $`v_i`$, an extreme point requires that the rank-one
operators $`v_iv_i^*`$ span the real vector space of Hermitian $`r\times r`$
matrices. Otherwise a nonzero Hermitian $`H`$ with
$`v_i^*Hv_i=0`$ produces diagonal-preserving perturbations
$`C(t)_{ij}=v_i^*(I+tH)v_j`$. This is the criterion in Li and Tam,
[A note on extreme correlation matrices (1994)](https://people.wm.edu/~cklixx/corr.pdf).

The missing assertion is: if any correlation matrix has $`R>1`$, can a
correlation matrix with $`R>1`$ be found at an extreme point? More specifically,
at a maximal violating matrix of rank $`r`$ with $`r^2>n`$, can a face direction
be followed to lower rank without losing the violation?

No argument establishing this is supplied. Convexity of the elliptope alone
does not imply it because the ratio is nonlinear. Indeed unqualified
quasiconvexity is false. For

```math
C(t)=\begin{pmatrix}1&t\\t&1\end{pmatrix},\quad |t|<1,
\qquad R(t)=\frac{1+t^4}{(1+t^2)^2},
```

we have $`R(0)=1>R(a)=R(-a)`$ whenever $`0<a<1`$. This does not refute
the narrower assertion about the superlevel set $`R>1`$, but it prevents
using an ordinary quasiconvexity theorem.

## 7. Exact obstruction to direct Wishart projection

Let $`F(A)=\mathop{\mathrm{per}}(A)^2-\mathop{\mathrm{per}}|A|^2`$, and form
$`B=XGG^*X^*`$, where $`XX^*=A`$ and $`G`$ has $`s`$ independent standard
complex Gaussian columns. At order two, direct Wick expansion gives

```math
\begin{aligned}
\mathbb E\mathop{\mathrm{per}}(B)^2
 &=(s)_4\mathop{\mathrm{per}}(A)^2-2s(s+1)^2\det(A)^2,
\\ \mathbb E\mathop{\mathrm{per}}|B|^2
 &=(s)_4\mathop{\mathrm{per}}|A|^2-4s(s+1)^2\det(A)^2,
\\ \mathbb EF(B)
 &=(s)_4F(A)+2s(s+1)^2\det(A)^2.
\end{aligned}
\tag{14}
```

`wishart_identity.py` enumerates the 24 Wick pairings exactly over the
polynomial ring in the four entries of $`A`$ and the variable $`s`$. All three
identities passed. For $`A=I_2`$, the extra term is strictly positive. Thus
integrating a low-rank Chollet inequality does not directly isolate
$`F(A)\geq0`$ with a universally nonpositive remainder. A more elaborate
projection identity would need an additional subtraction or another estimate.

## Reproduction

Run from the repository or workspace containing this directory:

```bash
python research/minc/continuation-2026-11-20/inequalities/verify_chollet_rank_square.py
python research/minc/continuation-2026-11-20/inequalities/wishart_identity.py
```

The first script uses only the Python standard library. The second uses SymPy.
The certificate can be regenerated with `--generate`, but verification uses the
stored interval data and independently recomputes every decisive bound.

The work provides no completed named-conjecture resolution. The rank reduction
in Section 6 is the exact remaining mathematical gap in this proposed route.
