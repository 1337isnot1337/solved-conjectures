# Maximum loneliness on a fixed relation hyperplane

Matthias Beck and Samuel Everett ask how maximum loneliness behaves statistically when the speeds satisfy a fixed integer relation. We use their uniform box model from Corollary 3.3, conditioned on that relation. This gives an explicit limiting law for every admissible hyperplane and every shift. [Beck and Everett, §4](https://arxiv.org/html/2609.06259v2#S4)

## The law

Write $\mathbb T=\mathbb R/\mathbb Z$, let $\|x\|$ denote distance to the nearest integer, and put $c=(1/2,\ldots,1/2)$. Choose a nonzero primitive normal $m\in\mathbb Z^k$, $k\ge2$. Assume $m^\perp$ contains a vector of pairwise distinct positive coordinates. Given $N$, choose $v$ uniformly among **ordered** vectors of pairwise distinct integers in $[1,N]^k$ satisfying $m\cdot v=0$. Define
$$
L(v,s)=\max_{t\in\mathbb T}\min_i\|s_i+t v_i\|,\qquad
L_m(s)=\frac12-\frac{\|m\cdot(c-s)\|}{\|m\|_1}.
$$

**Theorem.** Every sampled vector satisfies $L(v,s)\le L_m(s)$ for every $s\in\mathbb T^k$. For each fixed $\varepsilon>0$,
$$
\Pr\!\left(\sup_{s\in\mathbb T^k}\big[L_m(s)-L(v,s)\big]\ge\varepsilon\right)
=O_{m,\varepsilon}(N^{-1}).
$$
Thus a fixed shift has limiting distribution concentrated at $L_m(s)$. In particular the unshifted limit is $1/2$ if the coordinate sum of $m$ is even and $1/2-1/(2\|m\|_1)$ if it is odd. An independent Haar-uniform shift gives a uniform limiting distribution on $[1/2-1/(2\|m\|_1),1/2]$, since $m\cdot(c-s)$ is Haar-uniform on the circle. Dividing an input normal by its coordinate gcd before using the formula is essential.

The unconditioned random-speed problem was studied by Czerwiński. Giri and Kravitz study loneliness through distances from subtori to the center of the cube. The finiteness principle for subgroups avoiding an open set goes back to Lawrence. The argument below proves the connected-subgroup case it uses. We claim no priority for these tools. [Czerwiński](https://arxiv.org/abs/1102.4464) · [Giri and Kravitz](https://arxiv.org/abs/2304.01462) · [Lawrence](https://www.nist.gov/publications/finite-unions-closed-subgroups-n-dimensional-torus)

## Proof

Let $V=m^\perp$, $\Lambda=V\cap\mathbb Z^k$, and let $H$ be the image of $V$ in $\mathbb T^k$. Then $H=\{x:m\cdot x=0\pmod 1\}$. Indeed, if a lift of $x$ has integral dot product with $m$, Bézout's identity lets us subtract an integer vector with that same dot product. In particular $H=V/\Lambda$ is connected.

Use the maximum of the circular coordinate distances as the torus metric. On the circle $\|u\|=1/2-\|u-1/2\|$, so $L(v,s)$ is $1/2$ minus the distance from $c-s$ to the circle $C_v=\{tv:t\in\mathbb T\}$. That circle lies in $H$. For any $y$, the distance from $y$ to $H$ is exactly $\|m\cdot y\|/\|m\|_1$. The lower bound follows from the triangle inequality. For equality choose $b\in[-1/2,1/2]$ representing $m\cdot y$ modulo one, then subtract the vector with coordinates $b\,\mathrm{sgn}(m_i)/\|m\|_1$ from $y$. The resulting point lies in $H$. This proves the deterministic upper bound and computes the maximum on the containing torus.

We next show that a typical $C_v$ is dense to within $\varepsilon/2$ in $H$. The following argument also works inside the image $T_U$ of any rational linear subspace $U$. Fix a nonempty relatively open set $B\subset T_U$. Take a continuous nonnegative function supported in $B$ of Haar integral $a>0$. Approximate it uniformly within $a/4$ by a trigonometric polynomial restricted from the ambient torus. Such polynomials are dense by Stone–Weierstrass, since the coordinate characters separate points. A character with frequency $b\in\mathbb Z^k$ has mean one on $C_v$ exactly when $b\cdot v=0$, and mean one on $T_U$ exactly when $b\perp U$. In each other case its mean is zero.

If $v\in U$ avoids the finitely many hyperplanes $b^\perp\cap U$ arising from polynomial frequencies $b\not\perp U$, the polynomial has equal integrals on $C_v$ and $T_U$. The original function then has integral at least $a/2$ on $C_v$. Thus every circle missing $B$ has its velocity in a finite union of proper rational subspaces of $U$.

Cover $H$ by finitely many relative balls of radius $\varepsilon/4$. A circle meeting every ball comes within $\varepsilon/2$ of every point. Apply the preceding paragraph to each ball. In the sampling box, $V$ contributes $\Theta_m(N^{k-1})$ admissible lattice points. Indeed, $\Lambda$ has rank $k-1$ and the scaled region in $V$ has positive relative volume by admissibility. Its boundary and the excluded coordinate-equality hyperplanes have measure zero. A proper rational subspace contributes $O_m(N^{k-2})$ points, for instance by injecting its lattice points into a choice of independent integer coordinates. For the finite list the implicit constant can depend on $\varepsilon$. Outside their union, every distance to $C_v$ differs from the distance to $H$ by at most $\varepsilon/2$, simultaneously for all target points. This proves the theorem, including the supremum over shifts.

## Counts below a fixed threshold

For fixed $s$ and real $u<L_m(s)$, the admissible vectors with $L(v,s)\le u$ form the intersection of the sample with a finite union of proper rational subspaces of $V$. To see exact equality of sets, begin at $U=V$. If the maximum on $s+T_U$ is at most $u$, retain $U$ in full. Otherwise the points of $T_U$ where the shifted loneliness exceeds $u$ form a nonempty relatively open set. The open-set argument places every exception in a finite union of proper subspaces of $U$. Repeat inside each one. Each step reduces dimension, so the finite tree terminates. Every retained subspace satisfies the threshold everywhere. It is harmless to include or discard the zero speed vector before intersecting with the sample.

Consequently the exceptional count is a quasipolynomial in the integer $N\ge1$, of degree at most $k-2$ whenever it is nonzero. Apply inclusion–exclusion to the retained subspaces, the forbidden coordinate equalities, and the coordinate-zero faces of $[0,N]^k$. Each closed piece is the $N$-fold dilate of a rational polytope and its lattice-point count is an Ehrhart quasipolynomial. The denominator of the conditional probability is a quasipolynomial by the same argument. [Beck and Robins, *Computing the Continuous Discretely*, Chapter 3](https://matthbeck.github.io/ccd.html)

The order $N^{-1}$ can occur. On $v_1+v_2=v_3$ the unshifted limit is $1/3$. All $\lfloor N/3\rfloor$ positive multiples of $(1,2,3)$ have loneliness $1/4$. Time $1/4$ attains it, and the four points $0,t,2t,3t$ have two at circular distance at most $1/4$ by the gap principle. There are $\Theta(N^2)$ admissible triples.

## How often the endpoint is attained

Suppose $s=0$ and every $m_i$ is nonzero. Put $d=k-1$, $A=\|m\|_1$, and $Q=2$ if $A$ is even or $Q=A$ if $A$ is odd. Then
$$
\lim_{N\to\infty}\Pr\big(L(v,0)=L_m(0)\big)
=\frac{\varphi(Q)}{Q^d\prod_{p\mid Q}(1-p^{-d})}.
$$

For even $A$ the maximizing point on $H$ is $c$, of order two. For odd $A$ the two maximizing points are $c\pm\mathrm{sgn}(m)/(2A)$. Indeed equality in the distance bound requires every nonzero coefficient to use the full coordinate displacement with a consistent sign. The two points are negatives on the torus. Each has order $A$, since $(A\pm1)/2$ is coprime to $A$. Thus in both cases it suffices that the circle contain one specified point $y$ of order $Q$.

Choose a lattice basis of $\Lambda$. It identifies $H$ with $\mathbb T^d$ and identifies $y$ with $b/Q$, where $\gcd(b_1,\ldots,b_d,Q)=1$. Write $v=g w$ with $w$ primitive in $\Lambda$. Its circle is the circle of $w$. Bézout's identity for the coordinates of $w$ implies that the parameter of an order-$Q$ point on that circle has reduced denominator $Q$. Hence $y\in C_v$ exactly when $w\bmod Q$ is a unit multiple of $b$.

For $d\ge2$ the primitive directions arising from all sampled velocities are asymptotically uniform among the primitive residue classes modulo $Q$. Here are the counting details. In the chosen lattice coordinates the sample is the dilation of a fixed bounded rational region with finitely many hyperplanes removed and with positive volume $D$. In a particular primitive residue class, Möbius inversion for the common divisor gives primitive-point density
$$
\frac{D}{Q^d}\sum_{(h,Q)=1}\frac{\mu(h)}{h^d}
=\frac{D}{Q^d}\prod_{p\nmid Q}(1-p^{-d})
$$
per $N^d$. For fixed $h$ coprime to $Q$, dividing by $h$ gives one residue class in a box scaled by $N/h$. The lattice Riemann sum gives the term displayed. The scaled nonzero lattice count is $O((N/h)^d)$ for $h\le C N$ and zero thereafter, since all coordinates are bounded by $CN$ in lattice coordinates. This summable bound justifies the limit. Summing over all multiples $g w$ preserves uniformity by the same bound with $g$ in place of $h$. There are $Q^d\prod_{p\mid Q}(1-p^{-d})$ primitive classes by the Chinese remainder theorem, and precisely $\varphi(Q)$ unit multiples of $b$. In dimension one every sampled circle is $H$ and the displayed ratio equals one. This proves the endpoint formula.

For example, on $v_1+v_2=v_3$ the limiting probability of **exactly** $1/3$ is $2/(9-1)=1/4$. All but a vanishing fraction lie arbitrarily close to $1/3$.
