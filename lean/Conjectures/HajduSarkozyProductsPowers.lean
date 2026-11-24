import Conjectures.HajduSarkozyProductsFamily
import Mathlib.Analysis.PSeries

/-!
# Hajdu–Sárközy's shifted-product total primitivity conjecture

The full pair-of-exponents specialization. Unequal exponents give a
summable coefficient family by the real p-series theorem; equal exponents
collapse to the already verified single-power theorem. The smaller
exponent supplies the exact perturbation scale.
-/

open Classical Filter Finset Asymptotics
open scoped symmDiff

namespace Conjectures.HajduSarkozy.Products

noncomputable section

def shiftedProducts (k l : ℕ) (c : ℤ) : Set ℕ :=
  {n | 0 < n ∧ ∃ x : ℕ, 0 < x ∧ ∃ y : ℕ, 0 < y ∧
    (n : ℤ) = (x : ℤ)^k*(y : ℤ)^l+c}

theorem shiftedProducts_comm (k l : ℕ) (c : ℤ) :
    shiftedProducts k l c = shiftedProducts l k c := by
  ext n
  constructor <;> rintro ⟨hn, x, hx, y, hy, he⟩
  · exact ⟨hn, y, hy, x, hx, by simpa only [mul_comm] using he⟩
  · exact ⟨hn, y, hy, x, hx, by simpa only [mul_comm] using he⟩

theorem shiftedProducts_equal (k : ℕ) (c : ℤ) :
    shiftedProducts k k c = shiftedPowers k c := by
  ext n
  constructor
  · rintro ⟨hn, x, hx, y, hy, he⟩
    refine ⟨hn, x*y, Nat.mul_pos hx hy, ?_⟩
    simpa only [Nat.cast_mul, mul_pow] using he
  · rintro ⟨hn, x, hx, he⟩
    exact ⟨hn, x, hx, 1, by norm_num, by simpa only [Nat.cast_one, one_pow, mul_one] using he⟩

theorem shiftedPowers_subset_products (k l : ℕ) (c : ℤ) :
    shiftedPowers k c ⊆ shiftedProducts k l c := by
  rintro n ⟨hn, x, hx, he⟩
  exact ⟨hn, x, hx, 1, by norm_num, by simpa only [Nat.cast_one, one_pow, mul_one] using he⟩

theorem coefficientWeight_power (k l n : ℕ) (hn : 0 < n) :
    coefficientWeight k (n^l) = (n : ℝ)^(-(l : ℝ)/(k : ℝ)) := by
  rw [coefficientWeight, ite_eq_right (pow_ne_zero l hn.ne')]
  simp only [Nat.cast_pow]
  rw [← Real.rpow_natCast (n : ℝ) l, ← Real.rpow_mul (Nat.cast_nonneg n)]
  congr 1
  ring

theorem power_coefficients_summable {k l : ℕ} (hk : 0 < k) (hkl : k < l) :
    Summable (fun i : ℕ => coefficientWeight k ((i+1)^l)) := by
  have hkR : (0 : ℝ) < k := by exact_mod_cast hk
  have hklR : (k : ℝ) < l := by exact_mod_cast hkl
  have hp : -(l : ℝ)/(k : ℝ) < -1 := (div_lt_iff₀ hkR).mpr (by linarith)
  have hs := (Real.summable_nat_rpow (p := -(l : ℝ)/(k : ℝ))).mpr hp
  have hs' := (summable_nat_add_iff 1).mpr hs
  apply hs'.congr
  intro i
  exact (coefficientWeight_power k l (i+1) (by omega)).symm

theorem power_family_eq_products (k l : ℕ) (c : ℤ) :
    familyPowers k c (fun i => (i+1)^l) = shiftedProducts k l c := by
  ext n
  constructor
  · rintro ⟨i, _, hn, x, hx, he⟩
    refine ⟨hn, x, hx, i+1, by omega, ?_⟩
    simpa only [Nat.cast_pow, mul_comm] using he
  · rintro ⟨hn, x, hx, y, hy, he⟩
    have heY : y-1+1 = y := by omega
    refine ⟨y-1, ?_, hn, x, hx, ?_⟩
    · change 0 < (y-1+1)^l
      rw [heY]
      exact pow_pos hy l
    change (n : ℤ) = ((y-1+1)^l : ℕ)*(x : ℤ)^k+c
    rw [heY]
    simpa only [Nat.cast_pow, mul_comm] using he

theorem shiftedPowers_not_sparse {k : ℕ} (hk : 0 < k) (c : ℤ) :
    ¬ Sparse k (shiftedPowers k c) := by
  intro hS
  have hgrid := sparse_scaled_grid (ρ := 2) (t := 1) hS (by norm_num) zero_lt_one
  simp only [one_mul] at hgrid
  exact shiftedPowers_not_grid_isLittleO hk (rootRatio_gt_one hk (by norm_num : (1 : ℝ) < 2))
    (by norm_num : (1 : ℝ) < 2) (rootRatio_pow hk (by norm_num)) hgrid

theorem retained_not_sparse_of_error {k : ℕ} {P R : Set ℕ}
    (hP : ¬ Sparse k P) (herror : Sparse k (R ∆ P)) : ¬ Sparse k (R ∩ P) := by
  intro hretained
  apply hP
  apply sparse_mono _ (sparse_union hretained herror)
  intro n hn
  by_cases hR : n ∈ R
  · exact Or.inl ⟨hR, hn⟩
  · exact Or.inr (Or.inr ⟨hn, hR⟩)

theorem ordered_shifted_product_perturbations {k l : ℕ} {c : ℤ}
    (hk : 2 ≤ k) (hl : 2 ≤ l) (hkl : k ≤ l) (hc : c ≠ 0) (R : Set ℕ)
    (herror : Sparse k (R ∆ shiftedProducts k l c)) : TotallyMPrimitive R := by
  by_cases heq : k = l
  · subst l
    rw [shiftedProducts_equal] at herror
    exact shiftedPowerPerturbations hk hc R herror
  · have hlt : k < l := by omega
    have hsum := power_coefficients_summable (by omega : 0 < k) hlt
    have herror' : Sparse k (R ∆ familyPowers k c (fun i => (i+1)^l)) := by
      simpa only [power_family_eq_products] using herror
    have hP : ¬ Sparse k (familyPowers k c (fun i => (i+1)^l)) := by
      rw [power_family_eq_products]
      intro hs
      exact shiftedPowers_not_sparse (by omega) c (sparse_mono (shiftedPowers_subset_products k l c) hs)
    apply summable_family_total_of_not_sparse hk hc (fun i => (i+1)^l) hsum R
    · exact sparse_mono (fun _ hn => Or.inl hn) herror'
    · exact retained_not_sparse_of_error hP herror'

/-- Every exponent pair, every nonzero integral shift, and the exact minimum-exponent error scale. -/
theorem shifted_product_perturbations {k l : ℕ} {c : ℤ}
    (hk : 2 ≤ k) (hl : 2 ≤ l) (hc : c ≠ 0) (R : Set ℕ)
    (herror : Sparse (min k l) (R ∆ shiftedProducts k l c)) : TotallyMPrimitive R := by
  rcases le_total k l with hkl | hlk
  · apply ordered_shifted_product_perturbations hk hl hkl hc R
    simpa only [min_eq_left hkl] using herror
  · apply ordered_shifted_product_perturbations hl hk hlk hc R
    simpa only [min_eq_right hlk, shiftedProducts_comm k l c] using herror

end

end Conjectures.HajduSarkozy.Products
