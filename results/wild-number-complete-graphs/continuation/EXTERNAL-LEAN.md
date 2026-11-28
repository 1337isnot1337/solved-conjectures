# External Lean results for Conjecture 6.1

[@NOELOO6](https://github.com/NOELOO6) submitted further cases of the conjecture on minimum proper edge colorings. The source, proof data and replay scripts are maintained in [NOELOO6/wild-number at 4b9e823](https://github.com/NOELOO6/wild-number/tree/4b9e8233857a43aa696610d5ece7c6fcdbd28253). These are partial results on the existing conjecture tracked in [issue #155](https://github.com/1337isnot1337/solved-conjectures/issues/155). The target is the equality in [Dawkins, Nappo, Tong and Zimbizi, §6](https://arxiv.org/html/2610.22142v1#S6).

| Scope | Exact result | Lean statement |
| --- | --- | --- |
| Every minimum proper coloring of K13 and K14 | 9 | [K13_K14](https://github.com/NOELOO6/wild-number/blob/4b9e8233857a43aa696610d5ece7c6fcdbd28253/verification/exact/K13K14.lean) |
| Every minimum proper coloring of K17 and K18 | 12 | [K17_K18](https://github.com/NOELOO6/wild-number/blob/4b9e8233857a43aa696610d5ece7c6fcdbd28253/verification/exact/K17K18.lean) |
| Every minimum proper coloring, 77 ≤ n ≤ 154 | ⌊4⌈n/2⌉/3⌋ | [exact_77_to_154](https://github.com/NOELOO6/wild-number/blob/4b9e8233857a43aa696610d5ece7c6fcdbd28253/cases/sieve/ExactInterval.lean) |
| Every minimum proper coloring of K₆ₘ, m ≥ 7 | 4m | [exact_multiples_of_six](https://github.com/NOELOO6/wild-number/blob/4b9e8233857a43aa696610d5ece7c6fcdbd28253/cases/sieve/InfiniteEven.lean) |
| Cyclic K21 colorings and K22 colorings with a cyclic deletion | 14 | [Exact symmetry cases](https://github.com/NOELOO6/wild-number/blob/4b9e8233857a43aa696610d5ece7c6fcdbd28253/cases/k21/Cyclic21.lean) |

The K13 proof uses [@aadrianvv’s nine-point reduction](attempt3/REPORT.md) and a Lean-checked SAT certificate. A separate [K13–K14 manuscript by @ariavitt](https://github.com/ariavitt/wild-number-complete-graphs/blob/60293720db78121a090d23042221e9458d205db7/proof-k13-k14.md) finishes the same reduction by a counting inequality. The interval result and the infinite family use partition counts. Combined with the large-order result of @aadrianvv, these claims cover every order from 77 upward. The general conjecture for the remaining small orders is open.

For arbitrary minimum proper colorings of odd K₃ₘ with m ≥ 6, there is also a partition into triples such that every color has an edge leaving every triple. Larger unions of triples can still be disconnected. [General triple-repair theorem and its graph application](https://github.com/NOELOO6/wild-number/blob/4b9e8233857a43aa696610d5ece7c6fcdbd28253/cases/regrouping/ValidTriples.lean).

## Replay

From the pinned checkout with Lean 4.19.0, run the commands below. The scripts pin mathlib. The K13, K17 and cyclic K21 finite calculations use Lean's native evaluator. The interval, infinite family and general triple-repair theorem use ordinary kernel checking. [Dependencies and proof replay](https://github.com/NOELOO6/wild-number/blob/4b9e8233857a43aa696610d5ece7c6fcdbd28253/verification/README.md).

```sh
./verification/graph-bounds.sh exact
./verification/graph-bounds.sh cyclic-k21
```
