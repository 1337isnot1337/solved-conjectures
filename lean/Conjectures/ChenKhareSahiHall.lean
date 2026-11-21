import Conjectures.ChenKhareSahiSaturation

namespace ChenKhareSahi
open Filter
open scoped Topology

noncomputable def HL420 (t : ℝ) : SymFun := fun x y z =>
  realMonomial 4 2 0 x y z + (1-t)*(realMonomial 4 1 1 x y z + realMonomial 3 3 0 x y z) +
    (1-t)*(2-t)*realMonomial 3 2 1 x y z + (1-t)*(t^2-t+3)*realMonomial 2 2 2 x y z

noncomputable def HL411 (t : ℝ) : SymFun := fun x y z =>
  realMonomial 4 1 1 x y z + (1-t)*realMonomial 3 2 1 x y z + (1-t)^2*realMonomial 2 2 2 x y z

noncomputable def HL_A (t : ℝ) : ℝ := 27-28*t+8*t^2-t^3
noncomputable def HL_B (t : ℝ) : ℝ := 10-8*t+t^2

theorem HL_values (t : ℝ) : HL420 t 1 1 1 = HL_A t ∧ HL411 t 1 1 1 = HL_B t := by
  norm_num [HL420, HL411, HL_A, HL_B, realMonomial, realM_average, orbit]
  constructor <;> ring

theorem HL_separation (t : ℝ) (ha : HL_A t ≠ 0) (hb : HL_B t ≠ 0) :
    realSep (fun x y z => HL420 t x y z / HL420 t 1 1 1 - HL411 t x y z / HL411 t 1 1 1) =
      3*(1-t)*(10*t^2-35*t+19)/(HL_A t*HL_B t) := by
  have hval := HL_values t
  simp only [hval.1, hval.2]
  norm_num [realSep, HL420, HL411, realMonomial, realM_average, orbit]
  field_simp
  unfold HL_A HL_B
  ring

theorem HL_A_pos (t : ℝ) (ht : t < 1) : 0 < HL_A t := by
  have h1 : 0 < 1-t := by linarith
  have h2 : 0 ≤ (1-t)^2 := sq_nonneg _
  have h3 : 0 < (1-t)^3 := pow_pos h1 _
  dsimp [HL_A]
  nlinarith

theorem HL_B_pos (t : ℝ) (ht : t < 1) : 0 < HL_B t := by
  have h1 : 0 < 1-t := by linarith
  have h2 : 0 ≤ (1-t)^2 := sq_nonneg _
  dsimp [HL_B]
  nlinarith

theorem HL_negative (t : ℝ) (ht0 : 3/4 ≤ t) (ht1 : t < 1) :
    realSep (fun x y z => HL420 t x y z / HL420 t 1 1 1 - HL411 t x y z / HL411 t 1 1 1) < 0 := by
  have ha := HL_A_pos t ht1
  have hb := HL_B_pos t ht1
  rw [HL_separation t (ne_of_gt ha) (ne_of_gt hb)]
  have hprod : (t-3/4)*(t-1) ≤ 0 := mul_nonpos_of_nonneg_of_nonpos (by linarith) (by linarith)
  have hq : 10*t^2-35*t+19 < 0 := by nlinarith
  apply div_neg_of_neg_of_pos
  · exact mul_neg_of_pos_of_neg (mul_pos (by norm_num) (by linarith)) hq
  · exact mul_pos ha hb


theorem HL_homogeneous (u t x y z : ℝ) :
    (HL420 t (u*x) (u*y) (u*z) / HL420 t 1 1 1 - HL411 t (u*x) (u*y) (u*z) / HL411 t 1 1 1) =
      u^6 * (HL420 t x y z / HL420 t 1 1 1 - HL411 t x y z / HL411 t 1 1 1) := by
  simp only [HL420, HL411, realMonomial_homogeneous]
  norm_num
  ring

theorem HL_nonmembership (t : ℝ) (ht0 : 3/4 ≤ t) (ht1 : t < 1) :
    ¬ FullSemiring (fun x y z => HL420 t x y z / HL420 t 1 1 1 - HL411 t x y z / HL411 t 1 1 1) := by
  intro h
  have hp := (h.homogeneous_component (fun u x y z => HL_homogeneous u t x y z)).degree_six_reduces.separator_nonnegative
  exact (not_lt_of_ge hp) (HL_negative t ht0 ht1)

noncomputable def HL_alternating (a b c : ℕ) (t x y z : ℝ) : ℝ :=
  let F := fun x y z : ℝ => x^a * y^b * z^c * (x-t*y)*(x-t*z)*(y-t*z)
  F x y z - F y x z - F x z y - F z y x + F y z x + F z x y

theorem HL420_symmetrization (t x y z : ℝ) :
    realDelta x y z * HL420 t x y z = HL_alternating 4 2 0 t x y z := by
  norm_num [realDelta, HL420, HL_alternating, realMonomial, realM_average, orbit]
  ring

theorem HL411_symmetrization (t x y z : ℝ) :
    (1+t)*realDelta x y z * HL411 t x y z = HL_alternating 4 1 1 t x y z := by
  norm_num [realDelta, HL411, HL_alternating, realMonomial, realM_average, orbit]
  ring


theorem HL_continuous_transfer (t : ℝ) (ht0 : 3/4 ≤ t) (ht1 : t < 1)
    (F : ℝ → SymFun)
    (hzero : F 0 = (fun x y z => HL420 t x y z / HL420 t 1 1 1 - HL411 t x y z / HL411 t 1 1 1))
    (hcont : ContinuousAt (fun q => realSep (F q)) 0)
    (hhom : ∀ q u x y z, F q (u*x) (u*y) (u*z) = u^6 * F q x y z) :
    ∃ ε > 0, ∀ q, 0 < q → q < ε → ¬ FullSemiring (F q) := by
  have hneg : realSep (F 0) < 0 := by rw [hzero]; exact HL_negative t ht0 ht1
  have hevent : ∀ᶠ q in 𝓝 (0:ℝ), realSep (F q) < 0 :=
    hcont.tendsto.eventually (isOpen_Iio.mem_nhds hneg)
  obtain ⟨ε,hε,hball⟩ := Metric.mem_nhds_iff.mp hevent
  refine ⟨ε,hε,?_⟩
  intro q hq hqε hmember
  have hqball : q ∈ Metric.ball (0:ℝ) ε := by
    simpa [Metric.mem_ball, Real.dist_eq, abs_of_pos hq] using hqε
  have hqneg : realSep (F q) < 0 := hball hqball
  have hpos := (hmember.homogeneous_component (hhom q)).degree_six_reduces.separator_nonnegative
  exact (not_lt_of_ge hpos) hqneg

end ChenKhareSahi
