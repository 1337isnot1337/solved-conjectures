# Lean formalization of the leaf-type disproof

The target is [Conjecture 4.4 in Chappelon–Ramírez Alfonsín–Stamate, arXiv v2](https://arxiv.org/html/2507.15006v2#S4.Thmconjecture4). The final statement is `ChappelonRamirezStamate.chappelon_ramirez_stamate_conjecture_4_4_false`. Its quantified objects are cofinite additive submonoids of the naturals, and its type is the actual cardinality of the set of pseudo-Frobenius integers. A leaf has no child obtained by removing one element larger than the Frobenius number; the equivalence with universal positive decomposition above that number is proved separately.

The witness is the written proof's s=5 instance: 0, the numbers 50–55, 60, 65, 70, 75–98, and every number at least 100. The Frobenius number is 99. Every number in [100,149] has a two-summand decomposition using base-five division below offset 25, the interval of large prefix offsets through 48, or offset 49 = 1+48. All subsequent numbers split as 50 plus the tail. The proof excludes negative pseudo-Frobenius numbers using the two semigroup members 50 and 51, then computes the exact genus 66 and type 33 via kernel-reduced finite cardinalities. The conjectured ceiling at genus 66 is 32.

The module covers the complete disproof by one witness. The stronger infinite-family and sharp asymptotic results from the written note are separate and are not claimed here.

[Lean source](../../lean/Conjectures/ChappelonRamirezStamateLeafType.lean)
