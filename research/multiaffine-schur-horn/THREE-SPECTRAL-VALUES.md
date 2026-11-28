# Multiaffine Schur–Horn for two spectral values and for three with a simple one

**Partial result, not a proof of the general conjecture.** Let the real symmetric matrix $`X`$ have at most two distinct eigenvalues, or have exactly three distinct eigenvalues one of which has multiplicity one. Then a single probability distribution on permutations of its ordinary eigenvalue list realizes, in expectation, every principal minor of $`X`$ simultaneously. In particular every homogeneous multiaffine polynomial has the Schur–Horn property on these spectral classes. There is no bound on matrix dimension or minor degree.

**Source.** G. Blekherman, M. Kummer, R. Sanyal, K. Shu, and S. Sun, [*Linear Principal Minor Polynomials: Hyperbolic Determinantal Inequalities and Spectral Containment*, arXiv:2112.13321v1](https://arxiv.org/html/2112.13321v1#S9.SS2), Conjecture 9.10; [journal version](https://doi.org/10.1093/imrn/rnac291), Conjecture 9.7. Conjecture 9.10 asks for
```math
 \sum_{|J|=k}a_J\det(X_{J,J})\le \max_{\pi\in S_n}\sum_{|J|=k}a_J\prod_{i\in J}\lambda_{\pi(i)}
```
for every real coefficient list $`a`$. This is distinct from the forward hyperbolic-root majorization and the reverse hyperbolic Horn question in §9.1 of the preprint.

## 1. Projection sampling and nesting

For a rank-$`r`$ projection $`P=VV^\top`$ in $`\mathbb R^n`$ with $`V`$ an $`n\times r`$ orthonormal frame, assign a probability to each $`r`$-subset $`S\subset[n]`$ by $`\Pr(S)=\det(V_{S,[r]})^2`$. Cauchy–Binet shows the masses sum to one and gives the generating polynomial
```math
 \mathbb E\prod_{i\in S}(1+z_i)
 =\det(I_r+V^\top\mathop{\mathrm{diag}}(z)V)
 =\det(I_n+\mathop{\mathrm{diag}}(z)P).
```
Comparing coefficients proves $`\Pr(J\subset S)=\det P_{J,J}`$ for every $`J`$, including the empty set.

If $`R=P+vv^\top`$ for a unit vector $`v\perp\mathop{\mathrm{ran}}P`$, the projection samples for $`P,R`$ can be coupled as $`S\subset T`$, with $`|T\setminus S|=1`$. This is the rank-one case of [Russell Lyons, *Determinantal Probability Measures*, 2003](https://pmihes.centre-mersenne.org/articles/10.1007/s10240-003-0016-0/), Theorem 6.2 and monotone coupling. In finite dimensions it also follows directly by the proof mechanism of that theorem. Take the unit wedge $`w=V_1\wedge\cdots\wedge V_r`$ and $`w'=v\wedge w`$. Write $`\iota_v`$ for contraction with $`v`$; $`\iota_v w'=w`$, and $`\|\iota_v\|\le1`$ because in an orthonormal basis starting with $`v`$ contraction discards all terms not containing $`v`$ and strips $`v`$ from the remaining terms. For any family $`\mathcal A`$ of $`r`$-subsets, let $`N(\mathcal A)`$ consist of all $`(r+1)`$-subsets containing at least one member. Coordinate projection $`\Pi_{\mathcal A}\iota_v`$ ignores all $`w'`$-coordinates outside $`N(\mathcal A)`$: the contraction of a coordinate wedge indexed by $`T`$ has terms only at subsets of $`T`$. Hence
```math
 \|\Pi_{\mathcal A}w\|^2
 =\|\Pi_{\mathcal A}\iota_v\Pi_{N(\mathcal A)} w'\|^2
 \le\|\Pi_{N(\mathcal A)}w'\|^2 .
```
These are precisely the weighted Hall inequalities for shipping all mass from the projection law for $`S`$ to that for $`T`$ along containment edges. Finite max-flow/min-cut gives the coupling.

## 2. Three spectral values including a simple one

Write $`X=aI+bP+c\,vv^\top`$, where $`P`$ projects onto one eigenspace of dimension $`r`$, $`v`$ spans the simple eigenspace, and $`P v=0`$. Use the nested pair $`S\subset T`$ above and put $`U=T\setminus S`$, a singleton. Assign the ordinary eigenvalue $`a+b`$ to precisely $`S`$, $`a+c`$ to precisely $`U`$, and $`a`$ to the remaining coordinates. Let the resulting random coordinate list be $`L`$. It is a permutation of the eigenvalue list for each realization.

For any $`J\ne\varnothing`$, with $`j=|J|`$, expansion according to whether $`J`$ contains the singleton $`U`$ gives
```math
 \mathbb E\!\prod_{i\in J}(b\,1_{i\in S}+c\,1_{i\in U})
   = b^j\det P_{J,J}
   + b^{j-1}c\bigl(\det R_{J,J}-\det P_{J,J}\bigr).
```
Indeed the two relevant events are $`J\subset S`$, and $`J\subset T`$ but $`J\not\subset S`$. On the latter precisely one factor is from $`U`$.

The determinant $`\det(P_{J,J}+u\,v_Jv_J^\top)`$ is affine in $`u`$ by rank-one column multilinearity. Its value at $`u=0`$ is $`\det P_{J,J}`$; its increment at $`u=1`$ is $`\det R_{J,J}-\det P_{J,J}`$. Thus the displayed expectation equals
```math
 \det((bP+c\,vv^\top)_{J,J}).
```
This identity also holds at $`b=0`$ by continuity, and the empty-index case is $`1`$. Adding $`a`$ to each factor and using the usual principal-minor expansion of $`\det(aI+B)`$ proves
```math
 \mathbb E\prod_{i\in J}L_i=\det X_{J,J}\quad\text{for every }J\subset[n].
```
It follows that any desired linear combination of the minors is bounded by the maximum over diagonal eigenvalue permutations. If there are only two spectral values, the same conclusion uses a single sample $`S`$ and $`X=aI+bP`$; the scalar case is immediate. Complex Hermitian matrices also work by replacing squares by squared moduli, transposes by adjoints, and using the Hermitian wedge norm.

## 3. The stronger compound-matrix approach is not available in general

Cauchy–Binet writes the vector of $`k`$-minors of $`U\mathop{\mathrm{diag}}(\lambda)U^\top`$ as the action of the doubly stochastic matrix $`M_{J,I}=|\det U_{J,I}|^2`$ on the vector $`(\prod_{i\in I}\lambda_i)_{|I|=k}`$. Birkhoff at this compound order permits arbitrary permutations of $`k`$-subsets, but the conjecture permits only those induced by permutations of $`[n]`$.

The claim that the entire matrix $`M`$ always lies in the convex hull of the induced permutations, independent of $`\lambda`$, is stronger and is false. See [S. W. Drury, *A counterexample to a question of Merikoski and Virtanen on the compounds of unitary matrices*, 1992](https://doi.org/10.1016/0024-3795(92)90296-M), and [Drury, *OMC for Householder reflections*, 1999](https://doi.org/10.1016/S0024-3795(99)00173-1). This failure does not disprove the conjecture, which tests only the action on a vector of products from one spectrum and lets the mixing law depend on the spectrum. The positive result above does exactly that.

Targeted primary-source searches found no earlier proof of the specific three-spectral-value partial result, but the DPP and coupling inputs are classical. General spectra remain unresolved here.
