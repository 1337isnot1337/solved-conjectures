# One-sided dilation estimates imply positive natural density

Let $`A(n)=|U\cap[1,n]|`$. The following criterion uses the counting
function of the original Ulam sequence. Its proof applies to an arbitrary
subset of the positive integers.

**Conditional theorem.** Suppose for every integer $n\ge100000$,

```math
A(2n)\ge 2A(n)-4\sqrt n
```

and suppose the following holds as $n$ tends to infinity,

```math
\liminf_{n\to\infty}\frac{A(3n)-3A(n)}{n}\ge0.
```

Then the natural density $d$ exists. The exact count $A(100000)=7584$ gives

```math
d\ge \frac{7584}{100000}-
\frac{2}{\sqrt{100000}(1-1/\sqrt2)}
>0.0542.
```

## Proof

Interpolate $A$ linearly between integers and set $f(x)=A(x)/x$ for $x>0$.
The interpolation is 1-Lipschitz, so replacing $n$ by a real $x$ in
either normalized hypothesis changes the estimates by $O(1/x)$. For
$x\ge y>0$, the bounds $0\le A(y)\le y$ and
$`|A(x)-A(y)|\le x-y`$ give
$`|f(x)-f(y)|\le 2(x-y)/x`$.

For $t\in[1,2]$ consider $g_k(t)=f(2^kt)$. The first hypothesis implies
$g_{k+1}(t)\ge g_k(t)-C2^{-k/2}$ for a constant $C$ and all sufficiently
large $k$, uniformly in $t$. For each $t$, adding the partial sum of
these summable error bounds makes the sequence nondecreasing and bounded,
so $g_k(t)$ converges. The bound on $f$ gives a common Lipschitz constant
for the $g_k$, and hence uniform convergence on $[1,2]$. For example, a
finite mesh controls the uniform error by the maximum of the mesh-point
errors plus twice the mesh spacing times the common Lipschitz constant.
Write $g$ for the continuous limit.

The endpoint identity $g(2)=g(1)$ permits a continuous extension to
$(0,\infty)$ by $g(2t)=g(t)$. The second hypothesis now implies
$g(3t)\ge g(t)$ for all $t>0$, by applying it at $x=2^kt$ and taking
$k$ to infinity. The function $h(s)=g(2^s)$ is continuous and
1-periodic. The integral over one period of
$h(s+\log_2 3)-h(s)$ is zero, and the integrand is nonnegative.
Consequently $\log_2 3$ is another period. It is irrational since
distinct positive powers of 2 and 3 cannot coincide. Continuity and
density of the generated periods make $h$, and therefore $g$, constant.
Uniform convergence of $g_k$ on $[1,2]$ gives the same limit for $f(x)$
as $x\to\infty$.

Along the exact integer ray $2^k n$ with $n=100000$, the first hypothesis
gives a total possible downward change bounded by
$\sum_{k\ge0} 2/\sqrt{2^k n}=2/(\sqrt n(1-1/\sqrt2))$. Subtracting that
quantity from $f(100000)$ gives the displayed bound.

## Exact finite tests

[The probe](probe_dilations.cpp) generates the genuine sequence through
$10^6$ by counting unordered distinct-summand representations with
saturation at 2. It checks $qA(n)-A(qn)\le4\sqrt n$ by squaring only
positive deficits. This works as a sufficient finite test for the
second normalized estimate as well.

| Dilation $q$ | Tested range of $n$ | Maximum positive deficit divided by $\sqrt n$ |
| --- | --- | --- |
| 2 | 100000 through 500000 | $406/\sqrt{311997}$ |
| 3 | 100000 through 333333 | $506/\sqrt{122745}$ |

Both deficits are already positive at $n=100000$. Thus the exact
error-free lower estimates at dilations 2 and 3 fail. The tests give
no bound on the errors beyond the indicated ranges.

## Small-summand recurrence test

The same replay counts representations with a summand below 4096 for
targets in $[100000,10^6]$. It finds 187 accepted targets whose unique
representations use two summands at least 4096, and 2757 rejected targets
with exactly one small-summand representation. Each rejected target in
the latter group has an additional representation with two large
summands. These counts give both types of discrepancy that would need
control in an argument based on the finite set of shifts.

Controlling only the number of discrepancies is insufficient to prove
positivity or convergence from the finite-shift update. Put
$S=U\cap[1,4095]$ and consider

```math
b(n)=\mathbf1_{\{\sum_{s\in S} b(n-s)=1\}}.
```

The zero word and the periodic word with selected residues $0,5,134$
modulo 188 both obey this update. The latter is checked in
[the verifier](verify.py) by computing the sum at each of the 188
residues with the 382 shifts in $S$. Its density is $3/188$.

After any prescribed finite initial word, partition the remaining
positions into blocks with boundaries $T_j=2^{2^j}$ for all sufficiently
large $j$, and alternate the two update solutions on successive blocks.
At a position more than 4095 beyond the preceding boundary every term
needed for the update is in the same block. The resulting word has only
$O(\log\log N)$ discrepancies up to $N$. At the ends of successive
blocks the earlier positions form a vanishing fraction of the prefix,
since $T_j/T_{j+1}\to0$. The densities at those endpoints tend to 0 and
$3/188$ along alternate subsequences. Extending the prescribed word by
zeros gives density zero with only finitely many discrepancies, and
extending it by the periodic word gives positive density with only
finitely many discrepancies. These examples show why an approximation
argument needs information about the locations or effects of corrections.
