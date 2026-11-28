# Eight-speed loneliness spectrum

**Related earlier work.** The one-very-fast-runner regime of the spectrum conjecture (Kravitz, Conjecture 8.3) for eight speeds was established earlier in Lee Marshall's [ai-math-results](https://github.com/LeeMarshall1113/ai-math-results/tree/a43cb0b9e0b6f762118b2acb8ee62cd31bdcbc89/results/lonely-runner-tight-6-7), released 29 October 2026. Cite that work for that regime. [Details](PROOF.md)

Kravitz’s spectrum prediction holds for eight speeds. The values below $1/8$ are exactly $s/(8s+1)$ for positive integers $s$. Three infinite families and 17 sporadic tuples give all primitive speed sets with these values.

[Proof](PROOF.md) · [Sporadic tuples and exact values](sporadic.txt) · [Verifier](verify.py) · [Catalogue](../../CONTENTS.md)

Run from the repository root with Python 3.10 or later and a C++20 compiler.

```sh
python3 results/eight-speed-spectrum/verify.py
```
