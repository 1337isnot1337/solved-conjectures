# Hurlbert–Kamat conjecture

[Issue 777](https://github.com/1337isnot1337/solved-conjectures/issues/777) concerns Conjecture 4.1 in the [2022 paper](https://doi.org/10.1016/j.dam.2022.06.028). It asks whether every tree without degree-two vertices has a leaf attaining the largest independent-set star at each size.

## Priority decision

Feghali, Johnson and Thomas close §4.1 of their [arXiv paper](https://arxiv.org/pdf/1506.07741) with a broader construction than the path-arm family in their main theorem. They say arbitrary starting trees can be duplicated and joined at a new root, with iterations producing counterexamples. The [published paper](https://durham-repository.worktribe.com/OutputFile/1324623) gives the remark in §3.1. Starting with a root with at least three leaves and always making at least three copies preserves the absence of degree-two vertices. That observation puts the existence conclusion within the scope of the older announcement. Its branching parameters and proof are omitted. The [later survey](https://arxiv.org/abs/2501.16144) continues to list the Hurlbert–Kamat statement after Theorem 37. I exclude this target from the discovery count and record the explicit comparison here so the priority conflict can be checked.

## Explicit witness

Take a root with three children. Give each child ten children of its own and give each of the thirty grandchildren two leaves. The 94-vertex tree has degrees 1, 3 and 11. Permuting the branches at each level takes any leaf to any other.

Write $A=5^{10}$ and $B=4^{10}$. A branch below a child has $A$ independent sets omitting the child, since each grandchild and its two leaves contribute five choices. It has $B$ sets containing the child, since its grandchildren are then absent. The number of independent sets containing the root is $A^3$.

Fix a leaf and put $C=2\cdot5^9$. In the branch of that leaf, there are $C$ choices containing it when the child is absent and $B/2$ choices when the child is present. Thus the number of independent sets containing the leaf is
```math
CA^2+(C+B/2)(A+B)^2.
```
Dividing by $A^3$ gives $2/5+(2/5+t/2)(1+t)^2$, where $t=(4/5)^{10}<1/8$. The ratio is strictly below $2/5+(37/80)(9/8)^2=1009/1024<1$. Summing over cardinalities proves that some fixed size favors the root over every leaf.

[The checker](check.py) also computes the independence polynomial outside each closed neighborhood separately. At size 15 the root belongs to 1,923,910,001,548,425 independent sets and each of the 60 leaves to 1,917,139,933,075,367. Run `python3 research/hurlbert-kamat/check.py` from the repository root.
