import Conjectures.HeimNeuhauserPlanePartitionTailParameters
import Conjectures.HeimNeuhauserPlanePartitionTailCellArithmetic

/-! Interpret the rational tail certificates at every radius in their closed intervals. -/

namespace PlanePartition

private theorem outerNumerator_mono {a r : ℝ} (ha : 0 ≤ a) (h : a ≤ r) :
    outerNumerator a ≤ outerNumerator r := by unfold outerNumerator; gcongr

theorem tailParameters_of_cell {x r : ℝ} {a b : ℕ} (hx : 1 ≤ x)
    (hr : r ∈ Set.Ioo (0 : ℝ) 1) (hr' : r ≤ 9/10) (hn : 251 ≤ x*moment 0 r)
    (ha : (gridPoint a : ℝ) ≤ r) (hb : r ≤ (gridPoint b : ℝ))
    (hb' : b ≤ 900) (hcell : TailCell a b) : TailParameters x r := by
  let A : ℝ := (gridPoint a : ℝ)
  let B : ℝ := (gridPoint b : ℝ)
  let Y : ℝ := (boxMass a b : ℝ)
  let L : ℝ := (gridMoment 1 a : ℝ)
  let U₀ : ℝ := (gridMoment 0 b : ℝ)+1
  let U₁ : ℝ := (gridMoment 1 b : ℝ)+1
  have hA : 0 ≤ A := by dsimp [A]; rw [gridPoint_cast]; positivity
  have hB : 0 ≤ B := hr.1.le.trans hb
  have hB' : B < 1 := by
    dsimp [B]; rw [gridPoint_cast]
    have hh : (b : ℝ) ≤ 900 := by exact_mod_cast hb'
    linarith
  have hA' : A < 1 := ha.trans_lt hr.2
  have hr₀ := hr.1
  have hd : 0 ≤ 1-r := sub_nonneg.mpr hr.2.le
  have hL : 0 ≤ L := by dsimp [L]; rw [gridMoment_cast]; apply Finset.sum_nonneg; intro k _; unfold shiftedMomentTerm; positivity
  have hU (j : ℕ) (hj : j ≤ 2) : (∑' i, shiftedMomentTerm j r i) ≤ (gridMoment j b : ℝ)+1 := by
    rw [gridMoment_cast]
    exact (shiftedMoment_enclosure hj hr.1 hr').2.trans
      (add_le_add (partialMoment_mono _ _ hr.1.le (gridPoint_cast b ▸ hb)) le_rfl)
  have hU₀ : 0 < U₀ := by
    have h : 0 ≤ partialMoment 0 250 ((b : ℝ)/1000) :=
      Finset.sum_nonneg fun _ _ => by unfold shiftedMomentTerm; positivity
    dsimp [U₀]; rw [gridMoment_cast]; linarith
  have hL' : L ≤ ∑' i, shiftedMomentTerm 1 r i := by
    dsimp [L]; rw [gridMoment_cast]
    exact (partialMoment_mono 1 250 (by positivity) (gridPoint_cast a ▸ ha)).trans
      (shiftedMoment_enclosure (by decide : 1 ≤ 2) hr.1 hr').1
  have hy : 0 ≤ x*r := mul_nonneg (by linarith) hr.1.le
  have hmass : Y ≤ x*r := by
    dsimp [Y,boxMass]
    push_cast
    apply max_le
    · exact ha.trans (le_mul_of_one_le_left hr.1.le hx)
    · apply (div_le_iff₀ hU₀).mpr
      calc
        251 ≤ x*moment 0 r := hn
        _ = (x*r)*(∑' i, shiftedMomentTerm 0 r i) := by rw [moment_eq_shifted 0 hr.1 hr.2, mul_assoc]
        _ ≤ _ := mul_le_mul_of_nonneg_left (hU 0 (by decide)) hy
  have hY : 0 ≤ Y := by dsimp [Y, boxMass]; push_cast; exact hA.trans (le_max_left ..)
  have hvariance : variance x r = (x*r)*(∑' i, shiftedMomentTerm 1 r i) := by
    rw [variance, moment_eq_shifted 1 hr.1 hr.2, mul_assoc]
  have hBval : Y/(1-A)^2 ≤ envelopeB x r := by
    unfold envelopeB
    apply div_le_div₀ hy hmass (sq_pos_of_pos (by linarith [hr.2])) _
    gcongr
  have hC : (boxDamping a b : ℝ) ≤ outerMultiplier r := by
    dsimp [boxDamping]; push_cast
    change outerNumerator A/(1+(11/12)*B)^2 ≤ outerNumerator r/(1+(11/12)*r)^2
    exact div_le_div₀ (by unfold outerNumerator; positivity) (outerNumerator_mono hA ha)
      (by positivity) (by gcongr)
  have hC₀ : 0 ≤ (boxDamping a b : ℝ) := by
    dsimp [boxDamping]; push_cast
    change 0 ≤ outerNumerator A/(1+(11/12)*B)^2
    unfold outerNumerator; positivity
  have hQ := hcell.1
  have houter : (39/2 : ℝ) ≤ (Y/(1-A)^2)*(boxDamping a b : ℝ) := by
    have hc : (((39/2 : ℚ) : ℝ)) ≤ ((boxMass a b/(1-gridPoint a)^2*boxDamping a b : ℚ) : ℝ) :=
      Rat.cast_le.mpr hQ
    push_cast at hc
    exact hc
  refine ⟨houter.trans (mul_le_mul hBval hC hC₀ (by unfold envelopeB; positivity)), ?_⟩
  rcases hcell.2 with hsmall | hpair
  · apply Or.inr
    apply small_radius_middle hx hr hn
    have hbs : (b : ℝ) ≤ 250 := by exact_mod_cast hsmall
    rw [gridPoint_cast] at hb
    linarith
  · left
    have hM : (7/10)*U₁*(1-A)^4 ≤ 1+4*A+A^2 := by
      have hc : (((7/10)*(gridMoment 1 b+1)*(1-gridPoint a)^4 : ℚ) : ℝ) ≤
          ((1+4*gridPoint a+gridPoint a^2 : ℚ) : ℝ) := Rat.cast_le.mpr hpair.1
      push_cast at hc
      exact hc
    have hS : 145*B ≤ Y*(1-B)^2*L := by
      dsimp [B,Y,L]; exact_mod_cast hpair.2
    constructor
    · rw [hvariance, baseVariance, le_div_iff₀ (pow_pos (by linarith [hr.2]) 4)]
      have hv₀ : 0 ≤ ∑' i, shiftedMomentTerm 1 r i := tsum_nonneg fun i => by unfold shiftedMomentTerm; positivity
      have hU₁ : 0 ≤ U₁ := hv₀.trans (hU 1 (by decide))
      have hME : (7/10)*(∑' i, shiftedMomentTerm 1 r i)*(1-r)^4 ≤ 1+4*r+r^2 := by
        calc
          _ ≤ (7/10)*U₁*(1-A)^4 := mul_le_mul
            (mul_le_mul_of_nonneg_left (hU 1 (by decide)) (by norm_num))
            (by gcongr) (pow_nonneg hd _) (by positivity)
          _ ≤ 1+4*A+A^2 := hM
          _ ≤ _ := by gcongr
      nlinarith only [mul_le_mul_of_nonneg_left hME hy]
    · rw [hvariance]
      calc
        _ ≤ 145*B := by gcongr
        _ ≤ Y*(1-B)^2*L := hS
        _ ≤ (x*r)*(1-r)^2*(∑' i, shiftedMomentTerm 1 r i) := by gcongr
        _ = _ := by ring

end PlanePartition
