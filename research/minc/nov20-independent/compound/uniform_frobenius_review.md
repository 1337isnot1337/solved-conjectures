# Independent review of uniform Frobenius stability

Date: 20 November 2026 (America/Chicago).

Reviewed file: [uniform_frobenius_stability.md](../inequalities/uniform_frobenius_stability.md).

Result: the dimension-independent coefficient 1/32,000,000 and the
explicit zero-diagonal confinement bound follow from the previously
reviewed multicolumn and local theorems. The algebra, floor operation,
small orders, and derangement remainder are correct. This is not a
resolution of a complete Minc entry.

## Choice of the number of columns

Write u=||A-J||_F^2 and v=min(u,1). For n>=4, the proposed integer
k=1+floor((n-2)v/4) satisfies

```math
1\le k\le(n+2)/4\le n/2<n.
```

Hence the denominator of the negative term in the multicolumn bound is
at least n(n+2). Combining this with k-1<=(n-2)v/4 gives

```math
\frac{k(k-1)}{4(n-k)(n-k+1)}
\le\frac{k(n-2)v}{4n(n+2)}
\le\frac{ku}{4n}.
```

Subtracting this loss from ku/(2n) leaves at least ku/(4n). For n>=4,
k>(n-2)v/4>=nv/8. Thus the resulting lower bound is uv/32, with u=0
handled directly. At n=2 and n=3, k=1 is admissible and gives u/(2n),
which is stronger than uv/32 because v<=1. No asymptotic rounding error
or omitted small order is present.

## Patching the local and global estimates

For u<=epsilon=10^-6, the reviewed local theorem gives a normalized
permanent at least 1+u/32. Therefore

```math
\log(\operatorname{per}A/d_n)
\ge\frac{u}{32+u}
\ge\frac{\varepsilon u}{32}.
```

The last inequality follows from 32>=epsilon(32+epsilon). For u>=epsilon,
v>=epsilon, and the preceding global estimate gives the same bound.
Both estimates include their common boundary. Since epsilon/32 equals
1/32,000,000, this proves the stated absolute coefficient.

## Explicit zero-diagonal confinement

The permanent of U_n equals D_n/(n-1)^n, where D_n is the derangement
count. The alternating expansion of D_n/n! yields the valid upper bound
e^-1+1/(n+1)! in both parities, including n=2. Therefore

```math
\log(D_n/n!)\le-1+3/(n+1)!
```

by e<3 and log(1+x)<=x. The remaining normalization term satisfies

```math
-n\log(1-1/n)-1
=\sum_{\ell\ge2}\frac1{\ell n^{\ell-1}}
\le\frac1{2(n-1)}.
```

Multiplication by 32,000,000 gives 16,000,000/(n-1) plus the factorial
term 96,000,000/(n+1)!. For a zero-diagonal doubly stochastic matrix,
orthogonality subtracts exactly 1/(n-1) when converting distance from J_n
to distance from U_n. The coefficient 15,999,999 is therefore correct.

The comparison assumption is per A<=per U_n, so the bound applies to
equality candidates as stated. The squared-distance bound has order
1/n; its square root has order 1/sqrt(n). Neither assertion supplies the
unresolved smaller orders of Conjecture 44.

This review checks the mathematical deduction. It does not establish
historical priority for dimension-independent permanent stability.
