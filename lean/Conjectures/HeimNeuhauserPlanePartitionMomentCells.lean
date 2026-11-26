import Conjectures.HeimNeuhauserPlanePartitionMomentBounds

/-! Homogeneous integer evaluation and the moment inequality on a rational radius interval. -/

namespace PlanePartition

open Finset

def momentNumerator (j a : ℕ) : ℕ → ℕ
  | 0 => 0
  | n + 1 => 1000 * (momentNumerator j a n + momentWeight j n * a^n)

theorem momentNumerator_eq (j a N : ℕ) :
    (momentNumerator j a N : ℝ) = (1000 : ℝ)^N * partialMoment j N ((a : ℝ)/1000) := by
  induction N with
  | zero => simp [momentNumerator, partialMoment]
  | succ n ih =>
    rw [momentNumerator]
    push_cast
    rw [ih]
    simp only [partialMoment, sum_range_succ, shiftedMomentTerm, pow_succ (1000 : ℝ), div_pow]
    field_simp

def MomentCell (a b : ℕ) : Prop :=
  let U := momentNumerator 0 b 250 + 1000^250
  let K := momentNumerator 2 b 250 + 1000^250
  let V := momentNumerator 1 a 250
  9*K^2*U ≤ 251*V^3 ∨ 9*K^2*1000^250*1000 ≤ a*V^3

instance (a b : ℕ) : Decidable (MomentCell a b) := by unfold MomentCell; infer_instance

private theorem cell_real {a b : ℕ} (h : MomentCell a b) :
    let U := partialMoment 0 250 ((b : ℝ)/1000) + 1
    let K := partialMoment 2 250 ((b : ℝ)/1000) + 1
    let V := partialMoment 1 250 ((a : ℝ)/1000)
    9*K^2*U ≤ 251*V^3 ∨ 9*K^2 ≤ ((a : ℝ)/1000)*V^3 := by
  let T := (1000 : ℝ)^250
  have ht : 0 < T := by dsimp [T]; positivity
  unfold MomentCell at h
  rcases h with h|h
  · left
    have hc : 9 * ((momentNumerator 2 b 250 : ℝ) + T)^2 * ((momentNumerator 0 b 250 : ℝ) + T)
        ≤ 251 * (momentNumerator 1 a 250 : ℝ)^3 := by dsimp [T]; exact_mod_cast h
    simp only [momentNumerator_eq] at hc
    change 9 * (T * _ + T)^2 * (T * _ + T) ≤ 251 * (T * _)^3 at hc
    apply (le_of_mul_le_mul_left (a := T^3) (by convert hc using 1 <;> ring) (pow_pos ht _))
  · right
    have hc : 9 * ((momentNumerator 2 b 250 : ℝ) + T)^2 * T * 1000
        ≤ (a : ℝ) * (momentNumerator 1 a 250 : ℝ)^3 := by dsimp [T]; exact_mod_cast h
    simp only [momentNumerator_eq] at hc
    change 9 * (T * _ + T)^2 * T * 1000 ≤ _ * (T * _)^3 at hc
    apply (le_of_mul_le_mul_left (a := 1000*T^3) (by convert hc using 1 <;> ring) (by positivity))

theorem thirdMoment_of_cell {x r : ℝ} {a b : ℕ} (hx : 1 ≤ x)
    (hr : 0 < r) (hr' : r ≤ 9/10) (hn : 251 ≤ x * moment 0 r)
    (ha : (a : ℝ)/1000 ≤ r) (hb : r ≤ (b : ℝ)/1000) (hc : MomentCell a b) :
    9 * (x * moment 2 r)^2 ≤ (x * moment 1 r)^3 := by
  let D (j : ℕ) := ∑' i, shiftedMomentTerm j r i
  let U := partialMoment 0 250 ((b : ℝ)/1000) + 1
  let K := partialMoment 2 250 ((b : ℝ)/1000) + 1
  let V := partialMoment 1 250 ((a : ℝ)/1000)
  let y := x*r
  have hx₀ : 0 < x := by linarith
  have hy : 0 < y := mul_pos hx₀ hr
  have he (j : ℕ) : x * moment j r = y * D j := by
    rw [moment_eq_shifted j hr (by linarith)]
    exact (mul_assoc ..).symm
  have hU : D 0 ≤ U := (shiftedMoment_enclosure (by decide : 0 ≤ 2) hr hr').2.trans
    (add_le_add (partialMoment_mono 0 250 hr.le hb) le_rfl)
  have hK : D 2 ≤ K := (shiftedMoment_enclosure (by decide : 2 ≤ 2) hr hr').2.trans
    (add_le_add (partialMoment_mono 2 250 hr.le hb) le_rfl)
  have hV : V ≤ D 1 := (partialMoment_mono 1 250 (by positivity) ha).trans
    (shiftedMoment_enclosure (by decide : 1 ≤ 2) hr hr').1
  have hV₀ : 0 ≤ V := sum_nonneg fun _ _ => by unfold shiftedMomentTerm; positivity
  have hD₀ (j : ℕ) : 0 ≤ D j := tsum_nonneg fun k => by unfold shiftedMomentTerm; positivity
  have hU₀ : 0 < U := by
    have h : 0 ≤ partialMoment 0 250 ((b : ℝ)/1000) := sum_nonneg fun _ _ => by unfold shiftedMomentTerm; positivity
    dsimp [U]; linarith
  have hbase : 9*K^2 ≤ y*V^3 := by
    rcases cell_real hc with hc|hc
    · have hN : 251 ≤ y*U := (he 0 ▸ hn).trans (mul_le_mul_of_nonneg_left hU hy.le)
      apply le_of_mul_le_mul_right (a := U) _ hU₀
      calc
        _ ≤ 251*V^3 := hc
        _ ≤ (y*U)*V^3 := mul_le_mul_of_nonneg_right hN (pow_nonneg hV₀ _)
        _ = _ := by ring
    · exact hc.trans (mul_le_mul_of_nonneg_right (ha.trans (le_mul_of_one_le_left hr.le hx)) (pow_nonneg hV₀ _))
  rw [he 1, he 2]
  calc
    _ ≤ 9*(y*K)^2 := by gcongr; exact mul_nonneg hy.le (hD₀ 2)
    _ = y^2*(9*K^2) := by ring
    _ ≤ y^2*(y*V^3) := mul_le_mul_of_nonneg_left hbase (sq_nonneg y)
    _ = (y*V)^3 := by ring
    _ ≤ _ := by gcongr

end PlanePartition
