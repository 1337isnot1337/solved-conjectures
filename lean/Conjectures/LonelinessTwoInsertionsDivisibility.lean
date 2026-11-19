import Conjectures.LonelinessTwoInsertionsMeasure
import Conjectures.LonelinessTwoInsertionsRows
import Conjectures.LonelinessModularWitness
import Mathlib.Data.Nat.GCD.Basic
import Mathlib.Tactic.Tauto

/-! The elementary residue and divisor reductions for the prescribed
two-speed interval. The two extra speeds have no imposed upper bound. -/

namespace Loneliness.TwoInsertions

theorem reciprocal_residue_lower (v d : ℕ) (hd : 0 < d) (hnot : ¬ d ∣ v) :
    1/(d : ℝ) ≤ distance ((v : ℝ)/(d : ℝ)) := by
  have hmod : v%d < d := Nat.mod_lt v hd
  have hnonzero : v%d ≠ 0 := fun h => hnot (Nat.dvd_of_mod_eq_zero h)
  have hfold : 1 ≤ Modular.folded d v := by
    unfold Modular.folded
    omega
  have hfoldR : (1 : ℝ) ≤ (Modular.folded d v : ℝ) := by exact_mod_cast hfold
  rw [Modular.distance_nat_div v d hd]
  exact div_le_div_of_nonneg_right hfoldR (Nat.cast_nonneg d)

theorem failed_endpoints_divisibility (p b c : ℕ) (hp : 3 ≤ p)
    (hfail : ¬ TwoSpeedWindow p b c) :
    ∀ d : ℕ, p ≤ d → d ≤ p+2 → d ∣ b ∨ d ∣ c := by
  intro d hpd hdq
  by_cases hb : d ∣ b
  · exact Or.inl hb
  right
  by_contra hc
  have hpR : (0 : ℝ) < p := by exact_mod_cast (show 0 < p by omega)
  have hd : 0 < d := by omega
  have hdR : (0 : ℝ) < d := by exact_mod_cast hd
  have hlo : 1/(p+2 : ℝ) ≤ 1/(d : ℝ) :=
    one_div_le_one_div_of_le hdR (by exact_mod_cast hdq)
  have hhi : 1/(d : ℝ) ≤ 1/(p : ℝ) :=
    one_div_le_one_div_of_le hpR (by exact_mod_cast hpd)
  apply hfail
  refine ⟨1/(d : ℝ), ⟨hlo, hhi⟩, ?_, ?_⟩
  · simpa only [div_eq_mul_inv, one_mul] using hlo.trans (reciprocal_residue_lower b d hd hb)
  · simpa only [div_eq_mul_inv, one_mul] using hlo.trans (reciprocal_residue_lower c d hd hc)

theorem common_divisors_product_bound (a d v : ℕ) (hv : 0 < v)
    (ha : a ∣ v) (hd : d ∣ v) : a*d ≤ Nat.gcd a d*v := by
  have hl : Nat.lcm a d ≤ v := Nat.le_of_dvd hv (Nat.lcm_dvd ha hd)
  have h := Nat.mul_le_mul_left (Nat.gcd a d) hl
  rwa [Nat.gcd_mul_lcm] at h

theorem consecutive_divisors_product_le (p v : ℕ) (hv : 0 < v)
    (h₀ : p ∣ v) (h₁ : p+1 ∣ v) : p*(p+1) ≤ v := by
  have h := common_divisors_product_bound p (p+1) v hv h₀ h₁
  have hg : Nat.gcd p (p+1) = 1 := by
    rw [Nat.add_comm p 1, Nat.gcd_add_self_right]
    simp
  simpa only [hg, one_mul] using h

theorem two_apart_divisors_product_le (p v : ℕ) (hv : 0 < v)
    (h₀ : p ∣ v) (h₂ : p+2 ∣ v) : p*(p+2) ≤ 2*v := by
  have h := common_divisors_product_bound p (p+2) v hv h₀ h₂
  have hg : Nat.gcd p (p+2) ≤ 2 := by
    rw [Nat.add_comm p 2, Nat.gcd_add_self_right]
    exact Nat.gcd_le_right p (by decide)
  exact h.trans (Nat.mul_le_mul_right v hg)

theorem failed_endpoints_large_second (p b c : ℕ) (hp : 3 ≤ p)
    (hb : 0 < b) (hbc : b ≤ c) (hfail : ¬ TwoSpeedWindow p b c) :
    p*(p+2) ≤ 2*c := by
  have hc : 0 < c := hb.trans_le hbc
  have hdiv := failed_endpoints_divisibility p b c hp hfail
  have h₀ := hdiv p le_rfl (by omega)
  have h₁ := hdiv (p+1) (by omega) (by omega)
  have h₂ := hdiv (p+2) (by omega) le_rfl
  have hpair (v : ℕ) (hv : 0 < v)
      (h : (p ∣ v ∧ p+1 ∣ v) ∨ (p ∣ v ∧ p+2 ∣ v) ∨
        (p+1 ∣ v ∧ p+2 ∣ v)) : p*(p+2) ≤ 2*v := by
    rcases h with h | h | h
    · have hbound := consecutive_divisors_product_le p v hv h.1 h.2
      nlinarith
    · exact two_apart_divisors_product_le p v hv h.1 h.2
    · have hbound := consecutive_divisors_product_le (p+1) v hv h.1
        (by simpa only [Nat.add_assoc] using h.2)
      nlinarith
  by_cases hbp : (p ∣ b ∧ p+1 ∣ b) ∨ (p ∣ b ∧ p+2 ∣ b) ∨
      (p+1 ∣ b ∧ p+2 ∣ b)
  · exact (hpair b hb hbp).trans (Nat.mul_le_mul_left 2 hbc)
  · apply hpair c hc
    tauto

theorem divisor_eq_below_twice (d b : ℕ) (hd : 0 < d) (hb : 0 < b)
    (hsmall : b < 2*d) (hdiv : d ∣ b) : b = d := by
  obtain ⟨k, rfl⟩ := hdiv
  have hkpos : 0 < k := by
    by_contra h
    have hk : k = 0 := by omega
    simp [hk] at hb
  have hk2 : k < 2 := by nlinarith
  have hk : k = 1 := by omega
  simp [hk]

theorem large_first_measure_bound (p b c : ℕ) (hp : 3 ≤ p) (hb : 0 < b)
    (hbc : b ≤ c) (hlarge : smallBound p < b) :
    4/(p+2 : ℝ)+(p : ℝ)/b+(p : ℝ)/c < 1 := by
  have hd : 0 < p-2 := by omega
  have hprod : 2*p*(p+2) < b*(p-2) :=
    (Nat.div_lt_iff_lt_mul hd).mp hlarge
  have hpR : (3 : ℝ) ≤ p := by exact_mod_cast hp
  have hbR : (0 : ℝ) < b := by exact_mod_cast hb
  have hcR : (0 : ℝ) < c := by exact_mod_cast (hb.trans_le hbc)
  have hq : (0 : ℝ) < p+2 := by positivity
  have hprodR : (2 : ℝ)*p*(p+2) < (b : ℝ)*((p : ℝ)-2) := by
    have hcast : (2 : ℝ)*p*(p+2) < (b : ℝ)*((p-2 : ℕ) : ℝ) := by
      exact_mod_cast hprod
    simpa only [Nat.cast_sub (show 2 ≤ p by omega), Nat.cast_ofNat] using hcast
  have hsmall : 4/(p+2 : ℝ)+2*(p : ℝ)/b < 1 := by
    have heq : 4/(p+2 : ℝ)+2*(p : ℝ)/b =
        (4*(b : ℝ)+2*(p : ℝ)*(p+2))/((p+2 : ℝ)*(b : ℝ)) := by
      field_simp [hbR.ne', hq.ne'] <;> ring
    rw [heq]
    apply (div_lt_iff₀ (mul_pos hq hbR)).mpr
    nlinarith
  have hterm : (p : ℝ)/c ≤ (p : ℝ)/b :=
    div_le_div_of_nonneg_left (Nat.cast_nonneg p) hbR (by exact_mod_cast hbc)
  rw [mul_div_assoc] at hsmall
  linarith

theorem window_above_small_bound (p b c : ℕ) (hp : 3 ≤ p) (hb : 0 < b)
    (hbc : b ≤ c) (hlarge : smallBound p < b) : TwoSpeedWindow p b c :=
  window_of_measure p b c hp hb (hb.trans_le hbc)
    (large_first_measure_bound p b c hp hb hbc hlarge)

end Loneliness.TwoInsertions
