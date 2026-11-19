module

public import Conjectures.FranklLargeCoverage
public import Conjectures.FranklLargeLopsided
public import Conjectures.FranklArithmetic

/-! The exact lopsided probability coefficient for the actual generating
family. Its value is derived from the independent two-generator pairs. -/

@[expose] public section

namespace Frankl.Large

open Finset

variable {α ι : Type*} [DecidableEq α] [Fintype ι] [DecidableEq ι]

theorem nonneighbor_event_bound (G : ι → Finset α) (k : ℕ)
    (hsize : ∀ e, (G e).card = k)
    (hregular : ∀ a, (incident G a).card = 3)
    (hlinear : ∀ e f, e ≠ f → (G e ∩ G f).card ≤ 1)
    (e : ι) (T : Finset ι) (he : e ∉ T) (hT : Disjoint T (neighbors G e)) :
    ((badEvent G e ∩ Lopsided.avoid (badEvent G) T).card : ℝ) ≤
      ((1 / 2 : ℝ) * (3 / 4 : ℝ) ^ k) *
        ((Lopsided.avoid (badEvent G) T).card : ℝ) := by
  have h := nonneighbor_harris_card G e T he hT
  rw [card_neighbors G k hsize hregular hlinear e,
    card_coveringNeighbors G k hsize hregular hlinear e] at h
  have hcast : (2 * 2 ^ (2 * k) : ℝ) *
      ((badEvent G e ∩ Lopsided.avoid (badEvent G) T).card : ℝ) ≤
      (3 : ℝ) ^ k * ((Lopsided.avoid (badEvent G) T).card : ℝ) := by
    exact_mod_cast h
  have hcoefficient : (3 : ℝ) ^ k =
      ((1 / 2 : ℝ) * (3 / 4 : ℝ) ^ k) * (2 * 2 ^ (2 * k)) := by
    rw [pow_mul, show (2 : ℝ) ^ 2 = 4 by norm_num, div_pow]
    have hfour : (4 : ℝ) ^ k ≠ 0 := pow_ne_zero _ (by norm_num)
    field_simp
  apply (mul_le_mul_iff_right₀ (by positivity : (0 : ℝ) < 2 * 2 ^ (2 * k))).mp
  calc
    (2 * 2 ^ (2 * k) : ℝ) *
        ((badEvent G e ∩ Lopsided.avoid (badEvent G) T).card : ℝ)
        ≤ (3 : ℝ) ^ k * ((Lopsided.avoid (badEvent G) T).card : ℝ) := hcast
    _ = (2 * 2 ^ (2 * k) : ℝ) *
        (((1 / 2 : ℝ) * (3 / 4 : ℝ) ^ k) *
          ((Lopsided.avoid (badEvent G) T).card : ℝ)) := by
      rw [hcoefficient]
      ring

end Frankl.Large
