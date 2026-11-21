# Recovery after a long stochastic Collatz phase

Start Althöfer’s fair-sign chain at $s+2^{d+2}c$, where $s\in\{-1,1\}$, $c$ is a positive odd integer, and $d\ge1$. In this phase, each move reduces the exponent by one or two with equal probability, multiplies the coefficient by three, and preserves $s$. End the phase when the exponent first falls to two or one. Write $Y$ for its terminal integer. On the next $K$ moves let $V_i$ be the number of halvings on move $i$, and $G_K$ the number of pre-move states congruent to 3 or 5 modulo 8. The two literal transitions at 1 may be continued with fresh signs, both giving state 1. [Sponsor’s rules and €300 offer](https://althofer.de/collatz-prizes.html) · [Stopped-phase law](../bounty-continuation-2026-11-21/althofer-stochastic-phase/README.md)

**Theorem.** Put $K=\lfloor(\log_2 d)/9\rfloor$. As $d$ tends to infinity, the probability of the two events

```math
\sum_{i=1}^K V_i\ge 7K/4,
\qquad G_K\ge K/5
\tag{1}
```

tends to one, uniformly in $s,c$, even conditional on either type of phase exit. Consequently, with the same probability the chain hits 1 or its state after the window is at most $((10/3)2^{-7/4})^K Y$, a factor tending to zero. On a path avoiding 1 all states are at least 3, so each numerator is at most $10/3$ times its starting state. This gives the stated consequence by multiplication.

## The coefficient at exit

Let $S_t$ be a sum of $t$ independent uniform increments from $\{1,2\}$ and $T=\min\{t:S_t\ge d\}$. Then $Y=s+2^e3^Tc$, where $e=2$ on an exact hit and $e=1$ on an overshoot. The unnormalized masses of the two exit time laws are

```math
A_d(t)=2^{-t}\binom t{d-t},\qquad B_d(t)=2^{-t}\binom{t-1}{d-t}.
```

For the first event a partial sum equal to $d$ must be its first hit. For the second, the last step must be two from $d-1$. Both laws are unimodal. For $A_d$ the consecutive ratio is $(t+1)(d-t)/(2(2t-d+1)(2t-d+2))$ on its support; the numerator decreases there and the denominator increases. Also $B_d(t)=A_{d-1}(t-1)/2$, with $A_0(0)=1$. The atom bound for a binomial with $t\ge d/2$ trials shows that the peak is $O(d^{-1/2})$. This holds after conditioning as well, since both exit types have probability at least $1/4$ by the stopped-phase law.

For any such conditional law $\mu$, its total variation distance from a unit translate is its peak, by unimodality. On reducing modulo $m$, average over its first $m$ translates to obtain the uniform distribution. The distance of $T\bmod m$ from uniform is therefore at most $(m-1)\max_t\mu(t)/2$.

Set $h=3K$ and take $d$ large enough that $h-e\ge3$. Apply the estimate with $m$ the multiplicative order of 3 modulo $2^{h-e}$. Thus $Y\bmod 2^h$ is within $O(2^h/\sqrt d)$ in total variation of the uniform distribution on

```math
\{s+2^e c u\pmod{2^h}: u\in\langle 3\rangle \pmod{2^{h-e}}\}.
```

For $v\ge3$ the multiplicative order of 3 modulo $2^v$ is $2^{v-2}$. Indeed, $3^2-1=8$ and each subsequent squaring adds exactly one to the 2-adic valuation of the difference from 1. Hence the displayed set has $2^{h-e-2}$ elements. Its uniform distribution is bounded by $2^{e+1}\le8$ times the uniform distribution on all odd residues modulo $2^h$. The bound is uniform over the starting coefficient, including coefficients much larger than the starting phase height.

## A finite-residue estimate for future moves

Fix any sequence of $K$ future signs. For a uniform odd 2-adic starting point, the successive valuations are independent with $\Pr(V_i=v)=2^{-v}$ for $v\ge1$. Equivalently, for prescribed $v_1,\ldots,v_K$ with sum $w$, the start must lie in one odd residue class modulo $2^{w+1}$. To see this, invert each step on odd 2-adic integers as $x=(2^{v_i}x'-\epsilon_i)/3$. One prescribed step takes the odd output cylinder to a cylinder of relative mass $2^{-v_i}$, and iteration multiplies those masses.

If $w<h$, the corresponding valuation event is determined modulo $2^h$. Declaring all paths with total at least $h$ to be failures gives a test depending on $Y\bmod 2^h$ and the future signs alone. The event of exhausting the available bits is the complement of the union of the classes with $w<h$. Also $V_i\ge3$ implies that its pre-move state belongs to 3 or 5 modulo 8. It is therefore sufficient for (1) that the total be in $[7K/4,3K)$ and that at least $K/5$ valuations be at least three. This sufficient event is entirely determined by those finite data.

For independent geometric valuations the count at least three is binomial with parameters $K,1/4$. The generating function of one valuation is $z/(2-z)$ for $0<z<2$. Applying Markov’s inequality to the lower total, the upper total, and the lower binomial count, with $z=6/7,4/3,3/4$ respectively, bounds their combined failure probability by

```math
\left[\tfrac78(7/6)^{3/4}\right]^K+
(27/32)^K+
\left[\tfrac{15}{16}(4/3)^{1/5}\right]^K.
```

Each base is strictly below one. Multiply the sum by eight and add the exit-distribution error $O(2^h/\sqrt d)=O(d^{-1/6})$. The same bound works for each fixed future sign string, hence also for the independent fair signs in the sponsor’s chain. This proves (1).

## Typical contraction and visit frequency

Under the sponsor’s independent fair signs, the same window satisfies the sharper limits in probability

```math
K^{-1}\log_2(N_K/Y)\longrightarrow \log_2 3-2,
\qquad G_K/K\longrightarrow 1/2,
```

uniformly in $s,c$ conditional on either exit type. Here $N_K$ denotes the actual state $K$ moves after $Y$.

Indeed let $W_K=\sum V_i$ and $Q_K=\sum 1[V_i\ge3]$. Under the independent geometric reference law, $W_K/K\to 2$ and $Q_K/K\to 1/4$ in probability. The event $W_K\ge3K$ has vanishing probability. On its complement both statistics are determined by the finite residues above. Domination by eight times the reference law plus the vanishing modular error therefore gives the same limits for the actual chain. These two assertions even hold for fixed future signs.

For the visit frequency now use the fair sign choice. Given the history immediately before any move, the probability of $V_i\ge3$ is exactly one half when the current state belongs to 3 or 5 modulo 8, and zero otherwise. Hence $Q_K-G_K/2$ is a sum of bounded martingale differences. Its second moment conditional on the past at exit is at most $K/4$. Chebyshev’s inequality gives $(Q_K-G_K/2)/K\to0$ in probability, proving the visit-frequency limit.

Finally the exit time satisfies $T\ge d/2$, so $Y\ge 2\cdot 3^{d/2}-1$. Whenever $W_K<3K$, every state along the window is at least $Y2^{-3K}$, since $3u-1\ge u$ for positive $u$. This lower bound tends uniformly to infinity. In the exact logarithmic increment, each numerator contributes $\log_2(3\pm1/u)=\log_2 3+o(1)$ uniformly on this event. Subtracting $W_K/K$ gives the contraction limit.

The [necessary occupation bound on escape](README.md) requires an upper limiting visit frequency of about 0.1699. The limiting frequency $1/2$ exceeds that value during the recovery window. An entering phase of height $d+2$ can itself consume order $d$ moves, while this window has length of order $\log d$. A proof that the windows or other contracting portions occupy enough of an infinite trajectory is still missing.

The [exact checker](check_recovery.py) compares the stopped laws with the original renewal recursion, verifies the modular distribution bounds with rational arithmetic, and enumerates uniform odd residue classes for all sign strings of lengths one through five. Those checks audit the proof; the uniform limit follows from the estimates above.

```sh
python3 research/althofer-stochastic-collatz/check_recovery.py
```
