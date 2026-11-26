module

public import Conjectures.PomeranceSarkozyGrowingCutoffs
public import Conjectures.PomeranceSarkozyMertensRemainder
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter Finset Topology

private theorem psRate_eq_primeReciprocalSum_sub {X : ℕ} (h : psL X ^ 6 ≤ psZ X) :
    (psRate X : ℝ) = primeReciprocalSum (psZ X) - primeReciprocalSum (psL X ^ 6) := by
  let a := ⌊psL X ^ 6⌋₊
  let b := ⌊psZ X⌋₊
  have hab : a ≤ b := Nat.floor_mono h
  have hunion : (Icc 0 a).filter Nat.Prime ∪ (Ioc a b).filter Nat.Prime =
      (Icc 0 b).filter Nat.Prime := by
    ext p
    simp only [mem_union, mem_filter, mem_Icc, mem_Ioc, Nat.zero_le, true_and]
    by_cases hp : p ≤ a
    · simp [hp, hp.trans hab, not_lt.mpr hp]
    · simp [hp, lt_of_not_ge hp]
  have hd : Disjoint ((Icc 0 a).filter Nat.Prime) ((Ioc a b).filter Nat.Prime) := by
    refine disjoint_left.mpr fun p hp hq => ?_
    have hp' := (mem_Icc.mp (mem_filter.mp hp).1).2
    have hq' := (mem_Ioc.mp (mem_filter.mp hq).1).1
    omega
  unfold psRate psPrimes psY primeReciprocalSum
  push_cast
  simp only [one_div]
  change (∑ p ∈ (Ioc a b).filter Nat.Prime, (p : ℝ)⁻¹) =
    (∑ p ∈ (Icc 0 b).filter Nat.Prime, (p : ℝ)⁻¹) -
      ∑ p ∈ (Icc 0 a).filter Nat.Prime, (p : ℝ)⁻¹
  rw [← hunion, sum_union hd, add_sub_cancel_left]

private theorem psPrimeMass_cutoffs : ∀ᶠ X in atTop,
    2 ≤ psL X ^ 6 ∧ psL X ^ 6 ≤ psZ X ∧ 1 ≤ Real.log (psL X) ∧
      Real.log (Real.log (psZ X)) = psL X - 6 * Real.log (psL X) := by
  have hexp := (Real.tendsto_exp_div_pow_atTop 7).comp psL_tendsto
  filter_upwards [psL_tendsto.eventually_ge_atTop (Real.exp 1),
    hexp.eventually_ge_atTop (6 : ℝ), eventually_ge_atTop (2 : ℕ)] with X hL hexpX hX
  have hLpos : 0 < psL X := (Real.exp_pos 1).trans_le hL
  have hLtwo : 2 ≤ psL X := by
    have := Real.add_one_le_exp (1 : ℝ)
    linarith
  have hYtwo : 2 ≤ psL X ^ 6 := by
    calc
      2 ≤ (2 : ℝ)^6 := by norm_num
      _ ≤ psL X ^ 6 := pow_le_pow_left₀ (by norm_num) hLtwo 6
  have hlogL : 1 ≤ Real.log (psL X) := by
    simpa only [Real.log_exp] using Real.log_le_log (Real.exp_pos 1) hL
  have hXreal : 1 < (X : ℝ) := by exact_mod_cast (show 1 < X by omega)
  have hlogX : 0 < Real.log (X : ℝ) := Real.log_pos hXreal
  have hlogZ : Real.log (psZ X) = Real.log (X : ℝ) / psL X ^ 6 := by
    rw [psZ, Real.log_rpow (zero_lt_one.trans hXreal), one_div_mul_eq_div]
  have hlogZ' : Real.log (Real.log (psZ X)) = psL X - 6 * Real.log (psL X) := by
    rw [hlogZ, Real.log_div hlogX.ne' (pow_ne_zero 6 hLpos.ne'), Real.log_pow]
    norm_num [psL]
  have hZpos : 0 < psZ X := Real.rpow_pos_of_pos (zero_lt_one.trans hXreal) _
  have hYle : psL X ^ 6 ≤ psZ X := by
    apply (Real.log_le_log_iff (pow_pos hLpos 6) hZpos).mp
    rw [Real.log_pow, hlogZ]
    norm_num only [Nat.cast_ofNat]
    apply (le_div_iff₀ (pow_pos hLpos 6)).mpr
    change 6 ≤ Real.exp (psL X) / psL X ^ 7 at hexpX
    have hbig := (le_div_iff₀ (pow_pos hLpos 7)).mp hexpX
    rw [psL, Real.exp_log hlogX] at hbig
    calc
      6 * Real.log (psL X) * psL X ^ 6 ≤ 6 * psL X * psL X ^ 6 := by
        gcongr
        linarith [Real.log_le_sub_one_of_pos hLpos]
      _ = 6 * psL X ^ 7 := by ring
      _ ≤ Real.log (X : ℝ) := hbig
  exact ⟨hYtwo, hYle, hlogL, hlogZ'⟩

/-- The growing-window Poisson parameter differs from log log X by O(log log log X). -/
theorem psRate_approx : ∃ C : ℝ, ∀ᶠ X in atTop,
    |(psRate X : ℝ) - psL X| ≤ C * Real.log (psL X) := by
  obtain ⟨B, hB⟩ := primeReciprocalSum_logLog_bounded
  refine ⟨12 + 2 * |B|, ?_⟩
  filter_upwards [psPrimeMass_cutoffs] with X ⟨hY, hYZ, hlogL, hlogZ⟩
  have herrZ := abs_le.mp (hB (psZ X) (hY.trans hYZ))
  have herrY := abs_le.mp (hB (psL X ^ 6) hY)
  rw [hlogZ] at herrZ
  have hlogY : Real.log (psL X ^ 6) = 6 * Real.log (psL X) := by
    simp
  rw [hlogY] at herrY
  have hlogY' : 0 ≤ Real.log (6 * Real.log (psL X)) := Real.log_nonneg (by linarith)
  have hlogY'' : Real.log (6 * Real.log (psL X)) ≤ 6 * Real.log (psL X) := by
    linarith [Real.log_le_sub_one_of_pos (show 0 < 6 * Real.log (psL X) by linarith)]
  have hB' : |B| ≤ |B| * Real.log (psL X) := le_mul_of_one_le_right (abs_nonneg B) hlogL
  rw [psRate_eq_primeReciprocalSum_sub hYZ, abs_le]
  constructor <;> nlinarith [le_abs_self B]

/-- A convenient eventual bound for the total incidence mass. -/
theorem psRate_le : ∀ᶠ X in atTop, (psRate X : ℝ) ≤ 2 * psL X := by
  obtain ⟨B, hB⟩ := primeReciprocalSum_logLog_bounded
  filter_upwards [psPrimeMass_cutoffs, psL_tendsto.eventually_ge_atTop B] with X
    ⟨hY, hYZ, hlogL, hlogZ⟩ hLB
  have hZ := (abs_le.mp (hB (psZ X) (hY.trans hYZ))).2
  rw [hlogZ] at hZ
  have hYmass : 0 ≤ primeReciprocalSum (psL X ^ 6) := by
    unfold primeReciprocalSum
    exact sum_nonneg fun p _ => by positivity
  rw [psRate_eq_primeReciprocalSum_sub hYZ]
  linarith

end PomeranceSarkozy
