# Independent algebra review

Reviewed `PAIR_COUPLING.md` on 21 November 2026. This review concerns the exact arguments in Sections 1–6. It does not prove the proposed coupling, independently authenticate every cited prior reduction, or extend the scope of the finite graph diagnostic.

## Disposition

The block-factorization identity, both counterfamilies to the shortcut that omits `Q`, the safe deletion–contraction closure, and the parallel-pair necessary condition are correct under their stated hypotheses. The note keeps the proposed graph coupling unproved and does not claim a Merino–Welsh resolution.

## Points checked

1. **Blocks and off-path factors.** Uniform acyclic orientations factor over blocks. For each path block, comparability has two equally numerous directions; requiring all path directions to agree gives the factor `2^(1-r)`. Spanning-tree and both orientation counts multiply over all blocks, whereas terminal resistance uses only path blocks. Consequently formula (2) contains every off-path `Q(H)`. Those factors cannot be removed without a separate Merino–Welsh input. The doubled-path attachment in Section 2 correctly makes the unrestricted coupling at least as strong as the original conjecture.

2. **The shortcut counterfamilies.** Chromatic deletion–contraction on the missing edge of `K_n-ab` gives `A=n!-(n-1)!` and terminal quotient count `(n-1)!`, hence comparability `(n-2)/(n-1)`. Symmetry gives terminal resistance `2/(n-2)`. Each attached triangle contributes resistance `2/3` and comparability one, while each doubled edge contributes resistance `1/2` and comparability one. Applying the three-block orientation factor gives exactly the displayed probabilities and resistances. Parallel doubling preserves acyclic orientations and halves resistance. Both stated families therefore refute only the `Q`-free shortcut, including on the claimed resistance interval.

3. **Safe deletion–contraction.** With `e` different from a terminal edge and terminals remaining distinct, separating spanning two-forests partition by whether they contain `e`; contraction is a bijection in the containing class. Thus `F=tR` is additive. Acyclic, totally cyclic and spanning-tree counts have the required deletion–contraction identities under the safe-child hypotheses. For `D`, subtract the chromatic identities before and after terminal identification. If a child acquires a terminal edge, the terminal quotient retains its loop and has acyclic count zero. This convention is essential. Cauchy–Schwarz followed by Jensen with positive weights `t_i/(t_1+t_2)` gives the stated exponential closure. No claim about unsafe children follows.

4. **Parallel-pair obstruction.** The extension identities `A(G)=D+2B`, `C(G)=C+3C'`, and `t(G)=t+2F` are consistent with adding exactly two parallel edges to nonadjacent terminals. Given the previously cited minimum-counterexample reductions and quotient induction, Cauchy–Schwarz gives `sqrt(A(G)C(G)) >= sqrt(DC)+sqrt(6)F`. Strict failure first implies a positive right side in the displayed bound on `sqrt(DC)`; squaring therefore preserves the inequality. The conversion from pair-inclusion probability to `3/4<R<2` is exact.

5. **The tangent comparison.** The exponential `2^(1/2-R)` is convex and its tangent at `R=1` is the line stated in the note. The difference between this tangent and `1-(sqrt(6)-2)R` is affine. The rational lower bounds at `R=3/4` and `R=2` are valid, using `2/3<log(2)<7/10`, `sqrt(2)<3/2`, and `sqrt(6)>12/5`. The comparison line is positive for `R<2`, since `sqrt(6)<5/2`. Squaring gives formula (5) throughout the interval.

The resulting implication is conditional: proving the coupling for the outside graph would exclude that parallel-pair configuration. Formula (4), with the cited minimum-counterexample hypotheses, is the unconditional necessary condition obtained by this calculation.
