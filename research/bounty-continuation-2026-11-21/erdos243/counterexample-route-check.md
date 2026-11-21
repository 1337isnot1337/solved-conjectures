# Erdős 243: checking the direct counterexample route

21 November 2026. No counterexample was obtained. This note checks whether published exact constructions supply the missing infinite rational orbit. It does not claim a new theorem about the unrestricted conjecture.

## 1. What a counterexample must supply

[Koizumi's published paper](https://math.colgate.edu/~integers/aa28/aa28.pdf), Conjecture 1 and Theorem 3, requires a **single positive rational seed** whose centered pseudo-greedy errors tend to zero but never reach zero. The paper also proposes the stronger expectation of eventual zero for every positive rational seed without the limit assumption.

The targeted searches for nonterminating rational pseudo-greedy orbits and counterexamples found no primary source establishing such an orbit. Koizumi, Bado, Cook, and the White working report all leave the full question open. That search result is not a proof that no other source exists.

## 2. The published exact infinite recurrence fails the required hypotheses

[Cook's long manuscript](https://wcook04.github.io/practical-formal-verification/maths/papers/erdos243-reciprocal-tail-reasoning-surface.html), Section 14, gives the exact recurrence example

```math
C_n=2^n,\qquad b_0=2,\qquad
b_{n+1}=\frac{b_n(b_n+2)}2,
\qquad a_n=b_n+2,\qquad D_n=b_nC_n.
```

Each $`b_n`$ is a positive even integer, and direct substitution gives

```math
C_{n+1}=a_nC_n-D_n,\qquad
D_{n+1}=a_nD_n,\qquad E_n=-C_n.
```

These are valid integer-tail recurrences, with the rational total obtained from $`C_0/D_0=1/2`$. But

```math
\frac{E_n}{C_n}=-1,
\qquad a_{n+1}=\frac{a_n^2-2a_n+4}{2},
\qquad \frac{a_{n+1}}{a_n^2}\longrightarrow\frac12.
```

It is not even a centered pseudo-greedy orbit: the reduced remainder is $`1/b_n`$, whose pseudo-greedy next denominator is $`b_n+1`$, while this construction uses $`b_n+2`$. The manuscript explicitly states these failures. It supplies no counterexample to Erdős 243.

## 3. The arbitrary-transient construction does not have a positive-seed limit

The [White working report](https://erdosproblemaday.com/report/243) constructs, for every nonzero integer $`h`$ and every length $`L`$, rational pseudo-greedy orbits with

```math
e_1=\cdots=e_L=h,\qquad e_{L+1}=e_{L+2}=\cdots=0.
```

Its parameters satisfy

```math
c_j>2|h|,\qquad
P=\prod_{j=1}^{L}c_j,\qquad d_1=PT+h,\qquad T\ge2,
\qquad r_L=c_1/d_1.
```

Because $`P>|h|`$, one has $`d_1\ge P`$. All $`c_j`$ are integers at least three, so

```math
0\lt r_L\le\frac1{c_2\cdots c_L}\le3^{1-L}.
```

Consequently the direct limit of this particular family as $`L\to\infty`$ is zero, even if the admissible auxiliary parameters vary with $`L`$. It does not produce one positive rational seed with an infinite nonzero transient. Every finite member instead reaches an exact Sylvester tail.

More generally, consistency of congruences through arbitrarily large finite horizons would still require a proof that one **ordinary fixed rational** realizes them all. An inverse-limit residue or a limit of rational seeds is not automatically such a rational. The preceding estimate describes the explicit published family; it does not rule out every different limiting construction.

## 4. Status

The exact infinite construction loses both centeredness and the quadratic-ratio limit. The exact centered constructions eventually absorb. Neither closes the counterexample route. The missing object remains an infinite rational pseudo-greedy orbit satisfying all of the original hypotheses simultaneously.

The source TeX for Cook's long manuscript is pinned locally as `cook-long-2026.tex`, SHA-256 `92512a9aa35a79c5e4d2fb5690c56912a7a7dff9a4a244e356b1c2e886b37bac`. The [source manifest](source-manifest.json) records its URL and byte count. No numerical orbit search was used in this check. Zero completed bounty problems are added.
