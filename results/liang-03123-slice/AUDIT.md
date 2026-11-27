# Audit

## Target and priority

[Liang, *Quaternary games with infinite misère quotients*, arXiv:2611.29198v1](https://arxiv.org/abs/2611.29198v1), Section 6, Open Problem 6.2 asks for an invariant for the bulk of the slice with fixed heaps 1 and 2 and variable heaps of arbitrary positive integer sizes in game 0.3123. The same source already treats quotient infinitude in Theorem 3.8, using a different slice with fixed heaps 3 and 3. The earlier work of [Plambeck and Siegel](https://arxiv.org/abs/math/0609825), Appendix A.4, lists the game and its computed partial quotient. Neither result identifies the requested bulk invariant. The distinct 0.3312 result in this repository concerns a different game and Open Problem 6.1.

On 27 November 2026, searches for the exact code together with “Open Problem 6.2,” “bulk,” “slice,” “invariant,” and the author, plus the arXiv identifier and related [author code index](https://github.com/liang-kai-ruqi/automata_and_games), found no earlier solution to the specified slice problem. Repository searches found no active claim or existing result for it. Follow-up is tracked in issue #941.

## Mathematical and computational checks

1. Audited the game moves against the source code digits: complete removal at sizes one, two and four, and positive remainders after subtracting one, three or four. The empty position is next-player win.
2. Checked that the six fixed-heap prefixes form a closed family even at zero, and that all changes preserve the normalized option list. The four-step padding eliminates threshold crossings and prevents the two variable heaps changing order across a reduced gap. Smaller gaps remain literal before a move. This justifies the reduction for **all** heap sizes.
3. The Python implementation evaluates direct minimax independently of the normalization, then verifies recurrence closure on 3,060 representatives. It separately verifies 169 bulk representatives.
4. The independent C++ implementation stores both pairs of heap coordinates unsorted and evaluates moves bottom-up. It checked 294,849 direct labeled states and separately ran all 3,060 transfer checks. The bulk formulas themselves use the exact certificate, not any cutoff extrapolation.
5. The two parameterized pairs in the proof have matching ordered residues, opposite outcomes, and gaps and minima tending to infinity. This verifies the claimed obstruction to the proposed simpler invariant.
6. No Lean formalization or external refereeing is claimed.

Reproduce the checks:

~~~sh
python3 verify.py
c++ -O2 -std=c++17 check_independent.cpp -o /tmp/check-03123
/tmp/check-03123
~~~
