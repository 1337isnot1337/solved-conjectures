# Lean verification of Nathanson’s linear-form Sidon systems

Lean proves all three questions in §6 for every arity $h\ge2$ and every vector of nonzero integer coefficients, with arbitrary signs. It also proves the finite upper bound with the common coefficient divisor. The separate lower bound involving the two largest coefficients and the resulting exact bilinear limit are covered by the written proof. [Nathanson’s questions](https://www.theoryofnumbers.com/melnathanson/pdfs/nath2022-198.pdf#page=13) · [Written proof](PROOF.md).

For each integer output, Lean counts the tuples giving that output in the Cartesian product of the coordinate sets. It defines $F_{c,g}(N)$ as the largest common cardinality of sets in $[1,N]\cap\mathbb Z$ with every output multiplicity at most $g$, and proves this maximum is attained. If $u=\min_i|c_i|$ and $v=\max_i|c_i|$, the kernel checks
```math
\liminf_{N\to\infty}\frac{F_{c,g}(N)}{N^{1/h}}\ge (v/u)^{1/h}\ge1\qquad(g\ge1).
```
This includes multiplicity one without prime restrictions and multiplicity $h!$. Coefficient-adjusted integer progressions produce every output in one arithmetic progression exactly once. Rounding a multiple of the fixed coefficient period works at every sufficiently large $N$. [Final theorems](../../lean/Conjectures/NathansonSidonTheorems.lean) · [Limiting inequality](../../lean/Conjectures/NathansonSidonLimit.lean) · [Positional construction](../../lean/Conjectures/NathansonSidonProgressions.lean).

For $D=\gcd_i|c_i|$, dividing every coefficient by $D$ preserves the counts of corresponding outputs. Counting those outputs in their integer interval proves
```math
F_{c,1}(N)^h\le \frac{\sum_i|c_i|}{D}(N-1)+1.
```
[Finite inequality](../../lean/Conjectures/NathansonSidonGcd.lean) · [Attainment and interval count](../../lean/Conjectures/NathansonSidonDiameter.lean).

Two independent runs rebuilt all 10 project modules with warnings treated as errors. Both audited 118 declarations, including 97 theorems, four private declarations and all 44 registered endpoints. The publication run replayed each module with its own stock Lean kernel checker process. The permitted axioms were propositional extensionality, classical choice and quotient soundness. [Verification receipt](verification/lean-receipt.json).
