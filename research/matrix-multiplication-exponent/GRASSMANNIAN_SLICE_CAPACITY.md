# Which Grassmannian source parameters survive the slice-cover test

Research status: the counting estimates and their source-capacity consequences below are proved. They exclude the classical balanced Grassmannian Frobenius source at the stated budgets. They leave the sparse exterior-degree regime open. They do not prove a lower bound for the matrix multiplication exponent.

This note applies the linear-algebra capacity bound in [SLICE_COVER_TARGET_CAPACITY.md](SLICE_COVER_TARGET_CAPACITY.md) to the four-party tensor constructed in [GRASSMANNIAN_FROBENIUS_SOURCE.md](GRASSMANNIAN_FROBENIUS_SOURCE.md). No geometric theorem is needed for the counting argument.

## 1. The exact degree cover

Fix $`1\le k<s`$, and write

```math
p=\binom sk,\qquad d=k(s-k),\qquad
D_{s,k}=\#\{\lambda\subseteq k\times(s-k):|\lambda|\le d/3\}.
                                                               \tag{1}
```

The coefficient $`\tau_0(s_\lambda s_\mu s_\nu s_\rho)`$ is zero unless

```math
|\lambda|+|\mu|+|\nu|+|\rho|=d.                            \tag{2}
```

Every nonzero term therefore has at least one of its A, B, C labels of degree at most $`d/3`$. The span of the low-degree Schur basis vectors, used at each of those three parties, gives a three-space slice cover with dimensions $`D_{s,k},D_{s,k},D_{s,k}`$. D is unrestricted.

After adjoining $`W_{AD}(N)W_{BD}(N)W_{CD}(Q)`$, and allowing $`r`$ independently mapped source copies, the capacity theorem gives

```math
\mathop{\mathrm{rank}}L
 \le rD_{s,k}Q+2prD_{s,k}\frac NM                         \tag{3}
```

for a C-compressed target

```math
T_L=\sum_{i,j=1}^p\sum_{a=1}^M
 A_{ia}\otimes B_{ja}\otimes L(C_{ij})\otimes D_{ij}.
```

For a support-correct weighted partial target retaining a fraction $`\rho`$ of the $`p^2M`$ target entries, the same theorem gives

```math
\rho\le\frac{rD_{s,k}Q}{p^2}
       +\frac{2rD_{s,k}N}{pM}.                           \tag{4}
```

These bounds allow arbitrary local changes of basis, independently chosen C maps, and coefficientwise limits of complete output tensors. The degree cover is a property of the source; the output maps need not preserve its grading.

## 2. A finite lower-tail estimate

The standard subset parametrization

```math
I_\lambda=\{\lambda_{k+1-a}+a-1:1\le a\le k\}
 \subseteq\{0,\ldots,s-1\}
```

has

```math
|\lambda|=\sum_{i\in I_\lambda}i-\frac{k(k-1)}2.
```

Let

```math
a_i=i-\frac{s-1}2,\qquad
\Delta=\frac{k(s-k)}6.
```

Then $`|\lambda|\le d/3`$ is equivalent to

```math
\sum_{i\in I_\lambda}a_i\le-\Delta.                      \tag{5}
```

Take independent Bernoulli random variables $`X_i`$ with parameter $`k/s`$. Conditional on $`\sum_iX_i=k`$, their support is a uniformly random k-subset. The binomial probability of $`k`$ is at least $`1/(s+1)`$: $`k`$ is a mode of this binomial distribution, and its $`s+1`$ probabilities sum to one.

For completeness, a centered random variable supported in an interval of length $`c`$ has logarithmic moment-generating function at most $`t^2c^2/8`$. Indeed the second derivative of that function is a variance under the exponentially tilted distribution, at most $`c^2/4`$; its value and first derivative vanish at zero. Applying this to $`a_i(X_i-k/s)`$, and using $`\sum_i a_i=0`$, gives

```math
\mathbb E\exp\!\left(-t\sum_i a_iX_i\right)
 \le\exp\!\left(\frac{t^2}{8}\sum_i a_i^2\right),
\qquad
\sum_{i=0}^{s-1}a_i^2=\frac{s(s^2-1)}{12}.
```

Exponential Markov inequality, optimized at
$`t=4\Delta/\sum_i a_i^2`$, yields

```math
\Pr\!\left(\sum_i a_iX_i\le-\Delta\right)
 \le \exp\!\left(-\frac{2\Delta^2}{\sum_i a_i^2}\right)
 =\exp\!\left(-\frac{2k^2(s-k)^2}{3s(s^2-1)}\right).
```

Conditioning can enlarge this probability by at most $`s+1`$. Consequently

```math
\frac{D_{s,k}}p
 \le (s+1)
 \exp\!\left(-\frac{2k^2(s-k)^2}{3s(s^2-1)}\right).
                                                               \tag{6}
```

## 3. Balanced and proportional exterior degree

For $`s=2k`$, one can omit the conditioning prefactor by counting all $`2^{2k}`$ Bernoulli supports with parameter $`1/2`$. Every counted k-subset satisfying (5) is one of these supports. Thus

```math
D_{2k,k}
 \le4^k\exp\!\left(-\frac{k^3}{3(4k^2-1)}\right)
 \le4^k e^{-k/12}.                                      \tag{7}
```

The elementary central-binomial estimates

```math
\frac{4^k}{2k+1}\le p=\binom{2k}{k}\le4^k
```

then give

```math
D_{2k,k}\le p^{1-\delta+o(1)},\qquad
\delta=\frac{1}{12\log4}>0.                              \tag{8}
```

All logarithms in this note are natural logarithms. Under the proposed budgets

```math
Q=p^{1+o(1)},\qquad r=p^{o(1)},\qquad N/M=p^{o(1)},
```

equations (3)--(4) imply

```math
\mathop{\mathrm{rank}}L\le p^{2-\delta+o(1)},\qquad
\rho\le p^{-\delta+o(1)}.                                \tag{9}
```

This misses both sufficient target conditions, namely rank $`p^{2-o(1)}`$ for a C compression and density $`p^{-o(1)}`$ for a partial target. The entire classical balanced Grassmannian source is therefore excluded for these conversions, not merely a particular proposed formula.

More generally, if $`k/s\to\theta\in(0,1)`$, Stirling's formula and (6) give

```math
D_{s,k}\le p^{1-\delta_\theta+o(1)},\qquad
\delta_\theta=
\frac{2\theta^2(1-\theta)^2}{3h(\theta)},\qquad
h(\theta)=-\theta\log\theta-(1-\theta)\log(1-\theta).
                                                               \tag{10}
```

The same source exclusion holds, with $`\delta_\theta`$ in place of $`\delta`$. Equation (8) agrees with (10) at $`\theta=1/2`$.

## 4. The sparse regime has no fixed deficit from this cover

There is a useful finite lower bound in the opposite direction:

```math
D_{s,k}\ge 3^{-k}\binom sk=3^{-k}p.                      \tag{11}
```

To prove it, set

```math
m=\left\lfloor\frac{s+2k}{3}\right\rfloor.
```

Every k-subset of $`\{0,\ldots,m-1\}`$ has partition area at most
$`k(m-k)\le k(s-k)/3`$, so $`D_{s,k}\ge\binom mk`$.
Moreover $`3m-s\ge2k-2`$. Therefore, for $`0\le j<k`$,

```math
\frac{m-j}{s-j}\ge\frac13,
```

and multiplying the k factors proves (11).

In particular, if $`k\to\infty`$ and $`\log k=o(\log s)`$, then

```math
\log p=k\log(s/k)+O(k),\qquad
D_{s,k}=p^{1-o(1)}.                                    \tag{12}
```

Thus this particular degree cover cannot produce a fixed exponent loss in the sparse regime. This does not prove that the source supplies a useful target, and it does not rule out a different stronger cover.

## 5. The parameter-zero scope

The cover in Section 1 concerns the special tensor $`\mathcal F_0`$. For nonzero $`\kappa`$, quantum-wrap terms of degrees $`d+s\ell`$ occur in $`\mathcal F_\kappa`$. The argument does not assert the same low-degree cover for those tensors.

Likewise, a simultaneous construction that retains $`\mathcal F_{\kappa(t)}`$ and amplifies its higher-order coefficients by singular local maps need not factor through $`\mathcal F_0`$. It is not excluded by (9). Such a construction must still satisfy the complete coupled source equation, including the actual D algebra coordinate. No such trade is established here.
