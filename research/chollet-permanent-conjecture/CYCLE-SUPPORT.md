# Chollet’s permanent conjecture

**Partial research.** A weighted path estimate gives Hadamard compression by an arbitrary correlation matrix when one factor has a cycle support of length at least eight. The one-factor inequality extends through cut vertices and allows the other factor to be dense. The unrestricted Chollet conjecture remains open. [Tracking issue #49](https://github.com/1337isnot1337/solved-conjectures/issues/49) · [Simultaneous elimination result](ELIMINATION.md)

## Statement

Let $A$ be a complex Hermitian positive semidefinite matrix, with a support graph formed from edge blocks and cycle blocks of length at least eight, any number of each. Isolated vertices and several connected components are allowed. For every Hermitian positive semidefinite $B$ of the same order,

```math
\operatorname{per}(A\circ B)\le\operatorname{per}(A)\prod_i b_{ii}.
```

Thus Chollet’s inequality follows for this class from the permanental Hadamard inequality. It is an instance of the stronger Hadamard compression inequality of Bapat and Sunder, which fails on unrestricted matrices. Pant and Singh establish related one-point sums and inequalities for real graph Laplacians. The cycle proof here allows arbitrary complex phases and weights, and the second matrix can be any correlation matrix after normalization. Priority for this extension is provisional. [Chollet (1982)](https://doi.org/10.1080/00029890.1982.11995380) · [Drury's counterexample to unrestricted compression](https://journals.uwyo.edu/index.php/ela/article/download/1631/1631/1631) · [Pant–Singh, Proposition 1 and §5](https://arxiv.org/abs/2604.24192v2)

## 1. Cycle transport estimate

Let $B$ be a correlation matrix, with Gram unit vectors $w_i$. Let $z=\bigotimes_i w_i$. An edge transposition $\tau_e$ permutes two tensor factors by a self-adjoint unitary involution $U_e$. With $e=ij$ we have

```math
\|z-U_e z\|^2=2(1-|b_{ij}|^2).
```

For a product $U_1\cdots U_r$ of unitary involutions, put $a_i=\|(I-U_i)z\|$. Then

```math
\left|\langle z,(I-U_1\cdots U_r)z\rangle\right|
\le \tfrac12\left(\sum_i a_i\right)^2.
```

Indeed, telescope the product into the terms $U_1\cdots U_{i-1}(I-U_i)$. Move the prefix to the other side of the inner product and replace the resulting vector by $z$ plus its difference from $z$. The norm of that difference is at most $\sum_{j\lt i}a_j$, by telescoping the adjoint prefix. The main term is $\langle z,(I-U_i)z\rangle=a_i^2/2$. This gives the displayed square bound.

An oriented cycle permutation is a product of the adjacent transpositions on the path obtained by omitting any one cycle edge $e_0$. Choose the order of the transpositions to obtain either rotation direction. If $p_B$ is the oriented product of the $b_{ij}$ around that cycle, the tensor inner product for the corresponding rotation is $p_B$ or its conjugate, depending on the convention for permutation actions. Thus with $\delta_e=1-|b_e|^2$,

```math
|1-p_B|\le\left(\sum_{e\ne e_0}\sqrt{\delta_e}\right)^2.
```

## 2. Compression on a single cycle

Normalize the diagonals of both factors to one by positive diagonal congruence. A zero diagonal in either factor gives a zero row and the inequality directly. Suppose $A$ has support exactly a cycle of length $n\ge8$. Put $x_e=|a_e|$ and $P=\prod_e x_e$. If a cycle edge is absent the support is a forest, where termwise compression holds because every nontrivial permutation cycle is a transposition. Take $e_0$ with $x_{e_0}$ minimum.

The nontrivial permutation terms of $\operatorname{per}(A)$ are matchings of transpositions and the two full oriented cycles. Each transposition matching contributes a nonnegative compression difference. The one-transposition terms alone contribute $\sum_e x_e^2\delta_e$. The difference from the two cycle terms is bounded in absolute value by $2P|1-p_B|$. The estimate in §1 and weighted Cauchy–Schwarz give

```math
2P|1-p_B|\le
\left(2P\sum_{e\ne e_0} x_e^{-2}\right)
\sum_{e\ne e_0} x_e^2\delta_e.
```

To bound the coefficient, consider an induced path of $\ell\ge1$ edges of the support. A diagonal unitary change makes all its edge entries negative reals. Test the path principal submatrix on the vector with coordinates equal to the square roots of the degrees *in the path*. PSD gives

```math
\sum_{ij\text{ in the path}} x_{ij}\sqrt{\deg(i)\deg(j)}\le\ell.
```

Arithmetic–geometric mean therefore gives $\prod_{e\text{ in the path}}x_e\le2^{-(\ell-1)}$, because the internal path degrees are two. Removing $e_0$ and one other edge $e$ leaves at most two nonempty induced paths, with $n-2$ edges total. Since $x_{e_0}\le x_e$,

```math
P x_e^{-2} = (x_{e_0}/x_e)\prod_{f\notin\{e_0,e\}}x_f\le2^{-(n-4)}.
```

Consequently $2P\sum_{e\ne e_0}x_e^{-2}\le2(n-1)2^{-(n-4)}\le1$ for $n\ge8$. The contribution of the one-transposition terms covers the maximum cycle loss. This proves the comparison on the cycle for every choice of the second factor $B$.

## 3. Gluing across cut vertices

A principal submatrix of a cycle block is either the full block or has forest support, so the same first-factor property holds for every principal submatrix. Edge blocks have it directly. Suppose the support of $A$ splits at $v$, with nonzero off-diagonal cross terms only through $v$. Write the two side matrices away from $v$ as $C_1,C_2$ and the columns connecting them to $v$ as $u_1,u_2$. The PSD condition implies $u_i\in\operatorname{ran}(C_i)$ and

```math
a_{vv}\ge u_1^*C_1^\dagger u_1+u_2^*C_2^\dagger u_2.
```

These statements follow by testing the quadratic form on the nullspaces and minimizing over the two side vectors with the $v$ coordinate fixed at one. Split $a_{vv}$ into two diagonals at least the corresponding terms on the right. This expresses $A$ as a PSD one-point sum $A_1\star A_2$, including when either side is singular.

For a one-point sum the permanent is

```math
\operatorname{per}(A_1\star A_2)
=\operatorname{per}(A_1)\operatorname{per}(C_2)
+\operatorname{per}(C_1)\operatorname{per}(A_2).
```

A permutation cycle containing $v$ stays on one side, and the contribution in which $v$ is fixed splits according to the sum of its two diagonal entries. With $B$ normalized to have unit diagonal, Hadamard multiplication commutes with forming this one-point sum, using the two principal restrictions of $B$. Each factor in the displayed formula is nonnegative, and each compressed factor is at most the corresponding original factor by induction on the blocks. For the deletions $C_i$, use the same induction or their disconnected components. Direct sums multiply permanents, completing the proof. The argument uses Pant–Singh's one-point permanent identity and splits general PSD support through the generalized Schur complement. [Pant–Singh, Proposition 1](https://arxiv.org/abs/2604.24192v2)
