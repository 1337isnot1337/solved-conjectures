# Independent review: Minc's integrality checkpoint

20 November 2026 (America/Chicago). Reviewed
[minc_integrality_audit.md](minc_integrality_audit.md) and its companion checker.
The edge-copy component argument and switch identities (1)-(3) are
correct. This review concerns those arguments, not an independent rerun
of the note's source search.

## Edge-copy component argument

A regular bipartite multigraph decomposes into $`k`$ perfect matchings.
For a fixed edge copy and $`k\ge2`$, one of those matchings contains the
copy and another avoids it. Hence its inclusion probability is strictly
between zero and one, including in a component consisting of two vertices
joined by $`k`$ parallel copies.

When two components are joined by the stated crossed switch, a perfect
matching uses either neither new crossed edge or both. Using exactly one
would leave unequal numbers of unmatched row and column vertices inside
each original component. The two counts are therefore exactly

```math
(P_1-G_1)(P_2-G_2),\qquad G_1G_2.
```

Here $`G_i`$ counts matchings containing the specific selected edge copy,
rather than all copies of that matrix entry. Decreasing the entry by one
reduces the permanent by $`G_i`$, so the edge-copy interpretation matches
the matrix formula.

The relative decrease

```math
-q_1(1-q_2)-q_2(1-q_1)<0
```

is strict. The operation preserves the original order, all line sums,
and integrality. In the binary class the crossed entries were zero
because they connected different components; they become one.
Thus the conclusion that every global minimizer has connected support
for $`k\ge2`$ is valid in both classes. It does not imply binary entries.

## Independent derivation of the weighted identity

For distinct rows and columns, multilinearity in the two affected rows
gives the four linear cofactor terms. The only quadratic contribution
uses the two affected columns: the products of the two decrements and
the two increments each contribute one second cofactor. Therefore

```math
\Delta_{ij;rs}
=-G_{ij}-G_{rs}+G_{is}+G_{rj}+2G_{ir;js}.
```

For coincident rows or columns, the four linear terms cancel and the
declared zero second cofactor gives the zero move.

Fix a positive $`a_{ij}`$. The five weighted sums are, in their displayed
order,

```math
-nkG_{ij},\qquad -nP,\qquad kR_i,\qquad kC_j,\qquad
2(n-1)G_{ij}.
```

The second uses $`\sum_{rs}a_{rs}G_{rs}=nP`$. The last is Euler's identity
for the permanent of the $`(n-1)\times(n-1)`$ minor. Their sum is exactly

```math
k(R_i+C_j)-nP-(nk-2n+2)G_{ij},
```

which verifies (1).

Every term with positive weight $`a_{rs}`$ is a legal integer switch
when $`a_{ij}>0`$. Zero entries contribute zero weight. Thus global
minimality gives (2), without requiring a claim about arbitrary
unweighted or infeasible switches.

Let $`S=\sum_{ij}G_{ij}`$. Multiplying (2) by $`a_{ij}`$ and summing gives

```math
2k^2S
\ge n^2kP+n(nk-2n+2)P
=2n(nk-n+1)P.
```

Division yields exactly (3). No factor of two or multiplicity is missing.

## Scope

The proof establishes connected support and necessary cofactor
inequalities. It contains no deduction that eliminates a repeated entry,
and correctly states that this deduction is still missing. The companion
checker tests identities, not the conjecture on its input orders. No
full resolution of C24 follows from this checkpoint.

