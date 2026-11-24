# Euler’s conjecture on orthogonal Latin squares

**Status: complete formalization; dedicated strict source, transitive axiom, and independent kernel checks passed.**
Tracking issue: [#505](https://github.com/1337isnot1337/solved-conjectures/issues/505).
Session start: 2026-11-24 09:26 CST (15:26 UTC).

## Published resolution

Leonhard Euler conjectured nonexistence of two orthogonal Latin squares of every order congruent to 2 modulo 4 (1782, *Recherches sur une nouvelle espèce de quarrés magiques*). R. C. Bose and S. S. Shrikhande gave earlier counterexamples beginning at order 22, [PNAS 45 (1959), 734–737](https://doi.org/10.1073/pnas.45.5.734). E. T. Parker subsequently displayed an order-10 pair in [*Orthogonal Latin Squares*, PNAS 45 (1959), 859–862, §3, p. 861](https://doi.org/10.1073/pnas.45.6.859). The source's original definition and conjecture are on p. 859.

The candidate module [PublishedLatinSquares.lean](../../../lean/Conjectures/PublishedLatinSquares.lean) reproduces Parker's exact two arrays. Rows and columns are bijections on `Fin n`; orthogonality is a bijection from cells to pairs of symbols. The universal conjecture quantifies over all natural t and all pairs of squares of order 4t+2. The negation uses t=2, not a restricted conjecture. The full universal nonexistence assertion is false by the verified endpoint. The result does not assert that every order except 2 and 6 admits a pair or formalize the broader construction theorem in Parker §2. Nor does it assert a new resolution or priority for the formalization.

## Statement audit

- All symbols, row indices, and column indices range over exactly n elements.
- Row and column bijectivity formalizes both existence and uniqueness of each symbol.
- Pair bijectivity formalizes existence and uniqueness of every ordered pair of symbols.
- The order is exactly 10, and 10=4·2+2.
- The endpoint `PublishedLatinSquares.euler_conjecture_false` negates the entire original conjecture.
- The inverse tables are auxiliary data computed from the two printed arrays; the proof checks every right-inverse entry by kernel-reduced decidability and uses the finite self-map surjection/bijection theorem. It does not trust external arithmetic or add axioms.

## Verification

The two arrays were independently transcribed from the published page image and checked in Python: all 20 rows and 20 columns are permutations; all 100 paired cells are distinct. This is a computational cross-check, not a Lean verification receipt.

Run `python3 scripts/verify_published_latin_squares.py` from the repository root to compile the exact module strictly, run the existing candidate gate's transitive axiom whitelist, replay the pinned kernel, and export a source/object hash receipt. The exact proof at commit `ef14d8ec11450285cee8f5e346e3e958e9a400e6` passed the [push run](https://github.com/1337isnot1337/solved-conjectures/actions/runs/45426176487) and [PR run](https://github.com/1337isnot1337/solved-conjectures/actions/runs/45426208083). The gate checked 10 owned theorems, permitting only the standard axioms `propext`, `Classical.choice`, and `Quot.sound`; independent `leanchecker` replay passed. The full original-discovery catalogue workflow is separate; no claim of a successful global run is made.

The main/research tree paths were searched for Euler/Latin-square/Parker/MacNeish, and the pinned Mathlib v4.35.0 tree was searched for Latin-square definitions. No matching existing formalization was located. This is a bounded search, not a priority claim. Euler's separate sum-of-powers conjecture is already formalized in Mathlib's `Counterexamples/EulerSumOfPowers.lean` and is not counted here.

Keep this entry separate from the original-discovery catalogue.
