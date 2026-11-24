import Conjectures.FerroniHigashitaniCount
import Mathlib.Data.Nat.Choose.Sum
import Mathlib.Algebra.BigOperators.Ring.List

/-! Weighted composition identities for the binomial basis of the Cayley-box
count. The two formulas give the values on opposite sides of reciprocity. -/

open Finset

namespace FerroniHigashitani

private theorem choose_hockey (n a : ℕ) :
    ∑ k ∈ range (n + 1), k.choose a = (n + 1).choose (a + 1) := by
  induction n with
  | zero => cases a <;> simp [Nat.choose]
  | succ n ih => rw [sum_range_succ, ih, Nat.choose_succ_succ' (n + 1) a, add_comm]

private theorem choose_convolution (n a b : ℕ) :
    ∑ k ∈ range (n + 1), k.choose a * (n - k).choose b = (n + 1).choose (a + b + 1) := by
  induction n generalizing b with
  | zero => cases a <;> cases b <;> simp [Nat.choose]
  | succ n ih =>
    cases b with
    | zero => simpa using choose_hockey (n + 1) a
    | succ b =>
      rw [sum_range_succ]
      simp only [Nat.sub_self, Nat.choose_zero_succ, mul_zero, add_zero]
      have h (k : ℕ) (hk : k ∈ range (n + 1)) :
          k.choose a * (n + 1 - k).choose (b + 1) =
            k.choose a * (n - k).choose b + k.choose a * (n - k).choose (b + 1) := by
        have hlt := mem_range.mp hk
        rw [show n + 1 - k = (n - k) + 1 by omega, Nat.choose_succ_succ', mul_add]
      rw [sum_congr rfl h, sum_add_distrib, ih b, ih (b + 1)]
      rw [show a + (b + 1) + 1 = (a + b + 1) + 1 by omega,
        Nat.choose_succ_succ' (n + 1) (a + b + 1)]

private theorem shifted_choose_convolution (n a b : ℕ) :
    ∑ k ∈ range (n + 1), (k + a).choose a * ((n - k) + b).choose b =
      (n + a + b + 1).choose (a + b + 1) := by
  let f (k : ℕ) := k.choose a * (n + a + b - k).choose b
  calc
    _ = ∑ k ∈ range (n + 1), f (k + a) := by
      apply sum_congr rfl
      intro k hk
      have hlt := mem_range.mp hk
      unfold f
      rw [show n + a + b - (k + a) = n - k + b by omega]
    _ = ∑ k ∈ Ico a (n + a + 1), f k := by
      rw [range_eq_Ico]
      change (∑ k ∈ Ico 0 (n + 1), f ((addRightEmbedding a) k)) = _
      rw [← sum_map]
      rw [map_add_right_Ico]
      simp [add_right_comm]
    _ = ∑ k ∈ range (n + a + b + 1), f k := by
      apply sum_subset
      · intro k hk
        simp only [mem_Ico] at hk
        rw [mem_range]
        omega
      · intro k hk hnot
        simp only [mem_range] at hk
        simp only [mem_Ico, not_and_or, not_le, not_lt] at hnot
        rcases hnot with h | h
        · simp [f, Nat.choose_eq_zero_of_lt h]
        · have hz : n + a + b - k < b := by omega
          simp [f, Nat.choose_eq_zero_of_lt hz]
    _ = _ := choose_convolution _ _ _

def sumCompositions {R : Type*} [AddMonoid R] (d n : ℕ) (f : (Fin d → ℕ) → R) : R :=
  ((compositions d n).map f).sum

private theorem sumCompositions_succ_mul {R : Type*} [Semiring R]
    (d n : ℕ) (a : ℕ → R) (b : (Fin d → ℕ) → R) :
    sumCompositions (d + 1) n (fun f => a (f 0) * b (Fin.tail f)) =
      ∑ k ∈ range (n + 1), a k * sumCompositions d (n - k) b := by
  have h (l : List ℕ) :
      ((l.flatMap fun k => (compositions d (n - k)).map (Fin.cons k)).map
        (fun f : Fin (d + 1) → ℕ => a (f 0) * b (Fin.tail f))).sum =
          (l.map fun k => a k * sumCompositions d (n - k) b).sum := by
    induction l with
    | nil => rfl
    | cons k l ih =>
      simp [List.flatMap_cons, ih, List.sum_map_mul_left, Function.comp_def, sumCompositions]
  rw [sumCompositions, compositions, h]
  rfl

theorem sumCompositions_falling (d n : ℕ) (a : Fin d → ℕ) :
    sumCompositions d n (fun f => ∏ i, (f i).choose (a i)) =
      (n + d).choose (d + ∑ i, a i) := by
  induction d generalizing n with
  | zero => simp [sumCompositions, compositions]
  | succ d ih =>
    have he (f : Fin (d + 1) → ℕ) :
        (∏ i, (f i).choose (a i)) =
          (f 0).choose (a 0) * ∏ i : Fin d, (Fin.tail f i).choose (Fin.tail a i) := by
      rw [Fin.prod_univ_succ]
      rfl
    simp_rw [he]
    rw [sumCompositions_succ_mul d n (fun k => k.choose (a 0))
      (fun f => ∏ i, (f i).choose (Fin.tail a i))]
    simp_rw [ih]
    rw [Fin.sum_univ_succ]
    let D := d + ∑ i : Fin d, a i.succ
    have hD : d ≤ D := Nat.le_add_right _ _
    change ∑ k ∈ range (n + 1), k.choose (a 0) * ((n - k) + d).choose D =
      (n + (d + 1)).choose (d + 1 + (a 0 + ∑ i : Fin d, a i.succ))
    calc
      _ = ∑ k ∈ range (n + 1), k.choose (a 0) * (n + d - k).choose D := by
        apply sum_congr rfl
        intro k hk
        have hlt := mem_range.mp hk
        rw [show n - k + d = n + d - k by omega]
      _ = ∑ k ∈ range (n + d + 1), k.choose (a 0) * (n + d - k).choose D := by
        apply sum_subset (range_mono (by omega))
        intro k hk hnot
        simp only [mem_range, not_lt] at hk hnot
        have hz : n + d - k < D := by omega
        simp [Nat.choose_eq_zero_of_lt hz]
      _ = _ := by
        rw [choose_convolution]
        congr 1
        omega

theorem sumCompositions_rising (d n : ℕ) (a : Fin d → ℕ) :
    sumCompositions d n (fun f => ∏ i, (f i + a i).choose (a i)) =
      (n + d + ∑ i, a i).choose (d + ∑ i, a i) := by
  induction d generalizing n with
  | zero => simp [sumCompositions, compositions]
  | succ d ih =>
    have he (f : Fin (d + 1) → ℕ) :
        (∏ i, (f i + a i).choose (a i)) = (f 0 + a 0).choose (a 0) *
          ∏ i : Fin d, (Fin.tail f i + Fin.tail a i).choose (Fin.tail a i) := by
      rw [Fin.prod_univ_succ]
      rfl
    simp_rw [he]
    rw [sumCompositions_succ_mul d n (fun k => (k + a 0).choose (a 0))
      (fun f => ∏ i, (f i + Fin.tail a i).choose (Fin.tail a i))]
    simp_rw [ih]
    rw [Fin.sum_univ_succ]
    let D := d + ∑ i : Fin d, a i.succ
    have hr (k : ℕ) : (n - k) + d + ∑ i : Fin d, a i.succ = n - k + D := by
      dsimp [D]
      omega
    simp_rw [show Fin.tail a = (fun i => a i.succ) from rfl, hr]
    rw [shifted_choose_convolution]
    congr 1 <;> dsimp [D] <;> omega

end FerroniHigashitani
