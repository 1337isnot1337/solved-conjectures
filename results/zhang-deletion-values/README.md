# Zhang's Question 8.4: deletion values of the lonely runner

[Catalogue](../../CONTENTS.md) · [Proof](PROOF.md) · [Exact checks](verify.py) · [Issue #130](https://github.com/1337isnot1337/solved-conjectures/issues/130)

**Status:** Complete elementary proof. The answer to Question 8.4 of Zhang's *Tight instances of the Lonely Runner Conjecture* is yes for all `n >= 4`. The note is unrefereed.

**Contributor:** [@aadrianvv](https://github.com/aadrianvv). Original proof, verifier, and result package submitted in [PR #143](https://github.com/1337isnot1337/solved-conjectures/pull/143).

**Lean status:** none. No Lean formalization is included.

## Result

For `n >= 3`, `1 <= r <= n-1`, and `V = [n-1] \ {r}`, the note determines every deletion value:

- `LR(V) = 1/r` when `2r > n-1`;
- `LR(V) = 2/D_r` when `2r <= n-1`, where `D_r` is the least integer at least `n+r` that is coprime to `r`.

In particular, `LR([n-1] \ {r}) > 1/(n-1)` for all `n >= 4` and `1 <= r <= n-2`, so the answer to Question 8.4 is yes. The restriction `n >= 4` is sharp: for `(n, r) = (3, 1)` the set is `{2}` and equality holds.

Primary source: Y. Zhang, *Tight instances of the Lonely Runner Conjecture: complete classification of one-entry modifications, a new infinite family, and the growth bound*, [arXiv:2608.13599](https://arxiv.org/abs/2608.13599), version 3 (18 October 2026), Question 8.4.

## Verification

Run from the repository root with Python 3.10 or later and no other dependencies:

```sh
python3 results/zhang-deletion-values/verify.py
```

The script checks the closed formula in all 779 cases with `3 <= n <= 40` and `1 <= r <= n-1`, checks the strict inequality in all 740 cases with `n >= 4` and `r <= n-2`, and checks the witness time used in the second case. It takes about 15 seconds.

The equality statement in the second case uses Liu's theorem as quoted by Zhang; the verifier confirms it for `n <= 40`.
