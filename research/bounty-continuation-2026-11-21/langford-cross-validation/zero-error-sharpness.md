# Sharpness of the zero-error unanimity moment

21 November 2026. This is a corollary of the [finite agreement counterexample](agreement-is-not-a-binomial-test.md), independently identified by the coordinator. It checks the attainable scale of the same cross-validation certificate. It is not a separate prize or a novelty claim.

## 1. The moment constant cannot be decreased uniformly

Use the counterexample's leave-one-out family: $`K=m`$, $`n=1`$, and $`p=c/K`$ for a fixed $`c>0`$. The learner chooses the first all-zero training coordinate among $`d`$ independent coordinates and otherwise chooses the constant-one classifier. On $`E_0`$, all fitted descriptions coincide, the observed errors are zero, and the true error equals $`p`$.

The exact formula in the counterexample gives, for each fixed finite $`d`$,

```math
\lim_{K\to\infty}K\,\mathbb E[\mathbf1_{E_0}R(h)]
=\frac{c}{1+c}
\left[1-\left(1-(1+c)e^{-c}\right)^d\right]. \tag{1}
```

For fixed $`c`$, taking finite $`d`$ sufficiently large makes the last factor arbitrarily close to one. Taking $`c`$ sufficiently large then makes $`c/(1+c)`$ arbitrarily close to one. These are successive choices of finite parameters, followed by sufficiently large finite $`K`$. No infinite-dimensional feature distribution is needed.

Consequently, for every $`\eta>0`$, this family contains arbitrarily large finite problems satisfying

```math
K\,\mathbb E[\mathbf1_{E_0}R(h)]>1-\eta.
```

The coefficient one in the universal zero-error bound

```math
\mathbb E[\mathbf1_{E_0}R(h)]\le\frac1{K+1}
```

is asymptotically sharp.

## 2. A necessary confidence constant

Fix $`\delta\in(0,1)`$. Suppose a proposed distribution-free certificate reports an upper endpoint asymptotic to $`a(\delta)/K`$ whenever it observes zero errors and unanimous leave-one-out models. If

```math
a(\delta)<\frac1\delta-1,
```

choose $`c`$ strictly between these two values. The counterexample has true risk $`c/K`$ on $`E_0`$. Its agreement probability tends, as $`K\to\infty`$ and then $`d`$ is made sufficiently large, to a number arbitrarily close to $`1/(1+c)>\delta`$. More precisely, choose a sufficiently large finite $`d`$ first, using the limiting formula; the resulting strict inequality persists for all sufficiently large $`K`$.

The proposed endpoint is below $`c/K`$ on this event, and its failure probability exceeds $`\delta`$. Therefore every endpoint of the stated universal form must satisfy

```math
a(\delta)\ge\frac1\delta-1. \tag{2}
```

The proved endpoint $`1/((K+1)\delta)`$ has limiting coefficient $`1/\delta`$, within a factor $`1/(1-\delta)`$ of (2). This concerns endpoints determined by the zero-error unanimity information and the sample size; it does not preclude a different procedure that uses further special structure of a particular supplied learner or distribution.
