# Ellzey’s conjecture

Tracking issue: [#331](https://github.com/1337isnot1337/solved-conjectures/issues/331).

**Partial result.** Both the elementary positivity and elementary unimodality in Ellzey’s conjecture hold for every cyclic chain of transitive cliques in which consecutive cliques meet in one vertex and all these junction vertices are distinct. Clique sizes and the number of cliques are arbitrary. This is not a proof for arbitrary circular indifference digraphs. Priority of this partial result is not established.

## 1. Graphs and color transfer

Take $r\ge3$ junction vertices $v_0,\ldots,v_{r-1}$ in circular order. Between $v_{i-1}$ and $v_i$ (indices modulo $r$) put $s_i-2\ge0$ new vertices, and make the resulting interval of $s_i$ vertices a transitive clique: direct each edge from its earlier to its later endpoint in the interval order. There are no further edges. The graph is a circular indifference digraph in Ellzey’s Definition 5.1, taking these intervals as generators. Its vertex count is $n=\sum_i(s_i-1)$ and its arc count is $M=\sum_i\binom{s_i}{2}$.

Fix $N\ge n$ and write $X=(x_1,\ldots,x_N)$. For a transitive clique on $s=h+2$ vertices with first color $a$ and last color $b$, let $T_{h+2}(b,a)$ sum weights $q^{\operatorname{asc}}\prod_{v\ne \mathrm{first}} x_{\kappa(v)}$ over its proper colorings with those endpoint colors. The ascent counts arcs from a smaller to a larger color. Set $[k]_q=1+q+\cdots+q^{k-1}$ for $k\ge1$, $[0]_q=0$, and $[h]_q!=\prod_{k=1}^h[k]_q$ (including $[0]_q!=1$). Summing the ascents among the $h$ internal colors over their possible orders gives $[h]_q!$, by the usual inversion enumerator for permutations. Thus
$$
 T_{h+2}=[h]_q![u^h]K(u),\qquad
 K(u)_{b,a}=
 \begin{cases}
 x_b q^{[a<b]}\displaystyle\prod_{c\notin\{a,b\}}
 \bigl(1+ux_cq^{[a<c]+[c<b]}\bigr), &a\ne b,\\
 0,&a=b.
 \end{cases}
$$
In exponents, $[P]$ is the indicator of statement $P$.

Multiplying these matrices around the circle and taking the trace gives the finite-color chromatic quasisymmetric function. Each junction color is identified in its two incident factors, and each junction variable is counted by only the factor in which it is last. Each arc occurs in exactly one factor.

## 2. A common basis

Put $E(z)=\prod_{c=1}^N(1+zx_c)=\sum_m e_m(X)z^m$ and define vectors $f_j$, $1\le j\le N$, by
$$
 F_b(z)=\sum_{j=1}^N f_j(b)z^{j-1}
 =x_b\prod_{c<b}(1+qzx_c)\prod_{c>b}(1+zx_c).
$$
At $q=1$, $f_j(b)=x_be_{j-1}(X\setminus x_b)$, a polynomial in $x_b$ with coefficients independent of $b$, of degree $j$ and leading coefficient $(-1)^{j-1}$. More explicitly this follows from $e_{j-1}(X\setminus x_b)=\sum_{t=0}^{j-1}(-x_b)^t e_{j-1-t}(X)$. Thus the matrix of the $f_j$ specializes to a Vandermonde-type matrix times an invertible triangular matrix over $\mathbb Q(X)$. Consequently the $f_j$ form a basis over $\mathbb Q(q,X)$.

The key identity of vector-valued rational functions is
$$
 K(u)F(v)=
 \frac{vE(qu)F(v)}{(v-u)(v-qu)}
 -\frac{qE(v)F(qu)}{(q-1)(v-qu)}
 +\frac{E(qv)F(u)}{(q-1)(v-u)}.                 \tag{1}
$$

To verify (1) componentwise, fix $b$ and put $g_c=[c<b]$. Each summand indexed by $a\ne b$ in $(K(u)F(v))_b$ contains, for each $c\notin\{a,b\}$, the factor
$$
 A_c=(1+q^{g_c}u x_c)(1+qv x_c)\quad(c<a),
 \qquad
 B_c=(1+q^{g_c+1}u x_c)(1+v x_c)\quad(c>a).
$$
The remaining factors are $x_b x_a q^{[a<b]}(1+q^{[b<a]}vx_b)$. Since
$$
 A_c-B_c=(q-1)(v-q^{g_c}u)x_c,
$$
the sum over $a<b$ and the sum over $a>b$ telescope separately. In detail, let $A_-,B_-$ be products of $A_c,B_c$ over $c<b$ and $A_+,B_+$ the products over $c>b$. The two sums are
$$
 \frac{x_b q(1+v x_b)(A_--B_-)B_+}{(q-1)(v-qu)}
 \quad\text{and}\quad
 \frac{x_b(1+qv x_b)A_-(A_+-B_+)}{(q-1)(v-u)}.
$$
Substitute
$$
 x_b A_-B_+=\frac{E(qu)F_b(v)}{1+qu x_b},\quad
 x_b B_-B_+=\frac{E(v)F_b(qu)}{1+v x_b},\quad
 x_b A_-A_+=\frac{E(qv)F_b(u)}{1+qv x_b}.
$$
The two terms multiplying $E(qu)F_b(v)$ combine to $v/((v-u)(v-qu))$, giving (1).

## 3. Elementary-positive matrix entries and their centers

Set $z=u/v$ formally and expand the right-hand side of (1) in nonnegative powers of $z$, with coefficients Laurent polynomials in $v$ and rational functions in $q$. The coefficient multiplying $e_m f_l$ has a factor $v^{m+l-2}$ and $z$-series
$$
 \frac{q^m z^m}{(1-z)(1-qz)}
 +\frac{z^{l-1}}{q-1}
 \left(\frac{q^m}{1-z}-\frac{q^l}{1-qz}\right).
$$
For $h\ge0$, define $c_{h,m,l}(q)$ as its coefficient of $z^h$. The first summand contributes $q^m[h-m+1]_q$ when $h\ge m$ and otherwise zero. The second contributes $(q^m-q^{h+1})/(q-1)$ when $h\ge l-1$ and otherwise zero. These contributions cancel exactly when $h$ exceeds or equals both bounds $m,l-1$. Hence
$$
 c_{h,m,l}(q)=
 \begin{cases}
 q^m[h-m+1]_q,& m\le h<l-1,\\
 q^{h+1}[m-h-1]_q,& l-1\le h<m,\\
 0,&\text{otherwise}.
 \end{cases}                                              \tag{2}
$$
Here $m=0$ is permitted, with $e_0=1$. The second case is zero if $m=h+1$.

Because $u^hv^{j-1}=z^h v^{h+j-1}$, matching coefficients on the two sides of (1) gives
$$
 T_{h+2}f_j=[h]_q!\sum_{\substack{m\ge0,\ 1\le l\le N\\
 m+l=j+h+1}} c_{h,m,l}(q)\,e_m(X)f_l.                     \tag{3}
$$
Terms with $m>N$ vanish by $e_m(X)=0$. Each nonzero $c_{h,m,l}$ in (2) is a shifted interval of ones in the $q$ degrees, with center $(m+h)/2$: its endpoints are $m,h$ in the first case and $h+1,m-1$ in the second. Multiplying it by $[h]_q!$ adds center $h(h-1)/4$. Products of symmetric unimodal polynomials with nonnegative coefficients remain symmetric unimodal about the sum of centers, by decomposing each into a nonnegative sum of centered intervals and convolving two intervals at a time.

## 4. Trace

Compute the trace in the basis of (3), which is common to all clique sizes. Each term of the trace is an elementary monomial $\prod_i e_{m_i}(X)$ with a nonnegative polynomial coefficient. The index relation in (3) telescopes around a closed walk:
$$
 \sum_i m_i=\sum_i(h_i+1)=n,\qquad h_i=s_i-2.
$$
Every nonzero term has a symmetric unimodal coefficient with the common center
$$
 \sum_i\left(\frac{m_i+h_i}{2}+\frac{h_i(h_i-1)}4\right)
 =\sum_i\frac{(h_i+1)(h_i+2)}4=\frac{M}{2}.
$$
Grouping equal elementary monomials preserves this common-center unimodality and positivity. For $N\ge n$, the degree-$n$ elementary basis specializes faithfully to $N$ variables, so the coefficient conclusion holds in the full symmetric function ring. This proves both assertions of Ellzey’s conjecture for these cyclic clique chains.

## Literature and scope

- Brittney Ellzey, [A directed graph generalization of chromatic quasisymmetric functions](https://arxiv.org/abs/1709.00454), Definitions 5.1 and Conjecture 1.4, establishes the class and conjecture; Theorem 6.1 treats directed cycles. Our family contains that known case when all $s_i=2$.
- Per Alexandersson and Greta Panova, [LLT polynomials, chromatic quasisymmetric functions and graphs with cycles](https://arxiv.org/abs/1705.10353), Conjectures 27 and 36, independently conjecture positivity and unimodality in the circular setting. Their circular directed-cycle case is prior art.
- Aarush Vailaya, [Proper circular arc graphs are $e$-positive](https://arxiv.org/abs/2609.33124v3), proves the full $q=1$ specialization and uses color matrices and a tableau basis, explicitly leaving general $q$ open in Section 8. The common single-junction basis and formula (3) above supply one restricted $q$-refinement of that transfer-matrix strategy.
- Foster Tom and Aarush Vailaya, [The chromatic symmetric function of graphs glued at a single vertex](https://arxiv.org/abs/2503.19344), give related $q=1$ gluing results and discuss $q$-weighted gluing. No claim is made here of priority for the transfer-matrix approach or for any previously handled subfamily.

