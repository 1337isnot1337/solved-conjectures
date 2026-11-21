# Monotonicity toward the boundary

Let $A$ be an arbitrary doubly stochastic matrix of order $n$, and form $A_m$ by taking $m$ diagonal copies of $A$. The following three conditions are equivalent.

1. In all sufficiently large multiplicities $m$, the permanent increases from the uniform matrix to $A_m$.
2. In all sufficiently large multiplicities $m$, $A_m$ satisfies every Holens–Đoković subpermanent inequality.
3. At every activity $z>0$, the expected fraction of unmatched rows for $A$ is **strictly** less than $2/(1+\sqrt{1+4z})$.

If condition 3 fails, every sufficiently large multiplicity has a strictly negative radial derivative at a common interior parameter. This includes the case of equality at a single activity with strict inequality everywhere else. The criterion depends on the matching polynomial of the original block and is decidable by a polynomial positivity test of degree at most $2n-2$. Repetition can restore monotonicity even when the original endpoint derivative is negative. These conclusions concern all repeat counts beyond a threshold for each fixed input. The [single-matrix boundary classification](https://yair-lavi.com/mincs-list/problem-8/index.html) remains open.

## The finite-order differential operator

Write $P(x)=\prod_{i=1}^n(x+\beta_i)=\sum_{j=0}^n \sigma_{n-j}(A)x^j$, where all $\beta_i>0$ by the [matching root theorem](https://doi.org/10.1007/BF01877590). Put $p=P'/P$ and define
$$
 d(x)=n^2-nx p(x)-x p(x)^2,\qquad c(x)=p(x)+x p'(x)=\sum_i\frac{\beta_i}{(x+\beta_i)^2}.
$$
For $z=1/x$ the unmatched fraction is $u=xp/n$. Consequently $d/n^2=1-u-zu^2$, giving condition 3 exactly when $d>0$ on the positive half-line.

For a general matrix of order $N$ with reversed matching polynomial $W$, set $y=Nt/(1-t)$ and $\mathcal L W=\int_0^\infty e^{-yx}W(x)\,dx$. Completing each matching with uniform entries gives
$$
 \operatorname{per}((1-t)J_N+tA_m)=\frac{y^{N+1}}{(y+N)^N}\mathcal L W
$$
in the application $N=mn$, $W=P^m$. Differentiating shows that the sign of the radial derivative is the sign of
$$
 [y+N(N+1)]\mathcal LW-y(y+N)\mathcal L(xW)=\mathcal L Q_N(W),\qquad
 Q_N(W)=N^2 W-(1+Nx)W'-xW'' .
$$
Integration by parts gives the equality, including cancellation of the boundary terms at zero. The coefficient of $x^j$ in $Q_N$ is
$$
 N(N-j)\sigma_{N-j}-(j+1)^2\sigma_{N-j-1}\quad(0\le j<N).
$$
These are precisely the adjacent Holens–Đoković differences up to positive factors. For a power one has the exact formula
$$
 Q_N(P^m)=P^m(m^2d-mc).                                               \tag{1}
$$

## Strict comparison gives all adjacent inequalities

Both $D=P^2d$ and $C=P^2c$ are polynomials of degree at most $2n-2$. One has $d(0)=n^2$ and $d(x)\sim n\|A\|_F^2/x^2$ at infinity. Indeed $\sum\beta_i=n$ and $\sum\beta_i^2=2n-\|A\|_F^2$ from the first and second matching counts. Also $c(x)\sim n/x^2$. Hence if $d>0$ throughout, one can choose $\epsilon>0$ for which $D-\epsilon C$ is strictly positive on $[0,\infty)$ and has strictly positive leading coefficient in degree $2n-2$.

For any real polynomial $V$ of degree $l$ positive on this closed half-line with positive leading coefficient, and any $b>0$, $(x+b)^qV(x)$ has positive coefficients in every degree for all sufficiently large integers $q$. To verify this, scale $x=bs$, homogenize $V(bs)$ to degree $l$, and restrict it to the compact simplex with coordinates $(s/(1+s),1/(1+s))$. The restriction has a positive minimum. After multiplication by $(1+s)^q$, the coefficient at $k$ divided by $\binom{q+l}{k}$ is a sum over $j$ of the original coefficients times $(k)_j(q+l-k)_{l-j}/(q+l)_l$ (falling factorials). These weights differ uniformly by $O_l(1/q)$ from $(k/(q+l))^j(1-k/(q+l))^{l-j}$. This proves the assertion, including the endpoint coefficients.

Use $b=\beta_1$ and $V=D-\epsilon C$. Since $P$ contains $x+b$ and its other factors have positive coefficients, $P^{m-2}V$ has positive coefficients for all large $m$. Also $C=\sum_i\beta_i(P/(x+\beta_i))^2$ has positive coefficients. For $1/m\le\epsilon$, equation (1) therefore has positive coefficients through degree $N-2$. The remaining adjacent inequality is equality by the line sums. Its Laplace transform is strictly positive, proving conditions 2 and 1.

## A tangency forces failure

Suppose first $d(x_*)<0$ at an interior point. Evaluate (1) at Laplace parameter $y=mp(x_*)$. The normalized integration density is proportional to $\exp(m[\log P(x)-p(x_*)x])$. Since $p'<0$, this exponent has a strict unique maximum at $x_*>0$. Concentration there, as in the [oscillation proof](oscillations.md), makes the transform negative for large $m$. The radial parameter is $t=p(x_*)/(p(x_*)+n)$ in every multiplicity.

It remains to consider $d\ge0$ with $d(x_*)=0$, hence $d'(x_*)=0$. In the same density,
$$
 \lim_{m\to\infty} \mathbb E[md-c]=\frac{d''(x_*)}{-2p'(x_*)}-c(x_*).           \tag{2}
$$
Indeed $\sqrt m(x-x_*)$ has limiting normal variance $-1/p'(x_*)$, with convergence of its second moment. On a fixed neighborhood the log density has a strictly negative second derivative, giving a Gaussian bound after rescaling. The complement is exponentially negligible, also for the moments in use, by the strict maximum and linear decay at infinity. Taylor expansion of $d$ at its stationary zero gives (2).

Write $s,k_2,k_3$ for the means of $(x_*+\beta_i)^{-1}$, its square and its cube. At the contact,
$$
 x_*s(1+s)=1,\qquad x_* k_2(1+2s)=s(1+s).
$$
Using $p'=-nk_2$ and $p''=2nk_3$, the right side of (2) equals
$$
 n\,\frac{x_*(1+2s)}{k_2}\left(\frac{k_2^2}{s}-k_3\right)<0 .
$$
The weak sign is Cauchy–Schwarz, with equality only if all reciprocals coincide. Equal $\beta_i$ would force $\beta_i=1$ and $d=n^2/(1+x)^2$, which has no contact. This proves the strict sign in (2). In particular the transform in (1) is negative for all sufficiently large $m$. This proves necessity even at a tangency.

The [exact replay](verify_repeated_blocks.py) checks the operator coefficient identities and the contact algebra. For two of Wanless’s Jerrum blocks it also certifies a negative derivative at one copy and all adjacent inequalities at **every multiplicity from two onward**. The certificate is coefficient positivity of $2D-C$ together with positivity of $D$, not a finite cut on the number of copies. Literature checked includes the direct-sum monotonicity paper, the original boundary problem, Wanless's matching counterexamples and the matching-measure proof inputs. Priority of the equivalence is unconfirmed. [Direct sums](https://doi.org/10.1080/03081089308818193) · [Wanless](https://doi.org/10.1016/S0024-3795(98)10177-5)
