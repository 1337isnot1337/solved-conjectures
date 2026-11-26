module
public import Conjectures.PomeranceSarkozyFiniteTotalVariation
public import Conjectures.PomeranceSarkozyIncidenceProbabilities

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical

variable {A Ω : Type*} [DecidableEq A] [Fintype Ω]

noncomputable def observationLaw (o : Ω→Finset A) (S : Finset A) : ℚ :=
  ((Finset.univ.filter fun i => o i=S).card:ℚ)/(Fintype.card Ω:ℚ)

theorem observationLaw_nonneg (o : Ω→Finset A) (S : Finset A) :
    0≤observationLaw o S := by unfold observationLaw; positivity

theorem observationLaw_inclusion (I : Finset A) (o : Ω→Finset A) (ho : ∀ i,o i⊆I)
    (T : Finset A) :
    lawInclusion I (observationLaw o) T =
      ((Finset.univ.filter fun i => T⊆o i).card:ℚ)/(Fintype.card Ω:ℚ) := by
  unfold lawInclusion observationLaw
  let f (i : Ω) : ℚ := if T⊆o i then 1 else 0
  have hh (B : Finset A) :
      (if T⊆B then ((Finset.univ.filter fun i => o i=B).card:ℚ)/(Fintype.card Ω:ℚ) else 0) =
        (∑ i : Ω with o i=B,f i)/(Fintype.card Ω:ℚ) := by
    by_cases hT : T⊆B
    · rw [ite_eq_left hT]
      have he : (∑ i : Ω with o i=B,f i) = ((Finset.univ.filter fun i => o i=B).card:ℚ) := by
        rw [Finset.card_eq_sum_ones,Nat.cast_sum]
        apply Finset.sum_congr rfl
        intro i hi
        simp [f,(Finset.mem_filter.mp hi).2,hT]
      rw [he]
    · rw [ite_eq_right hT]
      have he : (∑ i : Ω with o i=B,f i)=0 := by
        apply Finset.sum_eq_zero
        intro i hi
        simp [f,(Finset.mem_filter.mp hi).2,hT]
      rw [he,zero_div]
  simp_rw [hh,div_eq_mul_inv]
  rw [← Finset.sum_mul,Finset.sum_fiberwise_of_maps_to
    (g:=o) (fun i _ => Finset.mem_powerset.mpr (ho i)) f]
  congr 1
  unfold f
  rw [← Finset.sum_filter,Finset.sum_const,nsmul_one]

def arithmeticObservation (I : Finset Incidence) (L : ℕ) {N : ℕ} (j : Fin N) : Finset Incidence :=
  I.filter fun e => e.2 ∣ L+j.val-e.1

-- Actual independent residue choices use one coordinate per prime.
noncomputable def modelObservation (I : Finset Incidence) {P : Finset ℕ}
    (r : ∀ p : ↥P,Fin p.val) : Finset Incidence :=
  I.filter (independentIncidence r)

theorem arithmetic_observation_inclusion (I : Finset Incidence) (L N : ℕ)
    {T : Finset Incidence} (hT : T⊆I) :
    lawInclusion I (observationLaw (arithmeticObservation I L (N:=N))) T =
      arithmeticIncidenceProbability L N T := by
  rw [observationLaw_inclusion I (arithmeticObservation I L (N:=N))
    (fun _ => Finset.filter_subset _ _) T]
  have he :
      ((Finset.univ : Finset (Fin N)).filter fun i => T⊆arithmeticObservation I L i).map Fin.valEmbedding =
        incidenceWindow L N T := by
    ext n
    simp only [Finset.mem_map,incidenceWindow,Finset.mem_filter,Finset.mem_univ,true_and,
      Finset.mem_range,Fin.valEmbedding_apply]
    constructor
    · rintro ⟨i,hi,rfl⟩
      exact ⟨i.isLt,fun e he => (Finset.mem_filter.mp (hi he)).2⟩
    · rintro ⟨hi,hd⟩
      exact ⟨⟨n,hi⟩,fun e he => Finset.mem_filter.mpr ⟨hT he,hd e he⟩,rfl⟩
  unfold arithmeticIncidenceProbability
  rw [Fintype.card_fin,← he,Finset.card_map]

theorem model_observation_inclusion (I : Finset Incidence) (P : Finset ℕ)
    {T : Finset Incidence} (hT : T⊆I) :
    lawInclusion I (observationLaw (modelObservation I (P:=P))) T =
      independentIncidenceProbability P T := by
  rw [observationLaw_inclusion I (modelObservation I (P:=P))
    (fun _ => Finset.filter_subset _ _) T]
  unfold independentIncidenceProbability
  congr 1
  apply congrArg (fun n : ℕ => (n:ℚ))
  rw [← Fintype.card_subtype]
  apply Fintype.card_congr
  apply Equiv.subtypeEquivRight
  intro r
  constructor
  · intro h e he
    exact (Finset.mem_filter.mp (h he)).2
  · intro hd e he
    exact Finset.mem_filter.mpr ⟨hT he,hd e he⟩

end PomeranceSarkozy
