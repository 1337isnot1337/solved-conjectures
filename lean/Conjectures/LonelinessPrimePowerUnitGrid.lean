import Conjectures.LonelinessModularWitness
import Mathlib.Data.Nat.GCD.Basic

/-!
# Coprime prime-power grids from strict real clearance

For any natural base at least two, numerators congruent to one modulo the
base approximate every nonnegative real time on increasingly fine power
grids. Continuity transports a strict clearance bound to these grids.
The strict inequality is essential to this argument. No conclusion is
drawn from equality at the target value.
-/

namespace Loneliness.PrimePowerUnitGrid

noncomputable section

/-- A numerator that is one modulo the base. -/
def numerator (p m : ℕ) (t : ℝ) : ℕ :=
  1 + p * ⌊t * (p : ℝ) ^ m⌋₊

theorem numerator_mod {p : ℕ} (hp : 2 ≤ p) (m : ℕ) (t : ℝ) :
    numerator p m t % p = 1 := by
  simp [numerator, Nat.add_mod, Nat.mod_eq_of_lt (show 1 < p by omega)]

/-- This coprimality holds for composite bases as well. -/
theorem numerator_coprime (p m : ℕ) (t : ℝ) :
    Nat.Coprime (numerator p m t) (p ^ (m + 1)) := by
  have h : Nat.Coprime (numerator p m t) p := by
    exact (Nat.coprime_add_mul_left_left 1 p _).mpr (Nat.coprime_one_left p)
  exact h.pow_right _

theorem time_error {p : ℕ} (hp : 2 ≤ p) (m : ℕ) {t : ℝ} (ht : 0 ≤ t) :
    |(numerator p m t : ℝ) / (p : ℝ) ^ (m + 1) - t| ≤
      (1 : ℝ) / (p : ℝ) ^ m := by
  have hpR : (1 : ℝ) < p := by exact_mod_cast (show 1 < p by omega)
  have hp0 : (0 : ℝ) < p := lt_trans zero_lt_one hpR
  have hpow : 0 < (p : ℝ) ^ m := pow_pos hp0 _
  have hfloor := Nat.floor_le (mul_nonneg ht hpow.le)
  have hfloor' := Nat.lt_floor_add_one (t * (p : ℝ) ^ m)
  have hinv0 : (0 : ℝ) ≤ 1 / p := (div_pos zero_lt_one hp0).le
  have hinv1 : (1 : ℝ) / p ≤ 1 := (div_le_one hp0).mpr hpR.le
  have habs : |1 / (p : ℝ) -
      (t * (p : ℝ) ^ m - (⌊t * (p : ℝ) ^ m⌋₊ : ℝ))| ≤ 1 := by
    exact abs_le.mpr ⟨by linarith, by linarith⟩
  calc
    |(numerator p m t : ℝ) / (p : ℝ) ^ (m + 1) - t| =
        |1 / (p : ℝ) - (t * (p : ℝ) ^ m -
          (⌊t * (p : ℝ) ^ m⌋₊ : ℝ))| / (p : ℝ) ^ m := by
      have he : (numerator p m t : ℝ) / (p : ℝ) ^ (m + 1) - t =
          (1 / (p : ℝ) - (t * (p : ℝ) ^ m -
            (⌊t * (p : ℝ) ^ m⌋₊ : ℝ))) / (p : ℝ) ^ m := by
        simp only [numerator, Nat.cast_add, Nat.cast_mul, Nat.cast_one, pow_succ]
        field_simp
        ring
      rw [he, abs_div, abs_of_pos hpow]
    _ ≤ (1 : ℝ) / (p : ℝ) ^ m := (div_le_div_iff_of_pos_right hpow).mpr habs

theorem inverse_power_eventually_lt {p : ℕ} (hp : 2 ≤ p)
    {ε : ℝ} (hε : 0 < ε) :
    ∃ M : ℕ, ∀ m ≥ M, (1 : ℝ) / (p : ℝ) ^ m < ε := by
  obtain ⟨M, hM⟩ := exists_nat_gt (1 / ε)
  refine ⟨M, fun m hm => ?_⟩
  have hMp : M < p ^ m := hm.trans_lt (Nat.lt_pow_self (by omega))
  have hMR : (M : ℝ) < (p : ℝ) ^ m := by exact_mod_cast hMp
  have hpR : (0 : ℝ) < p := by exact_mod_cast (show 0 < p by omega)
  apply (div_lt_iff₀ (pow_pos hpR m)).mpr
  have h := (div_lt_iff₀ hε).mp (hM.trans hMR)
  simpa only [mul_comm] using h

/-- The reverse direction of the exact modular distance calculation. -/
theorem witness_of_clearance_lower {p N a : ℕ} {ds : List ℕ}
    (hp : 0 < p) (hN : 0 < N)
    (hclear : (1 : ℝ) / p ≤ clearance ds ((a : ℝ) / N)) :
    Modular.Witness p N a ds := by
  have hpR : (0 : ℝ) < p := by exact_mod_cast hp
  have hNR : (0 : ℝ) < N := by exact_mod_cast hN
  intro d hd
  have h := hclear.trans (clearance_le_of_mem hd ((a : ℝ) / N))
  have he : (d : ℝ) * ((a : ℝ) / N) = ((a * d : ℕ) : ℝ) / N := by
    push_cast
    ring
  rw [he, Modular.distance_nat_div _ _ hN] at h
  have h' := (div_le_div_iff₀ hpR hNR).mp h
  have hR : (N : ℝ) ≤ (p : ℝ) * (Modular.folded N (a * d) : ℝ) := by
    simpa only [one_mul, mul_one, mul_comm] using h'
  exact_mod_cast hR

/-- At every sufficiently fine power grid the explicit numerator retains
strict clearance and is a unit modulo the grid denominator. -/
theorem eventually_unit_witness_of_nonneg_clearance {p : ℕ} (hp : 2 ≤ p)
    (ds : List ℕ) {t : ℝ} (ht : 0 ≤ t)
    (hclear : (1 : ℝ) / p < clearance ds t) :
    ∃ M : ℕ, ∀ m ≥ M, ∃ a : ℕ,
      a % p = 1 ∧ Nat.Coprime a (p ^ (m + 1)) ∧
      (1 : ℝ) / p < clearance ds ((a : ℝ) / (p ^ (m + 1) : ℕ)) ∧
      Modular.Witness p (p ^ (m + 1)) a ds := by
  obtain ⟨δ, hδ, hclose⟩ :=
    Metric.continuousAt_iff.mp (continuous_clearance ds).continuousAt
      (clearance ds t - (1 : ℝ) / p) (sub_pos.mpr hclear)
  obtain ⟨M, hM⟩ := inverse_power_eventually_lt hp hδ
  refine ⟨M, fun m hm => ?_⟩
  let a := numerator p m t
  have herr : |(a : ℝ) / (p ^ (m + 1) : ℕ) - t| < δ := by
    simpa only [Nat.cast_pow] using (time_error hp m ht).trans_lt (hM m hm)
  have hnear := hclose (by simpa only [Real.dist_eq] using herr)
  have hstrict : (1 : ℝ) / p < clearance ds ((a : ℝ) / (p ^ (m + 1) : ℕ)) := by
    rw [Real.dist_eq] at hnear
    have hlow := (abs_lt.mp hnear).1
    linarith
  refine ⟨a, numerator_mod hp m t, numerator_coprime p m t, hstrict, ?_⟩
  exact witness_of_clearance_lower (by omega) (pow_pos (by omega) _) hstrict.le

/-- A strict bound for the actual real supremum supplies unit grid witnesses. -/
theorem eventually_unit_witness_of_value {p : ℕ} (hp : 2 ≤ p)
    (ds : List ℕ) (hvalue : (1 : ℝ) / p < value ds) :
    ∃ M : ℕ, ∀ m ≥ M, ∃ a : ℕ,
      a % p = 1 ∧ Nat.Coprime a (p ^ (m + 1)) ∧
      (1 : ℝ) / p < clearance ds ((a : ℝ) / (p ^ (m + 1) : ℕ)) ∧
      Modular.Witness p (p ^ (m + 1)) a ds := by
  obtain ⟨t, ht, heq⟩ := value_max ds
  exact eventually_unit_witness_of_nonneg_clearance hp ds ht.1 (heq.symm ▸ hvalue)

/-- The initial strict-clearance time may be any real number. -/
theorem eventually_unit_witness_of_clearance {p : ℕ} (hp : 2 ≤ p)
    (ds : List ℕ) {t : ℝ} (hclear : (1 : ℝ) / p < clearance ds t) :
    ∃ M : ℕ, ∀ m ≥ M, ∃ a : ℕ,
      a % p = 1 ∧ Nat.Coprime a (p ^ (m + 1)) ∧
      (1 : ℝ) / p < clearance ds ((a : ℝ) / (p ^ (m + 1) : ℕ)) ∧
      Modular.Witness p (p ^ (m + 1)) a ds :=
  eventually_unit_witness_of_value hp ds
    (hclear.trans_le (CriticalFamilies.le_value_any ds t))

theorem arbitrarily_fine_unit_witness_of_value {p : ℕ} (hp : 2 ≤ p)
    (ds : List ℕ) (hvalue : (1 : ℝ) / p < value ds) (M : ℕ) :
    ∃ m ≥ M, ∃ a : ℕ, a % p = 1 ∧ Nat.Coprime a (p ^ (m + 1)) ∧
      Modular.Witness p (p ^ (m + 1)) a ds := by
  obtain ⟨K, hK⟩ := eventually_unit_witness_of_value hp ds hvalue
  obtain ⟨a, ha, hcop, _, hw⟩ := hK (max M K) (le_max_right _ _)
  exact ⟨max M K, le_max_left _ _, a, ha, hcop, hw⟩

theorem arbitrarily_fine_unit_witness_of_clearance {p : ℕ} (hp : 2 ≤ p)
    (ds : List ℕ) {t : ℝ} (hclear : (1 : ℝ) / p < clearance ds t) (M : ℕ) :
    ∃ m ≥ M, ∃ a : ℕ, a % p = 1 ∧ Nat.Coprime a (p ^ (m + 1)) ∧
      Modular.Witness p (p ^ (m + 1)) a ds :=
  arbitrarily_fine_unit_witness_of_value hp ds
    (hclear.trans_le (CriticalFamilies.le_value_any ds t)) M

end

end Loneliness.PrimePowerUnitGrid
