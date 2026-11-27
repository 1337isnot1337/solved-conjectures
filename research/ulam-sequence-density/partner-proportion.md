# A density test using eligible partners

For a cutoff $`N`$ count the pairs $`(a,b)`$ for which $`a`$ is an Ulam term, $`a<b`$ and $`a+b\le N`$. The number $`T(N)`$ of such pairs and the fraction $`P(N)`$ for which $`b`$ is also an Ulam term are

```math
T(N)=\sum_{2a\lt N,\,a\in U}(N-2a)
    =\sum_{n\le N}h(n),\qquad
h(n)=A(\lfloor(n-1)/2\rfloor),\qquad P(N)=\frac{B(N)}{T(N)}.
```

Here $`B(N)=\sum_{n\le N}r(n)`$ counts the successful pairs. In particular $`0\le P(N)\le1`$, and for the classical sequence $`T(N)>0`$ for $`N\ge3`$.

**Theorem.** If $`P(N)\to p`$ then the natural density exists and equals $`p`$, including when $`p=0`$. Conversely, positive natural density $`\delta`$ implies $`P(N)\to\delta`$. Thus convergence of the eligible-partner fraction to a positive number is equivalent to the full positive natural-density claim. These implications hold for any nonempty set of positive integers.

**Proof.** Use $`F(s)=\sum_{u\in U}e^{-su}`$, $`G(s)=\sum r(n)e^{-sn}`$, and put $`f(s)=sF(s)`$. Summing the eligible pairs first over $`n>2a`$ gives

```math
\sum_{n\ge1}h(n)e^{-sn}=\frac{F(2s)}{e^s-1}.
```

If $`B(N)/T(N)\to p`$, the same limit holds for the ratio of the exponential sums of their increments. Indeed that ratio is also $`\sum B(N)e^{-sN}/\sum T(N)e^{-sN}`$, by summation of the geometric tails. For $`s\downarrow0`$ the denominator tends to infinity. The initial finite part has vanishing weight, and the remaining ratios lie arbitrarily close to $`p`$. With $`2G(s)=F(s)^2-F(2s)`$ this proves

```math
\frac{f(s)^2}{f(2s)}\ \longrightarrow\ p.
```

If $`p=0`$, the bound $`f(2s)\le1`$ gives $`f(s)\to0`$. For $`p>0`$, take $`0<\epsilon<p`$. The displayed ratio lies between $`p-\epsilon`$ and $`p+\epsilon`$ for $`s<s_0`$. Choose $`k`$ so that $`s_0\le 2^ks<2s_0`$. Iterating square roots gives

```math
(p-\epsilon)^{1-2^{-k}} f(2^ks)^{2^{-k}}
\le f(s)\le
(p+\epsilon)^{1-2^{-k}} f(2^ks)^{2^{-k}}.
```

On $`[s_0,2s_0]`$ the positive continuous function $`f`$ is bounded above and away from zero. Hence $`f(2^ks)^{2^{-k}}\to1`$ as $`s\downarrow0`$. Letting $`\epsilon\downarrow0`$ proves $`f(s)\to p`$. The moment argument in the [pair-count proof](pair-counts.md) now gives $`A(N)/N\to p`$. Conversely, if the natural density is $`\delta>0`$, that proof gives $`B(N)/N^2\to\delta^2/4`$. Summing $`h(n)=\delta n/2+o(n)`$ gives $`T(N)/N^2\to\delta/4`$, so their ratio tends to $`\delta`$.

## Positive lower density at records

At an integer record low $`N\ge3`$, put $`d=A(N)/N`$. Every $`m\le N`$ satisfies $`A(m)\ge dm`$, so

```math
T(N)\ge d\sum_{n=1}^N\lfloor(n-1)/2\rfloor
=d\lfloor(N-1)^2/4\rfloor .
```

Since $`B(N)\le A(N)(A(N)-1)/2`$, a fraction $`P(N)\ge c`$ implies

```math
\frac{A(N)}N
\ge \frac1N+\frac{2c}{N^2}\lfloor(N-1)^2/4\rfloor.
```

In particular a bound $`P(N)\ge c>0`$ on infinitely many integer record lows gives lower density at least $`c/2`$. Also, if the lower density is positive then $`P(N)`$ is bounded away from zero at all large cutoffs, since $`B(N)\ge\binom{A(\lfloor N/2\rfloor)}2`$ and $`T(N)\le N^2`$. If the lower density is zero, the record inequality forces $`P(N)\to0`$ along the integer records.

For positive **upper** density it would suffice to find a positive upper proportion of exponents $`j`$ with $`P(2^j)\ge c>0`$. To see this, put $`a_j=A(2^j)`$. Each smaller summand through $`2^{j-2}`$ contributes at least $`2^{j-1}`$ eligible pairs, so $`P(2^j)\le(a_j/2^j)(a_j/a_{j-2})`$ for $`j\ge2`$. Under zero natural density, any such exponents would have $`a_j/a_{j-2}\to\infty`$. Yet $`\prod_{j=2}^J(a_j/a_{j-2})=a_Ja_{J-1}/(a_0a_1)\le4^J`$. For each $`M>1`$ at most $`J\log4/\log M`$ of these factors can exceed $`M`$. Letting $`M`$ increase gives upper proportion zero.

| $`N`$ | Successful pairs $`B(N)`$ | Eligible pairs $`T(N)`$ | $`P(N)`$ |
|---:|---:|---:|---:|
| 65,536 | 6,528,918 | 85,974,164 | 0.07594047 |
| 262,144 | 97,190,325 | 1,312,249,656 | 0.07406390 |
| 732,377 | 739,505,811 | 10,031,984,330 | 0.07371481 |
| 1,048,576 | 1,511,448,512 | 20,480,131,626 | 0.07380072 |
| 4,194,304 | 24,109,330,932 | 325,485,614,160 | 0.07407188 |
| 16,777,216 | 385,780,017,641 | 5,211,990,215,818 | 0.07401779 |

The first integer density record with $`P(N)<37/500`$ is 343,546. At every record through 16,777,216 the exact fraction exceeds $`7/95`$. If this last inequality held along unbounded integer records, it would give lower density at least $`7/190`$. The existence of a positive limit of $`P(N)`$ remains open. [Exact verifier](record_lows.cpp)

## A restriction on a proof by monotonicity

Assume the classical Ulam sequence has positive natural density $`\delta`$. At every selected $`n>2`$ the increment of $`B`$ is exactly one, so

```math
P(n)-P(n-1)=\frac{1-P(n-1)h(n)}{T(n)}
            =-\frac{2\delta+o(1)}{n}
```

along large selected terms. Here $`P(n-1)\to\delta`$, $`h(n)\sim\delta n/2`$ and $`T(n)\sim\delta n^2/4`$. Partial summation gives $`\sum_{u\le N,\,u\in U}1/u\sim\delta\log N`$. The selected terms alone therefore supply negative variation $`(2\delta^2+o(1))\log N`$. The total positive variation differs from the total negative variation by at most one because $`P`$ stays in $`[0,1]`$. Consequently

```math
\liminf_{N\to\infty}\frac{1}{\log N}
\sum_{n=4}^{N}|P(n)-P(n-1)|\ge4\delta^2 .
```

In particular, a proof that $`P`$ is eventually monotone or has finite total variation would imply **zero** natural density. The positive-density route must allow cancellation between increases and decreases in the partner fraction.
