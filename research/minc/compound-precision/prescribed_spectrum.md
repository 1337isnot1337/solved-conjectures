# Perron root of permanental compounds

The compound spectra can retain their full Galois groups with the ordinary spectrum **prescribed in advance**. For each $`n\ge3`$, there is a nonempty Zariski-open subset of ordered spectra such that every distinct positive rational tuple $`\theta_1<\cdots<\theta_n`$ in this subset occurs for a rational nonnegative arrowhead matrix with
```math
\mathop{\mathrm{Gal}}\!\left(\prod_{k=2}^{n-1}\chi_{P_k(A)}\,/\,\mathbb Q\right)
=\prod_{k=2}^{n-1} S_{\binom nk}.
```
Here the Galois group is that of the joint splitting field, acting in its natural permutation representations. The matrix can be chosen diagonally similar over the reals to a positive definite symmetric matrix. The exceptional algebraic set is unspecified. This theorem limits exact formulas for [Minc's compound Perron root](https://yair-lavi.com/mincs-list/problem-18/). Numerical and polynomial representations remain available.

## Coordinates for fixed spectrum

Put a one on each upper spoke, $`b_h`$ on the opposite spoke, $`e_h`$ on each leaf diagonal, and $`e_0`$ on the hub diagonal. Let $`f(z)=\prod_{\ell=1}^n(z-\theta_\ell)`$. For pairwise distinct $`e_h`$ set
```math
e_0=\sum_\ell\theta_\ell-\sum_h e_h,\qquad
b_h=-\frac{f(e_h)}{\prod_{g\ne h}(e_h-e_g)}. \tag{1}
```
Expansion along the spokes gives the characteristic polynomial
$`(z-e_0)\prod_h(z-e_h)-\sum_h b_h\prod_{g\ne h}(z-e_g)`$. It equals $`f`$, since their leading two coefficients agree and they agree at all $`n-1`$ leaf diagonals. Thus the rational function field after ordering the ordinary spectrum is exactly $`K(e_1,\ldots,e_{n-1})`$, where $`K=\mathbb Q(\theta_1,\ldots,\theta_n)`$ for independent parameters. This is the classical arrowhead secular equation. [O'Leary and Stewart](https://www.cs.umd.edu/~oleary/reprints/j31.pdf)

A symmetric arrowhead with spokes $`x_h`$ is diagonally similar to this normalized arrowhead with $`b_h=x_h^2`$ when the spokes are nonzero. Diagonal similarity induces diagonal similarity on each permanental compound by multiplying the row and column factors on the selected sets. The characteristic-polynomial identity extends across zero spokes since it is polynomial. The [joint Galois theorem](compound_galois_groups.md) therefore gives the full product $`G=\prod_{k=2}^{n-1}S_{\binom nk}`$ over $`K(e_1,\ldots,e_{n-1})`$. In detail, before ordering the ordinary spectrum, descending from the symmetric spoke field to the field of their squares can only enlarge the group, which is already the largest possible. Adjoining the ordinary roots then removes precisely the degree-one compound's factor.

## Why the group survives fixing the ordinary eigenvalues

We prove that the group over $`\overline K(e_1,\ldots,e_{n-1})`$ is still $`G`$. It is a normal subgroup of $`G`$, since $`\overline K(e)/K(e)`$ is normal. It suffices to exhibit in this geometric subgroup, for each $`k\ge2`$ through $`n-1`$, an element acting as an individual transposition in that degree and fixing the other degrees. Its conjugates under $`G`$ generate the full factor.

Use the same hub $`i`$, temporarily disconnected leaf $`j`$, complementary symmetric arrowhead $`D`$, and set $`T`$ of size $`k-1`$ as in the joint theorem. Prescribe the ordinary eigenvalues of $`D`$ to be pairwise algebraically independent positive numbers $`\eta_h`$, chosen jointly algebraically independent over $`\mathbb Q`$. As small real spokes $`x_h`$ vary near the diagonal, adjust all diagonals of $`D`$ to keep the ordinary eigenvalues fixed. This is analytic by the implicit function theorem because the Jacobian from the diagonals to the labelled ordinary eigenvalues is the identity at the diagonal.

Denote by $`r_U=\lambda_{Ui}(D)/\lambda_U(D)`$ the crossing values from the joint proof. Along the axis with just $`x_h`$ turned on, the two ordinary roots of the active two-by-two block are **exactly** $`\eta_i,\eta_h`$. Its permanent equals its determinant plus $`2x_h^2`$. Consequently the exact axis restrictions are
```math
r_U=\begin{cases}
\eta_i,& h\notin U,
\\ \eta_i+2x_h^2/\eta_h,& h\in U.
\end{cases} \tag{2}
```
Thus all $`r_U`$ remain distinct as analytic functions, and $`r_T`$ is nonconstant because $`T\ne\varnothing`$. Choose arbitrarily small real spokes $`x^*`$ such that all the ratios are distinct and some partial derivative $`\partial_{x_h}r_T`$ is nonzero. They may additionally be chosen so $`a_*=r_T(x^*)`$ is transcendental over $`\mathbb Q(\eta_1,\ldots,\eta_{n-1})`$. Indeed, the gradient stays nonzero on an open neighborhood of an admissible point, the image contains an interval, and the excluded algebraic closure is countable. The full ordinary spectrum $`(\eta_1,\ldots,\eta_{n-1},a_*)`$ is therefore algebraically independent. Selecting any ordering of it embeds the abstract constant field $`\overline K`$ in $`\mathbb C`$.

At this crossing all ordinary eigenvalues of the full matrix are simple, since $`a_*`$ differs from the crossing $`r_\varnothing=\eta_i`$ and stays away from the other $`\eta_h`$. The Jacobian from the $`n`$ diagonals to the ordinary eigenvalues is invertible. At the disconnected matrix it consists of the perturbed $`D`$ Jacobian, still near the identity, and the scalar one for leaf $`j`$. Hence we may vary $`x_h`$ and reconnect the last spoke $`t`$ while correcting the diagonals analytically to keep this **entire** ordinary spectrum constant. In the $`t`$ direction no first-order diagonal correction is needed, since the spoke derivative lies between the two ordinary blocks and has zero expectation in each ordinary eigenvector.

At $`t=0`$, varying $`x_h`$ detunes the two compound roots at speed $`\lambda_T(D)\,\partial_{x_h}r_T\ne0`$. Their off-block mixing in the $`t`$ direction is still the nonzero $`c`$ of the joint proof. Thus the quadratic discriminant on this fixed-spectrum surface has leading form $`\gamma^2(x_h-x_h^*)^2+4c^2t^2`$ with $`\gamma c\ne0`$. The same simple-zero argument yields an isolated transposition. Mapping the symmetric path to the normalized coordinates $`b_h=x_h^2`$ preserves all compound characteristic polynomials and the constant ordinary spectrum. The leaf diagonals are pairwise distinct throughout a suitable neighborhood.

Such continuation in the leaf parameters preserves relations even over the embedded algebraic closure of the fixed spectral constants. More explicitly, any relation over $`\overline K(e)`$ can be cleared of denominators and continued as an identity of germs of the labelled roots in the full leaf-parameter space, then restricted along the loop. This embeds its permutation in the geometric group up to relabelling. We may use a different algebraically independent tuple for each $`k`$. Each identifies the same abstract geometric group up to permutations of the labels within the specified degrees. Normality and the isolated transpositions now prove the claim.

## Rational specialization and positivity

On the open locus of distinct roots and distinct leaf parameters, the cover parametrizing an ordering of all higher compound roots is finite étale of degree $`|G|`$. Its geometric generic fibre **over the spectral parameter space** is irreducible: over $`\overline K(e)`$ the group acts transitively on all orderings, and the finite étale cover of the regular leaf-parameter space then has one irreducible component. Geometric irreducibility of the generic fibre spreads to a nonempty open subset of spectra. Shrink this subset so the open leaf locus in each fibre is nonempty. For each rational spectrum there, the ordering cover over the leaf space is geometrically irreducible with group $`G`$. [Stacks Project, Lemma 37.27.5](https://stacks.math.columbia.edu/tag/0559)

For a positive sorted spectrum, restrict the real leaf parameters to $`\theta_h<e_h<\theta_{h+1}`$. The signs in (1) give $`b_h>0`$. The normalized matrix is similar to the real symmetric one with spokes $`\sqrt{b_h}`$, which has the prescribed positive spectrum, so every diagonal entry is positive. Hilbert irreducibility with weak approximation gives rational parameters in this real open box with connected ordering fibre. Its arithmetic Galois group is consequently transitive on all orderings and equals $`G`$. [Colliot-Thélène and Skorobogatov, Theorem 12.2.10](https://www.imo.universite-paris-saclay.fr/~jean-louis.colliot-thelene/BGgroup_book.pdf)

## Integer example

The nonnegative integer matrix
```math
\begin{pmatrix}
441&21&21&21
\\ 440&105&0&0
\\ 729&0&252&0
\\ 1309&0&0&420
\end{pmatrix}
```
has ordinary eigenvalues $`63,189,336,630`$. Its second and third permanental compounds have joint Galois group $`S_6\times S_4`$. It is obtained by multiplying (1) by 21 with input spectrum $`(3,9,16,30)`$ and leaves $`(5,12,20)`$. The [exact checker](verify_compound_galois.py) verifies the four eigenvalues and factors the two higher characteristic polynomials modulo $`13,19,59,103,367`$. The first three primes certify double transitivity in each projection. The last two supply a transposition in either coordinate alone after removing odd cycles by taking an odd power. The second-compound Perron root therefore has degree six and cannot be expressed by radicals even after adjoining the third-compound eigenvalues.
