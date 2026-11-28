# Erdős 1192: finite energy is sufficient for geometric gluing

Date: 21 November 2026. Status: an exact reformulation and a standard-norm clarification; the required finite bases are not constructed. No novelty, full-conjecture, formal-verification, or reward claim.

This note concerns the [all-orders target](target-and-prior-audit.md). Every representation count below is ordered and permits repeated summands.

## 1. Energy and a union inequality

For a finite set $`B\subset\mathbb Z`$, define

```math
r_{r,B}(n)=\#\{(b_1,\ldots,b_r)\in B^r:b_1+\cdots+b_r=n\},
\qquad
E_r(B)=\sum_{n\in\mathbb Z}r_{r,B}(n)^2.
```

With $`P_B(t)=\sum_{b\in B}e^{2\pi i b t}`$, expansion and integration give

```math
E_r(B)=\int_0^1|P_B(t)|^{2r}\,dt.
```

For arbitrary finite sets $`B_1,\ldots,B_J`$,

```math
E_r\left(\bigcup_{j=1}^J B_j\right)^{1/(2r)}
\le \sum_{j=1}^J E_r(B_j)^{1/(2r)}.                 \tag{1}
```

To handle overlaps, replace each $`B_j`$ by

```math
C_j=B_j\setminus\bigcup_{i\lt j}B_i.
```

The $`C_j`$ are disjoint, their union is unchanged, and $`E_r(C_j)\le E_r(B_j)`$ because every energy solution in $`C_j`$ is an energy solution in $`B_j`$. Now $`P_{\cup C_j}=\sum_jP_{C_j}`$ and the $`L^{2r}`$ triangle inequality proves (1). No pointwise Fourier monotonicity is asserted.

Translations preserve energy. In particular, if $`T`$ is a finite integer set,

```math
E_r(B+T)\le |T|^{2r}E_r(B).                       \tag{2}
```

## 2. A direct geometric-union lemma

Suppose $`M_j`$ is increasing and $`M_{j+1}\ge\lambda M_j`$ for a fixed $`\lambda>1`$. Suppose finite sets $`B_j\subset\mathbb N_0`$ satisfy

```math
B_j\subseteq[aM_j,bM_j],\qquad E_r(B_j)\le C M_j,
\qquad 0\lt a\le b<\infty.                          \tag{3}
```

Let $`A=\bigcup_j B_j`$. If $`J`$ is the largest index for which $`aM_J\le x`$, then

```math
A\cap[0,x]\subseteq\bigcup_{j\le J}B_j.
```

By (1),

```math
\begin{aligned}
E_r(A\cap[0,x])^{1/(2r)}
&\le C^{1/(2r)}\sum_{j\le J}M_j^{1/(2r)}
\\ &\le\frac{C^{1/(2r)}M_J^{1/(2r)}}
 {1-\lambda^{-1/(2r)}}.
\end{aligned}
```

Consequently,

```math
\sum_{n\le x}f_{r,A}(n)^2
\le E_r(A\cap[0,x])
\le\frac{C x}{a(1-\lambda^{-1/(2r)})^{2r}}.        \tag{4}
```

All summands in a representation of a nonnegative integer at most $`x`$ lie in $`[0,x]`$, which justifies the first inequality. This proves only the energy claim. Coverage must still come from the blocks.

In particular, the constants in (4) may depend on $`r`$ and on the scale ratio. They do not depend on the number of blocks. There is no need to choose translations to cancel or average mixed energies.

## 3. Exact finite cyclic reformulation

Fix an integer $`r\ge2`$. For $`B\subseteq\mathbb Z/N\mathbb Z`$, put

```math
E_r^{(N)}(B)=
\sum_{s\in\mathbb Z/N\mathbb Z}
\#\{\mathbf b\in B^r:b_1+\cdots+b_r=s\}^2.
```

The following statements are equivalent.

1. There is an asymptotic basis $`A\subseteq\mathbb N_0`$ of order $`r`$ with $`\sum_{n\le x}f_{r,A}(n)^2=O(x)`$.
2. There is a constant $`C`$ such that for every sufficiently large integer $`N`$, some $`B_N\subseteq\mathbb Z/N\mathbb Z`$ satisfies $`rB_N=\mathbb Z/N\mathbb Z`$ and $`E_r^{(N)}(B_N)\le C N`$.
3. The same finite statement holds for all sufficiently large dyadic moduli $`N=2^j`$ with one constant $`C`$.

### Proof that 1 implies 2

Choose $`N`$ large enough that all integers in $`[N,2N)`$ are represented by $`rA`$. Reduce $`A\cap[0,2N]`$ modulo $`N`$ to obtain $`B_N`$. Each residue has a representative in $`[N,2N)`$, so $`rB_N`$ is the whole group.

For the energy estimate, choose a single representative in $`A\cap[0,2N]`$ for each element of $`B_N`$, producing a set $`F_N`$. The reduction map is a bijection from $`F_N`$ to $`B_N`$. For each residue $`s`$, all integer sums of $`r`$ elements of $`F_N`$ lie in $`[0,2rN]`$, and at most $`2r+1`$ of these possible sums are congruent to $`s`$. Cauchy–Schwarz gives

```math
\begin{aligned}
E_r^{(N)}(B_N)
&\le(2r+1)E_r(F_N)
\\ &\le(2r+1)E_r(A\cap[0,2N])
\\ &\le(2r+1)\sum_{n\le2rN}f_{r,A}(n)^2=O_r(N).
\end{aligned}                                                     \tag{5}
```

The representative choice is used for the energy bound only. Coverage was already proved in the quotient and is unchanged by that choice.

Statement 2 trivially implies 3.

### Proof that 3 implies 1

For a dyadic modulus $`N`$, let $`\widetilde B_N\subseteq\{0,\ldots,N-1\}`$ be the canonical integer lift. Integer equality of sums implies equality modulo $`N`$, hence

```math
E_r(\widetilde B_N)\le E_r^{(N)}(B_N)\le C N.
```

Set

```math
W_N=\widetilde B_N+\{N,2N,3N,4N\}.              \tag{6}
```

Then

```math
W_N\subseteq[N,5N),\qquad E_r(W_N)\le4^{2r}C N. \tag{7}
```

We claim

```math
[(2r-1)N,(4r+1)N)\cap\mathbb Z\subseteq rW_N.    \tag{8}
```

Write an integer in this interval uniquely as $`s+kN`$ with $`0\le s\lt N`$ and $`2r-1\le k\le4r`$. Since $`rB_N`$ covers the quotient, some lifted tuple sums to $`s+\ell N`$, where $`0\le\ell\le r-1`$. Therefore

```math
r\le k-\ell\le4r.
```

Every integer between $`r`$ and $`4r`$ is the sum of $`r`$ integers chosen from $`\{1,2,3,4\}`$. Adding the corresponding multiples of $`N`$ to the lifted summands gives the required representation of $`s+kN`$. This proves (8), including the interval endpoints.

For successive dyadic moduli, the covered intervals overlap because

```math
2(2r-1)<4r+1.
```

Thus $`A=\bigcup_{j\ge j_0}W_{2^j}`$ is an asymptotic basis. Applying (4) with $`a=1`$, $`\lambda=2`$, and block-energy constant $`4^{2r}C`$ gives

```math
\sum_{n\le x}f_{r,A}(n)^2
\le\frac{4^{2r}C}{(1-2^{-1/(2r)})^{2r}}\,x.
```

This establishes the equivalence. It does not prove any of its three assertions for an order not already covered by prior work.

## 4. Finite prime-field groups also suffice

The cyclic reformulation does not require a construction to start in a cyclic group. Here is an explicit transfer from bounded-rank prime-field groups.

Fix $`r\ge2`$. Suppose that for every sufficiently large prime $`p`$ there is a set $`C_p\subseteq\mathbb F_p^r`$ with

```math
rC_p=\mathbb F_p^r,\qquad
E_r^{\mathbb F_p^r}(C_p)\le D_r p^r.              \tag{9}
```

Then the infinite assertion in §3 holds for this $`r`$.

Put $`L=rp`$ and $`K=L^r`$. Represent field elements by integers in $`[0,p)`$ and define

```math
\phi(x_0,\ldots,x_{r-1})=\sum_{i=0}^{r-1}x_iL^i,
\qquad B_p=\phi(C_p).
```

Every coordinate sum of $`r`$ representatives is less than $`L`$. Therefore equality between two integer $`r`$-term sums of points of $`B_p`$ forces equality of the coordinate sums, hence equality in $`\mathbb F_p^r`$. It follows that

```math
E_r(B_p)\le D_rp^r,\qquad B_p\subseteq[0,K).
```

Introduce the finite correction set

```math
T_p=\left\{p\sum_{i=0}^{r-1}h_iL^i:
                  h_i\in\{-r,-r+1,\ldots,r\}\right\},
\qquad D_p=B_p+T_p.
```

The correction set $`T_p`$ contains zero, has at most $`(2r+1)^r`$ elements, and lies in $`(-2K,2K)`$. Thus $`D_p\subseteq(-2K,3K)`$ and

```math
E_r(D_p)\le (2r+1)^{2r^2}D_rp^r=O_r(K).         \tag{10}
```

For any integer $`0\le n\lt K`$, write its base-$`L`$ digits as $`n_i\in[0,L)`$. By (9), choose $`r`$ points of $`C_p`$ whose coordinate sums $`s_i`$ satisfy $`s_i\equiv n_i\pmod p`$. Each difference $`n_i-s_i`$ is a multiple $`p h_i`$ with $`-r\le h_i\le r`$. Consequently

```math
n=\sum_{j=1}^r\phi(c_j)+t
\quad\text{for some }t\in T_p.
```

Use this correction on the first summand and use the zero correction on the others. This proves

```math
[0,K)\cap\mathbb Z\subseteq rD_p.              \tag{11}
```

Choose primes $`p_j`$ so that $`2p_j\lt p_{j+1}<4p_j`$, which is possible by Bertrand's postulate applied beyond $`2p_j`$. Their scales $`K_j=(rp_j)^r`$ obey

```math
2^r\lt K_{j+1}/K_j<4^r.
```

Set $`H=3\cdot4^r`$ and

```math
V_j=D_{p_j}+\{3K_j,4K_j,\ldots,(H+3)K_j\}.
```

These blocks lie in $`(K_j,(H+6)K_j)`$ and have energy $`O_r(K_j)`$ by (2) and (10). Formula (11) gives

```math
[3rK_j,(3r+rH+1)K_j)\cap\mathbb Z\subseteq rV_j. \tag{12}
```

Indeed, the sums of $`r`$ integers from $`\{0,\ldots,H\}`$ run through $`[0,rH]`$. The intervals in (12) overlap at successive scales because

```math
3rK_{j+1}<3r4^rK_j<(3r+rH+1)K_j.
```

The union of the $`V_j`$ is therefore an asymptotic basis, and §2 proves its mean-square bound. The same proof works for any infinite prime family from which a geometrically growing sequence with bounded successive ratio can be chosen.

The fixed dimension and prime-field assumption matter in this specific embedding. No claim is made that the same constant-size correction set works in a vector space whose dimension grows with the scale. The finite covering and energy hypotheses (9) remain unproved for the desired all-orders construction.

## 5. What happened to the balanced mixed correlations?

The [public July 2026 working report](https://www.erdosproblemaday.com/report/1192), §3, expands the order-three energy of $`X\cup(V+t)`$. It isolates the two translation-invariant terms

```math
C_{11}=\sum_d\Delta_{1,V}(d)\Delta_{2,X}(d),
\qquad
C_{22}=\sum_d\Delta_{2,V}(d)\Delta_{1,X}(d),
```

where $`\Delta_{j,B}(d)`$ counts differences of two ordered $`j`$-term sums. That expansion is correct. Its stated Cauchy bound involving fourth-order energy is unnecessarily weak for the stated hypotheses.

Fourier expansion gives, directly,

```math
C_{11}=\int_0^1|P_V|^2|P_X|^4,
\qquad
C_{22}=\int_0^1|P_V|^4|P_X|^2.
```

Hölder with exponents $`3`$ and $`3/2`$ gives

```math
C_{11}\le E_3(V)^{1/3}E_3(X)^{2/3},\qquad
C_{22}\le E_3(V)^{2/3}E_3(X)^{1/3}.               \tag{13}
```

More generally, for $`0\le a\le r`$,

```math
\int_0^1|P_V|^{2a}|P_X|^{2(r-a)}
\le E_r(V)^{a/r}E_r(X)^{(r-a)/r}.                \tag{14}
```

The endpoint cases are interpreted directly. Thus critical highest-energy control also controls every balanced mixed term at the critical scale. Formula (1), applied to all geometric blocks together, avoids a one-step induction with an uncontrolled multiplicative constant.

The working report labels its mixed-correlation conditions as sufficient conditions for a particular route, not necessary conditions for every solution. This note does not challenge its exact expansion or finite computations. It removes those extra conditions from the route once the finite highest-energy hypothesis is assumed.

## 6. The remaining full-target obligation

The finite assertion in §3 must hold for every fixed $`r\ge2`$ with constants uniform over all sufficiently large dyadic moduli. A construction for a few moduli, a count of positive-density covered residues, or a bound that grows with $`N`$ does not discharge that assertion.

This reduction uses only Fourier orthogonality, Hölder, Minkowski, elementary carrying, and a geometric series. These are standard tools, and no priority claim is made for the reformulation. Ruzsa's order-two theorem remains prior. The all-orders finite covering construction and the original bounty remain unresolved in this work.
