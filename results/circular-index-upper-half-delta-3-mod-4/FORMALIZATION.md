# The three-block construction and its exact circular index

For every integer $`g\ge15`$ and every pair of nonnegative integers satisfying $`3\alpha+5\beta=g-3`$, Lean constructs the graph on $`6g+1`$ labelled vertices. The vertices 6, 7 and 8 have degree $`4g+2`$. Every other vertex has degree $`\Delta=4g+3`$, and the real circular chromatic index equals $`\Delta+2/3`$. [Theorem A and Corollary C](../../lean/Conjectures/CircularThreeBlockTheorems.lean) · [Labelled degree formula](../../lean/Conjectures/CircularThreeBlockDegree.lean) · [Original formulas](PROOF.md).

The proof checks the two base matchings, the cyclic lengths of their edges, and the separation of three consecutive colour classes across all three insertion blocks. For each of the three deficient vertices it exhibits empty colour windows. The total degree then determines the degree of every vertex. Corollary C combines this construction with the nine finite graphs for every degree congruent to 3 modulo 4 from 27 onward. The small-parameter exclusions in Section 8 and the additional connectivity remark are separate claims. [Matching formulas](../../lean/Conjectures/CircularThreeBlockBase.lean) · [Deficient vertices](../../lean/Conjectures/CircularThreeBlockDeficit.lean) · [Combined verification](../circular-index-upper-half-remaining-deltas/FORMALIZATION.md).

## The nine finite graphs

For each of the nine parameters $6\le g\le14$, Lean constructs the labelled graph on $6g+1$ vertices from the supplied base matchings and three insertion blocks. It proves that the maximum degree is $\Delta=4g+3$ and that

```math
\chi'_c(G)=\Delta+\tfrac23 .
```

The verified degrees run from 27 to 59 in steps of four. The upper bound comes from the colour assigned to each edge. For the lower bound Lean checks every vertex degree, applies the degree-sum formula to count the edges and applies the density lower bound for every real-circle colouring. The two endpoints agree in all nine cases. [Proposition B](../../lean/Conjectures/CircularFiniteIndexTheorems.lean) · [Degree and index argument](../../lean/Conjectures/CircularTableColoring.lean) · [Original certificates](certificates.json) · [Written uniform theorem](PROOF.md).

The [joint verification and reproduction instructions](../circular-index-complete-minus-edges/FORMALIZATION.md) identify the shared receipt, the source-data comparison and the kernel replay command.

If you use an example, please credit @aadrianvv and cite both Cinna Davis’s site and the proof or graph you used. [Cinna Davis](https://itsdavis.com/) · [Source record](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/circular-index-upper-half-delta-3-mod-4).
