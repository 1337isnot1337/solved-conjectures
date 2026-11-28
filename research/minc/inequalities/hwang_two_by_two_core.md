# Two-by-two cores in Hwang's permanent padding limit

Research checkpoint, 20 November 2026 (America/Chicago). [Problem 8](https://yair-lavi.com/mincs-list/problem-8/) remains open, as does [Conjecture 34](https://yair-lavi.com/mincs-list/conjecture-34/). This note gives an exact all-parameter theorem for a family with overlapping rows and columns (including weighted four-cycles). It extends the earlier [star-core note](hwang_star_core_monotonicity.md), but **does not resolve either numbered entry**.

## Theorem and correct scope

Let $`B`$ be a nonnegative, doubly substochastic $`m\times m`$ matrix. Assume that every connected component of its bipartite support uses **at most two row vertices and at most two column vertices**. These components may have any allowed positive weights, including a fully occupied $`2\times2`$ block; there is no assumption of equal row sums or symmetry.

Let $`r_i=\sum_j b_{ij}`$, $`c_j=\sum_i b_{ij}`$, $`s=\sum_{ij}b_{ij}`$, and define the matching-limit function

~~~math
F_B(t)=e^{ts}\sum_{\mathcal M}
t^{|\mathcal M|}\prod_{(i,j)\in\mathcal M}b_{ij}
\prod_{i\notin V_L(\mathcal M)}(1-tr_i)
\prod_{j\notin V_R(\mathcal M)}(1-tc_j).
\tag{1}
~~~

For nonzero $`B`$, $`F_B'(t)>0`$ on $`0<t\le1`$, and $`F_B''(t)>0`$ on $`0\le t\le1/2`$. More quantitatively, **for an arbitrary nonzero $`2\times2`$ doubly substochastic core**,

~~~math
F_B'(t)\ge\frac{t e^{ts}}8\,\|B\|_F^2 \quad(0\lt t\le1),
\qquad
F_B''(t)\ge\frac{e^{ts}}4\,\|B\|_F^2
\quad(0\le t\le1/2).
\tag{2}
~~~

The strict conclusions extend to disjoint unions of these components by product differentiation. The numerical constants in (2) are convenient rational certificates, not claimed to be optimal.

For each such fixed $`B`$, let $`A_M(B)`$ be the $`(M+m)\times(M+m)`$ doubly stochastic completion from [the substochastic padding theorem](hwang_substochastic_padding.md), equation (1). For all sufficiently large $`M`$, the **finite** path

~~~math
p_M(t)=\mathop{\mathrm{per}}\bigl((1-t)J_{M+m}+tA_M(B)\bigr)
~~~

is strictly convex on $`0\le t\le1/2`$, and strictly increasing on $`0<t\le1/2`$. The threshold may depend on $`B`$. If $`B`$ has a zero entry, its completion is on the boundary of the Birkhoff polytope, so this supplies boundary directions beyond the star-forest class. The result does not assert finite monotonicity on the other half of the path, or the complete Lih–Wang chord inequality.

## The four-edge calculation

First take a $`2\times2`$ core $`X=\left(\begin{smallmatrix}x&y\\z&h\end{smallmatrix}\right)`$ and write

~~~math
r_1=x+y,\quad r_2=z+h,\quad
c_1=x+z,\quad c_2=y+h,\quad S=x+y+z+h.
~~~

The matching polynomial with its unmatched-vertex factors is exactly

~~~math
\begin{aligned}
Z(X)={}&(1-r_1)(1-r_2)(1-c_1)(1-c_2)
\\ &+x(1-r_2)(1-c_2)+y(1-r_2)(1-c_1)
\\ &+z(1-r_1)(1-c_2)+h(1-r_1)(1-c_1)+xh+yz.
\end{aligned}\tag{3}
~~~

There are only the empty matching, four one-edge matchings and two perfect matchings. Define the Euler operator $`\mathcal E=x\partial_x+y\partial_y+z\partial_z+h\partial_h`$ and $`T=x^2+y^2+z^2+h^2`$. Set

~~~math
Q=SZ+\mathcal EZ,\qquad
R=S^2Z+2S\mathcal EZ+\mathcal E(\mathcal EZ)-\mathcal EZ.
\tag{4}
~~~

Because the exponential factor is $`e^{tS(B)}`$ and all matching terms are polynomials in $`tB`$, the chain rule gives the exact identities

~~~math
t e^{-tS(B)}F_B'(t)=Q(tB),\qquad
t^2e^{-tS(B)}F_B''(t)=R(tB).
\tag{5}
~~~

It therefore suffices to establish two polynomial inequalities: $`Q(X)\ge T(X)/8`$ for every doubly substochastic $`2\times2`$ matrix $`X`$, and $`R(X)\ge T(X)/4`$ for every such $`X`$ whose maximum diagonal entry plus maximum off-diagonal entry is at most $`1/2`$.

## Exact polynomial positivity certificate

Let $`p=\max(x,h)`$ and $`q_0=\max(y,z)`$. **Substochasticity implies $`p+q_0\le1`$**: the two selected entries always share either a row or a column. Conversely, this inequality suffices for all four row and column bounds. By permutations of rows and columns and, if needed, transposition, we may assume $`x=p,\ y=q_0,\ h\le p,\ z\le q_0`$; $`Q,R,T`$ are invariant under these operations.

Every allowed matrix is consequently represented, with suitable $`q,w,u,v\in[0,1]`$, as

~~~math
X(q,w,u,v)=
\begin{pmatrix}
(1-q)w & qw\\ qwv &(1-q)wu
\end{pmatrix},\qquad w=p+q_0.
\tag{6}
~~~

The cases $`p=0`$, $`q_0=0`$, and $`B=0`$ follow by choosing the unused parameters arbitrarily. For the half-activity statement use instead $`X(q,w,u,v)/2`$, since $`t(p+q_0)\le1/2`$.

Substitute (6) into $`Q-T/8`$, and into $`R(X/2)-T(X/2)/4`$. These are polynomials on the unit four-cube. Write their expansions in the tensor-product Bernstein bases

~~~math
\prod_{j=1}^{4}\binom{d_j}{i_j}z_j^{i_j}(1-z_j)^{d_j-i_j},
\qquad 0\le i_j\le d_j,
~~~

with variable order $`(q,w,u,v)`$, degrees $`(14,5,3,3)`$ for the first polynomial and $`(8,6,4,4)`$ for the second. **Every coefficient is nonnegative.** The exact certificate is the short [integer-arithmetic verifier](verify_hwang_two_by_two_core.py), which constructs $`Z,Q,R`$ from (3)-(4), clears the power-coefficient denominators and checks the Bernstein coefficients with integers. In particular, if $`a_\alpha`$ are the power-basis coefficients after multiplying by their least common denominator, the scaled Bernstein coefficient for index $`i`$ is exactly

~~~math
N_i=\sum_{\alpha\le i}a_\alpha
\prod_{j=1}^4\binom{d_j-\alpha_j}{i_j-\alpha_j}.
\tag{7}
~~~

The true Bernstein coefficient is $`N_i`$ divided by the positive power-coefficient denominator and $`\prod_j\binom{d_j}{i_j}`$. The verifier checks all 1,440 coefficients in the first expansion (480 zero; cleared denominator 8) and all 1,575 in the second (450 zero; cleared denominator 64). Both minima are exactly zero; no floating-point comparisons enter this test. Thus $`Q\ge T/8`$ and $`R\ge T/4`$ on their stated domains. Equation (5) proves (2), including strictness for $`B\ne0`$. At $`t=0`$, continuity yields the asserted curvature bound (in fact $`F_B''(0)=\|B\|_F^2`$).

This is a finite exact Bernstein-certificate proof, not an extrapolation from sampled orders. The script separately verifies the polynomial identities using 80 independent rational matching enumerations and direct radial derivatives; those diagnostics are not the proof of the global sign.

## Components and actual finite permanents

All monomer factors in (1) depend only on edges incident to their own support component. Matchings split uniquely into component matchings. Hence $`F_B=\prod_C F_C`$. Isolated vertices contribute one. Each nontrivial component is contained in a $`2\times2`$ block, with possibly an added isolated vertex to make it square. By (2), each nontrivial factor is positive, strictly increasing for $`t>0`$, and strictly convex on $`[0,1/2]`$. The product rule (including nonnegative pairwise $`F_C'F_D'`$ terms) establishes the asserted strictness for any nonzero disjoint union.

The [earlier transfer theorem](hwang_substochastic_padding.md), equation (7), establishes $`p_M/d_{M+m}\to F_B`$ in $`C^2([0,1/2])`$. The continuous $`F_B''`$ has a strictly positive minimum on that compact interval, so all sufficiently large $`M`$ satisfy $`p_M''>0`$ there. Every doubly stochastic direction has $`p_M'(0)=0`$; integrating the positive second derivative yields $`p_M'(t)>0`$ for $`0<t\le1/2`$. This completes the finite claim.

## Source limits and remaining problem

The exact live [P8 statement](https://yair-lavi.com/mincs-list/problem-8/) asks to describe all boundary directions with monotone full segments. The [C34 statement](https://yair-lavi.com/mincs-list/conjecture-34/) asks for a finite-matrix chord inequality; positive curvature on the first half alone does not prove that endpoint comparison. The classical [Hwang 1991 convexity paper](https://doi.org/10.1080/03081089108818095) formulates the stronger half-segment convexity problem, with the original paper's full text not accessible in this audit. The catalogue records Hwang's monotone structured families, earlier low-order theorems and nonmonotone boundary examples. Searches of the current catalogue, the Hwang abstract, and recent permanent/matching-polynomial literature did not reveal the specific two-by-two substochastic-limit certificate above, but this is **not an exhaustive priority search**.

A connected component with **three or more rows and columns**, even one supported on a tree, is outside this theorem. The general half-segment curvature and the complete P8 boundary classification remain open; it is also unknown whether the remaining general finite C34 chord comparison follows by another method. No external referee review has been performed and **the full numbered-resolution count stays zero**.
