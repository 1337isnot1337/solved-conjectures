# Hajdu–Sárközy’s shifted-products conjecture

**Result.** For every pair of integers $k,\ell\ge2$, the set
```math
\{x^k y^\ell+1:x,y\in\mathbb N\}
```
is totally m-primitive: no set of positive integers differing from it
at only finitely many values is a product set $AB$ with
$|A|,|B|\ge2$. This is Conjecture 1 of Hajdu and Sárközy’s
[*On multiplicative decompositions of polynomial sequences, II*](https://www.impan.pl/shop/en/publication/transaction/download/product/112684)
(2018). Their Remark 2 settles $\gcd(k,\ell)>1$ and their Problem 2′
calls out the residual family $k=2$ and odd $\ell>1$.

We prove a stronger perturbation theorem that covers every pair
and every fixed nonzero shift. The proof uses the geometric-rectangle
argument for single shifted powers and extends it to a summable
family of scaled powers. For a fixed pair of candidate factors, the
two edges can have *different* scales; this is the key extra case.

## 1. A summable-family theorem

Let $k\ge2$, let the integer $c$ be nonzero, and let $Q$ be a
nonempty set of positive integers with $\sum_{q\in Q}q^{-1/k}<\infty$.
Write $\alpha=1/k$ and define
```math
P_q=\{q u^k+c:u\in\mathbb N\}\cap\mathbb N,
\qquad P=\bigcup_{q\in Q}P_q.
```
Suppose $R\subseteq\mathbb N$ satisfies
```math
|(R\setminus P)\cap[1,X]|=o(X^\alpha),\qquad
\limsup_{X\to\infty}\frac{|R\cap P\cap[1,X]|}{X^\alpha}>0.
\tag{1}
```
Then $R$ is totally m-primitive.

For $T\ge1$, use $P_{\le T}=\bigcup_{q\in Q,\,q\le T}P_q$ and
$\tau_T=\sum_{q\in Q,\,q>T}q^{-\alpha}$, so $\tau_T\to0$. Counting
the possible $u$ for each coefficient, for every $X\ge|c|$ we have
```math
|(P\setminus P_{\le T})\cap[1,X]|
\le (X+|c|)^\alpha\tau_T
\le (2X)^\alpha\tau_T. \tag{2}
```
This bound does not require unique coefficients or representations.

### Mixed coefficients on two rows

Suppose $a<a'$, $b<b'$ and for fixed positive integers $q,r$ all of
$ab,ab'$ lie in $P_q$ and all of $a'b,a'b'$ lie in $P_r$. Then the
ratio of each of the shifted products to its row coefficient is a
positive $k$th power. In particular, the positive integers $s,t$
defined by
```math
s^k=\frac{(ab-c)(a'b'-c)}{qr},\qquad
t^k=\frac{(ab'-c)(a'b-c)}{qr}
```
exist and are distinct, since
```math
qr(s^k-t^k)=-c(a'-a)(b'-b).
```
If $ab\ge2|c|$, the difference-of-powers formula gives
```math
\begin{aligned}
|c|(a'-a)(b'-b)
&\ge k(qr)^{1/k}(ab-c)^{2-2/k}\\
&\ge 2(ab-c)\ge ab .
\end{aligned} \tag{3}
```
Here the first inequality uses
$\min(s,t)\ge (ab-c)^{2/k}(qr)^{-1/k}$. Thus for fixed $a<a'$
we may choose a real $\eta>0$ with $|c|(a'-a)\eta<a$.
For any fixed ordered coefficient pair $(q,r)$, there is at most
one common $b$ in each interval $[(1+\eta)^j,(1+\eta)^{j+1})$
once $ab\ge2|c|$. Such common values up to $X$ therefore number
$O_{a,a',c}(\log(2X))$, uniformly in $q,r$.

Suppose now, for a contradiction, that $R=AB$ with $|A|,|B|\ge2$.
Choose $a<a'$ in $A$. For $b\in B\cap[1,X]$ with both products
$ab,a'b$ in $P_{\le T}$, the preceding bound sums over at most
$|Q\cap[1,T]|^2$ ordered coefficient pairs. All other $b$ give a
value outside $P$ or in $P\setminus P_{\le T}$ at one of the two
fixed multipliers. Each multiplier map is injective. By (1) and (2),
with $D(X)=|D\cap[1,X]|$ for any set $D$,
```math
\limsup_{X\to\infty}\frac{B(X)}{X^\alpha}
\le 2(2a')^\alpha\tau_T.
```
The logarithmic term disappears because $T$ is fixed. Now let
$T\to\infty$, obtaining $B(X)=o(X^\alpha)$.
Exchanging the factors proves $A(X)=o(X^\alpha)$.

### Covering a fixed coefficient with sparse factors

Fix $q\in Q$ and set $\rho=1+1/(2|c|)$. In the bipartite graph
with edge condition $ab\in P_q$, the rectangle of intervals
$[\rho^i,\rho^{i+1})$ and $[\rho^j,\rho^{j+1})$ is four-cycle-free
if $\rho^{i+j}\ge2|c|$. Indeed (3) applies with both coefficients
equal to $q$, and the left side of (3) is then strictly smaller
than $|c|(\rho-1)^2ab\le ab/4$.

For clarity, the geometric edge sum gives
$|(AB)\cap P_q\cap[1,X]|=o(X^\alpha)$ as follows. Put
$L=\lfloor\log_\rho X\rfloor$, and let $m_i,n_j$ be the counts of
$A,B$ in the indicated intervals. All relevant pairs have $i+j\le L$.
Finitely many small rectangles excluded above contribute $O_c(1)$.
A four-cycle-free bipartite graph with parts $m,n$ has at most
$m\sqrt n+n$ edges, by Cauchy–Schwarz and
$\sum_v\binom{\deg v}{2}\le\binom m2$ over the $n$-part.
For $i\le j$ the first term sums to at most a constant times
```math
\sum_{i\le L/2}\rho^{\alpha i}
                 \rho^{\alpha(L-i)/2}
=O(X^{3\alpha/4}),
```
using $m_i=O(\rho^{\alpha i})$, $n_j=O(\rho^{\alpha j})$ and summing
the geometric series over $j$. The linear terms sum to at most
$\sum_{i\le L/2}B(\rho^{L-i+1})=o(X^\alpha)$: the little-oh
is uniform for arguments at least $\rho^{L/2}$ and the geometric
weights $\rho^{-\alpha i}$ are summable. Exchange $A,B$ for the
region $i>j$. This bounds the number of representations and hence
also the number of distinct values.

For every fixed $T$ we may sum this little-oh over the finitely
many $q\le T$. Using (2) for the tail gives
```math
\limsup_{X\to\infty}
\frac{|(AB)\cap P\cap[1,X]|}{X^\alpha}
\le 2^\alpha\tau_T.
```
Let $T\to\infty$ to contradict the second condition in (1).
Finite modifications of $R$ preserve both conditions, proving
the theorem.

## 2. Apply to the conjecture

Let $2\le k\le\ell$ by symmetry. For $k<\ell$ take
$Q=\{y^\ell:y\in\mathbb N\}$; the required sum converges since
$\ell/k>1$. The resulting set $P$ is
$\{x^k y^\ell+c:x,y\in\mathbb N\}\cap\mathbb N$.
If $k=\ell$, use $Q=\{1\}$, because $x^k y^k=(xy)^k$ and
every positive integer is a possible $xy$. In both cases the
choice $y=1$ supplies $X^{1/k}+O_{k,c}(1)$ retained values
of $P$ up to $X$ before perturbation.

Thus every perturbation $R$ with
$|(R\triangle P)\cap[1,X]|=o(X^{1/k})$ satisfies (1) and is
totally m-primitive. Taking $c=1$ gives the full original
conjecture. The same argument works for any finite product of
powers with exponents at least two: collapse all variables
whose exponent is the minimum into one variable, and sum the
inverse minimum-th roots of the remaining coefficient products
using a finite product of convergent series.

## Sources and priority

- L. Hajdu and A. Sárközy, [*On multiplicative decompositions of
  polynomial sequences, II*](https://www.impan.pl/shop/en/publication/transaction/download/product/112684),
  Acta Arith. 186 (2018), 191–200, Conjecture 1 and Remark 2.
  The published conjecture is about all $k,\ell>1$, not just
  the separately highlighted $(2,3)$ instance.
- L. Hajdu and A. Sárközy, [*On multiplicative decompositions of
  polynomial sequences, III*](https://math.unideb.hu/sites/default/files/inline-files/poly3_revised.pdf),
  Acta Arith. 193 (2020), 193–216, Definition 1.6 and Section 7.
  The latter still discusses bivariate shifted products as an
  open direction, citing the conjecture in part II.
- C. H. Yip, [*Multiplicative irreducibility of small perturbations
  of the set of shifted k-th powers*](https://doi.org/10.1007/s00493-025-00193-9),
  Combinatorica 46 (2026), article 1. This is about the single-
  variable shifted powers and uses bipartite graph bounds; its
  theorem for $k\ge3$ is not a resolution of this bivariate question.

Exact searches through November 24, 2026 for the title, authors,
formula, coprime exponent scope, and total m-primitivity did
not identify an earlier proof of the full bivariate statement.
This records the search, not a guarantee of priority.
