# Németh–Seberry–Shu conjecture: removing the logarithmic loss

This is a quantitative refinement of the [candidate disproof](manuscript.md), not a separate conjecture. It uses the same uniform $`O(p^{-1/2})`$ permanent estimate extracted in Appendix A of that manuscript from [Divoux–Wang, Proposition 3.1 and its proof](https://arxiv.org/html/2610.23755v1). External review remains outstanding.

**Claim.** If $`V(p)`$ counts distinct permanent values of binary $`p\times p`$ circulants, then $`V(p)\ge c p^{3/2}`$ for an absolute $`c>0`$ and all sufficiently large primes $`p`$. In fact each row sum $`p/3\le k\le 2p/3`$ contributes at least $`c'\sqrt p`$ distinct values.

The earlier proof paid a logarithmic factor to control every Fourier error individually. Only the first conjugate pair needs a sharp individual bound. For the bulk, the sum of fourth powers suffices.

## Fourier profile with a fourth-moment bound

Fix $`p\ge5`$, $`k`$ in the indicated interval, $`\rho=k/p`$, and $`a\in[1/24,1/12]`$. Write $`\zeta=e^{2\pi i/p}`$. Choose independent Bernoulli variables $`X_s`$ with means $`\rho+2a\cos(2\pi s/p)`$. For each frequency $`\ell`$, put $`Y_\ell=\sum_s (X_s-\mathbb EX_s)\zeta^{\ell s}`$. The uncentered expected Fourier coefficients are $`k`$ at zero, $`pa`$ at frequencies $`1,-1`$, and zero elsewhere.

Uniformly in $`\ell`$, $`\mathbb E|Y_\ell|^2\le p`$ and $`\mathbb E|Y_\ell|^4\le3p^2`$. For the fourth moment expand $`Y_\ell\overline{Y_\ell}Y_\ell\overline{Y_\ell}`$: independence and centering eliminate every index pattern containing a singleton. There are $`p`$ patterns with one index and $`3p(p-1)`$ patterns with two indices each appearing twice. Each remaining summand has modulus at most one.

By Markov and a union bound, some realization satisfies all three conditions
```math
 |Y_0|^2\le 8p,\quad |Y_1|^2\le 8p,\quad
 \sum_{\ell\notin\{0,1,-1\}}|Y_\ell|^4\le24p^3.
```
Indeed each failure probability is at most $`1/8`$. Repair the cardinality to $`k`$ by at most $`\sqrt{8p}`$ additions/deletions. Every Fourier coefficient changes by at most that amount. If $`\lambda_\ell`$ are the Fourier eigenvalues of the repaired circulant divided by $`k`$, then, uniformly,
```math
 \lambda_0=1,\qquad
 |\lambda_1-a/\rho|\le 6\sqrt{8/p},\qquad
 \sum_{\ell\notin\{0,1,-1\}}|\lambda_\ell|^4=O(p^{-1}).
```
For the last bound use $`(x+y)^4\le8(x^4+y^4)`$, sum the errors from repair, and divide by $`k^4\ge(p/3)^4`$. Real entries give $`\lambda_{-1}=\overline{\lambda_1}`$. In particular every bulk eigenvalue is $`O(p^{-1/4})`$, which is enough for the required fixed spectral gap.

## Separation and count

Let $`D=C_p(S)/k`$ and $`B=D-J_p`$, where $`J_p`$ has all entries $`1/p`$. We have $`\|B\|_{\max}\le2/p`$ and $`\|B\|_{\rm op}\le1/2`$ for all sufficiently large $`p`$ uniformly in the parameters. By Parseval, $`\sum_{\ell\ne0}|\lambda_\ell|^2=1/\rho-1`$. With $`h(x)=-\log(1-x)-x`$, the log determinant correction is exactly
```math
 \log\det(I-B^TB)^{-1/2}
 =\tfrac12(1/\rho-1)+h(|\lambda_1|^2)
  +\tfrac12\sum_{\ell\notin\{0,1,-1\}}h(|\lambda_\ell|^2).
```
The bulk sum is $`O(p^{-1})`$ by $`h(x)=O(x^2)`$ uniformly on $`0\le x\le1/4`$. The exceptional term differs from $`h((a/\rho)^2)`$ by $`O(p^{-1/2})`$. Combining this with the uniform quantitative permanent estimate gives
```math
 \log\!\left(\frac{\mathop{\mathrm{per}}C_p(S)}{k^p p!/p^p}\right)
 =F(\rho,a)+O(p^{-1/2}),\qquad
 F(\rho,a)=\tfrac12(1/\rho-1)+h((a/\rho)^2).
```
Taking logs preserves the external absolute error because the determinant correction is at least one and the approximating normalized permanent is uniformly bounded away from zero for sufficiently large $`p`$.

On the compact parameter rectangle, $`\partial_a F`$ has a strictly positive lower bound $`b`$. Let $`C>0`$ be a uniform bound on the constant in the last error term. Use amplitudes $`1/24+jL/\sqrt p`$ in $`[1/24,1/12]`$ with fixed $`L>2C/b`$. Successive log permanents differ by at least $`(bL-2C)/\sqrt p>0`$. There are $`\gg\sqrt p`$ amplitudes for each $`k`$. No simultaneous probabilistic event across amplitudes is needed: the existence argument applies separately to each amplitude, with the same bounds. By the [Brualdi–Newman congruence](https://nvlpubs.nist.gov/nistpubs/jres/69B/jresv69Bn3p159_A1b.pdf), $`\mathop{\mathrm{per}}C_p(S)\equiv k\pmod p`$, so the values for different row sums in this interval are disjoint. The $`\gg p`$ row sums give the claim.

The conclusion still depends on the cited analytic input and its quantitative error. It does not resolve the fixed-sparse-row-sum conjecture of Resta and Sburlati.