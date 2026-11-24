# Schinzel's conjecture

Status: incomplete formalization of a published disproof. Tracking issue: [#542](https://github.com/1337isnot1337/solved-conjectures/issues/542). Campaign: [#534](https://github.com/1337isnot1337/solved-conjectures/issues/534).

This entry concerns Schinzel's polynomial-orbit conjecture. It has no connection with Hypothesis H or Schinzel's other conjectures. It records prior mathematics, with no discovery or priority claim.

## Source and attribution

Giulio Peruginelli, *Integer values of polynomials*, doctoral thesis, Università di Pisa, 2008. [University record](https://etd.adm.unipi.it/t/etd-11282008-095329/) · [Full thesis](https://etd.adm.unipi.it/theses/available/etd-11282008-095329/unrestricted/PhDThesis.pdf).

The introduction, printed page 4, states the conjecture. Printed page 6 gives the counterexample and attributes it to Umberto Zannier, the thesis supervisor. Chapter 4, section 4.1, printed page 57, defines Schinzel's property and repeats the conjecture. Bibliography item [37] credits A. Schinzel, “Some unsolved problems on polynomials,” Matematička Biblioteka 25, Belgrade (1963), 63–70.

The 1963 original was not independently retrieved. The historical statement and attribution here follow the public 2008 primary thesis containing the counterexample. No claim is made about the first separate publication of Zannier's example.

## Exact target

For every irreducible polynomial f in Q[X,Y], suppose there is an infinite subset S of Q such that each x in S has a y in S with f(x,y)=0. Schinzel's conjecture asserts that f has degree one in Y or is symmetric under exchanging X and Y.

The published counterexample is
```math
f(X,Y)=Y^2-2(X^2+X)Y+(X^2-X)^2.
```

Take S to be the set of rational squares. For every rational t,
```math
f\bigl(t^2,(t(t+1))^2\bigr)=0.
```

Thus the second coordinate remains in S. The set S is infinite. The polynomial has degree two in Y, and f(0,1)=1 while f(1,0)=0, so it is not symmetric.

Irreducibility is also required. A polynomial root g in Q[X] would give
```math
(g-X^2-X)^2=4X^3.
```

Taking polynomial degrees would make an even natural number equal to 3. A monic quadratic over the integral domain Q[X] is irreducible when it has no root. This proves the missing algebraic hypothesis without assuming the published disproof as an axiom.

## Lean statement audit

Source: [PublishedSchinzel.lean](../../../lean/Conjectures/PublishedSchinzel.lean).

| Published object or condition | Lean representation |
| --- | --- |
| Rational bivariate polynomial | Nested Mathlib polynomial ring Q[X][Y] |
| Irreducibility in Q[X,Y] | Mathlib Irreducible predicate on the nested polynomial ring |
| Infinite subset of Q | S : Set Q, with S.Infinite |
| Every member has a successor in the same set | forall x in S, exists y in S, f.evalEval x y = 0 |
| Degree one in Y | f.natDegree = 1; Y is the outer polynomial variable |
| Symmetry | Bivariate.swap f = f |
| Full disproof | Published.Schinzel.schinzel_conjecture_false : not SchinzelConjecture |

The final theorem negates the entire universally quantified conjecture. The polynomial is one witness to its failure; the claim is not a fixed-parameter verification of a surviving conjecture.

## Reuse and duplicate screen

The screen checked both repository branches, issues and pull requests for Schinzel, Zannier, the polynomial-orbit formulation and the thesis source. It also checked Mathlib and public Lean search results. Existing references concerned other Schinzel problems, including Hypothesis H and a Stern-polynomial formula. No existing formalization of this exact statement was located in the bounded search.

The proof reuses Mathlib's bivariate evaluation and variable-exchange API, polynomial degree lemmas, the monic degree-two/three irreducibility criterion, and infinite-set lemmas.

## Verification state and remaining work

The first local Lean pass checked the substantive irreducibility and orbit lemmas. It reported only three elaboration/syntax errors in the complete file: a redundant tactic after a closed goal, conversion of algebra evaluation to polynomial evaluation, and an unmatched section end. All three were corrected. The corrected full rerun was interrupted when the shared runtime became unavailable.

The present commit additionally narrows imports. It has not yet passed an uninterrupted full compilation. It is not counted as a completed formalization.

Remaining gates:

1. Compile the complete module with the repository's pinned Lean 4.35.0 and Mathlib manifest, fixing any remaining import/elaboration errors.
2. Audit all owned declarations for transitive axioms, allowing only propext, Classical.choice and Quot.sound.
3. Replay the generated module with the pinned stock kernel.
4. Register the module with the repository-wide import, audit and replay lists; run repository verification and publication checks.

The source contains proof scripts for every theorem and no placeholder proof or project-specific axiom.
