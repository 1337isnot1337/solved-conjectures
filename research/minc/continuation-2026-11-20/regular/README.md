# Minc C5 and C24 research checkpoint

20 November 2026, America/Chicago. No conjecture was resolved in this lane.

## Scope and prior work

[Minc C5](https://yair-lavi.com/mincs-list/conjecture-5/index.html) asks whether, whenever symmetric `(v,k,lambda)` designs exist, **some** design attains the minimum permanent among binary matrices of order `v` and line sum `k`. A disproof must beat every design of the chosen parameters.

[Minc C24](https://yair-lavi.com/mincs-list/conjecture-24/index.html) asks whether an integer nonnegative regular permanent minimizer can always be chosen binary when `1 <= k <= n`.

The existing repository work was read before attempting new routes, including the infinite obstruction to collision-decreasing four-switch descent, whole-matching replacement identities, connectedness of integer minimizers, and the exact weighted four-switch inequalities. Those reductions do not imply C24. The concurrently active C6 complement-matching lane was not duplicated.

Both search engines were checked for full C24 resolutions, integer permanent minima, and regular multigraph simplification. The inspected results did not supply a full theorem. This is a bounded negative search, not an exhaustive priority certificate.

## C5: exact redistribution of several rows

The new diagnostic fixes all but `r` rows of a design and preserves all column sums while redistributing the free entries. It was intended to find a counterexample to the full C5 assertion. No favorable finite search is counted as a solved problem or as a new finite-order theorem.

For fixed rows `B` and an `r`-set of columns `S`, let

```math
h(S)=\operatorname{per} B[[n-r],[n]\setminus S].
```

The program computes every `h(S)` together by exact subset dynamic programming. If the free rows are `x_1,...,x_r`, their full permanent is then

```math
\sum_{j_1,\ldots,j_r\ \mathrm{distinct}}
\left(\prod_{i=1}^r x_{i,j_i}\right)h(\{j_1,\ldots,j_r\}).
```

At a column whose required free-row sum is `s`, the search assigns a binary `r`-vector of weight `s`. It prunes when a row exceeds its prescribed sum or cannot reach it using the remaining columns. Rows with equal assigned prefixes are exchangeable. Requiring each new chosen subset to be an initial segment within each equal-prefix group removes row-permutation duplicates without changing the attainable permanent set.

The `representatives` mode takes one selected row subset for each histogram of its column sums. **This histogram is not asserted to classify automorphism orbits.** Consequently the runs are not a verification of every modification on the stated number of rows. The `all` mode visits every row subset, but it was not used for the larger runs below.

### Recorded results

| Starting matrix | Free rows | Feasible representatives evaluated | Best permanent |
| --- | ---: | ---: | ---: |
| `PG(2,3)` | 4 | 958,680 labeled assignments, before symmetry pruning | 3,852 |
| `PG(2,3)` | 5 | 2,261,790 assignments after row symmetry pruning | 3,852 |
| Least-permanent supplied `(16,6,2)` design | 4 | 11,737,476 assignments after row symmetry pruning | 7,107,840 |

The logs record each selected row set separately. Smaller three-row exploratory checks also found no witness. An initial unsymmetrized five-row run was interrupted before completing; its partial output was not used.

`pg13.txt` was generated directly from the nonzero vectors of `F_3^3`, normalizing the first nonzero coordinate to one and declaring incidence by zero dot product. Its permanent is 3,852. The unique projective plane of order three is the only `(13,4,1)` design up to equivalence: [Conway, Elkies, and Martin, Proposition 2.2](https://jeremymartinmath.github.io/papers/mathieu.pdf) provides an explicit proof, and [Spence's catalogue](https://www.maths.gla.ac.uk/~es/symmdes/13-4-1) lists one design. A matrix below 3,852 would therefore have been a full counterexample, not merely a better bound.

The three matrices `d16_1.txt`, `d16_2.txt`, `d16_3.txt` are copied from [Spence's complete `(16,6,2)` data](https://www.maths.gla.ac.uk/~es/symmdes/16-6-2). Their row sums, column sums and Gram matrices were checked, and their exact permanents are 7,114,752; 7,110,144; and 7,107,840. The search used the least of all three as its disproof threshold. These numerical design permanents are not claimed as new results.

The order-15 inputs are the fourth and fifth matrices of [Spence's `(15,7,3)` data](https://www.maths.gla.ac.uk/~es/symmdes/15-7-3), already documented in the repository's earlier design audit. Their common permanent is 24,567,424.

### Reproduction

```sh
g++ -O3 -std=c++20 row_redistribution.cpp -o row_redistribution
./row_redistribution pg13.txt 5 3852 representatives
./row_redistribution d16_3.txt 4 7107840 representatives
```

All recorded values fit unsigned 64-bit integers, since the permanent is at most `k^n`. A discovered candidate is recomputed by the independent full-matrix subset recurrence in the same program before output. No candidate was obtained. No Lean work was performed.

## C24: entropy route and the unresolved gap

The new source checked was Suvrit Sra, *A new proof of van der Waerden's inequality, and beyond*, version 1, 31 October 2026: [full primary PDF](https://suvrit.github.io/papers/gurvits-lower/gurvits-lower-v1.pdf). Its Theorem 2.1 says that `I(P)=S(P)-Hperm(P)` increases when two rows or columns of a doubly stochastic marginal matrix are averaged. Corollary 2.6 derives `log per(P) >= -I(P)` through relative entropy. The result concerns `I`, not monotonicity of the permanent.

For clarity, let `mu_P` maximize entropy among permutation laws with marginals `P`, and let `nu_P(sigma)=prod_i p_(i,sigma(i))/per(P)`. Direct substitution gives the exact identity

```math
\log\operatorname{per}P=-I(P)+D(\mu_P\|\nu_P).
```

Therefore increasing `I` under an averaging operation does not order the two permanents unless the change in the nonnegative relative-entropy term is also controlled. In addition, averaging or reparametrizing the Gibbs law need not preserve the lattice with entries in multiples of `1/k`. Neither missing step was proved. This source does not settle C24.

The Sra PDF was ultimately read through the author's public website after the repository PDF endpoint and one Pyroam retrieval failed. No host access was used.

The older [Gurvits answer from 2013](https://mathoverflow.net/questions/128741/is-rysers-conjecture-on-permanent-minimizers-still-open) already notes that, for fixed degree, asymptotic minimizers have only `O(log n)` nonbinary rows. Its underlying cited papers are [Gurvits, arXiv:0711.3496](https://arxiv.org/abs/0711.3496) and [Gurvits, arXiv:1106.2844](https://arxiv.org/abs/1106.2844). The observation must not be promoted as a new discovery of this campaign.

The remaining C24 question is a fixed-order binary-attainment theorem or an exact integer matrix below the binary minimum. No such result was obtained.
