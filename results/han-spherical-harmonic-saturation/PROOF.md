# Han’s simultaneous spherical-harmonic saturation problem

**Result.** Problem 1 in Xiaolong Han, [*Orthonormal bases of spherical harmonics with maximal $`L^p`$ norm growth*, arXiv:2609.14023v3](https://arxiv.org/html/2609.14023v3), has an affirmative answer. For each sphere dimension $`n\ge2`$ and degree $`k\ge1`$, there is a single real orthonormal basis of degree-$`k`$ spherical harmonics whose every member attains the sharp order of the $`L^p`$ estimate for every $`2<p\le\infty`$ simultaneously. The constants depend only on $`n,p`$, not on the degree or the basis member.

Han's Theorems 1.2 and 1.3 already provide whole bases separately for the ranges above and below the critical exponent; their coexistence in one basis is exactly the additional question in Problem 1. The proof here uses Han's zonal and Gaussian beam families, as well as the idea of pairing a large orthonormal set with its orthogonal complement as in Lemma 2.7. The new finite-dimensional step keeps simultaneous absolute correlations with two families throughout that construction. The scoped [priority record](PRIORITY.md) does not identify an earlier solution of this simultaneous problem.

## 1. A real simultaneous selection lemma

Let $`E`$ be a real Hilbert space of dimension $`m\ge1`$. Let there be two families of unit vectors, each carrying a probability measure such that
```math
  \int w\otimes w\,d\nu(w)=\frac1m I_E.
```
Then there is an orthonormal basis whose every member has absolute inner product at least $`c_0=\tfrac12\sin(\pi/16)>0`$ with some member of each family. The witnesses may depend on the basis member and need not be distinct.

To prove this, first construct $`\lceil m/2\rceil`$ orthonormal vectors inductively. Let $`U`$ be the orthogonal complement of those already chosen. At each such step $`\dim U\ge m/2`$. For either family,
```math
 \int\|P_U w\|^2\,d\nu(w)=\frac{\dim U}{m}\ge\frac12.
```
Thus select a witness from each family with projected norm at least $`1/\sqrt2`$. Let $`a,b`$ be their normalized projected directions, changing the sign of $`b`$ so that $`\langle a,b\rangle\ge0`$. The unit vector $`(a+b)/\|a+b\|`$ has inner products at least $`1/\sqrt2`$ with both of these directions. It therefore has absolute correlation at least $`1/2`$ with both original witnesses. Choose this vector and continue in its orthogonal complement.

Complete the orthonormal set arbitrarily. Pair each added vector with a different previously chosen vector, possible since at least half the vectors are already chosen. In such a pair plane, each of the two witnesses for the previously chosen vector has a projected norm at least $`1/2`$. Let $`\theta`$ parameterize an orthonormal pair in this plane. For a witness whose projected direction has angle $`\alpha`$, the two absolute correlations divided by its projected norm are $`|\cos(\theta-\alpha)|`$ and $`|\sin(\theta-\alpha)|`$. On the parameter circle of length $`\pi/2`$, the bad set on which either falls below $`\sin(\pi/16)`$ has length $`2(\pi/16)=\pi/8`$. The union of the bad sets for the two witnesses has length at most $`\pi/4`$, strictly smaller than the parameter circle. Consequently some rotation of the pair makes both vectors correlate by at least $`c_0`$ with both witnesses. Make these rotations separately in the disjoint orthogonal pair planes and keep any unpaired vectors unchanged. The result is the required full basis.

## 2. The two witness families on the sphere

Equip $`\mathbb S^n`$ with normalized area measure and let $`E=\mathcal H_k(\mathbb S^n;\mathbb R)`$, $`m=\dim E\asymp_n k^{n-1}`$. Write $`Z_x`$ for the normalized zonal harmonic at $`x`$. The reproducing-kernel identity is
```math
   u(x)=\sqrt m\,\langle u,Z_x\rangle\quad(u\in E).
```
Integrating its square over $`x`$ shows that $`\int Z_x\otimes Z_x\,dx=I/m`$. This also follows from the continuous tight-frame identity in the remark after Han's Lemma 2.6.

For the other family, take the unit real part of a highest-weight harmonic $`(x_1+ix_2)^k`$ and rotate it by all $`R\in\mathrm{SO}(n+1)`$; denote the results by $`Q_R`$. Han's Lemma 2.2 gives their same isotropy identity with normalized Haar measure. For clarity, the average of the rank-one projectors commutes with all rotations; its eigenspaces are invariant under the irreducible rotation representation on real harmonics of fixed degree. It is therefore scalar, and its trace is one. This yields $`I/m`$.

Apply the selection lemma. For each resulting unit basis vector $`u`$, choose its two witnesses $`Z_x,Q_R`$ satisfying
```math
   |u(x)|\ge c_0\sqrt m,\qquad |\langle u,Q_R\rangle|\ge c_0.
```
The choices and the basis do not involve $`p`$.

## 3. Sharp norm bounds simultaneously

Put $`p_c=2(n+1)/(n-1)`$. For $`p\ge p_c`$, the zonal witness and Han's gradient estimate (Lemma 2.3),
```math
  \|\nabla u\|_\infty\le \sqrt{k(k+n-1)}\sqrt m,
```
give $`|u|\ge c_0\sqrt m/2`$ throughout a geodesic ball centered at $`x`$ of radius $`\asymp_n k^{-1}`$. Its volume is $`\asymp_n k^{-n}`$, giving
```math
   \|u\|_p\gtrsim_{n,p} k^{(n-1)/2-n/p},
```
including $`p=\infty`$ with $`1/p=0`$.

For $`2<p\le p_c`$, Hölder's inequality and Han's Lemma 2.1 for rotated Gaussian beams give
```math
   c_0\le |\langle u,Q_R\rangle|
       \le \|u\|_p\|Q_R\|_{p'},
   \qquad
   \|Q_R\|_{p'}\asymp_{n,p}
      k^{(n-1)/4-(n-1)/(2p')}
      = k^{-((n-1)/4-(n-1)/(2p))}.
```
Here $`p'=p/(p-1)`$. This gives the other sharp order $`\|u\|_p\gtrsim k^{(n-1)/4-(n-1)/(2p)}`$. Together with Sogge's classical upper estimates, stated in Han's equation (1.1), these are exactly the two regimes of $`\|u\|_p\asymp_{n,p}k^{\sigma(p)}`$. Since the basis was chosen without $`p`$, the estimates hold simultaneously as required.
