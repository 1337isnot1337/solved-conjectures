# Chollet’s conjecture

Let $C$ be any complex correlation matrix of order $n$. Put $w_{ii}=0$, $w_{ij}=|c_{ij}|^2$ for $i\ne j$, $W=(w_{ij})$, $t_i=\sum_j w_{ij}$, $S=\sum_i t_i$ and $V=\sum_{ij}w_{ij}^2$.

**Theorem.** For each finite $T>0$ there is $\eta_T>0$ such that every $C\ne I$ with $\max_i t_i\le T$ and $V\le\eta_T S$ satisfies
```math
\operatorname{per}(C\circ\overline C)<(\operatorname{per}C)^2.
```
The constant is independent of order and rank. The row sums may differ and approach zero. The condition includes every sequence with a common bound on the row sums and maximum off-diagonal modulus tending to zero, eventually on the nonidentity terms. Cauchy–Schwarz on permutation monomials gives the mixed Chollet inequality for two matrices in the class. Positive diagonal scaling recovers arbitrary positive diagonals. A PSD matrix with a zero diagonal entry has a zero row.

A diagonal variational problem also determines $\log\operatorname{per}(I+W)$ up to $o(S)$ along any such bounded-row sequence with $S>0$, $V/S\to0$. This conclusion holds for every symmetric nonnegative $W$ with zero diagonal and $I+W\succeq0$. Only the comparison with $\operatorname{per}C$ uses the original Gram vectors.

## A diagonal majorant

Set $\phi(d)=\sup_{x\ge0}(\log(1+dx)-x)$. It vanishes on $[0,1]$ and equals $\log d-1+1/d$ above one. Define
```math
M(W)=\min\big\{\sum_i\phi(d_i): d_i\ge1,\ D=\operatorname{diag}(d_i)\succeq W\big\}.
```
The feasible set is closed and nonempty and the objective has bounded sublevel sets. It separates across connected components of the support of $W$. On a component with spectral radius at most one take all $d_i=1$. On every other component a minimizer satisfies
```math
d_i=1+u_i^2,\qquad a_i=u_i/d_i,\qquad Wa=u,\qquad 0<u_i\le T/2.       \tag{1}
```
Use $x_i=\log d_i$. The spectral constraint is $\log\rho(D^{-1/2}WD^{-1/2})\le0$. Its partial derivatives are $-h_i^2$ for the positive unit Perron eigenvector $h$, by differentiating the simple largest eigenvalue. Strict feasibility cannot hold at an optimum on this component, since some $x_i>0$ and can then be decreased. If any $x_i=0$, increase it and decrease a positive $x_j$ along the level set of the constraint. The implicit function theorem gives slope $-h_i^2/h_j^2$ for $x_j$. The objective has zero derivative in the first coordinate and positive derivative in the second, a contradiction. Lagrange multipliers now give $1-1/d_i=\lambda h_i^2$ with $\lambda>0$. Substitute $h_i=\lambda^{-1/2}u_i/\sqrt{d_i}$ in the eigenvector equation to obtain (1). Since $0\le a_j\le1/2$, the row sums bound $u_i$. Setting $u_i=a_i=0$ on subcritical and critical components preserves (1) with a non-strict lower endpoint.

Conversely, a positive solution to (1) on a connected component identifies its optimizer. Set $h_i$ proportional to $u_i/\sqrt{d_i}$ with unit norm and $R=D^{-1/2}WD^{-1/2}$. Then $Rh=h$, so $D$ is feasible by Perron–Frobenius. For any other feasible $x'_i=\log d'_i$, let $\Delta_i=x'_i-x_i$. The numbers $h_iR_{ij}h_j$ are probability weights with both marginals $h_i^2$. Evaluating the other normalized matrix on $h$ and applying Jensen gives
```math
1\ge\sum_{ij}h_iR_{ij}h_j\exp[-(\Delta_i+\Delta_j)/2]\ge\exp[-\sum_i h_i^2\Delta_i].
```
The convex function $x\mapsto\phi(\exp x)$ on $[0,\infty)$ consequently has nonnegative total directional derivative from $x$ toward $x'$, because its gradient is proportional to $(h_i^2)_i$. This proves optimality. The checker constructs 27 pairs of unequal populations with prescribed $u$, verifies $Wa=u$ and the doubly stochastic witness below exactly, and compares $M(W)$ against an independently computed permanent.

## A lower bound for the nonnegative permanent

We claim $M(W)\le\log\operatorname{per}(I+W)$. Write $Y=I+W$ and use the doubly stochastic matrix $X$ with entries $X_{ii}=1/d_i$, $X_{ij}=a_iw_{ij}a_j$ for $i\ne j$. Its off-diagonal row sum is $a_i u_i=1-1/d_i$ by (1), and it is symmetric. The Bethe lower bound is
```math
\log\operatorname{per}Y\ge\sum_{ij}\{X_{ij}\log(Y_{ij}/X_{ij})+(1-X_{ij})\log(1-X_{ij})\}.
```
Use continuous endpoint conventions for terms of zero mass. On a positive-$u$ component the off-diagonal log ratios sum to $-2\sum_i(1-1/d_i)\log a_i$. Adding both diagonal terms gives exactly $\sum_i\log d_i$, since $a_i^2=(1-1/d_i)/d_i$. The remaining off-diagonal terms are bounded below by $-\sum_{i\ne j}X_{ij}$. The all-zero-$u$ components contribute zero. This proves the claim. [Gurvits, Theorem 2.2](https://arxiv.org/abs/1106.2844)

## A lower bound for the Gram permanent

For the same $T$ there exists $\delta_T>0$ such that
```math
2\log\operatorname{per}C\ge(1+\delta_T)M(W).                            \tag{2}
```
Let $v_i$ be unit Gram vectors and $g$ a standard circular complex Gaussian on their span. For any $\theta_i\in[0,1]$,
```math
\operatorname{per}C\ge\mathbb E\prod_i(1-\theta_i+\theta_i|v_i^*g|^2).
```
Expansion gives a convex combination of permanents of principal submatrices by the Gaussian moment identity. Successively adding unit Gram vectors can only increase these permanents by the multiplication–differentiation identity in the [correlation energy proof](correlation_energy.md).

Change the Gaussian covariance to $I+B$, where $B=2\sum_i a_i v_i v_i^*$. Logarithmic Jensen bounds the original log expectation below by the changed expectation of the log product minus the relative entropy $2\sum_i a_i-\log\det(I+B)$. The new variance of form $i$ is $1+s_i$, where $s_i=v_i^* Bv_i=2(a_i+u_i)$. The convex function $f(x)=\log(1+x)/x$, extended by $f(0)=1$, gives
```math
\log\det(I+B)=\sum_i 2a_i v_i^* f(B)v_i\ge\sum_i\frac{\log(1+s_i)}{1+d_i}.
```
Here $s_i=2a_i(1+d_i)$, also when $a_i=0$. With $X$ exponential of mean one, set
```math
h(s)=\max_{0\le\theta\le1}\mathbb E\log(1-\theta+\theta(1+s)X),\qquad
D(u)=h(s)-2a+\frac{\log(1+s)}{1+d},\quad d=1+u^2,\quad a=u/d,\quad s=2(u+a).
```
Optimizing the damping separately yields $\log\operatorname{per}C\ge\sum_i D(u_i)$. For $u=0$, Jensen and the choice $\theta=0$ give $D(0)=0$. We next show $2D(u)>\phi(1+u^2)$ for all $u>0$, uniformly in ratio on $0<u\le T/2$. This proves (2).

For $0<u\le1/100$, take $\theta=s/(1+s)$, $y=s(1+s)$, $z=1/y$. Integration by parts gives the expected log as $-\log(1+s)+\mathbb E[(z+X)^{-1}]$. Using Jensen, $y/(1+y)\ge y-y^2$ and $\log(1+s)\le s-s^2/2+s^3/3$ bounds it below by $s^2[1/2-(7/3+s)s]\ge0.4s^2$ for $s\le0.04$. The cost $2a-\log(1+s)/(1+d)\le s^2/4$. Thus $2D(u)\ge0.30s^2\ge1.2u^2$, whereas $\phi(1+u^2)\le u^4/2$ by integrating $x/(1+x)^2$ from zero to $u^2$.

For $1/100\le u\le31/100$ retain the same damping and improve Jensen to
```math
\mathbb E[(z+X)^{-1}]\ge R(z)=\frac{z^2+8z+11}{z^3+9z^2+18z+6}.
```
Indeed $\mathbb E[2p(X)-(z+X)p(X)^2]$ is a lower bound for every real quadratic $p$, by completing the square. The orthonormal basis $1,1-X,1-2X+X^2/2$ has multiplication-by-$X$ compression with diagonal $1,3,5$ and adjacent entries $-1,-2$, using $\mathbb E X^j=j!$. Optimization gives the top left entry of the inverse of this matrix plus $zI$, namely $R(z)$. This also shows $R$ decreases. Thus here a lower bound for $2D(u)-\phi(d)$ is
```math
2\left[R(z)-2a-\frac{d}{1+d}\log(1+s)\right]-\phi(d).             \tag{3}
```
For $u\ge31/100$ take $\theta=1$. A second lower bound is
```math
2\left[\left(1+\frac1{1+d}\right)\log(1+s)-2a-0.578\right]-\phi(d),   \tag{4}
```
since Euler's constant is less than $0.578$. For $u\ge5$ this is at least $\log4+1-2(0.578)-4/u-2/u^2>0$. Use $s\ge2u$, $a\le1/u$, $\log(1+u^2)\le2\log u+1/u^2$ and $1/d\le1/u^2$.

The [outward interval checker](verify_irregular_correlations.py) certifies positivity of (3) on 168 closed intervals covering $[1/100,31/100]$ and of (4) on 24 covering $[31/100,5]$. It uses the increasing functions $s,d,\phi(d)$ and the single maximum of $a$ at $u=1$. Indeed $a'(u)\ge-1/8$. All algebra is rational except logarithms, for which it imports the outward bounds from the [equiangular certificate](verify_flat_correlations.py). It checks $H_{1024}-10\log2<0.578$ to bound Euler's constant. Positivity of the continuous lower bounds on compact intervals, with the previous estimates at small $u$, gives the asserted uniform ratio for every finite $T$.

## An upper bound for the nonnegative permanent

Fix $0<\epsilon,w,e<1$. Remove vertices of full row sum $t_i<\epsilon$, leaving the set $H$, of size at most $S/\epsilon$. Each removal has log cost at most $t_i^2$. Indeed, for a Gram representation of $Y=I+W$, adjoining the unit form at $i$ to the product $p$ of remaining forms gives the permanent ratio $1+\|\sum_j w_{ij}p_{-j}\|^2/\|p\|^2$ by the same differentiation identity. Each omitted product satisfies $\|p_{-j}\|\le\|p\|$. The total log cost is at most $\epsilon S$.

Apply (1) to $W_H$, obtaining $1\le d_i\le K=1+T^2/4$. Let $P$ be the spectral projection of $R=D^{-1/2}W_H D^{-1/2}$ for eigenvalues greater than $w$. As $R\preceq I$ and $\|R\|_F^2\le V$, we have $R\preceq wI+P$ and $\operatorname{rank}P\le V/w^2$. Hence
```math
0\preceq I+W_H\preceq I+wD+D^{1/2}PD^{1/2}.
```
The permanent is monotone under PSD order, by the tensor power formula and evaluation on the symmetrized coordinate tensor. Integrating independent Gaussian coordinates with diagonal covariance $I+wD$ bounds the original permanent by $\mathbb E\prod_i(1+wd_i+d_i|(Pg)_i|^2)$. For $x\ge0$ the logarithm of the $i$th factor at $x=|(Pg)_i|^2$ is at most
```math
wK+(1-e)x+\phi(d_i/(1-e))\le wK+(1-e)x+\phi(d_i)-\log(1-e),
```
using $0\le d\phi'(d)\le1$. Integrate the exponential using $\mathbb E\exp((1-e)\|Pg\|^2)=e^{-\operatorname{rank}P}$, where $e$ here is the parameter. We obtain
```math
\log\operatorname{per}(I+W)\le M(W_H)+\left[\epsilon+\frac{wK-\log(1-e)}{\epsilon}\right]S+\frac{V}{w^2}\log(1/e).                    \tag{5}
```
Restriction of any feasible majorant to $H$ shows $M(W_H)\le M(W)$. Together with the Bethe lower bound, (5) proves the claimed asymptotic formula by successively choosing $\epsilon$, then $w,e$, then $V/S$ sufficiently small.

Finally put $B_C=2\log\operatorname{per}C$. The [correlation energy theorem](correlation_energy.md) gives $B_C\ge c_T S$ with $c_T=1/[3\max(27/4+T,2T)]$. By (2) and restriction, $M(W_H)\le B_C/(1+\delta_T)$. Thus $B_C-M(W_H)\ge c_T\delta_T S/(1+\delta_T)$. Choose $\epsilon$, then $w,e$, then $\eta_T>0$ so that the sum of the error coefficients in (5), with $V/S\le\eta_T$, is strictly less than $c_T\delta_T/(1+\delta_T)$. This proves the strict inequality when $S>0$.

The [catalogue entry](https://yair-lavi.com/mincs-list/conjecture-30/index.html) also asks for matrices with arbitrarily concentrated overlaps. The bounds here leave that case open. [Earlier source checks and Gram bounds](equiangular_chollet.md)
