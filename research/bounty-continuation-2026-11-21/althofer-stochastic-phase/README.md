# Stochastic Collatz: phase anti-concentration and its uniformity obstruction

21 November 2026. This is an exact analysis of a proposed route to Althöfer's stochastic prize. It does not prove absorption or refute the conjecture. No bounty is completed.

The [sponsor's Prize 0](https://althofer.de/collatz-prizes.html), updated 5 November 2026, still offers €300 for the first proof that independent fair choices between odd(3n-1) and odd(3n+1) reach 1 almost surely from every positive odd start. The standing campaign is [issue 220](https://github.com/1337isnot1337/solved-conjectures/issues/220). Its existing note already proves almost-sure visits to the good residue classes 3 and 5 modulo 8 and a logarithmic expected hitting-time bound; it does not prove enough visit frequency for absorption.

The new calculation below checks the suggested mechanism that random phase lengths might prevent successive long runs in the other two odd residue classes. There is useful anti-concentration, but a coefficient-dependent term is necessary. An explicit family shows why a uniform bound in the phase height alone is false.

## Exact stopped phase

Write a bad state as

```math
n=\sigma+2^h c,\qquad \sigma\in\{-1,1\},\quad
h\ge3,\quad c\ge1\text{ odd},
```

and put d=h-2. While the height remains at least three, the two choices replace the pair (h,c) by (h-1,3c) or (h-2,3c), with equal probabilities. Let J_i be independent and uniform on {1,2}, let S_t be their partial sums, and set

```math
T=\mathop{\mathrm{min}}\{t:S_t\ge d\}.
```

The terminal state is

```math
Y=\sigma+2^{h-S_T}3^T c.
```

An exact hit S_T=d leaves height two and lands in a good residue class. An overshoot S_T=d+1 leaves an exponent one relative to the old sign. After re-encoding the sign, its new height is

```math
h_{\rm next}=1+v_2(3^T c+\sigma).
\tag{1}
```

Here h_next is the height of the state after this one stopped phase. It is not the time of the next visit to a good residue class. On an exact hit define h_next=2.

## Overshoot duration distribution

The exact joint mass of duration t and overshoot is

```math
b_d(t):=\Pr(T=t,S_T=d+1)
=2^{-t}\binom{t-1}{d-t},
\tag{2}
```

with support ceil((d+1)/2)<=t<=d. Indeed, the last increment must be two, and the preceding t-1 increments must sum to d-1, so exactly d-t of them equal two.

The already established exact-hit probability gives

```math
a_d:=\sum_t b_d(t)
=\frac13-\frac13(-1/2)^d,
\qquad \frac14\le a_d\le\frac12.
\tag{3}
```

Write p_d^*=max_t b_d(t). The distribution is unimodal: for consecutive positive terms,

```math
\frac{b_d(t+1)}{b_d(t)}
=\frac{t(d-t)}{2(2t-d)(2t-d+1)},
```

whose numerator decreases and denominator increases on the support. The elementary central-binomial estimate

```math
2^{-m}\mathop{\mathrm{max}}_j\binom mj\le\frac1{\sqrt{m+1}}
```

therefore also gives the pointwise bound

```math
p_d^*\le\frac1{\sqrt{2d}}.
\tag{4}
```

For completeness, the central-binomial estimate follows by induction for even m: the ratio of consecutive central probabilities is (2k+1)/(2k+2), and (2k+1)(2k+3)<(2k+2)^2. The intervening odd case follows from the adjacent even case. Applying it with m=t-1 gives b_d(t)<=1/(2 sqrt(t)); the support has t>=d/2.

## Arithmetic progression anti-concentration

For any finite unimodal nonnegative sequence b, total mass a, maximum p, modulus M>=1, and residue j,

```math
\sum_{t\equiv j\pmod M}b(t)\le\frac aM+p.
\tag{5}
```

One proof writes b(t) as the integral of the indicators of its superlevel sets. Each nonempty superlevel set is an interval of integers. Its intersection with one residue class has size at most its length divided by M, plus one. Integrating proves (5).

For k>=3, the order of 3 modulo 2^k is 2^(k-2). Because c is odd, the congruence

```math
3^t c\equiv-\sigma\pmod{2^k}
```

is either insoluble or specifies one residue class of t modulo 2^(k-2). Equations (1)–(5) thus imply, for H>=4,

```math
\Pr(h_{\rm next}\ge H)
\le \frac{a_d}{2^{H-3}}+p_d^*
\le 2^{2-H}+\frac1{\sqrt{2d}}.
\tag{6}
```

This is an exponential term plus a point-mass term. Replacing the right side by only its exponential term is invalid. The random duration has a finite interval of possible values, so it cannot be equidistributed modulo arbitrary powers of two.

Set

```math
M=\left\lceil\mathop{\mathrm{log}}_2(3^d c+1)\right\rceil+1.
```

Equation (1) gives h_next<=M. Summing (6), and bounding the H=3 tail by a_d<=1/2, yields

```math
\mathbb E h_{\rm next}
\le 3+M p_d^*
\le 3+\frac{M}{\sqrt{2d}}.
\tag{7}
```

In particular, this calculation retains a term of order log(c)/sqrt(d), in addition to a term of order sqrt(d). The coefficient c is not controlled by the starting phase height h.

## Explicit arbitrarily long next phases

Fix any d>=1 and any t_0 in the support of (2). For any positive integer L choose

```math
H=1+2\cdot3^{t_0-1}L,
\qquad
c=\frac{2^{H-1}-1}{3^{t_0}},
\qquad
n=1+2^{d+2}c.
\tag{8}
```

The coefficient c is a positive odd integer. Divisibility follows from

```math
3^{t_0}\mid 2^{2\cdot3^{t_0-1}}-1,
```

which follows inductively by cubing a number congruent to one modulo a power of three; multiplying the exponent by L preserves divisibility.

On the event T=t_0 with overshoot, the phase endpoint is exactly

```math
Y=1+2\cdot3^{t_0}c=2^H-1.
```

Its next sign is -1 and its next bad height is exactly H. Therefore

```math
\Pr(h_{\rm next}=H)\ge b_d(t_0)>0,
\qquad
\mathbb E h_{\rm next}\ge b_d(t_0)H.
\tag{9}
```

The initial height h=d+2 stays fixed while L, H and c tend to infinity. Thus

```math
\sup_{c\text{ odd}}\mathbb E h_{\rm next}=\infty
\qquad\text{for each fixed }h\ge3.
\tag{10}
```

There is not even a uniformly vanishing tail in H when c is allowed to vary with H.

The simplest example takes d=t_0=1. For any odd H>=3, c=(2^(H-1)-1)/3 is odd, and the height-three state n=8c+1 has the child 2^H-1 with probability one half. This is an exact identity for an infinite family, not a finite numerical pattern.

### The point-mass term has the right scale

One can choose t_0 with

```math
b_d(t_0)\ge\frac1{50\sqrt d}.
\tag{11}
```

Here is a direct bound, without a limit theorem. The stopped martingale

```math
M_T=S_T-\frac32T
```

has second moment E(M_T^2)=E(T)/4<=d/4 because T<=d. Put Delta=S_T-d in {0,1}. Then

```math
\mathbb E\left(T-\frac23d\right)^2
=\frac49\mathbb E(\Delta-M_T)^2
\le\frac{2d+8}{9}.
```

Markov's inequality gives probability at most 5/72 of lying outside the interval |T-2d/3|<=4 sqrt(d). Overshoot has probability at least 1/4, so at least 13/72 of its mass lies in that interval. The interval contains at most 9 sqrt(d) integers. Its largest overshoot atom is therefore at least 13/(648 sqrt(d)), which is greater than the bound in (11).

Combining (8)–(11), and observing that log_2(c)=H-1-t_0 log_2(3)+o(1) as L grows, shows that a term of order log(c)/sqrt(d) cannot in general be removed from this anti-concentration estimate.

## Consequence for hitting times and the precise remaining gap

From 2^H-1, every move before the height drops below three remains in a bad residue class. Each move lowers that height by at most two. Consequently, on the event in (9), the original chain needs at least ceil((H-2)/2) further moves before its next good-class visit. Expected time to a good class therefore cannot be bounded by a function of the initial bad height h alone.

This is compatible with the earlier O(log(n+1)) expected hitting-time theorem: the initial integer in (8) itself has logarithm of order H. It is also compatible with almost-sure absorption. Every constructed start is finite, and the exceptional event has a fixed positive probability rather than probability one.

The phase-duration distribution does suppress long congruence conditions down to its largest atom. It does not control the size of an exceptionally long successor phase at that atom. A recurrence proof would need an additional argument tracking c, showing that such arithmetic alignments cannot dominate time along a trajectory from one fixed integer, or using a different Lyapunov function. No such uniform argument has been proved here. This stops the proposed phase anti-concentration route at an explicit obstruction; it does not infer recurrence from averaged residue behavior.

The accompanying checker verifies the overshoot mass formula against an independent stopped-walk dynamic program, checks the finite arithmetic-progression inequality in exact rational arithmetic, and verifies examples of the symbolic family (8) with literal signed Collatz transitions. Those checks test the formulas. They do not verify the conjecture on a numerical range or replace the all-parameter arguments above.

The coordinator independently reviewed the all-parameter argument and replayed the checker. It passed 60 renewal-depth comparisons, 9,180 exact arithmetic-progression checks, and 40 literal checks of the constructed transition family. The saved JSON records these checks, not a solved-conjecture count.
