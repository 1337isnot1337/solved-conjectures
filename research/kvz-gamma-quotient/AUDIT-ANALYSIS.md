# Independent analysis audit

Reviewed commit: `04ab22fc69f72cefa88c229a105ef12536ff7dbc`, `research/kvz-gamma-quotient/CANDIDATE_PROOF.md`.

Date: 2026-11-20. Reviewer: the separate analysis agent. This is an internal mathematical review, not outside peer review.

## Conclusion

The full written proof passes. No mathematical correction was required. It proves the all-order sign-regularity assertion for every positive parameter difference, supplies its complete signature, and treats integer differences by their exact rank. The false fixed order-three signature is corrected as part of the full theorem, not counted separately.

## Source and domain

I directly read [arXiv:2408.01755v2](https://arxiv.org/pdf/2408.01755v2), Definition 2.1 and Section 3, item 11, printed page 9. The source proposes that $\Gamma(c+x+y)/\Gamma(d+x+y)$ is sign regular of all orders when $c>d$. It separately proposes the fixed third-order signature $(+,-,-)$. These are distinct assertions: the former permits a signature depending on the fixed parameters.

The proof correctly works with $\delta=c-d>0$ and positive denominator argument. Its translation argument is slightly stronger than the positive-shift positive-quadrant formulation: for any finite grid satisfying $d+x_1+y_1>0$, the interval $-x_1<a<d+y_1$ is nonempty. With $b=d-a$, all shifted gamma shapes are positive. The shifts may depend on the grid because the final sign depends only on $\delta$ and the order. No claim is made across gamma poles or negative arguments.

The author's published PDF was not accessible to this reviewer through the retrieval tool. The parent agent independently checks the published version. This access distinction does not affect the directly inspected preprint statement.

## Wronskian and power-kernel calculation

For fixed $v_1<\cdots<v_r$, direct differentiation of $f_j(u)=(u+v_j)^\delta$ gives

```math
W_r(u)=(-1)^{\binom r2}
\left(\prod_{i=0}^{r-1}\delta^{\underline i}\right)
\left(\prod_{j=1}^r(u+v_j)^{\delta-r+1}\right)
\prod_{i\lt j}(v_j-v_i).
```

I derived this independently before reading the draft. In particular, the reciprocal-node Vandermonde contributes the reversal sign $(-1)^{\binom r2}$ and exactly $r-1$ powers of each denominator. Neither orientation nor exponent is missing.

The draft proves the required Chebyshev criterion rather than assuming that a single nonzero full Wronskian would suffice. Every initial Wronskian is nonzero. Dividing a combination by $f_1$ and differentiating reduces the number of functions, with

```math
W\left((f_2/f_1)',\ldots,(f_{k+1}/f_1)'\right)
=\frac{W(f_1,\ldots,f_{k+1})}{f_1^{k+1}}.
```

Rolle's theorem then bounds the number of distinct zeros. The identically-zero derivative case is explicitly disposed of by linear independence of the reduced functions. Connectedness of the ordered-node region and the equally spaced coalescent limit recover the sign of every evaluation determinant. This proves the claimed all-grid power-kernel signature.

For a positive integer $\delta=m$, the argument remains strict through order $m+1$. Every larger determinant vanishes because the columns have polynomial degree at most $m$. This is exact finite rank, not a loss of control at exceptional parameters.

## Gamma composition

The gamma-density kernel

```math
G(a,u)=\frac{u^{a-1}e^{-u}}{\Gamma(a)}
```

is strictly totally positive: positive row and column factors reduce it to $e^{a\log u}$, whose initial Wronskians are positive Vandermonde products. The transpose appearing in the proof does not change the determinant.

The identity

```math
\frac{\Gamma(x+y+\delta)}{\Gamma(x+y)}
=\int_0^\infty\int_0^\infty
G(x,u)(u+v)^\delta G(y,v)\,du\,dv
```

has the correct beta factor and Jacobian. Under $r=u+v$, $t=u/(u+v)$, the Jacobian is $r$, producing $r^{x+y+\delta-1}$ and the beta integral with shapes $x,y$.

Both continuous Cauchy–Binet identities have the right orientation and normalization. Restricting to each ordered integration domain cancels the corresponding factorial from the full-domain identity. The resulting three determinants have signs positive, $\varepsilon_r(\delta)$, positive.

The proof justifies absolute integrability term by term using

```math
(u+v)^\delta\leq(1+u)^\delta(1+v)^\delta.
```

Each variable occurs once in each determinant expansion product, so the bound reduces to finitely many gamma moments with polynomial-power weights. These are finite for all positive shapes. Thus there is no unproved exchange of divergent integrals or limiting determinant sums.

For noninteger $\delta$, the integrand has the same strict sign at every point of the ordered product domain. Continuity and positive measure make the integral strictly signed. At integer differences, the same reasoning proves strictness through the rank and exact vanishing afterward.

## Complete signature and the subsidiary correction

The result is

```math
\varepsilon_r(\delta)
=\mathop{\mathrm{sgn}}
\left[(-1)^{\binom r2}\prod_{j=0}^{r-1}\delta^{\underline j}\right]
```

for noninteger positive $\delta$. In particular, the third-order sign is $-\mathop{\mathrm{sgn}}(\delta-1)$. Thus the source's fixed $(+,-,-)$ guess is false for the entire interval $0<\delta<1$, where the correct signature is $(+,-,+)$. This correction is consistent with the proved all-order sign-regularity claim.

## Independent prior-scope checks

Both search engines were used for gamma quotient, gamma ratio, Hankel determinant, and sign-regularity combinations, including the exact source authors. No exact earlier resolution was located in the retrieved results. The following primary sources were inspected to prevent confusion with neighboring statements:

1. Grover–Panwar–Reddy, *Positivity properties of some special matrices*, **LAA 596** (2020), 203–215, DOI [10.1016/j.laa.2020.03.008](https://doi.org/10.1016/j.laa.2020.03.008), [full preprint](https://arxiv.org/pdf/2002.08703). Theorem 2.11 proves strict total positivity of $\Gamma(\lambda_i+\mu_j)$; Corollary 2.12 multiplies by positive row and column factors to obtain the inverse-beta kernel. These are not the shifted Hankel gamma quotient in the target.
2. Grover–Panwar, *Bidiagonal decompositions and total positivity of some special matrices*, **Operators and Matrices 16** (2022), 545–558, DOI [10.7153/oam-2022-16-41](https://doi.org/10.7153/oam-2022-16-41), [full PDF](https://files.ele-math.com/articles/oam-16-41.pdf). The paper treats powers of $1+xy$, negative powers of the Cauchy kernel, and mean matrices. The inspected results do not state the gamma-quotient assertion. These classical power-kernel results are relevant ingredients, not claimed as new.
3. Delgado–Peña, *High relative accuracy with some special matrices related to gamma and beta functions*, **Numerical Linear Algebra with Applications 30** (2023), e2494, [full publisher text](https://onlinelibrary.wiley.com/doi/full/10.1002/nla.2494). Section 3, Theorem 3, repeats the positive gamma-sum kernel result; Theorem 4 supplies bidiagonal decompositions on unit-spaced grids. Section 4 concerns inverse-beta matrices. No shifted Hankel gamma-quotient theorem was located.
4. The recent public question [Does this gamma-ratio moment inequality hold?](https://math.stackexchange.com/questions/5141806/does-this-gamma-ratio-moment-inequality-hold) concerns signed moments of products $(a-j)/(a+j+1)$ against a specific measure. Its displayed conjecture is different and supplies no resolution of the present kernel statement.

The accessible abstract of Salazar's arXiv:2606.31647 concerns positive gamma-normalized moment kernels and the positive Jackson gamma kernel. The full manuscript was not retrievable here; it is not represented as fully inspected. This review is not an exhaustive priority guarantee. It finds no earlier resolution in the inspected primary results and agrees that the proposed new-result scope must be the exact gamma-quotient assertion and its signature, not the classical composition mechanism.

Coordination: [issue 97](https://github.com/1337isnot1337/solved-conjectures/issues/97).
