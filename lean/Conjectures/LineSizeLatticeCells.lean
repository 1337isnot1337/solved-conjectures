import Mathlib.MeasureTheory.Function.Floor
import Mathlib.MeasureTheory.Constructions.BorelSpace.Complex
import Mathlib.MeasureTheory.Integral.DominatedConvergence
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.Topology.Algebra.InfiniteSum.ENNReal
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Integration on a shifted lattice

The half-open cells start at `c` and have positive width `h`.  The step
function is zero to the left of `c`, including when the natural floor would
otherwise select index zero.  The integral identity is an equality of actual
Bochner integrals, with absolute summability supplying integrability.
-/

noncomputable section

open Set MeasureTheory
open scoped ENNReal NNReal Topology

namespace LineSize.Lattice

def cell (h c : ℝ) (r : ℕ) : Set ℝ :=
  Ico (c + h * (r : ℝ)) (c + h * ((r : ℝ) + 1))

def leftEndpoint (h c x : ℝ) : ℝ := c + h * (⌊(x-c)/h⌋₊ : ℝ)

def step {E : Type*} [Zero E] (h c : ℝ) (A : ℕ → E) (x : ℝ) : E :=
  if x < c then 0 else A ⌊(x-c)/h⌋₊

theorem measurableSet_cell (h c : ℝ) (r : ℕ) : MeasurableSet (cell h c r) :=
  measurableSet_Ico

theorem mem_cell_iff {h c x : ℝ} {r : ℕ} (hh : 0 < h) :
    x ∈ cell h c r ↔ c ≤ x ∧ ⌊(x-c)/h⌋₊ = r := by
  constructor
  · intro hx
    have hxc : c ≤ x := by
      have hr : 0 ≤ h * (r : ℝ) := mul_nonneg hh.le (Nat.cast_nonneg r)
      exact le_trans (by linarith) hx.1
    refine ⟨hxc, (Nat.floor_eq_iff (div_nonneg (sub_nonneg.mpr hxc) hh.le)).2 ?_⟩
    constructor
    · apply (le_div_iff₀ hh).2
      linarith [hx.1]
    · apply (div_lt_iff₀ hh).2
      linarith [hx.2]
  · rintro ⟨hxc, hr⟩
    have hb := (Nat.floor_eq_iff (div_nonneg (sub_nonneg.mpr hxc) hh.le)).1 hr
    constructor
    · have hb0 := (le_div_iff₀ hh).1 hb.1
      nlinarith
    · have hb1 := (div_lt_iff₀ hh).1 hb.2
      nlinarith

theorem cell_cover {h c : ℝ} (hh : 0 < h) : (⋃ r : ℕ, cell h c r) = Ici c := by
  ext x
  simp only [mem_iUnion, mem_cell_iff hh, mem_Ici]
  exact ⟨fun ⟨_, hx, _⟩ => hx, fun hx => ⟨⌊(x-c)/h⌋₊, hx, rfl⟩⟩

theorem cells_disjoint {h c : ℝ} (hh : 0 < h) {r s : ℕ} (hrs : r ≠ s) :
    Disjoint (cell h c r) (cell h c s) := by
  apply disjoint_left.2
  intro x hx hy
  exact hrs (((mem_cell_iff hh).1 hx).2.symm.trans ((mem_cell_iff hh).1 hy).2)

theorem step_eq_on_cell {E : Type*} [Zero E] {h c x : ℝ} (hh : 0 < h)
    (A : ℕ → E) {r : ℕ} (hx : x ∈ cell h c r) : step h c A x = A r := by
  obtain ⟨hxc, hr⟩ := (mem_cell_iff hh).1 hx
  simp only [step, not_lt.mpr hxc, if_false, hr]

theorem step_eq_zero_of_lt {E : Type*} [Zero E] {h c x : ℝ}
    (A : ℕ → E) (hx : x < c) : step h c A x = 0 := by
  simp only [step, hx, if_true]

theorem leftEndpoint_bounds {h c x : ℝ} (hh : 0 < h) (hx : c ≤ x) :
    leftEndpoint h c x ≤ x ∧ x < leftEndpoint h c x + h := by
  have hmem := (mem_cell_iff hh).2 (And.intro hx rfl)
  change c + h * (⌊(x-c)/h⌋₊ : ℝ) ≤ x ∧
    x < c + h * (⌊(x-c)/h⌋₊ : ℝ) + h
  exact ⟨hmem.1, by nlinarith [hmem.2]⟩

theorem step_eq_tsum {E : Type*} [AddCommMonoid E] [TopologicalSpace E]
    [T2Space E] {h c : ℝ} (hh : 0 < h) (A : ℕ → E) :
    step h c A = fun x => ∑' r : ℕ, (cell h c r).indicator (fun _ => A r) x := by
  funext x
  by_cases hx : x < c
  · have hz : (fun r : ℕ => (cell h c r).indicator (fun _ => A r) x) =
        fun _ : ℕ => (0 : E) := by
      funext r
      apply indicator_of_notMem
      intro hr
      exact (not_le.mpr hx) ((mem_cell_iff hh).1 hr).1
    rw [hz, tsum_zero, step_eq_zero_of_lt A hx]
  · let n := ⌊(x-c)/h⌋₊
    have hn : x ∈ cell h c n := (mem_cell_iff hh).2 ⟨le_of_not_gt hx, rfl⟩
    rw [tsum_eq_single n]
    · rw [indicator_of_mem hn, step_eq_on_cell hh A hn]
    · intro r hr
      apply indicator_of_notMem
      intro hrx
      exact hr ((mem_cell_iff hh).1 hrx).2.symm

theorem volume_cell (h c : ℝ) (r : ℕ) : volume (cell h c r) = ENNReal.ofReal h := by
  rw [cell, volume_Ico]
  congr 1
  ring

theorem measureReal_cell {h c : ℝ} (hh : 0 < h) (r : ℕ) :
    volume.real (cell h c r) = h := by
  change (volume (cell h c r)).toReal = h
  rw [volume_cell, ENNReal.toReal_ofReal hh.le]

theorem measurable_step (h c : ℝ) (A : ℕ → ℂ) : Measurable (step h c A) := by
  have hm : Measurable (fun x : ℝ => A ⌊(x-c)/h⌋₊) :=
    (measurable_of_countable A).comp ((measurable_id.sub_const c).div_const h).nat_floor
  exact Measurable.ite measurableSet_Iio measurable_const hm

theorem lintegral_enorm_step {h c : ℝ} (hh : 0 < h) (A : ℕ → ℂ) :
    (∫⁻ x : ℝ, ‖step h c A x‖ₑ) = ∑' r : ℕ, ENNReal.ofReal (h * ‖A r‖) := by
  have hn : (fun x => ‖step h c A x‖ₑ) = step h c (fun r => ‖A r‖ₑ) := by
    funext x
    by_cases hx : x < c
    · simp [step, hx]
    · simp [step, hx]
  rw [hn, step_eq_tsum hh]
  rw [lintegral_tsum (fun r =>
    (measurable_const.indicator (measurableSet_cell h c r)).aemeasurable)]
  apply tsum_congr
  intro r
  rw [lintegral_indicator_const (measurableSet_cell h c r), volume_cell,
    ENNReal.ofReal_mul hh.le, ENNReal.ofReal_norm]
  exact mul_comm _ _

theorem integrable_step {h c : ℝ} (hh : 0 < h) (A : ℕ → ℂ)
    (hA : Summable (fun r => ‖A r‖)) : Integrable (step h c A) := by
  refine ⟨(measurable_step h c A).aestronglyMeasurable, ?_⟩
  change (∫⁻ x : ℝ, ‖step h c A x‖ₑ) < ∞
  rw [lintegral_enorm_step hh]
  exact (hA.mul_left h).tsum_ofReal_lt_top

theorem summable_norm_of_integrable_step {h c : ℝ} (hh : 0 < h) (A : ℕ → ℂ)
    (hA : Integrable (step h c A)) : Summable (fun r => ‖A r‖) := by
  have hf : (∑' r : ℕ, ENNReal.ofReal (h * ‖A r‖)) ≠ ∞ := by
    rw [← lintegral_enorm_step hh]
    exact hA.hasFiniteIntegral.ne
  have hs : Summable (fun r => h * ‖A r‖) := by
    have hto (r : ℕ) := ENNReal.toReal_ofReal (mul_nonneg hh.le (norm_nonneg (A r)))
    simpa only [hto] using ENNReal.summable_toReal hf
  exact (summable_mul_left_iff hh.ne').1 hs

theorem integrable_step_iff {h c : ℝ} (hh : 0 < h) (A : ℕ → ℂ) :
    Integrable (step h c A) ↔ Summable (fun r => ‖A r‖) :=
  ⟨summable_norm_of_integrable_step hh A, integrable_step hh A⟩

theorem integrable_cell_indicator (h c : ℝ) (A : ℕ → ℂ) (r : ℕ) :
    Integrable ((cell h c r).indicator (fun _ => A r)) := by
  apply (integrable_indicator_iff (measurableSet_cell h c r)).2
  apply integrableOn_const
  rw [volume_cell]
  exact ENNReal.ofReal_ne_top

theorem integral_cell_indicator {h c : ℝ} (hh : 0 < h) (A : ℕ → ℂ) (r : ℕ) :
    (∫ x : ℝ, (cell h c r).indicator (fun _ => A r) x) = h • A r := by
  rw [integral_indicator_const _ (measurableSet_cell h c r), measureReal_cell hh]

theorem integral_norm_cell_indicator {h c : ℝ} (hh : 0 < h) (A : ℕ → ℂ) (r : ℕ) :
    (∫ x : ℝ, ‖(cell h c r).indicator (fun _ => A r) x‖) = h * ‖A r‖ := by
  simp_rw [norm_indicator_eq_indicator_norm]
  rw [integral_indicator_const _ (measurableSet_cell h c r), measureReal_cell hh,
    smul_eq_mul]

theorem integral_step {h c : ℝ} (hh : 0 < h) (A : ℕ → ℂ)
    (hA : Summable (fun r => ‖A r‖)) :
    (∫ x : ℝ, step h c A x) = (h : ℂ) * ∑' r : ℕ, A r := by
  rw [step_eq_tsum hh]
  have hs : Summable (fun r : ℕ =>
      ∫ x : ℝ, ‖(cell h c r).indicator (fun _ => A r) x‖) := by
    simp_rw [integral_norm_cell_indicator hh]
    exact hA.mul_left h
  rw [← integral_tsum_of_summable_integral_norm (integrable_cell_indicator h c A) hs]
  simp_rw [integral_cell_indicator hh, Complex.real_smul]
  rw [tsum_mul_left]

end LineSize.Lattice
