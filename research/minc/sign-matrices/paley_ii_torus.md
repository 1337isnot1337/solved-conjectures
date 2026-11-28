# Vanishing Hadamard permanents

## A nonsplit torus in the second Paley construction

Let $q$ be an odd prime power congruent to one modulo four. Suppose $`m=(q+1)/2=\ell^e`$ for an odd prime $\ell$ and a positive integer $e$. In the second Paley construction choose the symmetric conference matrix $C$ and use the convention

```math
H=\begin{pmatrix} C+I&C-I\\ C-I&-C-I\end{pmatrix}.
```

There are integers $a,b$ with $a$ even, $b$ odd, and $`a^2+b^2=q`$, for which

```math
\mathop{\mathrm{per}}H\equiv 8(a^2 b^2-2a^2+b^2)\equiv -8(a^4+4a^2+1)\pmod\ell.
```

The integers come from the torus orbit sums below. In particular, if $`q=p^{2t}`$ for a prime $`p\equiv3\pmod4`$, this permanent is $-8$ modulo $\ell$. Also, for $`\ell>3`$, it is nonzero if either 3 or $-2$ is a quadratic nonresidue modulo $\ell$. Independently negating rows or columns may reverse the reported residue and preserves nonvanishing.

For example, $`q=3^{16}=43,046,721`$ and $`\ell=21,523,361`$ is prime. The resulting order is 86,093,444, with sixteen zeros in its binary expansion and residue two modulo three. The computation only requires a primality check on $\ell$. The result concerns the second Paley construction of this order. The unrestricted Wang question remains open.

## Proof

Identify the two-dimensional space over $\mathbb F_q$ with $\mathbb F_{q^2}$, fixing a basis for its determinant. Index $C$ by the $q+1$ lines, choosing one representative vector $v_i$ for each. In these coordinates $`C_{ij}=\chi(\det(v_i,v_j))`$, where $\chi$ denotes the quadratic character extended by zero. This is the usual symmetric Paley conference matrix: taking representatives $(1,t)$ and $(0,1)$ gives the standard character-difference core, zero diagonal and border of ones. Symmetry uses $\chi(-1)=1$. Distinct rows have inner product zero because the quotient of their two determinant forms runs through all nonzero field elements exactly once on the remaining lines. Each row has squared norm $q$. Changing representatives conjugates $C$ by a diagonal sign matrix and therefore conjugates $H$ by its doubled sign matrix, preserving the permanent.

Use the order-$`m`$ subgroup $T$ of the norm-one group in $\mathbb F_{q^2}^\times$. Multiplication by each of its elements has determinant one. No nonidentity element fixes a line: a line stabilizer acts on its nonzero vector by a scalar in $\mathbb F_q^\times$, and norm-one scalars have order at most two. The odd-order group thus acts freely with two orbits of size $m$. Choose the representative vectors equivariantly, by propagating one on each orbit. The action now preserves every matrix entry.

Let $S$ have the two orbit indicators as columns, and define $D$ by $CS=SD$. Each $D_{ij}$ is the sum over column orbit $j$ in any row of orbit $i$. The two equally large orbits and symmetry of $C$ give $`D=D^{\mathsf T}`$. Since $`C^2=qI`$ we get $`D^2=qI`$. Its off-diagonal entry $b$ is the sum of $m$ signs, so is odd and nonzero. Its first diagonal entry $a$ is the sum of $m-1$ signs. Multiplication of the two-by-two matrix gives

```math
D=\begin{pmatrix}a&b\\b&-a\end{pmatrix},\qquad a^2+b^2=q.
```

The four row orbits and four column orbits on $H$ are all regular $T$-sets. The induced action on bijections preserves their product weights. Nonfixed orbits have size divisible by $\ell$. Every fixed bijection matches the four row orbits to the four column orbits in some order. For each paired orbit, the equivariant bijections correspond to the $m$ choices for the image of one row. All entries along one such matching have the same sign. Raising it to the odd power $m$ leaves that sign unchanged. The sum of matching weights for that pair is precisely its orbit row sum. Summing the independent choices proves

```math
\mathop{\mathrm{per}}H\equiv\mathop{\mathrm{per}}\begin{pmatrix}D+I&D-I\\D-I&-D-I\end{pmatrix}\pmod\ell.
```

Expanding the 24 products gives $`8(a^2b^2-2a^2+b^2)`$. Substitute $`b^2=q-a^2\equiv-1-a^2\pmod\ell`$. If this vanishes then $`(a^2+2)^2=3`$ and $`(a^2+1)^2=-2a^2`$ in the residue field. Since $a=0$ would give a nonzero value, both 3 and $-2$ must be squares for $`\ell>3`$.

If $`q=p^{2t}`$ with $`p\equiv3\pmod4`$, divisibility of $a^2+b^2$ by $p$ forces $p$ to divide both $a$ and $b$. Iterating $t$ times leaves a representation of one as a sum of two squares, with the first square even. Thus $`a=0`$ and $`b=\pm p^t`$. The residue becomes $`8q\equiv-8\pmod\ell`$.

## Sources and check

The [current catalogue](https://yair-lavi.com/mincs-list/problem-5/) gives Wang's full question and the first-kind Paley result. Wanless's enumeration and Chabaud's Sylvester theorem cover other cases. The conference construction, its symmetry and the group action have classical antecedents. This deduction makes no priority claim. [Wanless](https://doi.org/10.1080/03081080500093990) · [Chabaud](https://arxiv.org/abs/1802.08001) · [Goldberger on the Paley automorphism action](https://doi.org/10.1007/s10801-024-01346-7) · [Barrera Acevedo, Ó Catháin and Dietrich on the two Paley constructions](https://doi.org/10.1007/s10801-021-01033-x)

The [standard-library checker](paley_ii_torus_check.py) verifies the quartic identity by exact polynomial interpolation on an integer grid, computes the full order-20 permanent independently from a field model, and checks the order and primality arithmetic of the larger example.
