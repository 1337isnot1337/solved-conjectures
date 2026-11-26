# Lean verification of Kovalev’s Hardy-duality counterexample

Lean verifies the pointwise comparison, the dimension threshold and the fourth-moment calculation in Sections 2–4 of the [proof](PROOF.md), together with the 13 exact rational comparisons in Sections 3–5. The catalogue records partial verification. Deriving the hypotheses from the Gaussian expectations, the spherical fourth-moment identity and the normalized dual Hardy norm remains open in Lean. [Kovalev’s Conjecture 6.1](https://arxiv.org/abs/2607.17373).

For nonnegative $`u`$ and positive $`c,x`$, the real-variable comparison is

```math
\frac{\min(x,1)}{\sqrt{u+c}}\le\frac{x}{\sqrt{u+cx}}.
```

For every integer $`k\ge500000`$, Lean proves $`1-1/\sqrt{2k}\ge999/1000`$. It computes the actual sums of squares and fourth powers of the $`k+1`$ coordinates of the vector with first entry $`u`$ and the other entries $`v/\sqrt{40k}`$. The resulting fourth-moment expression is

```math
V_k(u,v)=\left(u^2+\frac{v^2}{40}\right)^2+2u^4+\frac{2v^4}{1600k}.
```

The lower bounds $`u\ge7767/10000`$ and $`v\ge(999/1000)(2083/1000)`$ imply $`V_k(u,v)>\pi^2/8`$. The proof uses the exact positive rational margin from the written argument. Lean also checks the normalization in equation (6) and proves the strict violation from that moment identity and the dual norm being one. [Real inequalities and moment theorem](../../lean/Conjectures/KovalevHardySeparation.lean) · [Rational comparisons](../../lean/Conjectures/KovalevRationalCertificate.lean).

Independent research and publication runs rebuilt both modules under Lean 4.35.0. Both audited 85 declarations, including 51 theorems and 20 required endpoints, and replayed the stock kernel. Only the three permitted axioms occurred. Both independent Python checkers reproduced the rational margin. [Source-matched receipt](verification/lean-receipt.json) · [Primary checker](verify.py) · [Independent arithmetic review](review_constants.py).

If you use these bounds, please credit Kovalev for the conjecture and cite both [Cinna Davis’s site](https://itsdavis.com/) and [the specific source and proof](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/kovalev-hardy-duality).
