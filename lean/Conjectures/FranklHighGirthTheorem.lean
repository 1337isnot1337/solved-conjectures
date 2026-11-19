module

public import Conjectures.FranklHighGirthGraphCore
public import Conjectures.FranklTreeSmallDegrees
public import Conjectures.FranklLargeTheorem

/-! The full high-girth generator frequency theorem.

Every point of a three-regular, k-uniform finite generating family, k ≥ 3,
belongs to at least 518208/1000000 of its distinct unions when the incidence
graph has no cycle shorter than sixteen. The empty union is included.
The small-degree case uses the checked cone certificates and the actual
boundary-conditioned graph counts. The large-degree case uses the proved
657/1000 bound, after deriving linearity from the girth hypothesis. -/
@[expose] public section

namespace FranklHighGirth

open FranklIncidence FranklTreeBall FranklTreeCone Finset

variable {α ι : Type*} [DecidableEq α] [Fintype ι]

theorem small_generator_frequency (gen : ι → Finset α) (k : ℕ)
    (hk : 3 ≤ k) (hk' : k ≤ 14)
    (hsize : ∀ i, (gen i).card = k)
    (hregular : ∀ a, (Frankl.Large.incident gen a).card = 3)
    (hg : NoShortCycle (incidenceGraph (fun i => (gen i : Set α))) 16) (a : α) :
    518208 * (FranklLocal.family (univ.image gen)).card ≤
      1000000 * ((FranklLocal.family (univ.image gen)).filter (fun U => a ∈ U)).card := by
  have h := distinct_union_absence_bound gen k hsize hregular hg a
    ((481792 : ℝ) / 1000000) (by
      intro x hx y hy z hz htotal
      exact small_degree_tree_bound k hk hk' hx hy hz htotal)
  have hscale :
      (1000000 : ℝ) *
        (((FranklLocal.family (univ.image gen)).filter (fun U => a ∉ U)).card : ℝ) ≤
      481792 * ((FranklLocal.family (univ.image gen)).card : ℝ) := by
    linarith
  have hnat :
      1000000 * ((FranklLocal.family (univ.image gen)).filter (fun U => a ∉ U)).card ≤
      481792 * (FranklLocal.family (univ.image gen)).card := by
    exact_mod_cast hscale
  have hsplit := card_filter_add_card_filter_not
    (s := FranklLocal.family (univ.image gen)) (fun U : Finset α => a ∈ U)
  omega

theorem high_girth_generator_frequency [DecidableEq ι]
    (gen : ι → Finset α) (k : ℕ) (hk : 3 ≤ k)
    (hsize : ∀ i, (gen i).card = k)
    (hregular : ∀ a, (Frankl.Large.incident gen a).card = 3)
    (hg : NoShortCycle (incidenceGraph (fun i => (gen i : Set α))) 16) (a : α) :
    518208 * (FranklLocal.family (univ.image gen)).card ≤
      1000000 * ((FranklLocal.family (univ.image gen)).filter (fun U => a ∈ U)).card := by
  by_cases hsmall : k ≤ 14
  · exact small_generator_frequency gen k hk hsmall hsize hregular hg a
  · have hlarge := Frankl.Large.large_generator_frequency gen k (by omega)
      hsize hregular (linear_of_no_short_cycle gen hg) a
    omega

theorem high_girth_generator_frequency_of_girth [DecidableEq ι]
    (gen : ι → Finset α) (k : ℕ) (hk : 3 ≤ k)
    (hsize : ∀ i, (gen i).card = k)
    (hregular : ∀ a, (Frankl.Large.incident gen a).card = 3)
    (hg : 16 ≤ (incidenceGraph (fun i => (gen i : Set α))).girth) (a : α) :
    518208 * (FranklLocal.family (univ.image gen)).card ≤
      1000000 * ((FranklLocal.family (univ.image gen)).filter (fun U => a ∈ U)).card :=
  high_girth_generator_frequency gen k hk hsize hregular
    (fun _ _ hc => hg.trans hc.girth_le_length) a

theorem high_girth_generator_frequency_of_egirth [DecidableEq ι]
    (gen : ι → Finset α) (k : ℕ) (hk : 3 ≤ k)
    (hsize : ∀ i, (gen i).card = k)
    (hregular : ∀ a, (Frankl.Large.incident gen a).card = 3)
    (hg : (16 : ℕ∞) ≤ (incidenceGraph (fun i => (gen i : Set α))).egirth) (a : α) :
    518208 * (FranklLocal.family (univ.image gen)).card ≤
      1000000 * ((FranklLocal.family (univ.image gen)).filter (fun U => a ∈ U)).card :=
  high_girth_generator_frequency gen k hk hsize hregular
    (fun _ _ hc => ENat.natCast_le_natCast.mp (hg.trans hc.egirth_le_length)) a

theorem high_girth_nonempty_union_frequency [DecidableEq ι]
    (gen : ι → Finset α) (k : ℕ) (hk : 3 ≤ k)
    (hsize : ∀ i, (gen i).card = k)
    (hregular : ∀ a, (Frankl.Large.incident gen a).card = 3)
    (hg : NoShortCycle (incidenceGraph (fun i => (gen i : Set α))) 16) (a : α) :
    518208 * ((FranklLocal.family (univ.image gen)).erase ∅).card ≤
      1000000 * (((FranklLocal.family (univ.image gen)).erase ∅).filter
        (fun U => a ∈ U)).card := by
  have hfilter :
      ((FranklLocal.family (univ.image gen)).erase ∅).filter (fun U => a ∈ U) =
      (FranklLocal.family (univ.image gen)).filter (fun U => a ∈ U) := by
    ext U
    simp only [mem_filter, mem_erase]
    constructor
    · rintro ⟨⟨_, hU⟩, ha⟩
      exact ⟨hU, ha⟩
    · rintro ⟨hU, ha⟩
      refine ⟨⟨?_, hU⟩, ha⟩
      intro he
      simp [he] at ha
  rw [hfilter]
  exact (Nat.mul_le_mul_left 518208
    (card_le_card (erase_subset ∅ (FranklLocal.family (univ.image gen))))).trans
      (high_girth_generator_frequency gen k hk hsize hregular hg a)

end FranklHighGirth
