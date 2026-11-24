# Fan–Tringali’s power-monoid length-set conjecture

## Scope of this review

This is the author’s statement audit of the lattice and radix development, together with an independent source and argument review of the four monoid-transfer modules written by the other proof agent. It is not a claim of external peer review. The existing repository argument was already accompanied by its own written-proof audit.

The final theorem is `FanTringali.finite_spectrum_power_monoids`. For an arbitrary monoid `H` with decidable equality, the assumptions are `IsDedekindFiniteMonoid H` and existence of an element with infinitely many distinct positive powers. For every nonempty finite set `S` of natural numbers, all at least two, it produces one actual finite nonempty subset of `H` meeting the unit group, whose entire ordinary and restricted power-monoid atom-length sets both equal `S`. Decidable equality is a classical representational instance, not a finiteness or cancellation assumption on `H`.

This is the original 2018 Section 5 conjecture. The development also proves the exact reduced-natural-number system in `FanTringali.natural_length_system`. It does not assert the entry’s prescribed unordered multiplicities, relative cancellativity, or the separate 2026 survey formulation using irreducibles without Dedekind-finiteness.

## Sources and attribution

The argument formalized is the existing repository proof at `results/fan-tringali-power-monoid-lengths/PROOF.md`, present on main `23af608da3c74e58e894f793f62ee93e56450221`, originally committed by Cinna Davis in `0d5b985640ecc020f8b99b6e3b1ebc2d8a7fbbe4`. No new mathematical priority claim is made; the entry’s bounded prior-resolution search and its explicit uncertainty about priority should remain intact.

The conjecture and transfer ingredients are due to Yushuang Fan and Salvatore Tringali, *Power monoids: A bridge between factorization theory and arithmetic combinatorics*, Journal of Algebra 512 (2018), 252–294, DOI [10.1016/j.jalgebra.2018.07.010](https://doi.org/10.1016/j.jalgebra.2018.07.010). The [authors’ PDF](https://imsc.uni-graz.at/tringali/docs/Fan%26Tringali_-_PMs.pdf) was read directly, including the original conjecture, Section 2.1.1, Proposition 3.2(iii), and Theorem 3.8.

Two source conventions were checked independently against the primary PDF. Its definition of non-torsion on printed page 4 is infinitude of the set of positive powers. Merely requiring no positive power to equal the identity would be weaker in a noncancellative monoid and is not used. Its Section 2.1.1 and Remark 2.3 on printed pages 5–6 define lengths by exact atom products and assign `{0}` only to the identity; nonidentity units have empty length sets. The literal finite-list predicates in `MonoidBasic` therefore match the paper’s convention.

## Lattice and graph correspondence

`Atom` and `Lengths` use actual finite sets, pointwise sums, and finite lists of atoms. Every reduced factor contains zero. The Boolean boxes are the full coordinate boxes, not subsets chosen to mimic a desired factorization. `factors_of_box` classifies every binary reduced decomposition of every such box; `atom_box_iff_singleton` and `atomic_factorization_box_length` then identify its atoms and all possible lengths.

The nine-point gadget is checked by ordinary kernel-verifiable `decide`, with no native computation. The finite powerset enumeration proves the quotient uniqueness and impossibility statements for arbitrary candidate finite quotients, because a quotient by a set containing zero must be a subset of the nine-point set. `UniqueQuotient.product` and `slab_uniqueQuotient` extend these results to arbitrary finite dimensions, with independent Boolean coordinates. This finite gadget is only a supporting component of the general result.

`Constraints` records an arbitrary finite list of distinct-coordinate forbidden pairs. Repetition and either orientation are allowed. `Compatible` says precisely that an axis set contains no forbidden pair, hence is a clique of the represented graph. `graph_box_divisor_iff` proves both directions for every axis set, and `graph_uniqueQuotient` proves uniqueness among all finite quotients.

There is one harmless padding difference from the written construction: the Lean graph set always includes a full Boolean upper slice at marker zero, even when forbidden pairs are present. `uniqueQuotient_stack` proves that this row always has the unique complementary-box quotient and imposes no extra divisor restriction. Every forbidden pair still has a separate positive marker. The exact divisor equivalence is proved for this construction.

`Layered` states zero containment, height at most one, existence of height one, and exact equality of the bottom slice with a Boolean box. `layered_factor` classifies every reduced binary decomposition. `layered_atomic_factorization` handles every finite list of atoms, proving that precisely one factor has positive height and all others form a box. The maximal-box-divisor/atom equivalence and its converse realization give `layered_lengths`; `graph_lengths` specializes this to exactly the numbers one more than the cardinalities of maximal cliques.

`blockConstraints` builds a disjoint union of complete graphs of arbitrary positive component sizes. `block_maximal_iff` proves that its maximal cliques are precisely its components. Thus `finite_spectrum_lattice` realizes every requested nonempty finite set of lengths at least two, with no additional lengths.

## Radix and natural-number correspondence

`radix_injective_bounded` proves uniqueness of finite radix expansions below the base. `encodeHom` is an actual additive map on the complete finite coordinate type. The uniform bound is a finite supremum over all coordinates of all points, and the chosen base is greater than twice that bound.

`radix_divisors_lift` quantifies over every reduced binary decomposition of the encoded set. Both one-dimensional factors lie in its image because the other factor contains zero. Their lifted points are therefore bounded by the same original maximum; pairwise sums have no carry. This proves a full binary lift, including equality of the resulting sumset with the original set.

`radix_atom_iff`, `radix_lift_factorization`, and `radix_lengths` discharge atom preservation and both directions of complete length-set equality. The proof does not merely map the exhibited graph factorizations. Every intermediate lifted factor stays inside the original bounded set.

`finite_spectrum_nat` combines these constructions. `natural_length_system` proves the converse classification: the maximum of a sumset is the sum of maxima; every nonidentity factor contributes positively; all atomic factorization lengths are bounded; and strong induction on the maximum produces an atomic factorization for every finite set containing zero. The resulting full system is exactly `{0}`, `{1}`, and all nonempty finite subsets of the integers at least two.

## Independent monoid-transfer review

The four monoid modules were read independently after their author’s source builds. `pow_injective_of_infinitePowers` proves the source’s infinite-positive-power assumption implies an injective natural-number power map. Any repeated powers would reduce all later powers into a fixed finite initial interval, contradicting infinitude.

`normalize_two` and `normalize_atom_list` use Dedekind-finiteness to turn selected factors of the identity into units. They multiply successive factors by inverse units on the correct sides, preserving their exact ordered product and atom status. No commutativity or cancellation of the ambient monoid is assumed.

After normalization, every factor contains the identity and hence lies in the actual finite power image. `powerPreimage` lifts it to the finite natural-number set. `powerAtom_powerImage_iff` proves atom equivalence, and `powerLengths_powerImage` proves equality in both directions for all factorization lengths. `restrictedAtom_iff` and `restrictedLengths_eq_powerLengths` prove that the restricted monoid gives the same lengths on the constructed element; this uses the proved divisor closure of sets meeting the unit group in a Dedekind-finite monoid.

No published transfer theorem or project-specific axiom is assumed. The final endpoint applies these proved transfers to `finite_spectrum_nat` and produces the same finite set for both monoids.

## Second statement review

The monoid-transfer author separately checked the literal reduced `Atom` and `Lengths` definitions, the complete graph-length endpoint, the arbitrary block-spectrum construction, every divisor and atomic-factorization lift in the radix transfer, the full reduced-natural-number system proof, and the final composition. These inspected statements have no remaining realization or transfer hypotheses. In particular, the no-carry estimate applies to all possible factors because reduced factors are subsets of their product; the complete set equality excludes extra lengths. The natural-number converse handles all finite sets containing zero, not just the constructed examples.

Both proof agents read the primary source’s positive-power and length conventions independently. The second review agrees that the final ordinary/restricted theorem exactly covers the original 2018 conjecture. The original written-proof audit supplies the earlier independent graph-construction review. These are internal checks; no external peer review or priority certification is asserted.

## Verification

The [frozen combined checkpoint](../../docs/verification/lean-fan-tringali-complete-20261124-162051/checkpoint-004/receipt.json) records fresh builds of all 18 sources with warnings as errors, the repository all-owned/private audit of 432 declarations including 350 theorems and three private declarations, and all 28 required endpoints. Only `propext`, `Classical.choice`, and `Quot.sound` occur transitively. Every one of the 18 stock `leanchecker -v` replays exited zero. The exact source hashes, original runner, audit inventory, source logs and kernel logs are preserved together.

The [portable publication receipt](../../docs/verification/lean-fan-tringali-complete-20261124-162051/receipt.json) additionally records compiler/checker, control, object and log hashes, checks the exact project closure and registrations, and validates the exact replayed module set. See [the reproduction instructions](LEAN.md#verification-and-reproduction).

This is one completed existing conjecture result. The 18 modules and their supporting theorems are not additional counted results. Hosted aggregate verification and public-site deployment remain separate publication obligations; their status is recorded in the original issue and linked follow-up rather than inferred from the scoped proof checks.
