# Stern polynomials: a zero-free unbounded part of the right half-plane

**Partial result.** Let the Stern polynomials be $S_0(z)=0,S_1(z)=1$,
$S_{2n}(z)=zS_n(z)$ and $S_{2n+1}(z)=S_n(z)+S_{n+1}(z)$. For every
positive $n$,
```math
S_n(z)\ne0\qquad(\Re z\geq1,\ |z|\geq2).
```
The Dilcher–Kidwai–Tomkins conjecture asks for all $\Re z\geq1$.
[Altizio, arXiv:2511.03847v1](https://arxiv.org/html/2511.03847v1)
establishes the disk $|z-2|\leq1$ and describes a failure of its
parabolic-element-set approach at $1+2.5i$. The result here covers that
point and the entire unbounded part, but not the remaining crescent
$\Re z\geq1,\ |z|<2,\ |z-2|>1$. It is not a full solution.

## 1. A tridiagonal test

We can assume $n$ odd and $\Im z\geq0$. For an odd index, Schinzel's
continuant formula (also Altizio's Theorem 3 and Corollary 3) represents
$S_n$ by a continuant with diagonal $G_{a_i}(z)=1+z+\cdots+z^{a_i-1}$ and
off-diagonal products $-z^{a_i}$, where $a_1,\ldots,a_k$ are the positive
binary run lengths. The row-scaled matrix, using row factors
$z^{1-a_i}$, has diagonal
```math
d_i=1+w+\cdots+w^{a_i-1},\qquad w=z^{-1},
```
and adjacent-entry products $-z^{2-a_{i+1}}$. Its determinant is also
the determinant of the symmetric tridiagonal matrix $T$ with these
diagonal entries and with both entries of edge $i,i+1$ equal to
$`i\,z^{(2-a_{i+1})/2}`$, where the leading $i$ here means $\sqrt{-1}$.
The equality follows directly from the determinant recurrence.

Set $s=|w|\leq1/2$, $\theta=\arg z\in[0,\pi/2)$, $x=\cos\theta\geq s$
and $c=\theta/2$. Call an edge *heavy* if its successor run length
$a_{i+1}$ is 1. Mark its two endpoints for every heavy edge, and set
$D_{ii}=e^{-i\theta/4}$ at marked vertices, $D_{ii}=1$ elsewhere.
Let $H$ denote the Hermitian part of $DTD$. Its diagonal entries are
$\Re(e^{-ic}d_i)$ at marked vertices and $\Re d_i$ elsewhere. A heavy
edge has pure imaginary entry $i\sqrt{|z|}$ in $DTD$, so is zero in
$H$. We prove that the diagonal of $H$ strictly exceeds the sum of
absolute values of the other entries in each row. Then $H$ is positive
definite, and $DTD$, $T$, and the original continuant are nonsingular.

## 2. Unmarked vertices

All edges incident to an unmarked vertex have successor length
$b\geq2$. For $b=2$ the absolute entry in $H$ is at most
$\sin(\theta/4)<1/2$. For $b=3$ it is at most
$\sqrt{s}\sin(3\theta/4)\leq1/2$. To see the last inequality, replace
$\theta$ by $\arccos s$, square, and use
$\cos(3\arccos(s)/2)=(2s-1)\sqrt{(1+s)/2}$. The resulting inequality
is $(1-2s)(1-2s\sqrt{(1+s)/2})\geq0$. For $b\geq4$ the entry is at most
$s^{(b-2)/2}\leq1/2$.

When $b=4$ this can be improved to $49/100$. It is automatic if
$s\leq49/100$. Otherwise $x\geq s>49/100$ implies $\theta<16/15$,
since the Taylor upper bound for $\cos(16/15)$ is less than $49/100$.
There is at most one marked endpoint, so the entry is bounded by
$s\sin(5\theta/4)\leq\sin(4/3)/2<49/100$; the Taylor upper
bound $u-u^3/6+u^5/120$ at $u=4/3$ verifies the final comparison.

For $a_i=1$, the vertex is first and has at most one edge, so
its diagonal 1 suffices. For $a_i=2$ the diagonal is $>1$.
For $a_i=3$ use $\Re(w+w^2)=sx+s^2(2x^2-1)\geq2s^4>0$.
For $a_i=4$, the real part of $w+w^2+w^3$ increases with $x$,
because its derivative is $s+4s^2x+s^3(12x^2-3)>0$. At $x=s$
it is $-s^4+4s^6\geq-1/108$. The diagonal is thus at least
$107/108$, and the incoming edge, if present, has length 4 and
entry at most $49/100$; the outgoing edge is at most $1/2$.
Their sum is at most $99/100<107/108$.
Finally, if $a_i\geq5$, its diagonal is at least
$107/108-s^4/(1-s)\geq107/108-1/8$. Its incoming edge is
at most $s^{3/2}\leq1/(2\sqrt2)$ and its outgoing edge at most
$1/2$. Their sum is strictly less than the diagonal lower bound.

## 3. Marked vertices

At least one adjacent edge is heavy, so at most one edge contributes
to the off-diagonal row sum. First handle a length-2 edge with both
endpoints marked. Its neighboring edges on both sides must be heavy:
its left endpoint has run length 1 and its right endpoint has run
length 2. Its Hermitian off-diagonal entry has absolute value
$\sin c$. The left diagonal entry is $\cos c>\sin c$. On the right
the diagonal is $\cos c+s\cos(3c)$, which is also greater than
$\sin c$. This is immediate if $\cos(3c)\geq0$. Otherwise use
$s\leq\cos(2c)$, and the identity
```math
\cos c-\sin c+\cos(2c)\cos(3c)
=(\cos c-\sin c)\{1+(\cos c+\sin c)\cos(3c)\}>0,
```
since $c<\pi/4$.

Outside that length-2 case, if $a_i=1$, the diagonal $\cos c$ exceeds
the bound $1/\sqrt2$ for any nonheavy edge. If $a_i\geq2$, its
outgoing edge is heavy and the only possible contribution is from
the incoming edge, of length $a_i$. For $a_i=2$, its absolute
entry is at most $\sin(\theta/4)$, whereas the diagonal satisfies
```math
\cos c+s\cos(3c)=\cos c(1+s(2x-1))
\geq \frac{7}{8\sqrt2}>\sin(\pi/8).
```
Here $1-s+2s^2\geq7/8$.

For higher lengths the contribution of the first three terms to the
diagonal satisfies
```math
\begin{aligned}
\Re(e^{-ic}(1+w+w^2))
&=\cos c\{1+s(2x-1)+s^2(4x^2-2x-1)\}
\\ &\geq \sqrt{(1+s)/2}\,p(s),\qquad
p(s)=1-s+s^2-2s^3+4s^4.
\end{aligned}
```
The expression in braces is increasing in $x\geq s$ and positive.
For a useful lower bound, write
$p(s)-3/4=(2s-1)(8s^3+2s-1)/4$; hence
```math
p(s)\geq 3/4-2s^3(1-2s)\geq p_0:=3/4-27/1024>1/\sqrt2.
```
For $a_i=3$ the incoming edge has absolute value at most
$\sqrt{s}\sin\theta\leq\sqrt{s(1-s^2)}$. The diagonal bound is larger,
because after squaring and cancelling $1+s$ the comparison reduces
to $p(s)^2>2s(1-s)$.

For $a_i=4$ the incoming edge has absolute value at most $s$.
The diagonal is at least $\sqrt{(1+s)/2}p(s)-s^3$, and is
greater than $s$ by the following three comparisons:
- For $s\leq21/50$, $s+s^3<1/2<p_0/\sqrt2$.
- For $21/50\leq s\leq12/25$, $`s+s^3<3/5<\sqrt{71/100}\,p_0`$.
- For $12/25\leq s\leq1/2$, $p(s)\geq37/50$ by the preceding
  $2s^3(1-2s)$ estimate, so $s+s^3\leq5/8<(37/50)^{3/2}$.

For $a_i\geq5$, the incoming edge is at most $s^{3/2}$ and the
diagonal is at least $\sqrt{(1+s)/2}p(s)-s^3/(1-s)$.
For $s\leq9/20$, the sum $s^{3/2}+s^3/(1-s)$ is less than $1/2$
(using $\sqrt{s}<7/10$). For $s\geq9/20$ that sum is at most
$`1/(2\sqrt2)+1/4<17/28<\sqrt{29/40}\,p_0`$.
These strict comparisons finish the positive-definiteness proof.
