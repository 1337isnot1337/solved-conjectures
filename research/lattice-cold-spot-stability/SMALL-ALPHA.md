# The deep holes of $`A_n^*`$ are also cold spots for flat Gaussians

The subsequent [all-scale theorem](dual-a-universal/PROOF.md) identifies all minimizers of the dual type-A family for every positive parameter. [Independent review](dual-a-universal/REVIEW.md) · [Reproducible checks](dual-a-universal/verify.py)

In the notation of [STABILITY.md](STABILITY.md), all deep holes of $`A_n^*`$ are exactly the global Gaussian cold spots for every sufficiently small positive $`\alpha`$. Combined with eventual stability for sufficiently large $`\alpha`$, this gives both endpoint regimes of the all-parameter question; it does not cover intermediate parameters.

Let $`N=n+1`$, $`h=\lfloor N/2\rfloor`$, $`H=\{\sum_i z_i=0\}\subset\mathbb R^N`$, and $`q=e^{-\pi^2/\alpha}`$. By Poisson summation in $`H`$, minimizing the Gaussian sum on $`A_n^*`$ amounts to minimizing
```math
 T_q(\zeta)=\sum_{\substack{m\in\mathbb Z^N\\ \sum m_i=0}}
              q^{\|m\|^2}\prod_{i=1}^N\zeta_i^{m_i},
 \qquad \zeta_i=e^{2\pi i z_i}.
```
The factor removed is positive and independent of $`z`$. The function is real, invariant under permutations and common rotations of all $`\zeta_i`$. Thus one may minimize over $`(S^1)^N`$: a common rotation can arrange $`\prod_i\zeta_i=1`$, after which there is a representative $`z\in H`$. Let $`e_j=e_j(\zeta)`$ be the elementary symmetric polynomials. Write $`\zeta^\star`$ for an equally spaced configuration, i.e. a rotated and permuted list of all $`N`$th roots of unity.

## Low Fourier shells

Since $`m_i^2\equiv m_i\pmod2`$, group terms by $`\|m\|^2=2k`$. The positive mass $`j=\sum_{i:m_i>0}m_i`$ equals the negative mass, and $`j\le k`$, with equality if and only if every nonzero $`m_i`$ is $`1`$ or $`-1`$.

Any permutation-orbit sum of a vector with positive mass $`j`$ is a polynomial in the power sums $`p_s=\sum_i\zeta_i^s`$, $`-j\le s\le j`$. To verify this, take the list of nonzero exponents $`a_1,\ldots,a_\ell`$. Sum $`\prod_t\zeta_{i_t}^{a_t}`$ over mutually distinct indices $`i_1,\ldots,i_\ell`$, and divide by the factorials of multiplicities of repeated exponents so that each vector is counted once. Inclusion–exclusion on equalities $`i_t=i_u`$ partitions the slots into blocks, with each block contributing the factor $`p_{\sum_{t\text{ in block}}a_t}`$. Block-merging never increases positive or negative mass, and the sum of block exponents is $`0`$. Since $`p_0=N`$, each nonconstant product has at least one positive and one negative power-sum factor. Newton's identities and $`p_{-s}=\overline{p_s}`$ now express the orbit sum as a constant plus a polynomial in $`e_1,\ldots,e_j`$ and their conjugates, with each nonconstant monomial of degree at least $`2`$.

For $`1\le k\le h`$, the mass-$`k`$ orbit is the sum
```math
 F_k=\sum_{\substack{|A|=|B|=k\\A\cap B=\varnothing}}
          \left(\prod_{i\in A}\zeta_i\right)\overline{\left(\prod_{i\in B}\zeta_i\right)}.
```
In expanding $`|e_k|^2`$, terms with $`A\cap B\ne\varnothing`$ reduce after cancellation to precisely smaller-mass orbit sums (with fixed nonnegative integer multiplicities). Thus the coefficient $`C_k(\zeta)=[q^{2k}]T_q(\zeta)`$ equals $`|e_k|^2`$ plus a constant and a polynomial of degree at least $`2`$ in the lower $`e_j,\overline e_j`$, $`j<k`$. Here the lower polynomial has no constant or linear monomial. It follows, uniformly over the torus, that
```math
 \left|C_k(\zeta)-C_k(\zeta^\star)-|e_k(\zeta)|^2\right|
 \le C_N\sum_{j\lt k}|e_j(\zeta)|^2.
```
Indeed the $`e_j`$ all have bounded absolute value depending only on $`N`$, and two factors of each nonconstant monomial are bounded by the sum of their squares. Summing over $`1\le k\le h`$, the total low-shell error is at most $`C_N' q^2\sum_{j\le h}q^{2j}|e_j|^2`$, for $`q\le1/2`$.

## High Fourier shells, including near equality

Let $`R_q`$ be the sum of terms with $`\|m\|^2\ge 2h+2`$. Its absolute value and its angular Hessian are uniformly $`O_N(q^{2h+2})`$ for $`q\le1/2`$, by Gaussian convergence after differentiating termwise at most twice. Its gradient vanishes at $`\zeta^\star`$: cyclic permutation of its coordinates there is a common rotation, so symmetry makes all angular derivative components equal, while rotation invariance says their sum is zero. Taylor's theorem therefore bounds
```math
 |R_q(\zeta)-R_q(\zeta^\star)|
 \le O_N(q^{2h+2})\,\mathop{\mathrm{dist}}(\zeta,\mathcal E)^2,
```
where $`\mathcal E`$ is the set of equally spaced rotated and permuted phase lists, using the angular torus distance. For example, expand from a closest point of $`\mathcal E`$ using angular lengths in $`[-\pi,\pi]`$; the Hessian bound is global and $`R_q`$ is constant on $`\mathcal E`$.

The vanishing set of all $`e_1,\ldots,e_h`$ is precisely $`\mathcal E`$: on the unit torus $`e_{N-j}=e_N\overline{e_j}`$, so all $`e_j`$ for $`1\le j<N`$ vanish, and the monic root polynomial is $`X^N+(-1)^Ne_N`$. Moreover,
```math
 \mathop{\mathrm{dist}}(\zeta,\mathcal E)^2
 \le C_N''\sum_{j\le h}|e_j(\zeta)|^2.
```
For the local bound near $`\mathcal E`$, use small real angular deviations $`\delta_\ell`$ of mean zero from an equally spaced list, subtracting their mean by a common rotation. Newton's identities at that list give $`de_j=(-1)^{j-1}dp_j/j`$ for $`1\le j<N`$, because all lower elementary and power sums are zero. Thus $`de_j`$ is a nonzero constant times $`\sum_\ell(\zeta_\ell^\star)^j\delta_\ell`$. The coefficients for $`j=1,\ldots,h`$ determine the real deviations of mean zero, by the discrete Fourier transform and conjugate pairing of its modes (including the unpaired $`j=N/2`$ mode for even $`N`$). The derivative is injective on the mean-zero subspace, giving the bound locally by Taylor's theorem, uniformly by compactness. Away from $`\mathcal E`$, the sum of squares has a strictly positive minimum on any compact complement of a neighborhood, giving the remaining global bound.

It follows that the high-tail error is at most $`O_N(q^2)\sum_{j\le h}q^{2j}|e_j|^2`$. Together with the low-shell calculation this gives
```math
 T_q(\zeta)-T_q(\zeta^\star)
 \ \ge\ (1-O_N(q^2))\sum_{j=1}^h q^{2j}|e_j(\zeta)|^2.
```
Take $`q>0`$ sufficiently small depending on $`N`$. Equality holds only for $`\zeta\in\mathcal E`$.

Finally the deep holes of $`A_n^*`$ modulo the lattice are the permutations of the centered staircase $`w=(N-1,N-3,\ldots,1-N)/(2N)`$, by the Voronoi description in [STABILITY.md](STABILITY.md). Their phase lists are equally spaced. Conversely if $`z\in H`$ is equally spaced modulo $`1`$, then $`z=w_\sigma+t\mathbf 1+m`$ for a permutation $`\sigma`$, scalar $`t`$, and $`m\in\mathbb Z^N`$. The condition $`z\in H`$ gives $`t=-\sum m_i/N`$, so $`z-w_\sigma=\pi(m)\in A_n^*`$. This proves the claimed exact minimizer set for all sufficiently small positive $`\alpha`$.
