module
public import Conjectures.WachsLaguerreSignIntervals

@[expose] public section
namespace WachsCompleteGraph

open Polynomial

def StrictlyInterlaces {n : ℕ} (a : Fin (n+1) → ℝ) (b : Fin n → ℝ) : Prop :=
  ∀ i : Fin n, a i.castSucc < b i ∧ b i < a i.succ

theorem eval_factor_sequence {n : ℕ} {b : Fin n → ℝ} {P : Polynomial ℝ}
    (h : P = ∏ i : Fin n, (X-C (b i))) (x : ℝ) :
    P.eval x = ∏ i : Fin n, (x-b i) := by
  rw [h]
  simp only [Polynomial.eval_prod,eval_sub,eval_X,eval_C]

theorem interlace_eval_opposite {n : ℕ} {a : Fin (n+1) → ℝ} {b : Fin n → ℝ}
    {P : Polynomial ℝ} (hP : P = ∏ i : Fin n, (X-C (b i)))
    (ha : StrictMono a) (hI : StrictlyInterlaces a b) (i : Fin n) :
    P.eval (a i.castSucc) * P.eval (a i.succ) < 0 := by
  rw [eval_factor_sequence hP,eval_factor_sequence hP]
  apply sign_crossing_single b i (hI i).1 (hI i).2
  intro j hj
  by_cases h : j < i
  · left
    have hji : j.succ ≤ i.castSucc := by
      have h' := Fin.lt_def.mp h
      exact Fin.le_def.mpr (by simpa using h')
    exact (hI j).2.trans_le (ha.monotone hji)
  · right
    have hj' : i < j := lt_of_le_of_ne (le_of_not_gt h) (Ne.symm hj)
    have hji : i.succ ≤ j.castSucc := by
      have h' := Fin.lt_def.mp hj'
      exact Fin.le_def.mpr (by simpa using h')
    exact (ha.monotone hji).trans_lt (hI j).1

theorem interlace_eval_right {n : ℕ} {a : Fin (n+1) → ℝ} {b : Fin n → ℝ}
    {P : Polynomial ℝ} (hP : P = ∏ i : Fin n, (X-C (b i)))
    (ha : StrictMono a) (hI : StrictlyInterlaces a b) :
    0 < P.eval (a (Fin.last n)) := by
  rw [eval_factor_sequence hP]
  apply Finset.prod_pos
  intro i _
  exact sub_pos.mpr ((hI i).2.trans_le (ha.monotone ((Fin.le_last _))))

theorem interlace_eval_left {n : ℕ} {a : Fin (n+1) → ℝ} {b : Fin n → ℝ}
    {P : Polynomial ℝ} (hP : P = ∏ i : Fin n, (X-C (b i)))
    (ha : StrictMono a) (hI : StrictlyInterlaces a b) :
    0 < (-1:ℝ)^n * P.eval (a 0) := by
  rw [eval_factor_sequence hP]
  have hsign : (-1:ℝ)^n = ∏ _ : Fin n, (-1:ℝ) := by simp
  rw [hsign,← Finset.prod_mul_distrib]
  apply Finset.prod_pos
  intro i _
  have hh := (ha.monotone (Fin.zero_le i.castSucc)).trans_lt (hI i).1
  have hsub : a 0 - b i < 0 := sub_neg.mpr hh
  exact mul_pos_of_neg_of_neg (by norm_num) hsub

end WachsCompleteGraph
