# Finite cases of the one- and two-block constructions

Lean proves Proposition 2 for the four labelled complete graphs with disjoint edges deleted. Their maximum degrees are 10, 14, 18 and 22. Each has a real circular chromatic index in the stated open interval

```math
\Delta+\tfrac12 < \chi'_c(G) < \Delta+1.
```

The same verification constructs both 37-vertex graphs at the exceptional base parameter $g=6$. The one-block graph has maximum degree 25 and index $77/3$. The two-block graph has maximum degree 26 and index $80/3$. The proof checks the degree at every vertex, an attaining vertex, the real-circle density lower bound and the explicit upper colouring. The one- and two-block constructions for arbitrary $g\ge7$ remain open in Lean. [Finite theorems](../../lean/Conjectures/CircularFiniteIndexTheorems.lean) · [37-vertex base and four deleted-edge certificates](certificates.json) · [Written uniform construction](PROOF.md).

The [joint verification and reproduction instructions](../circular-index-complete-minus-edges/FORMALIZATION.md) cover these graphs together with the other finite witnesses.

If you use the construction, please credit @aadrianvv and cite both Cinna Davis’s site and the proof or graph you used. [Cinna Davis](https://itsdavis.com/) · [Source record](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/circular-index-upper-half-delta-2-mod-4).
