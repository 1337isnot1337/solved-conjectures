import Conjectures.KovalevZeroFreeCoefficients
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma

/-!
# Kovalev's zero-free Taylor polynomial conjecture

Finite Cauchy-product rearrangements for the exact Taylor-section identity
in equation (1) of the recorded proof, commit
`6432592c03b24aed190ed7b3204ed942a40a8da4`.
-/

namespace Conjectures.KovalevZeroFree

open Finset

noncomputable section

theorem sum_triangle_reindex (n : ℕ) (f : ℕ → ℕ → ℂ) :
    (∑ k ∈ range (n + 1), ∑ i ∈ range (k + 1), f i (k - i)) =
      ∑ i ∈ range (n + 1), ∑ j ∈ range (n - i + 1), f i j := by
  rw [sum_sigma', sum_sigma']
  refine sum_bij'
    (fun p _ => ⟨p.2, p.1 - p.2⟩)
    (fun p _ => ⟨p.1 + p.2, p.1⟩) ?_ ?_ ?_ ?_ ?_
  · intro p hp
    simp only [mem_sigma, mem_range] at hp ⊢
    omega
  · intro p hp
    simp only [mem_sigma, mem_range] at hp ⊢
    omega
  · intro p hp
    simp only [mem_sigma, mem_range] at hp
    cases p with
    | mk k i =>
      dsimp at hp
      dsimp
      congr 1
      omega
  · intro p hp
    cases p with
    | mk i j => simp
  · intro p hp
    rfl

theorem cauchy_prefix_eq (a b : ℕ → ℂ) (n : ℕ) (z : ℂ) :
    (∑ k ∈ range (n + 1), (∑ i ∈ range (k + 1), b i * a (k - i)) * z ^ k) =
      ∑ i ∈ range (n + 1), b i * z ^ i *
        ∑ j ∈ range (n - i + 1), a j * z ^ j := by
  simp_rw [sum_mul]
  calc
    _ = ∑ k ∈ range (n + 1), ∑ i ∈ range (k + 1),
          b i * z ^ i * (a (k - i) * z ^ (k - i)) := by
      apply sum_congr rfl
      intro k hk
      apply sum_congr rfl
      intro i hi
      have he : i + (k - i) = k := Nat.add_sub_of_le (by simpa using hi)
      have hzpow : z ^ k = z ^ i * z ^ (k - i) := by rw [← pow_add, he]
      rw [hzpow]
      ring
    _ = _ := by
      rw [sum_triangle_reindex n (fun i j => b i * z ^ i * (a j * z ^ j))]
      simp_rw [mul_sum]

theorem sum_multiples_prefix {D : ℕ} (hD : 0 < D) (n : ℕ) (f : ℕ → ℂ) :
    (∑ i ∈ range (n + 1), if D ∣ i then f i else 0) =
      ∑ j ∈ range (n / D + 1), f (j * D) := by
  rw [← sum_filter]
  symm
  refine sum_bij (fun j _ => j * D) ?_ ?_ ?_ ?_
  · intro j hj
    simp only [mem_range] at hj
    simp only [mem_filter, mem_range]
    constructor
    · have := (Nat.le_div_iff_mul_le hD).mp (Nat.lt_succ_iff.mp hj)
      omega
    · exact dvd_mul_left D j
  · intro i hi j hj hij
    exact Nat.eq_of_mul_eq_mul_right hD hij
  · intro i hi
    simp only [mem_filter, mem_range] at hi
    obtain ⟨j, rfl⟩ := hi.2
    refine ⟨j, ?_, Nat.mul_comm _ _⟩
    simp only [mem_range]
    apply Nat.lt_succ_of_le
    apply (Nat.le_div_iff_mul_le hD).mpr
    rw [Nat.mul_comm]
    omega
  · intro i hi
    rfl

end

end Conjectures.KovalevZeroFree
