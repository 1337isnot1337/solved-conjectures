import Conjectures.HadamardBorderSymmetryArithmetic
import Conjectures.HadamardBorderSymmetryPrime
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma

/-! Actual sign rows, their fiber sums, and the compression identities used
in the fixed-border symmetry obstruction. No normalized baseline pattern is
an input to these statements. -/

namespace HadamardBorderSymmetry

open scoped BigOperators

variable {Q : Type*} [AddCommGroup Q] [Fintype Q] [DecidableEq Q]

abbrev BorderRows (Q : Type*) := Fin 4 → Q → ZMod 149 → ℤ

def fiberSum149 (F : BorderRows Q) (i : Fin 4) (q : Q) : ℤ :=
  ∑ x, F i q x

def combinedCorrelation149 (F : BorderRows Q) (h : Q) (t : ZMod 149) : ℤ :=
  ∑ i, ∑ q, ∑ x, F i (q + h) (x + t) * F i q x

/-- The literal sign and autocorrelation hypotheses of the order-2396 core. -/
structure IsBorderCore149 (F : BorderRows Q) : Prop where
  sign : ∀ i q x, F i q x = 1 ∨ F i q x = -1
  correlation : ∀ h t, (h, t) ≠ (0, 0) →
    combinedCorrelation149 F h t = if h = 0 then -12 else 4

theorem sum_translate_integer {T : Type*} [AddGroup T] [Fintype T]
    (f : T → ℤ) (x : T) : (∑ t, f (x + t)) = ∑ t, f t := by
  exact Fintype.sum_equiv (Equiv.addLeft x) (fun t => f (x + t)) f (by intro t; rfl)

theorem sum_fiber_correlations {T : Type*} [AddGroup T] [Fintype T]
    (f g : T → ℤ) :
    (∑ t, ∑ x, f (x + t) * g x) = (∑ x, f x) * (∑ x, g x) := by
  rw [Finset.sum_comm]
  simp_rw [← Finset.sum_mul, sum_translate_integer]
  rw [← Finset.mul_sum]

omit [DecidableEq Q] in
theorem compressed_correlation149 (F : BorderRows Q) (h : Q) :
    (∑ i, ∑ q, fiberSum149 F i (q + h) * fiberSum149 F i q) =
      ∑ t, combinedCorrelation149 F h t := by
  symm
  simp only [combinedCorrelation149]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro i hi
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro q hq
  exact sum_fiber_correlations (F i (q + h)) (F i q)

theorem core_correlation_zero149 (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F) :
    combinedCorrelation149 F 0 0 = 2384 := by
  have hs (i : Fin 4) (q : Q) (x : ZMod 149) : F i q x * F i q x = 1 := by
    rcases hF.sign i q x with h | h <;> rw [h] <;> norm_num
  norm_num [combinedCorrelation149, hs, hQ]

theorem compressed_correlation_zero149 (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F) :
    (∑ i, ∑ q, fiberSum149 F i q * fiberSum149 F i q) = 608 := by
  classical
  have hc (t : ZMod 149) :
      combinedCorrelation149 F 0 t = -12 + if t = 0 then 2396 else 0 := by
    by_cases ht : t = 0
    · subst t
      rw [core_correlation_zero149 F hQ hF]
      norm_num
    · have hpair : ((0 : Q), t) ≠ (0, 0) := by
        intro h
        exact ht (congrArg Prod.snd h)
      rw [hF.correlation 0 t hpair]
      simp [ht]
  have h := compressed_correlation149 F 0
  simp only [add_zero] at h
  rw [h]
  simp [hc, Finset.sum_add_distrib]

theorem compressed_correlation_nonzero149 (F : BorderRows Q)
    (hF : IsBorderCore149 F) (h : Q) (hh : h ≠ 0) :
    (∑ i, ∑ q, fiberSum149 F i (q + h) * fiberSum149 F i q) = 596 := by
  have hc (t : ZMod 149) : combinedCorrelation149 F h t = 4 := by
    have hpair : (h, t) ≠ (0, 0) := by
      intro he
      exact hh (congrArg Prod.fst he)
    simpa only [ite_eq_right hh] using hF.correlation h t hpair
  rw [compressed_correlation149]
  simp [hc]

theorem compressed_energy149 (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F) :
    (∑ p : Fin 4 × Q, fiberSum149 F p.1 p.2 ^ 2) = 608 := by
  rw [Fintype.sum_prod_type]
  simpa only [pow_two] using compressed_correlation_zero149 F hQ hF

/-- A genuine order-37 symmetry on every fiber is impossible for the given core. -/
theorem order37_fiber_symmetry_impossible (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F)
    (u : (ZMod 149)ˣ) (hu : orderOf u = 37)
    (hinv : ∀ i q x, F i q ((u : ZMod 149) * x) = F i q x) : False := by
  apply energy608_card16_mod37_impossible
    (fun p : Fin 4 × Q => fiberSum149 F p.1 p.2)
    (by simp [hQ]) (compressed_energy149 F hQ hF)
  intro p
  exact order37_fiber_sum_modEq (F p.1 p.2) (hF.sign p.1 p.2) u hu
    (hinv p.1 p.2)

end HadamardBorderSymmetry
