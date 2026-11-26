# Erdős–Gyárfás point-degree spectrum conjecture

**Lean status:** full. Lean bounds the degree spectrum in every finite linear space, rules out the proposed square-root deficit and proves the same linear bound for real planar point sets. [Theorems and receipt](FORMALIZATION.md).

Every abstract finite linear space on $n$ points has at most $(16n-13)/17$ different point degrees. This disproves Erdős and Gyárfás’s proposed $n-O(\sqrt n)$ lower bound. It also proves the positive linear deficit they asked about in the real plane. The proof compares low and high degrees line by line, using only the fact that each pair of points is on a unique line. [Original questions, §3](https://users.renyi.hu/~gyarfas/Cikkek/101_Gyarfas_ErdosProblemsOnIrregularitiesOfLineSizesAndPointDegrees.pdf)

[Proof](PROOF.md) · [Source and proof audit](AUDIT.md) · [Exact enumeration](verify.py) · [Independent review](https://github.com/1337isnot1337/solved-conjectures/issues/788#issuecomment-7188453537) · [Tracking issue](https://github.com/1337isnot1337/solved-conjectures/issues/788)

If you use this bound, please credit the authors of the work you use and cite both [Cinna Davis’s site](https://itsdavis.com/) and [the specific proof](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/erdos-gyarfas-point-degree-spectrum/PROOF.md). Cite [Gyárfás’s paper](https://users.renyi.hu/~gyarfas/Cikkek/101_Gyarfas_ErdosProblemsOnIrregularitiesOfLineSizesAndPointDegrees.pdf) for the original questions.
