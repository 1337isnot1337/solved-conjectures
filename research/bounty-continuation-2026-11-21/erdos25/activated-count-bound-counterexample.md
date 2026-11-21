# Erdős 25: the proposed activated-count bound is false

21 November 2026. This note rejects an auxiliary estimate proposed during the Erdős 25 work. It does not refute Erdős 25, establish a new bounty result, or claim novelty for the classical sieve example. The [target audit](target-and-prior-audit.md) records the actual problem.

## 1. The estimate being tested

For a finite singleton system with distinct positive moduli $`q_1,\ldots,q_M`$ and residues $`a_i\bmod q_i`$, let

```math
B=\{n\ge1:\text{for some }i,\ n\ge q_i\text{ and }n\equiv a_i\pmod{q_i}\},
\qquad
U=\bigcup_{i=1}^{M}[a_i]_{q_i}.
```

Here $`U`$ is the completed union of cylinders in the profinite integers and $`\mu`$ is Haar probability measure. The proposed estimate was

```math
|B\cap[1,N]|\le N\mu(U)+M.                         \tag{1}
```

It is false even when all moduli are prime and all residues are zero. More generally, no fixed constant multiplying $`M`$ makes (1) valid for every such system and cutoff.

## 2. One exact finite certificate

Set $`N=10^6`$ and use every prime $`p\le1000`$ as a modulus, with residue zero. There are $`M=168`$ classes. Every positive multiple of $`p`$ already satisfies activation $`n\ge p`$.

Every composite at most $`N`$ has a prime divisor at most $`\sqrt N=1000`$. The only positive integers at most $`N`$ outside $`B`$ are therefore $`1`$ and the primes exceeding $`1000`$. The exact sieve counts give

```math
\pi(1000)=168,\qquad \pi(10^6)=78498,
\qquad
|B\cap[1,N]|=N-1-\pi(N)+\pi(1000)=921669.            \tag{2}
```

The Chinese remainder theorem gives

```math
1-\mu(U)=P:=\prod_{p\le1000}\left(1-\frac1p\right).
```

Integer cross-multiplication verifies

```math
1000\prod_{p\le1000}(p-1)>79\prod_{p\le1000}p,
\qquad\text{so}\qquad P>\frac{79}{1000}.           \tag{3}
```

Consequently the proposed right side satisfies

```math
N\mu(U)+M
<10^6\left(1-\frac{79}{1000}\right)+168
=921168
<921669.                                           \tag{4}
```

The [self-contained checker](check-activated-count-counterexample.py) verifies the small-prime list both by an exact sieve and by trial division, counts the deleted union directly, checks the composite-count identity, and performs the rational comparison (3). Its [JSON certificate](activated-count-counterexample.json) includes every modulus, the exact density fraction, and the positive cross-multiplication integer. No floating-point comparison is used.

## 3. No constant-times-class-count repair

This failure is uniform, rather than an isolated small cutoff. Let $`y`$ tend to infinity through positive integers, put $`N=y^2`$, and use all primes at most $`y`$, still with residue zero. Then

```math
|B\cap[1,N]|=N-1-\pi(N)+\pi(y),
\qquad
M=\pi(y),
\qquad
\mu(U)=1-P(y),
\quad
P(y)=\prod_{p\le y}\left(1-\frac1p\right).          \tag{5}
```

For any fixed real constant $`C`$,

```math
|B\cap[1,N]|-N\mu(U)-CM
=NP(y)-\pi(N)-1+(1-C)\pi(y).                       \tag{6}
```

Use the classical Mertens product theorem, stated and proved in [Tao's 2013 notes, Theorem 1](https://terrytao.wordpress.com/2013/12/11/mertens-theorems/), and the prime number theorem, stated in [Tao's 2021 notes, Theorem 1](https://terrytao.wordpress.com/2021/02/12/246b-notes-4-the-riemann-zeta-function-and-the-prime-number-theorem/). They give

```math
P(y)=\frac{e^{-\gamma}+o(1)}{\log y},
\qquad
\pi(N)=\frac{N}{\log N}(1+o(1)),
\qquad
\pi(y)=o\left(\frac{N}{\log N}\right).
```

Since $`\log y=(\log N)/2`$, (6) becomes

```math
|B\cap[1,N]|-N\mu(U)-CM
=\left(2e^{-\gamma}-1+o(1)\right)\frac{N}{\log N}. \tag{7}
```

The coefficient is positive. This can be checked without a decimal value of Euler's constant: the harmonic-integral comparison gives $`\gamma\lt H_5-\log5`$, while $`\log10>137/60=H_5`$, so $`\gamma<\log2`$. For the latter elementary inequality, the positive power series for $`\log((1+t)/(1-t))`$ gives $`\log2>56/81`$ and $`\log(5/4)>2/9`$, hence $`\log10>62/27>137/60`$.

Thus the left side of (7) is positive for all sufficiently large $`y`$, for every fixed $`C`$. A bound with error proportional only to the number of classes cannot provide the requested uniform short-prefix estimate.

## 4. The separate zeta comparison survives this example

The candidate comparison

```math
\sum_{n\in B}n^{-s}\le\zeta(s)\mu(U),\qquad s>1,   \tag{8}
```

remains unproved for arbitrary finite singleton systems. The counterexample above does not disprove it. In fact finite inclusion-exclusion, or the Euler product, gives exactly for this prime-modulus family

```math
\frac1{\zeta(s)}\sum_{n\in B}n^{-s}
=1-\prod_{p\le y}(1-p^{-s})
\le1-\prod_{p\le y}(1-p^{-1})
=\mu(U).                                          \tag{9}
```

Each factor inequality follows from $`s>1`$. This distinguishes the rejected cutoff count from the still-open weighted comparison. Neither (7) nor the special-case identity (9) resolves the full logarithmic-density question.
