# Németh–Seberry–Shu conjecture: a quadratic lower bound

**Candidate extension; not externally reviewed.** The [manuscript](manuscript.md) and [fourth-moment refinement](fourth-moment-refinement.md) give simpler proofs of weaker bounds. This note uses the same cited analytic inputs, extracting a sharper error bound. It concerns all row sums collectively, not the fixed-sparse-row-sum conjecture of Resta and Sburlati.

**Claim.** For some absolute $`c>0`$ and all sufficiently large primes $`p`$, the number $`V(p)`$ of distinct permanent values of binary circulants of order $`p`$ satisfies $`V(p)\ge cp^2`$. For every integer $`k`$ with $`p/3\le k\le2p/3`$, the row sum $`k`$ contributes at least $`c'p`$ distinct values, for an absolute $`c'>0`$.

## 1. Tune the first Fourier coefficient to bounded error

Use the Bernoulli model and fourth-moment event in the [preceding note](fourth-moment-refinement.md), with $`a\in[1/24,1/12]`$, $`\rho=k/p`$, and $`\zeta=e^{2\pi i/p}`$. The three bounds there fail with total probability at most $`3/8`$. Also partition the unit circle into twelve fixed half-open sectors of equal width. Each contains $`p/12+O(1)`$ of the points $`\zeta^s`$. In each sector the expected selected and unselected counts are each at least one sixth its size, since the Bernoulli parameters lie in $`[1/6,5/6]`$. By Hoeffding's inequality and a union bound, with probability $`1-o(1)`$ all sectors have both counts at least one twelfth their size. The estimates are uniform in $`k,a`$, so a realization satisfying both events exists.

Repair the cardinality to $`k`$ by $`O(\sqrt p)`$ edits. The first Fourier coefficient is now within $`O(\sqrt p)`$ of $`pa`$. Let $`z`$ be $`pa`$ minus this coefficient. If $`r=|z|\ge4`$, add an unselected root from the sector containing the direction of $`z`$, and remove a selected root from its antipodal sector. The Fourier increment $`\delta`$ has length at most two and projection at least $`2\cos(\pi/6)=\sqrt3`$ on the direction of $`z`$. Hence
```math
 |z-\delta|^2\le r^2-2r\sqrt3+4\le (r-1)^2
 \qquad(r\ge4).
```
Thus at most $`O(\sqrt p)`$ swaps reduce the remaining error to less than four. There are always candidates: each sector started with $`\gg p`$ roots of each type, and the cardinality repair and all swaps together change at most $`O(\sqrt p)`$ membership choices. This argument preserves $`k`$.

Divide the Fourier coefficients by $`k`$ to obtain the eigenvalues of $`D=C_p(S)/k`$. The resulting profile satisfies
```math
 \lambda_1=a/\rho+O(p^{-1}),\qquad \lambda_{-1}=\overline{\lambda_1},
 \qquad \sum_{\ell\notin\{0,1,-1\}}|\lambda_\ell|^4=O(p^{-1}).
```
The bulk estimate follows just as in the preceding note: the original unnormalized fourth sum is $`O(p^3)`$, all edits contribute $`O(\sqrt p)`$ to each coefficient, and $`(x+y)^4\le8(x^4+y^4)`$. In particular the maximum bulk modulus is $`O(p^{-1/4})`$. Thus $`B=D-J_p`$ obeys the same uniform entry and operator bounds as before. Exact Parseval and the log determinant formula from the preceding note give
```math
 \log\det(I-B^TB)^{-1/2}=F(\rho,a)+O(p^{-1}),\quad
 F(\rho,a)=\tfrac12(1/\rho-1)+h((a/\rho)^2),\quad h(x)=-\log(1-x)-x .
```

## 2. Sharpen the quantitative permanent estimate

Use the inputs in [Appendix A of the manuscript](manuscript.md), extracted from [Divoux–Wang, Section 3](https://arxiv.org/html/2610.23755v1): for $`\|B\|_{\max}\le2/p`$, $`\|B\|_{\rm op}\le1/2`$, their rook polynomial $`R_B(s)`$ differs from $`\Delta(s)=\det(I-s^2B^TB)^{-1/2}`$ by $`O(p^{-1})`$ uniformly on $`I=[3/4,5/4]`$. If $`T\sim\mathop{\mathrm{Gamma}}(p+1,1)`$ and $`Z=p/T`$, the normalized permanent equals $`\mathbb E R_B(Z)`$. The absolute contribution of $`R_B(Z)`$ outside $`I`$ is exponentially small by the cited proof. Also $`\mathbb P(Z\notin I)\le e^{-c_0p}`$ for a constant $`c_0>0`$ and all large $`p`$, by exponential moment bounds for Gamma variables.

The new step is to use the *centered* first-order term rather than bound its absolute value. On $`I`$ the functions $`\Delta,\Delta',\Delta''`$ are uniformly bounded: differentiate $`\log\Delta(s)=-\tfrac12\sum_j\log(1-s^2\sigma_j^2)`$, where the singular values satisfy $`\sum_j\sigma_j^2=\|B\|_F^2\le4`$ and $`\max_j\sigma_j\le1/2`$. The denominators are uniformly bounded away from zero and the sums are bounded by constants times $`\sum_j\sigma_j^2`$. Taylor's formula gives
```math
 \Delta(Z)=\Delta(1)+\Delta'(1)(Z-1)+O((Z-1)^2)\quad(Z\in I).
```
The exact moments are $`\mathbb EZ=1`$ and $`\mathbb E(Z-1)^2=1/(p-1)`$. The first moment omitted by restricting to $`I`$ has modulus at most $`\sqrt{\mathbb P(Z\notin I)/(p-1)}`$ by Cauchy–Schwarz. The omitted constant term is also exponentially small; the Taylor remainder contributes $`O(p^{-1})`$. It follows that
```math
 \frac{p^p}{p!}\mathop{\mathrm{per}}(D)=\Delta(1)+O(p^{-1})
```
uniformly. As $`\Delta(1)\ge1`$, taking logarithms retains this error order.

## 3. Count

For every $`k,a`$ in the specified ranges a suitable support therefore has log normalized permanent $`F(\rho,a)+O(p^{-1})`$, uniformly. On the compact rectangle of parameters, $`\partial_a F\ge b>0`$. Let $`C`$ bound the error by $`C/p`$. Take an amplitude grid from $`1/24`$ in steps of $`L/p`$ up to $`1/12`$, with fixed $`L>2C/b`$. Adjacent values of the target function differ by at least $`bL/p`$, so all corresponding permanents for a fixed $`k`$ are distinct. This gives $`\gg p`$ values for each of $`\gg p`$ distinct row sums. The classical congruence $`\mathop{\mathrm{per}}C_p(S)\equiv k\pmod p`$ ensures that values for different row sums are disjoint, proving the proposed bound.

## Related literature

[Kocharovsky, Kocharovsky and Tarasov (2020), §7.2](https://pmc.ncbi.nlm.nih.gov/articles/PMC7516781/) also use a determinantal approximation and Fourier diagonalization for positive weighted circulants. That calculation does not count distinct permanent values of binary circulants. The [literature search](../nemeth-seberry-shu-status-search.md) distinguishes the all-row-sums question from earlier fixed-degree work. Follow-up searches for a quadratic lower bound across all row sums did not locate a prior proof; this is not a priority certification.
