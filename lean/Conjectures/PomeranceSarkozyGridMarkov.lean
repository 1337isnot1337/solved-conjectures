module
public import Mathlib.MeasureTheory.Integral.Bochner.Set
public import Mathlib.Topology.Algebra.InfiniteSum.ENNReal
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Linarith
import Mathlib.Algebra.Order.Field.Basic

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory Set Finset
open scoped ENNReal BigOperators

/-- A normalized fourth-moment bound controls a measurable threshold
event, with the complete constant kept in the statement. -/
theorem fourthMoment_markov {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : Ω → ℝ) (hX : Integrable (fun x=>X x^4) μ) {r : ℝ} (hr : 0<r) :
    μ {x | r < |X x|} ≤ ENNReal.ofReal ((∫ x,X x^4 ∂μ)/r^4) := by
  have hInt : Integrable (fun x=>X x^4/r^4) μ := hX.div_const _
  have hNonneg : 0 ≤ᵐ[μ] fun x=>X x^4/r^4 :=
    Filter.Eventually.of_forall (fun x=>div_nonneg (show 0≤X x^4 by positivity) (by positivity))
  have h := hInt.measure_le_integral hNonneg (s:={x | r < |X x|}) (by
    intro x hx
    change r < |X x| at hx
    apply (le_div_iff₀ (by positivity : 0<r^4)).mpr
    rw [one_mul]
    have hs := pow_le_pow_left₀ hr.le hx.le 4
    rwa [← abs_pow,abs_of_nonneg (show 0≤X x^4 by positivity)] at hs)
  rw [integral_div] at h
  exact h

/-- On the base-32 grid a level-m union bound loses only 2^{-m},
despite testing all 32^m adjacent increments. -/
theorem base32_grid_bad_level_le {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (m : ℕ) (X : Fin (32^m)→Ω→ℝ) {C A : ℝ} (hA : 0<A)
    (hInt : ∀ j,Integrable (fun x=>X j x^4) μ)
    (hMoment : ∀ j,(∫ x,X j x^4 ∂μ)≤C/((32:ℝ)^m)^2) :
    μ {x | ∃ j, A*(1/2:ℝ)^m < |X j x|} ≤
      ENNReal.ofReal ((C/A^4)*(1/2:ℝ)^m) := by
  let B (j : Fin (32^m)) : Set Ω := {x | A*(1/2:ℝ)^m < |X j x|}
  let r := A*(1/2:ℝ)^m
  let D := C/((32:ℝ)^m)^2/r^4
  have hr : 0<r := by unfold r; positivity
  have hC : 0≤C := by
    let j : Fin (32^m) := ⟨0,by positivity⟩
    have h := (integral_nonneg (fun x=>show 0≤X j x^4 by positivity)).trans (hMoment j)
    simpa only [zero_mul] using (le_div_iff₀ (by positivity : 0<((32:ℝ)^m)^2)).mp h
  have hD : 0≤D := by unfold D; positivity
  have hEach (j : Fin (32^m)) : μ (B j)≤ENNReal.ofReal D :=
    (fourthMoment_markov μ (X j) (hInt j) hr).trans
      (ENNReal.ofReal_le_ofReal (div_le_div_of_nonneg_right (hMoment j) (by positivity)))
  have hEq : {x | ∃ j, A*(1/2:ℝ)^m < |X j x|}=⋃ j∈(Finset.univ:Finset (Fin (32^m))),B j := by
    ext x
    rw [Set.mem_iUnion]
    constructor
    · rintro ⟨j,hj⟩
      exact ⟨j,Set.mem_iUnion.mpr ⟨Finset.mem_univ _,hj⟩⟩
    · rintro ⟨j,hj⟩
      obtain ⟨_,hh⟩ := Set.mem_iUnion.mp hj
      exact ⟨j,hh⟩
  rw [hEq]
  calc
    _ ≤ ∑ j : Fin (32^m),μ (B j) := measure_biUnion_finset_le _ _
    _ ≤ ∑ _j : Fin (32^m),ENNReal.ofReal D := Finset.sum_le_sum (fun j _=>hEach j)
    _ = _ := by
      simp only [Finset.sum_const,Finset.card_univ,Fintype.card_fin,nsmul_eq_mul]
      rw [← ENNReal.ofReal_natCast,← ENNReal.ofReal_mul (Nat.cast_nonneg _)]
      congr 1
      push_cast
      unfold D r
      have H : (1/2:ℝ)^(m*5)*(32:ℝ)^m=1 := by
        rw [Nat.mul_comm m 5,pow_mul,← mul_pow]
        norm_num
      field_simp
      have H' : (32:ℝ)^m*((1/2:ℝ)^m)^5=1 := by rw [← pow_mul,mul_comm]; exact H
      nlinarith only [congrArg (fun x : ℝ=>C*x) H']

/-- The union over all base-32 grid levels has probability at most
the sum of the geometric series, independent of the sampled row. -/
theorem base32_grid_bad_all_le {Ω : Type*} [MeasurableSpace Ω] (μ : Measure Ω)
    (X : (m : ℕ)→Fin (32^m)→Ω→ℝ) {C A : ℝ} (hC : 0≤C) (hA : 0<A)
    (hInt : ∀ m j,Integrable (fun x=>X m j x^4) μ)
    (hMoment : ∀ m j,(∫ x,X m j x^4 ∂μ)≤C/((32:ℝ)^m)^2) :
    μ {x | ∃ m j, A*(1/2:ℝ)^m < |X m j x|} ≤ ENNReal.ofReal (2*C/A^4) := by
  let B (m : ℕ) : Set Ω := {x | ∃ j, A*(1/2:ℝ)^m < |X m j x|}
  let f (m : ℕ) := (C/A^4)*(1/2:ℝ)^m
  have hGeom : Summable (fun m : ℕ => (1/2:ℝ)^m) :=
    summable_geometric_of_norm_lt_one (by norm_num)
  have hSum : ∑' m,f m = 2*C/A^4 := by
    unfold f
    rw [tsum_mul_left,tsum_geometric_of_norm_lt_one (by norm_num : ‖(1/2:ℝ)‖<1)]
    norm_num
    ring
  have hEq : {x | ∃ m j,A*(1/2:ℝ)^m < |X m j x|} = ⋃ m,B m := by
    ext x
    change (∃ m,x ∈ B m) ↔ _
    exact Set.mem_iUnion.symm
  rw [hEq]
  calc
    _ ≤ ∑' m,μ (B m) := measure_iUnion_le _
    _ ≤ ∑' m,ENNReal.ofReal (f m) := ENNReal.tsum_le_tsum (fun m=>
      base32_grid_bad_level_le μ m (X m) hA (hInt m) (hMoment m))
    _ = _ := by
      rw [← ENNReal.ofReal_tsum_of_nonneg (fun _=>by positivity) (hGeom.mul_left (C/A^4)),
        hSum]

end PomeranceSarkozy
