import Conjectures.ShiftedLonelyRunnerWeightedData
import Conjectures.ShiftedLonelyRunnerWeightedSweep

/-!
# Integer event data for the weighted window bounds

After removing whole periods, an endpoint contributes three affine ramps
as a function of the real window start. The exact sweep checks their sum.
-/

namespace ShiftedLonelyRunner.WeightedResidual

def width : ℕ := 2 * halfWidth

noncomputable def primitive (p u x : ℝ) : ℝ :=
  u * (⌊x / p⌋ : ℤ) + min u (x - (⌊x / p⌋ : ℤ) * p)

theorem primitive_translate {p u x : ℝ} (hp : 0 < p) (k : ℤ) :
    primitive p u (x + (k : ℝ) * p) = primitive p u x + (k : ℝ) * u := by
  have hdiv : (x + (k : ℝ) * p) / p = x / p + k := by
    field_simp
  simp only [primitive, hdiv, Int.floor_add_intCast, Int.cast_add]
  have harg : x + (k : ℝ) * p - ((⌊x / p⌋ : ℝ) + (k : ℝ)) * p =
      x - (⌊x / p⌋ : ℤ) * p := by ring
  rw [harg]
  ring

theorem primitive_ramps {p u y c : ℝ} (hp : 0 < p) (hu : 0 ≤ u) (hup : u ≤ p)
    (hy₁ : 0 ≤ y) (hy₂ : y < p) (hc₁ : 0 ≤ c) (hc₂ : c ≤ p) :
    primitive p u (y - c) =
      u - max 0 (c - (y - u)) + max 0 (c - y) - max 0 (c - (y + p - u)) := by
  by_cases h : 0 ≤ y - c
  · have hq : ⌊(y - c) / p⌋ = 0 := Int.floor_eq_zero_iff.mpr
      ⟨div_nonneg h hp.le, (div_lt_one hp).mpr (by linarith)⟩
    simp only [primitive, hq, Int.cast_zero, mul_zero, zero_mul, sub_zero, zero_add]
    have h₁ : c - y ≤ 0 := by linarith
    have h₂ : c - (y + p - u) ≤ 0 := by linarith
    rw [max_eq_left h₁, max_eq_left h₂]
    by_cases h₃ : y - c ≤ u
    · rw [min_eq_right h₃, max_eq_right (show 0 ≤ c - (y - u) by linarith)]
      linarith
    · rw [min_eq_left (le_of_not_ge h₃), max_eq_left (show c - (y - u) ≤ 0 by linarith)]
      linarith
  · have hq : ⌊(y - c) / p⌋ = -1 := Int.floor_eq_iff.mpr ⟨by
        push_cast
        exact (le_div_iff₀ hp).mpr (by linarith), by
        push_cast
        linarith [div_neg_of_neg_of_pos (lt_of_not_ge h) hp]⟩
    simp only [primitive, hq, Int.cast_neg, Int.cast_one, neg_one_mul, mul_neg_one, sub_neg_eq_add]
    rw [max_eq_right (show 0 ≤ c - (y - u) by linarith),
      max_eq_right (show 0 ≤ c - y by linarith)]
    by_cases h₃ : y - c + p ≤ u
    · rw [min_eq_right h₃, max_eq_right (show 0 ≤ c - (y + p - u) by linarith)]
      linarith
    · rw [min_eq_left (le_of_not_ge h₃), max_eq_left (show c - (y + p - u) ≤ 0 by linarith)]
      linarith

noncomputable def bandLengthUnits (p u : ℝ) (speed : ℕ) (c : ℝ) (cell : Cell) : ℝ :=
  primitive p u (speed * (cell.right : ℝ) - c) -
    primitive p u (speed * (cell.left : ℝ) - c)

noncomputable def rawLoad (cells : List Cell) (p u : ℝ) (speed : ℕ) (c : ℝ) : ℝ :=
  (cells.map (fun cell => (cell.weight : ℝ) * bandLengthUnits p u speed c cell)).sum

private def endpointEvents (p u n weight : ℤ) : List Event :=
  let y := n % p
  [(y - u, -weight), (y, weight), (y + p - u, -weight)]

private def cellEvents (p u : ℤ) (speed : ℕ) (cell : Cell) : List Event :=
  endpointEvents p u (speed * cell.right : ℕ) cell.weight ++
    endpointEvents p u (speed * cell.left : ℕ) (-(cell.weight : ℤ))

private def cellBase (p u : ℤ) (speed : ℕ) (cell : Cell) : ℤ :=
  (((speed : ℤ) * cell.right) / p - ((speed : ℤ) * cell.left) / p) * u * cell.weight

private theorem primitive_endpoint {p u n weight : ℤ} (hp : 0 < p) (hu : 0 ≤ u)
    (hup : u ≤ p) {c : ℝ} (hc₁ : 0 ≤ c) (hc₂ : c ≤ (p : ℝ)) :
    (weight : ℝ) * primitive (p : ℝ) (u : ℝ) ((n : ℝ) - c) =
      (weight : ℝ) * (u + (n / p : ℤ) * (u : ℝ)) +
        evaluate c (endpointEvents p u n weight) := by
  let y := n % p
  let k := n / p
  have hpR : (0 : ℝ) < p := by exact_mod_cast hp
  have hy₁ : (0 : ℝ) ≤ y := by exact_mod_cast Int.emod_nonneg n hp.ne'
  have hy₂ : (y : ℝ) < p := by exact_mod_cast Int.emod_lt_of_pos n hp
  have hdecomp : (n : ℝ) - c = (y : ℝ) - c + (k : ℝ) * p := by
    have h : ((y : ℝ) + (k : ℝ) * p) = n := by exact_mod_cast Int.emod_add_ediv_mul n p
    linarith only [h]
  rw [hdecomp, primitive_translate hpR, primitive_ramps hpR (by exact_mod_cast hu)
    (by exact_mod_cast hup) hy₁ hy₂ hc₁ hc₂]
  simp [endpointEvents, evaluate, ramp, y, Int.cast_sub, Int.cast_add, Int.cast_neg]
  ring

private theorem cell_formula {p u : ℤ} (hp : 0 < p) (hu : 0 ≤ u) (hup : u ≤ p)
    (speed : ℕ) (cell : Cell) {c : ℝ} (hc₁ : 0 ≤ c) (hc₂ : c ≤ (p : ℝ)) :
    (cell.weight : ℝ) * bandLengthUnits (p : ℝ) (u : ℝ) speed c cell =
      (cellBase p u speed cell : ℝ) + evaluate c (cellEvents p u speed cell) := by
  have hb := primitive_endpoint (u := u) (n := (speed * cell.right : ℕ))
    (weight := cell.weight) hp hu hup hc₁ hc₂
  have ha := primitive_endpoint (u := u) (n := (speed * cell.left : ℕ))
    (weight := -(cell.weight : ℤ)) hp hu hup hc₁ hc₂
  simp only [bandLengthUnits, cellBase, cellEvents, evaluate, List.map_append,
    List.sum_append, Int.cast_mul, Int.cast_sub, Int.cast_natCast, Nat.cast_mul, Int.cast_neg] at *
  nlinarith only [hb, ha]

/-- Check the integer expression that bounds each real window start in one period. -/
def checkWindow (cells : List Cell) (p u limit : ℤ) (speed : ℕ) : Bool :=
  checkEvents p ((cells.map (cellBase p u speed)).sum) limit
    (cells.flatMap (cellEvents p u speed))

theorem checkWindow_sound {cells : List Cell} {p u limit : ℤ} {speed : ℕ}
    (hp : 0 < p) (hu : 0 ≤ u) (hup : u ≤ p)
    (verified : checkWindow cells p u limit speed = true)
    {c : ℝ} (hc₁ : 0 ≤ c) (hc₂ : c ≤ (p : ℝ)) :
    rawLoad cells (p : ℝ) (u : ℝ) speed c ≤ (limit : ℝ) := by
  have hf :
      rawLoad cells (p : ℝ) (u : ℝ) speed c =
        ((cells.map (cellBase p u speed)).sum : ℤ) +
          evaluate c (cells.flatMap (cellEvents p u speed)) := by
    clear verified
    induction cells with
    | nil => simp [rawLoad, evaluate]
    | cons cell rest ih =>
      simp only [rawLoad, List.map_cons, List.sum_cons] at ih ⊢
      simp only [List.flatMap_cons, evaluate, List.map_append, List.sum_append, Int.cast_add]
      rw [cell_formula hp hu hup speed cell hc₁ hc₂, ih]
      simp only [evaluate]
      ring
  rw [hf]
  exact checkEvents_sound verified hc₁ hc₂

def checkFiniteSpeed (speed : ℕ) : Bool :=
  checkWindow support period width (speed * 20159589 : ℕ) speed

end ShiftedLonelyRunner.WeightedResidual
