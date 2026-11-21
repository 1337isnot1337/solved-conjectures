# A weak-center-gain route and its raw-sample obstruction

Research note, 2026-11-21. Target and primary prior work are in the [Hazan–Livni audit](target-and-prior-audit.md). The greedy gain framework is standard in bicriteria clustering, including [Hsu–Telgarsky 2016](https://arxiv.org/abs/1607.06203). This note states the sufficient oracle and the exact point where a simple candidate construction fails. It does not supply that oracle or solve the prize problem.

## 1. Population improvement

Let $`D`$ be any distribution on the unit ball of $`\mathbb R^d`$. For a finite nonempty codebook $`C`$ in that ball, define

```math
R(C)=\mathbb E_D\mathop{\mathrm{dist}}(X,C)^2,
\qquad
G_C(c)=\mathbb E_D
\bigl(\mathop{\mathrm{dist}}(X,C)^2-\|X-c\|^2\bigr)_+.
```

Then adding one center gives the exact identity

```math
R(C\cup\{c\})=R(C)-G_C(c).                              \tag{1}
```

Let $`\mathrm{OPT}_k`$ be the infimum risk of a codebook of at most $`k`$ centers. Projection onto the unit ball does not increase squared distances to the data, so that restriction on comparator centers causes no loss. If

```math
R(C)>\mathrm{OPT}_k+\varepsilon,
```

then some $`c`$ in the unit ball satisfies

```math
G_C(c)>\varepsilon/k.                                   \tag{2}
```

To see this, choose a comparator codebook $`A=\{a_1,\ldots,a_k\}`$ with $`R(A)\lt R(C)-\varepsilon`$. Pointwise,

```math
\mathop{\mathrm{dist}}(x,C)^2-\mathop{\mathrm{dist}}(x,A)^2
\le\sum_{j=1}^k
\bigl(\mathop{\mathrm{dist}}(x,C)^2-\|x-a_j\|^2\bigr)_+.
```

Take expectations and average the $`k`$ gains. No assertion that the unknown comparator is efficiently recoverable is used in (2).

## 2. A precise sufficient computational step

Suppose there were an oracle with the following guarantee. Given $`C,k,\varepsilon`$, fresh i.i.d. samples, and a failure probability $`\eta`$, it outputs a center in the unit ball in polynomial time and with polynomial sample use. Whenever $`R(C)>\mathrm{OPT}_k+\varepsilon`$, its output has gain at least

```math
\gamma(k,d,\varepsilon)>0,
\qquad
\gamma^{-1}\le\mathop{\mathrm{poly}}(k,d,1/\varepsilon),     \tag{3}
```

with probability at least $`1-\eta`$. The lower gain bound must be independent of the current codebook's cardinality; runtime and sample use may depend polynomially on that cardinality. In particular, a gain bound that deteriorates as $`1/|C|`$ cannot simply be substituted into the following fixed-round argument.

Start with $`C_0=\{0\}`$, so $`R(C_0)\le1`$, and run

```math
T=\lfloor1/\gamma\rfloor+1
```

rounds, assigning each oracle call failure probability at most $`1/(6T)`$ and using independent new samples. Add every returned center. Conditional on the preceding history, the oracle guarantee applies to the current codebook, so a union bound makes all promised calls succeed with probability at least $`5/6`$.

On that event, the final risk is at most $`\mathrm{OPT}_k+\varepsilon`$. Otherwise monotonicity would imply that every intermediate risk exceeded the same threshold, and (1) would yield $`R(C_T)\le1-T\gamma<0`$, a contradiction.

There are at most $`T+1`$ reconstruction points. Encoding a nearest-center index therefore costs

```math
\lceil\log_2(T+1)\rceil
=O(\log k+\log d+\log(1/\varepsilon)).
```

In the regime $`k>d`$, this has the requested dependence. The total training, encoding, and decoding work is polynomial under the oracle premise. The codebook is learned and stored as part of the decoder; its description is not charged to every encoded point. This is a sufficient route to the first prize question, not a construction of the missing oracle.

### Sampling accuracy is not the missing step

For a fixed codebook $`C`$, every individual gain integrand lies in $`[0,4]`$. As a function of the candidate center it is 4-Lipschitz on the unit ball, since

```math
\bigl|\|x-c\|^2-\|x-c'\|^2\bigr|\le4\|c-c'\|.
```

A finite $`\tau`$-net of that ball, Hoeffding's inequality, and a union bound therefore give uniform empirical gain accuracy $`\xi`$ with

```math
O\!\left(\xi^{-2}
\left[d\log(1/\xi)+\log(1/\eta)\right]\right)
```

samples, after adjusting absolute constants and taking $`\tau`$ proportional to $`\xi`$. The net is used only to prove uniform convergence. Enumerating its $`(1/\xi)^{O(d)}`$ centers is not a polynomial-time algorithm in the desired parameters.

Thus an efficient, sufficiently accurate empirical gain optimizer would transfer statistically using fresh batches. The unresolved part is finding a center, not estimating the gain of centers once supplied.

## 3. Raw sample points fail exponentially

The simplest proposed candidate set consists of observed points, perhaps with the global zero center added. That restriction cannot meet the required code length uniformly.

Let $`d\ge2`$, take $`D_d`$ uniform on

```math
\left\{-\frac1{\sqrt d},\frac1{\sqrt d}\right\}^d,
```

and put $`C_0=\{0\}`$, $`k=d+1`$, and $`\varepsilon=1/(2d)`$. Every data point has norm 1, so $`R(C_0)=1`$. The two learned reconstruction points

```math
\frac{e_1}{\sqrt d},\qquad -\frac{e_1}{\sqrt d}
```

have risk exactly $`1-1/d`$, by reproducing the first coordinate perfectly and setting the others to zero. Therefore

```math
\mathrm{OPT}_{d+1}\le1-\frac1d.
```

For **every** possible raw sample point $`c`$, not just an average random candidate,

```math
G_{\{0\}}(c)
=\mathbb E\left(2\langle X,c\rangle-1\right)_+
\le\Pr\!\left\{\sum_{i=1}^d \zeta_i>d/2\right\}
\le e^{-d/8},                                          \tag{4}
```

where the $`\zeta_i`$ are independent uniform signs. The first bound uses that the integrand is at most 1 and is positive only on the displayed event; the second is Hoeffding's inequality.

For any set $`V`$ of $`M`$ raw cube vertices, the gain from adding the entire set is at most the sum of the individual gains:

```math
1-R(\{0\}\cup V)
\le\sum_{c\in V}G_{\{0\}}(c)
\le M e^{-d/8}.                                        \tag{5}
```

This is deterministic in $`V`$, so it also applies after any data-dependent selection of raw training examples. To attain even the required risk upper bound $`1-1/(2d)`$, such a codebook must have

```math
M\ge\frac{e^{d/8}}{2d}.
```

Its code length is consequently $`\Omega(d)`$. Since $`k=d+1`$ and $`1/\varepsilon=2d`$, this exceeds every fixed polynomial in $`\log k`$ and $`\log(1/\varepsilon)`$ as $`d\to\infty`$. Adding an arbitrary polynomial number of raw sample points cannot supply the oracle from Section 2 either.

This is **not** an impossibility for the paid target. Learned centers are explicitly permitted, and the two elementary centers displayed above already escape this example. The obstruction only rejects raw prototypes, including an adaptive choice of prototypes and the addition of a zero center. No novelty is claimed for this elementary limitation of sample-based candidate centers.

## 4. Exact stopping point

The cited Hsu–Telgarsky method obtains suitable candidates by enumerating averages of subsets; its exponent depends on inverse accuracy. The gain reduction above does not remove that enumeration, and the raw-point substitution fails by (4)-(5). No polynomial-time replacement with the guarantee (3), and no full impossibility result for learned decoders, has been proved here.

The unrestricted Hazan–Livni question remains unresolved by this work. The route is stopped at the missing efficient center-gain oracle; there is no numerical experiment or restricted-family result counted as a bounty completion.
