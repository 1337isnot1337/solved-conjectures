# Misère Domination Game

## Source and scope

- João Marcos Brito, Thiago Marcilon, Nicolas A. Martins and Rudini Sampaio, [The Normal Play of the Domination Game, v4](https://arxiv.org/html/2502.13118v4#S7), Question 2; final publication [Journal of Computer and System Sciences 157, 103751](https://doi.org/10.1016/j.jcss.2025.103751). The problem has two clauses: paths and cycles, and arbitrary trees. The first is answered here. General-graph misère PSPACE-completeness is in their paper and is not claimed as new. Normal play is also separate and already known for these two graph families.
- Kai Liang, [A Finite Automaton Approach to Combinatorial Games, v2](https://arxiv.org/abs/2608.13273), Definition 3.4, §3.5.3 and Problem 3.2. The tabulated algebraic periodicity of 0.337 is explicitly computational and not proved there. The present disproof is for the existence of any tuple in the definition, not only his displayed tuple, and is compatible with eventual single-heap periodicity.
- David Ottaway's [thesis](https://www.mscs.dal.ca/~ottaway/Thesis.pdf) uses 0.337 as an example of **normal-play** periodicity. Its nim-value computation does not determine misère outcomes in arbitrary sums. The [2026 UFC thesis](https://www.repositorio.ufc.br/ri/handle/riufc/85302) reports normal path/cycle results and the general misère complexity. The [subsequent stars preprint](https://arxiv.org/abs/2605.01259) concerns normal partizan play. Neither solves the misère path/cycle question.
- The title, author names, exact object name, variants of “last move loses”, “0.337”, “misère quotient”, “algebraic periodicity”, and the publication DOI were checked across arXiv, journal listings, cited theses, and repository research and publication records. No earlier solution of the exact scope was located. This is a bounded search, not a universal priority guarantee.

## Proof review checklist

1. The first move of an untouched path differs from a bordered run and is treated separately. The closed neighborhood of a played vertex never removes any fresh undominated vertex again. Covered gaps separate games, not merely normal-play nimbers.
2. The odd-to-even and even-to-odd inductions each use strictly smaller actual token totals. The virtual decrement game is solved first and has its own strictly decreasing weight; forced N states are justified by an actual odd removal or the misère terminal rule.
3. The weights for 2 and 3 are one, rather than the expression for larger heaps. Lengths 4 and 5 disappear from the virtual position, but their two-token moves add a weight-one pile, whose outcome cannot turn an already losing position into a winning one.
4. The even central boundary and the odd dominant boundary differ by three, not one. The exceptional solo weights and the multi-pile transition at virtual total three are checked separately. The odd proof explicitly supplies all special split witnesses at lengths 8, 9 and 12.
5. Definition 3.4 restricts t₁,t₂ to positive integers. Separating the cases p₂+t₂>2 and p₂+t₂≤2, and the parity of t₁ where necessary, rules out every tuple with unbounded families.

## Independent recurrences and reproducibility

- Run `python3 verify.py`. The default checks every heap partition of weight at most 29 by independent minimax (23,025 states), computes the two graph outcomes by direct closed-neighborhood minimax at 48 orders, and checks 450 parameter-family examples. These are independent implementations of the actual game rules, not the virtual proof recurrence.
- The extended C++ check independently compares all 2,984,865 heap partitions (including the empty one) through total weight 55. Run `c++ -O3 -std=c++17 verify_extended.cpp -o /tmp/verify-misere && /tmp/verify-misere 55`.
- The written induction proves the result for all lengths and arbitrary numbers of bordered runs. The finite checks are diagnostics. No Lean proof or external referee review is claimed.

## Supplemental checks

The [quotient classification](EXACT-QUOTIENT.md) gives both a product formula and explicit distinguishing contexts. Its checker tests 6,000 products and 5,935 distinguishing examples. The [even-cycle rule](EVEN-CYCLE-SUMS.md) preserves actual game moves and was checked independently on 1,003 combinations. The [mixed-cycle rule](MIXED-CYCLE-SUMS.md) was checked on 17,848 positions, both finite obstruction witnesses, and 144 threshold contexts. The only untreated odd cycles allowed in the positive extension have lengths 3, 5, 7 and 9; the negative result applies to every longer odd cycle. All three checkers are standalone Python programs in this directory.
