# Alexandersson’s parking-function excedance conjecture

Status: **partially formalized**. The [original conjecture](https://www.symmetricfunctions.com/realRootedOpenProblems.htm) asks both for real-rootedness and for consecutive interlacing. The [written disproof](https://github.com/1337isnot1337/solved-conjectures/blob/af75f5c5f76593313d9a2af62780c1dd2f035646/results/alexandersson-parking-excedance/PROOF.md) uses the strict excedance statistic on preference words. Keep its attribution and priority statement unchanged. This checkpoint extends the existing local Roots and Words drafts.

- `AlexanderssonParkingExcedance.row17_nonreal_root`: The displayed coefficient row has an actual nonreal complex root. The proof uses the polynomial product rule to prove the Laguerre inequality for every real split polynomial, with no nonroot side condition.
- `polynomial_eq_marked` gives the expansion for the **literal** source enumerator, replacing exponentiation by the sum over subsets of excedance positions. `isParking_iff_sorted_permutation` aligns the prefix-count condition with a sorted permutation of the preferences. `Partial.card_next_mark_sets` gives the first binomial factor in the recurrence. `merge_projections` records the mask and unmarked-list inverse property.
- `literal_nonreal_of_row_eq` transfers the analytic result to the literal enumerator **conditional on the row identity**. The remaining task is to prove the update counts and final decoding bijection, and connect the computed marked counts to the displayed row. No main registration or complete Lean disproof claimed.

Pinned Lean 4.35.0 (`eb6cafb7290e8bd5f2937522d8d804f58f02bafc`) and Mathlib `56a005855ea17e0b0958f73ec801ae140b0a1679`. All three exact source files compiled with warnings as errors. The all-owned transitive audit passed on 95 declarations (50 theorems, 30 private declarations, 7 required endpoints), allowing only `propext`, `Classical.choice`, and `Quot.sound`. Independent stock-kernel replay passed for the entire three-module import closure of `Conjectures.AlexanderssonParkingExcedancePartial`.

| Source suffix | SHA-256 |
| --- | --- |
| Roots | `b50114d6a41fbb09f4f9ab99f3ba6b125b799156271366d5fbf16502432bc6b5` |
| Words | `155b74f3a3782f6e9aef744a95ef04fd768f4ecca4ab2125b9a23a86545a5c33` |
| Partial | `5805b2c4d590983230ac305e304e7cd04c06716074b162fa2743be028c7b3df6` |

These tests cover the scoped formalization, not the aggregate repository or the unformalized bijection.
