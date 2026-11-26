module
public import Conjectures.PomeranceSarkozyJointCountComparison

@[expose] public section
namespace PomeranceSarkozy

open Finset

noncomputable def arithmeticObservationSubtype (I P : Finset ℕ) (L N : ℕ) (j : Fin N) :
    ↥(I×ˢP).powerset :=
  ⟨arithmeticObservation (I×ˢP) L j,Finset.mem_powerset.mpr (Finset.filter_subset _ _)⟩

theorem arithmeticObservation_mass_eq_uniform (I P : Finset ℕ) (L N : ℕ) :
    (fun S : ↥(I×ˢP).powerset => observationLaw (arithmeticObservation (I×ˢP) L (N:=N)) S.val)
      = uniformImageMass (arithmeticObservationSubtype I P L N) := by
  classical
  funext S
  unfold observationLaw uniformImageMass
  congr 1
  apply congrArg (fun k : ℕ => (k:ℚ))
  apply congrArg Finset.card
  ext r
  simp only [Finset.mem_filter,Finset.mem_univ,true_and]
  constructor
  · intro h
    exact Subtype.ext h
  · intro h
    exact congrArg Subtype.val h

/-- The arithmetic atom law counts the literal interval points whose
vector of shifted prime-factor counts is the specified vector. -/
theorem arithOffsetMass_eq_count_ratio (I P : Finset ℕ) (L N : ℕ) (s : ↥I→ℕ) :
    arithOffsetMass I P L N s = open Classical in
      (((Finset.univ : Finset (Fin N)).filter (fun j =>
        (fun h : ↥I => (P.filter fun p => p ∣ L+j.val-h.val).card)=s)).card:ℝ)/(N:ℝ) := by
  classical
  unfold arithOffsetMass
  rw [atomicPush_cast_pushFiniteLaw,arithmeticObservation_mass_eq_uniform,push_uniformImageMass]
  have he : ((fun S : ↥(I×ˢP).powerset => fun h : ↥I => (offsetCounts I P S.val h).val) ∘
      arithmeticObservationSubtype I P L N)
      =(fun j : Fin N => fun h : ↥I => (P.filter fun p => p ∣ L+j.val-h.val).card) := by
    funext j h
    exact offsetCounts_arithmetic I P L N j h
  rw [he]
  unfold uniformImageMass
  rw [Fintype.card_fin]
  push_cast
  rfl

end PomeranceSarkozy
