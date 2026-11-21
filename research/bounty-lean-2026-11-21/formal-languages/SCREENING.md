# Paid formal-language problems: bounded status screen

Checked 21 November 2026. This note records exclusions and uncertainty; it does
not claim a new theorem, a completed formalization, or a reward.

## Shallit's proposed targets have prior resolutions

The original reward list is Jeffrey Shallit's
[2014 BCTCS talk](https://cs.uwaterloo.ca/~shallit/Talks/bc4.pdf).

| Target | Original reward | Current primary evidence | Decision |
| --- | --- | --- | --- |
| Problem 6, context-free interpolation (Bucher's problem) | £100 | [Shallit's talks page](https://cs.uwaterloo.ca/~shallit/talks.html) records the September 2026 solution by Rastko Maslic. The [joint paper with Shallit](https://arxiv.org/abs/2609.08571), submitted 8 September, gives a negative answer, including binary-alphabet endpoints. | Excluded: the original problem has already been resolved. |
| Problem 11, whether the Thue–Morse word is prime under finite-state transduction | £20 | [Jörg Endrullis's current research page](https://joerg.endrullis.de/research/finite-state-transducers/) records a negative answer by Marcel Horbach with ChatGPT in 2026, and links a Lean formalization in its results note, Theorem 4.9. | Excluded: prior construction and formalization are recorded. |

For Problem 11, the cited construction starts from the period-doubling word,
which has the same transducer degree as Thue–Morse, and removes every third
symbol. The resulting word is not ultimately periodic, and the original word
cannot be obtained from it by a finite-state transducer. This is the needed
strict intermediate degree, not just a failure of one candidate transducer.
No independent rebuild of the cited Lean development was performed here.

## Okhotin's offer and its limits

Alexander Okhotin's primary
[30 March 2010 update](https://citeseerx.ist.psu.edu/document?doi=d0e62d472c289c617866fde28ff6dd32758a73c7&repid=rep1&type=pdf)
raises the reward for each of seven remaining problems to C$360 and preserves
the previously announced terms. Its text is indexed, although direct PDF
retrieval through the research tool failed. The original university
[nine-problem page](https://users.utu.fi/aleokh/boolean/nine_open_problems.html)
returned HTTP 404 in this check. The
[2013 survey](https://www.sciencedirect.com/science/article/abs/pii/S157401371300018X)
also describes an award for the first correct solution of each problem.

This establishes a historical personal cash offer, not a donation-only scheme.
We did not find a newer primary confirmation of the claim procedure or payment
terms. Age alone does not prove withdrawal. The secondary
[Prize Problem Ledger](https://prizeproblems.org/problems/153/) marks this family
as requiring sponsor reconfirmation; that label is not independent proof that
an offer has ended. No sponsor message or email was sent.

| Original problem | Exact scope of interest | Status found in this bounded screen |
| --- | --- | --- |
| 1 | A language decidable by a deterministic linear-bounded automaton in quadratic time but not definable by a Boolean grammar | No resolution found; no proof mechanism selected. |
| 4 | A fixed positive power saving below linear deterministic space for all Boolean-grammar languages | A prior November 2026 full-scope claim exists; unverified here. |
| 5 | An equivalent Greibach normal form for every Boolean grammar | No resolution found. Unary and restricted normal-form results are already known. |
| 6 | Closure of all conjunctive languages under complement | No resolution found. A 2023 nonclosure result for unambiguous linear grammars concerns a different family. |
| 7 | Existence of a language inherently ambiguous with respect to Boolean grammars | No resolution found. Removing rule-choice ambiguity is a known partial step and does not remove ambiguous concatenation splits. |
| 8 | Stabilization of the Boolean LL(k) language hierarchy at a fixed lookahead | A November 2026 nonstabilization claim explicitly fixes a predictive model; equivalence to the full original model needs checking. |
| 9 | A universal bound on the number of nonterminals needed by Boolean grammars | No resolution found. Bounded-size encodings of another language do not by themselves give a grammar for the original language. |

The Problem 4 claim is Howe, Huffman, Kohlmeyer and Kruer,
[Sublinear-space recognition for Boolean grammars](https://hexagonmath.org/pdf/2611.00269v1),
with [author-published text](https://hub.valency.io/works/W_779xfud2).
It claims space of order the two-thirds power of input length times a
logarithmic factor for each fixed grammar. This audit does not certify its
argument or sponsor acceptance.

The Problem 8 claim is the same authors'
[Nonstabilization of the Predictive Boolean Lookahead Hierarchy](https://hexagonmath.org/2611.00311v1),
with [author-published text](https://hub.valency.io/works/W_bj2wudg5).
Its stated model includes a deterministic recursive-descent table, strong
non-left-recursion and at least one positive conjunct in every rule. The
restricted-model qualifier must remain until the original definitions are
matched exactly. A later unverified claim is not silently converted to an
established resolution.

Useful primary boundaries include the 2010 update's warning that the language
with one block of length n and a second of length 2^n already has a conjunctive
Greibach-normal-form grammar, and the 2013 survey's bounded-nonterminal
results for linear conjunctive grammars. Neither settles the general Boolean
questions. The
[2023 complementation paper](https://www.sciencedirect.com/science/article/abs/pii/S0890540123000329)
concerns unambiguous linear grammars and does not refute closure of the full
conjunctive family.

No Okhotin target was reserved. The remaining problems require substantive new
methods, and the two fresh claims require review before duplicate work. The
next lane is an exhaustive index screen of JSP's solved mathematical problems
without a recorded Lean proof, restricted to identifiers 351–650.

