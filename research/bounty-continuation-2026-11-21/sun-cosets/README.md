# Sun's disjoint cosets: counterexample construction checkpoint

Date: 2026-11-21. No counterexample was found. No conjecture resolution, prize submission, accepted award, or payment is claimed. All jobs described here have finished.

## Exact paid problem and prior work

For `k>1` pairwise disjoint left cosets `a_i H_i` of finite-index subgroups of a group `G`, Sun conjectures that some pair satisfies

```math
\mathop{\mathrm{gcd}}([G:H_i],[G:H_j])\ge k.
```

Sun's [own MathOverflow statement](https://mathoverflow.net/questions/316709/a-challenging-problem-on-disjoint-cosets) offers US$200 for the first complete solution. It also proves that passing to a common finite quotient preserves the indices and disjointness. Thus an exact finite-group counterexample would settle the full statement, rather than merely one positive finite case. The [secondary reward ledger](https://prizeproblems.org/problems/057/) links the sponsor's survey; that survey timed out when fetched, so the sponsor-authored MathOverflow offer is the primary reward evidence used here.

The sponsor records the general cases `k<=5` as proved. [Zhu's paper](https://arxiv.org/abs/0807.2207) proves `k=3,4`. Fresh searches also found the July 2026 [Fornal--Sun asymptotic result](https://arxiv.org/abs/2607.24655) for residue classes, which does not reach the exact conjectured bound.

The August 2026 [Menon preprint](https://arxiv.org/abs/2608.15873) gives the `A5`-harmonic tuple `(6,6,6,10,15)`, disproving Ginosar's stronger transfer-to-integer-residue-classes conjecture. It does not disprove Sun's conjecture: the repeated index 6 is already at least the tuple length 5. Its nine-coset extension has index multiset `(6,6,6,10,10,10,15,15,15)` and likewise does not disprove Sun's bound. Direct arXiv retrieval of this 2026 preprint was unavailable in this session; its arXiv-indexed abstract and the publicly available author manuscript metadata were checked. No full resolution of Sun's problem was found in this bounded status search.

The live repository already has [issue 231](https://github.com/1337isnot1337/solved-conjectures/issues/231). Its composition-series/private-prime proof and prime-power pairwise-gcd results were read before extending the present route. The present computation imposes no prime-power restriction and does not claim or reproduce that proof.

## Exact construction and search model

`search_cosets.py` constructs the alternating group as all even permutations, with exact composition. It enumerates all subgroups by adjoining generators until closure. One representative of each right coset of the current subgroup suffices because `<H,hg>=<H,g>` for `h in H`. It then generates every left coset of every proper subgroup.

For a threshold `D`, a binary variable chooses each coset. There is one set-packing constraint for every group element. Every index exceeding `D` can occur at most once. If two distinct indices have gcd exceeding `D`, their two classes cannot both be used. These conditions exactly encode disjoint coset families with all pairwise index gcds at most `D`. An integer solution with more than `D` selected cosets would be a full counterexample.

The solver is only a candidate generator. Every returned selection is independently checked with exact integer operations: subgroup closure, left-coset membership, pairwise set disjointness, Lagrange index, and all pairwise gcds. Solver-reported infeasibility and optimality are not promoted to independent proof certificates.

## Completed computations

| Group | Subgroups generated | Proper-subgroup cosets generated | Outcome |
| --- | ---: | ---: | --- |
| `A5` | 59 | 1,018 | At thresholds `5,6,10,12,15,20,30`, HiGHS reported maximum packing size exactly equal to the threshold. No counterexample. |
| `A6` | 501 | 35,245 | The 25-second runs at thresholds `6,10,15` timed out, with reported upper bounds `11,14,18`. No useful negative conclusion follows. |

An initial generic `A6` run spent too long in preprocessing and was interrupted. The recorded timed runs disabled presolve and used one solver thread. No job was left running.

### One specific nonabelian construction

The index tuple

```math
(\underbrace{15,\ldots,15}_{13\ \mathrm{times}},20,30,45)
```

would be a full counterexample in `A6`: it has length 16, maximum pairwise gcd 15, and would occupy `13*24+18+12+8=350` of the 360 elements.

`target_a6.py` tests this exact tuple. Translation makes its index-20 coset contain the identity. Exact conjugation shows that all ten index-20 subgroups belong to a single conjugacy class, so only one fixed subgroup needs to be considered. The remaining candidates comprise 252 cosets of index 15, 666 of index 30, and 1,620 of index 45. HiGHS reported the resulting feasibility model infeasible in 22.4 seconds. There is no independent infeasibility certificate, so this is recorded only as a failed construction attempt.

## Reproduction

Requirements are Python, NumPy and SciPy. `search-summary.json` records the installed versions, settings and results. Run from this directory:

```bash
python search_cosets.py --thresholds 6,5,10,12,15,20,30 --seconds 20 --presolve --threads 0 --output a5-search.json
timeout 150s python search_cosets.py --degree 6 --thresholds 6,10,15 --seconds 25 --threads 1 --output a6-search.json
timeout 45s python target_a6.py
```

SciPy warns that the `threads` option is passed through to HiGHS; that pass-through is intentional. Generated `a5-search.json` and `a6-search.json` contain the full subgroup and coset data. The compact `search-summary.json` is sufficient for the research checkpoint; the larger generated files can be reproduced and need not be committed.

This route is stopped at this checkpoint. Enlarging the group list without a new construction would produce further bounded evidence, not the requested full solution.
