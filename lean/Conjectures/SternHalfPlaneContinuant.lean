import Conjectures.SternHalfPlaneShift
import Conjectures.SternHalfPlaneParabola
import Mathlib.Algebra.Ring.GeomSum

/-!
# Dilcher–Kidwai–Tomkins Stern-polynomial half-plane conjecture

The full all-index reduction to the source's uniform local parabola.
The remaining regional estimates must supply the local hypothesis before
this reduction proves the original conjecture.
-/

namespace Conjectures.SternHalfPlane

theorem norm_gt_one_of_re_ge_one {z : ℂ} (hz : 1 ≤ z.re) (hz1 : z ≠ 1) :
    1 < ‖z‖ := by
  have hre : z.re ≤ ‖z‖ := Complex.re_le_norm z
  by_contra hn
  have heq : ‖z‖ = 1 := by linarith
  have hr : z.re = 1 := by linarith
  have hs := Complex.sq_norm z
  rw [Complex.normSq_apply, heq, hr] at hs
  have hi : z.im = 0 := by nlinarith [sq_nonneg z.im]
  apply hz1
  apply Complex.ext
  · simpa using hr
  · simpa using hi

theorem geom_ne_zero {a : ℕ} (ha : 0 < a) {z : ℂ} (hz : 1 ≤ z.re) :
    geom a z ≠ 0 := by
  by_cases hz1 : z = 1
  · subst z
    simpa [geom] using (Nat.cast_ne_zero.mpr (Nat.ne_of_gt ha) : (a : ℂ) ≠ 0)
  · intro h
    have hg := geom_sum_mul z a
    change geom a z * (z - 1) = z ^ a - 1 at hg
    rw [h, zero_mul] at hg
    have hp : z ^ a = 1 := by linear_combination -hg
    have hn := congrArg norm hp
    rw [norm_pow, norm_one] at hn
    have hgt : 1 < ‖z‖ ^ a := one_lt_pow₀ (norm_gt_one_of_re_ge_one hz hz1) (by omega)
    linarith

noncomputable def runRho (z : ℂ) (a b : ℕ) : ℂ := z ^ a / (geom a z * geom b z)

noncomputable def runLinks (z : ℂ) : List ℕ → List ℂ
  | [] => []
  | [_] => []
  | a :: b :: l => runRho z a b :: runLinks z (b :: l)

theorem runLinks_parabolic {z : ℂ} {t : ℝ} {l : List ℕ}
    (hl : ∀ a ∈ l, 0 < a)
    (hp : ∀ a b : ℕ, 0 < a → 0 < b → Parabolic t (runRho z a b)) :
    ∀ v ∈ runLinks z l, Parabolic t v := by
  induction l using List.twoStepInduction with
  | nil => simp [runLinks]
  | singleton a => simp [runLinks]
  | cons_cons a b l _ ih =>
    intro v hv
    change v ∈ runRho z a b :: runLinks z (b :: l) at hv
    rw [List.mem_cons] at hv
    rcases hv with rfl | hv
    · exact hp a b (hl a (by simp)) (hl b (by simp))
    · exact ih b (fun c hc => hl c (by simp [hc])) v hv

theorem runContinuant_ratio {z : ℂ} {t : ℝ} (hz : 1 ≤ z.re)
    (hp : ∀ a b : ℕ, 0 < a → 0 < b → Parabolic t (runRho z a b))
    {l : List ℕ} (hl : ∀ a ∈ l, 0 < a) :
    runContinuant z l ≠ 0 ∧
      ∀ a : ℕ, 0 < a →
        runContinuant z (a :: l) =
          geom a z * runContinuant z l * (1 + continuedValue (runLinks z (a :: l))) := by
  induction l with
  | nil =>
    refine ⟨by simp [runContinuant], ?_⟩
    intro a _
    simp [runContinuant, runLinks, continuedValue]
  | cons b l ih =>
    have hb : 0 < b := hl b (by simp)
    have ht : ∀ c ∈ l, 0 < c := fun c hc => hl c (by simp [hc])
    obtain ⟨hn, hi⟩ := ih ht
    have hg : geom b z ≠ 0 := geom_ne_zero hb hz
    have hd : 1 + continuedValue (runLinks z (b :: l)) ≠ 0 :=
      continuedValue_denominator_ne_zero (runLinks_parabolic hl hp)
    have hid := hi b hb
    have hbn : runContinuant z (b :: l) ≠ 0 := by
      rw [hid]
      exact mul_ne_zero (mul_ne_zero hg hn) hd
    refine ⟨hbn, ?_⟩
    intro a ha
    have hga : geom a z ≠ 0 := geom_ne_zero ha hz
    change geom a z * runContinuant z (b :: l) + z ^ a * runContinuant z l =
      geom a z * runContinuant z (b :: l) *
        (1 + runRho z a b / (1 + continuedValue (runLinks z (b :: l))))
    rw [hid]
    dsimp only [runRho]
    field_simp [hga, hg, hd]

theorem runContinuant_ne_zero {z : ℂ} {t : ℝ} (hz : 1 ≤ z.re)
    (hp : ∀ a b : ℕ, 0 < a → 0 < b → Parabolic t (runRho z a b))
    {l : List ℕ} (hl : ∀ a ∈ l, 0 < a) : runContinuant z l ≠ 0 :=
  (runContinuant_ratio hz hp hl).1

theorem stern_odd_ne_zero_of_parabolic {z : ℂ} {t : ℝ} (hz : 1 ≤ z.re)
    (hp : ∀ a b : ℕ, 0 < a → 0 < b → Parabolic t (runRho z a b))
    {n : ℕ} (hn : Odd n) : stern n z ≠ 0 := by
  obtain ⟨l, hl, hidx, _⟩ := exists_runIndex hn
  rw [← hidx, stern_runIndex hl]
  exact runContinuant_ne_zero hz hp hl

/-- The source's local criterion, with every positive Stern index included. -/
theorem stern_ne_zero_of_parabolic {z : ℂ} {t : ℝ} (hz : 1 ≤ z.re)
    (hp : ∀ a b : ℕ, 0 < a → 0 < b → Parabolic t (runRho z a b))
    {n : ℕ} (hn : 0 < n) : stern n z ≠ 0 := by
  have hz0 : z ≠ 0 := by intro h; norm_num [h] at hz
  induction n using Nat.strong_induction_on with
  | h n ih =>
    obtain ⟨m, hm | hm⟩ := n.even_or_odd'
    · subst n
      rw [stern_even]
      exact mul_ne_zero hz0 (ih m (by omega) (by omega))
    · apply stern_odd_ne_zero_of_parabolic hz hp
      exact ⟨m, by omega⟩

end Conjectures.SternHalfPlane
