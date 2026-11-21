# First-moment coercivity with mass and rotation errors

Working proof, 21 November 2026. This note is a deduction from the covariance stability estimate in `FIRST_MOMENT_STABILITY.md`. It supplies a local, fixed-simplex estimate for a fractional partition whose cell masses need not be exactly equal. It does not by itself prove noise stability or settle Standard Simplex.

## 1. Coordinates and statement

Fix the number of cells $`q\ge3`$, put $`r=q-1`$, and use the constants $`c=c_q`$ and $`F_q=c^2`$ from the first-moment theorem. Write

```math
P=I-\mathbf1\mathbf1^T/q,
\qquad Q_*=P/r,
\qquad s=c/\sqrt r.
```

Choose a real matrix $`B\in\mathbb R^{q\times r}`$ with $`B^TB=I_r`$ and $`BB^T=P`$. Let $`\mathcal C`$ be the central regular-simplex winning partition associated with its rows. Its moment matrix is $`M_{\mathcal C}=sB`$.

For a fractional partition $`f=(f_1,\ldots,f_q)`$ of $`\mathbb R^r`$, let

```math
p_i=\int f_i\,d\gamma_r,
\quad e=p-\mathbf1/q,
\quad m_i=\int z f_i(z)\,d\gamma_r(z),
\quad M=(m_i)_{i=1}^q,
\quad A=B^TM.
```

The rows of $`M`$ sum to zero, so $`M=BA`$ and $`\|M\|_F=\|A\|_F`$. Define

```math
F=\|A\|_F^2,
\qquad \varepsilon=c^2-F,
\qquad D=c^2-\langle M_{\mathcal C},M\rangle_F
             =c^2-s\mathop{\mathrm{tr}}A.
```

The winning property of the regular moment scores gives $`D\ge0`$, without a mass constraint. There is also the exact identity

```math
2D=\varepsilon+\|A-sI_r\|_F^2. \tag{1}
```

**Local coercivity lemma.** There are constants $`\delta_q>0`$, $`\kappa_q>0`$ and $`K_q<\infty`$, depending only on $`q`$, such that

```math
\|A-sI_r\|_F\le\delta_q,
\qquad \|e\|\le\delta_q
```

imply

```math
\varepsilon\ge\kappa_q D
 -K_q\left(\|e\|^2+\|\mathop{\mathrm{skew}} A\|_F^2\right),
\qquad \mathop{\mathrm{skew}}A=(A-A^T)/2. \tag{2}
```

Here $`\varepsilon`$ can be negative. The error terms are essential: the partition in this lemma is not assumed balanced, and the comparison simplex is fixed.

## 2. Unequal masses in the balanced assignment bound

Use $`\mathcal V(Q)`$ for the uniform-mass Gaussian score value. The prior quantitative estimate gives a constant $`\beta>0`$ with

```math
\mathcal V(Q)^2\le c^2-\beta\|Q-Q_*\|_F^2
```

on the trace-one centered covariance domain. Its zero-sum balancing price $`\lambda(Q)`$ is smooth near $`Q_*`$ and equals zero there. Thus, on a fixed neighborhood,

```math
\|\lambda(Q)\|\le L\|Q-Q_*\|_F \tag{3}
```

for some finite $`L\ge1`$ depending only on $`q`$.

The unequal-mass value is

```math
\mathcal V_p(Q)=\inf_{\lambda}
\left[p\cdot\lambda+\mathbb E\max_i(Y_i-\lambda_i)\right],
\qquad Y\sim N(0,Q).
```

Evaluating this infimum at the uniform-mass balancing price gives

```math
\mathcal V_p(Q)\le\mathcal V(Q)+\lambda(Q)\cdot e. \tag{4}
```

For $`F>0`$, put $`Q=MM^T/F`$. The original fractional labels are a feasible assignment of masses $`p`$ for the scores $`M/\sqrt F`$. Their value is $`\sqrt F`$. Consequently, with $`d_Q=\|Q-Q_*\|_F`$,

```math
\sqrt F\le\mathcal V_p(Q)
\le\mathcal V(Q)+L d_Q\|e\|. \tag{5}
```

Choose $`\delta_q`$ small enough that $`F\in[c^2/2,3c^2/2]`$, $`Q`$ lies in the neighborhood of (3), and $`L^2\|e\|^2\le\beta/4`$. Squaring (5) and using $`0\le\mathcal V(Q)\le c`$ gives

```math
F\le c^2-\beta d_Q^2+2cL d_Q\|e\|+L^2d_Q^2\|e\|^2.
```

Young's inequality gives

```math
2cL d_Q\|e\|
\le\frac\beta4 d_Q^2+\frac{4c^2L^2}{\beta}\|e\|^2.
```

Therefore, if $`C_0=4c^2L^2/\beta`$ and $`C=C_0+1`$,

```math
G:=\varepsilon+C\|e\|^2
\ge\frac\beta2 d_Q^2+\|e\|^2\ge0. \tag{6}
```

This uses the existing balanced covariance estimate. It does not assume an unrestricted first-moment extremum.

## 3. Distance from the orbit of regular moment matrices

Let $`A=HO`$ be the left polar decomposition, with $`H=(AA^T)^{1/2}`$ positive definite and $`O`$ orthogonal. The hypotheses above ensure invertibility. Define

```math
u=\frac{\mathop{\mathrm{tr}}\sqrt Q}{\sqrt r}.
```

The trace is over the centered subspace. Since both $`Q`$ and $`Q_*`$ have trace one,

```math
1-u=\tfrac12\|\sqrt Q-\sqrt{Q_*}\|_F^2
\le\frac r2 d_Q^2. \tag{7}
```

For the last step, diagonalize $`Q`$ on the centered subspace and use
$`|\sqrt x-1/\sqrt r|\le\sqrt r\,|x-1/r|`$ for $`x\ge0`$.

It follows that

```math
\|H-sI_r\|_F^2
=(\sqrt F-c)^2+2c\sqrt F(1-u). \tag{8}
```

In the chosen neighborhood $`|\varepsilon|\le c^2/2`$. From (6), $`\|e\|^2\le G`$ and hence $`|\varepsilon|\le(1+C)G`$. Thus

```math
(\sqrt F-c)^2
=\frac{\varepsilon^2}{(\sqrt F+c)^2}
\le\frac{|\varepsilon|}{2}
\le\frac{1+C}{2}G.
```

Equations (6)–(8), together with $`\sqrt F\le\sqrt{3/2}\,c`$, give

```math
\|H-sI_r\|_F^2\le K G, \tag{9}
```

where one may take

```math
K=1+\frac{1+C}{2}+\frac{2c^2r\sqrt{3/2}}{\beta}.
```

## 4. Fixing the rotation

Write $`A=S+J`$, where $`S`$ is symmetric and $`J`$ is skew-symmetric. Shrink $`\delta_q`$ so that $`S\succeq(s/2)I_r`$.

The polar factor $`O`$ maximizes $`\mathop{\mathrm{tr}}(AO^T)`$ over orthogonal matrices: in the decomposition $`A=HO`$, every competing orthogonal factor gives trace at most $`\mathop{\mathrm{tr}}H`$. Comparing with the identity matrix yields

```math
\mathop{\mathrm{tr}}\bigl(S(I-O^T)\bigr)
\le\mathop{\mathrm{tr}}(JO^T)
=\mathop{\mathrm{tr}}\bigl(J(O^T-I)\bigr).
```

Because $`S`$ is symmetric,

```math
\mathop{\mathrm{tr}}\bigl(S(I-O^T)\bigr)
=\tfrac12\mathop{\mathrm{tr}}\bigl(S(I-O)(I-O)^T\bigr)
\ge\frac s4\|O-I\|_F^2.
```

Cauchy–Schwarz on the right side therefore gives

```math
\|O-I\|_F\le\frac4s\|J\|_F. \tag{10}
```

Consequently,

```math
\|A-sI\|_F^2
\le2\|A-sO\|_F^2+2s^2\|O-I\|_F^2
\le2KG+32\|J\|_F^2. \tag{11}
```

Combine (1), (6), and (11):

```math
2D\le(1+2K)\varepsilon+2KC\|e\|^2+32\|J\|_F^2.
```

This proves (2), for example with

```math
\kappa_q=\frac2{1+2K},
\qquad K_q=\frac{\max(2KC,32)}{1+2K}.
```

## 5. Use after polar alignment in a larger ambient space

Let a balanced partition in $`\mathbb R^d`$ have a full-rank centered moment matrix $`M_0`$ of rank $`r`$. Its normalized polar representation is

```math
M_0=\sqrt{F_0}\,Q_0^{1/2}U,
\qquad UU^T=P.
```

Let $`W=U^TB\in\mathbb R^{d\times r}`$. Then $`W^TW=I_r`$, and its columns span the row space $`E`$ of $`M_0`$. In coordinates $`z=W^Tx`$, the aligned regular moment matrix is $`sB`$, and the actual square moment matrix is

```math
B^TM_0W=\sqrt{F_0}\,B^TQ_0^{1/2}B,
```

which is symmetric positive definite.

Define fractional labels $`g_i(z)=\mathbb E[1_{A_i}(X)\mid W^TX=z]`$. Their masses and moments in $`E`$ are the original ones; the original moments have no component outside $`E`$. This conditional expectation is used only for mass and moment estimates. It does not preserve noise stability.

For a radius $`R`$, replace $`g`$ by the regular partition outside the ball $`|z|\le R`$. Call the resulting fractional partition the core partition. If $`e_{\mathrm{tail}}`$ and $`M_{\mathrm{tail}}`$ are the mass and moment differences discarded in this replacement, then

```math
e_{\mathrm{core}}=-e_{\mathrm{tail}},
\qquad
\mathop{\mathrm{skew}} A_{\mathrm{core}}
=-\mathop{\mathrm{skew}}(B^TM_{\mathrm{tail}}).
```

The latter identity uses symmetry of the full aligned moment matrix. Thus both error terms in (2) are controlled by squared tail mass and moment errors. For fixed $`R`$, convergence of the original partition to the aligned simplex in Gaussian symmetric difference ensures the core hypotheses, since the core coordinates are bounded by $`R`$.

This is the precise local statement required by a core/tail noise comparison. A separate tail estimate and the complete noise expansion are still needed for that application.
