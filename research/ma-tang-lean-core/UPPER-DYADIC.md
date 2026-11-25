# Ma–Tang’s random subset-sum threshold conjecture: upper-bound bookkeeping

**Checked partial formalization.** [The integer recurrence](../../lean/Conjectures/MaTangCoreUpperDyadic.lean) turns the initial missing-mass estimate and the exact shift-square identity into the per-prefix failure bounds. It sums those bounds to an iid failure fraction at most 5/16 and verifies that the last good prefix leaves zero missing elements. The proposed sample size also meets the collision budget for every alphabet of size at least 65536.

[The actual ordered-distinct transfer](../../lean/Conjectures/MaTangCoreUpperDistinct.lean) counts collisions on any duplicate-free finite alphabet and proves the seven-eighths retained fraction. Given an iid failure count at most 5/16, it proves distinct failure at most 5/14 and strictly more than half successful ordered distinct words.

This formalizes parts of the finite upper-bound route for [Ma–Tang Problem 4.1](https://arxiv.org/html/2602.05768v2#S4), using the smoothing argument of [Erdős–Rényi, Theorem 2](https://www.renyi.hu/~p_erdos/1965-15.pdf). The literal group second moment, shift-square identity and first-failure sample decomposition must still supply the inputs. The unordered general-group endpoint, threshold bridge and real-log limsup are not claimed. There is no new conjecture, status increase or change of attribution.

Pinned Lean 4.35.0 passed strict compilation on the 18-module import closure, the all-owned audit (987 declarations, 699 theorems, 69 private declarations; seven required endpoints) and stock kernel replay on all 18 modules. [Exact receipt](verification/upper-dyadic-receipt.json). Reproduce with `python3 research/ma-tang-lean-core/verify_upper_dyadic.py` using pinned `lean` and `leanchecker` on PATH.
