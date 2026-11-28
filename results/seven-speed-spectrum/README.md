# Seven-speed loneliness spectrum

**Related earlier work.** The one-very-fast-runner regime of the spectrum conjecture (Kravitz, Conjecture 8.3) for seven speeds was established earlier in Lee Marshall's [ai-math-results](https://github.com/LeeMarshall1113/ai-math-results/tree/a43cb0b9e0b6f762118b2acb8ee62cd31bdcbc89/results/lonely-runner-tight-6-7), released 29 October 2026. Cite that work for that regime. [Details](PROOF.md)

The values below $1/7$ are exactly $s/(7s+1)$ for positive integers $s$, together with $3/23$, $5/37$ and $9/65$. The classification gives every primitive tuple attaining one of these values and implies Zhu’s triangle conjecture for seven distances.

[Proof](PROOF.md) · [Table of 27 sporadic tuples](sporadic.txt) · [Verifier](verify.py) · [Catalogue](../../CONTENTS.md)

From the repository root, run the following with Python 3.10 or later and a C++20 compiler.

```sh
python3 results/seven-speed-spectrum/verify.py
```

### Seven-coordinate implications with the five-speed input discharged

The new seven-coordinate critical-plane and large-norm statements supply Renault's proved five-speed runner theorem internally. Every new endpoint retains `hsix : PrimitiveSixClassification`. The plane results concern rational subspaces of dimension two. One classifies coordinate-free planes with value at most `1/7`; another assumes equality to `1/7` without a separate coordinate-free premise; the third states that equality is equivalent to `StandardProductPlane`.

The quantitative results concern positive primitive natural speed vectors with Euclidean norm at least `7 * 42^10`. Below loneliness `1/7`, such a vector is a permutation of `[1,2,3,4,5,6,7*s]` for an integer `s >= 1`, and its loneliness is `s/(7*s+1)`. The family equivalence puts the strict loneliness inequality on the left side of its equivalence. No separate distinctness premise is added. The six-speed classification remains an assumption; these implications do not establish the full seven-speed classification.

[Exact scope and evidence](../../docs/lean-status.md#seven-coordinate-implications-with-the-five-speed-input-discharged).
