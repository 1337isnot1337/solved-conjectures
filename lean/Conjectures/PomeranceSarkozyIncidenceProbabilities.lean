module
public import Conjectures.PomeranceSarkozyModelIncidence

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical

noncomputable def independentIncidenceProbability (P : Finset ℕ) (S : Finset Incidence) : ℚ :=
  (Fintype.card (IndependentIncidenceEvent P S):ℚ) /
    (Fintype.card (∀ p : ↥P,Fin p.val):ℚ)

def arithmeticIncidenceProbability (L N : ℕ) (S : Finset Incidence) : ℚ :=
  ((incidenceWindow L N S).card:ℚ)/N

theorem independentIncidenceProbability_of_compatible (P : Finset ℕ) (S : Finset Incidence)
    (hP : ∀ p∈P,p.Prime) (hsub : ∀ e∈S,e.2∈P)
    (hsmall : ∀ e∈S,e.1 < e.2) (hc : compatible S) :
    independentIncidenceProbability P S = ((incidenceModulus S:ℕ):ℚ)⁻¹ := by
  unfold independentIncidenceProbability
  rw [Fintype.card_congr (incidenceModelEquiv P S hP hsub hsmall hc),
    fixedCoordinates_probability _ _ (fun p => by rw [Fintype.card_fin]; exact (hP _ p.property).pos)]
  simp only [Fintype.card_fin]
  have he :
      (∏ e ∈ S,(e.2:ℚ)⁻¹) = ∏ p ∈ prescribedPrimes P S,(p.val:ℚ)⁻¹ := by
    apply Finset.prod_bij (fun e he => (⟨e.2,hsub e he⟩ : ↥P))
    · intro e he
      exact (mem_prescribedPrimes P S _).mpr ⟨e,he,rfl⟩
    · intro e he f hf hef
      exact hc e he f hf (congrArg Subtype.val hef)
    · intro p hp
      obtain ⟨e,he,h⟩ := (mem_prescribedPrimes P S p).mp hp
      exact ⟨e,he,Subtype.ext h⟩
    · intro e _
      rfl
  rw [← he,Finset.prod_inv_distrib]
  simp [incidenceModulus,Nat.cast_prod]

theorem independentIncidenceProbability_of_incompatible (P : Finset ℕ) (S : Finset Incidence)
    (hn : ¬compatible S) :
    independentIncidenceProbability P S=0 := by
  have him : IsEmpty (IndependentIncidenceEvent P S) := ⟨fun r => by
    apply hn
    intro e he f hf h
    obtain ⟨heP,heq⟩ := r.property e he
    obtain ⟨hfP,hfq⟩ := r.property f hf
    have hv := congrArg (fun p : ↥P => (r.val p).val) (show (⟨e.2,heP⟩ : ↥P)=⟨f.2,hfP⟩ from Subtype.ext h)
    exact Prod.ext (heq.symm.trans (hv.trans hfq)) h⟩
  unfold independentIncidenceProbability
  rw [Fintype.card_eq_zero_iff.mpr him]
  simp

/-- Exact arithmetic-to-independent model discrepancy for each
inclusion probability, uniformly over compatible or incompatible
incidence subsets. This is the finite CRT estimate in equation (5). -/
theorem incidence_inclusion_discrepancy (P : Finset ℕ) (S : Finset Incidence) (L N : ℕ)
    (hN : 0 < N) (hP : ∀ p∈P,p.Prime) (hsub : ∀ e∈S,e.2∈P)
    (hsmall : ∀ e∈S,e.1 < e.2) (hstart : ∀ e∈S,e.1≤L) :
    |arithmeticIncidenceProbability L N S - independentIncidenceProbability P S| ≤ 1/(N:ℚ) := by
  by_cases hc : compatible S
  · rw [independentIncidenceProbability_of_compatible P S hP hsub hsmall hc]
    have hp e he := hP e.2 (hsub e he)
    have hq : (0:ℚ) < (N:ℚ) := by exact_mod_cast hN
    have hq0 : (N:ℚ) ≠ 0 := ne_of_gt hq
    have he : ((incidenceModulus S:ℕ):ℚ)⁻¹ =
        ((N:ℚ)/(incidenceModulus S:ℚ))/(N:ℚ) := by
      field_simp
    unfold arithmeticIncidenceProbability
    rw [he,← sub_div,abs_div,abs_of_pos hq]
    exact div_le_div_of_nonneg_right (incidenceWindow_count_error L N S hp hc hstart) hq.le
  · rw [independentIncidenceProbability_of_incompatible P S hc,arithmeticIncidenceProbability,
      incidenceWindow_incompatible L N S hsmall hstart hc]
    simp

end PomeranceSarkozy
