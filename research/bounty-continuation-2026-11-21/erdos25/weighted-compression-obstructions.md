# Erdős 25: two obstructions to a direct measure proof

> Subsequent status: the general finite Haar-zeta comparison and its stronger LCM-capacity version are now [disproved](finite-zeta-counterexample.md), with [independent](COUNTEREXAMPLE_REVIEW.md) and [coordinator](COUNTEREXAMPLE_COORDINATOR_REVIEW.md) reviews. The earlier conditional implication and restricted theorems remain valid. Erdős 25 itself remains unresolved. The original argument below is preserved.

21 November 2026. This note concerns proof methods for the following **unproved** finite comparison. Given distinct positive moduli $`q_i`$ and one residue $`a_i\bmod q_i`$, let

```math
B=\bigcup_i\{n\in\mathbb N:n\ge q_i,\ n\equiv a_i\pmod {q_i}\},
\qquad
U=\bigcup_i[a_i]_{q_i}\subseteq\widehat{\mathbb Z}.
```

For $`s>1`$, the proposed comparison is

```math
\frac1{\zeta(s)}\sum_{n\in B}n^{-s}\le\mu(U),        \tag{1}
```

where $`\mu`$ is Haar probability measure. The [capacity note](capacity-and-footprint-obstructions.md) separates this unproved statement from the proved conversion restrictions. The two examples below do **not** refute (1).

## 1. Prime-coordinate compression has the wrong deficit monotonicity

Rogers' theorem compresses residue cylinders to zero cylinders one prime-power coordinate at a time. That reduces their Haar union measure. A proof and precise source attribution appear in Tao's [19 January 2026 exposition](https://terrytao.wordpress.com/2026/01/19/rogers-theorem-on-sieving/), Theorems 3, 5, and 6.

Define the unnormalized deficit

```math
\Phi_s(B,U)=\mu(U)\zeta(s)-\sum_{n\in B}n^{-s}.
```

One might try to prove (1) by showing that every such coordinate compression can only decrease $`\Phi_s`$, ending at a zero-residue system. This monotonicity already fails for one modulus.

Take $`q=6`$ and $`a=1`$. Its activated series is

```math
F_1(s)=\sum_{k\ge1}(6k+1)^{-s}.
```

Compress the modulo-two coordinate to zero and keep the modulo-three coordinate equal to one. The resulting residue is $`4\bmod6`$, whose activated series is

```math
F_4(s)=\sum_{k\ge1}(6k+4)^{-s}.
```

Termwise, $`F_1(s)>F_4(s)`$ for every $`s>1`$. The Haar measure remains $`1/6`$. Therefore

```math
\Phi_s(B_4,U_4)>\Phi_s(B_1,U_1).                   \tag{2}
```

Compressing the modulo-three coordinate first gives residue $`3\bmod6`$ and the same strict increase. Thus changing the order of the two prime-coordinate compressions does not fix the first step in this example.

Simultaneously changing the whole residue to zero behaves differently. Equation (2) only rules out the stated coordinatewise monotonicity argument. It does not rule out a different global rearrangement or a more detailed accounting of the changes.

## 2. No coupling can preserve every active membership

A second possible method would couple an integer drawn from the zeta distribution to a Haar-uniform profinite integer, requiring each active congruence membership to survive under the coupling.

This is impossible even for one fixed finite system.

Let $`N`$ have distribution

```math
\mathbb P(N=n)=\frac{n^{-2}}{\zeta(2)}
\qquad(n\ge1),
```

and let $`\omega`$ have Haar distribution on $`\widehat{\mathbb Z}`$. They may be arbitrarily dependent. Use moduli $`q=2,3,4,5,6`$ and residues $`a_q=6\bmod q`$. Suppose the coupling preserved all memberships, meaning

```math
\{N\ge q,\ N\equiv6\pmod q\}
\subseteq
\{\omega\equiv6\pmod q\}
\quad\text{almost surely for every }q.             \tag{3}
```

On the event $`N=6`$, every left-hand condition holds. Hence (3) would imply

```math
\{N=6\}\subseteq\{\omega\equiv6\pmod {60}\}
\quad\text{almost surely}.
```

The required inequality of probabilities would be

```math
\frac1{36\zeta(2)}\le\frac1{60}.
```

It is false. An elementary integral bound suffices:

```math
\zeta(2)
<
\sum_{n=1}^{5}\frac1{n^2}+\int_5^\infty\frac{dx}{x^2}
=
\frac{5989}{3600}
<
\frac53.
```

Thus $`1/(36\zeta(2))>1/60`$, a contradiction.

The subfamily $`q=4,5,6`$ already has least common multiple sixty, so three classes suffice for this intersection obstruction. No numerical approximation is used.

## 3. What remains possible

Equation (1) compares **unions**. The coupling obstruction requires simultaneous preservation of every individual membership and hence of their intersection. A coupling that sends an integer to just one of its active witness cylinders can avoid that obstruction.

Likewise, the compression example concerns a particular sequence of intermediate transformations. It does not decide the sign of the original deficit.

A valid measure proof still needs a system-dependent allocation or a global weighted inequality that handles the overlap of witness cylinders. Neither example supplies it. The unrestricted density problem and its solver bounty remain unresolved in this work.

