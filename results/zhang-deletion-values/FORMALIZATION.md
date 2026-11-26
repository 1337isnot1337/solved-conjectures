# Lean verification of Zhang’s deletion values

For $n\ge3$ and $1\le r\le n-1$, take the speeds $1,\ldots,n-1$ and delete $r$. Lean proves both exact values of the largest attainable minimum distance to an integer, with time ranging over all real numbers. If $D_r$ is the least integer at least $n+r$ coprime to $r$, then
```math
LR=\begin{cases}1/r,&2r>n-1,\\2/D_r,&2r\le n-1.\end{cases}
```
The theorem `ZhangDeletion.question84` establishes $LR>1/(n-1)$ for every $n\ge4$ and $1\le r\le n-2$. The two equality theorems are `large_deletion_exact` and `small_deletion_exact`. Lean proves both bounds in the second range internally using rational maximizers and signed modular certificates. [Lean proof](../../lean/Conjectures/ZhangDeletion.lean) · [Written proof](PROOF.md) · [Zhang’s Question 8.4](https://arxiv.org/abs/2608.13599).

Two independent runs strictly compiled all seven project modules and audited 352 declarations, including 296 theorems, ten private declarations and 35 required endpoints. The stock kernel replayed the complete scope together and in separate module processes. The permitted axioms were propositional extensionality, classical choice and quotient soundness. The separate exact checker reproduced 779 deletion values, including 740 strict-inequality cases. [Kernel receipt](verification/lean-receipt.json) · [Exact checker](verify.py).

If you use this result, please credit @aadrianvv for the original proof and verifier and cite both Cinna Davis’s site and the specific proof or source record you used. [Cinna Davis](https://itsdavis.com/) · [Original contribution](https://github.com/1337isnot1337/solved-conjectures/pull/143) · [Result record](https://github.com/1337isnot1337/solved-conjectures/tree/main/results/zhang-deletion-values).
