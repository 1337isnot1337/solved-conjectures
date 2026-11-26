# Lean proof of Proposition B

For each of the nine parameters $6\le g\le14$, Lean constructs the labelled graph on $6g+1$ vertices from the supplied base matchings and three insertion blocks. It proves that the maximum degree is $\Delta=4g+3$ and that

```math
\chi'_c(G)=\Delta+\tfrac23 .
```

The verified degrees run from 27 to 59 in steps of four. The upper bound comes from the colour assigned to each edge. For the lower bound Lean checks every vertex degree, applies the degree-sum formula to count the edges and applies the density lower bound for every real-circle colouring. The two endpoints agree in all nine cases. The uniform three-block theorem for $g\ge15$ remains open in Lean. [Proposition B](../../lean/Conjectures/CircularFiniteIndexTheorems.lean) · [Degree and index argument](../../lean/Conjectures/CircularTableColoring.lean) · [Original certificates](certificates.json) · [Written uniform theorem](PROOF.md).

The [joint verification and reproduction instructions](../circular-index-complete-minus-edges/FORMALIZATION.md) identify the shared receipt, the source-data comparison and the kernel replay command.

If you use an example, please credit @aadrianvv and cite both Cinna Davis’s site and the proof or graph you used. [Cinna Davis](https://itsdavis.com/) · [Source record](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/circular-index-upper-half-delta-3-mod-4).
