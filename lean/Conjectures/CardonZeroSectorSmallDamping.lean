import Conjectures.CardonZeroSector
import Conjectures.CardonZeroSectorAnalysis

/-! The uniform small-damping strengthening of the explicit Cardon et al. disproof. -/

namespace CardonZeroSector

open Polynomial

private noncomputable def witness : ℝ[X] := (X - 1) ^ 3

private theorem witness_eq : witness = (⟨1, -3, 3, -1⟩ : Cubic ℝ).toPoly := by
  simp only [witness, Cubic.toPoly, map_one, map_neg, map_ofNat]
  ring

private theorem diagonal_witness (α p : ℝ) (hp : 0 < p) :
    diagonal α p witness =
      (⟨ca p α, -3 * Real.exp (-α * (2 : ℝ) ^ p), 3 * Real.exp (-α), -1⟩ : Cubic ℝ).toPoly := by
  ext n
  rw [witness_eq, diagonal_coeff]
  rcases (show n = 0 ∨ n = 1 ∨ n = 2 ∨ n = 3 ∨ 3 < n by omega) with h | h | h | h | h
  · simp [h, Real.zero_rpow hp.ne']
  · simp [h]
  · simp [h]
  · simp [h, ca]
  · simp [Cubic.coeff_eq_zero h]

private theorem eval_cubic (P : Cubic ℝ) (z : ℂ) :
    (P.toPoly.map Complex.ofRealHom).eval z =
      (P.a : ℂ) * z ^ 3 + (P.b : ℂ) * z ^ 2 + (P.c : ℂ) * z + (P.d : ℂ) := by
  simp [Cubic.toPoly, Polynomial.map_add, Polynomial.map_mul, Polynomial.map_pow]

private theorem eval_translated (p α : ℝ) (hp : 0 < p) (z : ℂ) :
    ((⟨ca p α, cb p α, cc p α, cd p α⟩ : Cubic ℝ).toPoly.map Complex.ofRealHom).eval z =
      ((diagonal α p witness).map Complex.ofRealHom).eval (z + 1) := by
  rw [diagonal_witness α p hp, eval_cubic, eval_cubic]
  dsimp [cb, cc, cd]
  push_cast
  ring

private theorem source_witness_rootsIn (θ : ℝ) (hθ : 0 ≤ θ) : rootsIn θ witness := by
  intro z hz
  have h : (z - 1) ^ 3 = 0 := by
    simpa [witness, Polynomial.IsRoot, Polynomial.map_pow, Polynomial.map_sub] using hz
  have heq : z = 1 := sub_eq_zero.mp (eq_zero_of_pow_eq_zero h)
  exact Or.inr (by simpa [heq] using hθ)

/-- The output fails to preserve a strictly positive sector for every fixed
`p > 2` and all sufficiently small positive `α`. -/
theorem fails_to_preserve_sector_for_small (p : ℝ) (hp : 2 < p) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ α : ℝ, 0 < α → α < ε →
      ∃ θ : ℝ, 0 < θ ∧ θ < Real.pi / 2 ∧ rootsIn θ ((X - 1) ^ 3) ∧
        ¬ rootsIn θ (diagonal α p ((X - 1) ^ 3)) := by
  obtain ⟨ε, hε, hdisc⟩ := discriminant_neg_for_small p hp
  refine ⟨ε, hε, fun α hα hαε => ?_⟩
  obtain ⟨u, hu, him⟩ := exists_nonreal_root
    ⟨ca p α, cb p α, cc p α, cd p α⟩ (Real.exp_pos _).ne' (hdisc α hα hαε)
  let z := u + 1
  have hz : IsRoot ((diagonal α p witness).map Complex.ofRealHom) z := by
    change _ = 0
    rw [← eval_translated p α (by linarith)]
    exact hu
  have hzim : z.im ≠ 0 := by simpa [z] using him
  have harg : 0 < |z.arg| := abs_pos.mpr fun h => hzim (Complex.arg_eq_zero_iff.mp h).2
  let θ := min (|z.arg| / 2) (Real.pi / 4)
  have hθ : 0 < θ := lt_min (by linarith) (by linarith [Real.pi_pos])
  have hθpi : θ < Real.pi / 2 := (min_le_right _ _).trans_lt (by linarith [Real.pi_pos])
  refine ⟨θ, hθ, hθpi, source_witness_rootsIn θ hθ.le, fun h => ?_⟩
  rcases h z hz with h0 | hbound
  · exact hzim (by simp [h0])
  · have hle : θ ≤ |z.arg| / 2 := min_le_left _ _
    linarith

/-- The original zero-sector reducing property fails on that parameter range. -/
theorem not_reduces_for_small (p : ℝ) (hp : 2 < p) :
    ∃ ε : ℝ, 0 < ε ∧ ∀ α : ℝ, 0 < α → α < ε → ¬ reduces (diagonal α p) := by
  obtain ⟨ε, hε, h⟩ := fails_to_preserve_sector_for_small p hp
  refine ⟨ε, hε, fun α ha haε hred => ?_⟩
  obtain ⟨θ, hθ, hθpi, hin, hfail⟩ := h α ha haε
  obtain ⟨γ, _, hγ, hout⟩ := hred θ hθ hθpi
  apply hfail
  intro z hz
  exact (hout _ hin z hz).imp_right (fun harg => harg.trans hγ.le)

end CardonZeroSector
