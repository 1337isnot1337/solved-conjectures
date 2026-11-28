# A linear bound in the side length for arbitrary measurable sets

**Theorem.** Suppose $A\subseteq[0,R]^2$ is Lebesgue measurable and contains no triangle of area $t>0$. Then
```math
 |A|\le 2\pi R\sqrt t .
```
In particular, for unit area the bound is linear in $R$. [Bulj and Kovač, Theorem 2](https://arxiv.org/abs/2605.30033) gave $O(R^2\sqrt{\log\log R/\log R})$ for this same unrestricted triangle class. [Erdős problem 352](https://www.erdosproblems.com/352) asks whether there is a bound independent of $R$.

## Translation of the line integrals

By inner regularity it suffices to prove the estimate for compact $A$. Write $f=1_A$, $M=|A|$, and use angular measure $d\theta$ on $0\le\theta<\pi$. Let $e_\theta=(\cos\theta,\sin\theta)$ and let $n_\theta$ be its positive quarter-turn. The line with normal coordinate $s$ carries the one-dimensional function $F_{\theta,s}(x)=f(sn_\theta+xe_\theta)$. Write
```math
 P_\theta(s)=\int F_{\theta,s}(x)\,dx,\qquad
 G_\theta(s,d)=\int F_{\theta,s}(x)F_{\theta,s}(x+d)\,dx .
```
If $d>0$ and $G_\theta(s,d)>0$, the line contains two points of $A$ a distance $d$ apart. Every point on the parallel line of normal coordinate $s+2t/d$ forms a triangle of area $t$ with that pair. Hence $P_\theta(s+2t/d)=0$. Since $0\le G_\theta(s,d)\le P_\theta(s)$, this proves the pointwise inequality
```math
 G_\theta(s,d) P_\theta(s)
 \le |P_\theta(s+2t/d)-P_\theta(s)|^2 .
```
By symmetry and Fubini the integral of $G_\theta(s,d)$ over $d>0$ equals $P_\theta(s)^2/2$. Integration therefore yields
```math
 \tfrac12\int_0^\pi\int_{\mathbb R} P_\theta(s)^3\,ds\,d\theta
 \le \int_0^\pi\int_0^\infty\int_{\mathbb R}
 |P_\theta(s+2t/d)-P_\theta(s)|^2\,ds\,dd\,d\theta .
```

## Exact Fourier integral

With Fourier kernel $e^{-2\pi i x\xi}$, direct change of coordinates gives the slice identity $\widehat P_\theta(\xi)=\widehat f(\xi n_\theta)$. The sections are bounded and compactly supported here, so one-dimensional Plancherel applies to each projected function. The squared multiplier integrates exactly:
```math
 \int_0^\infty |e^{4\pi i t\xi/d}-1|^2\,dd
 =4\pi t|\xi|\int_0^\infty\frac{2(1-\cos u)}{u^2}\,du
 =4\pi^2t|\xi| .
```
The last scalar integral equals $\pi$, for example by Plancherel on the indicator of an interval. Tonelli and polar coordinates now identify the right side of the preceding inequality with
```math
 4\pi^2t\int_0^\pi\int_{\mathbb R}
 |\widehat f(\xi n_\theta)|^2 |\xi|\,d\xi\,d\theta
 =4\pi^2t\int_{\mathbb R^2}|f|^2=4\pi^2tM .
```
Signed radial frequency and a half-turn of normals count each nonzero planar frequency once.

## The geometric bound

Let $W_\theta$ be the projection width of the square in normal direction $n_\theta$. At every angle $\int P_\theta=M$, so Hölder gives $\int P_\theta^3\ge M^3/W_\theta^2$. The width is $R(|\sin\theta|+|\cos\theta|)$, and
```math
 \int_0^\pi\frac{d\theta}{W_\theta^2}=\frac{2}{R^2},
```
by integrating $(\cos\theta+\sin\theta)^{-2}$ over the first quadrant. Combining the bounds gives $M^3/R^2\le4\pi^2tM$, as required.

An area-preserving affine map takes a parallelogram of area $V$ to a square of side $\sqrt V$. Applying the theorem to the intersection of $A$ with any such parallelogram bounds its mass there by $2\pi\sqrt{tV}$. In [Koizumi's lattice formulation](https://jkoizumi144.com/notes/erdos352.pdf), an $N$-avoiding set has diameter below $N$, and the disjoint disks of radius $1/(3\sqrt N)$ about its rescaled points avoid unit-area triangles. They fit in a square of side at most $\sqrt N+2/(3\sqrt N)$, so the theorem gives $O(N^{3/2})$ points. The full conjecture requires $O(N)$.
