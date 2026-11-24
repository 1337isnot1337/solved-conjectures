# Dilcher–Kidwai–Tomkins Stern-polynomial half-plane conjecture

**Theorem.** Every zero of every Stern polynomial $S_n$, $n\geq1$,
has real part strictly less than 1. Here $S_0=0$, $S_1=1$,
$S_{2n}(z)=zS_n(z)$, and $S_{2n+1}(z)=S_n(z)+S_{n+1}(z)$.

This is the full conjecture in Conjecture 3.1 of
[Dilcher–Kidwai–Tomkins, *Zeros and irreducibility of Stern polynomials*, Publ. Math. Debrecen 90 (2017), 407–433](https://publi.math.unideb.hu/paper/2146/download/10_5486_PMD_2017_7620.pdf#page=7),
and Conjecture 1 of [Altizio, arXiv:2511.03847v1](https://arxiv.org/html/2511.03847v1).
The latter proves nonvanishing on $|z-2|\leq1$. The proof below treats
that disk itself and does not need Altizio's disk theorem.

We prove nonvanishing in three regions:
- $\Re z\geq1$, $|z|\geq2$, by a phased tridiagonal matrix
  ([EXTERIOR.md](EXTERIOR.md)).
- $\Re z\geq1$, $|z-1|\leq1/64$, by an analytic geometric-series estimate.
- The remaining compact region, by a finite exact certificate
  ([check.cpp](check.cpp)) with analytic bounds covering **all** binary
  run lengths. There is no restriction on the index $n$.

We may assume $\Im z\geq0$ by conjugation, and $n$ odd by the even-index
recurrence. The point $z=1$ is immediate from the positive Stern numbers.

## 1. A uniform local criterion

Let $G_a(z)=1+z+\cdots+z^{a-1}$. In $\Re z\geq1$, no $G_a$ vanishes.
The Reznick–Schinzel continuant formula, stated as Altizio's Theorem 3,
expresses $S_n$ for $n$ odd using binary run lengths $a_1,\ldots,a_k$.
The matrix has diagonal $G_{a_i}$ and adjacent-entry products $-z^{a_i}$.
After dividing each row by its diagonal entry, the adjacent-entry
products are $-\rho_{a_i,a_{i+1}}$, where
$$
v_a=G_a(z)^{-1},\quad h=z-1,\quad
\rho_{ab}=\frac{z^a}{G_a(z)G_b(z)}=(h+v_a)v_b.
$$
A symmetric tridiagonal matrix with unit diagonal and adjacent entries
$i\sqrt{\rho_{a_i,a_{i+1}}}$ has the same determinant, by the continuant
recurrence.

It therefore suffices to find one real $\alpha$ with $|\alpha|<\pi/2$
such that, for all positive integers $a,b$,
$$
|\rho_{ab}|-\Re(e^{-2i\alpha}\rho_{ab})\leq\tfrac12\cos^2\alpha.\tag{1}
$$
Indeed, multiply the symmetric matrix by $e^{-i\alpha}$. The diagonal
of its Hermitian part is $\cos\alpha$, and the absolute value of each
adjacent entry is $|\Im(e^{-i\alpha}\sqrt{\rho_{ab}})|\leq\cos\alpha/2$
by (1). The Hermitian form on any vector with coordinate moduli $c_j$
is at least
$$
\cos\alpha\left(\sum_j c_j^2-\sum_{j=1}^{k-1}c_j c_{j+1}\right)
=\frac{\cos\alpha}{2}
\left(c_1^2+c_k^2+\sum_{j=1}^{k-1}(c_j-c_{j+1})^2\right),
$$
strictly positive on nonzero vectors. This is the elementary finite
matrix form of Altizio's parabolic-element-set criterion. Equality in
(1) is allowed.

The classical Onishi inequality, reproduced in Altizio's Theorem 6,
states that $|G_a(z)|\geq|z|^{a-1}$ for $\Re z\geq1$. In particular,
throughout this region,
$$
|v_a|\leq1,\qquad |h+v_a|\leq|z|.\tag{2}
$$

## 2. An explicit neighborhood of 1

Let $R=|h|\in(0,1/64]$, $h=x'+iy$ with $x',y\geq0$, and
$z=r e^{i\theta}$ with $\theta\in[0,\pi/2)$. Write
$\Phi(v)=|v|-\Re v$. It is subadditive, positively homogeneous, and
bounded above by $2|v|$.

We first show that every $v_m$ satisfies
$$
\Phi(v_m)<13/27,
\qquad |v_m|\leq1/2\ (m\geq2),
\qquad |v_m|\leq10/27\ (m\geq3).\tag{3}
$$
If $|G_m|\geq5$, these statements hold at once. Otherwise write
$E=z^m-1$; then $|E|<5R$ and the convergent logarithm of $1+E$ gives
$$
|m\log z-2\pi i k|\leq\frac{5R}{1-5R}<\frac{11}{2}R
$$
for some integer $k\geq0$. If $k=0$, note that
$|\log z|\geq(1-R)R$: the logarithm series gives
$|\log z|\leq-\log(1-R)$, and
$R=|e^{\log z}-1|\leq e^{|\log z|}|\log z|$. Thus $m\leq5$.
For those $m$, the geometric series gives $|G_m-m|\leq16R$
by bounding $|z^j-1|$ by $j(1+R)^{j-1}R$. For $m\geq2$,
$$
\Phi(v_m)\leq
2|v_m-1/m|\leq\frac{32R}{m(m-16R)}<13/27.
$$
Also $|G_2|=|1+z|\geq2$, and for $3\leq m\leq5$,
$|G_m|\geq m-16R\geq 11/4>27/10$. For $m=1$ use $v_1=1$.

If $k\geq1$, then $m\theta\geq619/100$, since
$2\pi-(11/2)/64>619/100$. We have $\theta\leq R$ and
$\log r\geq x'/(1+R)$, so
$x'/R\leq(1+R)(11/2)/m\leq R$. Consequently
$$
y/R\geq1-R^2\geq4095/4096,
\quad \sin\theta/R\geq1-R\geq63/64,
\quad \sin\theta/\theta\geq4095/4096.
$$
Since $\Re z\geq1$, $\log r\geq-\log\cos\theta\geq\sin^2\theta/2$.
Also $\cos(m\theta)\geq1-(11R/2)^2/2\geq255/256$. Using
$r^m-1\geq m\log r$ now gives
$$
\frac{\Re E}{R}
=\frac{(r^m-1)\cos(m\theta)+\cos(m\theta)-1}{R}
\geq\frac{619}{200}\frac{4095}{4096}\frac{63}{64}\frac{255}{256}
-\frac{121}{512}.
$$
Since $G_m=E/h$ and $|\Im E|/R\leq5$, we obtain
$$
-\Im G_m
\geq \frac{4095}{4096}
\left(\frac{619}{200}\frac{4095}{4096}\frac{63}{64}\frac{255}{256}
-\frac{121}{512}\right)-\frac{5}{64}
=\frac{5978842155875}{2199023255552}>\frac{27}{10}.
$$
For a complex number $u$ with imaginary part of absolute value $Y>0$,
writing $q=-\Re u/|u|$ shows that
$$
\Phi(1/u)=\frac{(1+q)\sqrt{1-q^2}}{Y}\leq\frac{3\sqrt3}{4Y}.
$$
The maximum on $[-1,1]$ is at $q=1/2$. For $Y>27/10$ this is
less than $13/27$ using $\sqrt3<26/15$. This proves (3).

We check (1) with $\alpha=0$. If $b=1$,
$\Phi((h+v_a)v_b)\leq R+13/27<1/2$. If $a=1,b\geq2$,
$\Phi((1+h)v_b)\leq13/27+2R|v_b|\leq13/27+R<1/2$.
If both indices are at least 2 and one is at least 3, (3) yields
$|(h+v_a)v_b|<1/4$ and hence the result. The only remaining pair
is $a=b=2$. Here $|v_2-1/2|\leq R/4$, and
$$
|(v_2+h)v_2-1/4|
\leq (1/2+R)R/4+5R/8<R.
$$
Again $\Phi<1/2$. This finishes the region $|z-1|\leq1/64$.

## 3. Exact certificate for the compact region

The target upper-half compact region lies in the box
$[1,2]+i[0,2]$. We partition this box recursively into four dyadic
children. Boxes entirely in $|z-1|\leq1/64$ or $|z|\geq2$ are proved
already. For every other leaf we exhibit a single tangent parameter
$t=\tan\alpha=k/256$, $0\leq k\leq160$, proving (1) simultaneously
for all $z$ in that closed box and all positive $a,b$.

Here are the enclosure steps implemented in [check.cpp](check.cpp).
The unit of fixed-point arithmetic is $1/P$, $P=2^{39}$. A complex
disk has a rounded center and an **upper** radius. All square roots
and rational divisions use outward integer rounding. There is no
floating-point arithmetic in an accepting test.

1. Let $z_0$ be the box center, $\epsilon$ bound $|z-z_0|$ throughout
   the box, $L>1$ be a lower bound for $|z|$ from the lower-left corner,
   and $R_*$ bound $|z-1|$ from the upper-right corner. Boxes without
   $L>1$ are subdivided.
2. Use the exact value $v_1=1$. For $a\geq2$, approximate
   $p_0=z_0^{-a}$ by $q$ by iterated multiplication by the exact rational
   $1/z_0$, rounding each coordinate down. Since $|1/z_0|\leq1$,
   the error after $a$ multiplications is less than $2a/P$.
   If $U_a\geq L^{-a}$ is an upward-rounded bound from successive
   multiplication by $1/L$, then
   $$
   |z^{-a}-q|\leq e=2a/P+aU_a\epsilon/L.
   $$
   This follows by integrating the derivative $-a z^{-a-1}$ along
   the line segment from $z_0$ to $z$ inside the box.
3. Write $p=z^{-a}$ and $h_0=z_0-1$. Then $v_a=h p/(1-p)$. If
   $|1-q|>e$, the disk centered at $h_0q/(1-q)$ with radius
   $$
   \epsilon\frac{|q|+e}{|1-q|-e}
   +\frac{|h_0|e}{(|1-q|-e)|1-q|}
   $$
   encloses $v_a$. This is the triangle inequality after subtracting
   the two fractions, and rounding the center costs at most $2/P$.
   Independently, $|v_a|\leq \min(1,R_*U_a/(1-U_a))$ when $U_a<1$,
   by (2) and the reverse triangle inequality. The center-zero disk
   from this bound is available even if the first estimate fails.
4. Once this latter bound is small enough, one zero-centered disk
   covers **all** remaining indices $a$, because $U_a$ is nonincreasing.
   Thus the finite disk list encloses every $v_a$. Add the $h$ disk
   to get an enclosure for each $h+v_a$, then multiply paired disks.
   The product radius bound is $|A|e_B+|B|e_A+e_Ae_B+2/P$ for
   centers $A,B$ and radii $e_A,e_B$. Bounds from (2) may also
   tighten the moduli.
5. A pair with $|\rho_{ab}|\leq3/20$ satisfies (1) for every tested
   $t\leq160/256$, because $2(3/20)(1+t^2)<1/2$. We omit all such
   pairs using upper modulus bounds. For every other pair, if its
   product disk has center $q$ and radius $e$, prove
   $$
   (1+t^2)(|q|+2e)-(1-t^2)\Re q-2t\Im q\leq1/2.
   $$
   This suffices by the triangle inequality, since the coefficient
   vector of the linear functional on the error has norm $1+t^2$.
   The displayed inequality with $e=0$ and $q=\rho_{ab}$ is exactly
   (1) multiplied by $1+t^2$.

A box is accepted only when all pairs pass for the same $k$. Otherwise
the box is subdivided. The run certifies 1318 boxes and discards 51 analytically covered boxes.
It terminates at depth 15, well below its
failure limit of 19. To reproduce:
```sh
g++ -std=c++17 -O2 -Wall -Wextra check.cpp -o check
./check
```
The checker also passes with `-fsanitize=undefined
-fno-sanitize-recover=all`. All arithmetic bounds, comparisons, and
root enclosures are exact. Combined with Sections 1–2 and
[the exterior proof](EXTERIOR.md), this proves the theorem.

## Prior work and status

The 2017 paper of Dilcher, Kidwai and Tomkins formulates this conjecture
and proves it for several structured classes of indices. Altizio's
2025 preprint and dissertation reference establish disk nonvanishing;
his final section explains that using one parabola for all $\rho_{ab}$
fails at some half-plane points. Our exterior argument instead uses
phases at selected vertices; it does not require a common parabola on
that region. The remaining compact and near-$1$ regions do admit the
common parabola used above. Searches for the original author combination,
the exact half-plane statement, Altizio's paper and its subsequent
citations found no earlier full resolution. Priority is not guaranteed.
