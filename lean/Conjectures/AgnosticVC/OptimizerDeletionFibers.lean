module

public import Conjectures.AgnosticVC.OptimizerCollapse
public import Conjectures.AgnosticVC.VC

@[expose] public section

open scoped BigOperators

namespace AgnosticVC

variable {I : Type*} [Fintype I] [DecidableEq I]

abbrev DeletedFamily (F : Finset (Finset I)) (i : I) := traceRestriction F (Finset.univ.erase i)

theorem erase_inter_univ (i : I) (v : Finset I) : (Finset.univ.erase i) ∩ v = v.erase i := by
  ext x
  simp

/-- The trace map obtained by forgetting one coordinate. -/
def forgetTrace (F : Finset (Finset I)) (i : I) (v : ↥F) : ↥(DeletedFamily F i) :=
  ⟨v.val.erase i, Finset.mem_image.mpr ⟨v.val, v.property, erase_inter_univ i v.val⟩⟩

theorem forgetTrace_surjective (F : Finset (Finset I)) (i : I) :
    Function.Surjective (forgetTrace F i) := by
  intro s
  obtain ⟨v, hv, he⟩ := Finset.mem_image.mp s.property
  exact ⟨⟨v, hv⟩, Subtype.ext ((erase_inter_univ i v).symm.trans he)⟩

theorem notMem_deleted (F : Finset (Finset I)) (i : I) (s : ↥(DeletedFamily F i)) :
    i ∉ s.val := by
  obtain ⟨v, rfl⟩ := forgetTrace_surjective F i s
  exact Finset.notMem_erase _ _

omit [Fintype I] in
private theorem eq_or_eq_insert_of_erase {i : I} {v b : Finset I} (he : v.erase i = b) :
    v = b ∨ v = insert i b := by
  by_cases h : i ∈ v
  · exact Or.inr (by rw [← he, Finset.insert_erase h])
  · exact Or.inl (by rwa [Finset.erase_eq_self.mpr h] at he)

private theorem fiberSize_forgetTrace (F : Finset (Finset I)) (i : I) (b : ↥(DeletedFamily F i)) :
    fiberSize (forgetTrace F i) b =
      (({b.val, insert i b.val} : Finset (Finset I)).filter (fun v => v ∈ F)).card := by
  classical
  unfold fiberSize
  rw [← Finset.card_image_of_injective _ Subtype.val_injective]
  apply congrArg Finset.card
  ext v
  simp only [Finset.mem_image, Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_insert,
    Finset.mem_singleton]
  constructor
  · rintro ⟨a, ha, rfl⟩
    exact ⟨eq_or_eq_insert_of_erase (congrArg Subtype.val ha), a.property⟩
  · rintro ⟨hv | hv, hF⟩
    · refine ⟨⟨v, hF⟩, Subtype.ext ?_, rfl⟩
      exact Finset.erase_eq_self.mpr (hv ▸ notMem_deleted F i b) |>.trans hv
    · refine ⟨⟨v, hF⟩, Subtype.ext ?_, rfl⟩
      change v.erase i = b.val
      rw [hv, Finset.erase_insert (notMem_deleted F i b)]

theorem fiberSize_forgetTrace_cases (F : Finset (Finset I)) (i : I) (b : ↥(DeletedFamily F i)) :
    fiberSize (forgetTrace F i) b = 1 ∨ fiberSize (forgetTrace F i) b = 2 := by
  have hp := fiberSize_pos (forgetTrace F i) (forgetTrace_surjective F i b)
  have hc : fiberSize (forgetTrace F i) b ≤ 2 := by
    rw [fiberSize_forgetTrace]
    exact (Finset.card_filter_le _ _).trans (Finset.card_le_two (a := b.val) (b := insert i b.val))
  omega

theorem fiberSize_forgetTrace_eq_two_iff (F : Finset (Finset I)) (i : I) (b : ↥(DeletedFamily F i)) :
    fiberSize (forgetTrace F i) b = 2 ↔ b.val ∈ oneInclusionEdges F i := by
  have hi := notMem_deleted F i b
  have hne : b.val ≠ insert i b.val := fun he => hi (he ▸ Finset.mem_insert_self i b.val)
  rw [fiberSize_forgetTrace, mem_oneInclusionEdges]
  simp only [hi, not_false_eq_true, true_and]
  by_cases h₀ : b.val ∈ F <;> by_cases h₁ : insert i b.val ∈ F <;>
    simp [Finset.filter_insert, Finset.filter_singleton, h₀, h₁, hne]

/-- Extend a law by zero to all binary traces, including unrealized ones. -/
noncomputable def traceMassOn (F : Finset (Finset I)) (p : ↥F → ℝ) (s : Finset I) : ℝ :=
  if h : s ∈ F then p ⟨s, h⟩ else 0

omit [Fintype I] in
@[simp] theorem traceMassOn_apply (F : Finset (Finset I)) (p : ↥F → ℝ) (v : ↥F) :
    traceMassOn F p v.val = p v := by simp [traceMassOn, v.property]

private noncomputable def markDeletionFiber (F : Finset (Finset I)) (i : I) (p : ↥F → ℝ)
    (b : ↥(DeletedFamily F i)) : ↥F := by
  classical
  by_cases hb : b.val ∈ oneInclusionEdges F i
  · have h₀ := (mem_oneInclusionEdges.mp hb).1
    have h₁ := (mem_oneInclusionEdges.mp hb).2.2
    exact if p ⟨b.val, h₀⟩ ≤ p ⟨insert i b.val, h₁⟩ then ⟨b.val, h₀⟩ else ⟨insert i b.val, h₁⟩
  · exact Classical.choose (forgetTrace_surjective F i b)

private theorem markDeletionFiber_section (F : Finset (Finset I)) (i : I) (p : ↥F → ℝ) :
    Function.LeftInverse (forgetTrace F i) (markDeletionFiber F i p) := by
  classical
  intro b
  unfold markDeletionFiber
  split
  · dsimp only
    split
    · apply Subtype.ext
      exact Finset.erase_eq_self.mpr (notMem_deleted F i b)
    · apply Subtype.ext
      exact Finset.erase_insert (notMem_deleted F i b)
  · exact Classical.choose_spec (forgetTrace_surjective F i b)

private theorem markDeletionFiber_mass (F : Finset (Finset I)) (i : I) (p : ↥F → ℝ)
    (b : ↥(DeletedFamily F i)) (hb : b.val ∈ oneInclusionEdges F i) :
    p (markDeletionFiber F i p b) = min (traceMassOn F p b.val) (traceMassOn F p (insert i b.val)) := by
  classical
  have h₀ := (mem_oneInclusionEdges.mp hb).1
  have h₁ := (mem_oneInclusionEdges.mp hb).2.2
  unfold markDeletionFiber
  simp only [dite_eq_left hb, traceMassOn, dite_eq_left h₀, dite_eq_left h₁]
  split
  · exact (min_eq_left ‹_›).symm
  · exact (min_eq_right (le_of_not_ge ‹_›)).symm

private theorem marked_mass_eq_edge_sum (F : Finset (Finset I)) (i : I) (p : ↥F → ℝ) :
    (∑ a ∈ (Finset.univ.filter (fun b => fiberSize (forgetTrace F i) b = 2)).image
        (markDeletionFiber F i p), p a) =
      ∑ b ∈ oneInclusionEdges F i, min (traceMassOn F p b) (traceMassOn F p (insert i b)) := by
  classical
  have hs := markDeletionFiber_section F i p
  rw [Finset.sum_image (fun x _ y _ h => hs.injective h)]
  have he : (Finset.univ.filter (fun b => fiberSize (forgetTrace F i) b = 2)).image
      Subtype.val = oneInclusionEdges F i := by
    ext b
    simp only [Finset.mem_image, Finset.mem_filter, Finset.mem_univ, true_and,
      fiberSize_forgetTrace_eq_two_iff]
    constructor
    · rintro ⟨v, hv, rfl⟩
      exact hv
    · intro hb
      obtain ⟨h₀, hi, _⟩ := mem_oneInclusionEdges.mp hb
      have hmem : b ∈ DeletedFamily F i := Finset.mem_image.mpr
        ⟨b, h₀, (erase_inter_univ i b).trans (Finset.erase_eq_self.mpr hi)⟩
      exact ⟨⟨b, hmem⟩, hb, rfl⟩
  rw [← he, Finset.sum_image (fun x _ y _ h => Subtype.val_injective h)]
  exact Finset.sum_congr rfl fun b hb => markDeletionFiber_mass F i p b
    ((fiberSize_forgetTrace_eq_two_iff F i b).mp (Finset.mem_filter.mp hb).2)

/-- After erasing one position, the mass of two-element fibers under any equal lift is controlled
by the original law's smaller endpoint masses, and the Hellinger change in reaching the lift. -/
theorem doubleMass_forgetTrace_le (F : Finset (Finset I)) (i : I) (p : ↥F → ℝ)
    (q : ↥(DeletedFamily F i) → ℝ) (hp : IsLaw p) (hq : IsLaw q) :
    doubleMass (forgetTrace F i) q ≤
      4 * (∑ b ∈ oneInclusionEdges F i, min (traceMassOn F p b) (traceMassOn F p (insert i b))) +
      4 * hellingerSq p (equalLift (forgetTrace F i) q) := by
  have h := doubleMass_le_marked (forgetTrace F i) (markDeletionFiber F i p)
    (markDeletionFiber_section F i p) hp hq
  rwa [marked_mass_eq_edge_sum F i p] at h

/-- Summing the marked mass bound over all forgotten positions adds at most four times the VC
dimension to the accumulated Hellinger error. -/
theorem sum_doubleMass_forgetTrace_le (F : Finset (Finset I)) (p : ↥F → ℝ)
    (q : ∀ i, ↥(DeletedFamily F i) → ℝ) (hp : IsLaw p) (hq : ∀ i, IsLaw (q i)) :
    ∑ i, doubleMass (forgetTrace F i) (q i) ≤ 4 * (F.vcDim : ℝ) +
      4 * ∑ i, hellingerSq p (equalLift (forgetTrace F i) (q i)) := by
  classical
  have hm := Finset.sum_le_sum fun i (_ : i ∈ Finset.univ) => doubleMass_forgetTrace_le F i p (q i) hp (hq i)
  rw [Finset.sum_add_distrib, ← Finset.mul_sum, ← Finset.mul_sum] at hm
  have hi := weighted_oneInclusionEdges_le F Finset.univ F.vcDim (traceMassOn F p)
    (fun s _ => Finset.subset_univ s) le_rfl (fun s hs => by simpa [traceMassOn, hs] using hp.1 ⟨s, hs⟩)
  have he : ∑ s ∈ F, traceMassOn F p s = 1 := by
    rw [← F.sum_attach]
    simpa [traceMassOn] using hp.2
  rw [he, mul_one] at hi
  linarith only [hm, hi]

end AgnosticVC
