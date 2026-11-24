# Pomerance–Sárközy exceedance process at the correlation scale

Let \(g(n)=\#\{m\le n:m+\omega(m)>n\}\), as in the [one-point fluctuation theorem](PROOF.md). This supplement determines its fluctuation process when the endpoint moves by order \(\sqrt{\log\log X}\).

**Theorem.** Fix \(T>0\), let \(n\) be uniform on the integers up to \(X\), and put \(L=\log\log X\). On the time mesh \(t=j/\sqrt L\) with integer \(j\), define
\[
F_X(t)=\frac{g(n+j)-L}{L^{1/4}}.
\]
Use linear interpolation and ignore the event that one of the arguments is nonpositive, whose probability is \(o(1)\). On \([-T,T]\) the resulting random continuous function converges in distribution in the uniform topology to a centered stationary Gaussian process with covariance
\[
K(t-s)=\mathbb E\bigl[(N-|t-s|)_+\bigr],\qquad N\sim \mathcal N(0,2).
\tag{1}
\]
In particular the variance is \(K(0)=1/\sqrt\pi\). This extends the one-point law without treating fixed-offset exact collisions of the map \(m\mapsto m+\omega(m)\).

## 1. Uniform arithmetic comparison

Take \(H=\lfloor10L\rfloor\), \(J=\lceil T\sqrt L\rceil+1\), and restrict to \(\sqrt X\le n\le X-J\), losing probability \(o(1)\). The same factorial bound as in the one-point theorem shows, uniformly over all \(|j|\le J\), that with probability \(1-o(1)\) no shift \(h>H\) contributes to \(g(n+j)\). The union over \(j\) costs \(O(\sqrt L)\), whereas the tail bound for each \(j\) is \(\exp(-cL)\).

Use the same truncated prime range \(L^6<p\le X^{1/L^6}\) and write \(w\) for its prime-divisor count. Apply the incidence comparison in §2 of the one-point proof once to *all* offsets \(u\in[-H-J,J]\cap\mathbb Z\), with divisibilities \(p\mid n+u\). It applies unchanged: the number of offsets is \(O(L)\), differences of distinct offsets have absolute value less than the smallest included prime, and the sample size is asymptotic to \(X\), so CRT inclusion errors remain \(O(1/X)\). The vector \((w(n+u))_u\) is within \(o(1)\) in total variation of iid \(Z_u\sim\operatorname{Poisson}(\lambda)\), \(\lambda=L+O(\log L)\).

By the omitted-prime estimate and a union bound over all these offsets, with probability \(1-o(1)\) every \(\omega(n+u)-w(n+u)\) is at most \(B=\lceil C\log L\rceil\). At each endpoint \(j\), the number of changed indicators is then at most the near-threshold count of offsets \(h\le H\) with \(|w(n+j-h)-h|\le B\). In the independent model each such count is a sum of independent Bernoulli variables of mean at most \(2B+1\). For a sum of independent indicator variables of mean \(b\), its probability of being at least integer \(a\ge1\) is at most \(b^a/a!\), by its factorial moment. Thus for each \(j\) the near-threshold count exceeds a sufficiently large constant times \(\log L\) with probability \(O(L^{-10})\). This estimate survives a union bound over \(j\), using one total-variation comparison for the joint event. Consequently the uniform discrepancy, including after interpolation, is \(O_{\mathbb P}(\log L)=o_{\mathbb P}(L^{1/4})\) from the truncated count. Its joint law is within \(o(1)\) total variation of the model
\[
G_j=1+\sum_{h=1}^H\mathbf 1_{Z_{j-h}>h},\qquad |j|\le J.
\tag{2}
\]

## 2. Covariance and finite-dimensional limits

Write \(p_h=\Pr(Z_0>h)\). For an integer \(d\ge0\), the only dependent summands in \(G_j\) and \(G_{j+d}\) use the same Poisson coordinate, at thresholds \(h\) and \(h+d\). Hence for \(d\le H\)
\[
\operatorname{Cov}(G_j,G_{j+d})=\sum_{h=1}^{H-d}p_{h+d}(1-p_h).
\tag{3}
\]
If \(d/\sqrt L\to a\ge0\), then the uniform central Poisson limit and the Riemann sum at \(u=(h-\lambda)/\sqrt\lambda\) give
\[
\frac{\operatorname{Cov}(G_j,G_{j+d})}{\sqrt L}
\longrightarrow \int_{\mathbb R}\Phi(u)\bigl(1-\Phi(u+a)\bigr)\,du.
\]
The tails away from a bounded \(u\)-range can be controlled by Chebyshev exactly as for the one-point variance: use \(1-p_h\) on the lower side, and \(p_{h+d}\le p_h\) on the upper side. For iid standard normals \(N_1,N_2\), the integral is the expected length of \(\{u:N_1\le u<N_2-a\}\), which is \(\mathbb E[(N_2-N_1-a)_+]\). This proves (1).

For each fixed finite collection of time mesh positions tending to given times, a real linear combination of the centered variables \(G_j\) is a sum of independent centered terms indexed by underlying Poisson coordinates, with every term bounded in absolute value by a constant depending on the linear combination. If its normalized limiting variance from (3) is positive, Lindeberg's theorem applies after the \(L^{1/4}\) scaling; if it is zero, Chebyshev suffices. By the Cramér–Wold device, and by \(\mathbb E G_j=L+O(\log L)\), this proves the finite-dimensional Gaussian limits.

## 3. Tightness

For integers \(i<j\) at distance \(d=j-i\), the common terms of \(G_i,G_j\) differ by minus the indicator that a Poisson variable lies between its two thresholds. The sum of these probabilities is at most \(d\), since a fixed value of that variable belongs to at most \(d\) of the integer threshold intervals. At each endpoint at most \(d\) terms are not common, so the sum of expected absolute values of the independent coordinate contributions to the increment is at most \(3d\). Their variances sum to at most \(3d\). Each centered fourth moment is at most four times its variance, by boundedness. Since the expectations of \(G_i,G_j\) agree, the fourth-moment formula for independent centered random variables gives
\[
\mathbb E |G_j-G_i|^4\le C(d+d^2)\le 2C d^2.
\tag{4}
\]
On the scaled mesh this becomes
\[
\mathbb E\left|L^{-1/4}(G_j-G_i)\right|^4
\le 2C\left|(j-i)/\sqrt L\right|^2.
\]
The same bound, with an absolute constant enlarged, holds for the linear interpolation at arbitrary pair of times: inside one mesh interval the increment scales linearly in the fractional length, so its fourth moment satisfies the bound; otherwise split at the first and last intervening mesh points and use the triangle inequality in \(L^4\). The bounded fourth-moment increment criterion for tightness of continuous processes, together with tightness at one point, gives tightness in \(C([-T,T])\). Finite-dimensional limits from §2 identify the unique Gaussian limit. The arithmetic comparison then proves the theorem.

## 4. Brownian scaling at shorter mesoscopic distances

**Corollary.** Let \(r=r(X)>0\) satisfy \((\log L)^2=o(r)\) and \(r=o(\sqrt L)\). For a uniform \(n\le X\), the process
\[
t\longmapsto\frac{g(n+\lfloor rt\rfloor)-g(n)}{\sqrt r},\qquad 0\le t\le T,
\]
with linear interpolation on the mesh of spacing \(1/r\), converges in \(C([0,T])\) to standard Brownian motion.

Indeed, §1 compares all these endpoints to the same model up to uniform \(O_{\mathbb P}(\log L)=o_{\mathbb P}(\sqrt r)\). Denote the stationary model covariance at an integer distance \(d\) by \(C_L(d)\). By (3),
\[
C_L(0)-C_L(d)
=\sum_{h=1}^{H-d}(p_h-p_{h+d})(1-p_h)
+\sum_{h=H-d+1}^H p_h(1-p_h).
\]
The last sum is \(O(d e^{-cL})\) for \(1\le d\le Tr\). For the first sum, use \(p_h-p_{h+d}=\sum_{a=1}^d\Pr(Z=h+a)\), then interchange sums. For each \(a\le d\), the \(h\)-sum is \(\Pr(Z'\le Z-a)+o(1)\) for independent Poisson variables \(Z,Z'\) of mean \(\lambda\), uniformly in \(a,d\) in these ranges. The omitted values of \(h=Z-a\) lie far from \(\lambda\) and have probability \(o(1)\). Since \((Z-Z')/\sqrt{2\lambda}\) converges to a standard normal and \(d=o(\sqrt\lambda)\), this probability tends to \(1/2\) uniformly for \(a\le d\). Consequently \(C_L(0)-C_L(d)=(1/2+o(1))d\) uniformly over \(1\le d\le Tr\).

For \(i,j\) near \(rs,rt\), the covariance of \(G_i-G_0,G_j-G_0\) is the sum of the covariance decrements at distances \(i,j\), minus the decrement at \(|i-j|\). Dividing by \(r\) yields \((s+t-|s-t|)/2=\min(s,t)\). Independent-coordinate Cramér–Wold and Lindeberg again give Gaussian finite-dimensional limits, now using scale \(\sqrt r\). The fourth-moment bound (4), with the interpolation argument on spacing \(1/r\), gives tightness and proves the corollary.
