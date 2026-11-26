# Lean verification of Nathanson’s linear-form Sidon systems

Lean proves all three questions in §6 for every arity $h\ge2$ and every vector of nonzero integer coefficients, with arbitrary signs. It also proves the finite upper bound with the common coefficient divisor, the two-largest-coefficient lower bound and the exact bilinear limit. [Nathanson’s questions](https://www.theoryofnumbers.com/melnathanson/pdfs/nath2022-198.pdf#page=13) · [Written proof](PROOF.md).

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

## Sharp lower bound and exact bilinear limit

Let $D$ be the greatest common divisor of the absolute coefficients. Let $u$ and $v$ be the two largest absolute coefficients at distinct indices, allowing ties. Lean proves

```math
\liminf_{N\to\infty}\frac{F_{c,1}(N)^h}{N}\ge\frac{u+v}{D}.
```

The formal statement maximizes the sum over all pairs of distinct indices and proves that this maximum is attained. In arity two the finite upper bound matches, so Lean proves the actual limit

```math
\lim_{N\to\infty}\frac{F_{c,1}(N)^2}{N}
=\frac{\lvert c_1\rvert+\lvert c_2\rvert}{\gcd(\lvert c_1\rvert,\lvert c_2\rvert)}.
```

The proof constructs signed coordinate sets of exactly equal size. At the bottom level successive greatest common divisors determine how many distinct residues each coordinate can use. Their product is the common modulus divided by $D$. The middle level uses mixed-radix place values. Complementary binary digits at the top level divide the available diameter between the two chosen coordinates. Lean proves that their weighted sum recovers every digit. Rounding on the resulting fixed arithmetic progression gives the bound for every sufficiently large $N$. [Residue uniqueness](../../lean/Conjectures/NathansonSidonLowDigits.lean) · [Three-level construction](../../lean/Conjectures/NathansonSidonLayers.lean) · [Uniform interval bound](../../lean/Conjectures/NathansonSidonSharpProgression.lean) · [Limit theorems](../../lean/Conjectures/NathansonSidonSharpTheorems.lean).

The two arithmetic checkers exercise the written construction and the successive-gcd construction independently. The latter checked 340 residue systems and 133 signed systems with 279,896 actual tuples. [Written construction checker](verify.py) · [Three-level construction checker](check_layered.py).

## Verification

Two independent runs rebuilt 22 project modules with warnings treated as errors. Both audited 298 declarations, including 222 theorems, 14 private declarations and all 96 named endpoints. The previous 44 endpoints and all ten original source hashes are present. Both runs replayed the pinned stock Lean kernel. Only propositional extensionality, classical choice and quotient soundness occurred. [Complete verification receipt](verification/lean-receipt.json) · [Original positional checkpoint](https://github.com/1337isnot1337/solved-conjectures/pull/812).

If you use these bounds, please credit Melvyn Nathanson for the questions and cite both [Cinna Davis’s site](https://itsdavis.com/) and [the specific proof or Lean source](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/nathanson-sidon-systems).
