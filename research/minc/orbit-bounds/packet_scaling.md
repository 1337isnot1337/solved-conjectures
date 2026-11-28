# Marcus’s block-permanent inequality

Let $T$ be a square complex contraction of order $k\ge2$. For any positive row weights $x_u$ and column weights $y_v$,
```math
|\mathop{\mathrm{per}} T|\le\frac{\sum_{uv} x_u |T_{uv}|^2 y_v}{k(\prod_u x_u\prod_v y_v)^{1/k}}.                    \tag{1}
```
In particular the infimum over the weights bounds the permanent. With the arithmetic-mean convention of Bochi, Iommi and Ponce, the infimum is $k$ times the scaling mean of the entrywise absolute square. [Scaling mean](https://doi.org/10.1016/j.aim.2016.01.013)

## The contraction bound

For any square $S$, $`|\mathop{\mathrm{per}}S|\le k^{-1}\mathop{\mathrm{tr}}|S|^k`$. Indeed the permanent is the matrix coefficient of $`\mathop{\mathrm{Sym}}^k S`$ at the unit occupation vector with each coordinate used once. Take a singular-value decomposition and apply Cauchy–Schwarz with the nonnegative eigenvalues of the symmetric power of the singular-value diagonal as weights. Each of the two resulting diagonal expectations has the form $\sum_\alpha p_\alpha \prod_j s_j^{\alpha_j}$, where the $s_j$ are the singular values, $\sum\alpha_j=k$, and $\sum_\alpha p_\alpha\alpha_j=1$ for every $j$. This first-moment identity holds for a unitary image of the given occupation vector: differentiating its matrix coefficient on $`\mathop{\mathrm{Sym}}^k(I+t e_j e_j^*)`$ at zero gives the trace of a unit rank-one projector by the permanent expansion at the identity. Weighted arithmetic–geometric mean bounds the expectation by $k^{-1}\sum_j s_j^k$.

Put $`X=\mathop{\mathrm{diag}}(\sqrt{x_u})`$, $`Y=\mathop{\mathrm{diag}}(\sqrt{y_v})`$ and $\theta=2/k$. Schatten interpolation on $X^zTY^z$ gives $`\|X^\theta T Y^\theta\|_{S_k}\le\|T\|_{\mathrm{op}}^{1-\theta}\|XTY\|_F^\theta`$. For completeness, the strip edges have the displayed operator and Frobenius norm bounds because the imaginary powers are unitary. For $0<\theta<1$, let a dual matrix for the $S_k$ norm at $\theta$ have singular values $g_j$ with $\sum g_j^{k/(k-1)}=1$. In its trace pairing use the same left and right singular vectors and powers $g_j^{(k/(k-1))(1-z/2)}$ for positive $g_j$ (omit zero values). At $z=\theta$ the exponent is one. On the left boundary the resulting testing matrix has trace norm one, and on the right boundary it has Frobenius norm one. The scalar three-lines theorem proves the claim. For $k=2$ no interpolation is needed. Apply the preceding permanent bound and cancel the diagonal factors from $`\mathop{\mathrm{per}}(X^\theta TY^\theta)`$. This gives (1), in fact with an additional factor $`\|T\|_{\mathrm{op}}^{k-2}`$ on the right for a general $T$.

Choosing $y_v=1$ and optimizing $x$ gives
```math
|\mathop{\mathrm{per}}T|\le\prod_u\Big(\sum_v |T_{uv}|^2\Big)^{1/k}.        \tag{2}
```
A zero row gives the result directly. For positive row sums take reciprocal row sums as $x_u$.

## Compressing arbitrary diagonal majorants

Let $C$ be a Gram matrix of $m$ internally orthonormal packets of size $k\ge2$. Write $`G_{ij}=\mathop{\mathrm{per}} C_{ij}`$. Put $w_{uv}=|c_{uv}|^2$ off the diagonal, $w_{uu}=0$, and $g_{ij}=|G_{ij}|$ for $i\ne j$, $g_{ii}=0$. Each cross matrix is a contraction. For any $`D=\mathop{\mathrm{diag}}(d_u)>0`$, set $`\bar D=\mathop{\mathrm{diag}}(\bar d_i)`$ with $\bar d_i=(\prod_{u\in i}d_u)^{1/k}$. Then
```math
\rho(\bar D^{-1/2}g\bar D^{-1/2})\le\rho(D^{-1/2}WD^{-1/2}).           \tag{3}
```
Indeed apply (1) to each cross matrix with $x_u=d_u^{-1/2}$ and $y_v=d_v^{-1/2}$. The left normalized matrix is bounded entrywise by $`E^* D^{-1/2}WD^{-1/2} E`$, where $E$ sends each packet coordinate to the unit vector constant on that packet and zero elsewhere. The within-packet blocks of $W$ vanish. Spectral-radius monotonicity for nonnegative matrices and the norm bound for the compression prove (3).

In particular $M(g)\le M(W)/k$ for the [variational quantity](irregular_correlations.md) obtained by minimizing $\sum_u\phi(d_u)$ under $D\succeq W$, $d_u\ge1$. Indeed (3) preserves feasibility, and $x\mapsto\phi(\exp x)=x-1+e^{-x}$ for $x\ge0$ is convex. This comparison controls the contribution of unequal row energies without replacing them by a common row sum.

## Diffuse packet overlaps at every packet size

**Theorem.** Fix $T<\infty$. There exists $\eta_T>0$ such that the strict Marcus inequality $`\mathop{\mathrm{per}}C>\mathop{\mathrm{per}}G`$ holds for every $k\ge2$, every $m$, and any nonidentity Gram matrix of internally orthonormal packets satisfying
```math
\max_u\sum_v w_{uv}\le T,\qquad V_g=\sum_{i\ne j}|G_{ij}|^2\le\eta_T S,
\qquad S=\sum_{uv} w_{uv}.
```
Only the *packet* overlaps have to be diffuse. Strong vector correlations and vanishing cross-packet permanents are allowed.

Take an optimizing $D$ for $W$ as in the [diagonal-majorant proof](irregular_correlations.md); it satisfies $1\le d_u\le K=1+T^2/4$. By (1) with unit weights, $s_i=\sum_{j\ne i}g_{ij}\le k^{-1}\sum_{u\in i}\sum_v w_{uv}$, so $\sum_i s_i\le S/k$. Apply the projection estimate of that proof to the PSD matrix $G$, as follows. Remove packets with $s_i<\epsilon$, paying log-permanent cost at most $\epsilon S/k$ by the unit-vector deletion bound. There are at most $S/(k\epsilon)$ remaining packets. Restrict $\bar D$ to them. The Hermitian matrix $R=\bar D^{-1/2}(G-I)\bar D^{-1/2}$ on those indices has top eigenvalue at most one by (3) and the triangle inequality, and its squared Frobenius norm is at most $V_g$. Split off the spectral projection onto eigenvalues greater than $0<w<1$, of rank at most $V_g/w^2$. As in the Gaussian integration giving (5) in the linked proof, for $0<e<1$ one obtains
```math
\log\mathop{\mathrm{per}}G\le\frac{M(W)}{k}+\frac{S}{k}\left[\epsilon+\frac{wK-\log(1-e)}{\epsilon}\right]+\frac{V_g}{w^2}\log(1/e).
```
The full sum of $\phi(\bar d_i)$ before restriction is at most $M(W)/k$ by convexity, and all its terms are nonnegative. The same proof gives $`2\log\mathop{\mathrm{per}}C\ge(1+\delta_T)M(W)`$, with $\delta_T>0$, while the [correlation energy estimate](correlation_energy.md) gives $`\log\mathop{\mathrm{per}}C\ge S/[6\max(27/4+T,2T)]`$. Because $k\ge2$, the difference $`\log\mathop{\mathrm{per}}C-M(W)/k`$ has a positive lower bound proportional to $S$ depending only on $T$. Choose $\epsilon$, then $w,e$, then $\eta_T$ small enough to absorb all the displayed errors. Since $C\ne I$ gives $S>0$, strictness follows. The numerator here is the actual PSD matrix $G$, so the projection argument does not require entrywise modulus to preserve positive semidefiniteness.
