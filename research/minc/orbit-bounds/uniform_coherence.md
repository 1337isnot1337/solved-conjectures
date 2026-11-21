# Chollet’s conjecture

**Theorem.** Let $C\ne I$ be a complex correlation matrix of any finite order. If $|c_{ij}|\le10^{-32}$ whenever $i\ne j$, then
$$\operatorname{per}(C\circ\overline C)<(\operatorname{per}C)^2.$$
In particular Chollet's mixed inequality holds for any two such correlation matrices, including identities, by Cauchy–Schwarz on the permutation monomials. Diagonal normalization gives the corresponding PSD statement. The radius is independent of order, rank, sparsity, phases and row energies. The radius given here is a conservative explicit choice.

Write $W_{ij}=|c_{ij}|^2$ off the diagonal and $W_{ii}=0$. Put $\beta=\max W_{ij}$. We use the diagonal majorant from the [bounded-row proof](irregular_correlations.md). In finite dimension it gives $D=\operatorname{diag}(d_i)\succeq W$, $d_i=1+u_i^2$, $a_i=u_i/d_i$, $Wa=u$, $u_i\ge0$. On every component with spectral radius at most one take $u=0$. Write $\phi(d)=\log d-1+1/d$ for $d\ge1$. Let $A=\{i:u_i>1/100\}$, let $B$ be its complement, and define
$$P=\sum_{i\in A}\phi(d_i)+\sum_{i\in B}\log d_i,\qquad J=|A|+\sum_{i\in B}u_i^2.$$
Choose a symmetric $0\le E\le W_{BB}$ entrywise, of row sums at most one, maximizing $L=\sum_{ij}E_{ij}$. Existence follows by compactness. Two unsaturated endpoints have $E_{ij}=W_{ij}$, since otherwise both symmetric entries could increase. If $C\ne I$ then $J+L>0$. All logarithms are natural.

## The Gram lower bound

We claim
$$2\log\operatorname{per} C\ \ge\ P+10^{-9}(J+L). \tag{1}$$
The earlier variational calculation gives $2\log\operatorname{per}C\ge2\sum_i D(u_i)$, in the notation of the bounded-row proof. Its small-$u$ estimate gives $2D(u)\ge1.2u^2$ for $0\le u\le1/100$. For $u\ge1/100$ its interval inequalities and large-$u$ bound give $2D(u)-\phi(1+u^2)\ge10^{-5}$. The [checker](verify_uniform_coherence.py) verifies this stronger threshold. Thus the left side of (1) exceeds or equals $P+10^{-5}J$.

Independently reserve a uniformly random half of the weak vertices in the following sense. Include each $i\in B$ independently with probability $1/2$ in a set $U$, and let $K=U^c$. Lieb's block permanent inequality gives $\operatorname{per}C\ge\operatorname{per}C_{KK}\operatorname{per}C_{UU}$. The [correlation energy argument](correlation_energy.md) gives
$$\log\operatorname{per}C_{UU}\ge\sum_{i,j\in U}E_{ij}/[6(27/4+1)].$$
To see this extension, in its deletion inequality (3) decrease the nonnegative summands $w_{ij}$ to $E_{ij}$. All subsequent row and column sums in the averaging proof then use $E$ and are bounded by one. Taking expectation gives $2\mathbb E\log\operatorname{per}C_{UU}\ge L/93$. [Lieb's permanent inequality](https://doi.org/10.1512/iumj.1967.16.16008)

Write $v_i$ for unit Gram vectors. On $K$ tilt the standard complex Gaussian to covariance $I+F$, where $F=\sum_{i\in K}2a_i v_iv_i^*$. As in the earlier calculation one may keep the Gaussian factors at $i\in A$ and set the damping to zero on the remaining indices, by principal permanent monotonicity for unit Gram vectors. The resulting log lower bound is
$$\log\operatorname{per}C_{KK}\ge\sum_{i\in A}(\log(1+s'_i)-\gamma)-\operatorname{tr}F+\log\det(I+F),\qquad s'_i=v_i^*Fv_i.$$
Here $\gamma<0.578$ is Euler's constant. For $s_i=2(a_i+u_i)$ we have $s'_i\le s_i$. Scalar spectral Jensen for the convex function $f(x)=\log(1+x)/x=\int_0^1(1+tx)^{-1}\,dt$, extended at zero, yields
$$\operatorname{tr}F-\log\det(I+F)\le\sum_{i\in K}2a_i(1-f(s'_i))\le |A|+4\sum_{i\in B}u_i^2.$$
Indeed $1-f(x)\le x/2$, $a_i\le u_i$, $s_i\le4u_i$, and $2a_i\le1$.

For $i\in A$, the variable $s'_i$ is a deterministic nonnegative sum plus independent Bernoulli terms with coefficients at most one. Its mean is at least $s_i/2$ and its variance at most $s_i$. Chebyshev gives $\Pr(s'_i<s_i/4)\le16/s_i$. Thus
$$\mathbb E\log(1+s'_i)\ge\log(1+s_i)-\log4-16,$$
using $\log(1+s_i/4)\le s_i$. Since $2\log(1+s_i)\ge\log d_i$, the two blocks give the second lower bound $2\log\operatorname{per}C-P\ge L/93-50J$. Taking weight $10^{-7}$ on this inequality and the remaining weight on the first proves (1).

## Elimination of weak vertices

Fix $0<\delta<1$. Put in $H$ all of $A$ and those indices of $B$ with $E$-row sum at least $\delta$. Let $T=H^c$. Then $|H|\le J+L/\delta$, and $W_{TT}=E_{TT}$ has row sums at most $\delta$. Scale every edge endpoint in $T$ by $d_i^{-1/2}$. Write $N=D_T^{-1/2}W_{TT}D_T^{-1/2}$ and $X=W_{HT}D_T^{-1/2}$. All the matrices of edge weights in the following expansion are nonnegative. We have
$$\operatorname{per}(I+W)\le\frac{\prod_{i\in T}d_i}{\det(I-N)}\operatorname{per}(I+Z),\qquad Z=W_{HH}+X(I-N)^{-1}X^*. \tag{2}$$
In a family of disjoint directed cycles a used vertex of $T$ contributes one factor $d_i^{-1}$ after scaling, and multiplying by all $d_i$ compensates it. Now allow arbitrary walks through $T$ between successive visits to $H$. The series $X\sum_{m\ge0}N^mX^*$ sums their weights, including walks from a vertex of $H$ back to itself. The latter use the diagonal of $Z$ in addition to the unused-vertex weight one. Closed cycles lying entirely in $T$ are covered by $\exp(\sum_{m\ge1}\operatorname{tr}N^m/m)=1/\det(I-N)$. Each family of vertex-disjoint simple cycles receives its full weight in this enlargement. Convergence holds since $\|N\|\le\delta$. As $\operatorname{tr}N=0$ and $\|N\|_F^2\le\beta L$, this determinant costs at most $\beta L/[2(1-\delta)]$ in the logarithm.

Set $R=D_H^{-1/2}ZD_H^{-1/2}$ and $R_0=D_H^{-1/2}W_{HH}D_H^{-1/2}$. The Schur complement in $D-W\succeq0$ gives $R\preceq I$. Also $Z-W_{HH}\succeq0$, so $I+Z\succeq0$ since $I+W_{HH}$ is a Gram matrix. Let $R_+$ denote the positive spectral part. For $0<e<1$,
$$\log\operatorname{per}(I+Z)\le\sum_{i\in H}\phi(d_i)+|H|\log(1/(1-e))+\log(1/e)\operatorname{tr}R_+. \tag{3}$$
Indeed $I+Z\preceq I+D_H^{1/2}R_+D_H^{1/2}$. PSD order implies permanent order by the symmetric tensor formula. Integrate the independent diagonal Gaussian coordinates for the identity. The other Gaussian coordinates $y$ have covariance $R_+$, giving the product of $1+d_i|y_i|^2$. Bound the log of each by $(1-e)|y_i|^2+\phi(d_i/(1-e))$ by scalar maximization. The difference of the two $\phi$ values is at most $\log(1/(1-e))$. The remaining log integral is $-\log\det(I-(1-e)R_+)$, at most $\log(1/e)\operatorname{tr}R_+$ by the chord bound on $[0,1]$.

We now bound this trace using the Gram representation twice. Since $R_0\preceq I$,
$$\|R_0\|_F^2\le\beta\sum_{ij\in H}W_{ij}/(d_i d_j)\le\beta |H|,$$
where the last estimate tests $R_0$ on $(d_i^{-1/2})_{i\in H}$. Trace subadditivity for the positive part and Cauchy–Schwarz give
$$\operatorname{tr}R_+\le\sqrt\beta\,|H|+(1-\delta)^{-1}\sum_{h\in H,\ l\in T}W_{hl}^2. \tag{4}$$
For each $h$ write $p_l=W_{hl}$ on $T$ and $z=\sum_l p_l^2$. The Schur complement at $h$ gives $C_{TT}\succeq bb^*$, $b=(c_{lh})_{l\in T}$. Conjugate this inequality by $\operatorname{diag}(\sqrt{p_l})$. The rank-one matrix on the right has largest eigenvalue $z$. The diagonal of the left side is at most $\beta$ and its off-diagonal part has squared Frobenius norm $p^\top W_{TT}p\le\delta z$. Thus $z\le\beta+\sqrt{\delta z}\le\beta+(\delta+z)/2$, or $z\le2\beta+\delta$.

There are at most $J+L$ vertices in $A$ or saturated in $E$. For each remaining $h\in H$, all edges to $T$ have $W_{hl}=E_{hl}$ by unsaturation at both ends. Their total squared weight summed over these $h$ is at most $\beta L$. In particular
$$\operatorname{tr}R_+\le\sqrt\beta\,(J+L/\delta)+[(2\beta+\delta)(J+L)+\beta L]/(1-\delta). \tag{5}$$
This is the step that permits arbitrarily large full row sums.

In (2) and (3), the total diagonal cost $\sum_{i\in T}\log d_i+\sum_{i\in H}\phi(d_i)$ is at most $P$. Take $\delta=10^{-16}$, $e=10^{-32}$ and $\beta\le10^{-64}$. Using $\log(1/e)<75$ and $\log(1/(1-e))\le2e$, the remaining terms from (2), (3) and (5) are less than $10^{-12}(J+L)$ when $J+L>0$. Equation (1) gives the strict comparison.

## Scope and sources

The [catalogue entry](https://yair-lavi.com/mincs-list/conjecture-30/index.html) asks for all PSD matrices. Sa-nguansin and Rodtes give annulus conditions. Pant and Singh study structural classes, and Ma gives low-rank estimates. The theorem above permits zeros, unbounded ratios of nonzero moduli, arbitrary rank and unbounded row sums. Our literature search found no previous order-independent disk theorem with these hypotheses. The unrestricted entry remains open. [Sa-nguansin and Rodtes](https://doi.org/10.1080/03081087.2025.2588584) · [Pant and Singh](https://arxiv.org/abs/2604.24192v2) · [Ma](https://arxiv.org/abs/2609.37461)
