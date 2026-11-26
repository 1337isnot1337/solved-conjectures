import Conjectures.TomVailayaColorTrace
import Mathlib.Algebra.Polynomial.BigOperators

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

end

end TomVailaya
