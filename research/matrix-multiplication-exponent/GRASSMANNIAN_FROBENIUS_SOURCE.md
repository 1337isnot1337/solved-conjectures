# A four-party Grassmannian Frobenius source

Research status: the flat algebra, its four-party unit degeneration, and the exterior multiplication matrices below are proved explicitly. They reorganize an available source; they do not establish the geodesic trade. The full coupled coefficient equation is stated in Section 6 and remains open.

The algebra and its root-of-unity description are known. Primary references are K. Rietsch, *Quantum cohomology rings of Grassmannians and total positivity*, arXiv:math/0112022v1, Proposition 4.3, Corollary 5.2, Proposition 6.1, and Theorem 10.1:

<https://arxiv.org/pdf/math/0112022v1>.

The proof below independently reconstructs the particular four-party degeneration and its normalizations from a finite Fourier calculation. It is not a claim of a new semisimplicity theorem.

## 1. Basis and trace polynomial

Fix $`1\leq k<s`$, and write

```math
p=\binom sk,\qquad d=k(s-k),\qquad
\epsilon=(-1)^{k(k-1)/2}.
```

Let $`\mathcal P`$ be the set of partitions fitting in the $`k`$-by-$`(s-k)`$ rectangle. For $`\lambda\in\mathcal P`$, put

```math
I_\lambda=\{\lambda_{k+1-a}+a-1:1\leq a\leq k\}
\subseteq\{0,\ldots,s-1\}.
```

These are the $`p`$ distinct $`k`$-subsets. Define

```math
\Delta(x)=\prod_{a<b}(x_b-x_a),\qquad
s_\lambda(x)=
 \frac{\det(x_b^{\lambda_{k+1-a}+a-1})_{a,b=1}^k}{\Delta(x)}.
                                                                    \tag{1}
```

The quotient is the usual Schur polynomial. For a symmetric polynomial $`f`$, define

```math
\tau_\kappa(f)=\frac{\epsilon}{k!}
 \sum_{\ell_1,\ldots,\ell_k\geq0}
 [x_1^{s-1+s\ell_1}\cdots x_k^{s-1+s\ell_k}]
       f(x)\Delta(x)^2\;\kappa^{\ell_1+\cdots+\ell_k}.       \tag{2}
```

This is a finite sum and hence a polynomial in $`\kappa`$. In particular

```math
\tau_0(f)=\frac{\epsilon}{k!}
 [x_1^{s-1}\cdots x_k^{s-1}]f(x)\Delta(x)^2.                \tag{3}
```

For $`\kappa\ne0`$, let $`Z_\kappa=\{z:z^s=\kappa\}`$. The elementary root sum

```math
\frac1s\sum_{z\in Z_\kappa}z^{m-(s-1)}
=\begin{cases}\kappa^\ell&m=s-1+s\ell,\ \ell\geq0,\\
0&\text{otherwise},\end{cases}\qquad(m\geq0)
```

gives the exact expression

```math
\tau_\kappa(f)
=\frac{\epsilon}{k!s^k}
 \sum_{(z_1,\ldots,z_k)\in Z_\kappa^k}
 \frac{f(z)\Delta(z)^2}{\prod_{a=1}^k z_a^{s-1}}.           \tag{4}
```

Repeated roots contribute zero. The expression is symmetric in the ordered roots, so equivalently it is a sum over $`k`$-subsets, with weight

```math
w_S(\kappa)=\frac{\epsilon}{s^k}
             \frac{\Delta(z_S)^2}{\prod_{z\in S}z^{s-1}}.   \tag{5}
```

Every such weight is nonzero. If $`f`$ is homogeneous of degree $`D`$, equation (2) shows that $`\tau_\kappa(f)`$ vanishes unless $`D=d+s\ell`$ for an integer $`\ell\geq0`$.

## 2. Exact pairing and flat multiplication

For a rectangle partition define the complementary partition

```math
\lambda^c=(s-k-\lambda_k,\ldots,s-k-\lambda_1).
```

Then

```math
\tau_\kappa(s_\lambda s_\mu)=\delta_{\mu,\lambda^c}
\quad\hbox{for every }\lambda,\mu\in\mathcal P.             \tag{6}
```

Indeed, the product in (2) is the product of the two alternants in (1). In each variable its degree is at most $`2s-2`$, so only the coefficient with exponent $`s-1`$ in every variable can contribute to (2). This coefficient is zero unless the two exponent sets are complementary under $`a\mapsto s-1-a`$, which is exactly $`\mu=\lambda^c`$. In that case there are $`k!`$ terms, each with sign $`\epsilon`$. The prefactor $`\epsilon/k!`$ gives (6).

Let $`\mathcal A`$ be the free $`\mathbb C[\kappa]`$-module on symbols $`\sigma_\lambda`$, $`\lambda\in\mathcal P`$, and define

```math
\sigma_\lambda\sigma_\mu
=\sum_{\nu\in\mathcal P}
 \tau_\kappa(s_\lambda s_\mu s_{\nu^c})\sigma_\nu.           \tag{7}
```

For $`\kappa\ne0`$, evaluation at the $`p`$ root subsets identifies this multiplication with pointwise multiplication on $`\mathbb C^p`$. To see this without assuming a basis theorem, consider the $`s`$-by-$`s`$ Vandermonde matrix $`(z^a)_{0\leq a<s,z\in Z_\kappa}`$. It is invertible. Its $`k`$-th exterior matrix is also invertible. Dividing each column by its nonzero Vandermonde $`\Delta(z_S)`$ gives precisely the square Schur evaluation matrix $`(s_\lambda(z_S))_{\lambda,S}`$. Thus the latter is invertible. Equation (6) and the nonzero weights (5) then make (7) the coefficients of pointwise multiplication in this basis.

Associativity and the unit identity for $`\sigma_\varnothing`$ are polynomial identities in $`\kappa`$, true for every nonzero $`\kappa`$, hence true also at zero. Thus (7) is a flat family of $`p`$-dimensional commutative algebras. Define its Frobenius functional by

```math
\tau_\kappa(\sigma_\lambda)=\delta_{\lambda,(s-k)^k}.
```

The product pairing is (6), so it is nondegenerate at every parameter, including zero. This functional is the Frobenius or Poincare functional. It is not the ordinary trace of the regular multiplication representation.

For identification with the usual presentation, the family is

```math
\mathbb C[\kappa,e_1,\ldots,e_k]
 /(h_{s-k+1},\ldots,h_{s-1},h_s-\kappa).                    \tag{8}
```

At a root subset, the generating series for the $`h_j`$ is

```math
\prod_{z\in S}(1-zt)^{-1}
=\frac{\prod_{z\in Z_\kappa\setminus S}(1-zt)}{1-\kappa t^s},
```

which proves the displayed relations. The Schur basis theorem for this presentation is Rietsch Corollary 5.2; it identifies (8) with the already constructed free family (7). In the usual quantum-cohomology parameter $`q`$, $`\kappa=(-1)^{k-1}q`$. None of the tensor-budget statements below require importing that geometric interpretation.

## 3. The four-party tensor and its exact budget

In four fixed $`p`$-dimensional spaces define

```math
\mathcal F_\kappa
=\sum_{\lambda,\mu,\nu,\rho\in\mathcal P}
 \tau_\kappa(s_\lambda s_\mu s_\nu s_\rho)
 e_\lambda^A\otimes e_\mu^B\otimes e_\nu^C\otimes e_\rho^D.
                                                                    \tag{9}
```

For nonzero $`\kappa`$, put $`v_S=\sum_\lambda s_\lambda(z_S)e_\lambda`$. Equation (4) gives

```math
\mathcal F_\kappa
=\sum_{S\subseteq Z_\kappa,\ |S|=k}
 w_S(\kappa)\,v_S^A\otimes v_S^B\otimes v_S^C\otimes v_S^D. \tag{10}
```

Choose a new parameter $`\varepsilon`$, set $`\kappa=\varepsilon^s`$, and enumerate the roots as $`z=\varepsilon\zeta`$, $`\zeta^s=1`$. All four local maps in (10) are Laurent-polynomial maps over $`\mathbb C(\varepsilon)`$: each Schur entry is homogeneous, and $`w_S`$ has the single scaling $`\varepsilon^{-d}`$. The coefficients of the complete tensor are polynomial by (2). Taking the constant coefficient proves

```math
U_{ABCD}(p)\ \unrhd\ \mathcal F_0.                         \tag{11}
```

In fact its four-party border rank is exactly $`p`$. The upper bound is (11). For the lower bound contract the C and D coordinates with the unit basis covectors; the resulting AB matrix is the nondegenerate pairing (6), of rank $`p`$. Matrix rank is bounded by tensor border rank.

This is a degeneration of a **four-party** unit. Replacing it by only a three-party multiplication tensor would omit the actual D algebra coordinate needed below.

## 4. Explicit exterior multiplication matrices

Let $`V=\mathbb C^s`$, with basis $`e_0,\ldots,e_{s-1}`$, and define the cyclic shift

```math
J_\kappa e_a=e_{a+1}\quad(a<s-1),\qquad
J_\kappa e_{s-1}=\kappa e_0.
```

Identify the algebra basis with exterior basis vectors by

```math
\Phi(\sigma_\lambda)=e_{I_\lambda}\in\Lambda^kV.             \tag{12}
```

For an integer $`m\geq1`$, write $`p_m(x)=\sum_{a=1}^k x_a^m`$, and let $`M_{p_m}`$ be multiplication by its class in the algebra. Then

```math
\Phi M_{p_m}\Phi^{-1}=\mathrm d\Gamma(J_\kappa^m),            \tag{13}
```

where $`\mathrm d\Gamma(T)`$ acts on an exterior tensor by applying $`T`$ in each of its $`k`$ slots and summing. This is an additive exterior action, not the exterior power of $`T`$.

For a root $`z`$, the row covector $`f_z(e_a)=z^a`$ obeys $`f_zJ_\kappa=zf_z`$. The exterior row $`f_{z_1}\wedge\cdots\wedge f_{z_k}`$ evaluates $`e_{I_\lambda}`$ as $`\Delta(z_S)s_\lambda(z_S)`$. It is an eigenrow of the right side of (13), with eigenvalue $`\sum_{z\in S}z^m`$. The same Schur evaluation rows diagonalize multiplication on the left. They form a basis for $`\kappa\ne0`$, proving (13) there. Both matrices are polynomial in $`\kappa`$, so the identity holds at zero as well.

Thus the special algebra acts on $`\Lambda^k\mathbb C^s`$ through the commuting additive shifts $`\mathrm d\Gamma(J_0^m)`$. This supplies explicit matrices for transporting any algebra multiplier between legs of (9). It does not supply arbitrary independent matrices on two source legs.

## 5. A small exact model

For $`k=2,s=4`$, use the ordered basis

```math
1,s_1,s_2,s_{11},s_{21},s_{22}.
```

Under (12), its subset labels are respectively

```math
\{0,1\},\{0,2\},\{0,3\},\{1,2\},\{1,3\},\{2,3\}.
```

At $`\kappa=0`$, the nonzero products of two nonunit positive-degree basis elements are

```math
s_1^2=s_2+s_{11},\qquad
s_1s_2=s_1s_{11}=s_{21},\qquad
s_1s_{21}=s_2^2=s_{11}^2=s_{22}.                            \tag{14}
```

All omitted products are zero; in particular $`s_2s_{11}=0`$. The functional extracts the coefficient of $`s_{22}`$. Therefore every entry of the six-dimensional four-party source is determined by (14), including all entries involving three or four positive-degree factors.

## 6. The complete new operator equation

Tensor $`\mathcal F_0`$ with a C--D wire of size $`Q`$ and the two flag wires. Choose outside operator maps $`A_\lambda^a,B_\mu^b`$, a scalar C map $`\Gamma_{kl,\nu c}`$, and D operators $`X_{\rho c}^{ij}`$. With $`r`$ full-unit families, the output coefficient is exactly

```math
\sum_{z=1}^r\sum_{\lambda,\mu,\nu,\rho\in\mathcal P}
 \sum_{c=1}^Q
 \tau_0(s_\lambda s_\mu s_\nu s_\rho)
 \Gamma^{(z)}_{kl,\nu c}
 A_{z,\lambda}^{a}X_{z,\rho c}^{ij}B_{z,\mu}^{b}.             \tag{15}
```

The desired full target requires (15) to equal

```math
\delta_{ai}\delta_{bj}\delta_{ki}\delta_{lj}I
```

for every output index. A one-party-compressed target replaces that right side by the explicitly specified compression; its rank still has to satisfy the established rank-fraction criterion.

D knows its own algebra basis index $`\rho`$ and the wire index $`c`$. It does **not** independently know $`\lambda,\mu,\nu`$. In particular one must retain the coefficient $`\tau_0(s_\lambda s_\mu s_\nu s_\rho)`$; replacing its nonzero support by independent product spaces is an unauthorized enlargement of the source.

The Frobenius rule permits a multiplication operator to move between source legs, since all four expressions $`\tau_0((fa)bcd)`$, $`\tau_0(a(fb)cd)`$, $`\tau_0(ab(fc)d)`$, and $`\tau_0(abc(fd))`$ agree. These are the actual permitted source-index identities. Equation (13) writes them in exterior coordinates. A fused operator identity satisfying (15), with the required costs, has not yet been derived.

The exact finite replay is [check_grassmannian_frobenius_source.py](check_grassmannian_frobenius_source.py).
It checks the Gr(2,4) model, not the missing operator equation (15).
[SQUARE_C_LAURENT_OBSTRUCTION.md](SQUARE_C_LAURENT_OBSTRUCTION.md)
excludes the full target for one square-C family with negligible flag
loss; several distinct C maps or a sufficiently large compression are
outside that obstruction.
