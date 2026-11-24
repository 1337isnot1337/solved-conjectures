import Conjectures.FeldheimWeightedTailBasic

/-!
# Feldheim–Feldheim’s weighted tail conjecture

The deterministic window argument of §4. The rectangle inequality controls
each separate centered log tail on a common affine window; the weighted
slice then has a bounded combined defect and an arbitrarily large increment.
-/

open Set

namespace Conjectures.FeldheimWeightedTail

noncomputable section

theorem rectangle_window_oscillation {f g : ℝ → ℝ} {t L m d s c E : ℝ}
    (ht : 0 ≤ t) (ht1 : t ≤ 1)
    (hR : RectangleBoundOn f g (Icc (m-d) (m+d)) t L)
    (hH : ∀ x ∈ Icc (m-d) (m+d), |f x+g x-(s*x+c)| ≤ E) :
    ∀ x ∈ Icc (m-d) (m+d), ∀ y ∈ Icc (m-d) (m+d),
      |(f x-t*s*x)-(f y-t*s*y)| ≤ 2*E+L ∧
      |(g x-(1-t)*s*x)-(g y-(1-t)*s*y)| ≤ 2*E+L := by
  have hcross (x : ℝ) (hx : x ∈ Icc (m-d) (m+d))
      (y : ℝ) (hy : y ∈ Icc (m-d) (m+d)) :
      t*s*x+(1-t)*s*y+c-E-L ≤ f x+g y := by
    have hm : t*x+(1-t)*y ∈ Icc (m-d) (m+d) := by
      constructor
      · have ha := mul_le_mul_of_nonneg_left hx.1 ht
        have hb := mul_le_mul_of_nonneg_left hy.1 (sub_nonneg.mpr ht1)
        linarith only [ha,hb]
      · have ha := mul_le_mul_of_nonneg_left hx.2 ht
        have hb := mul_le_mul_of_nonneg_left hy.2 (sub_nonneg.mpr ht1)
        linarith only [ha,hb]
    have hlow := (abs_le.mp (hH _ hm)).1
    have hrect := hR x hx y hy
    linarith only [hlow,hrect]
  intro x hx y hy
  have hxy := hcross x hx y hy
  have hyx := hcross y hy x hx
  have hxx := (abs_le.mp (hH x hx)).2
  have hyy := (abs_le.mp (hH y hy)).2
  constructor <;> apply abs_le.mpr <;> constructor <;> linarith only [hxy,hyx,hxx,hyy]

def sliceWidth (t d : ℝ) : ℝ := d*min 1 ((1-t)/t)

theorem sliceWidth_pos {t d : ℝ} (ht : 0 < t) (ht1 : t < 1) (hd : 0 < d) :
    0 < sliceWidth t d :=
  mul_pos hd (lt_min zero_lt_one (div_pos (sub_pos.mpr ht1) ht))

theorem sliceWidth_le {t d : ℝ} (hd : 0 ≤ d) : sliceWidth t d ≤ d := by
  dsimp only [sliceWidth]
  simpa only [mul_one] using mul_le_mul_of_nonneg_left (min_le_left 1 ((1-t)/t)) hd

theorem mul_sliceWidth {t d : ℝ} (ht : 0 < t) :
    t*sliceWidth t d = min t (1-t)*d := by
  dsimp only [sliceWidth]
  have hfrac : t*((1-t)/t) = 1-t := by field_simp
  rw [mul_left_comm, mul_min_of_nonneg 1 ((1-t)/t) ht.le, mul_one, hfrac]
  ring

theorem slice_points_mem {t m d x : ℝ} (ht : 0 < t) (ht1 : t < 1)
    (hd : 0 < d) (hx : x ∈ Icc (m-sliceWidth t d) m) :
    x ∈ Icc (m-d) (m+d) ∧ (m-t*x)/(1-t) ∈ Icc (m-d) (m+d) := by
  have hd0 := sliceWidth_pos ht ht1 hd
  have hdd := sliceWidth_le (t := t) hd.le
  have htdd : t*sliceWidth t d ≤ (1-t)*d := by
    rw [mul_sliceWidth ht]
    exact mul_le_mul_of_nonneg_right (min_le_right t (1-t)) hd.le
  constructor
  · constructor <;> linarith [hx.1,hx.2]
  · constructor
    · apply (le_div_iff₀ (sub_pos.mpr ht1)).mpr
      have h := mul_le_mul_of_nonneg_left hx.2 ht.le
      nlinarith only [h,hd,ht1]
    · apply (div_le_iff₀ (sub_pos.mpr ht1)).mpr
      have h := mul_le_mul_of_nonneg_left hx.1 ht.le
      nlinarith only [h,htdd]

/-- Both estimates in equation (8), with every weight and window length retained. -/
theorem weighted_window_estimates {f g : ℝ → ℝ} {t L m d s c E j : ℝ}
    (ht : 0 < t) (ht1 : t < 1) (hd : 0 < d) (hrise : j ≤ s*d)
    (hR : RectangleBoundOn f g (Icc (m-d) (m+d)) t L)
    (hH : ∀ x ∈ Icc (m-d) (m+d), |f x+g x-(s*x+c)| ≤ E) :
    (∀ x ∈ Icc (m-sliceWidth t d) m,
      f x+g ((m-t*x)/(1-t))-(f m+g m) ≤ 2*(2*E+L)) ∧
    min t (1-t)*j-(2*E+L) ≤ f m-f (m-sliceWidth t d) := by
  have hosc := rectangle_window_oscillation ht.le ht1.le hR hH
  have hm : m ∈ Icc (m-d) (m+d) := by constructor <;> linarith
  have hd0 := sliceWidth_pos ht ht1 hd
  have hleft : m-sliceWidth t d ∈ Icc (m-sliceWidth t d) m :=
    ⟨le_rfl, by linarith⟩
  have hmin : 0 ≤ min t (1-t) := le_min ht.le (sub_nonneg.mpr ht1.le)
  constructor
  · intro x hx
    obtain ⟨hxI, hyI⟩ := slice_points_mem ht ht1 hd hx
    have hf := (abs_le.mp (hosc x hxI m hm).1).2
    have hg := (abs_le.mp (hosc ((m-t*x)/(1-t)) hyI m hm).2).2
    have he : (1-t)*((m-t*x)/(1-t)) = m-t*x := by
      field_simp [sub_ne_zero.mpr ht1.ne']
    linarith only [hf,hg,congrArg (fun u : ℝ => s*u) he]
  · have hlo := (slice_points_mem ht ht1 hd hleft).1
    have hh := (abs_le.mp (hosc m hm (m-sliceWidth t d) hlo).1).1
    have hscale := mul_le_mul_of_nonneg_left hrise hmin
    have he : t*s*sliceWidth t d = min t (1-t)*(s*d) := by
      calc
        t*s*sliceWidth t d = s*(t*sliceWidth t d) := by ring
        _ = _ := by rw [mul_sliceWidth ht]; ring
    linarith only [hh,hscale,he]

end

end Conjectures.FeldheimWeightedTail
