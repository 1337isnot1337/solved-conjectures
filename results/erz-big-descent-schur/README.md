# Elizalde–Rivera–Zhuang’s big-descent Schur-positivity conjecture

**Lean status:** none.

For all $`n\ge0`$ and $`m\ge1`$, the big-descent fundamental quasisymmetric function of permutations avoiding the increasing pattern of length $`m`$ is symmetric and Schur-positive. The same holds when the length of the longest increasing subsequence is fixed exactly. This proves Conjecture 4.9 in *Counting Pattern-Avoiding Permutations by Big Descents*. [Original conjecture](https://arxiv.org/pdf/2408.15111#page=29) · [Journal article](https://doi.org/10.1007/s00026-026-00805-1)

Compressing colored decreasing runs turns the length of the longest increasing subsequence into the first row length in the Robinson–Schensted–Knuth correspondence. An alternating binomial transform of standard-tableau dimensions then gives nonnegative Schur coefficients.

[Proof](PROOF.md) · [Independent review and sources](AUDIT.md) · [Exact regression verifier](verify.py) · [Two-color and higher-Durfee checks](check_review.py) · [Research issue #330](https://github.com/1337isnot1337/solved-conjectures/issues/330)

If you use this result, please credit the conjecture authors and Cinna Davis’s proof, and cite [the project](https://itsdavis.com/) and [the specific proof](https://github.com/1337isnot1337/solved-conjectures/blob/main/results/erz-big-descent-schur/PROOF.md).
