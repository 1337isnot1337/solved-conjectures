# Rowland–Sistos Barrón conjecture: source and priority audit

Date: 2026-11-20. Scope: the particular-rank eventual pseudo-polynomiality
clause of Conjecture 5.3 in arXiv:2501.14643v1.

## Primary statement and hypotheses

The [original arXiv HTML](https://arxiv.org/html/2501.14643v1) was inspected
in Sections 2, 5, and 6. Rank is minimum order of a constant-coefficient
recurrence holding on a tail, with nonzero constant coefficient. Integer
sequences are allowed to have repeated characteristic roots. Section 5
distinguishes the no-cancellation/general rank sequence from a particular
one, whose coefficient cancellations can lower the rank. Conjecture 5.3
predicts eventual polynomiality for the former and eventual
pseudo-polynomiality for the latter.

The [current arXiv record](https://arxiv.org/abs/2501.14643), checked on the
audit date, lists only version 1, submitted 24 January 2025. The
[author-hosted PDF](https://ericrowland.github.io/papers/Complexity_of_powers_of_a_constant-recursive_sequence.pdf)
and [current research-paper list](https://ericrowland.github.io/papers.html)
were also read. The PDF still contains Conjecture 5.3. The linked
[2023 talk](https://ericrowland.github.io/talks/Powers_of_a_sequence_satisfying_a_recurrence.pdf)
does not define the later conjecture's term “pseudo-polynomial.”

Terminology limit: the source does not supply a formal definition of
pseudo-polynomial. The new theorem says explicitly that the ranks are not
eventually polynomial on residue classes modulo any fixed integer. That
is the quasipolynomial interpretation of the source's claim, and the
interpretation is stated in the proof rather than treated as a hidden
hypothesis.

## Prior resolutions found and excluded

### Fixed-rank finiteness

The Omega Institute's
[primary research record](https://www.trureturing.org/research/rowland-sistos-barron-2025-rank-sequences/)
and [source dossier](https://the-omega-institute.github.io/trureturing-mdbook/Library/Eigenstructure/rowlandsistosbarron2025powers.html)
refute the source paper's separate introductory conjecture about finitely
many entire rank sequences at a fixed initial rank. Their argument uses the
family $p8^n-4^n-2^n$, with parameter-dependent cancellations. The record
and accompanying blueprint were read, not merely a search snippet. Their
scope table explicitly leaves Conjecture 5.3 unresolved.

This prior result is not counted as new. The present construction fixes one
integer sequence and proves a nonperiodic infinite set of cancellations in
its power ranks; that is a different assertion from infinitely many rank
sequences across a parameter family.

### General rank eventual polynomiality

Shivam Patel's submitted
[Hilbert-polynomial proof](https://mathdb.com/p/366796/degree-conjecture-for-general-rank-sequences)
was inspected in full. It proves the simple-root degree formula from
Conjecture 6.2 and extends the semigroup-algebra argument to repeated roots.
The extension establishes the general/no-cancellation half of Conjecture
5.3. Its final paragraph explicitly leaves the particular exceptional-
cancellation assertion unresolved.

This earlier submitted proof is excluded from new-result claims even though
the hosting page labels it unverified. No novelty is claimed for repeating
its Hilbert-polynomial argument.

## Targeted searches performed

Both available web-search engines were used. Queries included the following
literal strings, in separate searches where needed:

- `"Rowland" "Sistos" "degree" conjecture`
- `"Rowland" "Sistos" "powers" "rank" conjecture proof`
- `"general rank sequences" conjecture`
- `"Rowland" "Sistos" "quasipolynomial"`
- `"Rowland" "Sistos" "pseudo-polynomial"`
- `"rank sequences" "counterexample"`
- `"rank sequence" "square" "conjecture"`
- `"rank sequences" "pseudo-polynomial"`
- `"Sistos Barrón" "quasi"`
- `"Complexity of powers" "counterexample" "polynomial"`
- `"Rowland" "Sistos" "Krawtchouk"`
- `"particular rank" "counterexample"`
- `"rank sequence" "perfect squares"`
- `"constant-recursive" "quasipolynomial"`
- `"powers" "recurrence" "ranks" "quasipolynomial"`
- `"Rowland–Sistos" "Conjecture 5.3"`
- `"Rowland-Sistos" "counterexample"`
- `"rank" "Krawtchouk" "recurrence" "powers"`

These searches found the original preprint, author pages, the two prior
results described above, and irrelevant uses of rank or quasipolynomial.
They did not locate an earlier resolution of the particular-rank clause
or the construction $n(1+8^n)+2^n-16^n$.

A repository issue search for `Rowland` returned no existing target issue
before [issue #115](https://github.com/1337isnot1337/solved-conjectures/issues/115)
was opened. Current work in other target issues was not overwritten.

## What the audit establishes

No prior solution to this exact clause was found in the sources and searches
above. The two closest public prior results expressly leave the clause open.
This supports treating the candidate as a new research result, subject to
proof review and ordinary uncertainty about unindexed or unpublished work.
It is not a certificate that no earlier proof exists anywhere.

## Verification record

The complete symbolic proof establishes the formula for all $M\ge49$.
The local exact-arithmetic checker verified every coefficient polynomial
degree and the total rank through $M=180$. Independent finite-field
Berlekamp–Massey checks on actual sequence values agree for $M=1,\ldots,8$.
The stored output is `verification.json`. There was no Lean work.
