# Feldheim–Feldheim’s weighted tail conjecture

**Result.** For independent \(X,Y\) supported on \([0,\infty)\), neither
compactly supported, and any fixed \(0<\lambda<1\),
```math
 \limsup_{m\to\infty}
 \frac{\Pr(\lambda X+(1-\lambda)Y>m)}
      {\Pr(X>m)\Pr(Y>m)}=\infty.
 \tag{1}
```
This is Conjecture 1 of N. D. Feldheim and O. N. Feldheim,
[*Mean and Minimum of Independent Random Variables*, Israel Journal
of Mathematics 244(2) (2021), 857–882](https://link.springer.com/article/10.1007/s11856-021-2195-0),
[author preprint §1.1, arXiv:1609.03004v3, p. 2](https://arxiv.org/pdf/1609.03004v3#page=2).
Their general-norm consequence, Conjecture 2, follows for every
\(n\ge2\); \(n=1\) is a degenerate exception if included literally.

The proof applies to arbitrary unbounded laws, including atoms and
singular continuous distributions. No density or moment assumptions
are used.

## 1. What a bounded ratio forces

Suppose (1) fails. Then for constants \(m_0\ge0,C\ge1\),
the displayed ratio is at most \(C\) for all \(m\ge m_0\).
Define the right-continuous nondecreasing log tails
```math
 f(x)=-\log\Pr(X>x),\qquad g(x)=-\log\Pr(Y>x),\qquad H=f+g,
 \qquad L=\log C.
```
They are finite at every finite nonnegative argument and tend to
infinity. By independence, the event \(X>x,Y>y\) is contained in
the weighted sum event with threshold \(\lambda x+(1-\lambda)y\).
Thus for every \(x,y\ge0\) with \(\lambda x+(1-\lambda)y\ge m_0\),
```math
 H(\lambda x+(1-\lambda)y)\le f(x)+g(y)+L.
 \tag{2}
```
Taking \(x\uparrow m\) from below and
\(y=m+\lambda(m-x)/(1-\lambda)\downarrow m\) proves
\(f(m)-f(m-)\le L\) for \(m>m_0\); switching the approach directions
proves \(g(m)-g(m-)\le L\). In particular \(H\) has jumps at most
\(2L\) on this half-line. Summing (2) and its version with \(x,y\)
interchanged gives, for \(x,y\ge T>m_0\),
```math
 H((1-t)x+t y)+H(t x+(1-t)y)\le H(x)+H(y)+2L,
 \quad t=\min(\lambda,1-\lambda)\in(0,1/2].
 \tag{3}
```

There is a continuous nondecreasing \(F\) on \([T,\infty)\)
with \(\lvert F-H\rvert\le B_0:=2L+1\).
To see this, take \(T\) an integer bigger than \(m_0\).
On every unit interval \([n,n+1]\), sufficiently fine subintervals
have \(H\)-oscillation at most \(2L+1\). Otherwise there would be pairs
at distance tending to zero whose \(H\)-values differ by more than
\(2L+1\); a convergent subsequence of the pairs would violate the
jump bound at their common limit. Linearly interpolate
\(H\)'s values on a fine partition of each unit interval including
its endpoints. Both \(H\) and the interpolant on a subinterval
lie between the endpoint values. Consequently \(F\) satisfies
(3) with error \(e=2L+4B_0\).

## 2. Fixed-weight approximate Wright convexity

We need the following elementary stability statement. Suppose \(F\)
is continuous on an interval and
```math
 F((1-t)x+t y)+F(t x+(1-t)y)\le F(x)+F(y)+e
 \quad\text{for all }x,y,\quad 0<t\le1/2,\ e\ge0.
 \tag{4}
```
Then for every \(a\le z\le b\) in its domain,
```math
 F(z)\le\frac{b-z}{b-a}F(a)+\frac{z-a}{b-a}F(b)+K_t e,
 \qquad K_t=\max\{3,\,1+(1-t)/t^2\}
 \tag{5}
```
unless \(a=b\), where no inequality is needed.

Subtract the chord of \(F\) between \(a,b\). Any component of the
positive set of this deviation is an open interval with zero
boundary values. Work on its closure and rescale to \([0,1]\).
The deviation \(D\) then satisfies (4), \(D\ge0\),
\(D(0)=D(1)=0\). Let \(M=\max D\).

Apply (4) to \((0,y)\) and \((1,y)\), and integrate
\(0\le y\le1\). With
\(B=\int_0^t D+\int_{1-t}^1D\) and \(A=\int_t^{1-t}D\), one gets
```math
 \left(\frac1t+\frac1{1-t}-2\right)B
 +\left(\frac2{1-t}-2\right)A \le2e.
```
Both coefficients are at least \(2t/(1-t)\), hence
\(\int_0^1D\le (1-t)e/t\).

For \(t\le z\le1-t\), take \(x=(z-t y)/(1-t)\) and integrate (4)
over \(y\in[0,1]\); thus \(x\in[0,1]\) throughout. Dropping the
other nonnegative term on the left gives
```math
 D(z)\le \left(\frac{1-t}{t}+1\right)\int_0^1 D+e
 \le [1+(1-t)/t^2]e .
```
For \(0\le z\le t\), the pairs \((0,z/t)\) and
\((0,z/(1-t))\) have contracted points \(z\) and
\(w_R=(1-t)z/t\), respectively \(z\) and \(w_L=t z/(1-t)\).
Thus \(D(w_R),D(w_L)\le M-D(z)+e\). Since
\((1-t)w_L+t w_R=z\), one further application of (4) gives
\(D(z)\le2M-2D(z)+3e\), or \(D(z)\le 2M/3+e\).
The same holds for \(1-t\le z\le1\) by reflecting the interval.
At a maximum point this proves \(M\le K_t e\), proving (5).

Apply (5) to the interpolated log-tail sum \(F\).
It is nonnegative, so its lower convex envelope \(h\) is finite.
In one variable the envelope value at \(z\) is the infimum of
the values at \(z\) of chords with endpoints on either side of \(z\),
including the singleton value \(F(z)\). Indeed the infimum over
all finite combinations with barycenter \(z\) reduces to
at most two points by linear programming on the weights.
Equation (5) therefore implies \(F-K_t e\le h\le F\).
In particular
```math
 |H-h|\le B_1:=B_0+K_t e\quad\text{on }[T,\infty).
 \tag{6}
```
The convex function \(h\) is unbounded above by this comparison,
so it is strictly increasing from some point onwards.

## 3. Long near-affine hazard windows

For every integer \(j\ge1\), there are arbitrarily far intervals
\(I=[m-d,m+d]\), \(d>0\), having an affine function
\(\ell(x)=s x+c\) with
```math
 |H(x)-\ell(x)|\le E:=B_1+1\quad(x\in I),
 \qquad s d\ge j .
 \tag{7}
```
This uses the inverse-increment idea in Feldheim–Feldheim, Lemma 2.7, in a common supporting-affine form. To prove it, choose any starting value \(u_0\) in the increasing
range of \(h\), set \(q_n=h^{-1}(u_0+n)\) and
\(\delta_n=q_{n+1}-q_n\). Inversion of a convex increasing function
gives concavity, so \(\delta_n>0\) is nonincreasing. Its sum diverges
since \(q_n\to\infty\). For each fixed \(j\), arbitrarily large
\(n\) satisfy \(\delta_{n+2j}\ge \tfrac{j}{j+1}\delta_n\);
otherwise the increments decay geometrically along a progression
of step \(2j\), and monotonicity makes the entire sum finite.

For such an \(n\), take \(m=q_{n+j}\) and \(d=m-q_n\);
then \(q_{n+2j+1}-m\ge(j+1)\delta_{n+2j}\ge j\delta_n\ge d\).
So \(h(m-d)=h(m)-j\), \(h(m+d)\le h(m)+j+1\).
Any supporting affine function \(\ell\) to \(h\) at \(m\) has
\(h-\ell\ge0\) on \(I\). Its two endpoint defects sum to at most
one, and then convexity gives \(h-\ell\le1\) throughout \(I\).
The left endpoint defect equals \(sd-j\ge0\). Combining with
(6) proves (7).

## 4. The weighted integral contradicts boundedness

Fix a window (7) and define
```math
 f_0(x)=f(x)-\lambda s x,\qquad
 g_0(x)=g(x)-(1-\lambda)s x-c.
```
For \(x,y\in I\), the rectangle inequality (2) and (7) give
\(f_0(x)+g_0(y)\ge-E-L\). Also
\(|f_0(y)+g_0(y)|\le E\). Subtract and swap \(x,y\)
to conclude
```math
 |f_0(x)-f_0(y)|\le P:=2E+L,\qquad
 |g_0(x)-g_0(y)|\le P.
```
The second bound follows by subtracting at \(x\) instead of \(y\).
Let \(d_0=d\min(1,(1-\lambda)/\lambda)\).
For \(m-d_0\le x\le m\), the value
\(y=(m-\lambda x)/(1-\lambda)\) lies in \(I\), and
```math
 f(x)+g(y)-H(m)\le2P,\qquad
 f(m)-f(m-d_0)\ge\lambda s d_0-P
             \ge\min(\lambda,1-\lambda)j-P .
 \tag{8}
```
Here the linear parts cancel in the first bound.

Let \(\mu_X\) be the law of \(X\). Conditioning on \(X\) and keeping
only \(x\in(m-d_0,m]\) gives
```math
 \frac{\Pr(\lambda X+(1-\lambda)Y>m)}{e^{-H(m)}}
 \ge e^{-2P}\int_{(m-d_0,m]}e^{f(x)}\,d\mu_X(x).
```
For \(a<b\) in this interval,
```math
 \int_{(a,b]} e^{f(x)}\,d\mu_X(x)\ge f(b)-f(a).
 \tag{9}
```
Indeed with \(S(x)=e^{-f(x)}=\Pr(X>x)\), a right-endpoint
partition sum has contributions
\((S(x_{i-1})-S(x_i))/S(x_i)\ge
 \log(S(x_{i-1})/S(x_i))\).
As the mesh tends to zero these sums converge to the integral by
right continuity and boundedness on \([a,b]\). This proves (9)
including atoms; it is also the unweighted log-tail measure
comparison in Feldheim–Feldheim, Observation 2.1.

Taking \(a=m-d_0,b=m\), the ratio is at least
\(e^{-2P}(\min(\lambda,1-\lambda)j-P)\) by (8).
The constants are independent of \(j\). The windows occur
arbitrarily far out for each \(j\), and the bound exceeds \(C\)
for large \(j\), a contradiction. This proves (1).

## 5. The higher-dimensional consequences

For \(n\ge2\), take independent unbounded \(X_1,\ldots,X_n\)
as above and strictly positive weights \(\lambda_i\) adding to one.
Group \(Y=\sum_{i=2}^n \lambda_i X_i/(1-\lambda_1)\);
it is unbounded and independent of \(X_1\). Its tail is at least
\(\prod_{i=2}^n\Pr(X_i>m)\), since all those thresholds imply \(Y>m\).
Apply (1) with \(\lambda_1,X_1,Y\) to conclude that
```math
 \limsup_{m\to\infty}
 \frac{\Pr(\sum_{i=1}^n\lambda_iX_i>m)}
      {\prod_{i=1}^n\Pr(X_i>m)}=\infty.
```

Now let \(\|\cdot\|\) be any norm on \(\mathbb R^n\),
\(a=(a_1,\dots,a_n)>0\). A supporting functional \(\varphi\)
with dual norm one and \(\varphi(a)=\|a\|\) gives weights
\(w_i=\varphi(e_i)a_i/\|a\|\) summing to one, and
\(\|X\|/\|a\|\ge\sum_iw_i(X_i/a_i)\).
If all \(w_i>0\), the preceding weighted result applies to
\(X_i/a_i\). Otherwise, requiring \(X_i/a_i>m\) where \(w_i>0\)
and \(X_i/a_i\le m\) where \(w_i<0\) already implies the norm
event. The coordinates with \(w_i=0\) are unrestricted.
By independence this event's ratio to
\(\prod_i\Pr(X_i>m a_i)\) tends to infinity, since each factor
\(\Pr(X_i/a_i\le m)\) for a negative weight tends to one and
at least one nonpositive weight's small survival factor is omitted.
This is Conjecture 2 in its nondegenerate range \(n\ge2\).
If \(n=1\) is included in \(\mathbb N\), the printed norm ratio
is identically one, so the literal one-dimensional case is false.

## Literature and scope

The Feldheim–Feldheim article ([journal](https://link.springer.com/article/10.1007/s11856-021-2195-0),
[Naomi Feldheim’s posted manuscript, §1.1](https://u.cs.biu.ac.il/~feldhen/Papers/MinMean.pdf#page=2))
establishes the equal-weight, distinct-law case (Theorem 1) and
arbitrary positive weights for i.i.d. laws (Theorem 2), and explicitly
poses the unequal-weight distinct-law case as their main conjecture.
Their equal-weight proof reduces the problem to a single log tail
by symmetry around the threshold. The proof here replaces that
symmetry by (3), a fixed-weight Wright convexity inequality, and
uses the uniform error bound in (5) to control the two different
tails on common near-affine windows. For terminology see
[*On T-Schur Convex Maps*, §1](https://doi.org/10.1007/s00025-020-1154-0),
which discusses exact fixed-weight Wright convexity.

Exact-title and conjecture-phrase searches, with author, journal DOI,
symbolic statement, and recent-date variants, did not identify prior
resolution of the unequal-weight distinct-law statement. The conjecture
is explicit in both the public arXiv v3 and both authors’ posted
versions. The published page confirms the unresolved formulation in
its abstract; only the abstract is accessible at that page. The known equal-weight and
identical-law theorems are not new claims; nor is mathematical
priority asserted from searches alone.
