import Conjectures.FeldheimWeightedTailWrightChord
import Conjectures.FeldheimWeightedTailConvex
import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.Analysis.SpecificLimits.Basic

/-!
# Feldheim–Feldheim’s weighted tail conjecture

Right-continuous monotone functions satisfy the same quantitative chord
bound as their continuous moving averages. This supplies the arbitrary-law
continuity bridge in the recorded proof. Averaging preserves the actual
fixed-weight Wright inequality, and monotonicity and right continuity give
the pointwise limit. No atom-free premise is used.
-/

open Set MeasureTheory Filter
open scoped Topology

namespace Conjectures.FeldheimWeightedTail

noncomputable section

def forwardAverage (F : ℝ → ℝ) (ε x : ℝ) : ℝ :=
  ∫ u in (0 : ℝ)..1, F (x+ε*u)

theorem monotone_halfline_intervalIntegrable {F : ℝ → ℝ} {T a b : ℝ}
    (hF : MonotoneOn F (Ici T)) (ha : T ≤ a) (hab : a ≤ b) :
    IntervalIntegrable F volume a b := by
  apply MonotoneOn.intervalIntegrable
  rw [uIcc_of_le hab]
  exact hF.mono (fun x hx => ha.trans hx.1)

theorem forwardAverage_integrable {F : ℝ → ℝ} {T ε x : ℝ}
    (hF : MonotoneOn F (Ici T)) (hε : 0 ≤ ε) (hx : T ≤ x) :
    IntervalIntegrable (fun u => F (x+ε*u)) volume 0 1 := by
  apply MonotoneOn.intervalIntegrable
  rw [uIcc_of_le (by norm_num : (0 : ℝ) ≤ 1)]
  intro u hu v hv huv
  apply hF
  · change T ≤ x+ε*u
    have hh : 0 ≤ ε*u := mul_nonneg hε hu.1
    linarith
  · change T ≤ x+ε*v
    have hh : 0 ≤ ε*v := mul_nonneg hε hv.1
    linarith
  · exact add_le_add le_rfl (mul_le_mul_of_nonneg_left huv hε)

theorem forwardAverage_eq_interval {F : ℝ → ℝ} {ε : ℝ} (hε : ε ≠ 0) (x : ℝ) :
    forwardAverage F ε x = ε⁻¹*(∫ y in x..(x+ε), F y) := by
  unfold forwardAverage
  rw [intervalIntegral.integral_comp_add_mul F hε x]
  simp only [mul_zero, mul_one, add_zero, smul_eq_mul]

/-- Moving averages of an actual monotone function are continuous on every compact subinterval. -/
theorem forwardAverage_continuousOn {F : ℝ → ℝ} {T ε a b : ℝ}
    (hF : MonotoneOn F (Ici T)) (hε : 0 < ε) (ha : T ≤ a) (hab : a ≤ b) :
    ContinuousOn (forwardAverage F ε) (Icc a b) := by
  have habε : a ≤ b+ε := by linarith
  have hI := monotone_halfline_intervalIntegrable hF ha habε
  let K : ℝ → ℝ := fun x => ∫ u in a..x, F u
  have hK : ContinuousOn K (Icc a (b+ε)) := by
    simpa only [uIcc_of_le habε] using
      (intervalIntegral.continuousOn_primitive_interval' hI left_mem_uIcc)
  have hKshift : ContinuousOn (fun x => K (x+ε)) (Icc a b) :=
    hK.comp (by fun_prop) (by intro x hx; constructor <;> linarith [hx.1,hx.2])
  have hKid : ContinuousOn K (Icc a b) :=
    hK.mono (Icc_subset_Icc le_rfl (by linarith))
  have hC : ContinuousOn (fun x => ε⁻¹*(K (x+ε)-K x)) (Icc a b) :=
    continuousOn_const.mul (hKshift.sub hKid)
  apply hC.congr
  intro x hx
  have hax := monotone_halfline_intervalIntegrable hF ha hx.1
  have hxx := monotone_halfline_intervalIntegrable hF (ha.trans hx.1)
    (show x ≤ x+ε by linarith)
  have he := intervalIntegral.integral_add_adjacent_intervals hax hxx
  rw [forwardAverage_eq_interval hε.ne' x]
  dsimp only [K]
  congr 1
  linarith

theorem forwardAverage_bounds {F : ℝ → ℝ} {T ε x : ℝ}
    (hF : MonotoneOn F (Ici T)) (hε : 0 ≤ ε) (hx : T ≤ x) :
    F x ≤ forwardAverage F ε x ∧ forwardAverage F ε x ≤ F (x+ε) := by
  have hI := forwardAverage_integrable hF hε hx
  constructor
  · have hh := intervalIntegral.integral_mono_on (μ := volume) (a := 0) (b := 1)
      (by norm_num) (intervalIntegrable_const (c := F x)) hI (by
        intro u hu
        apply hF hx
        · change T ≤ x+ε*u
          nlinarith [hu.1]
        · nlinarith [hu.1])
    simpa only [forwardAverage, intervalIntegral.integral_const, sub_zero, one_smul] using hh
  · have hh := intervalIntegral.integral_mono_on (μ := volume) (a := 0) (b := 1)
      (by norm_num) hI (intervalIntegrable_const (c := F (x+ε))) (by
        intro u hu
        apply hF
        · change T ≤ x+ε*u
          nlinarith [hu.1]
        · change T ≤ x+ε
          linarith
        · nlinarith [hu.1,hu.2])
    simpa only [forwardAverage, intervalIntegral.integral_const, sub_zero, one_smul] using hh

theorem forwardAverage_wright {F : ℝ → ℝ} {T t e ε : ℝ}
    (hF : MonotoneOn F (Ici T)) (ht : 0 ≤ t) (ht1 : t ≤ 1) (hε : 0 ≤ ε)
    (hW : WrightBoundOn F (Ici T) t e) :
    WrightBoundOn (forwardAverage F ε) (Ici T) t e := by
  intro x hx y hy
  have hp : T ≤ (1-t)*x+t*y := by
    have h₁ := mul_le_mul_of_nonneg_left hx (by linarith : 0 ≤ 1-t)
    have h₂ := mul_le_mul_of_nonneg_left hy ht
    nlinarith
  have hq : T ≤ t*x+(1-t)*y := by
    have h₁ := mul_le_mul_of_nonneg_left hx ht
    have h₂ := mul_le_mul_of_nonneg_left hy (by linarith : 0 ≤ 1-t)
    nlinarith
  have hIp := forwardAverage_integrable hF hε hp
  have hIq := forwardAverage_integrable hF hε hq
  have hIx := forwardAverage_integrable hF hε hx
  have hIy := forwardAverage_integrable hF hε hy
  have hi := intervalIntegral.integral_mono_on (μ := volume) (a := 0) (b := 1)
    (by norm_num) (hIp.add hIq) ((hIx.add hIy).add intervalIntegrable_const) (by
      intro u hu
      have hxu : x+ε*u ∈ Ici T :=
        (show T ≤ x from hx).trans (le_add_of_nonneg_right (mul_nonneg hε hu.1))
      have hyu : y+ε*u ∈ Ici T :=
        (show T ≤ y from hy).trans (le_add_of_nonneg_right (mul_nonneg hε hu.1))
      have hh := hW (x+ε*u) hxu (y+ε*u) hyu
      have he₁ : (1-t)*(x+ε*u)+t*(y+ε*u) = (1-t)*x+t*y+ε*u := by ring
      have he₂ : t*(x+ε*u)+(1-t)*(y+ε*u) = t*x+(1-t)*y+ε*u := by ring
      simpa only [he₁,he₂] using hh)
  rw [intervalIntegral.integral_add hIp hIq,
    intervalIntegral.integral_add (hIx.add hIy) intervalIntegrable_const,
    intervalIntegral.integral_add hIx hIy] at hi
  simpa only [forwardAverage, intervalIntegral.integral_const, sub_zero, one_smul] using hi

theorem forwardAverage_tendsto {F : ℝ → ℝ} {T x : ℝ}
    (hF : MonotoneOn F (Ici T)) (hx : T ≤ x)
    (hRight : ContinuousWithinAt F (Ici x) x) :
    Tendsto (fun n : ℕ => forwardAverage F (1/((n : ℝ)+1)) x) atTop (𝓝 (F x)) := by
  have hseq : Tendsto (fun n : ℕ => x+1/((n : ℝ)+1)) atTop (𝓝 x) := by
    simpa only [add_zero] using tendsto_one_div_add_atTop_nhds_zero_nat.const_add x
  have hseq' : Tendsto (fun n : ℕ => x+1/((n : ℝ)+1)) atTop (𝓝[Ici x] x) := by
    apply tendsto_nhdsWithin_iff.mpr
    refine ⟨hseq, Filter.Eventually.of_forall ?_⟩
    intro n
    change x ≤ x+1/((n : ℝ)+1)
    exact le_add_of_nonneg_right (by positivity)
  have hupper := hRight.tendsto.comp hseq'
  apply tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hupper
  · intro n
    exact (forwardAverage_bounds hF (by positivity : 0 ≤ 1/((n : ℝ)+1)) hx).1
  · intro n
    exact (forwardAverage_bounds hF (by positivity : 0 ≤ 1/((n : ℝ)+1)) hx).2

/-- The full chord bound for right-continuous monotone functions, including jump discontinuities. -/
theorem monotone_wright_chordBoundOn {F : ℝ → ℝ} {T t e : ℝ}
    (hF : MonotoneOn F (Ici T))
    (hRight : ∀ x, T ≤ x → ContinuousWithinAt F (Ici x) x)
    (ht : 0 < t) (ht2 : t ≤ 1/2) (he : 0 ≤ e)
    (hW : WrightBoundOn F (Ici T) t e) :
    ChordBoundOn F T (wrightConstant t*e) := by
  intro a ha b hab z hz
  have hb : T ≤ b := ha.trans hab.le
  have hzz : T ≤ z := ha.trans hz.1
  have hlimA := forwardAverage_tendsto hF ha (hRight a ha)
  have hlimB := forwardAverage_tendsto hF hb (hRight b hb)
  have hlimZ := forwardAverage_tendsto hF hzz (hRight z hzz)
  apply le_of_tendsto_of_tendsto' hlimZ
    (((hlimA.const_mul ((b-z)/(b-a))).add (hlimB.const_mul ((z-a)/(b-a)))).add_const (wrightConstant t*e))
  intro n
  have hε : 0 < 1/((n : ℝ)+1) := by positivity
  have hcont := forwardAverage_continuousOn hF hε ha hab.le
  have hW' := forwardAverage_wright hF ht.le (show t ≤ 1 by linarith) hε.le hW
  exact wright_chord_le hab ht ht2 he hcont
    (hW'.mono (fun x hx => ha.trans hx.1)) hz

end

end Conjectures.FeldheimWeightedTail
