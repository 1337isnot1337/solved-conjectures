# Exact lower endpoint of the finite dandelion remainder

The [all-orders missing-leaf theorem](MISSING-LEAF.md) covers every
pair with a leaf on both sides, and the [interval theorem](INTERVAL-LEAF-THRESHOLD.md)
covers all orders at least 65. Here the finite remainder is additionally
closed at orders 4 through 10. The [finite interval certificate](FINITE-INTERVAL.md) covers 21 through 64.
Only orders 11 through 20 with at least one side having no leaf remain.

The check below is exact for the larger family of pairs of connected
graphs, irrespective of diameter. It is the lower endpoint of the
same dandelion conjecture, not a separate numerical claim.

## Exact test

Use nauty 2.9.3 `geng -cq n` to generate one graph6 line per connected
unlabelled simple graph. Reject disconnected complements and skip
the analytically solved double-leaf case. The
[`check_small_dandelion.cpp`](check_small_dandelion.cpp) program
then searches for dyadic lower bounds on both connectivities with
sum strictly above the dandelion value. It checks those witnesses
with exact outward-rounded **integer** Schur elimination; the
ordinary floating bisection only proposes candidates and cannot
accept one.

To check a bound $`t/256`$, represent a vector by its first $`n-1`$
entries with final entry zero, then subtract its average. The
Laplacian energy is unchanged, while its squared norm has matrix
$`I-J/n`$ in the first $`n-1`$ coordinates. Positive definiteness
of the difference of these quadratic forms gives a strict lower
bound. The program multiplies the form by $`256n`$ and keeps integer
intervals with scale 8192. Each division uses the appropriate
floor and ceiling; every accepted lower Schur pivot is positive.
It aborts a candidate comparison when its intermediate interval is
too large, so the tested integers cannot overflow.

For the upper target use the cubic in [Lemma 4.2 of the original
paper](https://arxiv.org/pdf/2201.04225#page=15). Its three real
roots include one in $`(0,1)`$ and one in $`(n-1,n)`$ by the cubic's
signs at the endpoints (the third lies between); these are the
extremal nonzero dandelion eigenvalues. Bisection on the
$`1/65536`$ grid gives an upper bound on the small root and a
lower bound on the large root. The sum with the complementary
connectivity is bounded above by the difference of those endpoints
plus $`n`$; the program rounds the target further upward.

```sh
g++ -O3 -std=c++17 check_small_dandelion.cpp -o check_small_dandelion
for n in 4 5 6 7 8 9 10; do
  geng -cq "$n" | ./check_small_dandelion "$n"
done
```

| Order | Connected representatives | Both connected | No double leaf | Uncertified |
| ---: | ---: | ---: | ---: | ---: |
| 4 | 6 | 1 | 0 | 0 |
| 5 | 21 | 8 | 3 | 0 |
| 6 | 112 | 68 | 46 | 0 |
| 7 | 853 | 662 | 540 | 0 |
| 8 | 11,117 | 9,888 | 9,037 | 0 |
| 9 | 261,080 | 247,492 | 238,666 | 0 |
| 10 | 11,716,571 | 11,427,974 | 11,281,570 | 0 |

[Coordination #962](https://github.com/1337isnot1337/solved-conjectures/issues/962).
