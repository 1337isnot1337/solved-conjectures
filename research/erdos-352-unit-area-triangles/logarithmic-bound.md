# A polylogarithmic box bound for Erdős problem 352

**Theorem.** Every measurable $A\subseteq[0,R]^2$ avoiding triangles of area one satisfies
```math
 |A|\ll \bigl(1+\log(2+R)\bigr)^2 .
```
The constant is absolute. This improves the [linear estimate](radon-bound.md) by using the positions at which each line projection vanishes. The bound in [Bulj and Kovač, Theorem 2](https://arxiv.org/abs/2605.30033) grows as $R^2(\log\log R/\log R)^{1/2}$. [Erdős problem 352](https://www.erdosproblems.com/352) asks for an absolute constant independent of the square.

## A one-dimensional inequality

Let $I$ be an interval of length $L$ and suppose $u\in L^2(I)$ vanishes on a measurable subset $Z$ of measure at least $\delta L>0$. Then
```math
 \int_I |u|^2\le C L\log(2/\delta)
 \int_I\int_I\frac{|u(x)-u(y)|^2}{|x-y|^2}\,dx\,dy .
```
Write $E_I$ for the double integral. Rescale to $L=1$, which leaves $E_I$ unchanged. For each dyadic subinterval $J$ let $a_J$ be half the difference of the averages of $u$ on its two children. Jensen on the two children gives
```math
 |a_J|^2\le |J|^{-2}
 \int_{J_{\rm left}}\int_{J_{\rm right}}|u(x)-u(y)|^2\,dx\,dy .
```
The rectangles on the right for different $J$ are disjoint and $|x-y|\le|J|$ on each of them, so $\sum_J |a_J|^2\le E_I$. Put $\mu=1_Z~dx/|Z|$. Along a dyadic chain each increment of the mean equals $a_J$ or $-a_J$. On integration against $\mu$ the corresponding coefficient has magnitude at most $\mu(J)$. At level $j$,
```math
 \sum_{|J|=2^{-j}}\mu(J)^2\le\min(1,2^{-j}/\delta).
```
Summing over $j$ costs $O(\log(2/\delta))$. Cauchy–Schwarz on the dyadic increments bounds the squared difference between the mean on $I$ and the mean under $\mu$ by $C E_I\log(2/\delta)$. The terminal dyadic averages converge to $u$ in $L^2(I)$, hence also in $L^1(\mu)$ for this fixed set $Z$. Its mean under $\mu$ equals zero. Finally $\int_I|u-u_I|^2\le E_I$ gives the stated inequality.

## Lines, pairs and missing parallel lines

Use the notation $P_\theta(s)$ for the section length and $G_\theta(s,d)$ for its overlap with its translate by distance $d$, as in the [Fourier-slice calculation](radon-bound.md). By inner regularity take $A$ compact and put $M=|A|$. Two identities will be used. First, polar coordinates for the difference of two points of $A$ give
```math
 M^2=2\int_0^\pi\int_{\mathbb R}\int_0^\infty
 d\,G_\theta(s,d)\,dd\,ds\,d\theta .
```
For the factor two, negative and positive displacements have equal overlaps on each line. Second, one-dimensional Plancherel followed by polar coordinates gives
```math
 \int_0^\pi E_{\mathbb R}(P_\theta)\,d\theta=4\pi^2M .
```
Indeed, the integral of $|e^{2\pi i h\xi}-1|^2/h^2$ over $h\in\mathbb R$ is $4\pi^2|\xi|$ and $\widehat P_\theta(\xi)=\widehat{1_A}(\xi n_\theta)$. This identity counts angular measure on a half-turn.

Fix an angle, abbreviate $P=P_\theta$ and $G=G_\theta$, and take a dyadic scale $D\ge1$. Put $L=1/D$ and choose $0<\eta\le1/2$. Call $s$ good at this scale if
```math
 |\{d\in[D,2D]:G(s,d)>0\}|\ge\eta D .
```
Partition the $s$-axis into intervals $J=[jL,(j+1)L)$. If $J$ contains a good $s$, then $P$ is zero on a subset of $I_J=[jL,(j+3)L]$ of length at least $\eta L/2$. Indeed the abscissas $s+2/d$ for the indicated distances all belong to $I_J$, their derivative in absolute value is at least $1/(2D^2)$, and a point on any such parallel line would complete a triangle of area one. The one-dimensional inequality and bounded overlap give
```math
 \int_{\{s\ {\rm good}\}} P(s)^2\,ds
 \le C L\log(2/\eta) E_{\mathbb R}(P).
```
Here each pair of real numbers is in at most four of the squares $I_J\times I_J$, independently of the scale. On a good line the integral of $dG(s,d)$ over $[D,2D]$ is at most $D P(s)^2$, since $\int_0^\infty G(s,d)~dd=P(s)^2/2$. On a bad line use $G\le P$ and the support length $<\eta D$ to bound that integral by $2\eta D^2 P(s)$. Thus
```math
 \int_{\mathbb R}\int_D^{2D}d\,G(s,d)\,dd\,ds
 \le C\log(2/\eta) E_{\mathbb R}(P)+2\eta D^2M .
```

## Summing the scales

The contribution from $0<d<1$ is at most $M/2$ at each angle. There are $O(1+\log(2+R))$ dyadic scales starting at $D\ge1$ below the diameter bound $\sqrt2 R$. Their squared lengths sum to $O(1+R^2)$. Take $\eta=(2+R)^{-2}$, sum the scale estimates and integrate over $\theta$. The two identities now give
```math
 M^2\le C M\bigl(1+\log(2+R)\bigr)^2 .
```
This proves the theorem. By rescaling, a set avoiding area $t$ in a square of side $R$ has area $O(t(1+\log(2+R/\sqrt t))^2)$. An area-preserving affine change gives the corresponding estimate in any parallelogram of the same area. [Koizumi's disk reduction](https://jkoizumi144.com/notes/erdos352.pdf) therefore gives $O(N(1+\log(2+N))^2)$ points for an arbitrary $N$-avoiding lattice set. The two logarithms arise from the number of pair-length scales and the fraction of an interval occupied by the forced zero set.
