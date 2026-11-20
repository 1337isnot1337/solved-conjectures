# Permanent dominance for degree-one characters

Research checkpoint, 20 November 2026. The arguments below prove the regular, semiregular and abelian-group cases of Minc Problem 2 and Conjecture 42 from the Grone–Pierce correlation-matrix inequality. They do not settle either full entry. No priority claim is made for these short consequences of older results.

## Notation and inputs

For a subgroup H of the symmetric group on n letters and a character chi of H, write

```math
d_\chi^H(A)=\sum_{g\in H}\chi(g)\prod_{i=1}^n a_{i,g(i)}.
```

The conjectured inequality is d_chi^H(A)<=chi(e) per(A) for every positive semidefinite Hermitian A. A correlation matrix is such a matrix with all diagonal entries equal to one.

Grone and Pierce proved

```math
\mathop{\mathrm{per}} C\ge\frac{\lVert C\rVert_F^2}{n}
=1+\frac1n\sum_{i\ne j}|c_{ij}|^2
\tag{1}
```

for every complex Hermitian correlation matrix C. The primary publisher record explicitly states this full complex domain: Robert Grone and Stephen Pierce, [*Permanental Inequalities for Correlation Matrices*](https://epubs.siam.org/doi/10.1137/0609016), SIAM J. Matrix Anal. Appl. 9 (1988), 194–201, DOI 10.1137/0609016.

We also use the standard character bound |chi(g)|<=chi(e), nonnegativity of generalized matrix functions on positive semidefinite Hermitian matrices, and Lieb's permanental Fischer inequality

```math
\mathop{\mathrm{per}}A\ge\prod_{B\in\mathcal P}
\mathop{\mathrm{per}}A[B,B]
\tag{2}
```

for a partition P of the indices. Equation (2) is obtained by iterating Lieb's two-block inequality. A source with the statement and original attribution is Ian Wanless, [*Lieb's permanental dominance conjecture*](https://arxiv.org/abs/2202.01867), Theorem 1 and Corollary 1; original source E. H. Lieb, *Proofs of some conjectures on permanents*, J. Math. Mech. 16 (1966), 127–134.

## Semiregular actions

Call the action of H semiregular when no nonidentity group element fixes a point. Then, for every character chi of H and every positive semidefinite Hermitian A,

```math
d_\chi^H(A)\le\chi(e)\mathop{\mathrm{per}}A.
\tag{3}
```

The zero character, if admitted, gives (3) immediately. Assume chi(e)>0. If a diagonal entry of A is zero, positive semidefiniteness makes its entire row and column zero. Both sides of (3) are then zero. Otherwise positive diagonal scaling reduces to a correlation matrix C. Both sides acquire the same factor, the product of the diagonal entries. The case n=1 is immediate, so assume n>=2.

Every entry of C has modulus at most one by its two-by-two principal minors. For g not the identity, arithmetic–geometric mean gives

```math
\left|\prod_i c_{i,g(i)}\right|
\le\frac1n\sum_i|c_{i,g(i)}|^n
\le\frac1n\sum_i|c_{i,g(i)}|^2.
\tag{4}
```

For any fixed i and j, at most one g in H maps i to j: otherwise the quotient of two such elements would fix i. When g is not the identity, semiregularity also gives g(i) not equal to i. Thus every ordered off-diagonal pair occurs at most once in the sum of the right sides of (4). For a regular action it occurs exactly once.

Since d_chi^H(C) is real, taking real parts and using the character bound yields

```math
\frac{d_\chi^H(C)}{\chi(e)}
\le1+\sum_{g\ne e}\left|\prod_i c_{i,g(i)}\right|
\le1+\frac1n\sum_{i\ne j}|c_{ij}|^2
\le\mathop{\mathrm{per}}C.
```

This proves (3) in all orders and for all character degrees. In particular it covers every finite group in its regular permutation action, whether or not the group is abelian.

## Every abelian permutation group

Let H be an arbitrary abelian subgroup of S_n. Then (3) holds for every character of H, without assuming its action is semiregular.

It suffices to prove this for an irreducible character chi, which has degree one. Let O_1,...,O_r be the orbits of H. The action on O_i factors through a quotient H/K_i, where K_i is the stabilizer of any one point in O_i. Because H is abelian, all point stabilizers in that orbit are K_i, and the quotient acts regularly.

Let

```math
K=\prod_{i=1}^r H/K_i
```

act independently on the separate orbits. The original action embeds H into K: the intersection of all K_i is trivial because H is a subgroup of S_n. The group K is abelian.

Every character chi of H extends to a character of K. One elementary proof extends a character one generator at a time: if x is adjoined and m is the least positive integer with x^m in the old subgroup, choose an mth root of the character value at x^m and use it as the value at x. This is well defined and extends the old character. Iterating reaches K.

The extensions of chi form a coset of the character group of K/H. Therefore there are [K:H] extensions, and character orthogonality gives

```math
\frac1{[K:H]}\sum_{\psi|_H=\chi}\psi(g)
=\begin{cases}\chi(g),&g\in H,\\0,&g\notin H.\end{cases}
```

Consequently

```math
d_\chi^H(A)
=\frac1{[K:H]}\sum_{\psi|_H=\chi}d_\psi^K(A).
\tag{5}
```

Each character psi of K factors as a product of characters psi_i of the regular-action factors. Since K preserves the separate orbits, its generalized matrix function factors:

```math
d_\psi^K(A)
=\prod_{i=1}^r d_{\psi_i}^{H/K_i}(A[O_i,O_i])
\le\prod_{i=1}^r\mathop{\mathrm{per}}A[O_i,O_i]
\le\mathop{\mathrm{per}}A.
```

The first inequality uses the regular-action case and nonnegativity of each factor. The second is (2). Averaging in (5) proves the result. General characters follow by adding irreducible characters with their nonnegative integral multiplicities.

## Source audit and limits

The [current Problem 2 page](https://yair-lavi.com/mincs-list/problem-2/index.html), read on 20 November 2026, lists cyclic-group cases at order five among its unresolved complex cases. The proof above covers them. This discrepancy calls for checking the catalogue and older literature; it is not evidence that the full problem has been solved.

Searches under permanental dominance with regular, semiregular, cyclic and abelian group terminology, using both search engines, did not locate an earlier explicit statement of these consequences. Grone–Pierce's full eight-page paper was not obtained, so its uninspected corollaries could overlap. The publisher abstract is enough to verify input (1), but not to establish novelty of everything deduced from it.

Allen Herman's *A Maximal Eigenvalue Conjecture Equivalent to Permanental Dominance*, checked through the [author-uploaded manuscript](https://www.researchgate.net/publication/240903668_A_Maximal_Eigenvalue_Conjecture_Equivalent_to_Permanental_Dominance), studies central averages of Schur-power blocks. Its order-five cyclic example separates the trivial character from other characters of the same subgroup; it does not refute or settle the comparison with the full symmetric-group permanent. Its abelian observation concerns equality of two block formulations, not the bound proved above.

The argument does not extend automatically to arbitrary nonabelian actions. A point stabilizer need not be normal, an orbit action need not be a regular quotient, and a degree-one character need not extend to a suitable product action. Those are real gaps in that attempted extension. No full resolution of Minc Problem 2 or Conjecture 42 is claimed.
