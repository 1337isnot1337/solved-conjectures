import Conjectures.RectangleProducts

/-! Indexing and symmetry identities connecting rectangle products to
the one-dimensional finite Euler product. -/

namespace RectanglePartitions

open Finset

theorem sum_Icc_one_eq_sum_range (f : ℕ → ℝ) (N : ℕ) :
    (∑ a ∈ Icc 1 N,f a) = ∑ a ∈ range N,f (a+1) := by
  symm
  apply Finset.sum_bij (fun a _ => a+1)
  · intro a ha
    simp only [mem_range] at ha
    simp only [mem_Icc]
    omega
  · intro a ha b hb he
    omega
  · intro b hb
    simp only [mem_Icc] at hb
    refine ⟨b-1,?_,?_⟩
    · simp only [mem_range]
      omega
    · omega
  · intro a ha
    rfl

theorem orderedLogProduct_eq_sum_logEuler (h N : ℕ) (t : ℝ) :
    orderedLogProduct h N t =
      ∑ a ∈ range h, RectangleEuler.logEuler N (((a : ℝ)+1)*t) := by
  unfold orderedLogProduct logTypeProduct orderedTypes
  rw [Finset.sum_product,sum_Icc_one_eq_sum_range]
  apply Finset.sum_congr rfl
  intro a ha
  rw [sum_Icc_one_eq_sum_range]
  unfold RectangleEuler.logEuler
  apply Finset.sum_congr rfl
  intro b hb
  simp only [blockArea,Nat.cast_mul,Nat.cast_add,Nat.cast_one]
  congr 3
  ring

theorem symmetric_triangle_sum (I : Finset ℕ) (f : ℕ → ℕ → ℝ)
    (hsym : ∀ a b,f a b=f b a) :
    2*(∑ p ∈ (I ×ˢ I).filter (fun p => p.1 ≤ p.2),f p.1 p.2) =
      (∑ p ∈ I ×ˢ I,f p.1 p.2)+(∑ a ∈ I,f a a) := by
  classical
  simp only [Finset.sum_filter,Finset.sum_product]
  have hswap : (∑ a ∈ I,∑ b ∈ I,if b ≤ a then f a b else 0) =
      ∑ a ∈ I,∑ b ∈ I,if a ≤ b then f a b else 0 := by
    rw [Finset.sum_comm]
    apply Finset.sum_congr rfl
    intro a ha
    apply Finset.sum_congr rfl
    intro b hb
    rw [hsym b a]
  have hdiag : (∑ a ∈ I,∑ b ∈ I,if a=b then f a b else 0) =
      ∑ a ∈ I,f a a := by
    apply Finset.sum_congr rfl
    intro a ha
    simp [ha]
  have hpoint : ∀ a b,
      (if a ≤ b then f a b else 0)+(if b ≤ a then f a b else 0) =
        f a b+(if a=b then f a b else 0) := by
    intro a b
    by_cases he : a=b
    · subst b
      simp
    · rcases lt_or_gt_of_ne he with hab|hba
      · simp [hab.le,not_le.mpr hab,he]
      · simp [hba.le,not_le.mpr hba,he]
  have hh :
      (∑ a ∈ I,∑ b ∈ I,((if a ≤ b then f a b else 0)+(if b ≤ a then f a b else 0))) =
        ∑ a ∈ I,∑ b ∈ I,(f a b+(if a=b then f a b else 0)) := by
    apply Finset.sum_congr rfl
    intro a ha
    exact Finset.sum_congr rfl (fun b hb => hpoint a b)
  simp only [Finset.sum_add_distrib] at hh
  rw [hswap,hdiag] at hh
  linarith

theorem unorderedLogProduct_symmetry (N : ℕ) (t : ℝ) :
    2*unorderedLogProduct N t = orderedLogProduct N N t +
      ∑ a ∈ range N,-Real.log (1-Real.exp (-(((a : ℝ)+1)^2)*t)) := by
  have hh := symmetric_triangle_sum (Icc 1 N)
    (fun a b => -Real.log (1-Real.exp (-((a*b : ℕ) : ℝ)*t))) (by
      intro a b
      rw [Nat.mul_comm a b])
  have hdiag : (∑ a ∈ Icc 1 N,-Real.log (1-Real.exp (-((a*a : ℕ) : ℝ)*t))) =
      ∑ a ∈ range N,-Real.log (1-Real.exp (-(((a : ℝ)+1)^2)*t)) := by
    rw [sum_Icc_one_eq_sum_range]
    simp only [Nat.cast_mul,Nat.cast_add,Nat.cast_one,pow_two]
  rw [hdiag] at hh
  exact hh

end RectanglePartitions
