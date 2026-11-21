# An explicit eventual zero-diagonal minimum

Date: 20 November 2026 (America/Chicago).

Status: proof independently [reviewed](../compound/eventual_zero_diagonal_review.md).
This is an explicit
large-order consequence of the
[uniform local permanent theorem](uniform_radial_permanent.md).
It does not resolve the full zero-diagonal minimum conjecture. It removes
the dependence on the catalogue's unpublished confinement constants.

## 1. Result and scope

Let $`J_n`$ have every entry $`1/n`$, let $`d_n=n!/n^n`$, and let $`U_n`$ have zero diagonal
and every off-diagonal entry $`1/(n-1)`$.

**Theorem.** For every integer

~~~math
n\ge20\,000\,000\,000\,000                                  \tag{1}
~~~

and every $`n\times n`$ doubly stochastic matrix $`A`$ with zero diagonal,

~~~math
\operatorname{per}A\ge\operatorname{per}U_n,
~~~

with equality only when $`A=U_n`$.

The threshold is a consequence of coarse constants, not a claim about a
transition in the mathematics. The proof does not enumerate orders or
matrices. The still-unresolved smaller orders prevent this from counting
as a resolution of Conjecture 44.

The global estimate below reconstructs the kind of multicolumn bound
reported by the catalogue. No priority claim is made for that estimate.
Its two imported ingredients are Lelarge's maximum-matching coefficient
bound and Gurvits's stable-polynomial capacity bound.

## 2. Imported coefficient bounds, with exact hypotheses

For a nonnegative square matrix $`W`$, write $`\sigma_j(W)`$ for the sum of all
$`j\times j`$ subpermanents, and let

~~~math
\nu(W)=\max\{j:\sigma_j(W)>0\}.
~~~

For a substochastic matrix $`X=(x_{ij})`$, meaning nonnegative with every row
and column sum at most one, define

~~~math
\begin{aligned}
S_B(W,X)
={}&\sum_{i,j}\left[
x_{ij}\log\frac{w_{ij}}{x_{ij}}
+(1-x_{ij})\log(1-x_{ij})
\right]\\
&-\sum_i\left(1-\sum_jx_{ij}\right)
 \log\left(1-\sum_jx_{ij}\right)\\
&-\sum_j\left(1-\sum_ix_{ij}\right)
 \log\left(1-\sum_ix_{ij}\right).
\end{aligned}                                               \tag{2}
~~~

Zero terms have their continuous meanings. The selected X below is
supported wherever W is positive.

Theorem 4 in M. Lelarge,
[*Counting matchings in irregular bipartite graphs and random lifts*,
arXiv:1507.04739v2](https://arxiv.org/pdf/1507.04739), pages 4-5,
states a lower bound for each $`\sigma_j(W)`$, with binomial probability
factor $`b_{\nu,j}(j/\nu)`$. At the maximum size $`j=\nu`$ this factor is exactly one.
In particular, if $`X`$ is substochastic with total sum $`\nu(W)`$, then

~~~math
\log\sigma_{\nu(W)}(W)\ge S_B(W,X).                           \tag{3}
~~~

This is the exact specialization used here. The ambient square order of W
need not equal its maximum matching size.

We also use Gurvits's coefficient-capacity inequality. If q is a
homogeneous real-stable polynomial of degree m in m variables with
nonnegative coefficients, then

~~~math
[x_1\cdots x_m]q\ge d_m\operatorname{Cap}(q),\qquad
\operatorname{Cap}(q)=
\inf_{x_1,\ldots,x_m>0}\frac{q(x)}{x_1\cdots x_m}.             \tag{4}
~~~

A complete statement and proof, including the zero-capacity boundary, are
given as Proposition 2.1 of Y. Lavi,
[*The Marcus-Minc Transform Inequality*,
arXiv:2609.29262v1](https://arxiv.org/html/2609.29262v1#S2).
That proposition is credited to Gurvits. Differentiation and specialization
at zero preserve real stability or produce zero.

## 3. A multicolumn permanent bound

**Lemma 1.** Let $`A`$ be doubly stochastic, let $`S`$ be any set of $`k`$ columns,
and let $`1\le k<n`$. Then

~~~math
\boxed{\quad
\operatorname{per}A
\ge d_{n-k}\prod_{\substack{i\in[n]\\j\in S}}
(1-a_{ij})^{1-a_{ij}}.
\quad}                                                       \tag{5}
~~~

The convention at $`a_{ij}=1`$ is $`0^0=1`$.

**Proof.** First assume every entry of A is positive. Put

~~~math
p_A(x)=\prod_{i=1}^n\left(\sum_{j=1}^n a_{ij}x_j\right),
\qquad
q_S(x)=
\left.\left(\prod_{j\in S}\partial_{x_j}\right)p_A(x)
\right|_{x_j=0,\ j\in S}.
~~~

The polynomial $`q_S`$ is nonzero, real stable, homogeneous of degree $`n-k`$ in
the $`n-k`$ variables outside $`S`$, with nonnegative coefficients. Its squarefree
full coefficient is $`\operatorname{per}A`$.

Fix positive outside variables and set

~~~math
c_i=\sum_{j\in S}a_{ij},\qquad
L_i=\sum_{j\notin S}a_{ij}x_j.
~~~

Then $`0<c_i<1`$ and $`L_i>0`$. Define the square matrix $`W`$ by $`w_{ij}=a_{ij}/L_i`$ when
$`j\in S`$, and $`w_{ij}=0`$ otherwise. Its maximum matching size is exactly $`k`$:
there are only k nonzero columns, and all entries in those columns are
positive. Expansion by the rows used by the selected columns gives

~~~math
q_S(x)=\left(\prod_iL_i\right)\sigma_k(W).                     \tag{6}
~~~

The factor in (6) is exactly one: every matching of size k in W saturates
the selected k columns, and each such matching appears once.

Use (3) with $`X_{ij}=a_{ij}`$ on $`S`$ and zero elsewhere. This $`X`$ is substochastic,
has total mass $`k`$, row sums $`c_i`$, and column sums one on $`S`$ and zero outside.
Its column-monomer terms in (2) therefore vanish. The other terms give

~~~math
S_B(W,X)=
-\sum_i c_i\log L_i
+\sum_{\substack{i\in[n]\\j\in S}}(1-a_{ij})\log(1-a_{ij})
-\sum_i(1-c_i)\log(1-c_i).
~~~

Together with (6), this yields

~~~math
q_S(x)\ge
\prod_{\substack{i\in[n]\\j\in S}}(1-a_{ij})^{1-a_{ij}}
\prod_i\left(\frac{L_i}{1-c_i}\right)^{1-c_i}.                \tag{7}
~~~

Weighted arithmetic-geometric mean in row i gives

~~~math
\left(\frac{L_i}{1-c_i}\right)^{1-c_i}
\ge\prod_{j\notin S}x_j^{a_{ij}}.
~~~

The remaining column sums are one. Multiplying the last inequalities shows
that the final product in (7) is at least the product of all outside
variables. Hence Cap(q_S) is at least the first product in (7).
Equation (4) proves (5).

For a general doubly stochastic A, apply the positive case to
$`(1-\varepsilon)A+\varepsilon J_n`$ and let $`\varepsilon`$ decrease to zero. Permanents and
the finite product in (5) are continuous, including the stated endpoint
convention. This proves the lemma. No continuity or attainment of capacity
is needed. QED.

## 4. An explicit Frobenius lower bound

Write

~~~math
r^2=\|A-J_n\|_F^2,\qquad
f(x)=(1-x)\log(1-x),\quad f(1)=0.
~~~

Since $`f''(x)=1/(1-x)\ge1`$ on $`[0,1)`$, Taylor's inequality and continuity give,
for every column $`j`$,

~~~math
\sum_i f(a_{ij})
\ge n f(1/n)+\frac12\sum_i(a_{ij}-1/n)^2.                     \tag{8}
~~~

The linear Taylor term vanishes because that column sums to one.
Some k-column set S has at least k/n of the total squared deviation.
Applying (5) to this S therefore gives

~~~math
\log\frac{\operatorname{per}A}{d_n}
\ge \log\frac{d_{n-k}}{d_n}
+k(n-1)\log(1-1/n)+\frac{k r^2}{2n}.                         \tag{9}
~~~

For real $`x>1`$ put $`h(x)=(x-1)\log(1-1/x)`$. Since $`d_m/d_{m-1}=\exp(h(m))`$,
the first two terms on the right in (9) equal

~~~math
-\sum_{m=n-k+1}^{n}\bigl(h(m)-h(n)\bigr).
~~~

Moreover,

~~~math
-h'(x)=-\log(1-1/x)-1/x
=\sum_{\ell\ge2}\frac1{\ell x^\ell}
\le\frac1{2x(x-1)}.
~~~

For $`m\ge n-k+1`$, integration from $`m`$ to $`n`$ gives

~~~math
h(m)-h(n)
\le\frac{n-m}{2(n-k)(n-k+1)}.
~~~

Summing proves the explicit all-order estimate

~~~math
\boxed{\quad
\log\frac{\operatorname{per}A}{d_n}
\ge\frac{k r^2}{2n}
-\frac{k(k-1)}{4(n-k)(n-k+1)}
\qquad(1\le k<n).
\quad}                                                       \tag{10}
~~~

This is a bound for every doubly stochastic matrix. Zero diagonal has not
yet been used.

## 5. Excluding the complement of the local ball

Set

~~~math
\varepsilon=10^{-6},\qquad \delta=\sqrt{\varepsilon}=1/1000,
\qquad k=\lfloor n\varepsilon/2\rfloor.
~~~

For $`n\ge6\,000\,000`$,

~~~math
\frac{n\varepsilon}{3}\le k\le\frac{n\varepsilon}{2},
\qquad 1\le k<n.
~~~

If $`r^2\ge\varepsilon`$, equation (10) gives

~~~math
\begin{aligned}
\log\frac{\operatorname{per}A}{d_n}
&\ge\frac{\varepsilon^2}{6}
-\frac{\varepsilon^2}{16(1-\varepsilon/2)^2}\\
&>\frac{\varepsilon^2}{6}-\frac{\varepsilon^2}{15}
=\frac{\varepsilon^2}{10}=10^{-13}.                         \tag{11}
\end{aligned}
~~~

The strict step uses the exact rational inequality
$`16(1-\varepsilon/2)^2>15`$. Thus every doubly stochastic matrix outside the
fixed centered ball has an explicit positive normalized gap, once n is
large enough for this choice of k.

We also need an upper estimate at U_n. The proof of Theorem 1 in the
local note bounds half the absolute higher-degree Hessian by
$`S<467/1000`$. The quadratic Hessian coefficient is $`n/(n-1)\le2`$. Consequently,

~~~math
\nabla^2P_n(B)[H,H]\le3\|H\|_F^2
\qquad(\|B\|_F\le1/1000),                                   \tag{12}
~~~

where $`P_n(B)=\operatorname{per}(J_n+B)/d_n`$. Integrating from zero gives

~~~math
P_n(B)\le1+\frac32\|B\|_F^2.                                 \tag{13}
~~~

The matrix $`B_0=U_n-J_n`$ has squared Frobenius norm $`1/(n-1)`$.
For n in (1), it lies in the local ball, and (13) yields

~~~math
\log\frac{\operatorname{per}U_n}{d_n}
\le\frac{3}{2(n-1)}<10^{-13}.                               \tag{14}
~~~

The final rational comparison follows already when $`n>15\,000\,000\,000\,001`$;
the round threshold in (1) is larger.

Equations (11) and (14) show that every $`A`$ with $`r^2\ge\varepsilon`$ has
$`\operatorname{per}A>\operatorname{per}U_n`$. This comparison covers equality candidates as well as
strict counterexamples.

## 6. Completing the eventual theorem

Now impose zero diagonal and let $`D=A-U_n`$. Orthogonality gives

~~~math
\|A-J_n\|_F^2=\frac1{n-1}+\|D\|_F^2.
~~~

If the left side is at most $`\varepsilon`$, Theorem 2 of the local note gives

~~~math
\operatorname{per}A-\operatorname{per}U_n
\ge\frac{d_n}{32}\|D\|_F^2,
~~~

strictly positive unless $`A=U_n`$. If it is at least $`\varepsilon`$, the strict
comparison in Section 5 applies. These two regions cover every A.
This proves the theorem, including uniqueness.

No assertion in this proof uses the unspecified $`O(1/n)`$ term from the
catalogue. No finite-order computational check enters the proof.

## 7. Verification, sources, and unresolved work

[The accompanying script](explicit_eventual_zero_diagonal_check.py) checks the matching-size normalization and the
entropy substitution on exact small matrices, and verifies the threshold
constants by rational arithmetic. Those checks are diagnostics; the
uniform theorem is the written argument above.

Primary inputs:

1. M. Lelarge, *Counting matchings in irregular bipartite graphs and random
   lifts*, arXiv:1507.04739v2, Theorem 4 and formula (9)-(10), pages 4-5,
   [primary PDF](https://arxiv.org/pdf/1507.04739).
   The theorem is used at maximum matching size, so the binomial
   probability prefactor is exactly one.
2. L. Gurvits's coefficient-capacity theorem, as restated and proved in
   Y. Lavi, *The Marcus-Minc Transform Inequality*, arXiv:2609.29262v1,
   Proposition 2.1,
   [primary text](https://arxiv.org/html/2609.29262v1#S2).
3. The repository's
   [centered coefficient proof](../sign/centered_permanental_coefficients.md)
   and [uniform local theorem](uniform_radial_permanent.md), with their
   independent reviews and exact diagnostic scripts.

The [live C44 catalogue](https://yair-lavi.com/mincs-list/conjecture-44/index.html)
already reports multicolumn lower bounds and shrinking confinement.
Equation (5) is presented as an explicit reconstruction from published
inputs, not a claim to have originated that method. The application of
the local theorem to obtain the explicit eventual range is independently
proved here.

The full conjecture remains open in this research record. Orders below
the threshold have not been settled by this argument; in particular, the
unresolved range starting at order five is not replaced by a finite search.
Completed full Minc entries from this note: zero.

A further source check on 20 November 2026 used both the live catalogue
and a primary-source search for the combinations "zero diagonal",
"permanent", and "sufficiently large", as well as the exact London-Minc
and Burghduff titles. The accessible statements identify order at most
four and strict local minimality in every order. No retrieved source
states an eventual all-order uniqueness theorem. This search result is
not a proof of priority; the full Burghduff paper was not available in the
retrieved material. The multicolumn estimate is explicitly excluded from
any priority claim above.

