module

public import Conjectures.FranklLargeBound
public import Conjectures.FranklLargeProbability
public import Conjectures.FranklLargeQuery
public import Conjectures.FranklFamilyCanonical

@[expose] public section

/-! The full large-generator point-frequency statement, with the original
regularity, size and pairwise-intersection hypotheses. The family below is
the set of distinct unions, including the empty union. -/

namespace Frankl.Large

open Finset

variable {α ι : Type*} [DecidableEq α] [Fintype ι] [DecidableEq ι]

theorem canonicalSelections_eq_avoid (G : ι → Finset α) :
    canonicalSelections G = Lopsided.avoid (badEvent G) univ := by
  ext s
  simp only [mem_canonicalSelections, canonical_iff_no_bad,
    Lopsided.mem_avoid, mem_badEvent, mem_univ, forall_const]

/-- Every point is present in at least 657/1000 of the distinct unions,
for every `k ≥ 15`. No unproved probabilistic hypothesis remains. -/
theorem large_generator_frequency (G : ι → Finset α) (k : ℕ) (hk : 15 ≤ k)
    (hsize : ∀ e, (G e).card = k)
    (hregular : ∀ a, (incident G a).card = 3)
    (hlinear : ∀ e f, e ≠ f → (G e ∩ G f).card ≤ 1) (a : α) :
    657 * (FranklLocal.family (univ.image G)).card ≤
      1000 * ((FranklLocal.family (univ.image G)).filter (fun U => a ∈ U)).card := by
  have hdegree : ∀ e, (neighbors G e).card ≤ 2 * k := fun e =>
    (card_neighbors G k hsize hregular hlinear e).le
  have hreaders := card_pointReaders_le G k (by omega) hsize hregular hlinear a
  have hquery := three_regular_point_absence_independent_nonreaders G a
    (univ \ pointReaders G a) (hregular a) sdiff_disjoint
  have habs := LargeBound.cardinal_absence_bound k hk (badEvent G) (neighbors G)
    (pointAbsent G a) (pointReaders G a) hdegree hreaders
    (nonneighbor_event_bound G k hsize hregular hlinear) hquery
  have htotal : (Lopsided.avoid (badEvent G) univ).card =
      (FranklLocal.family (univ.image G)).card := by
    rw [← canonicalSelections_eq_avoid]
    exact canonical_card_eq_distinct_unions G
  have hfiltered : (pointAbsent G a ∩ Lopsided.avoid (badEvent G) univ).card =
      ((FranklLocal.family (univ.image G)).filter (fun U => a ∉ U)).card := by
    rw [← canonicalSelections_eq_avoid]
    have heq : pointAbsent G a ∩ canonicalSelections G =
        (canonicalSelections G).filter (fun s => a ∉ generated G s) := by
      ext s
      simp only [mem_inter, mem_pointAbsent, mem_filter, and_comm]
    rw [heq]
    exact canonical_filtered_card G (fun U => a ∉ U)
  rw [htotal, hfiltered] at habs
  have hsplit := card_filter_add_card_filter_not
    (s := FranklLocal.family (univ.image G)) (fun U : Finset α => a ∈ U)
  omega

end Frankl.Large
