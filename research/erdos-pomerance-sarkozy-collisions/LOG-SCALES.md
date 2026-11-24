# Exact collision asymptotics for \(n+\omega(n)\) on logarithmically typical scales

Let
\[
F(x)=\#\{1\le m<n\le x:m+\omega(m)=n+\omega(n)\}.
\]
[Erdős, Pomerance and Sárközy (1987), §3](https://combinatorica.hu/~p_erdos/1987-15.pdf) conjecture \(F(x)\sim c x\) for some \(c>0\). The following theorem identifies the only possible constant and proves the asymptotic outside an exceptional set of scales of logarithmic density zero. It does not remove those scales.

**Theorem.** There is a set \(\mathcal X\subseteq\mathbb N\) of logarithmic density one such that
\[
F(x)=(1/2+o(1))x\qquad(x\to\infty,\ x\in\mathcal X).
\]
Moreover,
\[
\sum_{\substack{m<n,\ m\le X\\m+\omega(m)=n+\omega(n)}}\frac1m
=(1/2+o(1))\log X.
\]
The main input is [Tao–Teräväinen, arXiv:2512.01739v2, Theorem 3.1](https://arxiv.org/html/2512.01739v2), a quantitative two-point multiplicative correlation bound outside exceptional logarithmic scales. Their Remark 4.2 treats fixed shifts and spectra for successive additive-function values; the argument below allows a growing family of shifts and sums the matching diagonal.

## 1. Local count and truncating the gaps

Put \(L=\log\log X\) and let \(x\in[\sqrt X,X]\). Set
\[
A(x)=\frac1x\sum_{x\le m<2x}\sum_{h\ge1}
\mathbf 1_{\omega(m)-\omega(m+h)=h}.
\]
For \(h>10L\) the matching condition implies \(\omega(m)\ge h\). The factorial-moment estimate in [the Pomerance–Sárközy fluctuation note](pomerance-sarkozy-omega-fluctuations.md), applied to all primes up to \(2x\) and using \(\sum_{p\le2x}1/p=L+O(1)\), shows that these terms contribute \(O(e^{-cL})\) to \(A(x)\), uniformly in \(x\).

Take \(y=L^6\), \(z=X^{1/L^6}\), and \(w(m)=\sum_{y<p\le z}\mathbf 1_{p\mid m}\). For each \(1\le h\le10L\), on the uniform sample \(m\in[x,2x)\), the pair \((w(m),w(m+h))\) is within \(O(L^{-6})\) total variation of independent Poisson variables of mean
\[
\lambda=\sum_{y<p\le z}1/p=L+O(\log L).
\]
This is the same incidence comparison as in the fluctuation note, now with just two shifts: CRT inclusion errors are \(O(1/x)=O(X^{-1/2})\), so the same Bonferroni order \(R=\lfloor L^3\rfloor\) gives errors smaller than any fixed negative power of \(L\). The primewise categorical-to-independent and Poisson errors are \(O(1/y)\); the distinct shifts differ by less than \(y\).

The omitted primes have reciprocal mass \(O(\log L)\), uniformly up to \(3x\). Consequently for either argument \(m,m+h\), the mean omitted count is \(O(\log L)\), and the probability it exceeds a sufficiently large absolute multiple of \(\log L\) is \(O(L^{-10})\) by the factorial-moment count. These claims use the bound on the number of multiples up to \(3x\), divided by the length of \([x,2x)\), for sets of omitted primes.

Write \(H_0=\lfloor\sqrt L\log L\rfloor\). If \(H_0<h\le10L\) yields a match, then apart from the omitted-prime and coupling exceptions, the absolute difference of two independent Poisson variables of mean \(\lambda\) is at least \(h-O(\log L)\). The exponential-moment bound for each Poisson upper or lower tail gives probability \(O(\exp(-c h^2/L))\) in this range. Sum over \(h\le10L\), together with their \(O(L^{-6})\) per-shift exceptional probabilities. Thus uniformly in \(x\),
\[
A(x)=\frac1x\sum_{h=1}^{H_0}\sum_{x\le m<2x}
\mathbf 1_{\omega(m)-\omega(m+h)=h}+o(1).
\tag{1}
\]

## 2. Uniform major arcs

Write \(e(t)=e^{2\pi it}\) and
\[
C_{x,h}(\alpha)=\frac1x\sum_{x\le m<2x}
e\bigl(\alpha(\omega(m)-\omega(m+h))\bigr).
\]
The slight difference between normalizing by \(x\) and by the number of sampled integers is \(O(1/x)\). The difference in the two exponential factors from omitting primes is bounded by \(O(|\alpha|)\) times the omitted counts. The Poisson pair comparison therefore gives
\[
C_{x,h}(\alpha)=\exp(2\lambda(\cos(2\pi\alpha)-1))
+O\bigl(|\alpha|\log L+L^{-6}+1/x\bigr)
\tag{2}
\]
uniformly in \(h\le H_0\). For \(|\alpha|\le\alpha_0=L^{-3/8}\), the error integrates to \(O(L^{-3/4}\log L)\), which sums over \(H_0\) shifts to \(o(1)\).

On this range the model characteristic factor differs from \(\exp(-4\pi^2\lambda\alpha^2)\) by \(O(\lambda\alpha^4e^{-c\lambda\alpha^2})\), by the cosine expansion and the mean-value theorem. Its integral is \(O(L^{-3/2})\). Extending the Gaussian integral to all real \(\alpha\) costs \(O(e^{-c L^{1/4}})\) by the tail estimate. Thus
\[
\sum_{h=1}^{H_0}\int_{-\alpha_0}^{\alpha_0}
C_{x,h}(\alpha)e(-\alpha h)\,d\alpha
=\sum_{h=1}^{H_0}\frac{\exp(-h^2/(4\lambda))}{2\sqrt{\pi\lambda}}+o(1)
=\tfrac12+o(1),
\tag{3}
\]
uniformly in \(x\). The last step is the positive-half-line Gaussian Riemann sum, with \(H_0/\sqrt\lambda\to\infty\).

## 3. Minor arcs on logarithmically typical scales

For \(\alpha_0\le|\alpha|\le1/2\), the multiplicative function \(f_\alpha(m)=e(\alpha\omega(m))\) satisfies the nonpretentious condition of Tao–Teräväinen's Theorem 3.1 with \(\mathcal L=\exp(c_0 L^{1/4})\), for some small absolute \(c_0>0\). More explicitly their [§4.1 proof of (4.9)](https://arxiv.org/html/2512.01739v2#S4.SS1) applies to \(f_\alpha\): on primes its value is the constant \(e(\alpha)\), exactly as for \(e(\alpha\Omega)\), and the proof of the pretentious-distance lower bound depends only on prime values. For a nonprincipal Dirichlet character, or for principal character and twisting frequency of magnitude at least \(2L\), their zero-free-region bound on \(\sum_{p} \chi(p)p^{it}/p\) gives distance squared \(\gg L\). Their PNT with partial summation gives the same for principal character and \((\log X)^{-1/2}\le |t|<2L\). Finally for principal character and \(|t|<(\log X)^{-1/2}\), use primes between \((\log X)^{1/125}\) and \(\exp((\log X)^{1/4})\): uniformly on these primes \(p^{it}=1+O((\log X)^{-1/4})\), so the squared-distance summands are bounded below by \((1-\Re e(\alpha))/2\gg \alpha_0^2\). Their reciprocal mass is \(\gg L\), giving squared distance \(\gg L^{1/4}\). This checks their condition for the claimed \(\mathcal L\).

Apply Theorem 3.1 with \(g_1=f_\alpha\), \(g_2=\overline{f_\alpha}\), no progression congruence, and shifts \(0,h\). Each \(h\le H_0\) is well within their permitted \(\mathcal L^c\) range. Replacing their interval endpoints by those in \(C_{x,h}\) costs \(O(1/x)\). The bound on the correlation off the theorem's exceptional set, and the logarithmic measure bound for that set, give
\[
\int_{\sqrt X}^X |C_{x,h}(\alpha)|\,\frac{dx}{x}
\ll \exp(-c_1 L^{1/4})\log X
\]
uniformly in these \(\alpha,h\), with \(c_1>0\). Integrating this estimate in \(\alpha\), and summing over \(h\le H_0\), costs only \(o(\log X)\). Here no choice of common frequency exceptional set is needed, since the bound is on the integral of the absolute value. The Fourier identity for an exact integer equality, (1), and (3) now yield
\[
\int_{\sqrt X}^X |A(x)-\tfrac12|\,\frac{dx}{x}=o(\log X).
\tag{4}
\]

## 4. From local averages to collision asymptotics

Let \(b(m)=\sum_{h\ge1}\mathbf 1_{\omega(m)-\omega(m+h)=h}\), and \(B(t)=\sum_{m\le t}b(m)\). We have \(b(m)\le\omega(m)\ll\log(m+1)\). For \(t\in[\sqrt X,X]\), sum its dyadic intervals \([t/2^j,t/2^{j-1})\) down through all \(j\ge1\) such that \(t/2^j\ge X^{1/4}\). Then \(B(t)/t\) is the sum of \(2^{-j}A(t/2^j)\) over these \(j\), up to \(O(X^{-1/4}\log X)\) from the omitted initial range (and the possible endpoint \(t\)). The coefficients sum to \(1+O(X^{-1/4})\). Integrate the resulting upper bound for \(|B(t)/t-1/2|\) over \([\sqrt X,X]\). For any \(j\), the contribution after substitution \(x=t/2^j\) is at most \(2^{-j}\int_{X^{1/4}}^X |A(x)-1/2|\,dx/x\), which is \(2^{-j}o(\log X)\) by using (4) both at parameter \(X\) and at parameter \(\sqrt X\) (the definition of \(A\) is independent of the parameter). Summing the weights gives
\[
\int_{\sqrt X}^X |B(t)/t-\tfrac12|\,\frac{dt}{t}=o(\log X).
\tag{5}
\]

The difference \(B(t)-F(t)\) counts pairs crossing the terminal endpoint \(t\). Because \(h\le\omega(m)\ll\log(2t)\) for \(m\le t\), such \(m\) lie within \(O(\log t)\) of \(t\), and the excess is \(O((\log t)^2)\). Thus (5) also holds with \(F\). Iterating (5) over \([\sqrt X,X]\), \([X^{1/4},\sqrt X]\), etc. shows the full integral from \(2\) to \(X\) is \(o(\log X)\): each estimate is at most \(\eta\) times the logarithm of its upper endpoint once that endpoint is large, and the remaining initial interval contributes a constant depending on \(\eta\). Integer weights \(1/n\) yield the same conclusion since \(F(t)=F(\lfloor t\rfloor)\) and \(F(t)\ll t\log (2t)\). A diagonal choice of tolerance cutoffs, using logarithmic density, gives the single set \(\mathcal X\).

Finally partial summation gives \(\sum_{m\le X}b(m)/m=B(X)/X+\int_1^X B(t)\,dt/t^2\). The boundary term is \(O(\log\log X)=o(\log X)\) from \(b(m)\le\omega(m)\) and the elementary mean estimate for \(\omega\). The integral is \((1/2+o(1))\log X\) by (5) and its extension to the full range. This proves the weighted statement.
