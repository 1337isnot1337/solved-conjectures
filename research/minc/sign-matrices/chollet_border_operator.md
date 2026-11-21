# Chollet's conjecture: the one-border operator route

Status: exact reformulation and limitations, not a proof or disproof of
Chollet's conjecture. Checked on 2026-11-20.

## 1. Exact border identity

Use the convention that a complex inner product is conjugate-linear in its
first argument. Let the columns of $`V`$ be $`v_1,\ldots,v_m\in H`$, and set

```math
A=V^*V,\quad P_A=\mathop{\mathrm{per}}A,\quad
(K_A)_{ij}=\mathop{\mathrm{per}}A(i\mid j).
```

Define

```math
C_A=P_A I_H+V K_A^T V^*.
\tag{1}
```

The transpose is necessary. The cofactor matrix is Hermitian, but replacing
its transpose by itself in (1) is wrong for general complex Gram vectors.
For every $`h\in H`$, permutation expansion at the final row and column gives

```math
\mathop{\mathrm{per}}\mathop{\mathrm{Gram}}(v_1,\ldots,v_m,h)
=P_A\lVert h\rVert^2+
\sum_{i,j}(v_i^*h)(h^*v_j)(K_A)_{ij}
=h^*C_Ah.
\tag{2}
```

Equivalently, if $`g`$ is a standard circular complex Gaussian vector and

```math
F$`g`$=\prod_i v_i^*g,
```

then (C_A=\mathbb E[gg^*|F$`g`$|^2]). Both forms cover singular Gram matrices
and zero vectors without taking an inverse.

Let $`B=U^*U`$ be a second Gram matrix, with columns $`u_i\in K`$, and let

```math
w_i=v_i\otimes u_i,\quad W=[w_1\ \cdots\ w_m],\quad
E=A\circ B,\quad Q=\mathop{\mathrm{per}}E.
```

Set

```math
D_{A,B}=Q I_{H\otimes K}+W K_E^T W^*,\qquad
M_{A,B}=C_A\otimes C_B-D_{A,B}.
\tag{3}
```

For arbitrary $`h\in H`$ and $`k\in K`$, equations (2) and (3) give

```math
\begin{aligned}
\langle h\otimes k,M_{A,B}(h\otimes k)\rangle
={}&\mathop{\mathrm{per}}\mathop{\mathrm{Gram}}(v_1,\ldots,v_m,h)
\mathop{\mathrm{per}}\mathop{\mathrm{Gram}}(u_1,\ldots,u_m,k)\\
&-\mathop{\mathrm{per}}\left(
\mathop{\mathrm{Gram}}(v_1,\ldots,v_m,h)
\circ\mathop{\mathrm{Gram}}(u_1,\ldots,u_m,k)\right).
\end{aligned}
\tag{4}
```

Thus positivity of (3) on **product vectors** is exactly the order $`m+1`$
Chollet inequality. Quantifying over all finite Hilbert spaces, all base
vectors and all $`h,k`$ covers every PSD pair of that order.

Full positive semidefiniteness $`M_{A,B}\succeq0`$ is a sufficient stronger
statement. It has not been proved here. Positivity on product vectors does
not generally imply positive semidefiniteness of a tensor operator.

For the self-conjugate formulation, take $`B=\overline A`$, $`u_i=\overline v_i`$, and $`k=\overline h`$. Positivity only on $`h\otimes\overline h`$,
for every base and every $`h`$, is equivalent to self-Chollet in the next
order. The equivalence of self-Chollet and the arbitrary-pair statement
follows from Cauchy--Schwarz on permutation monomials, as in Chollet's
original reduction and Lemma 5.1 of Li--Zhao--Luo.

## 2. What arbitrary tensor tests would assert

Let $`x,y,z`$ be independent standard circular complex Gaussian vectors in
$`H,K,H\otimes K`$, respectively. For $`q\in H\otimes K`$, put

```math
F$`x`$=\prod_i v_i^*x,\quad H_0$`y`$=\prod_i u_i^*y,\quad
G(z)=\prod_i w_i^*z.
```

Then

```math
q^*M_{A,B}q
=\mathbb E\left[|q^*(x\otimes y)|^2|F$`x`$H_0$`y`$|^2\right]
-\mathbb E\left[|q^*z|^2|G(z)|^2\right].
\tag{5}
```

For a product tensor $`q=h\otimes k`$, the first integrand factors into
the two enlarged Gram permanent moments. For an arbitrary tensor $`q`$,
the additional bilinear polynomial need not split into one linear form
in $`x`$ and one in $`y`$. Such a test is outside the original conjecture.
The earlier negative $`e_2(X_iY_i)`$ moment direction does not have the
factorization in (5), so it is not a counterexample to (3).

## 3. Elementary sufficient tests

The cofactor matrices and their transposes are PSD Gram matrices of
symmetric products with one vector omitted. Consequently,

```math
C_A\succeq P_A I,\qquad
X_E:=W K_E^T W^*\succeq0.
```

Euler's identity for the homogeneous permanent gives

```math
\mathop{\mathrm{tr}}X_E
=\sum_{i,j}E_{ij}\mathop{\mathrm{per}}E(i\mid j)=mQ.
```

It follows that $`D_{A,B}\preceq(m+1)Q I`$. Therefore

```math
(m+1)\mathop{\mathrm{per}}(A\circ B)
\le\mathop{\mathrm{per}}A\mathop{\mathrm{per}}B
\tag{6}
```

is enough to prove the full operator inequality for that pair. This is a
calibration check, not a solution: (6) is much stronger than Chollet near
diagonal matrices.

The full operator inequality also holds when one Gram family consists
of parallel vectors. After absorbing the vector lengths into the other
family, take $`u_i=u`$ with $`\lVert u\rVert=1`$. Then

```math
P_B=m!,\quad C_B=m!(I+muu^*),\quad Q=P_A,
\quad D_{A,B}=P_A I+(C_A-P_A I)\otimes uu^*.
```

On $`H\otimes\mathop{\mathrm{span}}(u)`$, the difference is
$`[m!(m+1)-1]C_A\succeq0`$. On the orthogonal complement it is
$`m!C_A-P_A I\succeq0`$. This calculation gives no general extension
from parallel to arbitrary Gram vectors.

## 4. The published border induction and a precise limit

Li, Zhao and Luo's full text was inspected, including the occupation
decompositions and the induction. For a normalized scalar border, write

```math
F(t)=\sum_{k=0}^{m}\alpha_k t^k,\qquad
\Gamma(a,b)=\sum_{r+s\le m}\gamma_{rs}a^r b^s,
```

with $`\alpha_k,\gamma_{rs}\ge0`$. Their formulas are

```math
\mathop{\mathrm{per}}A=\sum_k(k+1)\alpha_k,\qquad
\mathop{\mathrm{per}}(A\circ\overline A)=\sum_{r,s}(s+1)\gamma_{rs}.
```

The lower-order induction hypothesis controls
$`\Gamma(t,t^2)\le F(t)^2`$. Taking $`t=\sqrt2`$ gives the required
coefficient comparisons through $`m=5`$, hence order six. Their PSD
occupation-sector argument is valid; it is not the false assertion that
arbitrary Gaussian-replacement differences have nonnegative coefficients.

One natural attempt is to replace the single evaluation by a positive
integral over $`t\ge0`$. A uniform coefficientwise proof of this kind
would require a positive measure $`\mu`$ satisfying

```math
\int t^{r+2s}\,d\mu(t)\ge s+1,\qquad
\int t^{k+\ell}\,d\mu(t)\le(k+1)(\ell+1),
\tag{7}
```

for all indices in the displayed coefficient ranges. The constant terms
force $`\mu([0,\infty))=1`$. The indices $`(r,s)=(0,1)`$ and
$`(k,\ell)=(m,0)`$ force

```math
\mathbb E_\mu t^2\ge2,\qquad \mathbb E_\mu t^m\le m+1.
```

For every $`m\ge6`$, Lyapunov's moment inequality instead gives

```math
\mathbb E_\mu t^m\ge(\mathbb E_\mu t^2)^{m/2}
\ge2^{m/2}>m+1.
```

Thus no positive averaging of evaluations repairs this *uniform
coefficientwise* continuation. This does not rule out an argument using
additional relations among coefficients coming from actual PSD matrices.

## 5. Status and sources

No proof or counterexample to full operator positivity (3) was obtained.
No product-vector witness violating (4) was obtained. Consequently this
note does not resolve a named Minc-list entry.

- Yair Lavi, [Conjecture 30](https://yair-lavi.com/mincs-list/conjecture-30/index.html),
  refreshed 2026-11-20: the full conjecture remains open; order six and
  rank-restricted results are prior work.
- Qingfeng Li, Qirui Zhao and Wenhao Luo,
  [Chollet's Permanent Conjecture Through Order Six via Border Induction](https://www.preprints.org/manuscript/202608.2196),
  version 1, 2026-08-31, DOI 10.20944/preprints202608.2196.v1.
  Full Sections 2--5 were inspected. The present positive-measure
  obstruction extends only their explicitly stated fixed-weight method
  limitation; it is not a priority claim about the conjecture.
- Scott Schubr,
  [Asymptotically optimal bounds for permanental cofactor matrices](https://research.luminaryoddities.org/asymptotically-optimal-bounds-permanental-cofactor-matrices/v/2),
  edition 2, 2026-10-27: abstract inspected; the raw-cofactor bounds stated
  there do not supply (3). The page advertises edition 3, 2026-11-13;
  no novelty or completeness claim rests on the older abstract.

The accompanying script checks the exact complex cofactor orientation,
the two border identities, and the product-vector identity. It does not
search finite orders or serve as evidence for universal positivity.
