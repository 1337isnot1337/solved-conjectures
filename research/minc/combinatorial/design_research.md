# Ryser's design conjecture: a limitation of Gram-matrix comparisons

Date: 2026-11-20. Conjecture 5 remains unresolved here.

The full conjecture asks whether **some** symmetric design minimizes the permanent whenever the relevant parameters admit a design. It does not say every design is a minimizer. A counterexample at given parameters must therefore beat every design at those parameters.

## Exact design data

[Ted Spence's primary design collection](https://www.maths.gla.ac.uk/~es/symmdes/2designs.php) lists all five symmetric 2-(15,7,3) designs in [this data file](https://www.maths.gla.ac.uk/~es/symmdes/15-7-3). The matrices, in that order, are copied with provenance in `design_gram_probe.py`. The script checks every row and column sum and every entry of the Gram matrix before computing the permanents with arbitrary-precision integer subset dynamic programming.

| Design in source order | Permanent |
| ---: | ---: |
| 1 | 24,601,472 |
| 2 | 24,582,016 |
| 3 | 24,572,288 |
| 4 | 24,567,424 |
| 5 | 24,567,424 |

Every matrix has Gram matrix `4I + 3J`. Thus the Gram matrix, and hence the singular values, do not determine the permanent even within one symmetric-design parameter set. This calculation is an obstruction to a proof based only on recovering the permanent from those data. It is not a disproof of Ryser's conjecture, and no novelty is claimed for the numerical design permanents.

## Counterexample diagnostic

The command

```text
./search_local_minima 15 7 200 24567424 > design_search_n15_k7.log
```

used exact permanent arithmetic and the seed 20261120 to seek a matrix below the least design permanent. It terminated at a binary matrix in all 200 runs, found a design in 11 runs, and found no permanent below 24,567,424. The best matrix is saved in `local_min_best_n15_k7.txt`.

This is an incomplete diagnostic aimed at finding a full-conjecture counterexample. It is not a proof of the order-15 case, and an additional finite-order verification would not satisfy the user's requirement of a full named problem. No further table extension is claimed.

## Current status and sources

- [Current exact statement and existing partial results](https://yair-lavi.com/mincs-list/conjecture-5/index.html), checked 2026-11-20: open.
- Ryser, *Matrices of zeros and ones*, 1960, [DOI](https://doi.org/10.1090/S0002-9904-1960-10494-6).
- [Cheon and Wanless's 2005 survey](https://users.monash.edu.au/~iwanless/papers/permsurveyLAA.pdf).
- [Spence's complete small-design data](https://www.maths.gla.ac.uk/~es/symmdes/2designs.php).

Searches must distinguish this permanent-minimization conjecture from Ryser's covering conjecture and the separate Ryser design conjecture concerning nonuniform block sizes. Recent results on those namesakes do not settle Minc's Conjecture 5.
