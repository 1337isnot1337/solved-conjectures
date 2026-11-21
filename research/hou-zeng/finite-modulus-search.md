# Residue classes for Hou–Zeng and Sun’s squarefree power-sum conjecture

Hou and Zeng offer US$200 for the first explicit counterexample their program can confirm. Sun offers US$250 for the first explicit counterexample to his squarefree power-sum conjecture. Each verified witness below rules out one potential counterexample. Both conjectures remain open. [Hou and Zeng, Remark 1.14](https://arxiv.org/pdf/0901.3075) · [Sun’s offer](https://oeis.org/A304081)

## An obstruction to covering all shifts by small primes

Let $M=2\cdot3\cdot5\cdot7\cdot11\cdot13\cdot17\cdot19=9699690$. A shift in the first row is a sum of a positive Fibonacci and a Catalan number. In the second row it is a squarefree $s=2^a+5^b$ with $a\ge1$, $b\ge0$. In the third row it is twice such an $s$. The two Sun rows follow from the [parity equivalence](../sun-squarefree-powers/README.md).

| Family | Lower bound on the target | Distinct shifts at most the lower bound minus 3 | Minimum number giving an odd residual coprime to $M$ | Residue classes attaining the minimum |
| --- | ---: | ---: | ---: | ---: |
| Hou–Zeng | 50,000,000,000,001 | 1,706 | 142 | 1 |
| Sun, even | 80,500,000,001 | 448 | 88 | 6 |
| Sun, odd | 80,500,000,001 | 432 | 82 | 4 |

These lower bounds apply to every target of the indicated parity above or equal to the cutoff, with no upper limit. Fix the shifts counted in a row. Each residual is at least three, and its coprimality depends only on the target modulo $M$. A composite residual can still have all of its prime divisors above 19.

**Verification.** Start an integer array on the product of the residue sets modulo the eight primes. Each shift contributes one unit in its own residue cell. For each prime coordinate in turn, replace each entry by the sum of the entries with the same other coordinates and a different residue in that coordinate. After the first $j$ coordinates, the count at a cell enumerates shifts differing in the first $j$ coordinates and matching in all remaining coordinates. This follows by induction and proves that the final array counts the shifts coprime to the target after subtraction. The Chinese remainder theorem identifies the cells with all classes modulo $M$. Taking the minimum over the permitted parity gives the table.

## Counterexample search

For ranking purposes the search includes all shifts up to the **upper** endpoint minus three. It orders classes by increasing coprime-shift count, breaking ties by the least nonnegative residue. These scores can exceed the uniform lower bounds above. For each selected class and shift, the segmented sieve tests positive candidate residuals against all possible prime factors through the square root, preserving a prime equal to the sieving factor. It skips shifts too large at the start of a chunk. Every integer left without a witness receives a full check. The replay independently generates both sequences, verifies each selected score by direct gcd, and checks the squarefreeness of Sun’s shifts. [Ranking](rank_residues.py) · [Sieve](progression.cpp) · [Replay](replay_ranking.py)

| Family | Inclusive interval | Classes checked | Inputs with a certified prime witness |
| --- | --- | ---: | ---: |
| Hou–Zeng | 50,000,000,000,001 to 100,000,000,000,000 | First 8 | 41,238,431 |
| Sun, even | 80,500,000,001 to 1,000,000,000,000 | First 256 | 24,267,976 |
| Sun, odd | 80,500,000,001 to 1,000,000,000,000 | First 256 | 24,267,970 |

The table covers only the listed residue classes. Every input in those classes and intervals had a witness in the segmented sieve. For the upper-endpoint rankings the minimum scores are 146, 103 and 97 respectively.

Run from this directory with Python, NumPy and a C++17 compiler. To reproduce a uniform lower bound, pass the lower endpoint as **both** endpoints to the ranking script. Retain the number of minimizers plus one and check the score of the first class after the tie.

```sh
c++ -O3 -std=c++17 -Wall -Wextra -Werror progression.cpp -o /tmp/crt-sieve
python3 rank_residues.py hou 50000000000001 100000000000000 128 /tmp/hou.json
python3 rank_residues.py sun-even 80500000001 1000000000000 256 /tmp/sun-even.json
python3 rank_residues.py sun-odd 80500000001 1000000000000 256 /tmp/sun-odd.json
python3 replay_ranking.py /tmp/crt-sieve /tmp/hou.json --stop 8
python3 replay_ranking.py /tmp/crt-sieve /tmp/sun-even.json
python3 replay_ranking.py /tmp/crt-sieve /tmp/sun-odd.json
```
