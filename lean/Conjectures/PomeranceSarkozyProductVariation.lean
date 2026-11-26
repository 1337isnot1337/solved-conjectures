module
public import Mathlib

@[expose] public section
namespace PomeranceSarkozy

open Finset
open scoped BigOperators

variable {A B : Type*} [Fintype A] [Fintype B]

def finiteLawL1 (p q : A → ℚ) : ℚ := ∑ a, |p a-q a|

/-- Total mass of a product of finite weights. -/
theorem pairWeight_sum (p : A→ℚ) (q : B→ℚ) :
    (∑ z : A×B,p z.1*q z.2) = (∑ a,p a)*(∑ b,q b) := by
  rw [Fintype.sum_prod_type,Finset.sum_mul]
  simp_rw [Finset.mul_sum]

/-- The two-coordinate product cost is bounded by the sum of the
coordinate costs for nonnegative normalized finite laws. -/
theorem product_finiteLawL1_le (p p' : A→ℚ) (q q' : B→ℚ)
    (hp' : ∀ a,0≤p' a) (hq : ∀ b,0≤q b)
    (hp'₁ : (∑ a,p' a)=1) (hq₁ : (∑ b,q b)=1) :
    finiteLawL1 (fun z : A×B => p z.1*q z.2) (fun z => p' z.1*q' z.2)
      ≤ finiteLawL1 p p'+finiteLawL1 q q' := by
  unfold finiteLawL1
  calc
    _ ≤ ∑ z : A×B,(|p z.1-p' z.1| *q z.2+p' z.1*|q z.2-q' z.2|) := by
      apply Finset.sum_le_sum
      intro z _
      have he : p z.1*q z.2-p' z.1*q' z.2 =
          (p z.1-p' z.1)*q z.2+p' z.1*(q z.2-q' z.2) := by ring
      rw [he]
      exact (abs_add_le _ _).trans_eq (by
        rw [abs_mul,abs_mul,abs_of_nonneg (hq _),abs_of_nonneg (hp' _)])
    _ = _ := by rw [Finset.sum_add_distrib,pairWeight_sum (fun a => |p a-p' a|) q,
      pairWeight_sum p' (fun b => |q b-q' b|),hq₁,hp'₁,mul_one,one_mul]

noncomputable def pushFiniteLaw (f : A→B) (p : A→ℚ) (b : B) : ℚ :=
  open Classical in ∑ a : A with f a=b,p a

/-- Mapping observations to a statistic cannot increase their L1 distance. -/
theorem push_finiteLawL1_le (f : A→B) (p q : A→ℚ) :
    finiteLawL1 (pushFiniteLaw f p) (pushFiniteLaw f q) ≤ finiteLawL1 p q := by
  classical
  unfold finiteLawL1 pushFiniteLaw
  simp_rw [← Finset.sum_sub_distrib]
  calc
    _ ≤ ∑ b : B, ∑ a : A with f a=b, |p a-q a| := by
      exact Finset.sum_le_sum fun b _ => Finset.abs_sum_le_sum_abs _ _
    _ = _ := Finset.sum_fiberwise Finset.univ f _

end PomeranceSarkozy
