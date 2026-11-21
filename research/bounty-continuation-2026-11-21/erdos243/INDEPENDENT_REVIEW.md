# Erdős 243: independent review and the remaining record budget

21 November 2026. This review checks the exact cancellation calculations and the scope of the attempted routes. It does not prove the full rational reciprocal-sum conjecture.

Reviewed author files:

- [Target and prior audit](target-and-prior-audit.md), SHA256 `3ff9bd654123ad66f9b1b5d144aa454f85e7538854b1836d93939cb0a1f963d0`.
- [Reduced-tail cancellation gap](reduced-tail-cancellation-gap.md), SHA256 `6e3b245b329fedabc15f06255c6d4a3541caa8632850af988f1ef28e7a31be15`.
- [Direct counterexample check](counterexample-route-check.md), SHA256 `65741e6e3405ed5a4123bb760de6557a081ce87989ee7ed8d46887b1c5f20ebb`.

## 1. The target and the coordinates

I opened [Koizumi's published paper](https://math.colgate.edu/~integers/aa28/aa28.pdf) and checked its exact rationality and quadratic-growth question. The published and arXiv versions use different numbering. The author note correctly retains rational convergence, strict increase after any removable finite prefix, and the full eventual recurrence. It does not substitute a prescribed convergence rate.

For a reduced tail $`x=p/q`$, write $`a=\lfloor q/p+3/2\rfloor`$ and $`e=q-(a-1)p`$. Then $`t=ap-q=p-e`$ is positive and coprime to $`p`$. Since

```math
aq=a^2p-at,
```

the cancellation factor is exactly $`h=\gcd(t,aq)=\gcd(t,a^2)`$. Thus

```math
p^+=\frac{p-e}{h},\qquad q^+=\frac{aq}{h},
\qquad \frac{p^+}{p}=\frac{1-e/p}{h},\qquad \gcd(p,p^+)=1.
```

Every equality in the note follows without an assumption that the old numerator and the new denominator remain coprime. That missing assumption would be a serious error in a descent proof. The note keeps the cancellation factor throughout.

## 2. The local examples

For $`p=c`$, $`q=c^2-1`$, $`c\ge3`$, I independently obtain $`a=c+1`$, $`e=-1`$, $`t=h=c+1`$, and the new reduced tail $`1/(c^2-1)`$. Its next chosen denominator is $`c^2`$. Thereafter the reciprocal tail is a unit fraction at every step and the Sylvester recurrence holds. The first two denominators are strictly increasing; the eventual recurrence gives the required asymptotic ratio. Hence these are genuine examples satisfying the conjecture, with arbitrarily small initial relative error and arbitrarily large initial cancellation. They disprove only a local inference that small error prevents cancellation.

For $`q=c^2+c-1`$, I instead obtain $`a=c+2`$, $`e=-1`$, and $`h=\gcd(c+1,(c+2)^2)=1`$. The reduced numerator rises from $`c`$ to $`c+1`$. This is correctly presented as a one-step example; the note does not assume that its infinite continuation has vanishing relative error.

If a hypothetical nonabsorbing orbit has $`e_n/p_n\to0`$, then its nonzero integral errors force $`p_n\to\infty`$. Taking logarithms of the exact update gives

```math
\log p_N+\sum_{n\lt N}\log h_n
=\log p_1+\sum_{n\lt N}\log(1-e_n/p_n)=o(N).
```

Both terms on the left are nonnegative apart from a harmless fixed initial convention, so each is $`o(N)`$. This gives density-zero cancellation indices, not finitely many cancellations. No sign or summability conclusion follows.

## 3. The proposed infinite examples

For the cited exact recurrence $`C_n=2^n`$, $`D_n=2^n b_n`$, $`b_{n+1}=b_n(b_n+2)/2`$, I checked both integer updates directly. The tail identity also telescopes:

```math
\frac1{b_n}-\frac1{b_n+2}
=\frac2{b_n(b_n+2)}=\frac1{b_{n+1}}.
```

As $`b_n\to\infty`$, the reciprocal sum is indeed the stated rational tail. However the relative error is exactly $`-1`$ and the denominator growth ratio tends to $`1/2`$. The chosen next denominator is one too large for the centered rule. Thus this example fails the original hypotheses in the precise ways recorded.

The transient-family estimate is also correct. From $`c_j>2|h|`$, nonzero integral $`h`$, and $`T\ge2`$, one gets $`c_j\ge3`$, $`P>|h|`$, and $`PT+h\ge P`$. Therefore the seed is at most $`3^{1-L}`$. Its direct limiting construction produces zero, not a positive rational counterexample. This does not exclude a different infinite construction.

## 4. The separate LCM-record route

I read the weighted-record proof and its stated remaining budget in [Cook's short manuscript](https://wcook04.github.io/practical-formal-verification/maths/papers/erdos-243-reciprocal-tail-rigidity.html), and the recovery and modulus-gap arguments in [the long manuscript](https://wcook04.github.io/practical-formal-verification/maths/papers/erdos243-reciprocal-tail-reasoning-surface.html), Section 14. The local source hashes are recorded in the author's manifest. I did not replay the linked Lean archive.

The compressed variables are $`U_n=L_nx_n`$, $`V_n=L_n-(a_n-1)U_n`$, where $`L_n`$ is the prefix LCM. They satisfy

```math
\rho_n U_{n+1}=U_n-V_n,
\qquad \rho_n=\gcd(L_n,a_n).
```

Small relative error makes every sufficiently late record rise have $`\rho_n=1`$. At such a rise, the full jump is $`d_n=-V_n`$. Cook's fixed CRT barriers force a divergent weighted excess of these jumps in a nonterminating orbit. Applying the criterion still requires an upper bound on that excess. Neither vanishing $`V_n/U_n`$ nor a bound on a fixed-length recovery gives it. The quantitative gap theorem concerns avoidance of whole prescribed moduli, not arbitrary reduced denominator primes or an exact tail orbit.

The attempted next inference was that density-zero cancellations and increasingly long recoveries might force a sublinear total excess of record jumps. I found no such implication. The published recovery bound allows lengths that grow with the index. Replacing a full jump by the smaller increase of the running maximum would discard exactly the recovery cost that needs control. A proof still has to use the complete multiplicative denominator recurrence to obtain a new global estimate.

## 5. Verdict

The reviewed calculations and their stated limitations pass this written check. The author files do not contain a full proof or counterexample. The separate record-budget attack also stops at a missing estimate already identified in prior work. No new theorem resolving Erdős 243, formal submission, sponsor acceptance, or payment is claimed. This review adds zero completed bounty problems.
