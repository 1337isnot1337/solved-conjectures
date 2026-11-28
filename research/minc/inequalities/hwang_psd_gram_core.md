# Gram-positive cores in the Hwang padding limit

Research checkpoint, 21 November 2026. This is an **uncounted partial theorem** for [Minc Problem 8](https://yair-lavi.com/mincs-list/problem-8/) and [Hwang's convexity question](https://doi.org/10.1080/03081089108818095), not a full numbered-entry resolution. It permits connected support on arbitrarily many rows and columns, and the finite completion need not be positive semidefinite.

## Statement

Let $`B\ne0`$ be an entrywise nonnegative, real symmetric positive-semidefinite $`m\times m`$ matrix with all row sums at most one. Let $`F_B(t)`$ denote the balanced-Poisson matching function in [the substochastic padding theorem](hwang_substochastic_padding.md):

~~~math
F_B(t)=e^{ts}\sum_{\mathcal M}t^{|\mathcal M|}
\prod_{(i,j)\in\mathcal M}b_{ij}
\prod_{i\notin V_L(\mathcal M)}(1-tr_i)
\prod_{j\notin V_R(\mathcal M)}(1-tr_j),
\quad s=\sum_{ij}b_{ij},\quad r_i=\sum_j b_{ij}.
~~~

The entire Taylor expansion $`F_B(t)=\sum_{k\ge0}c_kt^k`$ has $`c_k\ge0`$ for **every** degree, with

~~~math
c_0=1,\qquad c_1=0,\qquad c_2=\tfrac12\|B\|_F^2>0.
~~~

Consequently, for $`t\ge0`$,

~~~math
F_B''(t)\ge\|B\|_F^2>0,\qquad
F_B'(t)\ge t\|B\|_F^2
~~~

and all derivatives of order at least two are nonnegative. Independent row/column permutations leave $`F`$ invariant, so this also holds when $`B`$ is symmetric PSD after a column permutation.

Let $`A_M(B)`$ be the genuine doubly stochastic completion defined by equation (1) of the padding theorem, with $`M\ge m`$. For each fixed $`B`$, all sufficiently large $`M`$ satisfy

~~~math
\frac{d^2}{dt^2}\mathop{\mathrm{per}}((1-t)J_{M+m}+tA_M(B))>0
\quad(0\le t\le1).
~~~

The permanent therefore increases strictly on the **full segment** $`0<t\le1`$. If $`B`$ has a zero entry these are boundary directions. No uniform effective threshold in $`M`$ is claimed, nor any result for arbitrary indefinite/asymmetric cores.

## Proof: exact Gram squares

For formal variables $`x_1,\ldots,x_m,y_1,\ldots,y_m`$, let $`[xy]`$ extract the coefficient of $`x_1\cdots x_my_1\cdots y_m`$. The balanced independent-Poisson construction gives

~~~math
F_B(t)=[xy]\exp\left(\sum_i x_i+\sum_j y_j+
t\sum_{ij}b_{ij}(x_i-1)(y_j-1)\right). \tag{1}
~~~

To check this directly, use independent edge counts of means $`tb_{ij}`$, left monomer counts of means $`1-tr_i`$, and right monomer counts of the same means. Their joint probability-generating function is $`e^{-2m}`$ times the exponential in (1). The event that every left and right total equals one corresponds exactly to the matching sum; it has probability $`e^{-2m}F_B(t)`$. All means are nonnegative on $`0\le t\le1`$, and polynomial-exponential analyticity extends the identity to all complex $`t`$.

Factor $`B=VV^{\mathsf T}`$ with real $`V=(v_{ia})`$ having $`r`$ columns. Define

~~~math
H_a(x)=\sum_i v_{ia}(x_i-1),\qquad
L_\alpha=[x_1\cdots x_m]e^{\sum_i x_i}
\prod_{a=1}^r H_a(x)^{\alpha_a},\quad \alpha\in\mathbb N^r.
~~~

The bilinear form in (1) becomes $`\sum_a H_a(x)H_a(y)`$. Expanding its exponential and extracting independently in the two identical real variable sets proves the **all-degree identity**

~~~math
F_B(t)=\sum_{\alpha\in\mathbb N^r}
\frac{L_\alpha^2}{\alpha_1!\cdots\alpha_r!}t^{|\alpha|}. \tag{2}
~~~

Every coefficient is a sum of real squares. This Taylor series is entire because its left side is $`e^{ts}`$ times a polynomial.

For the first coefficients, note the exact multivariate generating identity

~~~math
\sum_\alpha\frac{L_\alpha}{\alpha!}z^\alpha
=e^{-\sum_i v_i\cdot z}\prod_{i=1}^m(1+v_i\cdot z). \tag{3}
~~~

Indeed $`[x_i]e^{x_i+u(x_i-1)}=(1+u)e^{-u}`$. Since $`(1+u)e^{-u}=1-u^2/2+O(u^3)`$, we obtain $`L_0=1`$, $`L_{e_a}=0`$, $`L_{2e_a}=-\sum_i v_{ia}^2`$, and $`L_{e_a+e_b}=-\sum_i v_{ia}v_{ib}`$ for $`a\ne b`$. Hence

~~~math
c_2=\frac12\sum_a\left(\sum_i v_{ia}^2\right)^2+
\sum_{a\lt b}\left(\sum_i v_{ia}v_{ib}\right)^2
=\frac12\mathop{\mathrm{tr}}((V^{\mathsf T}V)^2)
=\frac12\|B\|_F^2.
~~~

For $`B\ne0`$, it is positive. Termwise differentiation of (2) proves the quantitative bounds.

The [full-interval $`C^2`$ strengthening](hwang_substochastic_padding.md#full-interval-c2-strengthening) of the padding theorem gives $`p_M/d_{M+m}\to F_B`$ uniformly with two derivatives on **$`[0,1]`$**, where $`p_M(t)=\mathop{\mathrm{per}}((1-t)J_{M+m}+tA_M(B))`$. This uses $`M>q=m-s`$ to keep the tail factor positive at the endpoint. Thus eventually $`p_M''/d_{M+m}\ge\|B\|_F^2/2>0`$ throughout. Since $`p_M'(0)=0`$, integration gives the finite conclusion.

## Quantified finite Lih-Wang chord gap

The full-segment $`C^2`$ transfer gives more than monotonicity. For
every fixed nonzero core $`B`$ in the theorem, choose $`M`$ sufficiently
large that

~~~math
p_M''(t)\ge \tfrac12d_{M+m}\|B\|_F^2
\qquad (0\le t\le1).
~~~

For a twice-differentiable real function $`f`$ with $`f''\ge c`$
on $`[0,1]`$, the function $`f(t)-ct^2/2`$ is convex. Its chord inequality
rearranges to
$`f(t)\le(1-t)f(0)+tf(1)-ct(1-t)/2`$.
Applying this with $`f=p_M`$, $`c=d_{M+m}\|B\|_F^2/2`$, and
$`p_M(0)=d_{M+m}`$, gives for **every $`0\le t\le1`$**

~~~math
\mathop{\mathrm{per}}((1-t)J_{M+m}+tA_M(B))
\le (1-t)d_{M+m}+t\,\mathop{\mathrm{per}}A_M(B)
-\frac{d_{M+m}}4\|B\|_F^2t(1-t).
\tag{4}
~~~

The inequality is strict relative to the ordinary chord for
$`0<t<1`$. It proves the full Lih-Wang chord comparison for these
genuine **indefinite, sometimes boundary** matrices, including
the conjecture's required half segment. It does not prove C34 for
unrestricted doubly stochastic matrices, and is not a new complete
Minc-entry resolution.

## Indefinite finite-completion example

Take the connected three-by-three Gram core

~~~math
B=\frac14\begin{pmatrix}1&1&0\\1&2&1\\0&1&1\end{pmatrix}
=\frac14\begin{pmatrix}1&0\\1&1\\0&1\end{pmatrix}
\begin{pmatrix}1&1&0\\0&1&1\end{pmatrix}.
~~~

Its row sums are $`(1/2,1,1/2)`$, so $`s=2`$, $`q=m-s=1`$, and $`u=\mathbf1-B\mathbf1=(1/2,0,1/2)`$. The vector $`h=(1,-1,1)^{\mathsf T}`$ belongs to $`\ker B`$ but $`h^{\mathsf T}u=1`$. For every $`M\ge3`$, the full completion

~~~math
A_M(B)=\begin{pmatrix}
B&u\mathbf1_M^{\mathsf T}/M
\\ \mathbf1_Mu^{\mathsf T}/M&(M-1)\mathbf1_M\mathbf1_M^{\mathsf T}/M^2
\end{pmatrix}
~~~

has quadratic form $`-2\varepsilon+(M-1)\varepsilon^2<0`$ at $`(h,-\varepsilon\mathbf1_M)`$ for small positive $`\varepsilon`$. Thus it is **indefinite for every $`M`$**. The preceding argument nevertheless proves strict **full-segment** convexity and monotonicity for all sufficiently large $`M`$. Its zero entries make it a genuine boundary example, outside the earlier star-forest and two-by-two-support theorems and outside the classical PSD-finite-matrix deduction.

## Verification, sources and limits

[An independent exact-arithmetic diagnostic](verify_hwang_psd_core.py) builds the matching polynomial by row-subset recursion, and separately evaluates the Gram-square coefficients using (3). It checks degrees $`0`$ through $`10`$ on the displayed rank-two core, $`0`$ through $`8`$ on a rank-three order-four core, and $`0`$ through $`10`$ on a rank-one order-four core, including the first two coefficient identities. These finite checks are not the proof of (2).

Hwang's 1989 result already proves monotonicity for symmetric PSD **doubly stochastic** matrices. Hwang's [1991 convexity paper](https://doi.org/10.1080/03081089108818095) proposes strict half-segment convexity and proves order three; a searchable Hwang 1992 paper treats permutation vertices. Those sources and the current [P8 statement](https://yair-lavi.com/mincs-list/problem-8/) were inspected. This result addresses a distinct **substochastic-core** limit with potentially indefinite finite completions, but we make **no historical novelty claim** for the underlying Gram-square identity. Full 1991 text, exhaustive source priority and independent adversarial review remain unavailable.

The full P8 classification of monotone boundary matrices, and the finite C34 Lih-Wang chord inequality for arbitrary doubly stochastic matrices, both remain open. **No additional full Minc-entry resolution is counted.**
