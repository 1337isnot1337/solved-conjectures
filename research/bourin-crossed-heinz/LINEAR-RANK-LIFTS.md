# Why norm-budgeted positive linear lifts lose the crossed singular values

A positive unital linear map $`\Phi:M_n\to M_d`$ gives the comparison budget for converting a rank-$`k`$ question to one operator-norm test if, for all positive $`S`$,
```math
k\lVert\Phi(S)\rVert\le N_k(S).
```
There are such maps, including the normalized additive compound on the $`k`$th exterior power. Here $`N_k`$ is the sum of the largest $`k`$ singular values and the output norm is the operator norm. Even if the output size and map are chosen afresh for each input pair, **no map with this uniform positive-input budget can in general carry the Ky Fan norm of the actual crossed expression into one operator norm**. This excludes a particular route to applying the operator-norm theorem of Tian and Xu. [Operator-norm theorem](https://arxiv.org/abs/2611.22363v2)

For each output unit vector, its vector state pulled back through $`\Phi`$ is a positive normalized functional on $`M_n`$, given by a density matrix $`\rho`$. Testing the budget on every rank-one projection gives $`0\le\rho\le I/k`$. Therefore, for a Hermitian $`Z`$ whose eigenvalues decrease with index,
```math
k\lVert\Phi(Z)\rVert\le
\max\left(\left|\sum_{j=1}^k\lambda_j(Z)\right|,
          \left|\sum_{j=n-k+1}^n\lambda_j(Z)\right|\right).
```
To see both bounds on each vector state, diagonalize $`Z`$. The diagonal of $`k\rho`$ then belongs to $`[0,1]^n`$ and sums to $`k`$. Each extreme of the resulting linear objective is attained by selecting $`k`$ coordinates. The budget permits sums of signed eigenvalues, which differ from sums of singular values.

Let $`P,Q`$ be rank-one projections with overlap $`c\in(0,1)`$ between defining unit vectors, after a harmless phase change. At every real $`0\lt t\lt1`$ their crossed sum is $`Z=PQ+QP`$. On their joint span it has eigenvalues $`c^2+c,c^2-c`$, as one sees from its eigenvectors given by the sum and difference of the two defining vectors. It is zero on the orthogonal complement. For every $`k\ge2`$ take $`n=k+1`$. Then
```math
k\lVert\Phi(Z)\rVert\le c+c^2\lt 2c=N_k(Z).
```
If $`n=k`$, the bound is $`2c^2`$, so the ratio lost can be arbitrarily large. For any fixed interior exponent, replace the projections by $`P+\varepsilon I,Q+\varepsilon I`$. For a power $`r`$, the two matrices are respectively of the form $`a_r I+b_r P`$ and $`a_r I+b_r Q`$ with the same real coefficients. Their crossed sum is a real linear combination of $`I,P+Q,PQ+QP`$, hence stays Hermitian. Continuity of the two signed eigenvalue sums and of the Ky Fan norm preserves strictness for sufficiently small positive $`\varepsilon`$. This gives a positive definite instance as well.

There is also a direct obstruction to separately intertwining functional calculus. If a unital positive map attains the budget exactly for every positive input, a rank-one $`P`$ has $`\lVert\Phi(P)\rVert=1/k`$. Intertwining the crossed square-root expression on the commuting pair $`P,I`$ forces $`\Phi(P)=\sqrt{\Phi(P)}`$, which contradicts its norm. The discrepancy in the crossed expression is at least $`2(k^{-1/2}-k^{-1})`$.

A different, one-sided nonlinear comparison is still possible in principle. For the additive compound $`D_k(X)`$, the sum of its actions on the $`k`$ exterior factors, positivity and linearity give $`\lVert D_k(X)+D_k(Y)\rVert=N_k(X+Y)`$. If $`N_k(C_t(X,Y))\le\lVert C_t(D_k(X),D_k(Y))\rVert`$ held, the known operator bound would resolve Bourin's conjecture. For commuting inputs this proposed inequality follows by scalar Hölder on the $`k`$ selected joint eigenvectors, applied to both ordered products. It remains unproved for arbitrary inputs. The obstruction above applies to the proposed linear left side $`D_k(C_t(X,Y))`$, not to this nonlinear comparison. The projection pair itself satisfies Bourin's real inequality.
