# Review of the unitary-orbit asymptotic maximum

Independent mathematical review, 20 November 2026 (America/Chicago).

Reviewed the current [quartic checkpoint](unitary_orbit_quartic_germ.md), GitHub content SHA 97805ab5e65144dbc9f4ec4bd7406abeccdedc2e, and read its companion script without running a finite case range. This review covers maximization, uniformity, and the scope of the coefficients. The separate reviewer covers the quartic cancellation, deficit identity, and equality classification.

**Verdict:** The fourth-order asymptotic theorem and the uniform diagonal estimate pass. One sentence about the order-three example needs correction: $`98/3`$ is a coefficient along the constructed path, not the coefficient of the maximum for that spectrum.

## Uniform estimates and accumulation points

For fixed $`n,x`$, the Hermitian orbit is compact. Each principal-permanent coefficient $`q_j`$ is continuous there. Thus the finite identity-edge expansion has a uniform $`O(|\varepsilon|^5)`$ remainder after degree four; for orders below five that remainder is zero.

The quadratic and cubic identities give, on the entire orbit,


```math
\mathop{\mathrm{per}}(I+\varepsilon H)
=1+\frac{s_2}{2}\varepsilon^2+\frac{s_3}{3}\varepsilon^3
-\varepsilon^2\|d\|^2-2\varepsilon^3d\cdot r
+\varepsilon^4q_4(H)+O(|\varepsilon|^5).
```


Comparison of any maximizer with one fixed zero-diagonal orbit point gives


```math
\|d\|^2\le C_1|\varepsilon|\|d\|+C_2\varepsilon^2
```


with constants independent of the maximizing choice. Solving this quadratic proves $`\|d\|=O(|\varepsilon|)`$, uniformly over all maximizers. Multiplication by $`\varepsilon`$ gives the stated diagonal $`1+O(\varepsilon^2)`$ for the maximizing positive definite matrix. The argument works for both signs of $`\varepsilon`$. Compactness then puts every accumulation point of maximizing $`H_\varepsilon`$ in the zero-diagonal fiber.

For the upper bound, $`v=d/\varepsilon`$ is bounded and has coordinate sum zero. Away from the zero-diagonal fiber, the off-diagonal row-square sums satisfy $`\sum r_i=s_2-\|d\|^2`$, rather than $`s_2`$. This does not invalidate (9): for every constant $`c`$,


```math
-\|v\|^2-2v\cdot r
=-\|v+(r-c\mathbf1)\|^2+\|r-c\mathbf1\|^2.
```


Take $`c=s_2/n`$, then pass to a convergent subsequence of maximizing matrices along a limsup sequence. Continuity gives the claimed upper bound $`\Gamma_n(x)`$.

## Connected approximation and the lower bound

The connected-support density argument is valid also for complex Hermitian matrices. Vertices in distinct support components have a zero $`2`$-by-$`2`$ principal block. A real rotation of those coordinates preserves their diagonal entries exactly at zero. Old edges incident to either rotated vertex are multiplied by a nonzero cosine, while a neighbor of the chosen nonisolated vertex gains an edge to the other component. Connectivity within the old components is retained. Repeating arbitrarily small rotations connects all components, including isolated zero rows, without leaving the unitary orbit or the zero-diagonal fiber.

For a fixed connected zero-diagonal $`H`$, real choices of the edge parameters in (10) generate the real trace-zero diagonal space. Hence a fixed skew-Hermitian $`K`$ realizes the desired drift. Its conjugation path has fourth-order coefficient


```math
F(H)=q_4(H)+\left\|r(H)-\frac{s_2}{n}\mathbf1\right\|^2.
```


There is no need to bound $`K`$ uniformly as connected matrices approach a disconnected matrix. Fix one connected approximation first and take $`\varepsilon\to0`$. The maximum dominates that fixed path, so its normalized remainder has liminf at least $`F(H)`$. Only then take the supremum over connected $`H`$. Density and continuity identify this supremum with $`\Gamma_n(x)`$. This order of limits supplies the matching lower bound.

Consequently the coefficients $`1,0,s_2/2,s_3/3,\Gamma_n(x)`$ in the two-sided fourth-order asymptotic are justified. This does not evaluate $`\Gamma_n`$ for general spectra.

## Required correction to the example

The script's order-three core is


```math
H=\begin{pmatrix}0&1&2\\1&0&3\\2&3&0\end{pmatrix},
```


and its specified conjugation path indeed has coefficient $`98/3`$. However, the zero-diagonal Hermitian matrix


```math
\widetilde H=
\begin{pmatrix}
0&\sqrt2&\sqrt2\\
\sqrt2&0&3+i\\
\sqrt2&3-i&0
\end{pmatrix}
```


has exactly the same spectrum. Both characteristic polynomials are $`z^3-14z-12`$: their squared-edge sums are $`14`$, and the real part of their triangle product is $`6`$. For $`\widetilde H`$, the row-square sums are $`(4,12,12)`$. Since $`q_4=0`$ in order three,


```math
F(\widetilde H)
=\left(4-\frac{28}{3}\right)^2
+2\left(12-\frac{28}{3}\right)^2
=\frac{128}{3}>\frac{98}{3}.
```


The support is connected, so the lower-bound construction applies directly. In particular, the maximum's quartic coefficient for this spectrum is at least $`128/3`$.

Replace the phrase calling $`98/3`$ the example's “true coefficient” with wording identifying it as the coefficient along the constructed path. The two script examples check path expansions, not the constrained maximum. This correction leaves the theorem and the stated unevaluated variational formula intact.

No full result for Minc Problem 1 is established or counted by this checkpoint or review.

## Integration status

The reviewed example wording has been corrected in the accompanying manuscript. Its two verifier examples are now identified explicitly as path expansions. The original blob identifier above records the version reviewed and the reason for the correction.
