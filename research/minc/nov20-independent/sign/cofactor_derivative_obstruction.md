# A negative derivative remainder in the cofactor contraction route

Date: 20 November 2026 (America/Chicago).

Status: an exact obstruction to one proposed induction step. The full
cofactor comparison and Chollet's conjecture remain unproved here.
The displayed family satisfies the full cofactor comparison. It is not
a counterexample to any numbered Minc entry.

## The border identity

For a positive semidefinite Gram matrix $`B`$ on vectors
$`v_1,\ldots,v_m`$, write

```math
K(B)_{ij}=\mathop{\mathrm{per}}B(i\mid j),\qquad
L(B)=K(B\circ\overline B),\qquad
D(B)=K(B)\circ\overline{K(B)}-L(B).
```

Let $`A`$ be the Gram matrix obtained by adjoining a vector $`w`$, and
put $`a=\|w\|^2`$. The first $`m`$ indices are denoted by $`I`$.
In Fischer polynomial space let $`\ell_i`$ represent $`v_i`$ and put
$`f_i=\prod_{j\ne i}\ell_j`$. Normal ordering for the linear form
$`\ell_w`$ gives

```math
K(A)[I,I]=aK(B)+T,\qquad
T_{ij}=\left\langle\partial_w f_i,\partial_w f_j\right\rangle.
\tag{1}
```

Here $`\partial_w=M_{\ell_w}^*`$. The inner product has monomial
weights $`\alpha!`$, as in the
[Fischer Gram-order note](../inequalities/chollet_gram_order.md).
Thus $`T\succeq0`$.

Apply the same identity to the paired Gram vectors
$`v_i\otimes\overline{v_i}`$ and
$`w\otimes\overline w`$. The latter has squared norm $`a^2`$, so

```math
L(A)[I,I]=a^2L(B)+U,\qquad U\succeq0,
\tag{2}
```

where $`U`$ is the Gram matrix of the derivatives of the paired
omitted products. Consequently,

```math
\begin{aligned}
D(A)[I,I]
={}&a^2D(B)
 +2a\mathop{\mathrm{Re}}
       \bigl(K(B)\circ\overline T\bigr)\\
&+\bigl(T\circ\overline T-U\bigr).
\end{aligned}
\tag{3}
```

Under an induction hypothesis $`D(B)\succeq0`$, the first term is
positive semidefinite. The second is positive semidefinite by the Schur
product theorem, followed by averaging a matrix with its conjugate.
The tempting assertion that the last term is also positive semidefinite
is false.

## An exact family

For a real parameter $`t\ge0`$, use

```math
v_1=e_3,\qquad v_2=te_1+e_2,\qquad
v_3=te_1-e_2,\qquad w=e_2.
```

Then $`a=1`$ and

```math
B_t=\begin{pmatrix}
1&0&0\\
0&t^2+1&t^2-1\\
0&t^2-1&t^2+1
\end{pmatrix},\qquad
A_t=\begin{pmatrix}
1&0&0&0\\
0&t^2+1&t^2-1&1\\
0&t^2-1&t^2+1&-1\\
0&1&-1&1
\end{pmatrix}.
\tag{4}
```

These matrices are positive semidefinite by the displayed Gram
realization. The ordinary derivatives of the omitted products are

```math
\partial_w f_1=-2z_2,\qquad
\partial_w f_2=-z_3,\qquad
\partial_w f_3=z_3.
```

Their Gram matrix is therefore

```math
T=\begin{pmatrix}
4&0&0\\
0&1&-1\\
0&-1&1
\end{pmatrix}.
```

For the paired vectors, the first derivative is
$`(v_2\otimes v_2)+(v_3\otimes v_3)
=2t^2e_1\otimes e_1+2e_2\otimes e_2`$.
The other two derivatives both equal $`e_3\otimes e_3`$.
They are orthogonal to the first one. Hence

```math
U=\begin{pmatrix}
4(t^4+1)&0&0\\
0&1&1\\
0&1&1
\end{pmatrix},\qquad
T\circ\overline T-U
=\mathop{\mathrm{diag}}\bigl(4(3-t^4),0,0\bigr).
\tag{5}
```

The first entry is negative for $`t>3^{1/4}`$ and tends to minus
infinity. At the integer choice $`t=2`$, it equals $`-52`$.
This failure uses genuine derivatives of the exact cofactor families;
it does not enlarge the family to arbitrary polynomial vectors.

## The compensating terms remain positive

At entry $`(1,1)`$, the three terms of (3) are respectively

```math
2(t^4-1)^2,\qquad 16(t^4+1),\qquad 4(3-t^4).
```

Their sum is

```math
D(A_t)_{11}=2t^8+8t^4+30>0.
\tag{6}
```

At $`t=2`$, the terms are $`450`$, $`272`$, and $`-52`$, with sum
$`670`$. In particular, deleting the compensating base and cross terms
would change the mathematical question.

The complete matrix $`D(A_t)`$ is positive semidefinite as well. Set
$`u=t^2`$. The first Gram vector in (4) is orthogonal to the last
three, so the off-diagonal block of $`D(A_t)`$ vanishes. Its final
three-by-three block is

```math
2u\begin{pmatrix}1\\-1\\0\end{pmatrix}
   \begin{pmatrix}1&-1&0\end{pmatrix}
+2\begin{pmatrix}1\\1\\1-u^2\end{pmatrix}
   \begin{pmatrix}1&1&1-u^2\end{pmatrix}.
\tag{7}
```

Together with (6), this is an explicit positive semidefinite
decomposition of the full cofactor comparison. The averaged gap from
the [Chollet bridge note](chollet_cofactor_bridge.md) is also positive:

```math
\|\Gamma(A_t)\|_F^2
-4\mathop{\mathrm{per}}(A_t\circ A_t)
=4t^8+20t^4+48>0.
\tag{8}
```

The companion exact checker verifies (1)-(8) as polynomial identities.
It does not infer an inequality from sampled parameter values.

## Source and scope

The normal-order product identity is classical; its references and
normalization are given in the linked Fischer note. The distinction
between a negative auxiliary term and a compensated border inequality
also appears in Scott Schubr's
[primary cofactor-limitations note, Section 4](https://research.luminaryoddities.org/sharp-limitations-two-permanental-cofactor-comparisons/v/2/files/Sharp_Cofactor_Comparisons.pdf).
That source explicitly leaves the full matrix comparison undecided.
No claim of priority is made for the example or its polynomial identities.

The remaining obligation is to control all three terms of (3) together,
or to prove the weaker averaged comparison directly. Separate
positivity of $`T`$ and $`U`$ does not prove their required comparison.
Completed full Minc entries: zero.
