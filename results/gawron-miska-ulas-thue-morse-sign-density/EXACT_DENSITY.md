# Exact sign density of the squared Thue–Morse series

Let $t(n)=[q^n]\prod_{j\ge0}(1-q^{2^j})^2$. On every infinite
arithmetic progression of indices, its positive coefficients
and its negative coefficients each have natural density $1/2$,
measured within that progression. In particular, **both** exceptions
in the $m=2$ instance of Gawron–Miska–Ulas Conjecture 5.8 have natural
density $1/2$, not zero. The short disproof in the companion
proof is independent of the stronger asymptotic argument below.

## 1. An averaging contraction on the circle

Set $t(-1)=0$ and $v(n)=(t(n),t(n-1))^{\mathsf T}$. As in the
short proof, $t(n)\ne0$ for $n\ge0$ and
$$
 v(2n+b)=A_bv(n),\qquad
 A_0=\begin{pmatrix}1&1\\0&-2\end{pmatrix},\qquad
 A_1=\begin{pmatrix}-2&0\\1&1\end{pmatrix}.
$$
For an invertible real matrix $A$, let $F_A:S^1\to S^1$ be the
oriented direction map $x\mapsto Ax/\|Ax\|$. Positive scalar
multiples do not change this map. Use arc length on $S^1$.
Writing the derivative in the unit angular coordinate,
$$
 |F_A'(x)|=\frac{|\det A|}{\|Ax\|^2}.
 \tag{1}
$$
This follows by taking the absolute determinant of $Ax$ and
$Ax'$ for a unit tangent $x'$ and then dividing by $\|Ax\|^2$.

Let the bit choices be independent and equiprobable. The four
two-bit normalized matrices are $B=A_jA_i/2$ for $i,j=0,1$,
each with determinant one. If $x=(a,b)$ is unit and $p=ab$,
the product of their four squared norms is
$$
 \prod_B\|Bx\|^2
 =\frac{(5+6p)^2(17-36p+260p^2)}{256}.
 \tag{2}
$$
Indeed, before division by $2$ in each matrix the squared
norms are $a^2-2ab+17b^2$, $5a^2+6ab+5b^2$ twice, and
$17a^2-2ab+b^2$; use $a^2+b^2=1$.
The numerator in (2) is strictly larger than $256$ throughout
$[-1/2,1/2]$. Its derivative is
$8(6p+5)(10p+3)(78p+1)$, so its minimum is at one of
$-1/2,-1/78,1/2$. At $-1/2$ and $1/2$ it is $400$ and $4096$.
At $-1/78$, use $5+6p=64/13>4$ and
$17-36p+260p^2>17$ to get a value larger than $272$.

Consequently the average of $\log \|Bx\|^2$ is uniformly
positive. As there are only four matrices and the circle is
compact, Taylor expansion at $\alpha=0$ gives some
$0<\alpha\le1$ and $\rho<1$ such that
$$
 \frac14\sum_B |F_B'(x)|^\alpha
 =\frac14\sum_B\|Bx\|^{-2\alpha}\le\rho
 \qquad (x\in S^1).
 \tag{3}
$$

Fix an odd positive modulus $Q$. On $S^1\times(\mathbb Z/Q\mathbb Z)$,
define the two transitions
$$
 T_i(x,r)=(F_{A_i}(x),2r+i),\qquad
 (Pf)(x,r)=\tfrac12(f(T_0(x,r))+f(T_1(x,r))).
$$
Here and below the second coordinate is reduced modulo $Q$.
Let $[f]_\alpha$ be the maximum of the $\alpha$-Hölder
seminorms of its $Q$ restrictions to the circle. There is
$\rho'<1$ and a constant $C$ such that
$$
 [P^2f]_\alpha\le \rho'[f]_\alpha+C\|f\|_\infty.
 \tag{4}
$$
For nearby circle points $x,y$ in the same residue state, apply
each two-bit map along the short arc. The $\alpha$th power of
the arc-length ratio is bounded by the maximum of
$|F_B'|^\alpha$ on that short arc. Uniform continuity for the
finitely many derivatives and (3) bound the average of these
maxima by some $\rho'<1$ when the arc is sufficiently short.
The end states for a fixed word agree, so this bounds the
difference of the function values by
$\rho'[f]_\alpha\,\operatorname{dist}(x,y)^\alpha$.
For arcs longer than that fixed threshold use
$2\|f\|_\infty$ instead. This proves (4). Since $P$ does not
increase $\|f\|_\infty$ and each one-step map is Lipschitz on
the circle, (4) implies a uniform bound on $[P^n f]_\alpha$
for every fixed Hölder $f$, over all $n\ge0$.

## 2. All directions are approximated at a fixed depth

Let $B=A_1A_0/2$. Its determinant is one and its trace is $-3/2$,
so it is real-linearly conjugate to a rotation through an angle
$\theta$ with $2\cos\theta=-3/2$. The angle is an irrational
multiple of $\pi$: otherwise the sum of two roots of unity
$e^{i\theta}+e^{-i\theta}$ would be a rational algebraic integer
that is not an integer. Conjugacy induces a homeomorphism of the
oriented circle, so $F_B$ and every positive power have dense
orbits there.

Choose $L\ge1$ so that $4^L\equiv1\bmod 3Q$; such $L$ exists
because $Q$ is odd. Appending the word consisting of $L$ copies
of $01$ sends an integer $n$ to $4^Ln+(4^L-1)/3$, which preserves
every residue modulo $Q$. Its map on directions is
$H=F_B^L$, still conjugate to an irrational rotation, and its
word length $h=2L$ is even. A word of $h$ zeros also preserves
residue zero.

We claim that, given any $\epsilon>0$, some single depth $K$
has this property: **from every starting direction and state,
the directions reachable by exactly $K$ bits are an
$\epsilon$-net in each target state**. To prove this, fix a word
length $s$ with $2^s\ge Q$. Any start state can reach zero with
an appropriate $s$-bit suffix, since the suffix value may
be any integer in $[0,2^s)$. Similarly any target state can be
reached from zero by an $s$-bit suffix. For each target choose
one such suffix once and for all, and let $J_r$ be its
continuous bijection on directions.

After reaching state zero, use either $h$ zeros or the word
for $H$. Their two images of any direction cannot both lie on
the repelling eigenline $\mathbb Re_1$ of $A_0$: the zero word
preserves that line with no other preimage, whereas $H$ fixes
no line. Compactness gives a uniform lower bound $\delta>0$
for the distance from the line of at least one of the two
images. Choose one which is at least $\delta$ away, and call
that image $y$.

The other eigenvalue of $A_0$ is $-2$ and has unit eigenvector
$u=(1,-3)/\sqrt{10}$. Long even zero words send $y$ uniformly
near either $u$ or $-u$, determined by the sign of its
coefficient along $u$ in the eigenbasis. This is uniform away
from the repelling eigenline: the coefficient along $u$ is
bounded below in absolute value, the other coefficient is
bounded, and their ratio after the word is multiplied by
$2^{-j}$ for an even zero length $j$.

Choose $J$ so that, for both possible signs and every target
$r$, the finite sequence
$$
 \{J_r H^j(\pm u):0\le j\le J\}
$$
is an $\epsilon/2$-net. This is possible by density of every
$H$-orbit and compactness. Choose a sufficiently large even
$E$ so that for every $j\in[0,J]$ the zero word of length
$E+(J-j)h$, followed by $H^j$ and the target suffix, gives a
direction within $\epsilon/2$ of $J_rH^j(\pm u)$.
There are finitely many post-compositions here and the
convergence from the previous paragraph is uniform, so one
$E$ suffices. Every constructed complete word has length
$K=2s+h+E+Jh$, regardless of $j$, of the chosen
repeller-avoidance word, and of the start and target states.
Its end direction approximates the specified net point in the
target state. This proves the claim.

## 3. Uniform convergence, no atoms, and natural density

Let $f$ be a real Hölder function on the circle and residue
states and put $f_n=P^n f$. From (4), all the $f_n$ have a
common Hölder bound. For any $\eta>0$, choose $\epsilon$
so that their values at directions within $\epsilon$ in the
same state differ by at most $\eta$. Use the fixed depth $K$
from the claim. From every start there is at least one word
of length $K$ whose end is within $\epsilon$ of a minimum
point of $f_n$, in its residue state. That word has probability
$2^{-K}$. Writing $M_n=\max f_n$, $m_n=\min f_n$, gives
$$
 M_{n+K}\le M_n-2^{-K}(M_n-m_n-\eta).
$$
Also $M_n$ decreases and $m_n$ increases. Taking limits yields
$\lim_n(M_n-m_n)\le\eta$, hence the oscillation tends to zero.
Thus $P^n f$ converges uniformly to a constant. Approximation
by Hölder functions and sup-norm contraction extend this to
every continuous $f$. The limiting constants define a
stationary probability measure $\mu$ (the positive
norm-one functional on continuous test functions).

The stationary measure is symmetric under $x\mapsto-x$,
since the transition commutes with that map and the uniform
limit is constant; equivalently stationarity is unique by
uniform convergence. Its residue marginal is uniform: for
odd $Q$ each state transition $r\mapsto2r+i$ is a permutation,
so uniform is stationary, and reachability in fixed depth
gives uniqueness (or just use the asymptotic uniform residue
count over all binary suffixes).

The circle marginal has no atoms. It is stationary under the
average of the two direction maps. If it had atoms, the
finite nonempty set of atoms of largest mass would be
invariant under both inverse maps: stationarity at a
maximal-mass point implies both preimage atoms have the same
mass. As the maps are bijections, the finite set would
also be invariant under each forward map and under $H$,
contradicting irrational rotation. In particular, a given
line, which meets the circle in two points, has measure zero.

For an open half-circle $U$ and a residue $r$, the indicator
of $U\times\{r\}$ can now be sandwiched by continuous functions
whose integrals differ arbitrarily little, since the boundary
consists of two points in that residue. Thus the uniform
transition convergence extends to that indicator, with limit
$1/(2Q)$ by antipodal symmetry. The conclusion applies to
**any** open half-circle, not just $x_1>0$.

For any aligned dyadic block $[a2^j,(a+1)2^j)$, its $2^j$
integers arise by appending a uniform random $j$-bit suffix
to $a$. Start the transition from the direction of $v(a)$
and the residue of $a$. The preceding uniform convergence
shows that the fraction in this block with residue $r$ and
direction in a chosen open half-circle tends to $1/(2Q)$
as $j\to\infty$, uniformly in $a$. Decompose $[0,N)$
into aligned dyadic blocks with at most one of each size.
The blocks with $j<J_0$ have total length less than
$2^{J_0}$, and all larger blocks can be made as accurate
as desired by taking $J_0$ large. This proves the same
natural density $1/(2Q)$ among all indices. Thus the
conditional density within each odd-modulus progression
is $1/2$ for either sign, or for either direction half-circle.

For a general modulus $q=2^s Q$ with $Q$ odd, write the residue
representative $r=2^s b+c$, $0\le c<2^s$, $0\le b<Q$. The indices
in that progression are exactly $n=2^s a+c$ with $a\equiv b\bmod Q$.
Appending the fixed $s$ bits of $c$ multiplies $v(a)$ by an invertible
matrix. The test that the first coordinate of its image is positive
is membership of the direction of $v(a)$ in an open half-circle,
and the negative test gives the opposite half-circle. Applying
the previous conclusion to $a$ proves the claimed conditional
natural densities for every modulus, including pure powers of
two with $Q=1$.

## Source

The original sign-density conjecture and the two square-series
recurrences are in [Gawron–Miska–Ulas, Monatshefte Math. 185
(2018), 307–360](https://doi.org/10.1007/s00605-017-1041-2),
Conjecture 5.8 and Lemma 6.1. Their Theorem 6.3 pairs opposite
values in the unrestricted sequence. Here the conclusion is
for every arithmetic progression, by an oriented-circle
argument; no theorem on random matrix products is used.
