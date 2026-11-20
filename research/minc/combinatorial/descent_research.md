# Descent mechanisms for the regular permanent problems

Date: 20 November 2026. These are research reductions and diagnostics. Neither Conjecture 6 nor Conjecture 24 is solved here.

## Conjecture 24: a broader local-descent question

The infinite family in `switch_descent_obstruction.md` defeats the requirement that every step reduce the collision count immediately. It does not defeat the following stronger search mechanism:

> Does every nonbinary k-regular nonnegative integer matrix of order n, with k <= n, admit a unit 2-by-2 switch that decreases the pair (permanent, collision count) in lexicographic order?

If true, this would imply that every global permanent minimizer with the least collision count is binary, and hence would prove Conjecture 24. This statement is not proved.

`check_all_switches.cpp` inspects every feasible switch of a supplied matrix exactly. For the order-10, degree-5 obstruction, its categories are:

| Collision change | Feasible switches | Strict permanent decreases | Equal permanent | Least resulting permanent |
| --- | ---: | ---: | ---: | ---: |
| Negative | 18 | 0 | 0 | 7632 |
| Zero | 525 | 488 | 13 | 6840 |
| Positive | 441 | 32 | 9 | 6984 |

The initial permanent is 7488. Thus the obstruction is readily bypassed if intermediate collision-preserving steps are permitted. This numerical diagnostic supplements, and does not replace, the symbolic six-cycle escape already proved.

### Exact switch calculation

Put `F = per(A)`, `g_ij = per(A(i|j))`, and `h_ir,js = per(A(i,r|j,s))` for distinct rows i,r and columns j,s. The switch subtracting one at (i,j),(r,s) and adding one at (i,s),(r,j) changes the permanent by

```math
\Delta_{ij;rs}F
=g_{is}+g_{rj}-g_{ij}-g_{rs}+2h_{ir,js}.
```

Let `R_i = sum_j g_ij` and `S_j = sum_i g_ij`. For k-regular A, summing the switch changes with weights a_rs gives the exact identity

```math
\sum_{r\ne i,\,s\ne j}a_{rs}\Delta_{ij;rs}F
=k(R_i+S_j)-nF-[n(k-2)+2]g_{ij}.
```

To check it, expand each of the four cofactor sums using the row and column sums of A. The final term uses

```math
\sum_{r\ne i,\,s\ne j}a_{rs}h_{ir,js}=(n-1)g_{ij},
```

which is the sum of the Laplace expansions of the (n-1)-square minor over all its rows.

If a_ij > 0 and A has no permanent-decreasing switch, every switch in the weighted sum is feasible, so its right side is nonnegative. Summing these necessary inequalities with weights a_ij yields

```math
\sum_{i,j}g_{ij}
\ge \frac{n[n(k-1)+1]}{k^2}\,F.
```

This consequence has not provided the missing binary-entry conclusion. In particular, it does not distinguish an entry equal to one from an entry greater than one.

### Search implementation and outcomes

`search_local_minima.cpp` computes the permanent and every first cofactor by exact forward/reverse subset dynamic programming. For each pair of deleted rows it computes all second cofactors together. Each proposed switch is checked again by recomputing the resulting permanent, so the algebraic change formula and implementation are compared at every accepted move.

The searches begin at random sums of permutation matrices and take the best lexicographic switch until no such switch exists. They are not exhaustive. Every recorded terminal matrix was binary:

| Order n | Degree k | Starts |
| ---: | ---: | ---: |
| 8 | 4 | 1000 |
| 10 | 5 | 3000 |
| 12 | 4 | 3000 |
| 12 | 6 | 1000 |
| 14 | 4 | 500 |
| 14 | 7 | 200 |

Total: 8700 starts. The seed is 20261120. The arithmetic is exact unsigned 64-bit arithmetic for permanents and signed 64-bit arithmetic for differences; in all recorded runs the upper bound k^n is below the signed range. Logs are named `local_minima_nN_kK.log`, except the first order-8 run whose output was recorded in the tool transcript.

The earlier failed four-cycle conjecture also had extensive favorable random evidence before an analytic obstruction was found. These searches therefore should not be presented as establishing the broader descent statement.

## Conjecture 6: adding a complementary perfect matching

Let A be a binary k-regular matrix, 1 <= k < n, and put C = J-A. A sufficient statement for all of Conjecture 6 is:

```math
\text{There exists a permutation matrix }Q\le C\text{ such that }
\frac{\operatorname{per}(A+Q)}{(k+1)^n}
\le \frac{\operatorname{per}(A)}{k^n}.
```

Indeed, apply the statement to a minimizer at degree k. This is stronger than the original conjecture because it requires an improving degree-(k+1) supergraph of each input matrix. It is an unproved auxiliary assertion.

For Q uniform among the perfect matchings of C, the exact average is

```math
\mathbb E\operatorname{per}(A+Q)
=\frac{1}{\operatorname{per}C}
\sum_{r=0}^n\sum_{|I|=|J|=r}
\operatorname{per}A[I,J]\,
\operatorname{per}C[I,J]\,
\operatorname{per}C[I^c,J^c].
```

Proof: expand a matching of A+Q by the rows and columns I,J on which it uses A. Its remaining edges must come from Q. Sum over that partial C-matching and then over the ways to complete it to Q inside C[I,J]. This gives the three permanent factors.

A suitable upper bound for this average would prove the auxiliary assertion. The coefficient-capacity bounds used for Problem 18 are lower bounds, so they do not supply it directly. No such upper bound is established here.

### Why an arbitrary complementary matching is insufficient

Take A = I+P for an n-cycle permutation matrix P and Q = P^(-1), for n >= 3. Then per(A)=2, while

```math
\operatorname{per}(I+P+P^{-1})=L_n+2,
```

where L_n is the nth Lucas number. The Lucas term counts matchings of a cycle consisting of fixed points and adjacent transpositions; the two additional permutations traverse the entire cycle in one direction. Since `L_n` grows as `((1+sqrt(5))/2)^n`, this exceeds `2(3/2)^n` for all sufficiently large n. In fact it already does so at n=9 and n=10, and the recurrence verifies all n>=9.

Thus one must choose Q or average it effectively; normalized monotonicity does not hold for every individual complementary matching. This is an obstruction to another proof mechanism, not a counterexample to Conjecture 6.

## Current literature checkpoints

- [Minc Conjecture 6, current statement and progress](https://yair-lavi.com/mincs-list/conjecture-6/index.html).
- [Minc Conjecture 24, current statement and progress](https://yair-lavi.com/mincs-list/conjecture-24/index.html).
- [Wanless, On Minc's sixth conjecture](https://doi.org/10.1080/03081080600562670), 2007: sparse, dense, and small-order ranges.
- [Wanless, Addendum to Schrijver's work on minimum permanents](https://users.monash.edu.au/~iwanless/papers/Schrijminper.journalvers.pdf), 2006: equality of exponential rates does not resolve equality of fixed-order minima.
- [Hedrick, p-Minors of a doubly stochastic matrix at which the permanent achieves a minimum](https://www.sciencedirect.com/science/article/pii/0024379575900099), 1975: necessary conditions for continuous local minimizers. These cannot be assumed for an integer-grid minimizer.

