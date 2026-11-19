import Conjectures.MotzkinCyclicCriterion
import Conjectures.MotzkinAveraging
import Mathlib.Algebra.Ring.Parity

/-! Closed walks give the finite odd-cycle bound. Combining it with the exact
cyclic character theorem proves the stated congruence criterion for sharpness. -/
namespace Motzkin

open MeasureTheory MeasureTheory.Measure
open scoped ENNReal

theorem finite_closed_walk_card_bound {G : Type*} [AddCommGroup G] [Fintype G]
    (a b : G) (A : Finset G) (hA : ∀ x ∈ A, x+a ∉ A ∧ x+b ∉ A)
    {n : ℕ} (hn : 0 < n) (p : Fin n → G)
    (hstep : ∀ i, ForbiddenStep a b (p i) (p (finRotate n i))) :
    A.card ≤ (Fintype.card G*(n/2))/n := by
  classical
  let : MeasurableSpace G := ⊤
  let : MeasurableSingletonClass G := ⟨fun _ => trivial⟩
  let : MeasurableAdd G := ⟨fun _ => measurable_from_top,fun _ => measurable_from_top⟩
  let μ : Measure G := ((count : Measure G) Set.univ)⁻¹ • count
  let : IsProbabilityMeasure μ := inferInstance
  let : IsAddLeftInvariant μ := inferInstance
  have huniv : (count : Measure G) Set.univ=(Fintype.card G:ℝ≥0∞) := by
    simpa only [Finset.coe_univ,Finset.card_univ] using
      (count_apply_finset (Finset.univ : Finset G))
  have hratio : μ.real (A : Set G)=(A.card:ℝ)/(Fintype.card G:ℝ) := by
    change ((((count : Measure G) Set.univ)⁻¹ • (count : Measure G)) (A : Set G)).toReal=_
    rw [Measure.smul_apply,smul_eq_mul,huniv,count_apply_finset A]
    simp only [ENNReal.toReal_mul,ENNReal.toReal_inv,ENNReal.toReal_natCast]
    rw [div_eq_mul_inv,mul_comm]
  have havoid : Avoids (A : Set G) a b := hA
  have hbound := closed_walk_measure_bound μ (show MeasurableSet (A : Set G) from trivial)
    havoid hn p hstep
  rw [hratio] at hbound
  have hN : (0:ℝ) < Fintype.card G := by exact_mod_cast Fintype.card_pos
  have hnr : (0:ℝ) < n := by exact_mod_cast hn
  have hr := (div_le_div_iff₀ hN hnr).mp hbound
  have hi : A.card*n ≤ (n/2)*Fintype.card G := by exact_mod_cast hr
  apply (Nat.le_div_iff_mul_le hn).mpr
  simpa only [mul_comm] using hi

namespace Cyclic

theorem odd_closed_walk_sharpness_criterion {N n : ℕ} [NeZero N]
    (a b : ZMod N) (hgen : AddSubgroup.closure ({a,b} : Set (ZMod N))=⊤)
    (hodd : Odd n) (p : Fin n → ZMod N)
    (hstep : ∀ i, ForbiddenStep a b (p i) (p (finRotate n i))) :
    let U := (N*(n-1))/(2*n)
    (∃ A : Finset (ZMod N), (∀ x ∈ A, x+a ∉ A ∧ x+b ∉ A) ∧ A.card=U) ↔
      ∃ r s : ℕ, U ≤ r ∧ r ≤ N-U ∧ U ≤ s ∧ s ≤ N-U ∧
        b*(r:ZMod N)=a*(s:ZMod N) := by
  dsimp only
  apply attains_upper_bound_iff a b hgen ((N*(n-1))/(2*n))
  intro A hA
  have hn : 0 < n := by have := Nat.odd_iff.mp hodd; omega
  have hb := finite_closed_walk_card_bound a b A hA hn p hstep
  rw [ZMod.card] at hb
  have hn' : n-1=2*(n/2) := by
    have := Nat.two_mul_div_two_add_one_of_odd hodd
    omega
  have he : (N*(n/2))/n=(N*(n-1))/(2*n) := by
    rw [hn']
    have hp : N*(2*(n/2))=2*(N*(n/2)) := by ring
    rw [hp,Nat.mul_div_mul_left _ _ (by decide : 0 < 2)]
  rwa [← he]

end Cyclic
end Motzkin
