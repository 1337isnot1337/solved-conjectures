# Independent review: fixed-base automatic sets with bounded two-sum counts

Date: 21 November 2026.
Reviewed draft: [automatic-set obstruction](automatic-set-obstruction.md).
The draft was not edited. This is an audit of the specified local theorem,
not an update to a separate canonical research workspace or a reward-status
review.

**Verdict: the mathematical argument passes.** For a set accepted by one
fixed deterministic automaton in one fixed base, an eventual finite ordered
two-sum representation bound implies polylogarithmic counting growth.
Every fixed-fold sumset then has natural density zero. This is a standard
regular-language consequence, not a solution of Erdős 749 or a new prize
completion.

## 1. Useful-state and branching reduction

Removing unreachable and non-coaccessible states does not remove an
accepting path. Paths used for the proof remain entirely in the useful
transition graph.

A finite strongly connected directed multigraph with at least one internal
edge, and with every internal outdegree equal to one, is a directed cycle.
Consequently, a useful strongly connected component outside the two stated
types has a state with two internal outgoing edges. The deterministic
transition rule makes their digit labels distinct, even if their endpoint
states coincide.

For each edge, choose a shortest return path from its endpoint to the
branching state. That return path has at most q−1 edges, where q is the
number of states of the original DFA. Appending the initial edge therefore
gives nonempty loop words u,w of length at most q. A self-loop uses the
empty return path and causes no exception. The first digits of u and w
are different.

Thus U=uw and V=wu are return loops of the same positive length at most
2q, and their different first digits make them distinct. The draft's
quantitative bound follows directly from determinism and does not require
the more general NFA length estimate in the cited paper.

Shortest paths s from the initial state and t to an accepting state have
lengths at most q−1. Their lengths may be zero. Concatenating any sequence
of U,V between s and t gives an accepted word.

## 2. Canonical digits and distinct representations

Acceptance is by the language of canonical base-b expansions, so every
constructed word is already canonical. In particular, a purported leading
zero on a constructed word of length at least two would contradict the
chosen automaton's accepted language. No additional padding convention is
being assumed. An optional clarifying sentence could state this explicitly,
but the existing proof already has the required hypothesis.

For fixed j, every constructed word has the same length. A changed block
changes its digit string; positional evaluation of fixed-length digit strings
is injective, even if one allowed leading zeros. Hence all 2^j choices give
different first summands and therefore different ordered pairs.

The complement operation exchanges U and V at every block position. At
each position the sum of block values is fixed. The displayed formula for
N_j has the correct prefix shift, block powers, suffix shift, and two copies
of the common prefix and suffix. It is an equality of integer values; no
claim about carry-free addition is used or needed.

Because U,V are distinct equal-length words, their nonnegative integer
values cannot both be zero. The block contribution is therefore positive,
and N_j tends to infinity. This contradicts an eventual O(1) representation
bound as well as a uniform one. The count is ordered, matching the target:
reversing a complementary pair is a separate ordered pair, and no pair is
fixed by reversal because all U,V blocks differ from their complements.

## 3. Polynomial language growth and the counting estimate

After excluding useful internal branching, each useful component is a
simple directed cycle or an acyclic singleton. The condensation graph is
a finite DAG, so each accepting path visits a component at most once.

Fixing the component sequence, intercomponent edges, and cycle entrance
and exit states leaves only the number of complete laps around each visited
cycle. The remaining partial traversal is uniquely determined and can be
absorbed into the fixed connecting word. Thus finitely many word patterns
of the stated form cover the language. Exit choices from a cycle are part
of the finite route data, not extra choices on each lap.

Every cycle word has positive length. For total word length at most L, each
lap count is at most L, and there are at most q lap counts. The bound
R(L+1)^q is therefore valid. Empty languages, finite languages, empty
connecting words, and the possible representation of zero all fit this
upper bound, with zero separately contributing at most one integer.

Taking L at least the canonical digit length of X gives the required
polylogarithmic estimate for A(X). Reading the digits in the opposite
direction does not change the class: reverse the regular language and
determinize if necessary. The state count for that converted DFA may
increase, but it remains one fixed finite number.

## 4. All-prefix density and fixed scope

For nonnegative summands, any h-tuple summing to an integer at most X has
each entry at most X. Therefore the number of distinct integers of hA in
[0,X] is at most A(X)^h. For fixed h, every fixed power of log X is o(X).
This proves natural density zero and hence both upper and lower density
zero. It is an all-prefix estimate, not a selected-endpoint or limsup
argument.

The proof requires one fixed base and one fixed finite membership
automaton. It does not apply to a process whose stored state grows with
the construction, to an unbounded sequence of automata, or to a changing
positional system. A finite representation cap may depend on the chosen
set or on epsilon, but cannot grow with n or the stage. These restrictions
are stated correctly in the draft.

## 5. Primary-source attribution checked

I reopened Bell, Hare, and Shallit,
[*When is an automatic set an additive basis?*](https://arxiv.org/pdf/1710.08353),
arXiv:1710.08353v1. Section 2, printed page 4, gives the relevant input:
Lemma 2.1 is the regular-language growth dichotomy; Lemma 2.2(c) gives the
finite union of fixed words and starred fixed words; Lemma 2.3(e) gives
distinct equal-length two-choice blocks between fixed prefix and suffix.
The draft attributes these inputs accurately.

The paper's additive-basis theorem does not impose a bounded ordered
two-sum representation function and allows an unspecified finite number of
summands. It is not being used as an unrestricted solution to Erdős 749.
The draft supplies the complementary-pair argument separately and makes
no novelty claim for this corollary.

## Scope of this review

No mathematical correction is required. No finite search was used. This
review checks the automaton proof, its conventions, and the named primary
literature input. It does not independently reconfirm the current bounty
amount, payment terms, or unrelated project-state claims. The original
lower-density conjecture remains unproved by this argument; the paid-target
completion count remains zero.
