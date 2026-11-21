# Althöfer stochastic absorption: incoming-flow weights

Date: 21 November 2026. Standing campaign: [issue 220](https://github.com/1337isnot1337/solved-conjectures/issues/220).

Status: the full absorption conjecture is unresolved. This note investigates a global incoming-flow certificate and proves that a broad proposed class of weights cannot supply it. It does not produce an escaping trajectory of positive probability or complete a prize problem.

## Exact target, reward, and prior scope

For a positive odd integer $`n`$, independently choose with probability one half each

```math
T_-(n)=\mathop{\mathrm{odd}}(3n-1),\qquad
T_+(n)=\mathop{\mathrm{odd}}(3n+1).
```

The target is absorption at 1 with probability one from **every** positive odd starting value. The [sponsor's Prize 0](https://althofer.de/collatz-prizes.html), last updated 5 November 2026 when checked, offers €300 for the first proof before 31 December 2037. The payment terms name payment to the winner by PayPal, or an alternative transfer route where necessary. The offer is specifically for a proof of the conjecture; this note does not assume a counterexample would receive the same prize. No submission or payment approval is claimed.

The exact fair-sign law is explicitly left open in Doumas and Papanicolaou, *A Randomized Version of the Collatz 3x+1 Problem*, [arXiv:1503.03658v1, Remark 1](https://arxiv.org/html/1503.03658v1). Their recurrence theorem in that paper uses four different offsets and does not prove this target. The sponsor's [current diary](https://althofer.de/math-with-ai-diary.html) and linked [three-branch dust analysis](https://althofer.de/on-3n%2B3-dust.pdf) likewise distinguish the fair-sign problem from models with another random branch.

The existing repository notes already prove return to the residue classes 3 and 5 modulo 8, exact stopped-phase laws, and an obstruction to controlling the next phase using the current phase height alone. Those results do not prove enough frequency or accumulated contraction for absorption. They are not repeated as new progress here.

The present route uses the transpose of the transition kernel and summable weights on incoming edges. No novelty claim follows from its absence in the limited earlier notes checked.

## Why an incoming certificate would be global

After one move, every state is coprime to 3, because $`3n\pm1`$ is not divisible by 3 and removing factors of 2 preserves that property. It is enough to analyze

```math
\mathcal S=\{n>1:n\text{ is odd and }3\nmid n\}.
```

Let $`P(n,m)`$ be the substochastic transition kernel on $`\mathcal S`$, with transitions to 1 removed. Suppose a strictly positive summable weight $`\mu`$ and a constant $`0\le\rho\lt 1`$ satisfied

```math
(\mu P)(m)=\sum_{n\in\mathcal S}\mu(n)P(n,m)
\le\rho\mu(m)
\qquad(m\in\mathcal S).
\tag{1}
```

Then for every fixed start $`n\in\mathcal S`$, positivity and induction give

```math
\delta_nP^t\le\frac{\rho^t}{\mu(n)}\mu.
```

Summing over states bounds the survival probability by

```math
\Pr_n(\tau_1>t)
\le\frac{\sum_m\mu(m)}{\mu(n)}\rho^t\longrightarrow0.
\tag{2}
```

Thus a valid certificate of this form would address all starts, not a finite numerical case. A corresponding killed-kernel certificate outside a finite set would imply return to that finite set. The usual positive-probability decreasing paths could then handle absorption after returns, if all required return hypotheses were established.

The obstructions below are stronger than a failure to achieve $`\rho\lt 1`$: the proposed weights cannot even satisfy $`\mu P\le\mu`$ outside a finite set. Summability is not used in proving their failure.

## Exact incoming branches and the misleading average

For a target $`m\in\mathcal S`$, a predecessor with exactly $`k\ge1`$ removed factors of 2 has the form

```math
n_k=\frac{2^km-\sigma_k}{3},\qquad \sigma_k\in\{-1,1\},
\tag{3}
```

where $`\sigma_k`$ is uniquely determined by $`2^km\equiv\sigma_k\pmod3`$. If $`3\nmid n_k`$, this predecessor is in $`\mathcal S`$ and contributes $`\mu(n_k)/2`$. For targets greater than 1 the displayed predecessors are distinct. The sign and exact power are not extra random choices: the original transition probability is one half.

For the candidate $`\mu(n)=n^{-s}`$, the limiting incoming ratio along a fixed target class modulo 9 is

```math
\frac{3^s}{2}
\sum_{\substack{k\ge1\\3\nmid n_k}}2^{-sk}.
\tag{4}
```

The excluded exponents form one residue class modulo 3. Averaging (4) over the six unit residue classes modulo 9 yields

```math
\overline R(s)=\frac{3^{s-1}}{2^s-1}\lt 1
\qquad(1\lt s\lt 2).
\tag{5}
```

For the strict inequality, set $`x=s-1\in(0,1)`$. Strict concavity of $`t^x`$ gives $`2\cdot2^x>1+3^x`$. The limiting series in (4) is dominated by a constant times $`\sum_k2^{-sk}`$, so the elementary limit is legitimate.

Equation (5) does not imply (1). The target residue class is not sampled uniformly by the requirement in (1), which is pointwise. In fact the next theorem rules out every positive periodic correction to these power weights.

## No finite-modulus power-weight certificate

Fix an integer modulus $`M\ge1`$, a real exponent $`s>0`$, and a strictly positive finite-valued function $`w`$ on residue classes modulo $`M`$. Set

```math
\mu(n)=n^{-s}w(n\bmod M).
```

Then $`\mu P\le\mu`$ fails for arbitrarily large targets, even if all states below any fixed cutoff are removed.

To prove this, take

```math
m=1+18Mt,\qquad
n_1=\frac{2m+1}{3}=1+12Mt,\qquad
n_2=\frac{4m-1}{3}=1+24Mt,
```

with positive integers $`t`$. These are odd, greater than 1, coprime to 3, and congruent to 1 modulo $`M`$. Moreover

```math
3n_1-1=2m,\qquad3n_2+1=4m,
```

so both are actual incoming edges of probability one half. Since the periodic weights cancel,

```math
\liminf_{t\to\infty}\frac{(\mu P)(m)}{\mu(m)}
\ge\frac12\left[\left(\frac32\right)^s+
\left(\frac34\right)^s\right]
\ge\left(\frac3{2\sqrt2}\right)^s>1.
\tag{6}
```

The second inequality is the arithmetic–geometric mean inequality. Additional incoming edges only increase the left side. This proves the obstruction for every fixed modulus, not merely powers of 3.

## Arbitrary correction by the current phase height also fails

For an odd integer greater than 1, define

```math
h(n)=\max\{v_2(n-1),v_2(n+1)\}.
```

Fix $`M\ge1`$, $`s>0`$, and any strictly positive finite-valued function $`W(r,H)`$, with no boundedness, monotonicity, or growth restriction. Consider

```math
\mu(n)=n^{-s}W(n\bmod M,h(n)).
\tag{7}
```

Again, no weight of this form satisfies $`\mu P\le\mu`$ outside a finite set.

Write $`M=2^aM_0`$, with $`M_0`$ odd. Fix any

```math
H\ge H_0:=\max(3,a),
```

and let

```math
m=1+9M_0\,2^Ht
```

where $`t`$ ranges through positive odd integers. Then $`m\equiv1\pmod{9M}`$ and $`h(m)=H`$. Use the three distinct predecessors

```math
n_1=\frac{2m+1}{3},\qquad
n_2=\frac{4m-1}{3},\qquad
n_4=\frac{16m-1}{3}.
\tag{8}
```

Their properties are exact:

| Predecessor | Transition to $`m`$ | Residue modulo $`M`$ | Phase height |
| --- | --- | --- | --- |
| $`n_1`$ | $`3n_1-1=2m`$ | $`1`$ | $`H+1`$ |
| $`n_2`$ | $`3n_2+1=4m`$ | $`1`$ | $`H+2`$ |
| $`n_4`$ | $`3n_4+1=16m`$ | $`5`$ | $`2`$ |

All three are odd, greater than 1, and coprime to 3. For the last height calculation,

```math
n_4-1=4\left[1+\frac43(m-1)\right],\qquad
n_4+1=2\left[3+\frac83(m-1)\right].
```

Both bracketed expressions are odd, giving valuations 2 and 1 respectively. For $`n_1`$ and $`n_2`$, subtracting 1 gives $`2(m-1)/3`$ and $`4(m-1)/3`$; their other neighbors have valuation 1.

Set

```math
g_H=W(1\bmod M,H),\quad
A=\frac12\left(\frac32\right)^s,\quad
B=\frac12\left(\frac34\right)^s,\quad
D=\frac12\left(\frac3{16}\right)^sW(5\bmod M,2)>0.
```

If $`\mu P\le\mu`$ held for every sufficiently large target, keeping only the three edges in (8), dividing by $`m^{-s}`$, and letting odd $`t\to\infty`$ would give

```math
g_H\ge A g_{H+1}+B g_{H+2}+D
\qquad(H\ge H_0).
\tag{9}
```

Let $`G=\inf_{H\ge H_0}g_H`$. It is finite because $`g_{H_0}`$ is finite, and nonnegative. Equation (9) first gives $`G\ge D>0`$, and then gives

```math
G\ge(A+B)G+D.
```

But $`A+B>1`$ by (6). This is impossible. No regularity of $`W`$ is needed. The argument also covers $`M=1`$, where residues 1 and 5 simply name the same residue class.

## An unbounded three-adic alternative still has a fixed-start gap

The excluded class does not contain all possible arithmetic weights. One
attempt to go outside it uses the homogeneous incoming operator on the
three-adic units. This gives an almost-everywhere construction, which does not
provide the required statement at each positive integer.

Let $`\nu`$ be normalized Haar measure on $`\mathbb Z_3^\times`$. For a unit
$`m`$, define $`\sigma_k(m)\in\{-1,1\}`$ by
$`2^km\equiv\sigma_k(m)\pmod3`$, and put

```math
(\mathcal L_s f)(m)=
\frac12\sum_{k\ge1}\left(\frac3{2^k}\right)^s
1_{\{(2^km-\sigma_k(m))/3\in\mathbb Z_3^\times\}}
f\left(\frac{2^km-\sigma_k(m)}3\right).
\tag{10}
```

This is the homogeneous operator suggested by the limiting ratios, not the
exact integer-weight operator: the actual ratio also contains the additive
$`\pm1`$ terms in the predecessor sizes.

For each sign, the change of variables
$`m=(3n+\sigma)/2^k`$ contracts three-adic Haar measure by a factor of three.
The two signs have disjoint images modulo 3. Therefore for nonnegative
integrable $`f`$,

```math
\int\mathcal L_s f\,d\nu
=\lambda_s\int f\,d\nu,
\qquad
\lambda_s=\frac{3^{s-1}}{2^s-1}.
\tag{11}
```

For $`1\lt s\lt 2`$, choose $`\lambda_s\lt q\lt 1`$. Tonelli's theorem gives an
integrable extended-valued function

```math
F_s=\sum_{t\ge0}q^{-t}\mathcal L_s^t1,
\qquad
\int F_s\,d\nu=\frac1{1-\lambda_s/q}\lt \infty.
```

Thus $`F_s`$ is finite almost everywhere and satisfies
$`\mathcal L_sF_s=q(F_s-1)\le qF_s`$ wherever finite.

The exceptional set is nonempty: at the three-adic point 1, both inverse
branches $`k=1,2`$ fix 1. With $`A,B`$ as above,
$`\mathcal L_s^t1(1)\ge(A+B)^t`$, so $`F_s(1)=\infty`$ because
$`A+B>1>q`$. The absorbing state 1 was removed from $`\mathcal S`$,
so this example does not resolve finiteness at any required nonabsorbing
integer.

This does not construct a valid incoming certificate on the integer chain.
The prescribed positive integers form a countable Haar-null set, so the
almost-everywhere assertion gives no finiteness statement at any required
start. Even pointwise finiteness would not by itself prove
$`\sum_{n\in\mathcal S}n^{-s}F_s(n)\lt \infty`$. Those arithmetic pointwise and
summability estimates remain unproved. The construction cannot be transferred
to all integer starts by treating their residues as random.

## Further integer transfer and the remaining mass estimate

The subsequent [integer-transfer note](three-adic-integer-transfer.md), checked in a [separate independent review](TRANSFER_REVIEW.md), gives an exact probabilistic transfer. Define

```math
\Gamma_t(s)=\sum_{m\in\mathcal S}m^{-s}\mathcal L_s^t1(m).
```

A positive stopped product martingale and Hölder's inequality prove

```math
\Pr_n(\tau_1>t)^{s+1}\le n^s\Gamma_t(s).
```

Consequently, subsequential decay of this integer mass to zero would imply absorption from every start. Full summability is a stronger sufficient condition; a uniform exponential bound is unnecessary for this implication. No such total decay has been proved.

The note bounds the entire contribution with $`m\ge3^{t+1}`$ and the contribution of one arbitrary inverse jump followed by a binary phase near either endpoint. The complementary region still contains every fixed integer for all sufficiently large times, and the full collection of recurrent phases has no proved contraction. It also proves dense three-adic poles and a family of large values at actual odd integers, showing why finiteness cannot be inferred from the Haar integral or simple endpoint-distance bounds. Those large values do not prove failure of integer summability.

## Recurrent binary phases and larger-division bridges

The subsequent [recurrent-phase note](recurrent-binary-phases.md), checked in a [separate independent review](RECURRENT_REVIEW.md), proves a weighted Green-sum bound for the restricted inverse operator retaining only division exponents one and two. It handles arbitrarily many binary phases, the first entrance, and phase holding time. A logarithmically weighted first-return measure contracts by the explicit factor 3021/3136, and the resulting total binary Green mass is finite at s=3/2.

The full operator does not inherit this contraction. For every nonnegative integer t, both fair-sign successors of 19+96t return to the boundary set in one step, with division exponents three and one. The exact full return density for the power weight exceeds one. For a logarithmic multiplier the ratio tends to one, ruling out any common factor below one. The larger branch's incoming contribution tends to one half, so its small raw inverse coefficient is not a valid measure-norm bound.

A regular logarithmic correction has negative unnormalized drift on this particular family. That limited fact does not prove the required inequality at other boundary states. The full integer-mass estimate remains open, and this route has stopped at that gap.

## Outcome of this global attempt

The average in (5) suggested a summable incoming-flow measure. The pointwise certificate fails for every periodic power weight and even for an arbitrary additional correction by the current two-adic phase height. Enlarging a finite residue linear program cannot remove this obstruction.

The result does not exclude an arbitrary summable measure, a weight depending on further unbounded arithmetic information, a different recurrence theorem, or the absorption conjecture itself. It is not a proof that a particular start has positive escape probability.

The exact remaining task for this approach is to construct a positive summable incoming weight outside the excluded class, or to establish recurrence by a different global argument. The three-adic almost-everywhere construction does not meet those requirements. No valid integer-chain construction or recurrence theorem has been obtained in this note. Full paid-target completion count remains zero.

The finite-modulus extension and arbitrary-height extension were proposed in coordination with the root worker. The worker who developed the incoming-flow route checked all exact powers, congruences, progression limits, and the infimum argument. A third worker independently reviewed the complete obstruction proofs, the average-ratio calculation, and the global sufficiency criterion; the review is saved in [the independent review](INDEPENDENT_REVIEW.md). The same reviewer subsequently checked the Haar factor and Tonelli construction in the three-adic appendix and supplied the explicit divergence at 1. That appendix remains an incomplete attempt. No trajectory simulation or growing numerical range is used in these proofs.
