# Steinerberger’s interpoint-distance variance problem

In [*Some Open Problems*, §28](https://faculty.washington.edu/steinerb/openproblems.pdf#page=30), Steinerberger asks whether the variance of the distance between two independent uniform points in a domain of volume \(v\) is bounded below by \(c_dv^{2/d}\), and which domains minimize it, in particular whether they are convex.

The positive bound holds with attainment in every dimension. Up to translation and null sets, the only minimizer in dimensions \(1\) through \(4\) is the Euclidean ball. In dimensions \(d\ge5\), every minimizer is a **genuine concentric spherical shell**; in particular none is convex. The possible shell radii are specified by an exact finite stationary-point comparison at the end. No uniqueness of that radius in dimensions \(d\ge5\) is claimed.

## 1. Compactness and symmetry

Rescale the prescribed volume to \(\omega_d\), that of the unit ball. Relax the uniform law on a set to any probability law \(\mu\) on \(\mathbb R^d\) with a Lebesgue density at most \(1/\omega_d\), and translate it to have mean zero. Write
\[
 M(\mu)=\iint |x-y|\,d\mu(x)d\mu(y),\qquad
 S(\mu)=\iint |x-y|^2\,d\mu(x)d\mu(y)=2\int |x|^2d\mu(x),
 \qquad F(\mu)=S(\mu)-M(\mu)^2.
\]
Only finite second moments need be considered: if \(|X-Y|\) has finite variance then it has finite second moment, so for some fixed \(y\), \(\int|x-y|^2d\mu(x)<\infty\).

There is a uniform \(\kappa_d>0\) with \(F(\mu)\ge\kappa_d S(\mu)\) for all finite-second-moment laws. Otherwise, center and dilate a sequence so \(S=1\) and \(F\to0\). Bounded second moments imply tightness and uniform integrability of first moments. Along a weakly convergent subsequence the product laws converge, and the distances converge in distribution to the corresponding distance for the limit law. But the distances also converge in \(L^2\) to \(1\), since their means tend to \(1\) and variances to \(0\). This is impossible: a countable cover by balls of diameter less than \(1\) contains a ball of positive mass, and both independent samples fall in that ball with positive probability. The density bound implies a positive lower bound on \(S\) by filling the centered unit ball first in the integral of \(|x|^2\). Thus the infimum is positive. A minimizing centered sequence has bounded second moments by the same coercivity, hence a weak limit with mean zero, with the density bound preserved, and with convergent \(M\). Lower semicontinuity of \(S\) gives attainment in the relaxed problem.

Euclidean distance is strictly conditionally negative definite: for a real finite signed measure \(\nu\) of mass zero and finite first absolute moment,
\[
 \iint|x-y|\,d\nu(x)d\nu(y)
 =-c_d'\int_{\mathbb R^d} |\widehat\nu(\xi)|^2|\xi|^{-d-1}\,d\xi,
 \qquad c_d'>0.
 \tag{1}
\]
This follows by substitution from the integral formula
\(|x|=c_d'\int (1-\cos(x\cdot\xi))|\xi|^{-d-1}d\xi\);
Fubini is justified by integrating the finite first absolute moments against total variation. The right side is strictly negative unless \(\nu=0\), by continuity and uniqueness of Fourier transforms. For classical distance-energy background see [Björck, *Distributions of positive mass, which maximize a certain generalized energy integral* (1956)](https://archive.ymsc.tsinghua.edu.cn/pacm_download/116/6922-11512_2007_Article_BF02589412.pdf).

Averaging a centered law over rotations (over reflections as well if \(d=1\)) preserves \(S\) and the density bound and can only increase \(M\), strictly unless the law was already invariant. If \(\bar\mu\) is the radial average, the cross energy of \(\mu-\bar\mu\) against \(\bar\mu\) vanishes by invariance, so \(M(\mu)-M(\bar\mu)\) equals the left side of (1) with \(\nu=\mu-\bar\mu\). Every relaxed minimizer after centering is radial.

## 2. Every minimizer is a shell for \(d\ge3\)

Let \(\mu\) be a centered radial relaxed minimizer, \(m=M(\mu)>0\), and define
\[
 U(r)=\int |re_1-y|\,d\mu(y),\qquad W(r)=r^2-2mU(r).
\]
For any competing centered radial density, differentiating \(F((1-t)\mu+t\nu)\) at zero gives \(2\int W\,d(\nu-\mu)\ge0\). The bounded-density filling principle therefore puts density \(1/\omega_d\) on \(\{W<\lambda\}\) and zero on \(\{W>\lambda\}\), with possible intermediate density only on \(\{W=\lambda\}\). Indeed a positive amount of transferable mass at higher \(W\) than unsaturated capacity violates this variational inequality. Radial tests suffice since \(W\) is radial. Continuity, and \(W(r)\to\infty\) since \(U(r)\le r+\int|y|d\mu(y)\), ensure a finite cutoff.

For \(d\ge3\), the radial function \(\Delta U\) is nonincreasing:
\[
 \Delta U=(d-1)\,|\cdot|^{-1}*\mu,\qquad
 \Delta^2 U=
 \begin{cases}
 -8\pi\,\mu,&d=3,\\
 -(d-1)(d-3)\,|\cdot|^{-3}*\mu,&d>3.
 \end{cases}
 \tag{2}
\]
These identities follow by differentiating the radial kernels off the origin and testing across a sphere shrinking to zero; the sole nonzero boundary charge is \(\Delta |x|^{-1}=-4\pi\delta_0\) in dimension \(3\). All locally singular kernels stated for \(d>3\) are locally integrable, and the bounded density guarantees continuity of their potentials by cutting off the singularity. In particular \((r^{d-1}(\Delta U)'(r))'\le0\) distributionally; boundedness of \(\Delta U\) at zero removes the possible integration constant in \(r^{d-1}(\Delta U)'(r)\). Thus \(\Delta U\) is nonincreasing, strictly for \(d>3\). Radial integration gives \(U'(r)/r = r^{-d}\int_0^r t^{d-1}\Delta U(t)\,dt\), also nonincreasing, strictly for \(d>3\). Equivalently \(V(x)=U(\sqrt x)\) is concave in \(x\ge0\). Thus \(W(\sqrt x)\) is convex, strictly for \(d>3\), and its strict sublevel is a radial interval. In dimension \(3\) a nontrivial interval of equality at the cutoff forces \(\mu=0\) in its interior, because \(W\) constant there implies \(\Delta^2W=16\pi m\mu=0\) there. The remaining equality radii have Lebesgue measure zero. Thus the minimizer is exactly a saturated shell with radii \(0\le a<b\) and \(b^d-a^d=1\). In particular the relaxation is attained by an open connected domain for \(d\ge3\).

A consequence used below is
\[
 \frac{M(\mu)^2}{S(\mu)}\le \frac{C_d^2}{2}\qquad(d\ge3),
 \tag{3}
\]
where \(C_d\) is the mean interpoint distance for the uniform law on the unit sphere. To see this, choose the uniform spherical law \(\sigma\) of radius \(R=(S/2)^{1/2}\). Its distance potential \(V_\sigma(x)\) is concave in squared radius by (2) and radial integration, even though \(\sigma\) is singular: approximate it with bounded radial mollifications and pass pointwise. A supporting affine line to \(V_\sigma\) at \(R^2\) integrates to the same value for the two laws with equal second radial moment. Expanding (1) around \(\sigma\) gives \(M(\mu)-M(\sigma)\le2\int U_\sigma\,d(\mu-\sigma)\le0\). This proves (3).

## 3. Dimensions one and two

In dimension one, use prescribed volume \(1\) and the quantile \(Q:(0,1)\to\mathbb R\) of any relaxed law. The bound on its density means \(q(u)=Q(u)-u\) is nondecreasing, because \(Q(v)-Q(u)\ge v-u\). Independent uniform \(U,V\) on \((0,1)\) give
\[
 |Q(U)-Q(V)|=|U-V|+|q(U)-q(V)|.
\]
The covariance of the terms on the right is nonnegative. Indeed for \(D=|U-V|\) and \(E=|q(U)-q(V)|\), the sign of the covariance follows by writing \(E\) as an integral of crossing indicators \(\mathbf1_{\{\min(U,V)<t<\max(U,V)\}}\) against \(dq(t)\). For every \(0<t<1\), conditional on crossing \(t\), the ordered endpoints are independent uniforms on \((0,t)\) and \((t,1)\). Their mean difference is \(1/2\), whereas \(\mathbb E D=1/3\). Tonelli applies to both \(\mathbb E E\) and \(\mathbb E DE\), finite by finite second moments. Unless \(q\) is constant almost everywhere, the covariance is strictly positive by the same formula. The interval is uniquely optimal.

For the planar unit disk \(B\), \(U_B(r)=\int|re_1-y|d\mu_B(y)\) has \(\Delta U_B=|\cdot|^{-1}*\mu_B\), which is radial nonincreasing (use layer cake and monotonic ball intersections). Thus \(V_B(x)=U_B(\sqrt x)\) is concave and \(V_B'(0)=\Delta U_B(0)/(2d)=1/2\). Hence for any centered relaxed law,
\[
 M-M_B\le\tfrac12(S-S_B).
 \tag{4}
\]
Indeed \(V_B(x)-x/2\) is nonincreasing everywhere. On the disk there is only removal of mass and outside only addition, so integrating \(V_B(|y|^2)-|y|^2/2\) against \(\mu-\mu_B\) gives at most zero. The energy expansion (1) proves (4), strictly for \(\mu\ne\mu_B\). Since \(M_B=128/(45\pi)\) and \(S_B=1\), (4) proves \(F\ge F_B\) whenever \(M+M_B\le2\) (if \(M<M_B\), use just \(S\ge S_B\)).

In the remaining case, consider a radial minimizer and the one-dimensional projection \(Z=X_1\). The quantile identity \(\mathbb E|Z-Z'|=2\int_0^1(2u-1)Q(u)\,du\) and Cauchy–Schwarz give \(\mathbb E|Z-Z'|\le 2\sqrt{\operatorname{Var}Z/3}\). Also \(M=(\pi/2)\mathbb E|Z-Z'|\) by the mean absolute directional cosine and \(S=4\operatorname{Var}Z\). Thus \(M^2/S\le\pi^2/12\). If \(M>2-M_B\), then \(F\ge(12/\pi^2-1)(2-M_B)^2>F_B\); for example \(0.90<M_B<0.91\) and \(\pi^2<10\) give the lower bound \(0.2(1.09)^2>0.19>F_B\). Only the disk minimizes.

## 4. Dimensions three and four

### Dimension three

In \(d=3\), the mean distance for two independent uniform spherical directions at radii \(r\ge t\) is \(r+t^2/(3r)\), obtained by averaging \(\sqrt{r^2+t^2-2rtu}\) over \(u\in[-1,1]\). Thus for \(b^3-a^3=1\),
\[
 M=\frac{36}{35}(b^7-a^7)-\frac32a^3(b^4-a^4)-\frac35a^5(b^2-a^2),
 \qquad S=\frac65(b^5-a^5).
\]
Putting \(x=a/b\), \(K=M/b^7\), and \(W=\frac65(1-x^5)/(1-x^3)-K^2/(1-x^3)^4\), we have \(F=(1-x^3)^{-2/3}W\). The derivative for \(0<x<1\) has the sign of
\[
 (1-x^3)W'+2x^2W =
 \frac{3x^2(300x^8+25x^7-368x^6+678x^5+1360x^4+1405x^3+540x^2+208x+52)}{350(x^2+x+1)^4}.
\]
This identity follows by substitution and differentiation. The numerator is positive since \(678x^5-368x^6\ge310x^5\). Hence the unique minimizing shape is the ball and \(F_B=174/1225\).

### Dimension four

Set \(M_B=m_0=16384/(4725\pi)\), \(S_B=4/3\), \(V(x)=U_B(\sqrt{x})\) and \(k_0=V(1)-V(0)=9m_0/8-4/5\). The ball means are justified in §5. Concavity of \(V\) gives \(V(1)-V(x)\le k_0(1-x)\) for \(0\le x\le1\) and \(V(x)-V(1)\le k_0(x-1)\) for \(x\ge1\). As in (4), this and (1) give \(M-m_0\le k_0(S-S_B)\), strictly for any non-ball law. It suffices to consider shells by §2. For \(M\le 23/20\) the last inequality suffices to show \(F\ge F_B\), because \(k_0(m_0+23/20)<1\).

For \(M\ge 23/20\), the inner squared radius \(t=a^2\) is at least \(1/5\). Indeed \(M-m_0\ge23/20-m_0>0.046\), and the bound above gives \(S-S_B>0.10\). Writing the shell transfer parameter as \(A=a^4\), we have \(S=2\int_0^1 (A+u)^{1/2}du\), hence \(dS/dA\le2\), so \(A>0.05>1/25\). For \(x\le1\) we have the stronger curvature bound
\[
 -V''(x)\ge \frac{1}{6\pi}>\frac1{20}.
 \tag{5}
\]
In fact \(-\Delta^2U_B(r)=3\int|re_1-y|^{-3}d\mu_B(y)\) by (2). This potential is nonincreasing in \(r\) by ball convolution, and at \(r=1\) its integral equals \(16/(3\pi)\): polar integration about \(e_1\) gives \(4\,\mathbb E|\Theta_1|\) for uniform \(\Theta\in S^3\), with \(\mathbb E|\Theta_1|=4/(3\pi)\). Thus the source \(-\Delta^2U_B\ge16/\pi\) on the unit ball. Integrate the radial equation once to get \((\Delta U_B)'(r)\le-(16/\pi)r/4\); then differentiate the radial formula for \(U'_B/r\) and integrate by parts to obtain \(-V''(r^2)\ge(16/\pi)/(4\cdot4\cdot6)\), giving (5).

Consequently the inner chord bound improves by \(x(1-x)/40\), and the outer chord bound improves by \((x-1)/40\), by strong concavity on \([0,1]\) and ordinary concavity beyond. For the concentric shell, the removed mass has squared radius \(x\in[0,\min(t,1)]\), with measure \(2x\,dx\). In the inner bound the weighted average of \(x\) with weight \(x(1-x)\,dx\) on this interval is at least its value \(17/130>0.13\) at \(t=1/5\); increasing the interval can only increase the average. The outer bound has at least the same proportional improvement. Thus
\[
 M-m_0 \le (k_0-13/4000)(S-S_B).
\]
For \(M\le117/100\) we again have \(F\ge F_B\), because \((k_0-13/4000)(m_0+117/100)<1\). If \(M\ge117/100\), use (3) with \(C_4=64/(15\pi)\), by one polar beta integral. This gives \(F\ge(450\pi^2/4096-1)(117/100)^2>4/3-m_0^2\). The decimal comparisons are rational checks using \(3.14159<\pi<3.14160\). Therefore the unit ball uniquely minimizes in dimension four.

## 5. Genuine shells in all dimensions \(d\ge5\)

Let \(m_d=M_B\) for the uniform law on the unit ball and \(U_d(r)\) its distance potential. Polar integration about a boundary point gives
\[
 U_d(1)=\frac{d}{d+1}\,2^d\,\mathbb E|\Theta_1|^{d+1}
  =\frac{d}{d+1}\,2^d\,\frac{\Gamma(d/2)\Gamma((d+2)/2)}{\sqrt\pi\,\Gamma(d+1/2)}.
\]
In detail the ray in inward direction with cosine \(t\) has length \(2t\) for \(t>0\); the radial integral of distance is \((2t)^{d+1}/(d+1)\), and surface area divided by volume is \(d\). Differentiating the distance double integral over balls of radius \(R\) (which scales as \(R^{2d+1}\)) alternatively by the two boundary terms proves \((2d+1)m_d=2d U_d(1)\). Consequently
\[
 m_d=\frac{d\,2^{d+1}}{d+1}\frac{\Gamma(d/2+1)^2}{\sqrt\pi\,\Gamma(d+3/2)},
 \qquad U_d(1)=\left(1+\frac1{2d}\right)m_d,\qquad U_d(0)=\frac{d}{d+1}.
 \tag{6}
\]
(The formula also gives the planar and four-dimensional values used earlier.)

For a ball to minimize, its first-variation potential \(W_d(r)=r^2-2m_dU_d(r)\) must have \(W_d(0)\le W_d(1)\); otherwise moving a small amount of uniform mass from a central ball to a thin exterior layer strictly decreases variance at first order. An exact indicator-set version is to remove the central ball of radius \(A^{1/d}\) and add the collar up to radius \((1+A)^{1/d}\) for \(A\downarrow0\): each moved mass is \(A\), and the probability energy expansion has remainder \(O(A^2)\) since its signed difference has total variation \(2A\) and bounded support. The derivative at \(0+\) equals \(2(W_d(1)-W_d(0))\).

Write \(a_d=1+1/(2d)\), \(b_d=d/(d+1)\), and \(T_d=a_dm_d^2-b_dm_d\), so the required ball condition is \(T_d\le1/2\). In fact \(T_d>1/2\) for every \(d\ge5\). Equation (6) gives
\[
 r_d=\frac{m_{d+2}}{m_d}
 =\frac{4(d+2)^3(d+1)}{d(d+3)(2d+3)(2d+5)}>1,
\]
where the numerator minus denominator is \(9d^2+35d+32\). Put \(P=a_{d+2}r_d^2-a_d\) and \(Q=b_{d+2}r_d-b_d\). We have \(P>0\) and \(17P-14Q>0\): over the common denominator \(2d^2(d+3)^2(2d+3)^2(2d+5)\), the numerator of \(P\) is
\[
 56d^5+488d^4+1627d^3+2570d^2+1899d+512,
\]
and over that denominator times \(d+1\) the numerator of \(17P-14Q\) is
\[
 1212d^5+10307d^4+33409d^3+50885d^2+35611d+8704.
\]
Thus \(T_{d+2}-T_d=m_d(Pm_d-Q)>0\) as soon as \(m_d\ge17/14\). The starting values are \(m_5=800/693\), \(m_6=131072/(35035\pi)\), \(m_7=1568/1287>17/14\), \(m_8=134217728/(34459425\pi)>17/14\). Substituting these into \(T_d\) gives \(T_d>1/2\) for all four starting dimensions; for the even dimensions replace \(\pi\) by \(22/7\) to obtain a strict rational lower bound, as \(a_dm^2-b_dm\) is increasing for \(m\ge1\). This proves ball nonoptimality throughout \(d\ge5\), and §2 proves every minimizer is nonconvex.

## 6. The exact finite stationary-point comparison

For the prescribed unit-ball volume and each \(A\ge0\), put \(r_A(u)=(A+u)^{1/d}\) for \(u\in[0,1]\), and set
\[
 \begin{split}
 K_d(r,t)&=\mathbb E_\Theta\sqrt{r^2+t^2-2rt\Theta_1},\\
 m(A)&=\int_0^1\!\!\int_0^1 K_d(r_A(u),r_A(v))\,du\,dv,\\
 f_d(A)&=2\int_0^1 r_A(u)^2\,du-m(A)^2.
 \end{split}
\]
Here \(\Theta\) is uniform on \(S^{d-1}\). Every minimizer in dimensions \(d\ge5\) is a translate of a shell of inner radius \(A^{1/d}\) and outer radius \((A+1)^{1/d}\), where \(A>0\) attains the minimum of \(f_d\); conversely each minimizing \(A\) gives a minimizer. The optimal variance coefficient at volume \(v\) is \(\omega_d^{-2/d}\min f_d\) times \(v^{2/d}\). The stationarity equation for \(A>0\) is
\[
  (A+1)^{2/d}-A^{2/d}=2m(A)(U_A((A+1)^{1/d})-U_A(A^{1/d})),
\]
where \(U_A\) is the shell potential. To derive it, differentiate in the radial volume coordinate: the signed derivative of the uniform shell law is uniform probability on its outer sphere minus uniform probability on its inner sphere. The stationary equation has finitely many positive solutions. In fact \(f_d'\) is negative near zero by §5 and continuity of the displayed stationarity expression through \(A=0\). It is positive for sufficiently large \(A\): uniformly in \(u\), 
\[
 r_A'(u)=rac{r_A(u)}{dA}(1+O(A^{-1})),\qquad r_A(u)=A^{1/d}(1+O(A^{-1})).
\]
The angular norm has each radius derivative bounded by \(1\) and is homogeneous of degree \(1\). Consequently \(m'(A)=m(A)/(dA)+O(A^{1/d-2})\) and \(S'(A)=2S(A)/(dA)+O(A^{2/d-2})\). Since \(m(A)=C_d A^{1/d}+O(A^{1/d-1})\) and \(S(A)=2A^{2/d}+O(A^{2/d-1})\), this gives
\[
 f_d'(A)=rac2d(2-C_d^2)A^{2/d-1}+O(A^{2/d-2})>0
\]
eventually. Here \(C_d^2<2\) by strict Cauchy–Schwarz for the nonconstant distance of two uniform spherical points.

Finally, \(f_d\) is real analytic for \(A>0\). For any such \(A_0\), let \(A\) vary in a small complex disk about \(A_0\) and use the principal analytic power in \(r_A(u)\). Uniformly for \(u,v\in[0,1]\), the product \(r_A(u)r_A(v)\) and the squared divided difference \(((r_A(u)-r_A(v))/(u-v))^2\) lie in a common strictly positive real sector. For the divided difference this follows from the integral of the positive radius derivative in \(u\) at real \(A_0\), and continuity uniformly on the interval and through \(u=v\). Thus the square root of \((r_A(u)-r_A(v))^2+2r_A(u)r_A(v)(1-\Theta_1)\) is bounded and analytic on the disk for each \(u,v,\Theta_1\), apart from the identically zero case (where it is simply zero). The parameter integral is holomorphic by dominated integration. The derivative zeros in a compact subinterval of \((0,\infty)\) are therefore finite. Comparing \(f_d\) at these finitely many roots specifies the exact radius set in every \(d\ge5\); finite-dimensional uniqueness for all such \(d\) is not asserted.

## Scope and priority

The Björck negative-type background is classical; the shape problem is not the familiar minimization of the *mean* interpoint distance (for which the ball is classical), nor does maximization of mean distance at fixed second moment by an unrestricted spherical measure give the fixed-density result by itself. The latter spherical optimizer in (3) is also contained in the quadratic-attraction / linear-repulsion regime of [Frank–Matzke, *Minimizers for an Aggregation Model with Attractive–Repulsive Interaction*](https://doi.org/10.1007/s00205-025-02084-1). The proof of shell geometry here uses a density-constrained linearization; comparable annulus-or-ball conclusions for the distinct fixed interaction kernel \(r^lpha/lpha-r^2/2\), \(2<lpha<4\) in dimensions at least two, appear in [Carazzato–Pratelli–Topaloglu, Theorem 3.8](https://doi.org/10.2140/paa.2024.6.995). Neither fixed-kernel result is the variance objective, which uses the optimal mean as its interaction coefficient and requires the nonlinear optimization. Searches for the exact fixed-volume variance problem located the March 2026 open-problem list and a [2021 planar formulation](https://math.stackexchange.com/questions/4224464/minimize-the-variance-of-distances-between-2-points-for-planar-region-of-given-a), but no prior classification at fixed density. The relaxation, shell classification, and ball-to-shell transition are the claims of this note; outside priority and correctness review are welcome.
