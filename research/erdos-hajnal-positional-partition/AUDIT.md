# Source and prior-resolution audit

## Prior-resolution decision, 27 November 2026 UTC

The complete threshold for all the stated finite uniformities and intersection sizes follows from the pair case of Erdős and Hajnal’s 1968 Theorem 1. Fixing all but two positions gives the necessary pair-shift coloring on an interval of the same cardinality. Conversely, the vector of all pair colors in an increasing tuple recovers compatible ranks even for one common element. The original authors already give that vector for triples in the remark following Problem 5. The alternate profile proof below is retained as a historical research note. This claim is excluded from the original-discovery catalogue. [Complete reduction and issue record](https://github.com/1337isnot1337/solved-conjectures/issues/979#issuecomment-7210026543) · [Theorem 1, p. 85](https://users.renyi.hu/~p_erdos/1968-04.pdf#page=3) · [Problem 5 and the authors’ remark, p. 96](https://users.renyi.hu/~p_erdos/1968-04.pdf#page=14)

The source uses the letter alpha for a cardinal with its natural ordinal order. The 1968 paper explicitly adopts the earlier paper’s notation. For arbitrary ordinals the sharp criterion instead uses the cardinality of the order type. [1968 notation, p. 83](https://users.renyi.hu/~p_erdos/1968-04.pdf#page=1) · [1966 notation, p. 64](https://users.renyi.hu/~p_erdos/1966-07.pdf#page=4)

## Initial audit

The target is Problem 5 on printed p. 96 of [Erdős and Hajnal,
*On chromatic number of infinite graphs* (1968)](https://www.renyi.hu/~p_erdos/1968-04.pdf#page=14).
It is not Problem 5 in their later survey *Unsolved problems in set
theory*, not Erdős Problems catalogue entry 5, and not the next
cardinal-compactness problem on the same subject. Definition 2.1
makes the families cover every triple; disjointness is immaterial
because one may pick a color from the covering family. Definition
4.2 specifies agreement of ranks of every common element. The
condition does not merely prohibit increasing tight paths: the
paper already proved the higher threshold for that weaker condition.

## Equivalent old ingredients

The authors' own Theorem 1 for pairs and the restriction to triples
containing a fixed least element together imply the answer “no.”
The proof gives that restriction explicitly, rather than claiming the
shift-graph fact as new. The authors separately and explicitly pose
Problem 5 as open and only construct examples on the other side of
the boundary. The role-profile argument and sharp threshold for
all finite uniformities are given without using the older theorem.

I checked title-and-problem-number searches; exact phrases “same
position,” “similar position,” “3-partition,” and “at least two
elements in common”; citation combinations with the 1968 title;
modern hypergraph-coloring and shift/type-graph terminology; the
Erdős Problems and AI research index searches; and same-title,
statement-fragment and paper-title issue searches in this repository.
The exact target was located in the original two Rényi archive
copies; no later publication explicitly answering it was located
in these searches. Prefer caution: absence from indexing does
not establish absence from the literature.

Two useful false matches:

- [Komjáth and Shelah, *Coloring finite subsets of uncountable sets*](https://shelah.logic.at/files/95258/516.pdf)
  uses the same rank condition as one local condition in a forcing
  construction concerning bounded decompositions of finite sets.
  It is not a theorem about when the entire family of triples on a
  set larger than the continuum admits such a coloring.
- [Avart, Kay, Reiher, and Rödl, *The chromatic number of finite type-graphs*](https://doi.org/10.1016/j.jctb.2016.10.004)
  determines growth of chromatic numbers for finite single order
  types. The older shift-graph bound is explicitly credited there.
  This is not an explicit discussion of the 1968 Problem 5.

[Komjáth's 2025 survey](https://doi.org/10.1017/bsl.2025.1) is an
update to a distinct, numbered 82-item list, not by itself an audit
of the separately published 1968 eight-question paper. Full-text
coverage of the unindexed literature is incomplete. This package
is a research record, not a claim that the older theorem or its
corollary is eligible for a newly solved catalogue entry.

## Proof checks

The obstruction counts one finite-valued function for each fixed
intersection set, with a distinct absent symbol. For the injection,
the two sets are tested in the **same** larger set, so the one color
needed for the distinction exists without any assumptions about the
other colors. The boundary construction includes the coordinate
set as part of the color and uses the original order only to record
the restricted labels in order. These are exact set-theoretic
arguments, not finite tests. No Lean verification was performed.
