# Independent review: Althöfer incoming-measure obstruction

Date: 2026-11-21. Reviewed file: [incoming-flow weights](README.md). Campaign: [issue 220](https://github.com/1337isnot1337/solved-conjectures/issues/220).

Verdict: the finite-modulus and arbitrary-height obstructions are correct under the stated strict positivity and finite-real-value assumptions. They exclude a proposed certificate family. They prove neither absorption nor positive-probability escape.

## Source and stochastic law

I independently opened the [sponsor's current prize page](https://althofer.de/collatz-prizes.html). Prize 0 uses independent fair choices between $`\mathop{\mathrm{odd}}(3n-1)`$ and $`\mathop{\mathrm{odd}}(3n+1)`$. The page offers €300 for the first proof by its stated 2037 deadline; its payment terms direct funds to the winner. This is a proof-only offer, so the note correctly makes no promise of payment for a counterexample.

I also opened [Doumas–Papanicolaou, arXiv:1503.03658v1](https://arxiv.org/html/1503.03658v1). Their proved model uses offsets $`1,3,5,7`$, each with probability $`1/4`$; Remark 1 explicitly leaves the fair $`-1,+1`$ model open. The note does not import the former recurrence theorem into the latter chain.

Removing transitions to 1 gives the substochastic kernel on

```math
\mathcal S=\{n>1:n\text{ odd},\ 3\nmid n\}.
```

Every nonabsorbed trajectory is in this set after its first move.

## Incoming edges and the residue average

For $`m\in\mathcal S`$, the unique sign $`\sigma_k\in\{-1,1\}`$ satisfying $`2^km\equiv\sigma_k\pmod3`$ gives the only possible predecessor with exactly $`k`$ halvings:

```math
n_k=(2^km-\sigma_k)/3.
```

When $`3\nmid n_k`$, this is an actual state in $`\mathcal S`$, and $`3n_k+\sigma_k=2^km`$ has valuation exactly $`k`$, because $`m`$ is odd. Its probability contribution is $`1/2`$. Different indices cannot give the same predecessor for $`m>1`$: otherwise $`m`$ would divide the difference of two signs, namely $`0`$ or $`2`$, which is incompatible with distinct powers and positive odd $`m>1`$.

The excluded indices satisfy $`2^km\equiv\pm1\pmod9`$. The units modulo 9 are the powers of 2, of order 6, and $`\{1,-1\}`$ corresponds to exponents $`0,3`$. Thus exactly one class of $`k`$ modulo 3 is excluded. Averaging over the six target unit classes keeps each exponent with frequency $`2/3`$, producing

```math
\overline R(s)=\frac{3^{s-1}}{2^s-1}.
```

For $`1\lt s\lt 2`$, putting $`x=s-1`$ and using strict concavity gives $`1+3^x\lt 2\cdot2^x`$, so this average is less than 1. The geometric tail supplies a uniform dominating sequence for the limiting power-weight series.

This average is correctly identified as insufficient for a pointwise incoming inequality.

## Finite-modulus obstruction

For any fixed $`M`$, the progression

```math
m=1+18Mt
```

has the two distinct valid predecessors

```math
n_1=1+12Mt,\qquad n_2=1+24Mt.
```

They are all odd, coprime to 3, and congruent to 1 modulo $`M`$. The exact identities are

```math
3n_1-1=2m,\qquad 3n_2+1=4m.
```

Thus any positive residue weight cancels in the incoming ratio, whose lower limit is at least

```math
\frac12(3/2)^s+\frac12(3/4)^s
\ge (3/(2\sqrt2))^s>1.
```

The argument uses actual incoming branches; it does not assume a uniform distribution of residues along trajectories. Both predecessors tend to infinity with the targets, so deleting any fixed finite set of states does not repair the inequality.

## Arbitrary phase-height weights

Write $`M=2^aM_0`$, where $`M_0`$ is odd. Fix $`H\ge\max(3,a)`$ and take odd positive $`t`$ tending to infinity. For

```math
m=1+9M_0\,2^Ht,
```

the three preimages expand exactly as

```math
\begin{aligned}
n_1&=1+3M_0\,2^{H+1}t,
\\ n_2&=1+3M_0\,2^{H+2}t,
\\ n_4&=5+3M_0\,2^{H+4}t.
\end{aligned}
```

Consequently $`m\equiv1\pmod{9M}`$, $`h(m)=H`$; the predecessor residues modulo $`M`$ are respectively $`1,1,5`$; their heights are $`H+1,H+2,2`$. Their residues modulo 3 are $`1,1,2`$, respectively, so none is wrongly included from the removed multiples of 3.

The exact signed identities are

```math
3n_1-1=2m,\qquad 3n_2+1=4m,\qquad 3n_4+1=16m.
```

All three are distinct, legitimate transitions with probability $`1/2`$.

Suppose

```math
\mu(n)=n^{-s}W(n\bmod M,h(n)),
\qquad s>0,\quad W(r,H)\in(0,\infty),
```

satisfied $`\mu P\le\mu`$ for all sufficiently large targets. For each fixed $`H`$, the weights on this progression are constant. Multiplying by $`m^s`$ and taking the limit therefore gives

```math
g_H\ge A g_{H+1}+B g_{H+2}+D,
```

where

```math
g_H=W(1,H),\quad
A=\tfrac12(3/2)^s,\quad B=\tfrac12(3/4)^s,\quad
D=\tfrac12(3/16)^sW(5,2)>0.
```

Residue arguments here mean their classes modulo $`M`$, including when $`M=1`$.

Let $`G=\inf_{H\ge H_0}g_H`$. It is a finite nonnegative real number since each individual weight is finite. The inequality gives $`G\ge D>0`$, and then

```math
G\ge(A+B)G+D.
```

Since $`A+B>1`$, this is impossible. The infimum need not be attained; no compactness, boundedness above, monotonicity, or regularity of $`W`$ is used. Strict positivity of $`W(5,2)`$ is essential to this argument.

This also handles the kernel killed below any fixed cutoff: for each fixed $`H`$, all three predecessors eventually exceed that cutoff as $`t`$ grows.

## The global-certificate implication and its limit

If a strictly positive summable measure did satisfy $`\mu P\le\rho\mu`$ with $`0\le\rho\lt 1`$, then

```math
\delta_nP^t\le\frac{\rho^t}{\mu(n)}\mu
```

follows by positivity and induction. Summing gives a survival bound tending to zero. The sufficiency statement in the reviewed note is therefore valid.

The obstruction shows only that the displayed family of weights cannot supply such a certificate, even with $`\rho=1`$ outside a finite set. It does not rule out other positive summable measures, other global recurrence arguments, or the conjecture itself. No absorption conclusion follows from the arithmetic-progressions argument.

No numerical trajectory search was used in this review.

## Review of the subsequently added three-adic appendix

The appendix's homogeneous operator and almost-everywhere construction were also checked separately. Normalized Haar measure on the three-adic units is a constant multiple of additive Haar restricted to that set. For each sign and fixed $`k`$, the affine map

```math
n\longmapsto m=(3n+\sigma)/2^k
```

therefore scales measure by $`1/3`$. The two signs have disjoint images modulo 3, and each image automatically satisfies the unit-predecessor condition. Their combined contribution gives

```math
\int\mathcal L_s f\,d\nu
=\frac{3^{s-1}}{2^s-1}\int f\,d\nu.
```

For $`1\lt s\lt 2`$, choosing $`\lambda_s\lt q\lt 1`$ makes

```math
F_s=\sum_{t\ge0}q^{-t}\mathcal L_s^t1
```

integrable by Tonelli's theorem, hence finite almost everywhere. The identity
$`\mathcal L_sF_s=q(F_s-1)`$ is valid where finite. This concerns the homogeneous operator; it is not yet the exact integer incoming kernel.

The stated exceptional-set issue is real. In fact $`F_s(1)=\infty`$: the inverse branches $`k=1,2`$ both fix 1 and have total coefficient

```math
A+B=\tfrac12(3/2)^s+\tfrac12(3/4)^s>1>q.
```

Thus $`\mathcal L_s^t1(1)\ge(A+B)^t`$, forcing divergence of the series there. Since 1 is excluded from the nonabsorbed state space $`\mathcal S`$, this observation does not settle finiteness at its required positive integers.

Finiteness at every integer in $`\mathcal S`$, integer summability of $`n^{-s}F_s(n)`$, and transfer from the homogeneous operator to the exact kernel remain unproved. The appendix correctly makes no absorption claim.
