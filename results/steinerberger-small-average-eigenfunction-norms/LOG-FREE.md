# A log-free sharp basis on the three-sphere

The [solution of Steinerberger's lower-average eigenfunction-norm question](PROOF.md) can be sharpened: on the round \(\mathbb S^3\) there exists a real orthonormal Laplace eigenbasis, ordered by nondecreasing eigenvalue, such that
\[
   \sum_{j\le N}\|u_j\|_1\asymp N^{5/6}.
\]
Indeed, the lower bound holds for every basis, as shown in the companion proof. Here we replace its sharp Fourier blocks by a smooth lapped orthonormal transform to remove the logarithms. The standard lapped orthogonal transform goes back to [Malvar and Staelin](https://web.stanford.edu/class/ee398a/handouts/papers/Malvar%20-%20LOT.pdf); the construction and estimates used here are given explicitly. We only need to improve the holomorphic mean in that proof to \(O(k^{-1/2})\); the same matrix-coefficient lift and realification then give the asserted bound.

## 1. Smooth orthogonal packets

Retain the normalized monomials \(F_j\) and amplitudes \(A_j(t)\) from the companion proof. Choose an even integer \(B\asymp\sqrt k\) and set \(M=B/2\). Partition the lower half of the index range into full blocks of length \(B\), and use the reflected partition in the upper half. Leave the \(O(B)\) remaining middle indices as individual monomials. Initially use the cosine transform in each full block, with vectors
\[
  \sqrt{2/B}\,\cos(\omega_l(r+\tfrac12)),
  \qquad \omega_l=\frac{\pi(l+1/2)}B,\qquad 0\le l,r<B .
\]
It is orthonormal: the sum over \(0\le r<B\) of
\(\cos(m\pi(r+\tfrac12)/B)\) vanishes for integers \(1\le |m|\le 2B-1\), as follows from summing a geometric series and taking its real part. The product-to-sum identity gives the assertion.

Take a smooth \(w:\mathbb R\to[0,1]\) which vanishes on \((-\infty,-1]\), equals one on \([1,\infty)\), and satisfies \(w(t)^2+w(-t)^2=1\). For example, take \(w(t)=\sin(\frac{\pi}{4}(1+\psi(t)))\), where \(\psi\) is a smooth odd nondecreasing function taking values \(-1,1\) outside \((-1,1)\). Such \(\psi\) is obtained by integrating and normalizing an even nonnegative smooth bump there.

At each boundary \(a\) between consecutive full blocks on one side of the midpoint, apply the real orthogonal change of coordinates
\[
  \begin{pmatrix}c_j&s_j\\-s_j&c_j\end{pmatrix}
  \quad\text{on } (a-1-j,a+j), \qquad
  c_j=w((j+\tfrac12)/M),\quad
  s_j=w(-(j+\tfrac12)/M),\quad 0\le j<M .
\]
All pairs are disjoint, because left and right transitions each use only half of a block. Do not apply transitions across the remaining middle indices. We have obtained another full orthonormal basis.

For a block \(I=\{a,\ldots,a+B-1\}\) having a full block on either side, every new vector is exactly
\[
 \sqrt{2/B}\,W(r)\cos(\omega_l(r+\tfrac12)),\qquad r=j-a,\quad
 W(r)=w((r+\tfrac12)/M)w((B-r-\tfrac12)/M),
\tag{1}
\]
including its extension outside \(I\). In fact the cosine is even under \(r\mapsto-1-r\) and odd under \(r\mapsto 2B-1-r\), precisely the signs of the left and right rotations. The window is supported on \(O(B)\) consecutive indices and its first two discrete differences are \(O(B^{-1})\) and \(O(B^{-2})\), by the derivative bounds for the displayed fixed ramp.

The antiunitary \(J\) of the companion proof still permutes the vectors up to phases. Reversal of the index within a block changes the cosine to \((-1)^l\sin(\omega_l(r+\tfrac12))\), and
\[
(-1)^r\sin(\omega_l(r+\tfrac12))
      =\cos((\pi-\omega_l)(r+\tfrac12))
      =\cos(\omega_{B-1-l}(r+\tfrac12)).
\]
Thus \(J\) permutes the original cosine packets and the retained middle monomials up to phases. For each rotation pair the two indices have opposite parity. Under \(J\), the ordered pair is mapped to the reflected ordered pair by a signed quarter-turn, up to a common phase and conjugation. The real two-dimensional rotation commutes with that map, and the paired angle is the same at the reflected boundary. Thus the full rotation commutes with \(J\). The endpoint blocks on each side, which lack one of the two adjacent transitions, are kept in the final basis but not estimated via (1); they and the retained middle indices account for only \(O(B)\) vectors, each with \(L^1\le1\).

## 2. First and second amplitude differences

Consider a two-sided block in the lower half, \(a=hB\) for \(h\ge1\), and write \(\sigma=hB/k\). Enlarge the support of \(W\) by two indices on both ends and let \(J_I\) be the interval hull of that enlarged set divided by \(k\). Every involved \(s=j/k\) satisfies \(c\sigma\le s\le C\sigma\), \(1-s\ge c\), with absolute constants. Set
\[
 \mathcal E(t)=C k^{1/4}\sigma^{-1/4}
   \exp[-c k\operatorname{dist}(t,J_I)^2] .
\]
Uniformly wherever any of the differences is needed, the following bounds hold:
\[
 |A_j(t)|\le \mathcal E(t),\qquad
 |\Delta A_j(t)|\le \frac{C\mathcal E(t)}{\sqrt{k\sigma}},\qquad
 |\Delta^2 A_j(t)|\le \frac{C\mathcal E(t)}{k\sigma}.
\tag{2}
\]

Here are details. For \(0<t<1\), the companion Stirling estimate gives
\[
A_j(t)\le C k^{1/4}\sigma^{-1/4}\exp[-kD(s\Vert t)/2].
\]
On the interval between \(s,t\), the second derivative in the first variable of \(D(\cdot\Vert t)\) is \(1/(x(1-x))\). Taylor's integral formula therefore gives both
\[
 D(s\Vert t)\ge 2(s-t)^2,\qquad
 D(s\Vert t)\ge \frac{(s-t)^2}{2\max(s,t)}.
\]
If \(|s-t|\le c_1\sigma\) for a sufficiently small fixed \(c_1\), \(s,t\) are comparable to \(\sigma\) and their complements are bounded below. Put
\[
 R_j=\frac{A_{j+1}}{A_j}
       =\left(\frac{t(k-j)}{(1-t)(j+1)}\right)^{1/2}.
\]
Both adjacent ratios are bounded above and away from zero. The exact formula gives
\[
 |R_j-1|\le C\frac{|s-t|+1/k}{\sigma},\qquad
 |R_{j+1}-R_j|\le \frac{C}{k\sigma}.
\]
For the second bound, subtract the squares first: the difference has magnitude \( \frac{t}{1-t}\frac{k+1}{(j+1)(j+2)}\). The identities \(\Delta A_j=A_j(R_j-1)\) and
\(\Delta^2 A_j=A_j((R_j-1)^2+R_j(R_{j+1}-R_j))\), with \(D(s\Vert t)\ge c(s-t)^2/\sigma\), prove (2) by absorbing the powers of \(|s-t|\) into half of the exponential.

If \(|s-t|>c_1\sigma\), all adjacent \(s_\ell=(j+\ell)/k\), \(0\le \ell\le2\), still differ from \(t\) by at least \(c_1\sigma/2\), because \(k\sigma\gtrsim B\) grows. If \(t\le C_1\sigma\), the second lower bound for \(D(s_\ell\Vert t)\) gives \(D\ge c\sigma\). If \(t>C_1\sigma\) with \(C_1\) large enough, \(s_\ell\le t/2\), so it instead gives \(D\ge ct\ge c\sigma\). Combine either estimate with \(D\ge2(s_\ell-t)^2\) and use the crude bound for first and second differences by sums of adjacent amplitudes. The exponential \(\exp(-c k\sigma)\) gives the required inverse powers of \(k\sigma\) in (2). The endpoints \(t=0,1\) follow by continuity. Upper-half blocks follow by replacing \(j\) with \(k-j\) and \(t\) with \(1-t\).

## 3. Norm calculation without a Dirichlet-kernel loss

At fixed \(t\), write \(b_j=W(j-a)A_j(t)\), extended by zero. Equations (1) and (2) imply
\[
  S_0:=\sum_j|b_j|\le C B\mathcal E(t),\qquad
  S_2:=\sum_j|\Delta^2 b_j|\le \frac{CB\mathcal E(t)}{k\sigma}.
\]
For the second inequality use the discrete product rule with the terms \(W\Delta^2A\), two first differences, and \(A\Delta^2W\); since \(B\asymp\sqrt k\) and \(\sigma\le 1\), every term has the displayed bound. The sums include only \(O(B)\) indices. The Fourier series of \(b_j\) is pointwise bounded by both \(S_0\) and \(C S_2/\theta^2\) for \(0<|\theta|\le\pi\), the latter by summing twice by parts. Integration, by splitting at \(\sqrt{S_2/S_0}\) when it lies in the integration range, gives \(L^1\) norm at most \(C\sqrt{S_0S_2}\).

Expand the cosine of (1) into two angular modulations. Each is a translate of the same Fourier series for purposes of angular \(L^1\). Thus the packet has angular \(L^1\) at most
\[
 C B^{-1/2}\sqrt{S_0S_2}
   \le C B^{-1/2}\sigma^{-1/2}\mathcal E(t).
\]
The Gaussian envelope integrates in \(t\) to \(O(k^{-1/4}\sigma^{-1/4})\), since the hull \(J_I\) has length \(O(B/k)=O(k^{-1/2})\). Each packet therefore has \(L^1\) norm at most \(C B^{-1/2} k^{-1/4}(k/(hB))^{3/4}\). After multiplying by \(B\) packets per block and summing \(h\), the total over both halves is \(O(\sqrt k)\):
\[
 B^{1/2}k^{-1/4}(k/B)^{3/4}
       \sum_{1\le h\le Ck/B}h^{-3/4}
   =O(B^{1/2}k^{-1/4}\,k/B)=O(\sqrt k).
\]
Adding the \(O(B)\) exceptional vectors preserves this order. Dividing by \(k+1\) gives mean \(O(k^{-1/2})\), uniformly in degree (finitely many small degrees are absorbed in the constant).

The SU(2) tight-frame lift from the companion proof now gives mean \(O(\sqrt{k}\,(k^{-1/2})^2)=O(k^{-1/2})\) on the full degree-\(k\) harmonic space. The verified \(J\)-symmetry allows the same real orthonormal basis at cost at most \(\sqrt2\) in the total. Summation through the degree of the \(N\)-th eigenfunction yields the claimed sharp \(O(N^{5/6})\) upper bound.
