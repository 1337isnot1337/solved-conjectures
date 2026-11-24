# Scope and independent audit

The primary target is [Chern–Fu–Lin, Conjecture 1.1 and §6](https://doi.org/10.1017/S0013091523000652), based on Burstein’s [OEIS A218225 conjecture](https://oeis.org/A218225). Their earlier proof handles the first class, and the two remaining pattern bases are resolved here. The raw OEIS offset starts with length one. The generating tree includes the empty permutation as a separate constant term.

Independent review checked the primitive maximum-insertion exclusions, the positions of all first forbidden intervals after a shift, the two child transitions and the formal compressed-tree kernel. The catalytic roots lie in the variable-adic ideal required for the substitutions. The remaining cubic equation and its unique formal branch match the recorded generating function. Exact literal basis and child-vector checks passed through length eight, and the tree/cubic comparison passed through length 60.

The original unweighted conjecture is counted once. The refined conjectures in §6 are not claimed here. Bounded exact-class and source searches did not locate an earlier full proof of the two outstanding classes. No priority, Lean, or outside review is claimed.
