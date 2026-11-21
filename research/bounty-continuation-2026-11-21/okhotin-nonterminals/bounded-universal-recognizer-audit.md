# Bounded-nonterminal universal recognition: two missing steps

21 November 2026. This is a bounded audit of an alternate negative route to Okhotin Problem 9. No universal recognizer or hierarchy theorem is constructed.

## Proposed route

For each fixed $`k`$, let $`U_k`$ encode pairs $`(G,w)`$ with $`G`$ a Boolean grammar having at most $`k`$ nonterminals and $`w\in L(G)`$. If an appropriate universal language could itself be described by a Boolean grammar, one might try to complement it and diagonalize against the $`k`$-nonterminal class.

The [2013 primary survey](https://doi.org/10.1016/j.cosrev.2013.06.001), §8.3, states that uniform membership, with both the grammar and word supplied, is P-complete and has polynomial-time parsing algorithms. This does not state that the uniform-membership language is a Boolean-grammar language. P-completeness under ordinary computational reductions is not a closure theorem for Boolean grammars. The bounded searches for `Boolean grammars universal membership`, `conjunctive grammars universal grammar`, and `Boolean grammars nonterminals diagonal` did not locate the stronger bounded-$`k`$ theorem. Absence of a search hit is not proof that it is unknown.

## 1. Fixed-size normal forms lose the relevant class

Fix a finite terminal alphabet and $`k`$ named nonterminals. If every positive or negative conjunct is restricted to a fixed finite set of terminal, empty, or binary forms, then there are only finitely many possible conjuncts, finitely many distinct rule bodies after duplicate conjuncts are removed, and finitely many rule sets.

Thus a universal recognizer for grammars having at most $`k`$ nonterminals **after that binary normalization** covers a finite family of syntactic objects. This restriction does not cover all original $`k`$-nonterminal grammars. Already the one-nonterminal grammars

```math
S\to x^m,\qquad m\ge1,
```

define infinitely many distinct languages. Their unrestricted right-hand-side lengths are part of the target. Standard binarization introduces nonterminals depending on those lengths. A bounded-normal-form universal grammar therefore cannot be substituted for the proposed $`U_k`$ without a new normalization theorem that preserves a uniform nonterminal bound.

## 2. A paired recognizer does not supply diagonal closure

Suppose $`U_k`$ over a suitable finite alphabet is available. The intended diagonal language contains those grammar codes $`z`$ for which the grammar encoded by $`z`$ does not accept the input $`z`$. Extracting it from a paired language requires a map of the form

```math
\Delta(z)=z\#z.
```

This is not a homomorphism, and it is not implemented by a finite-state transducer that reads its input once and has no unbounded storage. The known inverse-homomorphism and inverse-GSM closure theorems do not apply. Intersecting with the copy relation and then erasing a copy requires an additional image-closure argument; injectivity on that nonregular constrained domain alone is not the standard injective-GSM hypothesis.

This is a missing closure proof, not a claim that inverse copying fails for Boolean languages. A direct recognizer for the self-input relation could avoid this particular formulation, but such a recognizer still needs to be constructed in the exact Boolean model.

## Scope of the stop

The promised negative route has not reached a diagonal contradiction. It needs a bounded-nonterminal universal-recognition theorem over unrestricted productions and either a suitable diagonal closure theorem or a direct self-input construction. Standard membership algorithms and ordinary binary normal forms supply neither step. Correct treatment of the sponsor's Boolean semantics remains necessary throughout.

No full-target completion is counted.
