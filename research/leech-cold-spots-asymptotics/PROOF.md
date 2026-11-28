# Limiting Gaussian cold spots of the Leech lattice

**Theorem.** Normalize the Leech lattice so its minimum squared norm is 4. As $`\alpha`$ tends to infinity, the distance from every global Gaussian cold spot to the set of $`E_8^3`$ deep holes on the lattice torus tends to zero. Near each such hole $`c`$ there is exactly one global minimizing point for every sufficiently large $`\alpha`$. Its displacement is $`y_c/\alpha+O(\alpha^{-2})`$ with $`y_c\ne 0`$. The normalized minimum tends to approximately 24.3223954, and the next smallest neighborhood coefficient belongs to $`D_{24}`$.

The convergence assertion to $`A_{24}`$ occurs after Table 3 in §5 of Bachoc, Moustrou, Vallentin and Zimmermann, [*Polarization of lattices: stable cold spots and spherical designs*](https://doi.org/10.1017/fms.2026.10169), Forum Math. Sigma **14** (2026), e25, p. 26 ([preprint v2](https://arxiv.org/pdf/2502.08819v2), p. 27). The paper's lexicographic comparison is valid for evaluation **at fixed points**. For a minimum among the moving points close to a deep hole, moving by $`1/\alpha`$ changes the leading coefficient, so nearest-shell cardinalities alone are insufficient.

## A general localization and leading-coefficient theorem

Let $`L\subset\mathbb R^d`$ be any full-rank lattice of covering radius $`\rho`$, and define $`P_\alpha(z)=\sum_{x\in L} e^{-\alpha\|x-z\|^2}`$. For each deep hole $`c`$, write

```math
 X_c=\{x-c:x\in L,\ \|x-c\|=\rho\},\qquad
 F_c(y)=\sum_{v\in X_c} e^{2\langle v,y\rangle},\qquad
 M_c=\min_{y\in\mathbb R^d}F_c(y).
```

The minimum defining $`M_c`$ has a unique minimizer $`y_c`$. Near each deep hole a neighborhood-minimizing point is, for all sufficiently large $`\alpha`$, uniquely of the form

```math
 z_{\alpha,c}=c+y_c/\alpha+O_L(\alpha^{-2}).
```

Every global minimizer is one of these points for sufficiently large $`\alpha`$, and its base hole $`c`$ must minimize $`M_c`$ over all deep holes. Moreover,

```math
 \min_z P_\alpha(z)=e^{-\alpha\rho^2}\bigl(\min_c M_c+O_L(\alpha^{-1})\bigr).
```


**Proof.** There are finitely many deep-hole representatives modulo $`L`$: deep holes are maximizing vertices of the bounded lattice Voronoi polytope. For each $`c`$, the origin is interior to $`\mathop{\mathrm{conv}}X_c`$. Otherwise a supporting or separating direction $`u`$ has $`\langle v,u\rangle\le0`$ for every $`v\in X_c`$, and a small step $`c+t u`$ increases all nearest distances and keeps all other distances above $`\rho`$, contradicting the definition of the covering radius. Choose $`\eta>0`$ small enough to work at all representatives so that every unit $`u`$ satisfies $`\max_{v\in X_c}\langle v,u\rangle\ge\eta`$. It follows that $`F_c(y)\ge e^{2\eta\|y\|}`$; its Hessian is positive definite since $`X_c`$ spans. This proves existence and uniqueness of $`y_c`$.

For $`\alpha\ge1`$ and a common finite constant $`B`$, $`P_\alpha(c)\le B e^{-\alpha\rho^2}`$ at every deep hole, by factoring out $`e^{-\alpha\rho^2}`$ and comparing the remaining series to its value at $`\alpha=1`$. The complement of small disjoint neighborhoods of the deep holes on $`\mathbb R^d/L`$ has covering distance at most $`\rho-\delta`$ for some $`\delta>0`$; a single summand there exceeds $`B e^{-\alpha\rho^2}`$ for all sufficiently large $`\alpha`$. Use neighborhoods of radius at most $`\eta`$. For a point $`c+h`$ in such a neighborhood, one nearest lattice point in a supporting direction gives

```math
 P_\alpha(c+h)\ge e^{-\alpha\rho^2} e^{2\alpha\eta\|h\|-\alpha\|h\|^2}
                 \ge e^{-\alpha\rho^2}e^{\alpha\eta\|h\|}.
```

Any minimizer over the closed neighborhood (and any global minimizer it contains) consequently has $`\alpha\|h\|\le(\log B)/\eta`$. In particular it is interior for large $`\alpha`$.

Put $`y=\alpha h`$. For bounded $`y`$, directly from the Gaussian series,

```math
 e^{\alpha\rho^2} P_\alpha(c+y/\alpha)
 = e^{-\|y\|^2/\alpha}
   \left(F_c(y)+O_L(e^{-\alpha\Delta/2})\right),
```

where $`\Delta>0`$ is the least positive gap from the nearest squared norm to the next squared norm at any chosen representative. The error holds in $`C^2`$ on any chosen bounded $`y`$-set: each tail term is $`e^{-\alpha(\|v\|^2-\rho^2)+2\langle v,y\rangle}`$, and after keeping the factor $`e^{-\alpha\Delta/2}`$ the first two differentiated tails are dominated by a convergent Gaussian sum for $`\alpha\ge2`$. The normalized objective therefore differs from $`F_c`$ by $`O_L(1/\alpha)`$ in $`C^2`$ on a fixed ball containing its possible minimizers and $`y_c`$. On this ball the Hessian of $`F_c`$ is uniformly positive definite. This gives a unique neighborhood-minimizing point for all large $`\alpha`$; its first-order condition implies $`y=y_c+O_L(1/\alpha)`$ by strong convexity. The value is $`M_c+O_L(1/\alpha)`$ after normalization. Finitely many hole representatives give all statements.

## Leech nearest shells from the affine diagrams

Use Conway, Parker and Sloane, [*The covering radius of the Leech lattice*](https://doi.org/10.1098/rspa.1982.0042), Proc. Roy. Soc. Lond. A **380** (1982), 261–290 ([author's PDF](https://neilsloane.com/doc/Me87.pdf)); see also the explicit formulation in Shimada, [*Holes of the Leech lattice and the projective models of K3 surfaces*](https://doi.org/10.1017/S030500411600075X), [author PDF, §2 and Theorems 2.3, 2.5](https://arxiv.org/pdf/1502.02099v3#page=7). The covering radius is $`\sqrt2`$. For a deep hole each nearest-point diagram decomposes into affine ADE components whose ranks sum to $`24`$, including a deep-hole type consisting of three affine $`E_8`$ components. The latter type is one affine-isometry class.

For completeness, for vectors $`u_i,u_j\in X_c`$ the diagram puts zero, one or two edges between them for squared separation $`4,6,8`$, respectively. Since each squared length is $`2`$, the off-diagonal Gram entries are respectively $`0,-1,-2`$. Thus distinct components span orthogonal subspaces, and each component is an affine simplex of rank one less than its number of vertices. Its only linear dependence up to scalar is given by its positive affine Dynkin labels $`a_i`$, equivalently the kernel vector of the Gram matrix with diagonal $`2`$ and negative edge multiplicities off diagonal.

For one component let $`p_i=a_i/\sum_i a_i`$. The weighted AM–GM inequality and $`\sum_i p_i u_i=0`$ give

```math
 \sum_i e^{2\langle u_i,y\rangle}
 = \sum_i p_i \frac{e^{2\langle u_i,y\rangle}}{p_i}
 \ \ge\ \prod_i p_i^{-p_i}.
```

This is attainable. The linear map $`y\mapsto(2\langle u_i,y\rangle)_i`$ on the component span has image exactly $`p^\perp`$, and the vector with entries $`\log p_i-\sum_j p_j\log p_j`$ lies in $`p^\perp`$. It realizes equality. The component minimum is therefore $`\exp(-\sum_i p_i\log p_i)`$, and $`M_c`$ is the sum of these values over its orthogonal components.

## Exact comparison across all deep-hole types

The affine $`A_r`$ labels are all $`1`$, so its component minimum is $`m_{A_r}=r+1`$. For affine $`D_r`$ they are four labels $`1`$ and $`r-3`$ labels $`2`$, so $`m_{D_r}=(r-1)2^{2/(r-1)}`$. For the exceptional types the labels are

```math
\begin{array}{c|l|l}
&\text{labels as a multiset}&\text{component minimum}\\ \hline
E_6&1,1,1,2,2,2,3&12 /(2^{1/2}3^{1/4})
\\ E_7&1,1,2,2,2,3,3,4&18 /3456^{1/9}
\\ E_8&1,2,2,3,3,4,4,5,6&30 /(2^{26}3^{12}5^5)^{1/30}.
\end{array}
```

The lists can be checked by verifying twice each label equals the weighted sum of adjacent labels: for the three-arm affine $`E_6,E_7,E_8`$ trees the arm lengths are respectively $`(2,2,2),(1,3,3),(1,2,5)`$, and the labels descend linearly along an arm if continued by $`0`$ past its endpoint.

Call the component minimum minus its rank its excess. The $`E_8`$ excess is strictly between $`0.10`$ and $`0.11`$; all other excesses are strictly larger than $`0.27`$. For $`D_r`$ the excess is greater than $`2\log2-1>0.38`$, by $`e^x>1+x`$ and $`\log 2>2(1/3+1/81)>0.69`$. For the exceptional rational bounds, the exact integer comparisons are, with $`D=2^{26}3^{12}5^5`$,

```math
 D\,810^{30}<3000^{30}\lt D\,811^{30},\qquad
 3456\,727^9<1800^9,\qquad 627^4<1728\cdot100^4.
```

Thus $`E_8^3`$ has total excess $`<0.33`$. Four or more components have excess $`>0.40`$. Any two or three components other than $`E_8^3`$ include at least one non-$`E_8`$ component by rank $`24`$, so have excess $`>0.37`$. A single rank-$`24`$ component is $`A_{24}`$ or $`D_{24}`$, with excess $`>0.38`$. Thus the unique minimizing type is $`E_8^3`$, and

```math
 \lim_{\alpha\to\infty} e^{2\alpha}\min_z P_\alpha(z)
 = 90/(2^{26}3^{12}5^5)^{1/30}\approx24.3223954.
```

In contrast, $`M_{A_{24}}=25`$. In each $`E_8`$ component the labels are not constant, so the sum of its vertex vectors is not zero (the only dependence is proportional to the label vector). The three components are orthogonal, so $`X_c`$ at an $`E_8^3`$ hole is unbalanced. Thus $`\nabla F_c(0)\ne0`$, and $`y_c\ne0`$. The local expansion gives a nonzero displacement from $`c`$ for every sufficiently large $`\alpha`$. The affine lattice isometries act transitively on holes of this type and preserve $`P_\alpha`$. They carry any global minimizer to the unique neighborhood minimizer at each other representative. Each representative is therefore the limit of a choice of global minimizers. An arbitrary choice can alternate between distinct neighborhoods. This also supplies a separate proof that the Leech lattice has no stable cold spot.

## The second-smallest coefficient

The coefficient for $`D_{24}`$ is $`23\cdot 4^{1/23}`$. It lies strictly between 24.42892 and 24.42893 by the integer bounds

```math
2442892^{23} < 4(23\cdot 10^5)^{23} < 2442893^{23}.
```

To see why this puts $`D_{24}`$ second, subtract 24 and compare excesses. The only other single-component type is $`A_{24}`$, with excess 1. Among the types with several components, only $`E_8^3`$ and $`D_{16}E_8`$ contain $`E_8`$. The latter has excess greater than $`0.38+0.10=0.48`$. Every remaining type has at least two components of excess greater than 0.27, for a total greater than 0.54. These bounds all exceed the $`D_{24}`$ excess. The list of types is given in [Bachoc et al., Table 3](https://arxiv.org/html/2502.08819v2#S5.T3).

From this directory, run `python3 verify.py` to reproduce the comparison. The [verifier](verify.py) bounds each component by integer bisection, sums the bounds for all 23 types, and checks that the $`E_8^3`$ and $`D_{24}`$ intervals are separated from one another and from the other 21. It also checks the seven-decimal rounding for $`E_8^3`$ and the displayed bounds for $`D_{24}`$.

## Scope and attribution

The deep-hole classification and diagrams are classical. The exact-point comparisons of Bachoc et al. remain valid as comparisons of values at fixed points. The distinction here is optimizing inside neighborhoods on the scale $`1/\alpha`$; this changes the leading coefficient and the limiting type. No correction notice or earlier calculation of this optimized limiting type was found in searches by title, authors, and the $`E_8^3`$ type. The conclusion is a correction to the published asymptotic location, not a claim that its no-stability conclusion is false.
