# MacNeish’s conjecture

**Status: candidate; Lean checks pending.** Tracking [#517](https://github.com/1337isnot1337/solved-conjectures/issues/517).

## Published result

H. F. MacNeish, *Euler squares*, Annals of Mathematics 23 (1922), 221–227, conjectured that the maximum number of mutually orthogonal Latin squares of order n is the least prime-power factor of n minus 1. E. T. Parker announced his disproof in Notices AMS 5 (1958), 815, and published [Construction of some sets of mutually orthogonal Latin squares](https://doi.org/10.1090/S0002-9939-1959-0109789-9), Proc. AMS 10 (1959), 946–949. The full 1959 paper could not be opened through the browser. The exact conjecture and Parker's block-design construction theorem are stated in §1 p. 189 of Parker's coauthored paper R. C. Bose, S. S. Shrikhande, E. T. Parker, [Further results on the construction of mutually orthogonal Latin squares and the falsity of Euler's conjecture](https://doi.org/10.4153/CJM-1960-016-5), Canadian J. Math. 12 (1960), 189–203. Parker's block-design result gives at least three MOLS from a (21,5,1) design. This is a reconstructed special case of that construction, not a literal transcription of Parker's inaccessible 1959 paper.

## Construction

Use all cyclic shifts in Z/21Z of the difference set D={0,1,4,14,16}. Its 20 nonzero directed differences occur once each. Label the five elements of each block, in the displayed order, by Z/5Z. For each λ=2,3,4, use the local idempotent Latin square a+λ(b−a). Any two different global symbols occur together in precisely one block; for equal symbols use the diagonal. The result is a cyclic square with entry i+fλ(j−i). The three literal first rows are generated from the 20 directed differences. The code checks inverse certificates for fλ, fλ−id, and all six ordered differences fμ−fλ. From these it proves row/column bijectivity and bijectivity of the paired-cell map algebraically. An independent exact finite calculation confirmed all these first-row and difference permutations.

## Statement audit

For n≥2 the alphabet ZMod n has n elements. A Latin square is row- and column-bijective; orthogonality means the map from cells to ordered symbol pairs is bijective. A k-element family is indexed by Fin k with pairwise orthogonality for all unequal indices. The bound uses exact prime powers p^e dividing n with p^(e+1) not dividing n. The full equality is expressed as the equivalence between attainable family sizes k and satisfying every prime-power bound; this is the usual maximum formulation since subfamilies preserve the defining conditions. At n=21, k=3, prime 3 has exact exponent 1, so the proposed bound is 2 and the three squares contradict it. The endpoint `PublishedMacNeish.macneish_conjecture_false` negates the unrestricted conjecture; no claim about the exact maximum at 21 or the general block-design theorem is made.

[Lean module](../../../lean/Conjectures/PublishedMacNeish.lean). Run `python3 scripts/verify_published_macneish.py` for strict source, transitive axiom audit and independent kernel replay. This is distinct from the order-10 Euler formalization: the witness is order 21, with three different squares, and the statement is the prime-power upper bound. No original-discovery or formalization-priority claim. The earlier repository and pinned Mathlib path searches found no matching MacNeish development.
