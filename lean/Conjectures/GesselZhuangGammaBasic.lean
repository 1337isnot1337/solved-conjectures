module

public import Mathlib.Algebra.Polynomial.Reverse
public import Mathlib.Basic.Real.Basic
public import Mathlib.Tactic.Ring
public import Mathlib.Tactic.NormNum

/-!
# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

The literal nonnegative gamma expansion at a prescribed symmetry center,
and the closure operations used in Section 3 of the existing proof.
The parameter `N` is twice the symmetry center; initial zero coefficients
are allowed.
-/

@[expose] public section

noncomputable section

namespace GesselZhuang

open Polynomial Finset

def GammaPositive (N : ℕ) (p : ℝ[X]) : Prop :=
  ∃ γ : ℕ → ℝ, (∀ j, 0 ≤ γ j) ∧
    p = ∑ j ∈ range (N / 2 + 1), C (γ j) * X ^ j * (1 + X) ^ (N - 2 * j)

theorem gammaPositive_zero (N : ℕ) : GammaPositive N 0 := by
  refine ⟨fun _ => 0, fun _ => le_rfl, ?_⟩
  simp

theorem gammaPositive_C {a : ℝ} (ha : 0 ≤ a) : GammaPositive 0 (C a) := by
  refine ⟨fun _ => a, fun _ => ha, ?_⟩
  simp

theorem GammaPositive.add {N : ℕ} {p q : ℝ[X]}
    (hp : GammaPositive N p) (hq : GammaPositive N q) : GammaPositive N (p + q) := by
  obtain ⟨a, ha, rfl⟩ := hp
  obtain ⟨b, hb, rfl⟩ := hq
  refine ⟨fun j => a j + b j, fun j => add_nonneg (ha j) (hb j), ?_⟩
  simp only [map_add, add_mul, sum_add_distrib]

theorem GammaPositive.C_mul {N : ℕ} {p : ℝ[X]} (hp : GammaPositive N p)
    {a : ℝ} (ha : 0 ≤ a) : GammaPositive N (C a * p) := by
  obtain ⟨γ, hγ, rfl⟩ := hp
  refine ⟨fun j => a * γ j, fun j => mul_nonneg ha (hγ j), ?_⟩
  simp only [mul_sum, map_mul, mul_assoc]

theorem GammaPositive.sum {ι : Type*} (s : Finset ι) (p : ι → ℝ[X]) (N : ℕ)
    (hp : ∀ i ∈ s, GammaPositive N (p i)) : GammaPositive N (∑ i ∈ s, p i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa only [sum_empty] using gammaPositive_zero N
  | @insert i s hi ih =>
      rw [sum_insert hi]
      exact (hp i (mem_insert_self i s)).add
        (ih (fun j hj => hp j (mem_insert_of_mem hj)))

theorem GammaPositive.X_mul {N : ℕ} {p : ℝ[X]} (hp : GammaPositive N p) :
    GammaPositive (N + 2) (X * p) := by
  obtain ⟨γ, hγ, hp⟩ := hp
  let δ : ℕ → ℝ := fun j => if j = 0 then 0 else γ (j - 1)
  refine ⟨δ, fun j => by dsimp [δ]; split_ifs; exact le_rfl; exact hγ _, ?_⟩
  rw [show (N + 2) / 2 + 1 = (N / 2 + 1) + 1 by omega, sum_range_succ']
  simp only [δ, ite_eq_left rfl, C_0, zero_mul, add_zero]
  rw [hp, mul_sum]
  apply sum_congr rfl
  intro j hj
  have hjN : 2 * j ≤ N := by have := mem_range.mp hj; omega
  simp only [ite_eq_right (Nat.succ_ne_zero j),
    Nat.add_sub_cancel, show N + 2 - 2 * (j + 1) = N - 2 * j by omega]
  rw [pow_succ]
  ring

theorem GammaPositive.one_add_X_mul {N : ℕ} {p : ℝ[X]}
    (hp : GammaPositive N p) : GammaPositive (N + 1) ((1 + X) * p) := by
  obtain ⟨γ, hγ, hp⟩ := hp
  let δ : ℕ → ℝ := fun j => if j < N / 2 + 1 then γ j else 0
  refine ⟨δ, fun j => by dsimp [δ]; split_ifs; exact hγ _; exact le_rfl, ?_⟩
  have hsub : range (N / 2 + 1) ⊆ range ((N + 1) / 2 + 1) :=
    range_subset_range.mpr (by omega)
  have hs :
      (∑ j ∈ range ((N + 1) / 2 + 1), C (δ j) * X ^ j * (1 + X) ^ (N + 1 - 2 * j)) =
      ∑ j ∈ range (N / 2 + 1), C (γ j) * X ^ j * (1 + X) ^ (N + 1 - 2 * j) := by
    calc
      _ = ∑ j ∈ range (N / 2 + 1), C (δ j) * X ^ j * (1 + X) ^ (N + 1 - 2 * j) := by
        symm
        apply sum_subset hsub
        intro j _ hj
        have hnot : ¬j < N / 2 + 1 := by simpa only [mem_range] using hj
        simp only [δ, ite_eq_right hnot, C_0, zero_mul]
      _ = _ := by
        apply sum_congr rfl
        intro j hj
        simp only [δ, ite_eq_left (mem_range.mp hj)]
  rw [hs, hp, mul_sum]
  apply sum_congr rfl
  intro j hj
  have hjN : 2 * j ≤ N := by have := mem_range.mp hj; omega
  rw [show N + 1 - 2 * j = (N - 2 * j) + 1 by omega, pow_succ]
  ring

theorem GammaPositive.quadratic_mul {N : ℕ} {p : ℝ[X]}
    (hp : GammaPositive N p) {a : ℝ} (ha : 0 ≤ a) :
    GammaPositive (N + 2) (((1 + X) ^ 2 + C a * X) * p) := by
  have h1 := hp.one_add_X_mul.one_add_X_mul
  have h2 := hp.X_mul.C_mul ha
  convert h1.add h2 using 1
  ring

end GesselZhuang
