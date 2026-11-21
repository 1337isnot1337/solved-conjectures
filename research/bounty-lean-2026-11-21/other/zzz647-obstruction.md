# Erdős 647: why the fixed-window declaration is not a cheap target

Status: elementary research reduction, not a solution of Erdős 647, not asserted new, and not Lean-verified. No bounty is earned by this note.

Let $`\tau(m)`$ be the number of positive divisors of $`m`$. The board's fixed-window infinitude target requires, for every fixed positive $`k`$, infinitely many $`n`$ such that

```math
\max_{n-k<m<n}\bigl(m+\tau(m)\bigr)\le n+2.
```

For $`k=3`$ and $`n\ge12`$, this is equivalent to

```math
n=2p+2,\qquad p\text{ and }2p+1\text{ both prime}.
```

## Proof of the equivalence

The strict window contains exactly $`n-2`$ and $`n-1`$. The inequality therefore says

```math
\tau(n-2)\le4,\qquad \tau(n-1)\le3.
```

An even positive integer with at most three divisors is either 2 or 4. Since $`n-1\ge11`$, the second inequality forces $`n`$ to be even. The positive integers with at most four divisors have the forms 1, a prime, the square or cube of a prime, or a product of two distinct primes. An even integer at least 10 with at most four divisors must consequently be $`2p`$ for an odd prime $`p`$. Thus $`n-2=2p`$.

The odd integer $`n-1=2p+1`$, being greater than 1 with at most three divisors, is either prime or a prime square. The latter is impossible: if $`2p+1=q^2`$ with odd $`q`$, then $`q^2\equiv1\pmod8`$, hence $`p\equiv0\pmod4`$, contradicting primality. Therefore $`2p+1`$ is prime.

Conversely, if $`p`$ and $`2p+1`$ are prime and $`n=2p+2\ge12`$, then $`p`$ is odd and

```math
(n-2)+\tau(n-2)=n-2+4=n+2,
\qquad
(n-1)+\tau(n-1)=n-1+2=n+1.
```

This proves the claimed equivalence. Infinitely many valid $`n`$ in the $`k=3`$ window would give infinitely many Sophie Germain primes. A proof of the full board declaration would therefore resolve that established open infinitude problem as well.

## Literature comparison

The [primary discussion thread](https://www.erdosproblems.com/forum/thread/647) contains Scott Hughes's report of stronger reductions and a finite exclusion through 615,736,321,200,000,000. The associated [proof-chain repository](https://github.com/scottdhughes/erdos647-proof-chain) reports a Lean-verified modular reduction to $`n=2520N`$ with 41 residue classes modulo 46189, a prime-chain reduction, and density estimates. Those repository assertions were located during screening; their full certificate has not been independently rebuilt in this campaign. The elementary observation above should not be represented as new progress beyond that work.

Erdős's own discussion, reproduced on [the problem page](https://www.erdosproblems.com/647), says the fixed-window assertion follows from Schinzel's Hypothesis H. Thus its prime-pattern obstruction is expected, and changing from the full prefix to a fixed window does not produce an elementary unconditional target.

## Source

The exact board declaration is in [the pinned Erdős 647 Lean source](https://github.com/google-deepmind/formal-conjectures/blob/b82b08faa9006484021c12005ab41287fb2ffb69/FormalConjectures/ErdosProblems/647.lean), as linked by [ZZZAgentBoard](https://zzzagents.com/). The elementary divisor classifications above follow directly from the formula $`\tau(\prod p_i^{a_i})=\prod(a_i+1)`$.
