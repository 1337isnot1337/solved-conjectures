import Conjectures.OrdinaryDarcaisMomentBounds

/-! Homogeneous integer evaluation and the moment inequality on a rational radius interval. -/

namespace OrdinaryDarcais

open Finset

def momentNumerator (j a : ℕ) : ℕ → ℕ
  | 0 => 0
  | n + 1 => 1000 * (momentNumerator j a n + shiftedWeight j n * a^n)

theorem momentNumerator_eq (j a N : ℕ) :
    (momentNumerator j a N : ℝ) = (1000 : ℝ)^N * partialMoment j N ((a : ℝ)/1000) := by
  induction N with
  | zero => simp [momentNumerator, partialMoment]
  | succ n ih =>
    rw [momentNumerator]
    push_cast
    rw [ih]
    simp only [partialMoment, sum_range_succ, shiftedTerm, pow_succ (1000 : ℝ), div_pow]
    field_simp

def MomentCell (a b N : ℕ) : Prop :=
  let U := momentNumerator 0 b N + 1000^N
  let K := momentNumerator 2 b N + 1000^N
  let V := momentNumerator 1 a N
  256*K^2*U ≤ (49*501)*V^3 ∨ 256*K^2*1000^N*1000 ≤ 49*a*V^3

instance (a b N : ℕ) : Decidable (MomentCell a b N) := by unfold MomentCell; infer_instance

private theorem cell_real {a b N : ℕ} (h : MomentCell a b N) :
    let U := partialMoment 0 N ((b : ℝ)/1000) + 1
    let K := partialMoment 2 N ((b : ℝ)/1000) + 1
    let V := partialMoment 1 N ((a : ℝ)/1000)
    256*K^2*U ≤ (49*501)*V^3 ∨ 256*K^2 ≤ 49*((a : ℝ)/1000)*V^3 := by
  let T := (1000 : ℝ)^N
  have ht : 0 < T := by dsimp [T]; positivity
  unfold MomentCell at h
  rcases h with h|h
  · left
    have hc : 256 * ((momentNumerator 2 b N : ℝ) + T)^2 * ((momentNumerator 0 b N : ℝ) + T)
        ≤ (49*501) * (momentNumerator 1 a N : ℝ)^3 := by dsimp [T]; exact_mod_cast h
    simp only [momentNumerator_eq] at hc
    change 256 * (T * _ + T)^2 * (T * _ + T) ≤ (49*501) * (T * _)^3 at hc
    apply (le_of_mul_le_mul_left (a := T^3) (by convert hc using 1 <;> ring) (pow_pos ht _))
  · right
    have hc : 256 * ((momentNumerator 2 b N : ℝ) + T)^2 * T * 1000
        ≤ 49*(a : ℝ) * (momentNumerator 1 a N : ℝ)^3 := by dsimp [T]; exact_mod_cast h
    simp only [momentNumerator_eq] at hc
    change 256 * (T * _ + T)^2 * T * 1000 ≤ 49*_ * (T * _)^3 at hc
    apply (le_of_mul_le_mul_left (a := 1000*T^3) (by convert hc using 1 <;> ring) (by positivity))

theorem thirdMoment_of_cell {x r : ℝ} {a b N : ℕ} (hx : 1 ≤ x)
    (hr : 0 < r) (hr' : r < 1) (hn : 501 ≤ x * moment 0 r)
    (bounds : ∀ j ≤ 2, partialMoment j N r ≤ ∑' i, shiftedTerm j r i ∧
      (∑' i, shiftedTerm j r i) ≤ partialMoment j N r + 1)
    (ha : (a : ℝ)/1000 ≤ r) (hb : r ≤ (b : ℝ)/1000) (hc : MomentCell a b N) :
    256 * (x * moment 2 r)^2 ≤ 49*(x * moment 1 r)^3 := by
  let D (j : ℕ) := ∑' i, shiftedTerm j r i
  let U := partialMoment 0 N ((b : ℝ)/1000) + 1
  let K := partialMoment 2 N ((b : ℝ)/1000) + 1
  let V := partialMoment 1 N ((a : ℝ)/1000)
  let y := x*r
  have hx₀ : 0 < x := by linarith
  have hy : 0 < y := mul_pos hx₀ hr
  have he (j : ℕ) : x * moment j r = y * D j := by
    rw [moment_eq_shifted j hr hr']
    exact (mul_assoc ..).symm
  have hU : D 0 ≤ U := (bounds 0 (by decide)).2.trans
    (add_le_add (partial_mono 0 N hr.le hb) le_rfl)
  have hK : D 2 ≤ K := (bounds 2 (by decide)).2.trans
    (add_le_add (partial_mono 2 N hr.le hb) le_rfl)
  have hV : V ≤ D 1 := (partial_mono 1 N (by positivity) ha).trans
    (bounds 1 (by decide)).1
  have hV₀ : 0 ≤ V := sum_nonneg fun _ _ => by unfold shiftedTerm; positivity
  have hD₀ (j : ℕ) : 0 ≤ D j := tsum_nonneg fun k => by unfold shiftedTerm; positivity
  have hU₀ : 0 < U := by
    have h : 0 ≤ partialMoment 0 N ((b : ℝ)/1000) := sum_nonneg fun _ _ => by unfold shiftedTerm; positivity
    dsimp [U]; linarith
  have hbase : 256*K^2 ≤ 49*y*V^3 := by
    rcases cell_real hc with hc|hc
    · have hN : 501 ≤ y*U := (he 0 ▸ hn).trans (mul_le_mul_of_nonneg_left hU hy.le)
      apply le_of_mul_le_mul_right (a := U) _ hU₀
      calc
        _ ≤ (49*501)*V^3 := hc
        _ ≤ (49*(y*U))*V^3 := by gcongr
        _ = _ := by ring
    · have hyA : (a:ℝ)/1000 ≤ y := ha.trans (le_mul_of_one_le_left hr.le hx)
      exact hc.trans (by gcongr)
  rw [he 1, he 2]
  calc
    _ ≤ 256*(y*K)^2 := by gcongr; exact mul_nonneg hy.le (hD₀ 2)
    _ = y^2*(256*K^2) := by ring
    _ ≤ y^2*(49*y*V^3) := mul_le_mul_of_nonneg_left hbase (sq_nonneg y)
    _ = 49*(y*V)^3 := by ring
    _ ≤ _ := by gcongr

end OrdinaryDarcais
