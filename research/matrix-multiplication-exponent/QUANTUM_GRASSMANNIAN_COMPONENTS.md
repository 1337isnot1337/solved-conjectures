# Exact quantum-degree sources and explicit middle components

Research status: the source-rank bound, the displayed coefficient witnesses, and the conciseness statements below are proved. No operator map from these sources to the required geodesic target is established.

We use the algebra and normalizations of [GRASSMANNIAN_FROBENIUS_SOURCE.md](GRASSMANNIAN_FROBENIUS_SOURCE.md). In particular

```math
p=\binom sk,\qquad d=k(s-k),\qquad
\mathcal F_\kappa
 =\sum_{\lambda,\mu,\nu,\rho}
 \tau_\kappa(s_\lambda s_\mu s_\nu s_\rho)
 e_\lambda^Ae_\mu^Be_\nu^Ce_\rho^D,
```

where $`1\le k<s`$. The parameter is $`\kappa`$; the usual quantum-cohomology parameter satisfies $`\kappa=(-1)^{k-1}q`$.

## 1. Exact coefficient sources at cost $`O(k)p`$

Every Schur basis class has degree at most $`d`$. The trace polynomial vanishes on a homogeneous input of degree $`D`$ unless $`D=d+s\ell`$ with $`\ell\ge0`$. Hence

```math
\mathcal F_\kappa=\sum_{\ell=0}^{L}\kappa^\ell\mathcal F^{[\ell]},
\qquad
L=\left\lfloor\frac{3d}{s}\right\rfloor\le3k.               \tag{1}
```

Let $`\zeta`$ be a primitive $`(L+1)`$-st root of unity. Exact Fourier interpolation gives

```math
\mathcal F^{[\ell]}
 =\frac1{L+1}\sum_{j=0}^{L}\zeta^{-j\ell}
            \mathcal F_{\zeta^j}.                        \tag{2}
```

Every parameter in this sum is nonzero. The root-subset decomposition of $`\mathcal F_\kappa`$ has exactly $`p`$ ordinary rank-one terms at such a parameter. Therefore

```math
\mathop{\mathrm{rank}}\mathcal F^{[\ell]}\le(L+1)p,
\qquad
U_{ABCD}((L+1)p)\ \ge\ \mathcal F^{[\ell]}.                \tag{3}
```

Here $`\ge`$ denotes an exact local restriction. Equation (3) is an ordinary tensor-rank bound, with no border limit needed. Equivalently, one may use $`L+1`$ full direct-sum families of size $`p`$. When $`k\to\infty`$ and $`\log k=o(\log s)`$, this overhead is $`p^{o(1)}`$.

The coefficient source has only terms with

```math
|\lambda|+|\mu|+|\nu|+|\rho|=d+s\ell.                     \tag{4}
```

It is not asserted that every $`\ell\le L`$ occurs. The next section gives an explicit nonvanishing range.

## 2. Multiplication by the top elementary class is a cyclic exterior shift

Let $`e_k=x_1\cdots x_k=s_{(1^k)}`$. On the subset basis, multiplication by $`e_k`$ is

```math
\Phi M_{e_k}\Phi^{-1}=\Lambda^k J_\kappa,                 \tag{5}
```

where $`J_\kappa e_a=e_{a+1}`$ for $`a<s-1`$ and
$`J_\kappa e_{s-1}=\kappa e_0`$. This is a multiplicative exterior power. It is different from the additive exterior formula for power sums.

To prove (5), use the exterior Vandermonde eigenrows from the source construction. On a root subset $`S`$, multiplication by $`e_k`$ has eigenvalue $`\prod_{z\in S}z`$. The same exterior row is an eigenrow of $`\Lambda^kJ_\kappa`$ with that eigenvalue. The evaluation matrix is invertible for nonzero $`\kappa`$; both sides of (5) are polynomial in $`\kappa`$, so equality extends to zero.

For a k-subset $`I\subseteq\{0,\ldots,s-1\}`$, define

```math
w_I(m)=\sum_{a\in I}\left\lfloor\frac{a+m}{s}\right\rfloor,
\qquad
I(m)=\{(a+m)\bmod s:a\in I\}\qquad(m\ge0).
```

Let $`\lambda(I)`$ be the rectangle partition associated with $`I`$. Equation (5) gives

```math
e_k^m\sigma_{\lambda(I)}
 =\varepsilon_{I,m}\kappa^{w_I(m)}
       \sigma_{\lambda(I(m))},\qquad
\varepsilon_{I,m}\in\{1,-1\}.                            \tag{6}
```

The sign is the sign needed to sort the shifted exterior basis. If $`m=qs+r`$, $`0\le r<s`$, and $`t=\#\{a\in I:a+r\ge s\}`$, then
$`\varepsilon_{I,m}=(-1)^{t(k-t)}`$.
The associated degrees satisfy

```math
|\lambda(I(m))|=|\lambda(I)|+km-sw_I(m).                  \tag{7}
```

For integer $`m`$, the function $`w_I(m)`$ begins at zero and increases by either zero or one at each step, because the elements of $`I`$ have distinct residues modulo $`s`$.

## 3. Explicit nonzero coefficients in a middle range

Put $`n=s-k`$, and first take $`I_0=\{0,\ldots,k-1\}`$, the unit class. For every integer $`0\le m\le3n`$, split

```math
m=a_1+a_2+a_3,\qquad 0\le a_1,a_2,a_3\le n.
```

The rectangular Schur class satisfies $`s_{(a^k)}=e_k^a`$.
Write $`\lambda_m=\lambda(I_0(m))`$. The parameter-independent complementary pairing and (6) give the exact scalar identity

```math
\tau_\kappa\!\left(
 s_{(a_1^k)}s_{(a_2^k)}s_{(a_3^k)}s_{\lambda_m^c}
\right)
 =\varepsilon_{I_0,m}\kappa^{w_{I_0}(m)}.                \tag{8}
```

At the final allowed value of m, equation (7) and
$`0\le|\lambda_{3n}|\le d`$ imply

```math
w_{I_0}(3n)
 =\frac{3kn-|\lambda_{3n}|}{s}
 \ge\frac{2d}{s}.                                      \tag{9}
```

Since $`w_{I_0}`$ visits every integer from zero to this final value, (8) proves

```math
\mathcal F^{[\ell]}\ne0
\quad\text{for every }0\le\ell\le\left\lfloor\frac{2d}{s}\right\rfloor.
                                                               \tag{10}
```

Each instance has a displayed coefficient equal to $`1`$ or $`-1`$, not merely a generic nonvanishing argument.

In particular the index

```math
\ell_*=\left\lceil\frac ds\right\rceil                   \tag{11}
```

lies in this range. Indeed $`d/s\ge1/2`$, and
$`\lceil x\rceil\le\lfloor2x\rfloor`$ for $`x\ge1/2`$.
The total degree of this middle component lies in
$`[2d,2d+s)`$. In the sparse regime with $`k\to\infty`$, it is
$`(2+o(1))d`$.

The classical source's argument that one of A, B, C has degree at most $`d/3`$ consequently does not apply to this component. This observation alone gives no target map or spectral improvement.

## 4. The middle component has full one-party flattenings

For every k-subset $`I`$, equation (7) at $`m=2n`$ gives

```math
w_I(2n)
 =\frac{|\lambda(I)|+2d-|\lambda(I(2n))|}{s}
 \ge\frac ds.
```

Thus for every $`0\le\ell\le\ell_*`$, and every $`I`$, there is an
$`m\in\{0,\ldots,2n\}`$ with $`w_I(m)=\ell`$.
Split $`m=a+b`$, $`0\le a,b\le n`$, and set
$`\mu=\lambda(I(m))^c`$. Then

```math
\tau_\kappa\!\left(
 s_{\lambda(I)}s_\mu s_{(a^k)}s_{(b^k)}
\right)
 =\varepsilon_{I,m}\kappa^\ell.                          \tag{12}
```

For these fixed three last basis labels, no other first label can contribute at all. Multiplication by $`e_k^m`$ sends each basis vector to a nonzero scalar monomial times a different basis vector over $`\mathbb C(\kappa)`$, and the complementary pairing selects exactly one of them. This statement is a polynomial identity, so its coefficient of $`\kappa^\ell`$ has the same unique first label.

Consequently, in the A-versus-BCD flattening of $`\mathcal F^{[\ell]}`$, each row has a column with its nonzero coefficient and with zero coefficients in every other row. These columns are distinct. The flattening has rank $`p`$. The source is symmetric in its four parties, so all four one-party flattenings have rank $`p`$:

```math
\mathop{\mathrm{rank}}_{A\mid BCD}\mathcal F^{[\ell]}
=\mathop{\mathrm{rank}}_{B\mid ACD}\mathcal F^{[\ell]}
=\mathop{\mathrm{rank}}_{C\mid ABD}\mathcal F^{[\ell]}
=\mathop{\mathrm{rank}}_{D\mid ABC}\mathcal F^{[\ell]}=p
\quad(0\le\ell\le\ell_*).                               \tag{13}
```

This is a conciseness statement. It does not identify the tensor with a full unit or give its asymptotic subrank.

## 5. The complete operator problem remains

For a fixed component, the legal output coefficient still has the coupled form

```math
\sum_{z,\lambda,\mu,\nu,\rho,c}
 [\kappa^\ell]\tau_\kappa(s_\lambda s_\mu s_\nu s_\rho)
 \Gamma^{(z)}_{\gamma,\nu c}
 A_{z,\lambda}^{a}X_{z,\rho c}^{ij}B_{z,\mu}^{b}.          \tag{14}
```

The D map reads its actual algebra label $`\rho`$, its wire label $`c`$, and its output label $`i,j`$. It cannot independently read $`\lambda,\mu,\nu`$. The target may use the separately justified large flag channels and a C compression, but all coefficients of that projected target must still match (14).

Equations (3), (10), and (13) supply concrete source tensors with controlled cost and no missing nonvanishing premise. They do not solve (14).

The exact finite coefficient replay is
[check_quantum_component_witnesses.py](check_quantum_component_witnesses.py).
The fixed classical deficit and its scope are proved in
[RECOVERABLE_OUTPUT_CAPACITY.md](RECOVERABLE_OUTPUT_CAPACITY.md).
