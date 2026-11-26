module
public import Conjectures.PomeranceSarkozyAtomicPush
public import Conjectures.PomeranceSarkozyProductVariation

@[expose] public section
namespace PomeranceSarkozy

open scoped ENNReal BigOperators

variable {A B : Type*} [Fintype A]

/-- The real atomic distance agrees exactly with the rational finite
distance for finite sample spaces. -/
theorem atomicL1_ratCast_eq (p q : A→ℚ) :
    atomicL1 (fun a => (p a:ℝ)) (fun a => (q a:ℝ))=
      ENNReal.ofReal (finiteLawL1 p q:ℝ) := by
  unfold atomicL1 finiteLawL1
  rw [tsum_fintype,← ENNReal.ofReal_sum_of_nonneg (fun _ _ => abs_nonneg _)]
  congr 1
  push_cast
  apply Finset.sum_congr rfl
  intro a _
  rfl

/-- Rational finite pushforward and real atomic pushforward count the
same fibers; the destination need not have finite support globally. -/
theorem atomicPush_cast_pushFiniteLaw (f : A→B) (p : A→ℚ) :
    atomicPush f (fun a => (p a:ℝ))=fun b => (pushFiniteLaw f p b:ℝ) := by
  classical
  funext b
  let _ : Fintype ↥(f ⁻¹' {b}) := Fintype.ofFinite _
  unfold atomicPush pushFiniteLaw
  rw [tsum_fintype]
  push_cast
  symm
  exact Finset.sum_subtype (p:=fun a => f a=b) (Finset.univ.filter fun a => f a=b)
    (fun a => by simp) (fun a => (p a:ℝ))

end PomeranceSarkozy
