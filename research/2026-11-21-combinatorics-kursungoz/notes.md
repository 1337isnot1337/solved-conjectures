# Kurşungöz's conjecture

Date: 21 November 2026. Status: research in progress; no resolution claimed.

The target is Conjecture 4 of Kağan Kurşungöz, *An Alternative Generating Function for k-Regular Partitions*, [arXiv:2502.17117v1](https://arxiv.org/pdf/2502.17117), page 9: the polynomials in Theorem 3 are unimodal for all multiplicity vectors and every maximum multiplicity. The author's [April 2025 seminar slides](https://pages.mtu.edu/~wjkeith/PartitionsSpecialtySeminar/Kagan-Kursungoz-Apr2025.pdf) repeat the same full conjecture. The following reduction retains every parameter.

## Reversing the recurrence

Write the multiplicity vector in increasing order as $`\mathbf n=(n_1,\ldots,n_k)`$, put $`S=\sum_{j=1}^k jn_j`$, and let $`[r]_q=1+q+\cdots+q^{r-1}`$. The source recurrence is

```math
b(\mathbf n;q)=\sum_{j:n_j>0}q^{\sigma_j(\mathbf n)}
\left(\prod_{r=1}^{j-1}[S-r]_q\right)b(\mathbf n-e_j;q),
\qquad
\sigma_j(\mathbf n)=\sum_{h>j}(h-j)n_h.
```

The zero vector has polynomial 1; a negative coordinate has polynomial 0. Define

```math
D(\mathbf n)=\sum_j n_j\binom{j-1}{2}
 +\sum_j\binom{n_j}{2}j(j-1)
 +\sum_{i\lt j}n_i n_j(ij-i).
```

For every $`j`$ with $`n_j>0`$, direct subtraction gives

```math
D(\mathbf n)-D(\mathbf n-e_j)
=\sigma_j(\mathbf n)+\sum_{r=1}^{j-1}(S-r-1).
```

Thus every nonzero summand in the recurrence has the same degree $`D(\mathbf n)`$. Induction proves that this is the degree of $`b`$. All coefficients are nonnegative, so the leading terms cannot cancel. Reversing the polynomial gives

```math
C(\mathbf n;q):=q^{D(\mathbf n)}b(\mathbf n;q^{-1})
=\sum_{j:n_j>0}\left(\prod_{r=1}^{j-1}[S-r]_q\right)
C(\mathbf n-e_j;q).                                      \tag{1}
```

The explicit shifts have disappeared. Reversal preserves unimodality and log-concavity, so either coefficient inequality may be investigated using (1).

## A permutation interpretation

Write each cycle of a permutation with its least entry first, order cycles by their least entries, and erase the parentheses. Weight the permutation by $`q`$ to the number of inversions of this flattened word. Then $`C(\mathbf n;q)`$ enumerates permutations having $`n_j`$ cycles of length $`j`$.

Indeed, remove the first cycle, which contains 1, and suppose its length is $`j`$. Choose its other $`j-1`$ entries from $`\{2,\ldots,S\}`$ and order them. The inversions between this first block and the remaining word have generating polynomial the Gaussian binomial $`\binom{S-1}{j-1}_q`$. The inversions within the ordered entries have generating polynomial $`[j-1]_q!`$. Their product is $`\prod_{r=1}^{j-1}[S-r]_q`$. The standardized remaining cycles have multiplicities $`\mathbf n-e_j`$, which proves (1) for this model and hence the interpretation by induction.

In particular,

```math
b(\mathbf n;1)=C(\mathbf n;1)
=\frac{S!}{\prod_j j^{n_j}n_j!}.
```

This last identity can also be checked directly: each summand in (1), at $`q=1`$, is $`(S-1)!j n_j/\prod_h h^{n_h}n_h!`$, and their sum uses $`\sum_j jn_j=S`$.

## A generating function

Let $`[S]_q!=\prod_{r=1}^{S}[r]_q`$ and

```math
\mathcal C(x_1,\ldots,x_k)=\sum_{\mathbf n\ge0}
\frac{C(\mathbf n;q)}{[S]_q!}x_1^{n_1}\cdots x_k^{n_k}.
```

Dividing (1) by $`[S]_q!`$ shows that

```math
\mathcal C(qx_1,q^2x_2,\ldots,q^kx_k)
=\left(1-(1-q)\sum_jx_j\right)\mathcal C(x_1,\ldots,x_k).
```

Iterating coefficientwise in the $`q`$-adic expansion yields

```math
\mathcal C(\mathbf x)=\prod_{r\ge0}
\left(1-(1-q)\sum_jq^{jr}x_j\right)^{-1}.                 \tag{2}
```

These structural identities do not yet prove unimodality. In particular, a sum of log-concave polynomials need not be log-concave, so (1) does not support an induction without an additional compatibility inequality between its summands.

## Checks and unresolved step

The exact source recurrence was evaluated for every integer partition of total weight at most 30. These examples satisfy the stronger coefficient log-concavity property. This is a diagnostic observation only and contributes no general proof. The script `kurs_explore.py` reproduces the calculation; it is not a solution certificate.

The unresolved step is an all-parameter inequality for the inversion distribution of flattened permutations with fixed cycle multiplicities, or another argument implying unimodality. A literature search for this equivalent interpretation is in progress.

Initial exact-title, author-name, arXiv-number, and unimodality searches in both web engines locate the original paper and seminar, not a resolution. Global GitHub exact-arXiv queries timed out; author/unimodality queries found an unused bibliography entry in `qqliu/CoPEER` and a registry entry in `graph-theory-AI/mathpocalypse-project`. Scoped exact-arXiv searches in the latter project, `graph-theory-AI/Graph-Theory-LLM-Proofs`, and `the-omega-institute/trureturing` returned no matches. This is a bounded priority search, not evidence of exhaustive absence.
