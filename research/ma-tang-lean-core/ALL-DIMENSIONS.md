# Ma–Tang’s mixed-group lower bound for all large dimensions

**Verified partial formalization.** For every natural $d\ge 2^{16}$, Lean proves that strictly fewer than half of the distinct ((d+r))-subsets cover the actual mixed group `F₂^d × F₃` by their subset sums, where `r = log₂ d − log₂(log₂ d + 1) − 6` uses integer logarithms. The previously checked module gave only one $d$ per $r$. The new endpoint is [`all_large_dimensions_below_half`](../../lean/Conjectures/MaTangCoreAllDimensions.lean). The general scaled inequality also covers arbitrary (d,r,k) with the stated range conditions.

The proof extends the existing exact singleton envelope above its original sample size, reuses the checked kernel incidence and two sampling transfers, and discharges the sample-size bounds by dyadic arithmetic. It follows the lower mechanism of the repository's [written proof](../../results/ma-tang-random-subset-sums/PROOF.md) for [Ma and Tang, Problem 4.1](https://arxiv.org/html/2602.05768v2#S4). Existing proof authorship and priority qualifications are unchanged. The exact finite result does not yet include the threshold monotonicity bridge, the universal upper result or the real-log limsup. No status promotion.

## Verification

At source base `f09c2df5`, Lean 4.35.0 passed 21 strict source builds, the 466-source-named axiom audit, the environment-wide all-owned audit of these 21 modules (1,150 declarations, 817 theorems, 84 private and 46 owned by the new module) and stock kernel replay for all 21. No new axiom or native computation certificate is used. See [the scoped receipt](verification/all-dimensions-receipt.json) for exact source hashes and endpoints.

Run `python3 research/ma-tang-lean-core/verify_all_dimensions.py` from the repository using the pinned `lean` and stock `leanchecker` on PATH. This is an Init-only proof closure. The audit driver additionally imports Lean elaborator utilities.
