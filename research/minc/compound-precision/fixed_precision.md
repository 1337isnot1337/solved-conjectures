# Characteristic polynomial of permanental compounds

For every fixed positive integer $b$, there is a deterministic algorithm to compute **all** coefficients of $\det(I-zP_k(A))$ modulo $2^b$, simultaneously, for every integer matrix $A$ of order $n$ and every $0\le k\le n$. Write $N=\binom nk$. After input reduction its bit cost is
$$
 \widetilde O_b\!\left(N(n+1)^{O(b^2)}\right).
$$
The dependence on $N$ is quasi-linear, including when $k$ grows with $n$. The dependence on precision prevents this bound from establishing a fast full integer reconstruction. The [two-bit specialization](mod_four.md) gives a simpler implementation and worked formula.

## Marking inversions

Write $C(T)=\bigwedge^k T$ and $D=C(A)$. Give a bijection $\sigma$ between ordered row and column subsets the signed weight of its determinant term multiplied by $(1+w)^{\mathrm{inv}(\sigma)}$. The resulting matrix is $B(w)=D+\sum_{h\ge1}w^h E_h$ and $B(-2)=P_k(A)$ exactly.

To construct a term of $E_h$, choose $h$ distinct pairs of crossing edges of the complete row-column bipartite graph, each between a smaller row with larger column and a larger row with smaller column. If their union is not a partial matching, the term is zero. Otherwise let $T$ denote the set of distinct edges in the union. The contribution is
$$
 \left(\prod_{e\in T} a_e\right)
 [\,\prod_{e\in T}v_e\,]\, C\!\left(A+\sum_{e\in T}v_e U_e\right),
 \tag{1}
$$
where $U_e$ is the matrix unit. Each determinant term is counted once per choice of $h$ of its inversions, including inversions that share an edge. Formula (1) forces each edge of the union just once. There are at most $2h$ edge variables per term.

Work modulo $(w^b,z^{N+1})$. Terms of degree at least $b$ in $w$ give multiples of $2^b$ on evaluation. Let $E(w)=B(w)-D$ and $R=(I-zD)^{-1}$. Put
$$
 H_0(z)=\det(I-zD),\qquad
 Q(w,z)=\det(I-zR E(w)).
$$
Then $\det(I-zB(w))=H_0 Q$ and $Q(0,z)=1$. The derivative identity for the determinant gives
$$
 w\,\partial_w\log Q
 =-\sum_{\ell\ge1} z^\ell
      \operatorname{tr}\left((R E(w))^{\ell-1}R\, w E'(w)\right).
 \tag{2}
$$
This notation means $wQ'/Q$. It uses only series inversion at constant term one. Through $w^{b-1}$ the sum involves at most $b-1$ insertions. The baseline $H_0$ is computed modulo $2^b$ from traces in dimension $n$ by the method in the [two-bit proof](mod_four.md), using $b+\lceil\log_2(N+1)\rceil^2$ working bits.

## Summing the gaps between marked entries

Fix a term of total $w$-degree $p<b$ with $\ell$ insertions in (2), including the choice of crossing pairs at each insertion. The edges in (1) at different insertions receive different variables. Let $s\le2p$ be the total number of edge variables $v$. Write $A_j(v)$ for $A$ with the appropriate matrix-unit perturbations at insertion $j$. The scalar multipliers in (1) and the factor from the derivative in (2) may be restored at the end.

In the coefficient of $z^{t+\ell}$ there are nonnegative gaps $a_1+\dots+a_\ell=t$. Their unweighted trace contribution for this choice is the sum of
$$
 [y^k v_1\cdots v_s]\det\left(I+y\prod_{j=1}^{\ell} A^{a_j} A_j(v)\right).       \tag{3}
$$
This follows from multiplicativity of exterior powers and the exterior trace identity. Enumerating all compositions for all $t$ could take order $N^\ell$ time. The following calculation gives quasi-linear dependence on $N$.

Take new independent matrix variables $Y_1,\dots,Y_\ell$ of order $n$. For fixed $t$ form the polynomial
$$
 \Phi_t(Y)=[y^k v_1\cdots v_s]\det\left(I+y\left(
 A^{t+\ell}+\prod_{j=1}^{\ell}Y_j A_j(v)-\prod_{j=1}^{\ell}Y_j A
 \right)\right).                                                        \tag{4}
$$
Here the last product means $(Y_1A)\cdots(Y_\ell A)$. Upon substituting $Y_j=A^{a_j}$ for any composition of $t$, the constant background agrees with this last product. Hence (4) equals (3) after substitution. This replacement of the unmarked background is essential to the degree bound.

The difference between the two products in (4) has no constant term in the $v$ variables. Every entry of that difference has degree at most one in each *matrix group* $Y_j$. A determinant term contributing to $v_1\cdots v_s$ therefore uses at most $s$ entries from the difference. Consequently $\Phi_t$ has total degree at most $s$ in each $Y_j$. Expand in monomials
$$
 \Phi_t(Y)=\sum_{m_1,\ldots,m_\ell} c_{m_1,\ldots,m_\ell}(t)
                                  \prod_{j=1}^{\ell}m_j(Y_j).
$$
Each $m_j$ is a monomial of degree at most $s$ in $n^2$ variables. All coefficients for a fixed $t$ can be computed in $(n+1)^{O(b^2)}$ ring operations, with constants depending on $b$. For example, use division-free Berkowitz arithmetic in the quotient that sets $v_i^2=0$, $y^{k+1}=0$ and every monomial of degree greater than $s$ in any group $Y_j$ equal to zero. These are monomial ideals. Discarding their terms at intermediate gates preserves every required coefficient. The number of retained monomials is bounded by $(k+1)2^s\binom{n^2+s}{s}^{\ell}$. [Berkowitz’s division-free algorithm](https://doi.org/10.1016/0020-0190(84)90018-8)

For each monomial $m$, precompute the finite series $f_m(z)=\sum_{a=0}^{N}m(A^a)z^a$. For each allowed tuple precompute $f_{m_1}\cdots f_{m_\ell}\bmod z^{N+1}$ by fast univariate multiplication. The sum of (3) over all compositions of $t$ now equals
$$
 \sum_{m_1,\ldots,m_\ell} c_{m_1,\ldots,m_\ell}(t)
                 [z^t]\,f_{m_1}(z)\cdots f_{m_\ell}(z).                 \tag{5}
$$
Importantly the series in (5) are independent of $t$ before coefficient extraction. Generate $A^a$ successively, including $A^0=I$. Run (4) and (5) once per $t$ and per choice of labels. Choices of crossing pairs cost an additional factor at most $n^{4p}$ times a function of $b$, already within the bound. No matrix of order $N$ is built.

## Precision and output

If $g_j=[w^j]wQ'/Q$ and $q_j=[w^j]Q$, then
$$
 q_0=1,\qquad j q_j=\sum_{i=1}^{j}g_i q_{j-i}.
$$
The exact $q_j$ have integer coefficients since $Q$ is a determinant over integer power series. Compute (2) through $p=b-1$ modulo $2^{b+v_2((b-1)!)}$. At step $j$, exact division by its power of two and inversion of its odd part cost at most $v_2(j)$ bits. The total loss through the last step is at most $v_2((b-1)!)$. Thus all $q_j$ are known to $b$ bits. Evaluate $H_0\sum_{j=0}^{b-1}(-2)^j q_j\bmod(2^b,z^{N+1})$ and reverse coefficients if the monic convention is wanted. For $b=1$ the baseline alone suffices. Empty degrees and singular inputs are covered by the same conventions.

The trace-separation argument in (4)–(5) uses the total *number of marked edges*, independent of compound degree. Pointwise permanent algorithms modulo powers of two and Newton-sum recovery are prior inputs or comparators. Searches for modular permanental compounds, exterior corrections, compound traces and simultaneous characteristic coefficients found no previous all-degree bound of the displayed form in the sources inspected. This remains a modular result under [Minc Problem 17](https://yair-lavi.com/mincs-list/problem-17/index.html).

