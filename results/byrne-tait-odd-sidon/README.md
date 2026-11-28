# Byrne–Tait’s odd-length Sidon-set question

**Prior work.** Byrne and Tait's odd-length question was already answered by Mengdi Yao, Zenodo, registered 23 September 2026, [doi:10.5281/zenodo.22918720](https://doi.org/10.5281/zenodo.22918720), Theorem 6.3. Cite that preprint for the answer. This page records a later derivation first committed on 26 November 2026. It is unranked and is not counted as a new resolution. [Details](PROOF.md)

**Lean status:** full. The [Lean formalization](https://github.com/1337isnot1337/solved-conjectures/pull/1001), submitted under the GitHub account [aflah02](https://github.com/aflah02), verifies Cinna Davis’s written proof. The contributor reports using GPT-6.2 Astra.

For every fixed odd length $`k\ge3`$ and index $`h`$, the largest size of a set with distinct ordered $`k`$-fold products is at most $`(1-\varepsilon_{h,k})|\Gamma|^{1/k}`$ for all sufficiently large finite groups $`\Gamma`$ with an abelian subgroup of index $`h`$. The proof also handles even lengths and nonnormal abelian subgroups. This answers the odd-length extension of Byrne and Tait’s density-gap theorem. [Published question](https://doi.org/10.4153/S0008414X26102314)

[Written proof](PROOF.md) · [Independent review and source audit](AUDIT.md) · [Exact coset checks](verify.py) · [Tracking issue #876](https://github.com/1337isnot1337/solved-conjectures/issues/876)

If you use this result, please credit the problem authors and Cinna Davis’s proof, and cite [the project](https://itsdavis.com/) and [the specific proof](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/byrne-tait-odd-sidon/PROOF.md).

## Lean verification

The [Lean 4 proof](../../lean/Conjectures/ByrneTaitOddSidon.lean) uses the namespace `ByrneTaitOddSidon`. The ordered multiplication map agrees with the ordinary product of the list of letters, including repetitions.

| Declaration | Statement |
| --- | --- |
| `density_bound` | The explicit density estimate for each finite group with an abelian subgroup of index strictly between one and the alphabet size. |
| `maxSize_uniform_bound` | The explicit bound on the largest Sidon set above the group-order threshold in the written theorem. |
| `maxSize_le_one` | An index-one abelian subgroup forces the largest Sidon set to have size at most one. |
| `bounded_index_gap` | A single positive gap and size threshold work for every group with an abelian subgroup of index at most the prescribed bound, at any fixed word length at least two. |
| `bounded_multiplicity_density`, `abelian_intersection_bound` | The weighted estimate for bounded word multiplicities and the factorial criterion for the intersection with an abelian subgroup. |

The [verification receipt](verification/receipt.json) records a strict Lean 4.35.0 build and [stock-kernel replay](verification/replay.log). The [axiom audit](verification/audit.log) checked all 58 declarations in the module, including 35 private declarations. Only `propext`, `Classical.choice`, and `Quot.sound` occurred.

With the pinned Mathlib dependencies installed, run these commands from the repository root. The first repeats the proof checks. The second independently enumerates the two finite examples.

```sh
python3 scripts/verify_lean_target.py \
  --root Conjectures.ByrneTaitOddSidon \
  --require ByrneTaitOddSidon.wordProduct_eq_list_prod \
  --require ByrneTaitOddSidon.bounded_multiplicity_density \
  --require ByrneTaitOddSidon.abelian_intersection_bound \
  --require ByrneTaitOddSidon.density_bound \
  --require ByrneTaitOddSidon.maxSize_le_one \
  --require ByrneTaitOddSidon.maxSize_uniform_bound \
  --require ByrneTaitOddSidon.uniform_gap \
  --require ByrneTaitOddSidon.bounded_index_gap \
  --out .candidate-artifacts/byrne-tait-odd-sidon
python3 results/byrne-tait-odd-sidon/verify.py
```
