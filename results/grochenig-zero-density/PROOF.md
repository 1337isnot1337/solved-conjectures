# Gröchenig’s problem

## Statement and scope

Karlheinz Gröchenig, *Infinite totally positive matrices: some open problems*, Acta Scientiarum Mathematicarum (2026), DOI [10.1007/s44146-026-00264-3](https://doi.org/10.1007/s44146-026-00264-3), Problem 4.12 asks whether

```math
D^\pm(Z(f))\le D^\pm(c)
```

for every Pólya frequency function $`g`$ and every

```math
f(x)=\sum_{k\in\mathbb Z}c_k g(x-k)\in V^\infty(g),\qquad c\in\ell^\infty(\mathbb Z).
```

Here $`Z(f)=\{x\in\mathbb R:f(x)=0\}`$. The source defines coefficient sign changes by

```math
M(c)=\{j\in\mathbb Z:\text{there is }r\in\mathbb N\text{ with }c_jc_{j+r}<0
\text{ and }c_{j+l}=0\ (1\le l\lt r)\}.
```

Thus zeros in the coefficient sequence are skipped when deciding whether its next nonzero term has the opposite sign. Its upper density is

```math
D^+(c)=\limsup_{n\to\infty}\sup_{a\in\mathbb Z}
\frac{\#(M(c)\cap[a,a+n])}{n}.
```

For a locally finite subset $`E\subset\mathbb R`$, write

```math
D^+(E)=\limsup_{R\to\infty}\sup_{a\in\mathbb R}
\frac{\#(E\cap[a,a+R])}{R}.
```

Restricting to positive integer lengths does not change this density. Using integer starting points also suffices for the lower bounds below. If a supremum is infinite, the same formulas have their extended-real meaning.

We construct a real sequence $`c\in\ell^1(\mathbb Z)\subset\ell^\infty(\mathbb Z)`$ for the Gaussian

```math
g(x)=e^{-\pi x^2}
```

such that the corresponding nonzero function is entire and

```math
D^+(c)=\frac12,
\qquad D^+(Z(f))\ge1.
```

The Gaussian is explicitly listed as a Pólya frequency function in the source following Definition 2.5. This refutes the upper-density inequality and therefore answers the universal assertion in Problem 4.12 negatively. It does not settle the separate lower-density inequality.

## 1. Finite Gaussian blocks

For every integer $`N\ge1`$, define

```math
P_N(t)=\prod_{j=1}^{N}(t-e^{4\pi j})
      =\sum_{k=0}^{N}p_{N,k}t^k,
\qquad
A_{N,k}=p_{N,k}e^{4\pi k^2}.
```

All roots of $`P_N`$ are positive, so

```math
(-1)^{N-k}p_{N,k}>0\qquad(0\le k\le N).
```

In particular every coefficient is nonzero, and consecutive coefficients have opposite signs. Put

```math
B_N=\sum_{k=0}^{N}|A_{N,k}|>0,
\qquad
a_{N,k}=\frac{2^{-N}}{B_N}A_{N,k},
\qquad
h_N(x)=\sum_{k=0}^{N}a_{N,k}g(x-2k).
```

The elementary identity

```math
e^{-\pi(x-2k)^2}=e^{-\pi x^2}e^{4\pi kx}e^{-4\pi k^2}
```

gives the exact factorization

```math
h_N(x)=\frac{2^{-N}}{B_N}e^{-\pi x^2}P_N(e^{4\pi x}).
\tag{1}
```

Consequently $`h_N`$ has simple real zeros at $`1,2,\ldots,N`$ and changes sign between the successive test points

```math
t_{N,j}=j+\frac12,\qquad 0\le j\le N.
```

More precisely,

```math
\mathop{\mathrm{sign}}h_N(t_{N,j})=(-1)^{N-j}.
\tag{2}
```

Define the positive number

```math
\delta_N=\min_{0\le j\le N}|h_N(t_{N,j})|>0.
\tag{3}
```

Also,

```math
\sum_{k=0}^{N}|a_{N,k}|=2^{-N},
\qquad
|h_N(x)|\le2^{-N}\quad(x\in\mathbb R),
\tag{4}
```

and $`h_N(x)\to0`$ as $`x\to\pm\infty`$, since it is a finite sum of Gaussian translates.

## 2. Recursive separation of the blocks

Choose even integers $`L_N`$ recursively. Let $`L_1=0`$. After $`L_1,\ldots,L_{N-1}`$ have been chosen, choose $`L_N`$ so large that all the following finite families of strict inequalities hold:

```math
L_N>L_{N-1}+2(N-1)+N^2+2;
\tag{5}
```

```math
\left|\sum_{m=1}^{N-1}h_m(L_N+t_{N,j}-L_m)\right|
<\frac{\delta_N}{4}
\qquad(0\le j\le N);
\tag{6}
```

```math
|h_N(L_m+t_{m,j}-L_N)|
<\delta_m2^{-N-2}
\qquad(1\le m\lt N,\ 0\le j\le m).
\tag{7}
```

Such an even integer exists. In (6), every summand tends to zero as $`L_N\to+\infty`$. In (7), the argument of the fixed function $`h_N`$ tends to $`-\infty`$. There are only finitely many inequalities at each step, and every right side is positive. One may, for definiteness, choose the least even integer satisfying (5)–(7).

This is an exact recursive definition by explicit elementary functions. No numerical approximation is required to establish existence or any subsequent conclusion.

## 3. The infinite shift sum

The integer intervals $`[L_N,L_N+2N]`$ are pairwise disjoint by (5). Define

```math
c_{L_N+2k}=a_{N,k}\qquad(N\ge1,\ 0\le k\le N),
```

and $`c_l=0`$ at every other integer. The disjointness makes this unambiguous. The support is contained in $`2\mathbb Z`$, and (4) gives

```math
\sum_{l\in\mathbb Z}|c_l|=
\sum_{N=1}^{\infty}2^{-N}=1.
\tag{8}
```

Set

```math
f(z)=\sum_{l\in\mathbb Z}c_l e^{-\pi(z-l)^2}
    =\sum_{N=1}^{\infty}h_N(z-L_N).
\tag{9}
```

Both equalities are legitimate by absolute local uniform convergence. Indeed, for $`z=x+iy`$,

```math
|e^{-\pi(z-l)^2}|=e^{\pi y^2}e^{-\pi(x-l)^2}
\le e^{\pi y^2}.
```

On every compact subset of $`\mathbb C`$, this is bounded independently of $`l`$, and (8) supplies a summable majorant. The sum is therefore entire. On the real line, $`|f(x)|\le1`$, and its representation has $`c\in\ell^\infty(\mathbb Z)`$, so $`f\in V^\infty(g)`$ exactly as required in Problem 4.12.

## 4. Every block retains its sign changes

Fix $`m\ge1`$ and $`0\le j\le m`$, and evaluate (9) at

```math
x_{m,j}=L_m+t_{m,j}.
```

At the step when $`L_m`$ was chosen, (6) made the contribution from all earlier blocks less than $`\delta_m/4`$ in absolute value; for $`m=1`$ that contribution is zero. Every later block $`N>m`$ satisfies (7), so its total contribution is bounded by

```math
\sum_{N=m+1}^{\infty}|h_N(x_{m,j}-L_N)|
\le\delta_m\sum_{N=m+1}^{\infty}2^{-N-2}
=\delta_m2^{-m-2}
\le\frac{\delta_m}{8}.
```

Thus

```math
|f(x_{m,j})-h_m(t_{m,j})|<\frac{3\delta_m}{8}
<|h_m(t_{m,j})|.
\tag{10}
```

The values of $`f`$ at $`x_{m,0},\ldots,x_{m,m}`$ consequently have the same alternating signs as in (2). In particular $`f`$ is not identically zero. Its real zeros are locally finite because it is a nonzero entire function.

By the intermediate value theorem, every one of the $`m`$ disjoint open intervals

```math
(L_m+j+1/2,\ L_m+j+3/2),\qquad j=0,\ldots,m-1,
```

contains a zero. Therefore

```math
\#\bigl(Z(f)\cap[L_m+1/2,L_m+m+1/2]\bigr)\ge m.
\tag{11}
```

This interval has length $`m`$. As $`m`$ is arbitrary, (11) implies

```math
D^+(Z(f))\ge1.
\tag{12}
```

Even if the density definition is restricted to integer starting points and lengths, the containing interval $`[L_m,L_m+m+1]`$ gives the ratio $`m/(m+1)\to1`$ and the same conclusion.

## 5. Exact upper density of coefficient sign changes

Every index in $`M(c)`$ is an index of a nonzero coefficient. Since the support of $`c`$ is contained in $`2\mathbb Z`$,

```math
M(c)\subseteq2\mathbb Z.
```

An interval of integer length $`n`$ contains at most $`n/2+1`$ even integers. Hence

```math
D^+(c)\le\frac12.
\tag{13}
```

Conversely, within the $`N`$th block the consecutive nonzero coefficients

```math
c_{L_N},c_{L_N+2},\ldots,c_{L_N+2N}
```

have alternating signs, with the intervening odd coefficients zero. The source's definition of $`M(c)`$ therefore gives

```math
\{L_N,L_N+2,\ldots,L_N+2(N-1)\}\subseteq M(c).
```

The interval $`[L_N,L_N+2N]`$ has length $`2N`$ and contains at least $`N`$ coefficient sign changes. Letting $`N\to\infty`$ yields

```math
D^+(c)\ge\frac12.
\tag{14}
```

An additional sign change between two blocks can only occur at an even endpoint and does not affect either bound. Equations (13) and (14) prove $`D^+(c)=1/2`$.

Combining this with (12) gives

```math
D^+(Z(f))\ge1>\frac12=D^+(c).
```

This is a counterexample to the upper-density assertion in Gröchenig's Problem 4.12. It uses one fixed Gaussian generator and one infinite coefficient sequence, with all sufficiently long density scales supplied by the recursive construction. It is not a finite-dimensional or fixed-size numerical instance.
