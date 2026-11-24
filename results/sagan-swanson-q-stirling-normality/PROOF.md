# Sagan–Swanson's generic q-Stirling normality conjecture

**Result.** Suppose $k/n\to\alpha\in(0,1)$. All four families $c[n,k],c_B[n,k],S[n,k],S_B[n,k]$ of $q$-Stirling polynomials are asymptotically normal: their normalized coefficients define random exponents that converge to the standard normal after centering at their own mean and dividing by their own standard deviation. This proves [Sagan–Swanson, *q-Stirling numbers in type B*, Conjecture 7.8](https://users.math.msu.edu/users/bsagan/Papers/Old/qStB-pub.pdf#page=32), *European J. Combin.* 118 (2024), 103899, also [arXiv:2205.14078](https://arxiv.org/abs/2205.14078).

The source's Theorem 7.7 concerns fixed $k$ for the second kind, not this regime. The distinct bottom-heaviness Conjecture 7.6 is proved in [ChinaXiv:202609.00184](https://chinarxiv.org/items/chinaxiv-202609.00184). Searches by exact conjecture label and by the variable-rank regime did not find a prior proof of Conjecture 7.8. We make no unconditional priority claim.

## 1. A common conditional probability model

Write $[m]_q=1+q+\cdots+q^{m-1}$ and $r=n-k$. The elementary or complete homogeneous symmetric polynomial representations (Section 2 of the source) are
$$
\begin{array}{c|c|c|c}
\text{family}&\text{symmetric function}&N &m_i,\ 1\le i\le N\\\hline
c[n,k]&e_r([m_1]_q,\ldots,[m_N]_q)&n-1&i\\
c_B[n,k]&e_r([m_1]_q,\ldots,[m_N]_q)&n&2i-1\\
S[n,k]&h_r([m_1]_q,\ldots,[m_N]_q)&k&i\\
S_B[n,k]&h_r([m_1]_q,\ldots,[m_N]_q)&k+1&2i-1 .
\end{array}
$$
Let $M=m_N$, $a_i=m_i/M$, and pick $\lambda_N>0$ as specified below. In an elementary family, let $J_i$ be independent Bernoulli variables with odds $w_i=\lambda_N a_i$. In a homogeneous family, let $J_i$ be independent geometric variables with
$\Pr(J_i=j)=(1-w_i)w_i^j$ for $j\ge0$; take $\lambda_N<1$.
For each $i$, independently generate a sequence of uniforms $U_{i,j}$ on $\{0,\ldots,m_i-1\}$, independent of all occupancies $J_i$. Set
$$
 Y_i=M^{-1}\sum_{j=1}^{J_i}U_{i,j},\qquad T=\sum_i J_i,\qquad Y=\sum_iY_i.
$$
The exponent variable $X$ of the $q$-Stirling polynomial is distributed as $MY$ conditional on $T=r$. To check this, given $J_i=j_i$ the ordinary exponent generating factor is $([m_i]_q/m_i)^{j_i}$. Multiplying by the occupancy probabilities and conditioning on total $r$ cancels the common factors and leaves weights proportional to $\prod_i[m_i]_q^{j_i}$ on the allowed occupancy vectors, with each vector included once. These are exactly the terms of $e_r$ or $h_r$; normalization at $q=1$ gives the claimed distribution.

## 2. Saddle parameter and limiting covariances

Let $u(w)$ and $v(w)$ be the mean and variance of the occupancy with parameter $w$, given by
$$
 \begin{array}{c|cc}
       &u(w)&v(w)\\\hline
 \mathrm{Bernoulli\ odds}&w/(1+w)&w/(1+w)^2\\
 \mathrm{geometric}&w/(1-w)&w/(1-w)^2 .
 \end{array}
$$
Choose the unique parameter $\lambda_N$ satisfying
$$
 \sum_{i=1}^N u(\lambda_N a_i)=r.                               \tag{1}
$$
In the Bernoulli case the left side increases continuously from $0$ to $N$, so the parameter exists for all sufficiently large $n$. In the geometric case it increases from $0$ to infinity as $\lambda_N\uparrow1$ because $a_N=1$. We have $r/N\to\beta$, with $\beta=1-\alpha\in(0,1)$ in the Bernoulli case and $\beta=(1-\alpha)/\alpha>0$ in the geometric case. For any fixed parameter in the respective domain,
$$
 \frac1N\sum_i u(\lambda a_i)\ \longrightarrow\
 I(\lambda)=\int_0^1 u(\lambda x)\,dx
$$
because $a_i=i/N+O(N^{-1})$ uniformly. The continuous strictly increasing $I$ has range $(0,1)$ in the Bernoulli case, $(0,\infty)$ in the geometric case (the limiting integral at $\lambda=1$ diverges). Bracketing the unique solution of $I(\lambda)=\beta$ by fixed parameters shows $\lambda_N\to\lambda$, an interior solution. Consequently the $J_i$ have uniformly bounded exponential moments around zero, and $0\le Y_i\le J_i$. Throughout, all bounds may depend on $\alpha$ and the chosen elementary/homogeneous family.

Write $\mu_N=\mathbb EY$. With $v_i=v(w_i)$ and $u_i=u(w_i)$, the uniform mark $U_{i,1}/M$ has mean $b_i=(m_i-1)/(2M)$ and variance $s_i^2=(m_i^2-1)/(12M^2)$. Thus
$$
\begin{split}
 \operatorname{Var}(T)&=\sum_i v_i,\\
 \operatorname{Cov}(T,Y)&=\sum_i v_i b_i,\\
 \operatorname{Var}(Y)&=\sum_i(v_i b_i^2+u_i s_i^2).
\end{split}
$$
After division by $N$, these three quantities converge respectively to
$$
 A=\int_0^1 v(\lambda x)\,dx,\quad
 B=\int_0^1 v(\lambda x)\frac{x}{2}\,dx,\quad
 C=\int_0^1\left(v(\lambda x)\frac{x^2}{4}
                  +u(\lambda x)\frac{x^2}{12}\right)\,dx.
$$
Here $A>0$, and $V=C-B^2/A>0$: Cauchy–Schwarz controls the variance contribution weighted by $v$, leaving the strictly positive integral weighted by $u$.

## 3. Local limit estimate under real exponential tilts

For fixed real $t$, exponentially tilt the independent pairs $(J_i,Y_i)$ by $\exp(\delta Y_i)$, where $\delta=t/\sqrt N$, and use $\Pr_\delta,\mathbb E_\delta$ for the tilted law. Under that law the occupancy of site $i$ still belongs to its original family, with new parameter
$$
 w_i(\delta)=w_i\,\mathbb E\exp(\delta U_{i,1}/M).
$$
For geometric occupancies this remains uniformly below 1 for large $N$, by the interior parameter bound. This follows directly by integrating the exponential tilt over the $J_i$ independent marks. Uniform bounds on the exponential moments give the Taylor expansions
$$
 \mathbb E_\delta T=r+\delta\,\operatorname{Cov}(T,Y)+O(N\delta^2),\qquad
 \operatorname{Var}_\delta T=\operatorname{Var}(T)+O(N|\delta|).
                                                                    \tag{2}
$$
For example, differentiating the normalized tilted moments at each site gives covariance as the derivative of mean, and higher derivatives are bounded by uniform tilted moments. The errors are uniform for bounded $t$. In particular, $(r-\mathbb E_\delta T)/\sqrt N\to-tB$, and $\operatorname{Var}_\delta T/N\to A$.

We need the scalar lattice local limit at that point:
$$
 \sqrt N\,\Pr_\delta(T=r)
 \ \longrightarrow\ \frac{1}{\sqrt{2\pi A}}
                     \exp\!\left(-\frac{t^2B^2}{2A}\right).          \tag{3}
$$
Here is a proof, including the aperiodicity condition. A fixed positive fraction of the sites have $a_i\in[1/3,2/3]$, and their tilted laws have probabilities of both $0$ and $1$ bounded below by a common positive constant. For an integer law with these two probabilities, expanding the squared characteristic modulus via two independent copies gives
$$
 |\mathbb E_\delta e^{isJ_i}|^2
 \le 1-4\Pr_\delta(J_i=0)\Pr_\delta(J_i=1)\sin^2(s/2).
$$
The product of centered characteristic functions of all sites is therefore bounded by $\exp[-cN\sin^2(s/2)]$ for a fixed $c>0$. Under $s=v/\sqrt N$ and $|s|\le\pi$, this is bounded by $\exp[-c'v^2]$. For fixed $v$, the uniform third-moment bound and (2) imply convergence of that centered product to $\exp(-Av^2/2)$, by expansion of each factor and then its logarithm. Fourier inversion for the integer variable $T$, followed by dominated convergence and the centered phase with limit $-tB$, now gives (3) by evaluating the Gaussian Fourier integral. This argument works also at $t=0$.

## 4. Conditional normality and the actual normalization

The conditional moment generating function factors exactly:
$$
 \mathbb E\left[e^{t(Y-\mu_N)/\sqrt N}\mid T=r\right]
 =
 \left(\prod_i\mathbb E e^{t(Y_i-\mathbb EY_i)/\sqrt N}\right)
 \frac{\Pr_\delta(T=r)}{\Pr_0(T=r)}.                              \tag{4}
$$
For each fixed $t$, the exponential-moment bound gives a uniform third-order remainder for the centered log-MGF of each $Y_i$. The product in (4) tends to $\exp(t^2 C/2)$. By (3), the second factor tends to $\exp(-t^2B^2/(2A))$. Thus (4) converges to $\exp(t^2V/2)$ for all fixed real $t$, and the conditional law of $(Y-\mu_N)/\sqrt N$ converges to the centered normal with variance $V$.

The convergence uses an open interval of real $t$ around zero. In particular (4) at $t=\pm1$ gives a uniform exponential tail bound, so the first and second moments also converge. It follows that
$$
 \mathbb EX=M\mu_N+o(M\sqrt N),\qquad
 \operatorname{Var}(X)\sim M^2 N V.
$$
Centering at the true mean and rescaling by the true standard deviation gives the claimed standard normal, by Slutsky's theorem. The four cases share the same proof, and in each case the limiting variance of the unstandardized exponent is a strictly positive constant times $n^3$.

## 5. Stronger local limit

In fact, with $X$ the conditioned exponent, the same setup gives
$$
 \sup_{j\in\mathbb Z}\left|
 M\sqrt N\,\Pr(X=j)
 -\frac{1}{\sqrt{2\pi V}}\exp\left(
    -\frac{(j/M-\mu_N)^2}{2NV}\right)\right|\longrightarrow0 .     \tag{5}
$$
This makes the parabolic logarithmic profile near the peak in the source precise on every bounded standardized window.

For a direct proof, apply two-dimensional lattice inversion to the unconditioned pair $(T,MY)$. Write $\psi_i(t)=\mathbb E e^{itU_{i,1}}$ and $p_i(j)=\Pr(J_i=j)$. The squared modulus of the site characteristic function at $(s,t)$ is at most
$$
 1-2p_i(0)p_i(1)\bigl(1-\Re[e^{is}\psi_i(t)]\bigr),
$$
by retaining only the terms with occupancies $(0,1)$ and $(1,0)$ in the expansion over independent copies. On a positive fraction of sites, $m_i/M\in[1/3,2/3]$ and $p_i(0)p_i(1)$ is bounded below. For these sites and $|Mt|\le1$, $|s|\le\pi$, the bound $1-\cos u\ge c u^2$ on $|u|\le\pi+1$ gives
$$
 1-\Re[e^{is}\psi_i(t)]\ge c\,\mathbb E(s+tU_{i,1})^2
 \ge c'(s^2+M^2t^2).
$$
The second inequality follows because $\operatorname{Var}(U_{i,1}/M)$ is bounded below and $\mathbb E(U_{i,1}/M)$ is bounded above; the corresponding $2\times2$ Gram matrices have bounded trace and determinant bounded below.

On $1\le|Mt|\le K$ for fixed $K$, the modulus of $\psi_i(t)$ is uniformly below 1 on these sites for large $N$. Indeed, its uniform Riemann-sum limit, with $x=m_i/M\in[1/3,2/3]$ and $v=Mt$, is $x^{-1}\int_0^x e^{ivu}\,du$, of modulus strictly below 1 on the indicated compact set. For $K\le |Mt|\le\pi M$,
$$
 |\psi_i(t)|=\frac{|\sin(m_i t/2)|}{m_i|\sin(t/2)|}
 \le \frac{3\pi}{M|t|}\le \frac12
$$
if $K\ge6\pi$. The product characteristic function is therefore bounded by $\exp[-cN(s^2+M^2t^2)]$ on the inner rectangle and by $\exp[-c'N]$ outside it.

Under $s=u/\sqrt N$, $t=v/(M\sqrt N)$, the characteristic function centered at $(r,M\mu_N)$ converges pointwise to that of covariance matrix $\left(\begin{smallmatrix}A&B\\B&C\end{smallmatrix}\right)$, again by uniform third moments. The above bounds give convergence in $L^1$ of the scaled Fourier integrands: the outer rectangle contributes at most $O(MN e^{-c'N})=o(1)$, and on the inner rectangle there is an integrable Gaussian bound. Thus the two-dimensional local limit is uniform in the two lattice indices. At the first index $r$, its limiting density is the bivariate normal density with first coordinate zero and second coordinate $(j/M-\mu_N)/\sqrt N$. Divide by the scalar estimate (3) at $t=0$ to obtain (5). The same statement holds with the true conditional mean and standard deviation in the usual local-normal scaling by the moment convergence in Section 4.
