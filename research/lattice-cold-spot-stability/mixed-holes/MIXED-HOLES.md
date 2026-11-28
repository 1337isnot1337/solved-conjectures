# Stable Gaussian cold spots among inequivalent deep holes

Let $`L\subset\mathbb R^n`$ be a full-rank lattice, $`n\ge 1`$, with covering radius $`\rho`$. A *deep hole* is a point attaining that radius as its distance to $`L`$. Work modulo $`L`$ and normalize the Gaussian potential by

```math
 U_t(z)=e^{t\rho^2}\sum_{x\in L}e^{-t\|x-z\|^2},\qquad t>0.
```

A *stable cold spot* is a fixed point that globally minimizes $`U_t`$ for every sufficiently large $`t`$. We characterize these points even when shells balance at some deep holes and fail to balance at others.

For a deep hole $`d`$ and squared-radius gap $`s\ge0`$, write

```math
 V_d(s)=\{x-d:x\in L,\ \|x-d\|^2=\rho^2+s\},\quad
 N_d(s)=|V_d(s)|,\quad b_d(s)=\sum_{v\in V_d(s)}v.
```

Empty shells have zero count and vector sum. Call $`d`$ *balanced* if every $`b_d(s)=0`$. Its nearest shell is $`V_d(0)`$. Define

```math
 F_d(y)=\sum_{v\in V_d(0)}e^{2\langle v,y\rangle},\quad
 M_d=\min_y F_d(y),\qquad
 H_d=4\sum_{v\in V_d(0)}vv^{\mathsf T}.
```

## The mixed-hole criterion

**Theorem.** A point $`c`$ is a stable cold spot if and only if it is a balanced deep hole and passes the following comparison with every other deep hole $`d`$ modulo $`L`$. Put $`J(s)=N_d(s)-N_c(s)`$.

1. If $`d`$ is balanced, the first nonzero $`J(s)`$, in increasing order of squared-radius gap, must be positive. Identically zero $`J`$ passes.
2. If $`b_d(0)\ne0`$, one must have $`N_c(0)<M_d`$.
3. Otherwise $`b_d(0)=0`$ and some later shell has nonzero vector sum. Let $`\Delta`$ be the smallest gap of such a shell, $`g=2b_d(\Delta)`$, and $`C_0=\tfrac12 g^{\mathsf T}H_d^{-1}g`$. If $`J`$ first differs from zero below $`2\Delta`$, its sign must be positive. If $`J`$ vanishes below $`2\Delta`$, one must have $`J(2\Delta)>C_0`$. In particular, exact equality fails.

If a stable cold spot exists, the set of all global minimizers is exactly the set of stable cold spots for every sufficiently large $`t`$. The third comparison uses only shells through gap $`2\Delta`$ once $`\Delta`$ is known.

## Localization

The following details recall the general localization argument from the repository's [Leech correction](https://github.com/1337isnot1337/solved-conjectures/blob/main/docs/research-results/leech-cold-spots-asymptotics/PROOF.md). The lattice Voronoi cell is a bounded polytope. The strictly convex squared norm reaches its maximum there only at vertices, giving finitely many deep holes modulo $`L`$. The origin lies in the interior of $`\mathop{\mathrm{conv}}V_d(0)`$ for each $`d`$. Indeed, otherwise a supporting or separating unit vector $`u`$ satisfies $`\langle v,u\rangle\le 0`$ for every nearest vector. The point $`d+\varepsilon u`$ would be farther than $`\rho`$ from every nearest site. All other sites also stay farther than $`\rho`$ for sufficiently small $`\varepsilon>0`$, by the positive gap to the second shell and the triangle inequality. This contradicts the definition of $`\rho`$.

Hence $`V_d(0)`$ spans $`\mathbb R^n`$ and encloses a ball about zero in its convex hull. In particular $`H_d`$ is positive definite. Take $`\eta>0`$ so that each such convex hull contains the ball of radius $`\eta`$, and choose disjoint closed torus neighborhoods of the deep holes, with a common radius at most $`\eta`$ small enough for Euclidean coordinates. On their compact exterior the distance to $`L`$ is at most $`\rho-\delta`$ for some $`\delta>0`$. There, a single Gaussian summand gives $`U_t\ge e^{t(\rho^2-(\rho-\delta)^2)}`$, whereas $`U_t(d)\le B=\max_d U_1(d)<\infty`$ for $`t\ge1`$. Every global minimizer is therefore in one of the neighborhoods for large $`t`$.

At $`d+h`$ inside its neighborhood, at least one nearest vector satisfies $`\langle v,h\rangle\ge\eta\|h\|`$. Its summand gives $`U_t(d+h)\ge e^{t\eta\|h\|}`$. Every minimum on the closed neighborhood is consequently interior with $`y=th`$ in a fixed ball. In these coordinates the exact objective is

```math
 Q_{d,t}(y)=U_t(d+y/t)
 =e^{-\|y\|^2/t}\sum_{s\ge0}e^{-ts}\sum_{v\in V_d(s)}e^{2\langle v,y\rangle}.
```

The gaps with nonempty shells form a locally finite subset of $`[0,\infty)`$. On any fixed ball in $`y`$, the contribution from shells with gap $`s\ge a>0`$, including its first three $`y`$-derivatives, is $`O(e^{-ta})`$. Indeed, factor $`e^{-(t-1)a}`$ and dominate the rest by the convergent sum of a polynomial in $`\|v\|`$ times $`e^{-(\|v\|^2-\rho^2)+2\|v\|\sup\|y\|}`$. The prefactor and its derivatives stay uniformly bounded.

The convex-hull ball gives $`F_d(y)\ge e^{2\eta\|y\|}`$, and the full span gives a positive definite Hessian at every $`y`$. Thus $`F_d`$ has a unique minimizer $`u_d`$. On any fixed ball containing $`u_d`$ and the rescaled neighborhood minima in its interior, the functions $`Q_{d,t}`$ converge to $`F_d`$ in $`C^2`$ at rate $`O(1/t)`$. Their Hessians are uniformly positive definite there for large $`t`$. It follows that each neighborhood has a unique minimizing point $`d+y_t/t`$. The gradient equation and strong convexity give $`y_t=u_d+O(1/t)`$. Write $`m_d(t)=Q_{d,t}(y_t)`$.

A fixed point minimizing for all large $`t`$ must be a deep hole, by the localization bounds. At such a hole stationarity gives $`0=\nabla Q_{d,t}(0)=2\sum_s e^{-ts}b_d(s)`$ for all large $`t`$. If there were a first nonzero vector sum, multiplication by its inverse exponential would give a nonzero limit. Thus all shells balance. Conversely, if $`d`$ is balanced, its scaled gradient is identically zero at $`y=0`$. Uniqueness from strong convexity makes $`d`$ the neighborhood minimizer for all large $`t`$.

## The first unbalanced shell

Suppose first $`b_d(0)\ne0`$. Then $`\nabla F_d(0)\ne0`$, so $`u_d\ne0`$. Uniformly on the ball,

```math
 Q_{d,t}(y)=F_d(y)-t^{-1}\|y\|^2F_d(y)+O(t^{-2}).
```

Since $`\nabla F_d(u_d)=0`$ and $`y_t=u_d+O(t^{-1})`$,

```math
 m_d(t)=M_d-t^{-1}M_d\|u_d\|^2+O(t^{-2}).
```

The displayed correction is strictly negative. For a balanced candidate $`c`$, $`U_t(c)=N_c(0)+O(e^{-\gamma t})`$ for some $`\gamma>0`$. This proves comparison 2, including the case $`N_c(0)=M_d`$.

Now suppose $`b_d(0)=0`$ and let $`\Delta>0`$ be the first unbalanced gap. In this case $`u_d=0`$. Abbreviate $`H=H_d`$, $`N=N_d(0)`$, and $`g=2b_d(\Delta)`$. At zero the gradient $`p_t`$ and Hessian $`K_t`$ of $`Q_{d,t}`$ satisfy, for some $`\gamma>0`$,

```math
 p_t=e^{-t\Delta}\bigl(g+O(e^{-\gamma t})\bigr),\qquad
 K_t=H-\frac{2N}{t}I+O(e^{-\gamma t}).
```

The first error follows from shell discreteness above $`\Delta`$ and the differentiated Gaussian tail bound. For the Hessian, the outer Gaussian prefactor has zero gradient and Hessian $`-2I/t`$ at zero. All positive-gap shells contribute exponentially little to the Hessian, including the part multiplied by $`1/t`$. The same $`\gamma>0`$ can be used by taking the smaller of the two gap bounds.

Strong convexity gives $`\|y_t\|=O(\|p_t\|)`$ by comparing the gradients at zero and $`y_t`$. Uniform boundedness of third derivatives then yields, by Taylor expansion of the gradient and the energy,

```math
 y_t=-K_t^{-1}p_t+O(\|p_t\|^2),\qquad
 U_t(d)-m_d(t)=\tfrac12p_t^{\mathsf T}K_t^{-1}p_t+O(\|p_t\|^3).
```

As $`K_t^{-1}=H^{-1}+2N H^{-2}/t+O(t^{-2})`$, this proves

```math
 \begin{aligned}
 (d+y_t/t)-d
     &=-\frac{e^{-t\Delta}}t\bigl(H^{-1}g+O(t^{-1})\bigr),
 \\ U_t(d)-m_d(t)
     &=e^{-2t\Delta}\left(C_0+\frac{C_1}{t}+O(t^{-2})\right),
 \\ C_0&=\tfrac12g^{\mathsf T}H^{-1}g>0,\qquad
 C_1=N\|H^{-1}g\|^2>0 .
 \end{aligned}
```

## Comparing the minima

At fixed holes $`U_t(d)-U_t(c)=\sum_s J(s)e^{-ts}`$. When the counts differ, the first differing gap determines the eventual sign, by the gap and convergence estimate. When every count agrees, the values agree for all $`t`$. This proves comparison 1.

In comparison 3 subtract the energy drop just obtained from $`U_t(d)-U_t(c)`$. A first count difference below $`2\Delta`$ governs the sign of $`m_d(t)-U_t(c)`$. If all earlier counts agree, this difference, scaled by $`e^{2t\Delta}`$, is

```math
 J(2\Delta)-C_0-C_1/t+O(t^{-2}).
```

Indeed, counts with gap strictly greater than $`2\Delta`$ give an exponentially small scaled remainder, since the union of the two gap sets is locally finite. Thus a positive constant gives $`m_d(t)>U_t(c)`$, a negative constant gives the reverse inequality, and a zero constant also gives $`m_d(t)<U_t(c)`$, by $`C_1>0`$. This proves comparison 3.

The finitely many comparisons share a common threshold. If $`c`$ passes them, every unbalanced competitor has strictly greater neighborhood minimum and every balanced competitor has equal or greater value. Any balanced competitor that ties for all large $`t`$ has the same fixed shell counts as $`c`$ and is itself stable. If any test fails, that neighborhood beats $`c`$ for all large $`t`$. The theorem follows.

## A Leech local minimum

In the normalization $`\rho^2=2`$, the $`A_{24}`$ deep holes of the Leech lattice have a balanced nearest shell of 25 vectors. Their second squared radius is $`52/25`$, and its shell fails first-moment balance. These data give $`\Delta=2/25`$. Thus the local minimizing point near each such $`d`$ has displacement of order $`e^{-2t/25}/t`$ from $`d`$, and the improvement $`U_t(d)-m_d(t)`$ has order $`e^{-4t/25}`$ with a strictly positive leading coefficient. For the original unnormalized Gaussian sum the improvement acquires the additional factor $`e^{-2t}`$. The global Leech minimizing neighborhoods were identified previously as type $`E_8^3`$. [Bachoc, Moustrou, Vallentin and Zimmermann, §5 and Table 3](https://arxiv.org/html/2502.08819v2#S5.T3). [Repository Leech correction](https://github.com/1337isnot1337/solved-conjectures/blob/main/docs/research-results/leech-cold-spots-asymptotics/PROOF.md).

### Exact coefficients at the Leech hole

Shimada supplies a Gram matrix $`G`$ in a basis of the Leech lattice and the coordinates of an $`A_{24}`$ center. The [exact enumeration](check_leech.py) uses the [two numerical inputs](shimada-a24.json) and gives 5 vectors in the second shell. In this nonorthogonal basis the Hessian acts by the matrix $`4\sum_{v\in V_d(0)}v(Gv)^{\mathsf T}`$, and squared lengths are computed using $`G`$. Solving $`H_d w=g`$ gives $`\frac12 g^{\mathsf T}Gw=3/5`$ and $`w^{\mathsf T}Gw=1/5`$. Hence the local displacement has length $`e^{-2t/25}(1/\sqrt5+O(1/t))/t`$, and the normalized gain is

```math
 e^{-4t/25}\left(\frac35+\frac5t+O(t^{-2})\right).
```

The enumeration factors $`G=LDL^{\mathsf T}`$ with unit lower-triangular $`L`$, then fixes the integer coordinates from last to first. After each choice the as-yet-unassigned terms are squares with positive coefficients, so the remaining squared-radius budget gives exact integer bounds for the next coordinate. Rational arithmetic and integer square roots include boundary points. The bundled data contain the Gram matrix and 25 times the rational center from Shimada's record; the checker optionally compares them to the full source. [Shimada's data and documentation](https://home.hiroshima-u.ac.jp/ichiro-shimada/ComputationData.html).

## Scope and attribution

Bachoc, Moustrou, Vallentin and Zimmermann establish the shell-balance characterization of stable critical points, give a sufficient spherical-design condition for stability, and compare Gaussian values at fixed points by their shell counts. The repository's earlier all-balanced theorem settles eventual stability for $`A_n^*`$ and explicitly leaves open the mixed case. Its Leech correction supplies the nearest-shell minimum $`M_d`$ and the general localization theorem. The additional ingredients here are the first strict correction for a tie against $`M_d`$, the energy drop and displacement at the first unbalanced positive-gap shell, and their combination into the mixed-hole criterion. The all-parameter question for $`A_n^*`$, and the competition among moving branches when there is no stable cold spot, are separate questions. [Primary paper, Theorems 1.1–1.2 and §5](https://doi.org/10.1017/fms.2026.10169). [Repository all-balanced theorem](https://github.com/1337isnot1337/solved-conjectures/blob/1d1cff5b8e74bcbf0964e713eaf308939f12c62c/research/lattice-cold-spot-stability/STABILITY.md).

The paper's §1.6 also asks about $`D_n^*`$ for $`n\ge5`$. The repository already proves that the deep holes of $`D_n^*`$ are the precise minimizers for every positive parameter in all ranks $`n\ge3`$. For $`A_n^*`$ the research branch covers both endpoint regimes. At that checkpoint the intermediate-parameter question remained open for ranks $`n\ge4`$, since $`A_3`$ and $`D_3`$ are isometric. The later [dual type-A theorem](../dual-a-universal/PROOF.md) settles all positive parameters. [Published checkerboard theorem](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/betermin-fcc-bcc-cold-spots/PROOF.md). [Dual type-A small-parameter supplement](https://github.com/1337isnot1337/solved-conjectures/blob/1d1cff5b8e74bcbf0964e713eaf308939f12c62c/research/lattice-cold-spot-stability/SMALL-ALPHA.md).
