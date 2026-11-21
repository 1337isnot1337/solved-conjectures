# Search for a disproof in finite groups

A positive witness in even one group settles Sun's universal conjecture. The search targets seven disjoint cosets with all pairwise index gcds below seven. Menon's five-coset construction suggests index patterns mixing 6 with other divisors. The [fiber argument](few-primes.md) already excludes several near-partitions in nilpotent groups, so this search uses nonnilpotent groups. A negative result only concerns the specified group and family size. [Menon's paper](https://arxiv.org/abs/2608.15873)

GAP/SmallGrp enumerates subgroup conjugacy classes, every subgroup in each class, and every right coset of that subgroup. Inversion converts a packing of right cosets to one of left cosets with the same indices. Masks refer to the order in GAP's sorted list of group elements.

The Python checker builds the candidate index multisets from actual subgroup indices. Counting bounds their reciprocal sum by one. Two cosets of coprime indices intersect, and a pair with gcd at least seven cannot be a counterexample of size seven. For each remaining multiset it searches for enough cosets of every requested index, subject to at most one selected coset through each group element. Translating one coset to its subgroup and conjugating that subgroup lets the search try one anchor per subgroup conjugacy class at a chosen index. Any positive answer is decoded and checked against the enumerated cosets, their sizes, all pairwise intersections, and the original gcd bound. An independent group-arithmetic replay would precede reporting a solution.

## Reproduction

Run GAP with SmallGrp, Python with python-sat, and a writable output directory. Replace the two script paths below by their absolute locations. The export includes only nonnilpotent groups of each requested order. [GAP SmallGrp manual](https://docs.gap-system.org/pkg/smallgrp/doc/chap1_mj.html)

~~~sh
gap -A -q -c 'orders:=[48,72];; Read("/path/to/counterexample.g"); QUIT;'
python /path/to/counterexample.py 7 48-*.dat 72-*.dat
~~~

The initial sweep found no counterexample in all 38 nonnilpotent group types of order 48 or all 40 of order 72. These groups had 38 and 190 admissible group-and-signature pairs respectively. The SAT solver's negative verdicts were not independently proof-logged. As a positive control, the same encoding recovered Menon's $(6,6,6,10,15)$ packing in $A_5$, and it rejected the seven-coset extension $(6,6,6,6,6,10,15)$. Independent enumeration by combinations with replacement agreed on all candidate signatures from divisors of orders 48, 72, 96, 108, 120 and 144.

[GAP exporter](counterexample.g) · [SAT search and witness checker](counterexample.py)
