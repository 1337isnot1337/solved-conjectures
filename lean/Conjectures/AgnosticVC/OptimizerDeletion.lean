module

public import Conjectures.AgnosticVC.OptimizerRestrictionDeletion
public import Conjectures.AgnosticVC.OptimizerDeletionFibers

@[expose] public section

open scoped BigOperators

namespace AgnosticVC

variable {I : Type*} [Fintype I] [DecidableEq I]

/-- Restrict a deleted trace to surviving positions, using the same realized restriction values
as the full family. -/
def survivingRestriction (F : Finset (Finset I)) (i : I) (σ : Schedule)
    (k : AvoidingSampleSubset i σ) (b : ↥(DeletedFamily F i)) :
    ↥(traceRestriction F k.2.val.val) := by
  refine ⟨k.2.val.val ∩ b.val, ?_⟩
  obtain ⟨v, rfl⟩ := forgetTrace_surjective F i b
  refine Finset.mem_image.mpr ⟨v.val, v.property, ?_⟩
  ext j
  change j ∈ k.2.val.val ∩ v.val ↔ j ∈ k.2.val.val ∩ v.val.erase i
  simp only [Finset.mem_inter, Finset.mem_erase]
  exact ⟨fun ⟨hj, hv⟩ => ⟨hj, fun h => k.2.property (h ▸ hj), hv⟩, fun ⟨hj, _, hv⟩ => ⟨hj, hv⟩⟩

theorem survivingRestriction_comp (F : Finset (Finset I)) (i : I) (σ : Schedule)
    (k : AvoidingSampleSubset i σ) : survivingRestriction F i σ k ∘ forgetTrace F i =
      restrictionOn F k.2.val.val := by
  funext v
  apply Subtype.ext
  change k.2.val.val ∩ v.val.erase i = k.2.val.val ∩ v.val
  ext j
  simp only [Finset.mem_inter, Finset.mem_erase]
  exact ⟨fun ⟨hj, _, hv⟩ => ⟨hj, hv⟩, fun ⟨hj, hv⟩ => ⟨hj, fun h => k.2.property (h ▸ hj), hv⟩⟩

theorem mistakeCount_update_zero_erase (i : I) (y : I → Bool) (w : I → ℝ) (v : Finset I) :
    mistakeCount y (Function.update w i 0) (v.erase i) = mistakeCount y (Function.update w i 0) v := by
  classical
  unfold mistakeCount
  apply Finset.sum_congr rfl
  intro j _
  by_cases he : j = i
  · subst j
    simp
  · simp [Finset.mem_erase, he]

noncomputable def deletedTraceOptimizer (F : Finset (Finset I)) (i : I) [Nonempty ↥(DeletedFamily F i)]
    (σ : Schedule) (y : I → Bool) (w : I → ℝ) : ↥(DeletedFamily F i) → ℝ :=
  optimizer (fun b => mistakeCount y (Function.update w i 0) b.val) σ.temperature
    (avoidingRestrictionCoeff i σ) (survivingRestriction F i σ)

/-- The deleted objective pulled back to full traces is exactly the optimizer with zero loss
weight and restrictions avoiding the deleted row. -/
theorem avoidOptimizer_eq_pullback (F : Finset (Finset I)) [Nonempty ↥F] (i : I) (σ : Schedule)
    (y : I → Bool) (w : I → ℝ) :
    avoidOptimizer F i σ (fun v => mistakeCount y (Function.update w i 0) v.val) =
      optimizer ((fun b : ↥(DeletedFamily F i) => mistakeCount y (Function.update w i 0) b.val) ∘ forgetTrace F i)
        σ.temperature (avoidingRestrictionCoeff i σ) (fun k => survivingRestriction F i σ k ∘ forgetTrace F i) := by
  have he (v : ↥F) : mistakeCount y (Function.update w i 0) v.val =
      mistakeCount y (Function.update w i 0) (forgetTrace F i v).val :=
    (mistakeCount_update_zero_erase i y w v.val).symm
  unfold avoidOptimizer
  simp only [survivingRestriction_comp]
  rw [show (fun v : ↥F => mistakeCount y (Function.update w i 0) v.val) = _ from funext he]
  rfl

/-- The pointwise sum of deletion distances for the actual restriction scheme. The first term
that remains on the right is the sum of loss-only deletion distances. -/
theorem sum_hellingerSq_deleted_le (F : Finset (Finset I)) [Nonempty ↥F]
    [∀ i, Nonempty ↥(DeletedFamily F i)] (σ : Schedule) (y : I → Bool) (w : I → ℝ)
    (sectionRep : ∀ i, ↥(DeletedFamily F i) → ↥F)
    (hs : ∀ i, Function.LeftInverse (forgetTrace F i) (sectionRep i))
    (hτ : 0 < σ.temperature) (hc : ∀ j, 0 ≤ σ.coeff j) (hm : ∀ j, σ.size j < Fintype.card I) :
    let q := optimizer (fun v : ↥F => mistakeCount y w v.val) σ.temperature
      (restrictionCoeff σ) (fun k => restrictionOn F k.2.val)
    let r := fun i => optimizer (fun v : ↥F => mistakeCount y (Function.update w i 0) v.val) σ.temperature
      (restrictionCoeff σ) (fun k => restrictionOn F k.2.val)
    let B := 8 * ((∑ j, σ.coeff j * ((σ.size j : ℝ) / Fintype.card I)) / σ.temperature)^2
    (∑ i, hellingerSq q (marginal (sectionRep i) (deletedTraceOptimizer F i σ y w))) ≤
      32 * (F.vcDim : ℝ) + 68 * ((∑ i, hellingerSq q (r i)) + (Fintype.card I : ℝ) * B) := by
  intro q r B
  let loss' (i : I) (b : ↥(DeletedFamily F i)) := mistakeCount y (Function.update w i 0) b.val
  let f := fun i => avoidOptimizer F i σ (fun v => mistakeCount y (Function.update w i 0) v.val)
  let p := fun i => marginal (forgetTrace F i) (f i)
  let μ := fun i => doubleMass (forgetTrace F i) (p i)
  have hF (i : I) : f i = optimizer (loss' i ∘ forgetTrace F i) σ.temperature
      (avoidingRestrictionCoeff i σ) (fun k => survivingRestriction F i σ k ∘ forgetTrace F i) :=
    avoidOptimizer_eq_pullback F i σ y w
  have hci (i : I) (k : AvoidingSampleSubset i σ) : 0 ≤ avoidingRestrictionCoeff i σ k :=
    div_nonneg (hc k.1) (by positivity)
  have hE (i : I) : f i = equalLift (forgetTrace F i) (p i) := by
    change f i = equalLift (forgetTrace F i) (marginal (forgetTrace F i) (f i))
    rw [hF i]
    exact optimizer_eq_equalLift (forgetTrace F i) (loss' i) (survivingRestriction F i σ) hτ (hci i)
  have hq : IsLaw q := optimizer_isLaw _ _ _ _
  have hp (i : I) : IsLaw (p i) := (optimizer_isLaw _ _ _ _).marginal _
  have hbound := sum_doubleMass_forgetTrace_le F q p hq hp
  simp_rw [← hE] at hbound
  have hf (i : I) : hellingerSq (f i) (r i) ≤ B :=
    optimizer_remove_restrictions F i σ _ hτ hc hm
  have hcollapse (i : I) : hellingerSq (f i) (marginal (sectionRep i) (deletedTraceOptimizer F i σ y w)) ≤ 4 * μ i := by
    have he := optimizer_collapse_hellingerSq (forgetTrace F i) (sectionRep i) (hs i)
      (loss' i) (survivingRestriction F i σ) hτ (hci i) (fiberSize_forgetTrace_cases F i)
    let g := optimizer (loss' i ∘ forgetTrace F i) σ.temperature
      (avoidingRestrictionCoeff i σ) (fun k => survivingRestriction F i σ k ∘ forgetTrace F i)
    change hellingerSq g (marginal (sectionRep i) (deletedTraceOptimizer F i σ y w)) ≤
      4 * doubleMass (forgetTrace F i) (marginal (forgetTrace F i) g) at he
    have he' : g = f i := (hF i).symm
    rw [he'] at he
    exact he
  have hqr (i : I) : hellingerSq q (f i) ≤ 2 * (hellingerSq q (r i) + B) := by
    have h := hellingerSq_triangle q (f i) (r i)
    linarith only [h, hf i]
  have hres (i : I) : hellingerSq q (marginal (sectionRep i) (deletedTraceOptimizer F i σ y w)) ≤
      2 * (hellingerSq q (f i) + 4 * μ i) := by
    have h := hellingerSq_triangle q (marginal (sectionRep i) (deletedTraceOptimizer F i σ y w)) (f i)
    rw [hellingerSq_comm (marginal _ _)] at h
    linarith only [h, hcollapse i]
  have hsum₁ := Finset.sum_le_sum fun i (_ : i ∈ Finset.univ) => hqr i
  have hsum₂ := Finset.sum_le_sum fun i (_ : i ∈ Finset.univ) => hres i
  simp only [← Finset.mul_sum, Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ,
    nsmul_eq_mul] at hsum₁ hsum₂
  change ∑ i, μ i ≤ 4 * (F.vcDim : ℝ) + 4 * ∑ i, hellingerSq q (f i) at hbound
  linarith only [hsum₁, hsum₂, hbound]

end AgnosticVC
