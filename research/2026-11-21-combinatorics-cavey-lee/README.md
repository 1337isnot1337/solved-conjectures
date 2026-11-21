# Cavey–Lee's conjecture

Status: **incomplete**. The conjecture requires both the complete triangular product of linear factors and nonnegative coefficients after division.

[DIVISIBILITY.md](DIVISIBILITY.md) gives a proposed proof of all the factors and integrality of the quotient using the prior Sergeev–Veselov super-Macdonald kernel theorem. Independent review is pending. Quotient positivity is unresolved; no new completed result is counted.

The exact counterexample screen implements the original nonintersecting Schröder path model. It has found no counterexample in 190 distinct inspected partitions. This is finite evidence only. [screen.json](screen.json) records the precise partition list and counts, including the overlap between the two runs. The published square-shape formula and q,t symmetry were used as convention checks.

Reproduce from this directory:

```sh
g++ -O3 -std=c++17 cavey_lee_enumerate.cpp -o cavey_lee_enumerate
python3 cavey_lee_screen.py --min-n 10 --max-n 14 --min-rank 3 --output rank3.json
python3 cavey_lee_screen.py --min-n 10 --max-n 12 --min-rank 2 --output rank2.json
```

The C++ counter refuses unsupported grid sizes and count overflow. Timeout cases are recorded separately by the Python driver and cannot become positive verification records. No Lean work.

Coordination: [issue #188](https://github.com/1337isnot1337/solved-conjectures/issues/188). Primary source: [Cavey–Lee, arXiv:2501.17765v1, Conjecture 5.1](https://arxiv.org/html/2501.17765v1).
