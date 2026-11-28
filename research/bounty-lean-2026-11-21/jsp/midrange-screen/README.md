# JSP solved/no-Lean midrange screen

Research date: 2026-11-21. This is an opportunity screen, not a collection of solved bounties.

## Scope

The earlier twelve-entry list in ../SCREENING.md was a convenience shortlist, not an exhaustive scan.

This follow-up covers every index row with status Solved and a Lean field beginning No among JSP IDs 000351–000650. The source index was TheJustinSunPrize/awards, problems/README.md, blob d807901a74d1b273f583e56cbb673fc9819a58d7.

The whole index had 1,072 rows and 292 rows matching the status/Lean filter. The assigned midrange contains 100 of those rows. Filtering Eligible to claim = Yes would discard known-theorem formalization opportunities whose missing Lean proof makes their current eligibility field No.

## Search receipt and limits

catalog-and-pr-screen.json records the 100 selected rows and successful prior-PR query results for all 100. Twenty-one queries initially encountered a transient GitHub search limit; they were completed after the quota reset. The receipt keeps those initial failures distinguishable from successful retrievals.

All 100 queried entries had prior PR claims. A prior PR is not proof of a complete formalization. Queries were capped at 20 hits, PR titles can use incorrect JSP-to-Erdős mappings, and submitters sometimes prove only finite witnesses or explicitly partial variants. This screen does not certify all prior claims, their axiom dependencies, payment status, or priority.

Direct source inspection was therefore used for selected apparently tractable targets:

- **JSP 000598 / Erdős 730:** the original task asks for infinitely many pairs; one finite example is insufficient. The inspected plby/lean-proofs file explicitly states the infinite consecutive-pair theorem and infinite pair-set theorem, importing a full density proof.
- **JSP 000385 / Erdős 473:** the inspected endpoint is an infinite permutation of the positive integers with every adjacent sum prime. Finite permutations are not the full statement.
- **JSP 000388 / Erdős 477:** the inspected endpoint gives a tiling of all integers by a translate set and sixth-power values, with unique value-pairs. It is not just a finite tile or a statement about uniqueness of sixth-power inputs.

Those files were read at plby/lean-proofs commit 8822f7ddef30fadbd92e1c6ab4ed897af356af5e. Their dependency trees were not rebuilt here. They were not treated as fresh opportunities merely because the catalog still said No.

## Closest explicit gap: JSP 000404 / Erdős 504

The complete known mathematical result is Sendov's classification of the minimax angle of every finite planar cardinality. Current prior submissions explicitly cover various finite cases, dyadic cardinalities, or only one direction. The latest inspected PR 5592 proves the dyadic main theorem and leaves the endpoint counting lemma conditional; it expressly excludes the full arbitrary-cardinality classification.

This is a genuine difference in scope, but does not by itself establish a payable new formalization opportunity. Some other PRs are circular, misidentified, or point to missing source files. No exhaustive independent rebuild of all submissions was done.

The exact corrected classification, for $`n\ge2`$, is

```math
\alpha_N=
\begin{cases}
\pi(1-2/(2n+1)),&2^n\lt N\le2^n+2^{n-2},
\\ \pi(1-1/(n+1)),&2^n+2^{n-2}\lt N\le2^{n+1}.
\end{cases}
```

Here $`\alpha_N`$ is the supremum of angles guaranteed in every $`N`$-point planar set. The primary full proof is B. Sendov, *Minimax of the angles in a plane configuration of points*, Acta Math. Hungar. 69 (1995), 27–46, [DOI 10.1007/BF01874605](https://doi.org/10.1007/BF01874605). The author's [Russian exposition](https://www.mathnet.ru/eng/fpm81), Theorem 4.4 at printed page 514, independently confirms the numerator 2.

The proof introduces generalized nested-circle configurations, reduces to perfect configurations, and maximizes a sum of powers of two under geometric sector constraints. Completing that general geometric reduction and counting argument is substantial work. This agent did not choose it as a short formalization task.

The bounded screen ended without a credibly unclaimed, tractable full theorem selected for formalization. Research moved to Shallit's still-listed paid divisibility question, tracked separately in issue 229.
