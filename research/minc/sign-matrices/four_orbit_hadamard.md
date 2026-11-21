# Vanishing Hadamard permanents

## A four-orbit criterion

Let $`m=p^e`$ be a power of an odd prime. Let $H$ be any real Hadamard matrix of order $4m$. Suppose a group of order $m$ acts freely on the row indices and freely on the column indices, preserving the entries under simultaneous action. Each side has four orbits. Let $R$ be the integer four-by-four matrix whose entry $R_{ij}$ sums a representative row of orbit $i$ over all columns in orbit $j$. Set $`d=\operatorname{rank}_{\mathbb F_p} R`$.

* The rank $d$ is at most two, and when $e=1$ it equals two.
* If $d=2$, let $x$ be any column of $R$ nonzero modulo $p$. The magnitude of the permanent of the orbit matrix is exactly

```math
\left|\mathop{\mathrm{per}}R\right|=\left|2\sum_{j=1}^4 x_j^4-16m^2\right|.
```

  Consequently $`\mathop{\mathrm{per}}H\equiv \pm 2\sum x_j^4\pmod p`$. The sign depends on the coordinate choices. In this case the moduli of every column of $R$ are permutations of the same four numbers.
* If $d=1$ and $p>3$, the permanent of $H$ is nonzero modulo $p$ exactly when no entry of $R$ is divisible by $p$. If $d=1$ and $p=3$, or if $d=0$, the permanent is zero modulo $p$.

This is a structural test for a class with a specified symmetry. Divisibility by $p$ leaves nonvanishing over the integers undecided.

## From the group action to an integral similarity

Let the columns of $S_r,S_c$ be the row-orbit and column-orbit indicators. Then $`HS_c=S_rR`$. The corresponding column sums form $`R^{\mathsf T}`$, since all orbit lengths equal $m$ and the total sum in a block can be computed in either direction. It follows from both Hadamard identities that $`R^{\mathsf T}R=RR^{\mathsf T}=4mI`$. Every entry is odd. Any two row sums of $R$ are congruent modulo four. Indeed these sums are full row sums of $H$, whose distinct rows have even Hamming distance $2m$. The same holds for column sums.

The fixed-matching argument from the [Paley calculation](paley_ii_torus.md) applies to every free group action here, including noncyclic groups. Nonfixed orbits of bijections have size divisible by $p$. An equivariant bijection between two regular orbits is determined by the image of a representative. Its weight is the $m$th power of one sign, equal to that sign. Thus $`\mathop{\mathrm{per}}H\equiv\mathop{\mathrm{per}}R\pmod p`$. For rank zero the latter vanishes. For rank one write $`R=uv^{\mathsf T}`$ over the field. Its permanent is $`24\prod_i u_i\prod_i v_i`$, proving the rank-one assertions.

Use the Hurwitz quaternion lattice $`O=\mathbb Z^4\cup ((\tfrac12,\tfrac12,\tfrac12,\tfrac12)+\mathbb Z^4)`$, in the basis $1,i,j,k$ of the ambient real quaternions. It is a ring, with the Euclidean norm squared as multiplicative norm. The similarity $B=R/2$ maps $O$ into $O$. Its columns have all coordinates half-integral. The image of $(1,1,1,1)/2$ is $(R\mathbf1)/4$, whose entries are either all integers or all half-integers by the row-sum congruence. The same argument applies to $`B^{\mathsf T}`$. For $L=B(O)$ we therefore have

```math
m O\subseteq L\subseteq O,\qquad [O:L]=m^2.
```

The inclusion follows from $`BB^{\mathsf T}=mI`$ and the index from the real determinant. In particular $L/mO$ has cardinality $m^2$. The rank of $B$ on $O/pO$ equals that of $R$ because $p$ is odd and the basis change between $O$ and the coordinate lattice has only powers of two as denominators. Its image is totally isotropic for the nondegenerate dot product, proving $d\le2$. If $m=p$ the cardinality of $L/pO$ gives $d=2$.

## The two possible images in rank two

Put $`D=\mathbb Z/m\mathbb Z`$. The ring $O/mO$ identifies with $M_2(D)$ and quaternion norm with determinant. Here are explicit details. Since $p$ is odd, the two sets of residues $\{u^2\}$ and $\{-1-v^2\}$ each have $(p+1)/2$ elements and intersect. At least one component of a solution to $u^2+v^2=-1$ is nonzero, so it lifts modulo $p^e$ by adjusting that component one digit at a time. Send $i,j$ to

```math
\begin{pmatrix}0&1\\-1&0\end{pmatrix},\qquad
\begin{pmatrix}u&v\\v&-u\end{pmatrix}.
```

These square to $-I$ and anticommute. The four matrices representing $1,i,j,k$ form a basis: the first two span the scalar and skew directions, and the last two span the symmetric trace-zero directions since $u^2+v^2=-1$ is a unit and 2 is invertible. Quaternion conjugation maps to the adjugate, giving the norm identity.

Permute columns to place the chosen $x$ first. This preserves the Hurwitz lattice, the permanent, and the hypotheses. Let $`\alpha=B(1)=x/2`$. Its norm is $m$, and its residue has a unit matrix entry under the split identification because $x$ is nonzero modulo $p$. By invertible row and column operations it can be brought over $D$ to $E_{11}$: a unit pivot exists and its determinant is zero modulo $m$.

Write $M$ for $L/mO$ in these new matrix coordinates. Every element has determinant zero, since all squared norms on $L$ are divisible by $m$ and the operations scale determinants by units. Comparing the determinants of $Y$ and $Y+E_{11}$ gives $Y_{22}=0$ for every $Y\in M$. Rank two modulo $p$ supplies $Y$ whose reduction is independent of $E_{11}$, so $Y_{12}$ or $Y_{21}$ is a unit. As $Y_{12}Y_{21}=0$, the other entry is zero. Subtract its top left entry times $E_{11}$ and rescale to see that $M$ contains $E_{12}$ or $E_{21}$. Either span with $E_{11}$ has cardinality $m^2$, already the size of $M$. Thus $M$ is precisely the fixed-image or fixed-row line space. Undoing the operations shows that $L/mO$ is exactly the reduction of $\alpha O$ or $O\alpha$. Indeed $E_{11}M_2(D)$ and $M_2(D)E_{11}$ are those two spaces and invertible changes of basis preserve these descriptions with generator $\alpha$.

Both quaternion lattices contain $mO$ since $`\alpha\bar\alpha=\bar\alpha\alpha=m`$. Thus $L=\alpha O$ or $L=O\alpha$ over the integers. Composing $B$ with the inverse of that left or right multiplication gives a Euclidean isometry of $O$ fixing 1. It preserves the pure imaginary subspace, whose integral norm-one elements are exactly $\pm i,\pm j,\pm k$. The isometry is therefore a signed permutation of the three imaginary coordinates. It follows that $R$ is the matrix of left or right multiplication by $x$, up to signed column permutations. The two multiplication conventions are related by conjugating coordinates and replacing $x$ by $\bar x$.

For $x=(a,b,c,d)$ the left multiplication matrix is

```math
\begin{pmatrix}
a&-b&-c&-d\\b&a&-d&c\\c&d&a&-b\\d&-c&b&a
\end{pmatrix}.
```

The 24 permanent terms simplify to $`2\sum x_j^4-(\sum x_j^2)^2`$. Since $`\sum x_j^2=4m`$, this proves the formula and the repeated column magnitudes.

## Scope and prior work

Orbit-matrix orthogonality and the resulting self-orthogonal codes, including Paley matrices, are established. Integral similarities of the Hurwitz lattice and quaternion multiplication have a classical literature. The deduction above gives the fixed-matching residue and proves the particular lattice classification it uses. [Orbit matrices of Hadamard matrices and related codes](https://doras.dcu.ie/31214/1/Orbit%20matrices%20of%20Hadamard%20matrices%20and%20related%20codes%20%28pre%29.pdf) · [Conway, Rains and Sloane on similar sublattices](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/8A8F4C951E602C4A428BE867129A8F9F/S0008414X00008233a.pdf/on-the-existence-of-similar-sublattices.pdf) · [Wang's question and existing nonvanishing theorems](https://yair-lavi.com/mincs-list/problem-5/)

The condition on the fourth powers can fail for admissible arithmetic data. For example, the quaternion $(1,3,7,15)$ has squared norm $284=4\cdot71$ and fourth-power sum divisible by 71. Its multiplication matrix has all the required orbit-sum orthogonality and parity congruences. Whether this matrix occurs as an actual Hadamard orbit matrix is a further question. Applying the criterion to one matrix with zero residue would still leave its integer permanent undetermined.

The [checker](four_orbit_hadamard_check.py) verifies the quartic identity, the arithmetic obstruction, and every rank-two odd integer orbit-sum candidate for $m=3,5,7,9,11,13$ using exact integer and modular calculations. These checks illustrate the proof.
