module
public import Conjectures.PomeranceSarkozyObservationLaws
public import Conjectures.PomeranceSarkozyWindowCombinatorics

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical

def incidenceReciprocalMass (I : Finset Incidence) : ℚ :=
  ∑ e ∈ I,(e.2:ℚ)⁻¹

theorem modelInclusion_rank_sum_le (I : Finset Incidence) (P : Finset ℕ) (a : ℕ)
    (hP : ∀ p∈P,p.Prime) (hsub : ∀ e∈I,e.2∈P)
    (hsmall : ∀ e∈I,e.1 < e.2) :
    (∑ T ∈ I.powersetCard a,independentIncidenceProbability P T) ≤
      (incidenceReciprocalMass I)^a/(a.factorial:ℚ) := by
  have hF : (∑ T ∈ I.powersetCard a,independentIncidenceProbability P T) ≤
      weightedSubsets I (fun e => (e.2:ℚ)⁻¹) a := by
    unfold weightedSubsets
    apply Finset.sum_le_sum
    intro T hT
    have hTI := (Finset.mem_powersetCard.mp hT).1
    by_cases hc : compatible T
    · rw [independentIncidenceProbability_of_compatible P T hP
        (fun e he => hsub e (hTI he)) (fun e he => hsmall e (hTI he)) hc,
        Finset.prod_inv_distrib]
      simp [incidenceModulus,Nat.cast_prod]
    · rw [independentIncidenceProbability_of_incompatible P T hc]
      positivity
  have he := weightedSubsets_factorial_le I (fun e : Incidence => (e.2:ℚ)⁻¹)
    (fun e _ => by positivity) a
  have hp : (0:ℚ) < (a.factorial:ℚ) := by exact_mod_cast Nat.factorial_pos a
  apply hF.trans
  apply (le_div_iff₀ hp).mpr
  simpa [mul_comm,incidenceReciprocalMass] using he

/-- Finite growing-window comparison for the exact arithmetic and
independent residue laws. The bound gives twice total variation. -/
theorem arithmetic_model_window_l1 (I : Finset Incidence) (P : Finset ℕ) (L N R : ℕ)
    (hN : 0 < N) (hP : ∀ p∈P,p.Prime) (hsub : ∀ e∈I,e.2∈P)
    (hsmall : ∀ e∈I,e.1 < e.2) (hstart : ∀ e∈I,e.1≤L) :
    (∑ S ∈ I.powerset,
      |observationLaw (arithmeticObservation I L (N:=N)) S -
        observationLaw (modelObservation I (P:=P)) S|) ≤
      (((2*I.card+1)^R:ℕ):ℚ)/(N:ℚ) +
      ((2:ℚ)^(R+1)+1)*
        (2*((incidenceReciprocalMass I)^(R+1)/((R+1).factorial:ℚ)) +
          (I.card.choose (R+1):ℚ)/(N:ℚ)) := by
  let a := observationLaw (arithmeticObservation I L (N:=N))
  let b := observationLaw (modelObservation I (P:=P))
  let ε : ℚ := 1/(N:ℚ)
  have he : ∀ T⊆I,|lawInclusion I a T-lawInclusion I b T|≤ε := by
    intro T hT
    unfold a b ε
    rw [arithmetic_observation_inclusion I L N hT,model_observation_inclusion I P hT]
    exact incidence_inclusion_discrepancy P T L N hN hP
      (fun e he => hsub e (hT he)) (fun e he => hsmall e (hT he)) (fun e he => hstart e (hT he))
  have hf := truncated_inclusion_total_variation I a b R ε
    (fun S _ => observationLaw_nonneg _ _) (fun S _ => observationLaw_nonneg _ _)
    (fun T hT => he T (Finset.mem_powerset.mp (Finset.mem_filter.mp hT).1))
  have hn : 0≤ε := by unfold ε; positivity
  have hC : (∑ T ∈ smallSubsets I R,(2:ℚ)^T.card*ε) ≤ (((2*I.card+1)^R:ℕ):ℚ)/(N:ℚ) := by
    rw [← Finset.sum_mul]
    have hh := truncatedSubsetCard_bound I R
    have hh' : (∑ T ∈ smallSubsets I R,(2:ℚ)^T.card) ≤ (((2*I.card+1)^R:ℕ):ℚ) := by exact_mod_cast hh
    have he' := mul_le_mul_of_nonneg_right hh' hn
    simpa [ε,div_eq_mul_inv] using he'
  have hA : (∑ T ∈ I.powersetCard (R+1),lawInclusion I a T) ≤
      (∑ T ∈ I.powersetCard (R+1),lawInclusion I b T)+(I.card.choose (R+1):ℚ)/(N:ℚ) := by
    calc
      _ ≤ ∑ T ∈ I.powersetCard (R+1),(lawInclusion I b T+ε) := by
        apply Finset.sum_le_sum
        intro T hT
        have hT' := he T (Finset.mem_powersetCard.mp hT).1
        have hA' := (abs_le.mp hT').2
        linarith
      _ = _ := by simp [Finset.sum_add_distrib,Finset.card_powersetCard,nsmul_eq_mul,ε,div_eq_mul_inv]
  have hB : (∑ T ∈ I.powersetCard (R+1),lawInclusion I b T) ≤
      (incidenceReciprocalMass I)^(R+1)/((R+1).factorial:ℚ) := by
    unfold b
    calc
      _ = ∑ T ∈ I.powersetCard (R+1),independentIncidenceProbability P T := by
        apply Finset.sum_congr rfl
        intro T hT
        exact model_observation_inclusion I P (Finset.mem_powersetCard.mp hT).1
      _ ≤ _ := modelInclusion_rank_sum_le I P _ hP hsub hsmall
  refine hf.trans (add_le_add hC (mul_le_mul_of_nonneg_left ?_ (by positivity)))
  linarith

end PomeranceSarkozy
