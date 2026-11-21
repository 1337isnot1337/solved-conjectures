# Chen–Hazan 2024: prize and prior-result scope audit

21 November 2026. This is an eligibility audit, not a solution or a prize
claim. No target reservation, submission, or sponsor contact was made.

## Sponsor statement

The [PMLR paper](https://proceedings.mlr.press/v247/chen24e/chen24e.pdf)
and its [abstract page](https://proceedings.mlr.press/v247/chen24e.html)
offer US$500. Section 4 specifies an efficient black-box reduction
achieving equation (1). It does not explicitly offer a separate reward
for an impossibility theorem or document a payment.

The published problem assumes a differentiable function on all of
$`\mathbb R^d`$ with a $`\beta`$-Lipschitz gradient, an initial point
with $`f(x_1)-\inf f\le M`$, and an unbiased stochastic gradient oracle
with variance at most $`\sigma^2`$. It asks for iterates satisfying

```math
\frac1T\sum_{t=1}^T\mathbb E\|\nabla f(x_t)\|_2^2
\le O\!\left(\frac{\sqrt{M\beta}\,\mathop{\mathrm{Regret}}_T(\mathcal A)}T\right).
```

Here the opening definition makes $`\mathop{\mathrm{Regret}}_T(\mathcal A)`$
a guaranteed upper bound on regret against the best fixed comparator:

```math
\sum_t\ell_t(u_t)-\min_{u\in K}\sum_t\ell_t(u).
```

The aim is to retain the supplied learner's adaptive, dimension-sensitive
regret advantages, rather than merely recover an SGD rate. The paper
does not give a full formal specification of all permitted reductions.

The [author-hosted PDF](https://www.ehazan.com/open_problem.pdf) is an
earlier variant: its Assumption 2 requires a globally bounded range.
The published PMLR version requires only the initial gap. These versions
must not be interchanged when checking hypotheses. The PMLR statement
and its displayed equation were inspected visually.

## The 2026 paper does not justify a blanket “resolved” label

Hu and Simchi-Levi's
[arXiv:2607.17607](https://arxiv.org/abs/2607.17607)
was first submitted on 20 July 2026. The current primary PDF is
[version 4, dated 3 November 2026](https://arxiv.org/pdf/2607.17607v4).
The abstract and introductory wording changed from earlier versions
claiming resolution to the more limited description in the current
version. The current PDF was downloaded directly from arXiv and read;
search snippets of earlier versions were not treated as the final claim.

Theorem 6.1 gives

```math
\frac1T\sum_t\mathbb E\|\nabla f(x_t)\|_2^2
\le
101\sigma\sqrt{\frac{M\beta}{T}}
+\frac{8192\sqrt{M\beta}}{5951T}\mathcal R_T(\mathcal A,I_d)
+\frac{97M\beta}{T}.
```

The function and oracle hypotheses in its Assumptions 4.1–4.2 include
the published initial-gap setting. The online learner selects a
preconditioner, and $`\mathcal R_T(\mathcal A,I_d)`$ is its expected
signed regret against the fixed identity preconditioner. The extra
variance term is explicit; the paper acknowledges this difference on
page 3. This displayed theorem does not itself establish the sponsor's
equation (1).

Theorem 8.2 supplies an impossibility result for a specified interface:
at most a constant number of oracle calls per round, with a guarantee
controlled by expected regret against one designated comparator. If
that comparator is playable, the learner can play it every round and
make this comparator regret zero. The stochastic oracle lower bound
then forces an additive variance term. Definition 8.1 and the discussion
on page 18 explicitly identify this as the fixed-comparator analogue.

That zero-regret step does not transfer to the sponsor's opening
best-comparator definition. For example, on $`K=[-1,1]`$, let the
designated comparator and every learner action be zero and let
$`\ell_t(u)=-u`$. Then

```math
\sum_t(\ell_t(0)-\ell_t(0))=0,
\qquad
\sum_t\ell_t(0)-\min_{u\in[-1,1]}\sum_t\ell_t(u)=T.
```

This elementary distinction does not refute the new theorem. It shows
why its fixed-comparator lower-bound proof alone is insufficient to
declare the original best-comparator target impossible. Nor was a full
independent verification of the 56-page paper attempted in this audit.

## Status and reproducibility

Exact-title searches, author/title searches for resolutions, and searches
for the prize located this directly relevant prior paper. No inspected
primary source recorded sponsor acceptance, payment, or withdrawal.
Therefore this audit establishes substantial prior work with a scope
distinction, not either a certified fresh prize or a certified complete
resolution of the published target.

Repository issue searches for `Hazan` and `Chen nonconvex` returned no
matches. A local search of the current agents, research, documentation,
and results directories found no earlier target lane. No new issue was
opened because the status ambiguity precedes a defensible reservation.

Directly downloaded source fingerprints:

| Source | Pages | Bytes | SHA256 |
|---|---:|---:|---|
| PMLR `chen24e.pdf` | 8 | 200229 | `139ae5efd382bb7d9b75205a46b91b347520945af4bdb9c2c8f159f71693a30b` |
| arXiv `2607.17607v4` | 56 | 1582088 | `87ee7e0db1818a4ebe376c0adf3885252ccd211a6f3df430b45eeb5a77ecc1ff` |

The exact unmatched obligation is an efficient reduction with the
sponsor's ordinary best-comparator regret bound and no independent
variance term. Neither that reduction nor an impossibility theorem for
that exact interface is proved here. No completed-problem count changes.
