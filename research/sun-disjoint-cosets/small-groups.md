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

The sweep also finished all 180 nonnilpotent group types of order 96 and all 35 of order 108, with 360 and 105 group-and-signature pairs, respectively. Neither search found a counterexample.

[Independent group-arithmetic replay](replay.g) reconstructs a subgroup from each proposed right coset, verifies equality and index, then inverts each coset and recomputes all intersections and gcds. Run `ReplayPacking(order, id, entries)` in GAP, where each entry is a two-element list from the Python checker's `right_cosets` field. The positive control returned five disjoint cosets and maximum gcd six. Changing one recorded index from six to seven caused replay to reject the certificate.


The seven-coset sweep finished all 42 nonnilpotent group types of order 120 and all 169 of order 144, covering 940 and 2,122 group-and-signature pairs respectively. Across the six orders 48, 72, 96, 108, 120 and 144, the completed log contains all 504 exported group types exactly once and 3,755 group-and-signature pairs. The search returned no witness.

For the simple groups PSL(2,7) and A6, GAP identifies the groups as SmallGroup(168,42) and SmallGroup(360,118). For family sizes seven, eight, and nine, the candidate index multisets surviving counting and gcd filters numbered 0, 3, and 4 for PSL(2,7) and 20, 3, and 0 for A6. The SAT search found no witness for these multisets. The zero entries follow from the index and counting filters alone. To reproduce the two input files, load the GAP exporter with an empty list of orders, then run the following calls.

```gap
WriteCounterexampleData(168, 42);
WriteCounterexampleData(360, 118);
```

For 16 cosets in A6, the same counting filters leave 65 candidate index multisets. The SAT search returned no packing for all 65. A separate manifest comparison checked that every candidate was logged exactly once. Reproduce this run with the group file from the second GAP command above and the following invocation. [Run report](https://github.com/1337isnot1337/solved-conjectures/issues/231#issuecomment-7069506715)

```sh
python counterexample.py 16 360-118.dat
```
