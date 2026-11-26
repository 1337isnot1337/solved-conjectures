import Conjectures.TomVailayaColorTrace
import Mathlib.Algebra.Polynomial.BigOperators
import Mathlib.Algebra.Polynomial.Eval.Degree
import Mathlib.Algebra.Ring.GeomSum

/-! The weighted path matrix acts on the color basis through a polynomial identity. -/

open scoped BigOperators Polynomial
open Polynomial Matrix

namespace TomVailaya

noncomputable section

variable {R : Type*} [CommRing R] {N : ℕ}

private def cutoffFactor (x : Fin N → R) (q : R) (k : ℕ) (c : Fin N) : R[X] :=
  1 + X * (if c.val < k then C q else 1) * C (x c)

/-- The elementary product with the first `k` colors weighted by `q`. -/
def cutoffProduct (x : Fin N → R) (q : R) (k : ℕ) : R[X] :=
  ∏ c : Fin N, cutoffFactor x q k c

/-- The generating polynomial for the color-basis columns at vertex color `b`. -/
def colorSeries (x : Fin N → R) (q : R) (b : Fin N) : R[X] :=
  C (x b) * ∏ c ∈ Finset.univ.erase b, cutoffFactor x q b.val c

private theorem cutoffParts (x : Fin N → R) (q : R) (b : Fin N) :
    let P := ∏ c ∈ Finset.univ.erase b, cutoffFactor x q b.val c
    cutoffProduct x q b.val = P * (1 + X * C (x b)) ∧
      cutoffProduct x q (b.val + 1) = P * (1 + X * C q * C (x b)) := by
  dsimp only
  have hp : (∏ c ∈ Finset.univ.erase b, cutoffFactor x q (b.val + 1) c) =
      ∏ c ∈ Finset.univ.erase b, cutoffFactor x q b.val c := by
    apply Finset.prod_congr rfl
    intro c hc
    have hne : c.val ≠ b.val := fun h => (Finset.mem_erase.mp hc).1 (Fin.ext h)
    have hlt : c.val < b.val + 1 ↔ c.val < b.val := by omega
    simp [cutoffFactor, hlt]
  constructor
  · unfold cutoffProduct
    rw [← Finset.prod_erase_mul _ _ (Finset.mem_univ b)]
    simp [cutoffFactor]
  · unfold cutoffProduct
    rw [← Finset.prod_erase_mul _ _ (Finset.mem_univ b), hp]
    simp [cutoffFactor]

private theorem cutoff_succ_sub (x : Fin N → R) (q : R) (b : Fin N) :
    cutoffProduct x q (b.val + 1) - cutoffProduct x q b.val =
      (C q - 1) * X * colorSeries x q b := by
  obtain ⟨h₀, h₁⟩ := cutoffParts x q b
  rw [h₀, h₁, colorSeries]
  ring

private theorem cutoff_adjacent (x : Fin N → R) (q : R) (b : Fin N) :
    C (x b) * (C q * cutoffProduct x q b.val - cutoffProduct x q (b.val + 1)) =
      (C q - 1) * colorSeries x q b := by
  obtain ⟨h₀, h₁⟩ := cutoffParts x q b
  rw [h₀, h₁, colorSeries]
  ring

private theorem cutoff_prefix (x : Fin N → R) (q : R) (k : ℕ) (hk : k ≤ N) :
    cutoffProduct x q k - cutoffProduct x q 0 =
      (C q - 1) * X * ∑ a ∈ Finset.univ.filter (fun c : Fin N => c.val < k), colorSeries x q a := by
  induction k with
  | zero => simp
  | succ k ih =>
    let b : Fin N := ⟨k, by omega⟩
    have hb : b ∉ Finset.univ.filter (fun c : Fin N => c.val < k) := by simp [b]
    have hf : Finset.univ.filter (fun c : Fin N => c.val < k + 1) =
        insert b (Finset.univ.filter (fun c : Fin N => c.val < k)) := by
      ext c
      simp only [Finset.mem_filter, Finset.mem_univ, true_and, Finset.mem_insert]
      constructor
      · intro h
        by_cases hc : c.val < k
        · exact Or.inr hc
        · exact Or.inl (Fin.ext (by dsimp [b]; omega))
      · rintro (rfl | hc) <;> dsimp [b] at * <;> omega
    rw [hf, Finset.sum_insert hb]
    have hstep := cutoff_succ_sub x q b
    change cutoffProduct x q (k + 1) - cutoffProduct x q k =
      (C q - 1) * X * colorSeries x q b at hstep
    linear_combination hstep + ih (by omega)

private theorem cutoff_suffix (x : Fin N → R) (q : R) (b : Fin N) :
    cutoffProduct x q N - cutoffProduct x q (b.val + 1) =
      (C q - 1) * X * ∑ a ∈ Finset.univ.filter (fun c : Fin N => b < c), colorSeries x q a := by
  have hall := cutoff_prefix x q N le_rfl
  have hprefix := cutoff_prefix x q (b.val + 1) b.isLt
  have hfull : Finset.univ.filter (fun c : Fin N => c.val < N) = Finset.univ :=
    Finset.filter_true_of_mem (fun c _ => c.isLt)
  rw [hfull] at hall
  have hsum : (∑ a ∈ Finset.univ.filter (fun c : Fin N => c.val < b.val + 1), colorSeries x q a) +
      (∑ a ∈ Finset.univ.filter (fun c : Fin N => b < c), colorSeries x q a) =
        ∑ a, colorSeries x q a := by
    have hcompl : Finset.univ.filter (fun c : Fin N => ¬ c.val < b.val + 1) =
        Finset.univ.filter (fun c : Fin N => b < c) := by
      ext c
      simp only [Finset.mem_filter, Finset.mem_univ, true_and]
      change ¬ c.val < b.val + 1 ↔ b.val < c.val
      omega
    rw [← hcompl]
    exact Finset.sum_filter_add_sum_filter_not Finset.univ _ _
  rw [← hsum] at hall
  linear_combination hall - hprefix

private theorem apply_series (x : Fin N → R) (q : R) (b : Fin N) :
    (colorMatrix (C ∘ x) (C q) pathEdge *ᵥ colorSeries x q) b =
      C (x b) * (C q * ∑ a ∈ Finset.univ.filter (fun c : Fin N => c < b), colorSeries x q a) +
        C (x b) * ∑ a ∈ Finset.univ.filter (fun c : Fin N => b < c), colorSeries x q a := by
  rw [Matrix.mulVec, dotProduct, ← mul_add]
  simp_rw [colorMatrix_pathEdge, Function.comp_apply, mul_assoc]
  rw [← Finset.mul_sum]
  congr 1
  rw [Finset.mul_sum, Finset.sum_filter, Finset.sum_filter, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro a _
  by_cases he : a = b
  · subst a
    simp [arcFactor]
  · rcases lt_or_gt_of_ne he with h | h
    · simp [arcFactor, he, h, not_lt_of_gt h]
    · simp [arcFactor, he, h, not_lt_of_gt h]

/-- A generating-function form of the weighted path action on the column
basis. Coefficient extraction gives the recurrence between successive columns. -/
theorem path_colorSeries_identity (x : Fin N → R) (q : R) (b : Fin N) :
    (C q - 1) * (X * (colorMatrix (C ∘ x) (C q) pathEdge *ᵥ colorSeries x q) b -
      colorSeries x q b) =
      C (x b) * (cutoffProduct x q N - C q * cutoffProduct x q 0) := by
  rw [apply_series]
  have hprefix := cutoff_prefix x q b.val b.isLt.le
  have hsuffix := cutoff_suffix x q b
  have hadjacent := cutoff_adjacent x q b
  linear_combination -C (x b) * C q * hprefix - C (x b) * hsuffix + hadjacent


/-- The elementary symmetric value given by the coefficient of the full product. -/
def elementaryValue (x : Fin N → R) (j : ℕ) : R :=
  (∏ c : Fin N, (1 + X * C (x c))).coeff j

/-- The column indexed by `k + 1` in the paper, written with a zero-based index. -/
def basisColumn (x : Fin N → R) (q : R) (k : ℕ) (b : Fin N) : R :=
  (colorSeries x q b).coeff k

private theorem cutoff_zero_coeff (x : Fin N → R) (q : R) (j : ℕ) :
    (cutoffProduct x q 0).coeff j = elementaryValue x j := by
  simp [cutoffProduct, cutoffFactor, elementaryValue]

private theorem cutoff_full_coeff (x : Fin N → R) (q : R) (j : ℕ) :
    (cutoffProduct x q N).coeff j = elementaryValue x j * q ^ j := by
  have hmap : cutoffProduct x q N = (cutoffProduct x q 0).comp (C q * X) := by
    simp only [cutoffProduct, Polynomial.prod_comp]
    apply Finset.prod_congr rfl
    intro c _
    simp only [cutoffFactor, ite_eq_left c.isLt, ite_eq_right (Nat.not_lt_zero _), mul_one,
      Polynomial.add_comp, Polynomial.one_comp, Polynomial.mul_comp, Polynomial.X_comp,
      Polynomial.C_comp]
    ring
  rw [hmap, Polynomial.comp_C_mul_X_coeff, cutoff_zero_coeff]

private theorem pathEdge_polynomial (x : Fin N → R) (q : R) (b a : Fin N) :
    colorMatrix (C ∘ x) (C q) pathEdge b a = C (colorMatrix x q pathEdge b a) := by
  simp only [colorMatrix_pathEdge, Function.comp_apply, map_mul, arcFactor]
  split <;> simp_all
  split <;> simp_all

private theorem pathSeries_coeff (x : Fin N → R) (q : R) (b : Fin N) (k : ℕ) :
    ((colorMatrix (C ∘ x) (C q) pathEdge *ᵥ colorSeries x q) b).coeff k =
      (colorMatrix x q pathEdge *ᵥ basisColumn x q k) b := by
  simp only [Matrix.mulVec, dotProduct, Polynomial.finsetSum_coeff, pathEdge_polynomial,
    Polynomial.coeff_C_mul, basisColumn]

theorem basisColumn_zero (x : Fin N → R) (q : R) : basisColumn x q 0 = x := by
  funext b
  rw [basisColumn, colorSeries, Polynomial.coeff_C_mul, Polynomial.coeff_zero_eq_eval_zero,
    Polynomial.eval_prod]
  rw [Finset.prod_eq_one, mul_one]
  intro c _
  by_cases hc : c.val < b.val <;> simp [cutoffFactor, hc]

/-- The exact weighted path transfer sends the `(k+1)`-st color column to
the next column plus the elementary symmetric correction in the first column. -/
theorem path_basisColumn [IsDomain R] (x : Fin N → R) (q : R) (hq : q ≠ 1) (k : ℕ) :
    colorMatrix x q pathEdge *ᵥ basisColumn x q k =
      basisColumn x q (k + 1) +
        (q * (∑ i ∈ Finset.range k, q ^ i) * elementaryValue x (k + 1)) • x := by
  funext b
  have h := congrArg (fun p : R[X] => p.coeff (k + 1)) (path_colorSeries_identity x q b)
  rw [← map_one C, ← map_sub C] at h
  simp only [Polynomial.coeff_C_mul, Polynomial.coeff_sub, Polynomial.coeff_X_mul,
    pathSeries_coeff, cutoff_full_coeff, cutoff_zero_coeff] at h
  change (q - 1) * ((colorMatrix x q pathEdge *ᵥ basisColumn x q k) b -
    basisColumn x q (k + 1) b) =
    x b * (elementaryValue x (k + 1) * q ^ (k + 1) - q * elementaryValue x (k + 1)) at h
  have hgeom := mul_geom_sum q k
  rw [pow_succ] at h
  apply mul_left_cancel₀ (sub_ne_zero.mpr hq)
  simp only [Pi.add_apply, Pi.smul_apply, smul_eq_mul]
  linear_combination h - (x b * q * elementaryValue x (k + 1)) * hgeom


private theorem degree_cutoffFactors (x : Fin N → R) (q : R) (k : ℕ) (s : Finset (Fin N)) :
    (∏ c ∈ s, cutoffFactor x q k c).natDegree ≤ s.card := by
  refine (Polynomial.natDegree_prod_le _ _).trans ?_
  calc
    _ ≤ ∑ _ ∈ s, 1 := by
      apply Finset.sum_le_sum
      intro c _
      unfold cutoffFactor
      rw [Polynomial.natDegree_one_add]
      have hq : (if c.val < k then C q else (1 : R[X])).natDegree ≤ 0 := by
        split <;> simp
      exact (Polynomial.natDegree_mul_le_of_le
        (Polynomial.natDegree_mul_le_of_le Polynomial.natDegree_X_le hq)
        (show (C (x c)).natDegree ≤ 0 by simp)).trans (by omega)
    _ = _ := by simp

/-- Columns past the number of available colors vanish in the finite color basis. -/
theorem basisColumn_eq_zero (x : Fin N → R) (q : R) (k : ℕ) (hk : N ≤ k) :
    basisColumn x q k = 0 := by
  funext b
  change (colorSeries x q b).coeff k = 0
  apply Polynomial.coeff_eq_zero_of_natDegree_lt
  unfold colorSeries
  have hcard : (Finset.univ.erase b).card = N - 1 := by simp
  have hdeg := Polynomial.natDegree_mul_le_of_le (show (C (x b)).natDegree ≤ 0 by simp)
    (degree_cutoffFactors x q b.val (Finset.univ.erase b))
  rw [hcard, zero_add] at hdeg
  have hb := b.isLt
  omega

/-- Elementary coefficients above the number of available colors vanish. -/
theorem elementaryValue_eq_zero (x : Fin N → R) (j : ℕ) (hj : N < j) :
    elementaryValue x j = 0 := by
  rw [← cutoff_zero_coeff x 1]
  apply Polynomial.coeff_eq_zero_of_natDegree_lt
  change (∏ c : Fin N, cutoffFactor x 1 0 c).natDegree < j
  have hdeg := degree_cutoffFactors x 1 0 Finset.univ
  rw [Finset.card_univ, Fintype.card_fin] at hdeg
  exact hdeg.trans_lt hj


/-- Summing the color weights in the `(k+1)`-st column gives the
source (q)-integer times the corresponding elementary symmetric value. -/
theorem sum_basisColumn [IsDomain R] (x : Fin N → R) (q : R) (hq : q ≠ 1) (k : ℕ) :
    (∑ b : Fin N, basisColumn x q k b) =
      (∑ i ∈ Finset.range (k + 1), q ^ i) * elementaryValue x (k + 1) := by
  have hfull : Finset.univ.filter (fun c : Fin N => c.val < N) = Finset.univ :=
    Finset.filter_true_of_mem (fun c _ => c.isLt)
  have hpoly := cutoff_prefix x q N le_rfl
  rw [hfull, mul_assoc, ← map_one C, ← map_sub C] at hpoly
  have h := congrArg (fun p : R[X] => p.coeff (k + 1)) hpoly
  simp only [Polynomial.coeff_sub, Polynomial.coeff_C_mul, Polynomial.coeff_X_mul,
    Polynomial.finsetSum_coeff, cutoff_full_coeff, cutoff_zero_coeff] at h
  have hgeom := mul_geom_sum q (k + 1)
  apply mul_left_cancel₀ (sub_ne_zero.mpr hq)
  change (q - 1) * (∑ b : Fin N, (colorSeries x q b).coeff k) = _
  linear_combination -h - elementaryValue x (k + 1) * hgeom

end

end TomVailaya
