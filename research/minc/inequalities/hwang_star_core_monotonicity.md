# Star-core monotonicity in Hwang's padding limit

20 November 2026 (America/Chicago). This is an exact all-order special-support theorem for the open [Problem 8](https://yair-lavi.com/mincs-list/problem-8/index.html) investigation, with a consequence for genuine doubly stochastic completions. It is **not** a classification of the boundary of the Birkhoff polytope, a proof of Hwang's convexity conjecture, or a resolution of C34. It adds **zero** to the full-resolution ledger.

## Statement

Let B be a nonzero nonnegative m-by-m doubly substochastic matrix supported on a single row, or on a single column. For t in [0,1], put

~~~math
F_B(t)=e^{t\sum_{ij}b_{ij}}\sum_{\mathcal M}
t^{|\mathcal M|}\prod_{(i,j)\in\mathcal M}b_{ij}
\prod_{i\notin V_L(\mathcal M)}(1-t r_i)
\prod_{j\notin V_R(\mathcal M)}(1-t c_j),
~~~

where r and c are the row- and column-sum vectors. This is exactly the limiting function called F_B^{ext} in [the substochastic padding theorem](../inequalities/hwang_substochastic_padding.md).

**Theorem.** In every order m, for every such nonzero B,

~~~math
F_B'(t)>0 \quad(0<t\le1),\qquad F_B'(0)=0,\qquad
F_B''(0)=\|B\|_F^2>0.                         \tag{1}
~~~

For each fixed B, let C_M(B) be the doubly stochastic completion defined in equation (1) of the padding theorem. Then for all sufficiently large integers M (threshold depending on B), the **actual finite-order** permanent path

~~~math
p_M(t)=\operatorname{per}\left((1-t)J_{M+m}+tC_M(B)\right)
~~~

satisfies

~~~math
p_M'(t)>0\qquad(0<t\le1/2).                    \tag{2}
~~~

When m>=2 and B is supported on one row, the completion has zero entries inside its upper-left block; thus this includes boundary directions not required to be symmetric. The finite statement is only on the half-segment; equation (1) for the limit does not establish monotonicity on the remaining half for finite M.

## Exact positive quadratic certificate

By transposition symmetry it suffices to study a single occupied row with entries b_1,...,b_m>=0 and S=sum_j b_j in (0,1]. For 0<t<1 write

~~~math
x_j=tb_j,\quad y_j=\frac{x_j}{1-x_j},\quad
U=\sum_jx_jy_j,\quad Q=\sum_j y_j^2,\quad
W=e^{tS}\prod_j(1-x_j).
~~~

There are only the empty matching and one-edge matchings. The weighted matching sum therefore is

~~~math
Z(tB)=(1-tS)\prod_j(1-x_j)
+\sum_jx_j\prod_{k\ne j}(1-x_k)
=\prod_j(1-x_j)(1+U).
~~~

Hence F_B(t)=W(1+U). The identities y_j=x_j+x_j y_j and
x_j d(x_j y_j)/d x_j=x_j y_j+y_j^2 give

~~~math
tW'(t)=-UW,\qquad tU'(t)=U+Q.
~~~

Differentiating the product yields the **exact** derivative identity

~~~math
\boxed{\quad tF_B'(t)=W(Q-U^2)
=W\left(\|y\|_2^2-\langle x,y\rangle^2\right).\quad} \tag{3}
~~~

Cauchy--Schwarz and nonnegativity give

~~~math
Q-U^2\ge \left(1-\sum_jx_j^2\right)Q
\ge(1-t^2S^2)Q>0\quad(0<t<1),              \tag{4}
~~~

since S<=1 and B is nonzero. This proves strict positivity in the open interval. If t=1 and no b_j equals one, each denominator is still positive and sum_j b_j^2<1 unless all mass is concentrated in one entry. Thus (3)-(4) also give strict positivity at t=1 in that case. If one b_j=1, substochasticity makes every other b_k zero and the function reduces to

~~~math
F_B(t)=e^t(1-t+t^2),\qquad F_B'(1)=2e>0.
~~~

Finally (3) with x_j=tb_j implies F_B'(t)=t sum_j b_j^2+O(t^2), proving the origin assertions in (1). The column-supported case is identical after transpose.

## Transfer to finite doubly stochastic matrices

The earlier [finite counting and limit theorem](../inequalities/hwang_substochastic_padding.md) proves

~~~math
p_M(t)/d_{M+m}\longrightarrow F_B(t)
\quad\text{in }C^2([0,1/2]),\qquad d_n=n!/n^n.  \tag{5}
~~~

For some small epsilon>0, the origin formula in (1) gives F_B''>c>0 on [0,epsilon]. Equation (5) makes p_M''>0 there for all sufficiently large M. The derivative p_M'(0) is zero because J_n is a stationary point of the permanent along every doubly stochastic direction. Thus p_M'(t)>0 on (0,epsilon]. On [epsilon,1/2] the positive continuous F_B' has a strictly positive minimum, and convergence of first derivatives in (5) proves p_M'>0 there as well. This proves (2), including its quantifiers.

## Why the certificate is radial, not entrywise

The star-core functional is *not* increasing in each entry. For a two-column occupied row B with entries b,c and b+c<=1,

~~~math
F(B)=e^{b+c}\left[1-b-c+b^2+bc+c^2-bc(b+c)\right],
~~~

so

~~~math
e^{-(b+c)}\frac{\partial F}{\partial b}
=b(1+b-c-bc-c^2).
~~~

At (b,c)=(1/10,4/5) the derivative is exactly -21/500. This is consistent with (3), which varies all entries proportionally; it rules out an entrywise-monotonicity extension of this proof. It is not a counterexample to Hwang, P8 or C34.

## Verification, sources, and remaining problem

The accompanying [exact checker](verify_hwang_star_core.py) independently expands the star matching polynomial, verifies (3) and the origin second derivative at 240 rational probes in orders 1 through 10, and checks the negative partial derivative exactly. The proof is general and does not rest on those finite probes. No independent adversarial review of this new note has yet occurred.

Sources inspected: the [current Problem 8 catalogue statement](https://yair-lavi.com/mincs-list/problem-8/index.html) records its unrestricted classification problem and earlier monotone families; the [current C34 catalogue statement](https://yair-lavi.com/mincs-list/conjecture-34/index.html) asks for the full finite-matrix chord comparison. The new argument uses the repository's already reviewed substochastic C^2 transfer. Hwang's 1989 paper is referenced at [DOI 10.1090/S0002-9939-1989-0960645-2](https://doi.org/10.1090/S0002-9939-1989-0960645-2), but its complete text was not reaudited for this note. No historical priority is asserted.

**Exact remaining gap:** control F_B'(t) and especially F_B''(t) for arbitrary connected, overlapping matching supports, or find a genuine B with negative F_B''(t) for t<=1/2. Even a universal positive limit curvature would not by itself prove the finite-order C34 chord inequality or classify all P8 boundary matrices. No full named resolution is claimed.
