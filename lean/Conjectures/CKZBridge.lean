import Conjectures.CKZLowSeries
import Conjectures.CKZUpstream.D5.S1.Words.Patterns.Separable.RecordAllIndex

/-! Bridge the actual-permutation counts to the certified series. Several low-coefficient and cardinality arguments are adapted from the Apache-2.0 trureturing sources pinned in CKZUpstream/PROVENANCE.md. -/
set_option linter.unusedSimpArgs false

namespace CKZBridge
open D5.S1.Words.Patterns.Separable.RecordPeak
open D5.S1.Words.Patterns.Separable.ActualCardinality
open D5.S1.Words.Patterns.Separable.MinimumCutKernel
open D5.S1.Words.Patterns.Separable.CutFactorization
open D5.S1.Words.Patterns.Separable.RecordTransport
open D5.S1.Words.Patterns.Separable.RecordFirstDecline
open D5.S1.Words.Patterns.Separable.RecordAllIndex

theorem q_eq_map : q = PowerSeries.map (Int.castRingHom ℚ) CKZComposition.R := by
  ext n
  cases n with
  | zero => simp [q, CKZComposition.R_coeff, CKZ.schroder]
  | succ n =>
    have h := actual_schroder_cardinality.2.1 (n+1) (by omega)
    simp [q, PowerSeries.coeff_map, CKZComposition.R_coeff, CKZ.schroder, h]

noncomputable def F1q : PowerSeries ℚ := PowerSeries.X*(1+q)
noncomputable def F2q : PowerSeries ℚ := PowerSeries.X^2*(1+q)^3
noncomputable def F3q : PowerSeries ℚ := PowerSeries.X^3*(1+q)^4*(1+2*q)
noncomputable def H2q : PowerSeries ℚ := PowerSeries.X^2*q*(1+q)^2

theorem map_F1 : PowerSeries.map (Int.castRingHom ℚ) CKZLowSeries.F1 = F1q := by
  simp [CKZLowSeries.F1, CKZLowSeries.t, F1q, q_eq_map]

theorem map_F2 : PowerSeries.map (Int.castRingHom ℚ) CKZLowSeries.F2 = F2q := by
  simp [CKZLowSeries.F2, CKZLowSeries.t, F2q, q_eq_map]

theorem map_F3 : PowerSeries.map (Int.castRingHom ℚ) CKZLowSeries.F3 = F3q := by
  simp [CKZLowSeries.F3, CKZLowSeries.t, F3q, q_eq_map, map_ofNat]

theorem map_H2 : PowerSeries.map (Int.castRingHom ℚ) CKZLowSeries.H2 = H2q := by
  simp [CKZLowSeries.H2, CKZLowSeries.t, H2q, q_eq_map]

theorem low1_coeff (n : ℕ) (hn : n ≠ 1) : PowerSeries.coeff n F1q ≤ PowerSeries.coeff n F2q := by
  rw [← map_F1, ← map_F2, PowerSeries.coeff_map, PowerSeries.coeff_map]
  change ((PowerSeries.coeff n CKZLowSeries.F1 : ℤ) : ℚ) ≤ ((PowerSeries.coeff n CKZLowSeries.F2 : ℤ) : ℚ)
  exact_mod_cast CKZLowSeries.low1_coeff n hn

theorem low2_coeff (n : ℕ) : PowerSeries.coeff n F3q ≤ PowerSeries.coeff n F2q := by
  rw [← map_F3, ← map_F2, PowerSeries.coeff_map, PowerSeries.coeff_map]
  change ((PowerSeries.coeff n CKZLowSeries.F3 : ℤ) : ℚ) ≤ ((PowerSeries.coeff n CKZLowSeries.F2 : ℤ) : ℚ)
  exact_mod_cast CKZLowSeries.low2_coeff n

theorem low3_coeff (n : ℕ) : PowerSeries.coeff n H2q ≤ PowerSeries.coeff n F1q := by
  rw [← map_H2, ← map_F1, PowerSeries.coeff_map, PowerSeries.coeff_map]
  change ((PowerSeries.coeff n CKZLowSeries.H2 : ℤ) : ℚ) ≤ ((PowerSeries.coeff n CKZLowSeries.F1 : ℤ) : ℚ)
  exact_mod_cast CKZLowSeries.low3_coeff n

theorem J0 : PowerSeries.coeff 0 J = 0 := by
  change PowerSeries.coeff 0 (PowerSeries.mk (fun k => PowerSeries.mk (fun n =>
    if n = 0 then 0 else (signedCount false n k : ℚ)))) = 0
  simp only [PowerSeries.coeff_mk]
  apply PowerSeries.ext
  intro n
  simp only [PowerSeries.coeff_mk, map_zero]
  by_cases hn : n = 0
  · simp [hn]
  · have h := (actual_four_record_transports_and_rising.2.1 n (by omega)).1
    simp only [irreducibleCount, ite_eq_right hn] at h
    simp [hn, signedCount, h]

theorem normalizedJ : J =
      PowerSeries.C (PowerSeries.X : PowerSeries ℚ) * PowerSeries.X +
      PowerSeries.C (PowerSeries.X * (1+q)) * (PowerSeries.X * J) +
      PowerSeries.C (q * (1+q)) * J^2 := by
  calc
    J = z + z * (1 + PowerSeries.C q) * J + PowerSeries.C q * (1 + PowerSeries.C q) * J^2 :=
      actual_four_record_first_decline.2.2.1
    _ = _ := by simp only [map_mul, map_add, map_one, z]; ring

theorem J1 : PowerSeries.coeff 1 J = PowerSeries.X := by
  have h := congrArg (PowerSeries.coeff 1) normalizedJ
  simp only [map_add, PowerSeries.coeff_C_mul, PowerSeries.coeff_X,
    PowerSeries.coeff_succ_X_mul, J0, mul_zero] at h
  simp only [pow_two, PowerSeries.coeff_mul,
    Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk, Finset.sum_range_succ,
    Finset.sum_range_zero, Nat.zero_add, Nat.sub_zero, J0,
    zero_mul, add_zero, zero_add] at h
  have J0' : PowerSeries.constantCoeff J = 0 := by
    rw [← PowerSeries.coeff_zero_eq_constantCoeff_apply, J0]
  norm_num at h
  simpa [J0'] using h
theorem J2 : PowerSeries.coeff 2 J = PowerSeries.X^2 * (1+q)^2 := by
  have h := congrArg (PowerSeries.coeff 2) normalizedJ
  simp only [map_add, PowerSeries.coeff_C_mul, PowerSeries.coeff_X,
    show ¬(2 = 1) by omega, mul_zero,
    PowerSeries.coeff_succ_X_mul, J1] at h
  simp only [pow_two, PowerSeries.coeff_mul,
    Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk, Finset.sum_range_succ,
    Finset.sum_range_zero, Nat.zero_add, Nat.sub_zero, Nat.sub_self, J0, J1,
    zero_mul, mul_zero, add_zero, zero_add] at h
  norm_num at h
  rw [J1] at h
  linear_combination h
theorem J3 : PowerSeries.coeff 3 J = PowerSeries.X^3 * (1+q)^3 * (1+2*q) := by
  have h := congrArg (PowerSeries.coeff 3) normalizedJ
  simp only [map_add, PowerSeries.coeff_C_mul, PowerSeries.coeff_X,
    show ¬(3 = 1) by omega, ite_false, mul_zero,
    PowerSeries.coeff_succ_X_mul, J2] at h
  norm_num only [pow_two, PowerSeries.coeff_mul,
    Finset.Nat.sum_antidiagonal_eq_sum_range_succ_mk, Finset.sum_range_succ,
    Finset.sum_range_zero, Nat.zero_add, Nat.sub_zero, Nat.sub_self, J0, J1, J2,
    zero_mul, mul_zero, add_zero, zero_add] at h
  linear_combination h

theorem U_factor : U = PowerSeries.C (1+q) * J := by
  simpa only [map_add, map_one] using actual_four_record_first_decline.1

theorem U1 : PowerSeries.coeff 1 U = F1q := by
  rw [U_factor, PowerSeries.coeff_C_mul, J1]
  simp [F1q, mul_comm]

theorem U2 : PowerSeries.coeff 2 U = F2q := by
  rw [U_factor, PowerSeries.coeff_C_mul, J2]
  dsimp [F2q]
  ring

theorem U3 : PowerSeries.coeff 3 U = F3q := by
  rw [U_factor, PowerSeries.coeff_C_mul, J3]
  dsimp [F3q]
  ring

theorem proper2 : PowerSeries.coeff 2 R = H2q := by
  rw [actual_four_record_first_decline.2.1, PowerSeries.coeff_C_mul, J2]
  dsimp [H2q]
  ring

theorem coeff_U (n k : ℕ) (hn : n ≠ 0) :
    PowerSeries.coeff n (PowerSeries.coeff k U) = (allCount n k : ℚ) := by
  change PowerSeries.coeff n (PowerSeries.coeff k (PowerSeries.mk (fun j => PowerSeries.mk (fun d =>
    if d = 0 then 0 else (allCount d j : ℚ))))) = _
  simp [hn]

theorem coeff_proper (n k : ℕ) (hn : n ≠ 0) :
    PowerSeries.coeff n (PowerSeries.coeff k R) = (properCount false n k : ℚ) := by
  change PowerSeries.coeff n (PowerSeries.coeff k (PowerSeries.mk (fun j => PowerSeries.mk (fun d =>
    if d = 0 then 0 else (properCount false d j : ℚ))))) = _
  simp [hn]

theorem actual_low1 (n : ℕ) (hn : 2 ≤ n) : allCount n 1 ≤ allCount n 2 := by
  have h := low1_coeff n (by omega)
  rw [← U1, ← U2, coeff_U n 1 (by omega), coeff_U n 2 (by omega)] at h
  exact_mod_cast h

theorem actual_low2 (n : ℕ) (hn : 0 < n) : allCount n 3 ≤ allCount n 2 := by
  have h := low2_coeff n
  rw [← U3, ← U2, coeff_U n 3 (by omega), coeff_U n 2 (by omega)] at h
  exact_mod_cast h

theorem actual_low3 (n : ℕ) (hn : 0 < n) : properCount false n 2 ≤ allCount n 1 := by
  have h := low3_coeff n
  rw [← proper2, ← U1, coeff_proper n 2 (by omega), coeff_U n 1 (by omega)] at h
  exact_mod_cast h

theorem proper1 : PowerSeries.coeff 1 R = PowerSeries.X*q := by
  rw [actual_four_record_first_decline.2.1, PowerSeries.coeff_C_mul, J1]
  ring

theorem actual_one_counts (n : ℕ) (hn : 2 ≤ n) : allCount n 1 = properCount false n 1 := by
  have h : PowerSeries.coeff n (PowerSeries.coeff 1 U) =
      PowerSeries.coeff n (PowerSeries.coeff 1 R) := by
    rw [U1, proper1]
    simp only [F1q]
    have hx : PowerSeries.coeff n (PowerSeries.X : PowerSeries ℚ) = 0 := by
      rw [PowerSeries.coeff_X, ite_eq_right (by omega : n ≠ 1)]
    have e : (PowerSeries.X : PowerSeries ℚ) * (1+q) = PowerSeries.X + PowerSeries.X*q := by ring
    rw [e, map_add, hx, zero_add]
  rw [coeff_U n 1 (by omega), coeff_proper n 1 (by omega)] at h
  exact_mod_cast h

theorem actual_proper_first_decline (n : ℕ) (hn : 2 ≤ n) :
    properCount false n 2 ≤ properCount false n 1 := by
  rw [← actual_one_counts n hn]
  exact actual_low3 n (by omega)

def Nonneg (f : PowerSeries ℚ) : Prop := ∀ n, 0 ≤ PowerSeries.coeff n f

theorem nonneg_mul {f g : PowerSeries ℚ} (hf : Nonneg f) (hg : Nonneg g) : Nonneg (f*g) := by
  intro n
  rw [PowerSeries.coeff_mul]
  exact Finset.sum_nonneg fun ij _ => mul_nonneg (hf ij.1) (hg ij.2)

theorem q_nonneg : Nonneg q := by
  intro n
  rw [q_eq_map, PowerSeries.coeff_map, CKZComposition.R_coeff]
  change (0 : ℚ) ≤ ((CKZ.schroder n : ℕ) : ℚ)
  exact Nat.cast_nonneg _

theorem one_add_q_nonneg : Nonneg (1+q) := by
  intro n
  simp only [map_add]
  exact add_nonneg (by rw [PowerSeries.coeff_one]; split_ifs <;> norm_num) (q_nonneg n)

theorem J_difference_nonneg (k : ℕ) (hk : 3 ≤ k) :
    Nonneg (PowerSeries.coeff k J - PowerSeries.coeff (k+1) J) := by
  intro n
  simp only [map_sub]
  have coeff_J (j : ℕ) : PowerSeries.coeff n (PowerSeries.coeff j J) =
      if n = 0 then 0 else (signedCount false n j : ℚ) := by
    change PowerSeries.coeff n (PowerSeries.coeff j (PowerSeries.mk (fun k => PowerSeries.mk (fun d =>
      if d = 0 then 0 else (signedCount false d k : ℚ))))) = _
    simp
  rw [coeff_J, coeff_J]
  by_cases hn : n = 0
  · simp [hn]
  · have h := actual_rmax_decline n k hk
    simp only [irreducibleCount, ite_eq_right hn] at h
    simp only [ite_eq_right hn]
    have h' : (signedCount false n (k+1) : ℚ) ≤ signedCount false n k := by
      exact_mod_cast h
    linarith

theorem U_tail_nonneg (k : ℕ) (hk : 3 ≤ k) :
    Nonneg (PowerSeries.coeff k U - PowerSeries.coeff (k+1) U) := by
  rw [U_factor, PowerSeries.coeff_C_mul, PowerSeries.coeff_C_mul, ← mul_sub]
  exact nonneg_mul one_add_q_nonneg (J_difference_nonneg k hk)

theorem proper_tail_nonneg (k : ℕ) (hk : 3 ≤ k) :
    Nonneg (PowerSeries.coeff k R - PowerSeries.coeff (k+1) R) := by
  rw [actual_four_record_first_decline.2.1, PowerSeries.coeff_C_mul, PowerSeries.coeff_C_mul, ← mul_sub]
  exact nonneg_mul q_nonneg (J_difference_nonneg k hk)

theorem actual_all_tail (n k : ℕ) (hn : 0 < n) (hk : 3 ≤ k) :
    allCount n (k+1) ≤ allCount n k := by
  have h := U_tail_nonneg k hk n
  simp only [map_sub] at h
  rw [coeff_U n k (by omega), coeff_U n (k+1) (by omega)] at h
  exact_mod_cast (show (allCount n (k+1) : ℚ) ≤ allCount n k by linarith)

theorem actual_proper_tail (n k : ℕ) (hn : 0 < n) (hk : 3 ≤ k) :
    properCount false n (k+1) ≤ properCount false n k := by
  have h := proper_tail_nonneg k hk n
  simp only [map_sub] at h
  rw [coeff_proper n k (by omega), coeff_proper n (k+1) (by omega)] at h
  exact_mod_cast (show (properCount false n (k+1) : ℚ) ≤ properCount false n k by linarith)

theorem I0_nonneg : Nonneg I0 := by
  intro n
  simp only [I0, PowerSeries.coeff_mk]
  split_ifs <;> positivity

theorem proper_second_nonneg : Nonneg (PowerSeries.coeff 2 R - PowerSeries.coeff 3 R) := by
  rw [actual_four_record_first_decline.2.2.2.1]
  change Nonneg (PowerSeries.coeff 2 (PowerSeries.C I0 * U) - PowerSeries.coeff 3 (PowerSeries.C I0 * U))
  rw [PowerSeries.coeff_C_mul, PowerSeries.coeff_C_mul, U2, U3, ← mul_sub]
  apply nonneg_mul I0_nonneg
  intro n
  simp only [map_sub]
  have h := low2_coeff n
  linarith

theorem actual_proper_second_decline (n : ℕ) (hn : 0 < n) :
    properCount false n 3 ≤ properCount false n 2 := by
  have h := proper_second_nonneg n
  simp only [map_sub] at h
  rw [coeff_proper n 2 (by omega), coeff_proper n 3 (by omega)] at h
  exact_mod_cast (show (properCount false n 3 : ℚ) ≤ properCount false n 2 by linarith)

theorem partition (n k : ℕ) (stat : Equiv.Perm (Fin n) → ℕ) (hn : n ≠ 0) :
    allStatCount n stat k = irreducibleCount n stat k + reducibleCount n stat k := by
  classical
  simp only [irreducibleCount, reducibleCount, ite_eq_right hn]
  let sign := false
  let P (π : Avoider n) := HasProperCut sign π.val
  let F (π : Avoider n) := stat π.val = k
  let e : {π : Avoider n // F π} ≃
      {π : Indecomposable sign n // stat π.val.val = k} ⊕
      {π : ProperSigned sign n // stat π.val.val = k} :=
    (Equiv.sumCompl (fun π : {π : Avoider n // F π} => ¬P π.val)).symm.trans
      (Equiv.sumCongr
        { toFun := fun π => ⟨⟨π.val.val, π.property⟩, π.val.property⟩
          invFun := fun π => ⟨⟨π.val.val, π.property⟩, π.val.property⟩
          left_inv := fun _ => rfl
          right_inv := fun _ => rfl }
        { toFun := fun π => ⟨⟨π.val.val, not_not.mp π.property⟩, π.val.property⟩
          invFun := fun π => ⟨⟨π.val.val, π.property⟩, not_not.mpr π.val.property⟩
          left_inv := fun _ => rfl
          right_inv := fun _ => rfl })
  exact (Nat.card_congr e).trans Nat.card_sum

theorem other_equalities (n k : ℕ) (hn : 2 ≤ n) :
    reducibleCount n lmin k = properCount false n k ∧
    irreducibleCount n lmax k = properCount false n k ∧
    irreducibleCount n rmin k = properCount false n k := by
  have hsym := actual_four_record_transports_and_rising.2.2.2.2 n k
  have htrans := actual_four_record_transports_and_rising.1 n k
  simp only [show ¬(n = 1 ∧ k = 1) by omega, ite_false, add_zero] at htrans
  have pR := partition n k rmax (by omega)
  have pL := partition n k lmin (by omega)
  have pM := partition n k lmax (by omega)
  have pm := partition n k rmin (by omega)
  change allCount n k = irreducibleCount n rmax k + properCount false n k at pR
  rw [hsym.1] at pL
  rw [hsym.2.1] at pM
  rw [hsym.2.2] at pm
  omega

theorem actual_all_zero (n : ℕ) (hn : 0 < n) : allCount n 0 = 0 := by
  have h : PowerSeries.coeff 0 U = 0 := by rw [U_factor, PowerSeries.coeff_C_mul, J0, mul_zero]
  have h' := congrArg (PowerSeries.coeff n) h
  rw [coeff_U n 0 (by omega)] at h'
  simpa using h'

theorem all_right_maxima_unimodal (n : ℕ) (hn : 3 ≤ n) :
    (∀ k, k < 2 → allCount n k ≤ allCount n (k+1)) ∧
    (∀ k, 2 ≤ k → allCount n (k+1) ≤ allCount n k) := by
  constructor
  · intro k hk
    interval_cases k
    · rw [actual_all_zero n (by omega)]
      exact Nat.zero_le _
    · exact actual_low1 n (by omega)
  · intro k hk
    by_cases h : k = 2
    · subst k
      exact actual_low2 n (by omega)
    · exact actual_all_tail n k (by omega) (by omega)

theorem proper_right_maxima_decreasing (n : ℕ) (hn : 2 ≤ n) :
    ∀ k, 1 ≤ k → properCount false n (k+1) ≤ properCount false n k := by
  intro k hk
  by_cases h1 : k = 1
  · subst k
    exact actual_proper_first_decline n hn
  by_cases h2 : k = 2
  · subst k
    exact actual_proper_second_decline n (by omega)
  · exact actual_proper_tail n k (by omega) (by omega)

theorem four_records_unimodal (n : ℕ) (hn : 3 ≤ n) :
    (∀ k, k < 2 →
      allStatCount n rmax k ≤ allStatCount n rmax (k+1) ∧
      allStatCount n lmin k ≤ allStatCount n lmin (k+1) ∧
      allStatCount n lmax k ≤ allStatCount n lmax (k+1) ∧
      allStatCount n rmin k ≤ allStatCount n rmin (k+1)) ∧
    (∀ k, 2 ≤ k →
      allStatCount n rmax (k+1) ≤ allStatCount n rmax k ∧
      allStatCount n lmin (k+1) ≤ allStatCount n lmin k ∧
      allStatCount n lmax (k+1) ≤ allStatCount n lmax k ∧
      allStatCount n rmin (k+1) ≤ allStatCount n rmin k) := by
  have hr := all_right_maxima_unimodal n hn
  have hs (k : ℕ) := actual_four_record_transports_and_rising.2.2.2.2 n k
  constructor
  · intro k hk
    have h := hr.1 k hk
    change allCount n k ≤ allCount n (k+1) at h
    have e : allStatCount n rmax k = allCount n k := rfl
    have e' : allStatCount n rmax (k+1) = allCount n (k+1) := rfl
    rw [e, e', (hs k).1, (hs k).2.1, (hs k).2.2,
      (hs (k+1)).1, (hs (k+1)).2.1, (hs (k+1)).2.2]
    exact ⟨h,h,h,h⟩
  · intro k hk
    have h := hr.2 k hk
    have e : allStatCount n rmax k = allCount n k := rfl
    have e' : allStatCount n rmax (k+1) = allCount n (k+1) := rfl
    rw [e, e', (hs k).1, (hs k).2.1, (hs k).2.2,
      (hs (k+1)).1, (hs (k+1)).2.1, (hs (k+1)).2.2]
    exact ⟨h,h,h,h⟩

theorem four_class_decreasing_of_two (n : ℕ) (hn : 2 ≤ n) :
    ∀ k, 1 ≤ k →
      reducibleCount n rmax (k+1) ≤ reducibleCount n rmax k ∧
      reducibleCount n lmin (k+1) ≤ reducibleCount n lmin k ∧
      irreducibleCount n lmax (k+1) ≤ irreducibleCount n lmax k ∧
      irreducibleCount n rmin (k+1) ≤ irreducibleCount n rmin k := by
  intro k hk
  have h := proper_right_maxima_decreasing n hn k hk
  have eqs := other_equalities n k hn
  have eqs' := other_equalities n (k+1) hn
  change properCount false n (k+1) ≤ properCount false n k ∧ _
  rw [eqs.1, eqs.2.1, eqs.2.2, eqs'.1, eqs'.2.1, eqs'.2.2]
  exact ⟨h,h,h,h⟩

theorem singletonRecords (π : Equiv.Perm (Fin 1)) :
    rmax π = 1 ∧ lmin π = 1 ∧ lmax π = 1 ∧ rmin π = 1 := by
  have noComparison : ∀ i j : Fin 1, ¬i < j := by
    intro i j
    simp only [Fin.lt_def]
    omega
  have hr : ∀ i, IsRightMaximum π i := fun i j h => (noComparison i j h).elim
  have hl : ∀ i, IsLeftMinimum π i := fun i j h => (noComparison j i h).elim
  have hm : ∀ i, IsLeftMaximum π i := fun i j h => (noComparison j i h).elim
  have hn : ∀ i, IsRightMinimum π i := fun i j h => (noComparison i j h).elim
  simp [rmax, lmin, lmax, rmin, hr, hl, hm, hn]

theorem singleton_irreducible_tail (stat : Equiv.Perm (Fin 1) → ℕ)
    (hs : ∀ π, stat π = 1) (k : ℕ) (hk : 1 ≤ k) :
    irreducibleCount 1 stat (k+1) = 0 := by
  simp only [irreducibleCount, Nat.one_ne_zero, ite_false]
  have : IsEmpty {π : Indecomposable false 1 // stat π.val.val = k+1} :=
    ⟨fun π => by have h := hs π.val.val.val; rw [π.property] at h; omega⟩
  exact Nat.card_of_isEmpty

theorem singleton_reducible (stat : Equiv.Perm (Fin 1) → ℕ) (k : ℕ) :
    reducibleCount 1 stat k = 0 := by
  have : IsEmpty {π : ProperSigned false 1 // stat π.val.val = k} :=
    ⟨fun π => by obtain ⟨c, hp, hb, _⟩ := π.val.property; omega⟩
  exact Nat.card_of_isEmpty

theorem four_class_decreasing (n : ℕ) (hn : 0 < n) :
    ∀ k, 1 ≤ k →
      reducibleCount n rmax (k+1) ≤ reducibleCount n rmax k ∧
      reducibleCount n lmin (k+1) ≤ reducibleCount n lmin k ∧
      irreducibleCount n lmax (k+1) ≤ irreducibleCount n lmax k ∧
      irreducibleCount n rmin (k+1) ≤ irreducibleCount n rmin k := by
  by_cases h : n = 1
  · subst n
    intro k hk
    rw [singleton_reducible rmax (k+1), singleton_reducible lmin (k+1),
      singleton_irreducible_tail lmax (fun π => (singletonRecords π).2.2.1) k hk,
      singleton_irreducible_tail rmin (fun π => (singletonRecords π).2.2.2) k hk]
    exact ⟨Nat.zero_le _, Nat.zero_le _, Nat.zero_le _, Nat.zero_le _⟩
  · exact four_class_decreasing_of_two n (by omega)

end CKZBridge
