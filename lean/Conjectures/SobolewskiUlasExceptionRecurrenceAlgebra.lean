module

public import Conjectures.SobolewskiUlasExceptionLinearRepresentation
public import Mathlib.Algebra.Polynomial.Monic
public import Mathlib.Algebra.Polynomial.Degree.SmallDegree

@[expose] public section
namespace SobolewskiUlasException

open Polynomial

def recurrenceShift : Module.End ℤ (ℕ→ℤ) where
  toFun f n := f (n+1)
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

theorem recurrenceShift_pow (f : ℕ→ℤ) (i n : ℕ) :
    (recurrenceShift^i) f n=f (n+i) := by
  induction i generalizing f n with
  | zero => simp
  | succ i ih =>
    rw [pow_succ,Module.End.mul_apply,ih]
    change f (n+i+1)=f (n+(i+1))
    rw [Nat.add_assoc]

theorem aeval_recurrenceShift_apply (p : ℤ[X]) (f : ℕ→ℤ) (k : ℕ) :
    aeval recurrenceShift p f k =
      ∑ i ∈ Finset.range (p.natDegree+1),p.coeff i * f (k+i) := by
  rw [aeval_eq_sum_range]
  simp only [LinearMap.sum_apply,LinearMap.smul_apply,Finset.sum_apply,Pi.smul_apply,
    smul_eq_mul,recurrenceShift_pow]

theorem monicRecurrence_iff_annihilation (f : ℕ→ℤ) :
    HasMonicRecurrence f ↔ ∃ p : ℤ[X],p.Monic ∧ aeval recurrenceShift p f=0 := by
  constructor
  · rintro ⟨p,hp,h⟩
    refine ⟨p,hp,?_⟩
    funext k
    rw [aeval_recurrenceShift_apply]
    exact h k
  · rintro ⟨p,hp,h⟩
    refine ⟨p,hp,fun k => ?_⟩
    rw [← aeval_recurrenceShift_apply,h]
    rfl

theorem monicRecurrence_add {f g : ℕ→ℤ}
    (hf : HasMonicRecurrence f) (hg : HasMonicRecurrence g) : HasMonicRecurrence (f+g) := by
  obtain ⟨p,hp,hpf⟩ := (monicRecurrence_iff_annihilation f).mp hf
  obtain ⟨q,hq,hqg⟩ := (monicRecurrence_iff_annihilation g).mp hg
  apply (monicRecurrence_iff_annihilation (f+g)).mpr
  refine ⟨p*q,hp.mul hq,?_⟩
  have h₁ : aeval recurrenceShift (p*q) f=0 := by
    rw [mul_comm p q,map_mul,Module.End.mul_apply,hpf,map_zero]
  have h₂ : aeval recurrenceShift (p*q) g=0 := by
    rw [map_mul,Module.End.mul_apply,hqg,map_zero]
  rw [map_add,h₁,h₂,add_zero]

theorem monicRecurrence_neg {f : ℕ→ℤ} (hf : HasMonicRecurrence f) :
    HasMonicRecurrence (-f) := by
  obtain ⟨p,hp,hpf⟩ := (monicRecurrence_iff_annihilation f).mp hf
  apply (monicRecurrence_iff_annihilation (-f)).mpr
  exact ⟨p,hp,by rw [map_neg,hpf,neg_zero]⟩

theorem monicRecurrence_sub {f g : ℕ→ℤ}
    (hf : HasMonicRecurrence f) (hg : HasMonicRecurrence g) : HasMonicRecurrence (f-g) := by
  rw [sub_eq_add_neg]
  exact monicRecurrence_add hf (monicRecurrence_neg hg)

theorem monicRecurrence_of_order_two {f : ℕ→ℤ} (a b : ℤ)
    (h : ∀ k,f (k+2)+a*f (k+1)+b*f k=0) :
    HasMonicRecurrence f := by
  let q : ℤ[X] := C a*X+C b
  let p : ℤ[X] := X^2+q
  have hq : q.degree<2 := degree_linear_lt
  have hX : (X^2 : ℤ[X]).degree=2 := degree_X_pow 2
  have hlt : q.degree < (X^2 : ℤ[X]).degree := by rwa [hX]
  have hp : p.Monic := (monic_X_pow 2).add_of_left hlt
  have hD : p.natDegree=2 := by
    have hd := degree_add_eq_left_of_degree_lt hlt
    exact natDegree_eq_of_degree_eq_some (hd.trans hX)
  refine ⟨p,hp,fun k => ?_⟩
  rw [hD]
  simp only [p,q,Finset.sum_range_succ,Finset.sum_range_zero,coeff_add,coeff_C_mul,coeff_X_pow,
    coeff_X,coeff_C]
  norm_num
  linarith [h k]

theorem repeatedNine_shifted_recurrence :
    HasMonicRecurrence (fun k => (repeatedNine (k+2) : ℤ)) := by
  apply monicRecurrence_of_order_two (-17) 16
  intro k
  change (repeatedNine (k+2+2) : ℤ) + (-17)*(repeatedNine (k+2+1) : ℤ)+
    16*(repeatedNine (k+2) : ℤ)=0
  rw [show k+2+2 = (k+2+1)+1 by omega,repeatedNine,repeatedNine]
  push_cast
  ring

theorem linear_shifted_recurrence :
    HasMonicRecurrence (fun k => 6*((k+2 : ℕ) : ℤ)) := by
  apply monicRecurrence_of_order_two (-2) 1
  intro k
  push_cast
  ring

/-- The written repeated-input remainder is C-finite if the actual
increasing enumeration is 16-regular. -/
theorem actual_regular16_implies_remainder_recurrent
    (h : IsRegular 16 (fun k => (nthException k : ℤ))) :
    HasMonicRecurrence (fun k => remainder (k+2)) := by
  obtain ⟨d,⟨R⟩⟩ := regular16_has_digitRepresentation h
  have hh := digitRepresentation_repeated_recurrent R
  exact monicRecurrence_add (monicRecurrence_sub hh repeatedNine_shifted_recurrence)
    linear_shifted_recurrence

end SobolewskiUlasException
