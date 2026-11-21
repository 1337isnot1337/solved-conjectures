# Erdős 389: prime-gap and smoothness obstructions

Coordination: [issue #232](https://github.com/1337isnot1337/solved-conjectures/issues/232).

Status, 21 November 2026: research reductions only. No solution of the general existence problem, Lean certificate, bounty submission, or payment is claimed. The elementary deductions below are proved here; novelty is not established.

## Target and prior work

The [original target](https://www.erdosproblems.com/389) asks whether, for every integer `n >= 1`, there is an integer `k >= 1` such that

```math
\prod_{i=0}^{k-1}(n+i)\ \bigm|\ \prod_{i=0}^{k-1}(n+k+i).
\tag{1}
```

The Conjectures.io [pool history](https://conjectures.io/problems/changes) lists this target among the additions of 13 November 2026. The published task metadata gives:

```text
fc-v2-erdos389-erdos-389-842151f82cf67b7061d4a96c-formalized
theorem: Erdos389.erdos_389
source type SHA-256: 78b18b4d5320ca25a82c1c986a77eea8ef5236d3a7dd8c87781767d8d86548ad
```

The individual live detail page could not be retrieved in this follow-up, so this note does not assert a current unclaimed amount. No submission is ready in any event.

Maciej Ulas, *A note on Erdős–Straus and Erdős–Graham divisibility problems*, International Journal of Number Theory 9 (2013), 583–599, DOI [10.1142/S1793042112501497](https://doi.org/10.1142/S1793042112501497), studies precisely this question with its starting integer shifted by one. The [author manuscript](https://www.academia.edu/48555588/A_Note_on_Erd%C5%91s_Straus_and_Erd%C5%91s_Graham_Divisibility_Problems_With_an_Appendix_by_Andrzej_Schinzel_) was read. Theorem 2.1 gives the equivalent digit-sum criterion; Theorem 2.2 proves infinitely many witnesses for the first two nontrivial starting values. Neither settles all `n`. The paper's finite tables are prior work.

## Factorial form

Put `s = n-1` and `t = s+k`. Then (1) is equivalent to integrality of the positive rational number

```math
Q_s(t)=\frac{s!(2t-s)!}{(t!)^2}
      =\frac{\binom{2t}{t}}{\binom{2t}{s}},
\qquad t>s.
\tag{2}
```

For every prime `p`, Legendre's formula gives the exact finite sum

```math
v_p(Q_s(t))
=\sum_{a\ge1}\left(
\left\lfloor\frac{s}{p^a}\right\rfloor
+\left\lfloor\frac{2t-s}{p^a}\right\rfloor
-2\left\lfloor\frac{t}{p^a}\right\rfloor
\right).
\tag{3}
```

In base-`p` digit-sum notation this is

```math
v_p(Q_s(t))
=\frac{2s_p(t)-s_p(2t-s)-s_p(s)}{p-1}.
\tag{4}
```

Equations (3) and (4) are the standard valuation reduction, already present in Ulas's work.

## A necessary prime gap

Suppose `s >= 1`, `t = s+k >= 8`, and `Q_s(t)` is an integer. Let `P` be the largest prime at most `t` and set `g(t)=t-P`. Then

```math
g(t)\ge\mathop{\mathrm{min}}\{k,s/2\}.
\tag{5}
```

### Proof

Bertrand's postulate gives `P > t/2`, so `P^2 > 2t-s` when `t >= 8`. Suppose that `g(t) < k` and `g(t) < s/2`. The first inequality gives `P > s`; the second gives `2P > 2t-s`. Since `P <= t < 2t-s`, formula (3) has only the first-power contribution and yields

```math
v_P(Q_s(t))=0+1-2=-1,
```

which contradicts integrality. This proves (5).

This is a necessary condition, not an existence argument. In particular, a long prime gap before `t` does not ensure that all other valuations are nonnegative.

## A lower bound on the block length

Every solution of (1), including `n=1`, satisfies

```math
k>\sqrt{n\mathop{\mathrm{log}} 2}.
\tag{6}
```

Indeed,

```math
Q_s(t)=\prod_{i=0}^{k-1}\left(1+\frac{k}{n+i}\right)>1.
```

If it is integral, it is at least 2. Using `log(1+x)<x` for `x>0`,

```math
\mathop{\mathrm{log}} 2\le\mathop{\mathrm{log}} Q_s(t)
<\sum_{i=0}^{k-1}\frac{k}{n+i}
\le\frac{k^2}{n}.
```

This gives (6).

One must not infer from (5) that all solutions have large `k/n`. There are two possible regimes: `k` may be small enough that the excluded prime interval has length `k`, or `k` may be much larger and the interval has length `(n-1)/2`. An argument that uses only the second regime would miss possible short witnesses.

## A necessary smooth block

Suppose `Q_s(t)` is integral and `s >= 1`. Let

```math
Y=\mathop{\mathrm{max}}\{s,\sqrt{2t-s}\}.
```

Then every prime divisor of each integer

```math
t-j,\qquad 0\le j\le\left\lfloor\frac{s-1}{2}\right\rfloor,
\tag{7}
```

is at most `Y`.

### Proof

Suppose a prime `p > Y` divides `t-j`, and write `t=ap+j`. We have `p>s>2j`, and `p^2>2t-s`. Therefore

```math
\left\lfloor\frac{s}{p}\right\rfloor=0,
\qquad
\left\lfloor\frac{t}{p}\right\rfloor=a,
\qquad
\left\lfloor\frac{2t-s}{p}\right\rfloor=2a-1.
```

There are no higher-power contributions in (3). Thus `v_p(Q_s(t))=-1`, a contradiction.

## Exact removal of the small-prime obstruction

Fix a prime `p` and an integer `M >= 1` with `p^M > s+1`. If

```math
t\equiv -1\pmod {p^M},
```

then

```math
v_p\!\left(\binom{2t}{s}\right)=v_p(s+1),
\qquad
v_p\!\left(\binom{2t}{t}\right)\ge M.
\tag{8}
```

For the first identity, write the numerator of `binom(2t,s)` as the product of `2t-i` for `0 <= i < s`. Its factors satisfy `2t-i = -(i+2) mod p^M`. Since `2 <= i+2 <= s+1 < p^M`, each factor has exactly the valuation of `i+2`. Subtracting `v_p(s!)` leaves `v_p(s+1)`. For the second inequality, the lowest `M` base-`p` digits of `t` are `p-1`, so doubling `t` makes at least `M` carries. Equivalently, the first `M` terms of the standard central-binomial valuation sum equal one.

Consequently, for each prime `p <= max(s,2)` choose `M_p` with `p^(M_p) > s+1`, and put

```math
R=\prod_{p\le\mathop{\mathrm{max}}(s,2)}p^{M_p}.
```

Every `t = -1 mod R` satisfies `v_p(Q_s(t)) > 0` for all these small primes. This handles a fixed finite set of primes by a single congruence; it does not handle all primes dividing the denominator.

## Exact remaining carry condition

Suppose `s >= 1`, `p > max(s,2)` is prime, and `p` divides a denominator factor `2t-i`, where `0 <= i < s`. There is at most one such `i`, since their pairwise differences have absolute value less than `p`.

If `i` is odd and `p^a` divides `2t-i`, then

```math
t\bmod p^a=\frac{p^a+i}{2},
```

so this level contributes a carry to `v_p binom(2t,t)`. Each denominator valuation is therefore paid, and `v_p(Q_s(t)) >= 0`.

The only possible large-prime deficits come from even factors, `i=2j`. Write

```math
t-j=p^e u,\qquad p\nmid u,\qquad
0\le j\le\left\lfloor\frac{s-1}{2}\right\rfloor.
```

Since `2j < s < p`, doubling the lowest `e` digits of `t = p^e u+j` produces no carry, and its higher digits are exactly the digits of `u`. Thus

```math
v_p(Q_s(t))
=v_p\!\left(\binom{2u}{u}\right)-e.
\tag{9}
```

If `t = -1 mod R`, integrality of `Q_s(t)` is therefore **equivalent** to the following finite condition: for every prime `p > max(s,2)` dividing any of the integers in (7), with `e=v_p(t-j)` and `u=(t-j)/p^e`, doubling `u` in base `p` must create at least `e` carries. Primes absent from the denominator need no condition. This is an exact reduction, not an existence theorem.

## Attempted construction and its remaining gap

Balog and Wooley, [*On strings of consecutive integers with no large prime factors*](https://www.math.purdue.edu/~twooley/publ/1998%20consec.pdf), J. Austral. Math. Soc. Ser. A 64 (1998), 266–276, prove that arbitrarily long strings can be simultaneously `x^epsilon`-smooth. Their Lemma 2.2 uses CRT conditions on exponents, followed by cyclotomic factorization. This supplies much more smoothness than (7) demands, but it does not supply the signs of the valuation sums (3).

The fixed congruence in (8) is compatible with their theorem on linear forms: use `t=Rx-1` and the forms `Rx-(j+1)`. The issue is whether the resulting smooth integers meet (9).

Smoothness alone is insufficient even for a single denominator factor. Take `s=1` and `t=2^a`, where `a>=1`. The integer `t` is as smooth as possible, but

```math
v_2\!\left(\binom{2t}{t}\right)=1,
\qquad
v_2\!\left(\binom{2t}{1}\right)=a+1,
```

so `v_2(Q_1(t))=-a`.

The independent reviewer supplied a stronger counterfamily that survives small-prime cleanup and has bounded multiplicity at the obstructing prime. Let `L` be the product of the odd primes at most `Y`, and put

```math
t=\frac{3(3^L-1)}2.
\tag{10}
```

For either `s=1` or `s=2`, the block in (7) consists only of `t`, and `R=4` is a valid small-prime modulus. Since `L` is odd, `t=3 mod 4`, so (8) applies. In base 3, `t` consists of `L` digits equal to 1 followed by a zero. Doubling produces no carries, while `v_3(t)=1`; hence (9) gives `v_3(Q_s(t))=-1`.

Nevertheless, these `t` are `t^{o(1)}`-smooth as `Y` tends to infinity. Every prime factor divides 3 or a cyclotomic factor `Phi_d(3)` with `d | L`. The elementary product bound

```math
\lvert\Phi_d(3)\rvert\le 4^{\varphi(d)}\le 4^{\varphi(L)}
```

holds because `L` is squarefree and each complex factor `3-zeta` has absolute value at most 4. Since `phi(L)/L` tends to zero and `log(t)` is asymptotic to `L log(3)`, the largest prime factor is `t^{o(1)}`. Thus smoothness, small-prime congruences, and even bounded multiplicity at a bad prime do not imply the necessary carry condition. This refutes that proposed intermediate implication, not Erdős 389.

A valid construction still has to produce the carries in (9). No such construction was obtained. The independent review and its checks are recorded separately in [independent-review.md](independent-review.md).

## Computational check of the reductions

`check_erdos389.py` independently compares direct finite products with factorial valuations on a bounded grid. It then checks (5), (6), and (7) on every integral quotient in that grid. It also checks the smoothness counterfamily above. The grid is a check on the lemmas' implementation and boundary cases; it is not an attempt to settle more values of `n`, compute new minima, or claim a solution of (1).

Reproduce:

```bash
python check_erdos389.py --output erdos389_check.json
```

The remaining task is to prove that some `t>s` makes every valuation in (3) nonnegative for each fixed `s`. Neither (5), (6), nor (7) establishes that existence.
