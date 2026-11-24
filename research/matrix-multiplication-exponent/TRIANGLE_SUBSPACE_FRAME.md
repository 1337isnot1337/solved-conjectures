# A trace bound for the triangle support subspace

Status: a conditional obstruction to the stronger unit-star lift. The
frame parameter below is not controlled for arbitrary local maps. This
does not prove an unrestricted asymptotic obstruction or determine the
matrix multiplication exponent.

Let the three outer vector spaces have their standard orthonormal bases
$`e_{ij},e_{jk},e_{ki}`$, with every index in $`[q]`$, and put

```math
L_q=\mathop{\mathrm{span}}
\{e_{ij}\otimes e_{jk}\otimes e_{ki}:i,j,k\in[q]\}.
```

Its orthogonal projector is denoted by $`P`$, and
$`\mathop{\mathrm{tr}}P=q^3`$.

## One arbitrary product subspace

For subspaces $`A_0,B_0,C_0`$ with orthogonal projectors
$`P_A,P_B,P_C`$, write $`Q=P_A\otimes P_B\otimes P_C`$. Then

```math
\mathop{\mathrm{tr}}(PQ)
\le\sqrt{\dim A_0\,\dim B_0\,\dim C_0}.              \tag{1}
```

To prove this, let $`a_{ij},b_{jk},c_{ki}`$ be the diagonal entries
of the three local projectors in the displayed bases. Each lies in
$`[0,1]`$, and its sum is the corresponding subspace dimension. If
$`a,b,c`$ denote the three $`q\times q`$ matrices of these numbers,

```math
\begin{aligned}
\mathop{\mathrm{tr}}(PQ)
&=\sum_{i,j,k}a_{ij}b_{jk}c_{ki}
=\mathop{\mathrm{tr}}(abc)\\
&\le\|a\|_{\mathrm F}\|b\|_{\mathrm F}\|c\|_{\mathrm F}\\
&\le\sqrt{\Bigl(\sum_{ij}a_{ij}\Bigr)
              \Bigl(\sum_{jk}b_{jk}\Bigr)
              \Bigl(\sum_{ki}c_{ki}\Bigr)}.
\end{aligned}
```

The last inequality uses $`x^2\le x`$ for $`0\le x\le1`$.
This proves (1), without any coordinate-subspace hypothesis.
In particular

```math
\dim\bigl(L_q\cap(A_0\otimes B_0\otimes C_0)\bigr)
\le\sqrt{\dim A_0\,\dim B_0\,\dim C_0},              \tag{2}
```

because every vector in the intersection contributes an eigenvalue one
to the compression of $`Q`$ to $`L_q`$.

## A sum of product subspaces and its frame parameter

Suppose

```math
L_q\subseteq V:=\sum_{b=1}^{m}A_b\otimes B_b\otimes C_b,
\qquad \dim A_b,\dim B_b,\dim C_b\le q.
```

Let $`Q_b`$ be the product-space projectors, put
$`G=\sum_bQ_b`$, and let $`c>0`$ be its least positive eigenvalue.
The image of $`G`$ is $`V`$, so
$`G\succeq cP_V\succeq cP`$. Taking the trace after compression
to $`L_q`$, and applying (1) to each summand, gives

```math
cq^3\le\mathop{\mathrm{tr}}(PG)
=\sum_b\mathop{\mathrm{tr}}(PQ_b)
\le m q^{3/2}.
```

Consequently

```math
m\ge c q^{3/2}.                                    \tag{3}
```

For the stronger tensor lift, $`m=rq`$, and hence
$`r\ge c\sqrt q`$. This bound explicitly retains the effect of
overlap between the product subspaces.

If the product-space projectors commute pairwise, their simultaneous
eigenvalues are zeros and ones. Every positive eigenvalue of their sum
is therefore an integer at least one. In that case (3) gives
$`r\ge\sqrt q`$. The local subspaces may use arbitrary bases;
commutation, rather than coordinate support in a specified basis, is
the hypothesis.

## Laurent limits

The commuting-projector conclusion also holds for a Laurent
degeneration whose product-space projectors commute for every
sufficiently small positive real parameter. Select the $`q^3`$
output $`D`$ columns converging to the displayed triangle basis.
Their spans $`L(t)`$ have dimension $`q^3`$ for small $`t`$, lie
inside $`V(t)`$, and their orthogonal projectors $`P(t)`$ converge
to $`P`$. Commutation gives

```math
q^3\le\sum_{b=1}^{m}\mathop{\mathrm{tr}}(P(t)Q_b(t)).
```

For each summand, (1) bounds
$`\mathop{\mathrm{tr}}(P Q_b(t))\le q^{3/2}`$ uniformly in $`t`$.
Moreover

```math
\left|\mathop{\mathrm{tr}}((P(t)-P)Q_b(t))\right|
\le q^3\|P(t)-P\|_{\mathrm{op}}\longrightarrow0.
```

Passing to the limit proves the same $`m\ge q^{3/2}`$. More
generally, if $`G(t)\succeq c_0P_{V(t)}`$ for one constant
$`c_0>0`$, the conclusion is $`m\ge c_0q^{3/2}`$.

Without commutation or a uniform frame bound, (3) does not provide an
unrestricted lower bound. Product spaces can approach linear
dependence, making the least positive frame eigenvalue arbitrarily
small. A degeneration can use precisely such cancellation. On tensor
powers with $`Q=q^n`$, a subexponential-overhead exact construction
would force $`c\le q^{-n/2+o(n)}`$; this is a necessary conditioning
property, not a contradiction.
