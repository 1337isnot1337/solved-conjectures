import Conjectures.LonelinessPrefixProductTables
import Mathlib.Data.BitVec
import Mathlib.Data.Fin.Tuple.Sort
import Mathlib.Algebra.BigOperators.Fin

/-! Exact linear certificates for the KZ product bounds. A certificate is a
nonnegative integer combination of the original prefix and adjacent-ratio
inequalities. Its coefficient identity and constant term are checked by the
kernel; the linear-programming producer is not trusted. -/

open scoped BigOperators

namespace Loneliness.KZProduct

def kzBound (k r : ℕ) : ℚ :=
  4 * (1 / (k+1-r : ℕ) - 1 / (k+1 : ℕ))^2

theorem increment_eq_difference (k i : ℕ) :
    PrefixProduct.kzIncrement k i = kzBound k (i+1) - kzBound k i := by
  have he : k+1-(i+1) = k-i := by omega
  simp only [PrefixProduct.kzIncrement,kzBound,he]
  ring

theorem increment_prefix_sum (k r : ℕ) :
    ∑ i ∈ Finset.range r, PrefixProduct.kzIncrement k i = kzBound k r := by
  induction r with
  | zero => simp [kzBound]
  | succ r ih => rw [Finset.sum_range_succ,ih,increment_eq_difference]; ring

def selectedCount {d : ℕ} (s : Fin d → Bool) : ℕ :=
  (Finset.univ.filter (fun i => s i)).card

def coefficient (d : ℕ) (r : Fin (2*d)) (i : Fin d) : ℤ :=
  if r.val < d then if i.val ≤ r.val then 1 else 0
  else if r.val-d+1 < d then
    (if i.val = r.val-d+1 then 4 else 0) - (if i.val = r.val-d then 3 else 0)
  else 0

def constraintBound (d : ℕ) (bounds : ℕ → ℕ) (r : Fin (2*d)) : ℕ :=
  if r.val < d then bounds (r.val+1) else 0

structure DualRow where
  denominator : ℕ
  weights : Array ℕ
  deriving Inhabited

def DualRow.weight (row : DualRow) (r : ℕ) : ℕ := row.weights[r]?.getD 0

def DualValid (d : ℕ) (bounds : ℕ → ℕ) (s : Fin d → Bool) (row : DualRow) : Prop :=
  0 < row.denominator ∧
  (∀ i : Fin d, (∑ r : Fin (2*d), (row.weight r : ℤ) * coefficient d r i) =
    if s i then (row.denominator : ℤ) else 0) ∧
  row.denominator * bounds (selectedCount s) ≤
    ∑ r : Fin (2*d), row.weight r * constraintBound d bounds r

instance (d : ℕ) (bounds : ℕ → ℕ) (s : Fin d → Bool) (row : DualRow) :
    Decidable (DualValid d bounds s row) := by
  unfold DualValid
  infer_instance

theorem dual_sound {d : ℕ} (bounds : ℕ → ℕ) (D : ℕ) (hD : 0 < D)
    (s : Fin d → Bool) (row : DualRow) (hrow : DualValid d bounds s row)
    (t : Fin d → ℝ)
    (hconstraints : ∀ r : Fin (2*d), (constraintBound d bounds r : ℝ)/D ≤
      ∑ i : Fin d, (coefficient d r i : ℝ)*t i) :
    (bounds (selectedCount s) : ℝ)/D ≤ ∑ i : Fin d, if s i then t i else 0 := by
  have hDR : (0 : ℝ) < D := by exact_mod_cast hD
  have hqR : (0 : ℝ) < row.denominator := by exact_mod_cast hrow.1
  have hcoeff (i : Fin d) :
      (∑ r : Fin (2*d), (row.weight r : ℝ) * (coefficient d r i : ℝ)) =
        if s i then (row.denominator : ℝ) else 0 := by
    exact_mod_cast hrow.2.1 i
  have hnum : (row.denominator : ℝ) * bounds (selectedCount s) ≤
      ∑ r : Fin (2*d), (row.weight r : ℝ) * (constraintBound d bounds r : ℝ) := by
    exact_mod_cast hrow.2.2
  have hsum := Finset.sum_le_sum (s := Finset.univ)
    (fun r _ => mul_le_mul_of_nonneg_left (hconstraints r) (Nat.cast_nonneg (row.weight r)))
  have hright : (∑ r : Fin (2*d), (row.weight r : ℝ) *
      ∑ i : Fin d, (coefficient d r i : ℝ)*t i) =
      (row.denominator : ℝ) * ∑ i : Fin d, if s i then t i else 0 := by
    simp_rw [Finset.mul_sum]
    rw [Finset.sum_comm]
    calc
      _ = ∑ i : Fin d, (∑ r : Fin (2*d),
          (row.weight r : ℝ)*(coefficient d r i : ℝ))*t i := by
        apply Finset.sum_congr rfl
        intro i hi
        rw [Finset.sum_mul]
        apply Finset.sum_congr rfl
        intro r hr
        ring
      _ = ∑ i : Fin d, (if s i then (row.denominator : ℝ) else 0)*t i := by
        simp_rw [hcoeff]
      _ = _ := by
        apply Finset.sum_congr rfl
        intro i hi
        split <;> simp_all
  rw [hright] at hsum
  apply (mul_le_mul_iff_right₀ hqR).mp
  calc
    (row.denominator : ℝ) * ((bounds (selectedCount s) : ℝ)/D) =
        ((row.denominator : ℝ) * bounds (selectedCount s))/D := by ring
    _ ≤ (∑ r : Fin (2*d), (row.weight r : ℝ) * constraintBound d bounds r)/D :=
      (div_le_div_iff_of_pos_right hDR).mpr hnum
    _ = ∑ r : Fin (2*d), (row.weight r : ℝ) * ((constraintBound d bounds r : ℝ)/D) := by
      rw [Finset.sum_div]
      apply Finset.sum_congr rfl
      intro r hr
      ring
    _ ≤ _ := hsum

theorem exists_mask {d : ℕ} (s : Fin d → Bool) :
    ∃ m : Fin (2^d), ∀ i : Fin d, m.val.testBit i.val = s i := by
  let v := BitVec.ofBoolListLE (List.ofFn s)
  have hlt : v.toNat < 2^d := by simpa [v] using v.isLt
  refine ⟨⟨v.toNat,hlt⟩,?_⟩
  intro i
  change v.getLsbD i.val = s i
  change (BitVec.ofBoolListLE (List.ofFn s)).getLsbD i.val = s i
  rw [BitVec.getLsbD_ofBoolListLE]
  rw [← List.getElem_eq_getD (h := by simp) false]
  simp

theorem all_masks_sound {d : ℕ} (bounds : ℕ → ℕ) (D : ℕ) (hD : 0 < D)
    (rows : Fin (2^d) → DualRow)
    (hrows : ∀ m : Fin (2^d), DualValid d bounds (fun i => m.val.testBit i.val) (rows m))
    (t : Fin d → ℝ)
    (hconstraints : ∀ r : Fin (2*d), (constraintBound d bounds r : ℝ)/D ≤
      ∑ i : Fin d, (coefficient d r i : ℝ)*t i) (s : Fin d → Bool) :
    (bounds (selectedCount s) : ℝ)/D ≤ ∑ i : Fin d, if s i then t i else 0 := by
  obtain ⟨m,hm⟩ := exists_mask s
  have h := dual_sound bounds D hD (fun i => m.val.testBit i.val) (rows m) (hrows m) t hconstraints
  have heq : (fun i => m.val.testBit i.val) = s := funext hm
  simpa only [heq,hm] using h

end Loneliness.KZProduct
