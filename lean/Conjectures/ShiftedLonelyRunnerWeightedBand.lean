import Conjectures.ShiftedLonelyRunnerWeightedWindow
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.MeasureTheory.Measure.Real

noncomputable section

open Set MeasureTheory
open scoped BigOperators ENNReal

namespace ShiftedLonelyRunner.WeightedResidual

/-! P is the period in position space. The track is tested in time space. -/

def track (P U v c : ℝ) : Set ℝ :=
  {x | ∃ k : ℤ, (k : ℝ) * P ≤ v*x-c ∧ v*x-c ≤ (k : ℝ)*P + U}


def intervalLoad (P U v c a b : ℝ) : ℝ :=
  (primitive P U (v*b-c) - primitive P U (v*a-c)) / v

private theorem floorBounds {P : ℝ} (hp : 0 < P) (z : ℝ) :
    (⌊z/P⌋ : ℝ)*P ≤ z ∧ z < ((⌊z/P⌋ : ℝ)+1)*P :=
  ⟨(le_div_iff₀ hp).1 (Int.floor_le _),
   (div_lt_iff₀ hp).1 (Int.lt_floor_add_one _)⟩

/-- The cell formula works on the *closed* cell, including the period seam. -/
theorem primitive_cell {P U : ℝ} (hp : 0 < P) (hu : 0 ≤ U) (hup : U ≤ P)
    (k : ℤ) {z : ℝ} (hl : (k : ℝ)*P ≤ z) (hr : z ≤ ((k : ℝ)+1)*P) :
    primitive P U z = U*(k : ℝ) + min U (z-(k : ℝ)*P) := by
  rcases lt_or_eq_of_le hr with h | h
  · have e : ⌊z/P⌋ = k := by
      apply Int.floor_eq_iff.mpr
      exact ⟨(le_div_iff₀ hp).2 hl, (div_lt_iff₀ hp).2 h⟩
    rw [primitive, e]
  · have e : ⌊z/P⌋ = k+1 := by
      apply Int.floor_eq_iff.mpr
      push_cast
      exact ⟨(le_div_iff₀ hp).2 h.ge, (div_lt_iff₀ hp).2 (by linarith)⟩
    rw [primitive, e, h]
    simp only [Int.cast_add, Int.cast_one, sub_self, min_eq_right hu,
      show ((k : ℝ)+1)*P - (k : ℝ)*P = P by ring, min_eq_left hup, add_zero]
    ring

theorem primitive_mono {P U : ℝ} (hp : 0 < P) (hu : 0 ≤ U) : Monotone (primitive P U) := by
  intro x y hxy
  have hi : ⌊x/P⌋ ≤ ⌊y/P⌋ :=
    Int.floor_mono (div_le_div_of_nonneg_right hxy hp.le)
  rcases lt_or_eq_of_le hi with h | e
  · have hz : ⌊x/P⌋ + 1 ≤ ⌊y/P⌋ := by omega
    have hr : (⌊x/P⌋ : ℝ) + 1 ≤ (⌊y/P⌋ : ℝ) := by exact_mod_cast hz
    have hm := mul_le_mul_of_nonneg_left hr hu
    have hl : 0 ≤ min U (y - (⌊y/P⌋ : ℝ)*P) :=
      le_min hu (sub_nonneg.mpr (floorBounds hp y).1)
    unfold primitive
    linarith only [hm, hl, min_le_left U (x - (⌊x/P⌋ : ℝ)*P)]
  · simp only [primitive, e]
    gcongr

theorem intervalLoad_nonneg {P U v c a b : ℝ} (hp : 0 < P) (hu : 0 ≤ U)
    (hv : 0 < v) (hab : a ≤ b) : 0 ≤ intervalLoad P U v c a b :=
  div_nonneg (sub_nonneg.mpr (primitive_mono hp hu
    (sub_le_sub_right (mul_le_mul_of_nonneg_left hab hv.le) c))) hv.le

/-! Single-track volume. No change-of-variables theorem is needed. -/

private theorem cellVol {P U v c a b : ℝ}
    (hp : 0 < P) (hu : 0 ≤ U) (hup : U < P) (hv : 0 < v)
    (k : ℤ) (hab : a ≤ b) (lo : (k : ℝ)*P ≤ v*a-c)
    (hi : v*b-c ≤ ((k : ℝ)+1)*P) :
    volume (Ico a b ∩ track P U v c) ≤ ENNReal.ofReal (intervalLoad P U v c a b) := by
  have hy : v*a-c ≤ v*b-c :=
    sub_le_sub_right (mul_le_mul_of_nonneg_left hab hv.le) _
  have hs : Ico a b ∩ track P U v c ⊆ Icc a (a + intervalLoad P U v c a b) := by
    rintro x ⟨⟨hax, hxb⟩, j, hjl, hjr⟩
    have hL : v*a-c ≤ v*x-c :=
      sub_le_sub_right (mul_le_mul_of_nonneg_left hax hv.le) _
    have hR : v*x-c < v*b-c :=
      sub_lt_sub_right (mul_lt_mul_of_pos_left hxb hv) _
    have ej : j = k := by
      rcases lt_trichotomy j k with h | e | h
      · exfalso
        have hz : j+1 ≤ k := by omega
        have hr : (j : ℝ)+1 ≤ (k : ℝ) := by exact_mod_cast hz
        have hm := mul_le_mul_of_nonneg_right hr hp.le
        linarith only [hm, hjr, hL, lo, hup]
      · exact e
      · exfalso
        have hz : k+1 ≤ j := by omega
        have hr : (k : ℝ)+1 ≤ (j : ℝ) := by exact_mod_cast hz
        have hm := mul_le_mul_of_nonneg_right hr hp.le
        linarith only [hm, hjl, hR, hi]
    subst j
    have ea : min U (v*a-c-(k : ℝ)*P) = v*a-c-(k : ℝ)*P :=
      min_eq_right (by linarith only [hL, hjr])
    have ex : v*x-c-(k : ℝ)*P ≤ min U (v*b-c-(k : ℝ)*P) :=
      le_min (by linarith only [hjr]) (by linarith only [hR])
    have hnum : (x-a)*v ≤ primitive P U (v*b-c) - primitive P U (v*a-c) := by
      rw [primitive_cell hp hu hup.le k (lo.trans hy) hi,
          primitive_cell hp hu hup.le k lo (hy.trans hi), ea]
      linarith only [ex]
    have hdx : x-a ≤ intervalLoad P U v c a b := (le_div_iff₀ hv).2 hnum
    exact ⟨hax, by linarith only [hdx]⟩
  calc
    volume (Ico a b ∩ track P U v c) ≤ volume (Icc a (a + intervalLoad P U v c a b)) :=
      measure_mono hs
    _ = _ := by
      rw [Real.volume_Icc]
      congr 1
      ring

/-- At most `n` further seams after the initial period are needed. -/
private theorem spanVol {P U v c : ℝ}
    (hp : 0 < P) (hu : 0 ≤ U) (hup : U < P) (hv : 0 < v) (n : ℕ) :
    ∀ (k : ℤ) (a b : ℝ), a ≤ b →
      (k : ℝ)*P ≤ v*a-c → v*a-c ≤ ((k : ℝ)+1)*P →
      v*b-c ≤ ((k : ℝ)+(n : ℝ)+1)*P →
      volume (Ico a b ∩ track P U v c) ≤ ENNReal.ofReal (intervalLoad P U v c a b) := by
  induction n with
  | zero =>
    intro k a b hab lo _ hi
    exact cellVol hp hu hup hv k hab lo (by simpa using hi)
  | succ n ih =>
    intro k a b hab lo ha hb
    by_cases h : v*b-c ≤ ((k : ℝ)+1)*P
    · exact cellVol hp hu hup hv k hab lo h
    · let m := (((k : ℝ)+1)*P+c)/v
      have hm : v*m-c = ((k : ℝ)+1)*P := by
        dsimp only [m]
        rw [mul_comm v, div_mul_cancel₀ _ hv.ne', add_sub_cancel_right]
      have ham : a ≤ m := (le_div_iff₀ hv).2 (by linarith only [ha])
      have hmb : m ≤ b := (div_le_iff₀ hv).2 (by linarith only [lt_of_not_ge h])
      have hleft := cellVol hp hu hup hv k ham lo hm.le
      have hright := ih (k+1) m b hmb
        (by simp only [Int.cast_add, Int.cast_one]; linarith only [hm])
        (by simp only [Int.cast_add, Int.cast_one]; linarith only [hm, hp])
        (by
          simp only [Nat.cast_succ] at hb
          simp only [Int.cast_add, Int.cast_one]
          linarith only [hb])
      calc
        volume (Ico a b ∩ track P U v c) ≤
            volume ((Ico a m ∩ track P U v c) ∪ (Ico m b ∩ track P U v c)) := by
          apply measure_mono
          rintro x ⟨⟨hax, hxb⟩, hx⟩
          by_cases he : x < m
          · exact Or.inl ⟨⟨hax, he⟩, hx⟩
          · exact Or.inr ⟨⟨le_of_not_gt he, hxb⟩, hx⟩
        _ ≤ volume (Ico a m ∩ track P U v c) + volume (Ico m b ∩ track P U v c) :=
          measure_union_le _ _
        _ ≤ ENNReal.ofReal (intervalLoad P U v c a m) + ENNReal.ofReal (intervalLoad P U v c m b) :=
          add_le_add hleft hright
        _ = _ := by
          rw [← ENNReal.ofReal_add (intervalLoad_nonneg hp hu hv ham) (intervalLoad_nonneg hp hu hv hmb)]
          congr 1
          unfold intervalLoad
          ring

theorem volume_track {P U v c a b : ℝ}
    (hp : 0 < P) (hu : 0 ≤ U) (hup : U < P) (hv : 0 < v) (hab : a ≤ b) :
    volume (Ico a b ∩ track P U v c) ≤ ENNReal.ofReal (intervalLoad P U v c a b) := by
  let k : ℤ := ⌊(v*a-c)/P⌋
  obtain ⟨n, hn⟩ := exists_nat_gt ((v*b-c)/P - (k : ℝ))
  apply spanVol hp hu hup hv n k a b hab
    (floorBounds hp (v*a-c)).1 (floorBounds hp (v*a-c)).2.le
  apply (div_le_iff₀ hp).1
  linarith only [hn]

/-! Large-speed estimate. -/

theorem residual {P U : ℝ} (hp : 0 < P) (hu : 0 ≤ U) (hup : U ≤ P) (z : ℝ) :
    0 ≤ primitive P U z - (U/P)*z ∧ primitive P U z - (U/P)*z ≤ U := by
  let k : ℤ := ⌊z/P⌋
  let r := z - (k : ℝ)*P
  have hl : (k : ℝ)*P ≤ z := (floorBounds hp z).1
  have hh : z < ((k : ℝ)+1)*P := (floorBounds hp z).2
  have hr : 0 ≤ r := sub_nonneg.mpr hl
  have hr' : r ≤ P := by dsimp only [r]; linarith only [hh]
  have hq : 0 ≤ U/P := div_nonneg hu hp.le
  have hq' : U/P ≤ 1 := (div_le_iff₀ hp).2 (by simpa using hup)
  have hscale : U/P*P = U := div_mul_cancel₀ _ hp.ne'
  have hsmall : U/P*r ≤ r := by
    simpa using mul_le_mul_of_nonneg_right hq' hr
  have hsmall' : U/P*r ≤ U := by
    simpa only [hscale] using mul_le_mul_of_nonneg_left hr' hq
  have hm := le_min hsmall' hsmall
  have hz : (k : ℝ)*P+r = z := by dsimp only [r]; ring
  have e : primitive P U z - (U/P)*z = min U r - (U/P)*r := by
    calc
      _ = U*(k : ℝ) + min U r - (U/P)*((k : ℝ)*P+r) := by rw [hz]; rfl
      _ = _ := by rw [mul_add, mul_left_comm (U/P) (k : ℝ) P, hscale]; ring
  rw [e]
  constructor
  · linarith only [hm]
  · linarith only [min_le_left U r, mul_nonneg hq hr]

theorem intervalLoad_tail {P U v : ℝ} (hp : 0 < P) (hu : 0 ≤ U) (hup : U ≤ P)
    (hv : 0 < v) (c a b : ℝ) :
    intervalLoad P U v c a b ≤ (U/P)*(b-a) + U/v := by
  apply (div_le_iff₀ hv).2
  calc
    primitive P U (v*b-c) - primitive P U (v*a-c) ≤
        (U/P)*(v*b-c) - (U/P)*(v*a-c) + U := by
      linarith only [(residual hp hu hup (v*b-c)).2, (residual hp hu hup (v*a-c)).1]
    _ = ((U/P)*(b-a)+U/v)*v := by rw [add_mul, div_mul_cancel₀ _ hv.ne']; ring

end ShiftedLonelyRunner.WeightedResidual
