# A determinant-pencil obstruction to one-step unit uncrossing

This note gives an independent proof that a particular four-party degeneration is impossible. It does not refute an asymptotic conversion at rate one or prove a matrix multiplication lower bound. All vector spaces and maps in this note are over the complex numbers.

## The two tensors

Let the party dimensions be $(4,4,2,2)$, with bases $a_{ij}$ and $b_{ij}$ at the first two parties and $c_i,d_j$ at the last two, where $i,j\in\{0,1\}$. Define

```math
S=\sum_{i,j=0}^1 a_{ij}\otimes b_{ij}\otimes c_i\otimes d_j,
\qquad
T=\sum_{i,j=0}^1 a_{ij}\otimes b_{ij}\otimes c_i\otimes d_i.
```

With tensor products regrouped by party, these are respectively

```math
S=U_{ABC}(2)\otimes U_{ABD}(2),
\qquad
T=U_{ABCD}(2)\otimes U_{AB}(2),
```

where missing parties in a partial unit tensor have one-dimensional factors.

**Proposition.** There is no degeneration from $S$ to $T$ by four separate linear maps.

## A closed covariant condition

For any tensor $X$ in these dimensions, write $X_{kl}$ for its $4\times4$ matrix of coefficients at $c_k\otimes d_l$. Form the matrix pencil and its determinant

```math
M_X(Z)=\sum_{k,l=0}^1 z_{kl}X_{kl},
\qquad f_X(Z)=\mathop{\mathrm{det}} M_X(Z),
\qquad
Z=\begin{pmatrix}a&b\\c&d\end{pmatrix}.
```

Thus $f_X$ is homogeneous of degree four in $a,b,c,d$, and every one of its coefficients is a homogeneous degree-four polynomial in the tensor entries. Define

```math
Q(Z)=ad-bc,\qquad
\mathcal D=\frac{\partial^2}{\partial a\,\partial d}
-\frac{\partial^2}{\partial b\,\partial c}.
```

The condition

```math
\mathcal D f_X\in\mathbb C Q
```

is polynomial closed in $X$: all quadratic coefficients except those of $ad$ and $bc$ must vanish, and the coefficients of $ad$ and $bc$ must add to zero. These are homogeneous degree-four equations in the tensor entries.

If four local maps are represented by matrices $L_A,L_B,L_C,L_D$ of the corresponding dimensions, and $Y=(L_A\otimes L_B\otimes L_C\otimes L_D)X$, then direct contraction gives

```math
M_Y(Z)=L_A M_X(L_C^{\mathsf T} Z L_D)L_B^{\mathsf T},
```

and hence

```math
f_Y(Z)=\mathop{\mathrm{det}}(L_A)
\mathop{\mathrm{det}}(L_B)
f_X(L_C^{\mathsf T} Z L_D).
```

The chain rule gives, for any polynomial $h$ and any two $2\times2$ matrices $C,D$,

```math
\mathcal D_Z h(C^{\mathsf T}ZD)
=\mathop{\mathrm{det}}(C)\mathop{\mathrm{det}}(D)
(\mathcal D h)(C^{\mathsf T}ZD).
```

For completeness, let $\epsilon_{01}=1$, $\epsilon_{10}=-1$, and let the other two entries of $\epsilon$ be zero. Then

```math
\mathcal D
=\frac12\sum_{i,j,k,l=0}^1
\epsilon_{ij}\epsilon_{kl}
\frac{\partial^2}{\partial z_{ik}\,\partial z_{jl}}.
```

Substituting the chain rule and using

```math
\sum_{i,j}\epsilon_{ij}C_{ip}C_{jq}
=\mathop{\mathrm{det}}(C)\epsilon_{pq}
```

and its counterpart for $D$ proves the covariance formula. It holds also for singular matrices. The determinant identity gives

```math
Q(C^{\mathsf T}ZD)
=\mathop{\mathrm{det}}(C)\mathop{\mathrm{det}}(D)Q(Z).
```

Consequently the polynomial-closed condition $\mathcal D f_X\in\mathbb C Q$ is preserved by all four local maps. More explicitly, if $\mathcal D f_X=kQ$, then

```math
\mathcal D f_Y
=k\,\mathop{\mathrm{det}}(L_A)
\mathop{\mathrm{det}}(L_B)
\bigl(\mathop{\mathrm{det}}(L_C)
\mathop{\mathrm{det}}(L_D)\bigr)^2Q.
```

Since the condition is closed, it is also preserved under any degeneration of $X$.

## Evaluation on the source and target

In the lexicographic basis $(00,01,10,11)$ of the first two parties,

```math
M_S(Z)=\mathop{\mathrm{diag}}(a,b,c,d),
\qquad
M_T(Z)=\mathop{\mathrm{diag}}(a,a,d,d).
```

Therefore

```math
f_S=abcd,\qquad \mathcal D f_S=bc-ad=-Q,
```

whereas

```math
f_T=a^2d^2,\qquad \mathcal D f_T=4ad.
```

The polynomial $4ad$ is not a scalar multiple of $ad-bc$. The source satisfies the closed covariant condition and the target does not. This proves the proposition.

A single member of the vanishing equations can be displayed explicitly. For any quartic $f$,

```math
[ad]\mathcal Df+[bc]\mathcal Df
=4\bigl([a^2d^2]f-[b^2c^2]f\bigr).
```

It vanishes throughout the local-map orbit closure of $S$, while its value at $T$ is four. This individual equation is used only after proving the covariant condition; no claim that it alone is a relative invariant is needed.

## Scope

The proposition excludes this specific binary one-step degeneration. It does not exclude tensor-power conversions with subexponential loss. It therefore does not settle the spectral numerical inequality that motivated the attempted uncrossing, and it gives no lower bound above two for matrix multiplication. Any asymptotic use still requires its own proof.
