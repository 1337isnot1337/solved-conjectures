# Erdős 749: a fixed-base automaton obstruction

Status: proved elementary route obstruction, checked in a [separate independent review](INDEPENDENT_REVIEW.md). This is not a solution of Erdős 749 and carries no independent bounty claim. The regular-language structure used here is standard; no novelty claim is made for its consequence below.

## Exact target and scope

The full paid target asks, for every positive epsilon, for a set of natural numbers whose two-fold sumset has lower asymptotic density at least one minus epsilon and whose ordered two-sum representation function is bounded by a finite constant independent of the target integer and construction stage. The [current Conjectures.io task](https://conjectures.io/problems/erdos749-erdos-749) exposed this statement on 21 November 2026. Its displayed estimate was USD 2,540; the [submission terms](https://conjectures.io/submission-terms) distinguish verification, review, and payment and exclude established prior solutions. No submission or payment is claimed.

The pinned target, source hashes, and formal environment are recorded in the [eligibility snapshot](eligibility-snapshot.json). No full-target Lean verification has been run.

The upper-density construction attributed to Aron Bhalla in the [problem discussion](https://www.erdosproblems.com/forum/thread/749) does not resolve this lower-density target. This note concerns a restricted proposed construction method. It does not disprove the unrestricted conjecture.

For a set $`A\subseteq\mathbb N_0`$, write

```math
r_A(n)=\#\{(a,a')\in A^2:a+a'=n\},\qquad
A(X)=|A\cap[0,X]|.
```

A set is automatic in base $`b\ge2`$ if the language of its canonical base-b expansions is accepted by one fixed deterministic finite automaton. Reading from the other end gives the same class, because regular languages are closed under reversal.

The restriction to a fixed automaton matters. An algorithm whose state contains its whole growing membership vector or representation table has an unbounded state space, even though each individual table is finite. The theorem below does not cover such an algorithm, a changing base, or a sequence of automata with unboundedly many states.

## Theorem

Let A be automatic in a fixed integer base b. If the ordered function r_A is bounded, then for some finite constants K and d,

```math
A(X)\le K(1+\log X)^d\qquad(X\ge2).
```

Consequently, for every fixed positive integer h, the h-fold sumset has natural density zero. In particular,

```math
\overline d(A+A)=\underline d(A+A)=0.
```

Thus no fixed-base automatic set can supply even positive upper density of its two-fold sumset while preserving a uniform two-sum representation cap.

## Repeated branching forces unbounded representations

Let M be a deterministic automaton with q states accepting the canonical expansions of A. Discard states that are unreachable from the initial state or cannot reach an accepting state. Call the remaining states useful. Consider the directed multigraph of transitions between useful states; distinct digit labels count as distinct edges.

Suppose a strongly connected component is neither a single vertex without an internal edge nor a directed simple cycle. Some vertex v has two distinct outgoing edges inside the component. Determinism makes their digit labels different. Complete each edge to a return path to v, taking shortest return paths. This gives two nonempty loop words u and w of lengths at most q and with different first digits.

The two loop words

```math
U=uw,\qquad V=wu
```

are distinct and have the same length $`\ell\le2q`$. Choose a word s taking the initial state to v and a word t taking v to an accepting state. These may be chosen with lengths at most q minus one. Then

```math
s\{U,V\}^jt\subseteq L(M)
\qquad\text{for every integer }j\ge1.
```

Every displayed accepted word is canonical because the automaton recognizes exactly the canonical-expansion language.

For any choice of the j blocks, interchange U and V at every position to obtain the complementary word. Let $`[z]_b`$ denote the integer value of a digit word z, including any internal zeros. Set $`a=[U]_b`$ and $`c=[V]_b`$. All $`2^j`$ ordered complementary pairs have the same integer sum

```math
N_j
=2[s]_b b^{j\ell+|t|}
 +(a+c)b^{|t|}\sum_{i=0}^{j-1}b^{i\ell}
 +2[t]_b.
```

They are distinct ordered pairs: all words have the same length, and a differing block gives a different base-b digit string and hence a different first summand. Both summands belong to A. Therefore

```math
r_A(N_j)\ge2^j.
```

This is an identity of integers. Carries in the usual representation of the sum do not affect it. Since U and V are distinct words of equal positive length, at least one has positive value, so the displayed sums are unbounded as j grows. An eventual O(1) representation bound is contradicted just as a bound for every n is.

This establishes that every useful strongly connected component must be a directed simple cycle or an acyclic singleton.

## Counting accepted words without repeated branching

The graph of strongly connected components is a finite directed acyclic graph. An accepting path visits each component at most once. Fix its sequence of components, the connecting edges, and the entrance and exit positions within cyclic components. There are only finitely many such choices.

Once these data are fixed, the only remaining freedom is how many full laps the path makes around each visited cycle. Thus the corresponding accepted words have a pattern

```math
z_0v_1^{e_1}z_1v_2^{e_2}\cdots v_r^{e_r}z_r,
\qquad e_i\in\mathbb N_0,
```

with fixed words, nonempty cycle words, and $`r\le q`$. For words of length at most L, every exponent is at most L. If R is the finite number of such route patterns, the number of accepted words of length at most L is at most

```math
R(L+1)^q.
```

A positive integer at most X has at most $`1+\lfloor\log_b X\rfloor`$ canonical digits. The integer zero adds at most one. Hence A(X) is bounded by a fixed power of log X, proving the first assertion.

For a fixed positive integer h, every summand in a representation of an integer at most X is at most X, since all summands are nonnegative. Therefore

```math
|hA\cap[0,X]|\le A(X)^h
\le K^h(1+\log X)^{dh}=o(X).
```

This proves the density conclusion, with no selected-endpoint inference.

## Relation to standard results

Bell, Hare, and Shallit, [*When is an automatic set an additive basis?*](https://arxiv.org/abs/1710.08353), arXiv:1710.08353, Section 2, records the polynomial/exponential growth dichotomy for regular languages. Lemma 2.3(e) gives precisely a two-choice equal-length block family in every exponential-growth regular language. Lemma 2.2 gives the bounded-word-pattern structure in the polynomial-growth case. Combining these known facts with complementary block pairing gives the same conclusion. The proof above supplies the elementary automaton argument directly rather than importing their additive-basis theorem.

The source paper does not settle Erdős 749. Its basis theorem allows an unspecified finite number of summands and imposes no uniform two-sum representation cap. This note uses only the explicit regular-language structure in Section 2.

## Consequence for the next construction attempt

State-dependent digit pruning within one fixed membership automaton still leaves a regular language and is covered by the theorem. Merely replacing a product digit set by finitely many states does not avoid the obstruction. A viable digital approach to the full bounty target must have genuinely unbounded memory, a changing positional system, or another membership rule outside fixed-base regular languages, together with a separate proof of all-prefix density and the stage-independent representation cap.

The result closes this restricted method. It does not provide a construction in the remaining class and does not change the completed-bounty count of zero.
