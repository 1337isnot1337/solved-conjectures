# Lean verification of Dukes’s revstack descent polynomials

Lean constructs the descent polynomial from actual permutations that sort within $n-2$ revstack passes. It proves Dukes’s Eulerian formula for every $n\ge3$, proves that the reduced polynomial is monic of degree $n-1$, and verifies the first strict interlacing transition. [Dukes’s Conjecture 5.6](https://www.combinatorics.org/ojs/index.php/eljc/article/download/v21i2p2/pdf/) · [Written proof](PROOF.md).

Let $E_n$ denote the unshifted Eulerian polynomial, $a=\lfloor(n-1)/2\rfloor$ and $b=\lfloor n/2\rfloor$. The literal descent polynomial satisfies
```math
W_n(x)=x\big(E_n(x)-xE_a(x)E_b(x)\big).
```
The proof characterizes exactly which permutations fail the penultimate sorting pass and then counts their descents. For $n=3$ and $n=4$, Lean obtains two and three distinct negative roots respectively, proves their strict interlacing, and accounts for the common zero root. [Enumeration](../../lean/Conjectures/DukesRevstackEnumeration.lean) · [Interlacing theorem](../../lean/Conjectures/DukesRevstackFiniteStart.lean).

For a general order, a separate Lean theorem gives strict interlacing from an inequality bounding the remainder at every negative root of the reduced polynomial. The written proof supplies the uniform analytic estimate and the original Python verifier checks all 125 transitions from $3\to4$ through $127\to128$ by exact rational signs. The current Lean receipt covers the first transition unconditionally. [Root inequality](../../lean/Conjectures/DukesRevstackInterlacing.lean) · [Exact finite checker](check.py).

Independent research and publication runs strictly compiled all 14 project modules. Each audited 279 declarations, including 243 theorems, 89 private declarations and 12 explicitly required endpoints. The publication run used a separate stock kernel checker process for each module. The permitted axioms were propositional extensionality, classical choice and quotient soundness. [Kernel receipt](verification/lean-receipt.json).
