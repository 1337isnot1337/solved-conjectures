# Lehmer’s totient conjecture: audit of two proposed resolutions

Tracking issue: [#317](https://github.com/1337isnot1337/solved-conjectures/issues/317).

**Status (2026-11-24): open in the sources checked.** This note identifies counterexamples to intermediate lemmas of a claimed proof, not to Lehmer’s conjecture. No proof of the conjecture or claim of priority is made.

For an integer $`n>1`$, Lehmer asked whether $`\varphi(n)\mid n-1`$ implies that $`n`$ is prime. The reverse implication is immediate. The original source is [D. H. Lehmer, *On Euler’s totient function* (1932)](https://doi.org/10.1090/S0002-9904-1932-05521-5). A composite solution would be odd, squarefree and Carmichael. The 2026 [Bhattacharjee preprint (version 2)](https://hexagonmath.org/2610.00454v2) and [version 1.11.0 of its source (30 October)](https://github.com/anaxia-research/eLhmr) explicitly leave the full conjecture open; their claimed finite bounds and exact prime completion criteria are not a resolution. The following audit checks competing full claims against their own statements.

## 1. The March 2026 prime-cost pivot manuscript

The exact inspected version is Daniel Sautot, [*Lehmer’s Totient Problem and a Prime-Cost Pivot Method*, Zenodo v2](https://doi.org/10.5281/zenodo.18911153), PDF internally dated March 2026, DOI record posted for its revised version in March. Its Theorem 1.1 claims the full conclusion.

### 1.1. Failure of admissible extension completeness (Lemmas 2.7–2.10)

For a finite set $`S`$ of odd primes, write $`N_S=\prod_{p\in S}p`$, $`L_S=\mathop{\mathrm{lcm}}_{p\in S}(p-1)`$ and $`B_S=\prod_{p\in S}(p-1)`$. Definition 2.3 says that $`S`$ is admissible at level $`y`$ exactly when its primes are at least $`y`$, the product is odd and squarefree, and
```math
   L_S\mid N_S-1,\qquad
   \ell^{v_\ell(B_S)}\mid N_S-1
   \quad\text{for every prime }\ell\le y.
```
Definition 2.6 requires $`S\cup\{p\}`$ itself to be admissible for any candidate next prime $`p>\max S`$. Lemmas 2.7–2.10 treat failure of this one-step test as excluding larger admissible extensions. Inherited congruences constrain **the completed product**, not the shorter product.

Explicit counterexample at $`y=7`$:
```math
S=\{7\},\qquad S'=\{7,89,683,7213\}.
```
Trial division verifies all four primes. The singleton is admissible. For $`S'`$,
```math
N_{S'}=3069196417,\quad L_{S'}=4918584,\quad
N_{S'}-1=624 L_{S'},\quad B_{S'}=2597012352.
```
The valuations of $`N_{S'}-1`$ and $`B_{S'}`$, respectively, are $`(7,7)`$ at 2, $`(2,2)`$ at 3, and $`(0,0)`$ at 5 and 7. Thus $`S'`$ is admissible. It is **not** a Lehmer counterexample, since $`B_{S'}\nmid N_{S'}-1`$. However $`7\cdot89-1=622`$ is not divisible by $`89-1=88`$, so 89 is not a candidate at $`S`$ despite belonging to $`S'`$. This disproves the untruncated clause of Lemma 2.7. More generally, for any odd primes $`p<q`$, the congruence $`pq\equiv p\pmod{q-1}`$ makes $`\{p,q\}`$ inadmissible. Hence no candidate at $`S`$ exists at all, contradicting Lemmas 2.8, 2.9 and 2.10 on the same example. Additional locks imposed by Definition 2.6 cannot make an inadmissible pair admissible.

The ancestry obstruction is not numerical: **every** non-singleton admissible support with least element $`y`$ is unreachable by this extension rule when started from $`\{y\}`$. For a true solution $`N=A C`$, the actual inherited condition is $`C\equiv A^{-1}\pmod{\varphi(A)}`$, using $`\varphi(A)\mid\varphi(N)`$ for a squarefree solution. One cannot replace this condition on $`C`$ by $`A\equiv1\pmod{\varphi(A)}`$.

### 1.2. Failure of prime witness extraction (Lemma H.5)

This lemma infers that the largest prime factor of
```math
 d=\gcd(p-1,L_{S\setminus\{p\}})
```
is at least $`T(y)=\lceil(y-1)/h(y)\rceil`$ from $`d\ge T(y)`$. This inference is false. Use $`y=p=17`$, $`S=\{17,97\}`$. Then $`L_S=L_{S\setminus\{17\}}=96`$, so the increment ratio equals 1 and $`d=16`$. Its largest prime factor is 2. The prescribed $`h(17)=17^{2/5-1/(3(\log17)^4)}`$ is strictly between 2 and 4, so $`T(17)>4`$. These satisfy the assumptions of H.5 as stated, which do not require admissibility. Derived witness counting cannot use the written H.5 for general supports. This example alone does not refute a replacement H.5 with an additional admissibility hypothesis; §1.1 is independent.

### 1.3. Missing large-pivot off-gate case

In §5.3, the positive-size bound in Proposition 5.3 requires the gate $`\log N_S\le y`$. Lemma 5.5 only invokes its bound on the gate-pass branch. Section 5 routes off-gate saturated supports to Case C, which the manuscript introduces as finite-range at small $`y`$. The bounded deletion argument cannot guarantee gate-pass in the asymptotic large-$`y`$ regime: taking the paper's pivot demand $`|S_0|\ge C_1 y^2/\log y`$ from (14) as given, and allowing its deletion budget $`\lceil3(\log y)^4\rceil`$ from (15), every reachable support has
```math
 \log N_S\ge |S|\log y\ge C_1 y^2-\lceil3(\log y)^4\rceil\log y>y
```
for all sufficiently large $`y`$. Even granting both quoted estimates, simple bounded descent therefore lands outside the stated gate; a separate large-pivot closure is needed. This is a second logical obstacle to the claimed all-range supply bound, not a statement that such supports actually exist as Lehmer numbers.

The associated [Lean README](https://github.com/beautiful-numbers/lehmer-lean/blob/main/README.md) displays final endpoints that accept branch-closure hypotheses. Those endpoint statements and their standard axiom lists verify an implication, not the missing hypotheses themselves. The README calls the human-readable PDF normative; the counterexample above addresses the normative mathematical argument without performing Lean verification.

## 2. The 2016 Mertens manuscript

Ahmad Sabihi, [*An analytical proof for Lehmer's totient conjecture using Mertens' theorems*, arXiv:1608.08086](https://arxiv.org/abs/1608.08086), also claims the full result. Equation (3.21) drops the asymptotic error in (3.20) while retaining the exact $`\pm1/N`$ term. Mertens’ asymptotic does not license this replacement. Even treating (3.24) as exact, a bound from above on the fractional part $`\alpha`$ does not give the strictly positive lower bound needed to compare $`\alpha/\log p_k`$ against $`1/N`$; small numerators can compensate for different denominator sizes. The same unproved fractional-part assertion appears in §3.7. Equation (3.34) defines its factor $`cl_k`$ so that the numerator in (3.36) is exactly $`N/\varphi(N)`$ when the prime product is correctly interpreted; saying the fractional part approaches 1 does not follow from this rearrangement. The final §3.8 also displays the totient product with an interval of prime indices, when the required set is only the prime divisors of $`N`$. These issues preclude using this manuscript as a full resolution.

## 3. Research boundary

The concrete obstruction above eliminates this published prefix-based proof claim. It does not eliminate every possible use of a prime-cost pivot, establish any new numerical bound on Lehmer numbers, or resolve the conjecture. Searches used the exact statement, title, named conjecture, Zenodo, an author repository, and current sources through November 24, 2026. A bounded search does not establish priority or exclude unindexed arguments.
