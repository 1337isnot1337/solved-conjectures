# Coordinator review of the Boolean-grammar compression attempts

Date: 21 November 2026. Reviewed notes: [target audit](target-and-prior-audit.md), [inverse-image compression](inverse-image-compression-test.md), [explicit record alignment](explicit-record-alignment.md), and [universal-recognition audit](bounded-universal-recognizer-audit.md). This review covers their direct calculations. It does not prove the cited hardest-language theorem anew.

## Scope of the conditional reduction

Conditional on the cited fixed hardest-language and inverse-homomorphism closure theorems, the proposed uniform bound on nonterminal counts of all inverse images is equivalent to existence of a universal bound for the language class. The empty-word qualification is necessary: every homomorphism fixes the empty word. Restoring it to the nonempty part with one fresh start symbol changes only the candidate universal constant.

The source hypotheses and grammar semantics must remain those of the sponsor's Boolean languages. A result for linear, unambiguous, or partially undefined grammars cannot be substituted. The source audit distinguishes these cases and records which external full proofs were not rebuilt.

## Decoder lower bound

The distinguishable-prefix argument is valid. The input and output alphabets are disjoint. A prefix of a single record has exactly its initial input marker, and a proper completion suffix contains no input marker. A wrong prefix followed by the fixed completion either starts with an output symbol, inserts a premature second input marker, or has exactly one marker but the wrong record length. It cannot belong to the complete-record language. Every prefix considered has an accepted extension, so the lower bound concerns useful DFA states. The empty-image case gives the stated trivial one-state lower bound.

For a fixed finite output alphabet and unary input alphabet, only finitely many homomorphisms have image length bounded by a given D. Infinitely many distinct nonempty unary singleton languages therefore force unbounded image lengths in any fixed hardest-language representation of all of them. This is a counting statement about encodings, not a grammar lower bound.

Consequently, the displayed state-indexed closure construction does encounter unbounded state sets. It remains possible that another grammar, or a later compression of the product, uses a bounded number of nonterminals. The note does not infer otherwise.

## Erasure counterexample

For R=(a0)* and the erasure g(a)=a, g(0)=epsilon, g is injective on R. The distinct strings a and a0 nevertheless have the same image. The displayed conjunctive grammar has an empty start language before erasure and accepts a after naive terminal replacement. Both set calculations and the grammar interpretation are correct.

Injectivity on a domain D does preserve intersections of subsets of D and complements relative to D. The counterexample therefore concerns partial conjunct languages outside the complete-record domain. Restricting only the final start language to R is insufficient. The earlier notes correctly identify synchronized internal concatenation boundaries as a separate missing premise.

## Explicit fragment and diagonal route

I read the displayed nine-nonterminal positive fragment and the complete simultaneous residual induction, then inspected the corresponding productions in the retrieved context-operator manuscript. The direct argument forces full matching b-runs and the relevant hash boundaries. Its base cases and recurrence give exactly the stated singleton residuals. The final concatenation counterexample follows because its first factor ends in b, whereas every nonempty complete record ends in a hash. The separate [independent review](ALIGNMENT_REVIEW.md) checks these steps in detail.

The proof defines the record explicitly and does not invoke the source's even-odd context lemma on an example outside that lemma's hypotheses. It applies to the displayed positive fragment, not to all productions of the inaccessible 2019 Boolean-hardest grammar. The finite source languages already have one-nonterminal grammars, so the number of parsing residuals cannot be interpreted as an intrinsic nonterminal lower bound.

The alternate diagonal audit identifies real missing implications. A fixed nonterminal bound after fixed binary normalization covers only finitely many rule sets over a fixed alphabet, whereas unrestricted production lengths yield infinitely many one-nonterminal languages. A paired universal recognizer also does not by itself produce the self-input relation: the copying map is not a homomorphism or a one-pass finite-state transduction. Neither objection proves that a more general recognition or closure theorem is false.

## Outcome

The decoder calculation and erasure failure pass this review. Neither bounds the minimum Boolean-nonterminal count of the final languages from below. No universal compression construction, nonterminal hierarchy theorem, prize submission, or complete bounty result has been obtained.
