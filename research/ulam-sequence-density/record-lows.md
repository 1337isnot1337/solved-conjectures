# Multiply represented sums at record-low density

Write $`A(x)=|U\cap[1,x]|`$ and let $`H(x)`$ count integers through $`x`$ with at least two representations as sums of distinct Ulam numbers. Call $`x`$ an integer record low if $`A(x)/x`$ is strictly below every earlier value. Dyadic record lows compare only powers of two.

## The record-low criterion

**Theorem.** If the lower natural density of the classical Ulam sequence is zero, there are infinitely many integer record lows and $`H(x)/A(x)\to\infty`$ along them. The same holds for the dyadic record lows. In particular, a bounded ratio along infinitely many record lows of either kind would prove **positive lower natural density**. Finitely many records of either kind also imply positive lower density.

Here is a quantitative form. Put $`D(K)=(32K)^{12K^2}`$. For an integer $`x\ge4`$, set $`m=\lfloor x/2\rfloor`$ and $`\rho=H(x)/A(x)`$. Whenever $`A(x)\le 2A(m)+1`$,

```math
\frac{A(x)}x\ge\frac{1}{8D(3+2\rho)}.
```

**Proof.** Let $`k=A(m)`$ and $`P_k=\{0,u_1,\ldots,u_k\}`$. Every distinct-summand pair from the prefix sums to at most $`x`$. There are precisely $`A(x)-2+H(x)`$ represented integers through $`x`$. Allowing zero and the diagonals adds at most $`k+3`$ values to the restricted prefix sumset. Thus its ordinary doubling constant satisfies

```math
K_k=\frac{|P_k+P_k|}{k+1}
\le 1+\frac{A(x)+H(x)}{k+1}
\le 3+2\rho .
```

The sum of the largest two prefix terms is uniquely represented in that prefix, so $`m\lt u_{k+1}\le u_k+u_{k-1}\lt2u_k`$. In particular $`x<4(u_k+1)`$. The prefix rectification bound gives $`u_k+1\le(k+1)D(K_k)`$, and $`k+1\le2A(x)`$. This proves the quantitative inequality. [Prefix rectification proof](sumset-doubling.md)

At an integer record $`A(x)/x\le k/m`$, hence $`A(x)\le 2k+k/m\le2k+1`$. At a dyadic record $`x=2^j`$, the previous power gives $`A(x)\le2A(x/2)`$. The integer record values decrease to the lower density if there are infinitely many. If the lower density is zero, the dyadic liminf is zero too, since $`A(2^j)/2^j\le2A(n)/n`$ for $`2^j\le n<2^{j+1}`$. The quantitative bound forces $`\rho\to\infty`$ along either sequence of records in this case. If the records terminate, their last ratio gives a positive lower bound at the sampled scales, and between two powers of two the density falls by at most a factor of two.

## A finite failure of the constant 10

Counting **every** target through 16,777,216 gives the first failure of $`H(x)\le10A(x)`$ at $`x=582954`$. This is an integer record low. There are 43,134 Ulam terms and 431,341 multiply represented integers there. Over the entire run the last integer record is at 1,722,075, where $`A(x)=127199`$ and $`H(x)=1273868`$. This also maximizes $`H/A`$ among the integer records in the run.

| Dyadic cutoff | Ulam terms | Multiply represented | New dyadic density minimum |
|---:|---:|---:|:---:|
| 524,288 | 38,865 | 388,002 | yes |
| 1,048,576 | 77,592 | 775,885 | yes |
| 2,097,152 | 155,161 | 1,551,375 | yes |
| 4,194,304 | 310,890 | 3,103,098 | no |
| 8,388,608 | 621,295 | 6,205,905 | no |
| 16,777,216 | 1,241,891 | 12,411,966 | no |

The finite run rules out one proposed constant at integer records. An absolute bound at an unbounded sequence of record lows, or a proof that records eventually terminate, remains missing. The natural-density limit also requires convergence.

## Exact replay

[The verifier](record_lows.cpp) computes the sequence by online polynomial multiplication. It uses the fact that the larger summand of $`a+b=t`$, with $`a<b`$, must already be known before $`t`$. It splits a dyadic block $`[l,r)`$ at its midpoint $`m`$, finishes the left half, adds its contributions to targets in the right half, then finishes the right half. A pair is counted where its larger summand and its target first lie in opposite halves, or directly in a common terminal block.

If $`l=0`$, the crossing pairs have both summands below $`m`$. Squaring the left polynomial, subtracting the diagonals and halving gives their counts. Otherwise dyadic alignment gives $`l\ge r-l`$. With $`b\in[l,m)`$ and $`t\in[m,r)`$, the other summand $`t-b`$ is less than $`r-l\le l`$. Multiplication by the already known prefix of length $`r-l`$ therefore counts each crossing pair once. Polynomial coefficients are packed as base-$`2^{32}`$ digits. Every ordered coefficient is at most the number of input positions, which is less than $`2^{32}`$ in this run. This is an application of the established technique of relaxed multiplication. [Van der Hoeven, *Relax, but Don’t Be Too Lazy*](https://www.texmacs.org/joris/relax/relax.pdf)

A direct pair sieve agrees on every count through 8,192. A second whole-prefix calculation squares the completed indicator polynomial and verifies the full restricted representation count and the membership decision at **every** integer through 16,777,216. All record comparisons use integer cross-products. Build with a C++20 compiler and GMP.

```sh
c++ -std=c++20 -O3 research/ulam-sequence-density/record_lows.cpp -lgmpxx -lgmp -o /tmp/ulam-record-lows
/tmp/ulam-record-lows
```

## What one phase distribution can certify

A possible way to bound gaps between represented integers uses pigeonholing. For a target $`t`$, compare eligible summands in an interval with the reflections $`t-a`$ of eligible partners. If the two sets together contain more entries than the interval length, they intersect. At the empirical frequency $`350477575/856371966`$, the replay measured membership conditional on phase in each half-open equal-width bin for $`4000000<n\le8000000`$. The most occupied bin in each partition contained the following fractions.

| Number of bins | Largest occupied fraction |
|---:|---:|
| 180 | 9,572 / 22,222 |
| 600 | 2,912 / 6,668 |
| 1,800 | 985 / 2,223 |
| 5,400 | 349 / 742 |

Every fraction is below one half. Two such marginal estimates give no positive lower bound on overlap by this argument. The frequency used for the computation is the published rational approximation. [Gibbs and McCranie](https://vixra.org/pdf/1711.0134v1.pdf)

There is an all-scale obstruction to inferring pair coverage from a single phase distribution. Fix an irrational $`\theta`$, a cutoff $`T\ge1`$, any prescribed subset of $`[1,T]`$, and any Riemann-integrable phase profile $`0\le f\le c`$ with $`0<c<1/2`$. Choose $`0<\eta<c/T`$ so that $`1,\theta,\eta`$ are rationally independent. Keep the prescribed prefix and select $`n>T`$ when

```math
0\lt\{n\eta\}\lt f(\{n\theta\}).
```

For each first-phase interval $`I`$, the frequency of selected positions with $`\{n\theta\}\in I`$, measured within any fixed arithmetic progression, equals $`\int_I f(x)\,dx`$. Indeed the two phases are jointly equidistributed on each progression. The region under the graph of $`f`$ over $`I`$ has boundary of area zero by Riemann integrability. Every selected position, including the prescribed prefix, has second phase in $`(0,c)`$. Pair sums have second phase in $`(0,2c)`$. Within the same progression, a set of relative density $`|I|(1-2c)`$ has first phase in $`I`$ and second phase above $`2c`$, so every one of those targets is unrepresented. [Kronecker equidistribution for tori](https://terrytao.wordpress.com/2010/03/28/254b-notes-1-equidistribution-of-polynomial-sequences-in-torii/)

The true parent relations exclude this particular obstruction when the second-phase restriction is imposed on the entire sequence. In fact, if all the phases of $`P_k`$ lift to an interval of length less than $`1/2`$, equal pair sums of lifts differ by an integer of absolute value less than one. The lifts therefore preserve all pair-sum equalities. The induction in the [prefix proof](sumset-doubling.md) gives $`z(u)=z(0)+u(z(1)-z(0))`$. For a fixed nonintegral frequency $`\eta`$, the lift interval must have length at least $`u_k\|\eta\|_{\mathbb R/\mathbb Z}`$. The model shows where a proof using one phase needs additional information about the actual Ulam recurrence.
