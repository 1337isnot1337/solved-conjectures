module
public import Conjectures.PomeranceSarkozyProductVariation

@[expose] public section
namespace PomeranceSarkozy

open Finset
open scoped BigOperators

variable {A B Ω : Type*} [Fintype A] [Fintype B] [Fintype Ω]

noncomputable def uniformImageMass (o : Ω→A) (a : A) : ℚ :=
  open Classical in
    ((Finset.univ.filter fun w => o w=a).card:ℚ)/(Fintype.card Ω:ℚ)

omit [Fintype A] in
private theorem uniformImageMass_sum (o : Ω→A) (a : A) :
    uniformImageMass o a = open Classical in
      (∑ w : Ω, if o w=a then (1:ℚ) else 0)/(Fintype.card Ω:ℚ) := by
  classical
  unfold uniformImageMass
  rw [← Finset.sum_filter,Finset.sum_const,nsmul_one]

omit [Fintype B] in
/-- A finite uniform observation law maps to the finite uniform law
of the composite statistic, with sample multiplicity preserved. -/
theorem push_uniformImageMass (o : Ω→A) (f : A→B) :
    pushFiniteLaw f (uniformImageMass o)=uniformImageMass (f∘o) := by
  classical
  funext b
  unfold pushFiniteLaw
  simp_rw [uniformImageMass_sum,div_eq_mul_inv]
  rw [← Finset.sum_mul,Finset.sum_comm]
  congr 1
  apply Finset.sum_congr rfl
  intro w _
  rw [← Finset.sum_filter]
  have he : (Finset.univ.filter fun a => f a=b).filter (fun a => o w=a) =
      if f (o w)=b then {o w} else ∅ := by
    ext a
    by_cases h : f (o w)=b
    · rw [ite_eq_left h]
      simp only [Finset.mem_filter,Finset.mem_univ,true_and,Finset.mem_singleton]
      grind
    · rw [ite_eq_right h]
      simp only [Finset.mem_filter,Finset.mem_univ,true_and,Finset.notMem_empty]
      grind
  rw [he]
  by_cases h : f (o w)=b <;> simp [h,Function.comp_apply]

omit [Fintype A] in
theorem uniformImageMass_reindex {V : Type*} [Fintype V]
    (e : Ω≃V) (o : V→A) :
    uniformImageMass (o∘e)=uniformImageMass o := by
  classical
  funext a
  rw [uniformImageMass_sum,uniformImageMass_sum,Fintype.card_congr e]
  congr 1
  exact Fintype.sum_equiv e _ _ (fun _ => rfl)

end PomeranceSarkozy
