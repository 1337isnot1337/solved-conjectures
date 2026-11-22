# A lower bound for releasing all noisy threshold scores

Let $`T_m`$ be the $`m`$ by $`m`$ lower-triangular all-ones matrix, with columns $`u_j`$. Its rows are the predictions of a VC-one threshold class on ordered features $`1,\ldots,m`$, with one more feature at which all predictions vanish. Give all features label zero. The vector of empirical mistake counts is the sum of the corresponding columns (zero for the extra feature).

Consider any mechanism that releases this vector plus data-independent noise $`N\in\mathbb R^m`$ of finite second moments. The noise may be correlated across thresholds and its law may depend on $`n,m`$. Suppose the **actual original CMI of the release** is at most $`C`$ nats for every iid data distribution. For all sufficiently large $`n`$ depending only on $`C`$,
```math
 \max_i\sqrt{\mathrm{Var}(N_i)}\ \ge\ c_C\sqrt n\log(m+1).
```
This excludes a universal proof via additive release of all empirical scores with dimension-free $`O(\sqrt n)`$ coordinate RMS noise. It still allows mechanisms tailored to releasing only a good classifier. In particular, the [proper threshold learner](../../results/steinke-zakynthinou-thresholds/PROOF.md) solves this restricted class. The matrix lower bound used below is classical; see [Matoušek, Nikolov and Talwar, Factorization Norms and Hereditary Discrepancy](https://arxiv.org/abs/1408.1376).

## Two feature values force a covariance inequality

Fix $`j`$ and take the feature law uniform on $`j`$ and the extra zero feature. Write $`T`$ for the full iid paired pool and $`X`$ for the number of selected $`j`$ entries. Conditional on $`T`$, this count has the law of an integer translate of $`\mathrm{Bin}(K,1/2)`$, where the number $`K`$ of mixed rows is $`\mathrm{Bin}(n,1/2)`$ before conditioning. The maximal fair binomial atom is at most $`C_1/\sqrt{K+1}`$ by the central binomial coefficient bound. Applying Shannon entropy's maximal-atom lower bound and $`\Pr(K<n/4)\le e^{-n/16}`$ yields
```math
 H(X\mid T)\ge \tfrac12\log(n+1)-C_2 .
```
Here and below the $`C_i`$ are absolute constants.

Write $`\Sigma=\mathrm{Cov}(N)`$. For any real $`a`$ with $`a^Tu_j\ne0`$, project the release onto $`a`$, remove its known noise mean, and divide by $`a^Tu_j`$. The observer obtains $`X+Z`$ with $`\mathbb EZ=0`$ and $`\mathrm{Var}(Z)=a^T\Sigma a/(a^Tu_j)^2`$. Use the rounding convention $`[s]=\lfloor s+1/2\rfloor`$. Because $`X`$ is integer, $`X=[X+Z]-[Z]`$. Consequently
```math
 H(X\mid X+Z,T)\le H([Z])\le\tfrac12\log\big(C_3(1+\mathrm{Var}(Z))\big).
```
For the second inequality, add an independent uniform random variable on $`[-1/2,1/2]`$ to $`[Z]`$. Its differential entropy equals the discrete entropy of $`[Z]`$, while its variance is at most $`2\mathbb EZ^2+1`$. Apply the Gaussian maximal entropy inequality.

The projected information is a lower bound on the release's CMI by data processing, since $`X`$ is determined by the selector and $`T`$. Combining the last displays forces $`1+\mathrm{Var}(Z)\ge c e^{-2C}(n+1)`$. For sufficiently large $`n`$ this implies $`\mathrm{Var}(Z)\ge c_C n`$. For $`a^Tu_j=0`$ the resulting quadratic inequality is automatic. The same covariance works for every two-feature distribution, hence
```math
 \Sigma\succeq c_C n u_j u_j^T \qquad(1\le j\le m).
```

## Factoring the prefix matrix

Each $`u_j`$ belongs to the range of $`\Sigma`$. Factor $`T_m=AB`$ with $`A=\Sigma^{1/2}`$ and columns $`b_j=\Sigma^{\dagger/2}u_j`$ in $`B`$. The quadratic inequalities give $`\|b_j\|_2\le 1/\sqrt{c_C n}`$ by conjugation on the range. The rows of $`A`$ have norms $`\sqrt{\Sigma_{ii}}`$. The nuclear norm therefore satisfies
```math
 \|T_m\|_*\le\|A\|_F\|B\|_F
 \le m\max_i\sqrt{\Sigma_{ii}}/\sqrt{c_C n}.
```
For completeness, $`T_m^{-1}`$ has diagonal ones and subdiagonal minus ones. The Gram matrix $`(T_m^{-1})^TT_m^{-1}`$ has diagonal $`2,\ldots,2,1`$ and off-diagonal $`-1`$. Sine vectors $`w_i=\sin(i\theta)`$ have eigenvalue $`2-2\cos\theta`$ if $`\sin((m+1)\theta)=\sin(m\theta)`$. Taking $`\theta=(2k-1)\pi/(2m+1)`$ for $`1\le k\le m`$ gives all eigenvalues. The singular values of $`T_m`$ are therefore the reciprocals of $`2\sin((2k-1)\pi/(4m+2))`$. Their sum is at least $`(2m+1)\sum_{k\le m}1/(2k-1)/\pi`$. Substitution proves the claim.

The same nuclear-norm estimate shows that the [bounded-score representation](bounded-score-noise.md) cannot have $`VU=O(1)`$ for all these threshold classes. Subtract the all-zero column if the baseline $`b(x)`$ is nonzero, and subtract the all-zero threshold row after including that classifier. More explicitly the matrix of the mixed differences satisfies $`T_{ij}=\langle v_i-v_0,u_j-u_0\rangle`$, giving $`\|T_m\|_*\le4mVU`$. Including the zero classifier preserves VC dimension one.
