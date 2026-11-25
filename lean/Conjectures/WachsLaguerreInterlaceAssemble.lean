module
public import Conjectures.WachsLaguerreSuccessorIntervals
public import Mathlib.Order.Fin.Basic
public import Mathlib.Algebra.Polynomial.Degree.SmallDegree

@[expose] public section
namespace WachsCompleteGraph

open Polynomial

def mergeInterlacing {n : ℕ} (left right : ℝ) (middle : Fin n → ℝ) : Fin (n+2) → ℝ :=
  Fin.cases left (Fin.lastCases right middle)

theorem mergeInterlacing_left {n : ℕ} (l r : ℝ) (m : Fin n → ℝ) :
    mergeInterlacing l r m 0 = l := rfl

theorem mergeInterlacing_right {n : ℕ} (l r : ℝ) (m : Fin n → ℝ) :
    mergeInterlacing l r m (Fin.last (n+1)) = r := by
  change Fin.cases l (Fin.lastCases r m) ((Fin.last n).succ) = r
  rw [Fin.cases_succ,Fin.lastCases_last]

theorem mergeInterlacing_middle {n : ℕ} (l r : ℝ) (m : Fin n → ℝ) (i : Fin n) :
    mergeInterlacing l r m i.castSucc.succ = m i := by simp [mergeInterlacing]

theorem mergeInterlacing_interlaces {n : ℕ} (l r : ℝ) (m : Fin n → ℝ)
    (a : Fin (n+1) → ℝ) (hl : l<a 0) (hr : a (Fin.last n)<r)
    (hm : ∀ i : Fin n, a i.castSucc < m i ∧ m i < a i.succ) :
    StrictlyInterlaces (mergeInterlacing l r m) a := by
  intro i
  constructor
  · induction i using Fin.cases with
    | zero => exact hl
    | succ j =>
      rw [show j.succ.castSucc = j.castSucc.succ by rfl,mergeInterlacing_middle]
      exact (hm j).2
  · induction i using Fin.lastCases with
    | last =>
      rw [show (Fin.last n).succ = Fin.last (n+1) by rfl,mergeInterlacing_right]
      exact hr
    | cast j => rw [mergeInterlacing_middle]; exact (hm j).1

theorem mergeInterlacing_eval_zero {n : ℕ} (l r : ℝ) (m : Fin n → ℝ)
    (P : Polynomial ℝ) (hl : P.eval l=0) (hr : P.eval r=0) (hm : ∀ i, P.eval (m i)=0) :
    ∀ j, P.eval (mergeInterlacing l r m j)=0 := by
  intro j
  induction j using Fin.cases with
  | zero => exact hl
  | succ j =>
    induction j using Fin.lastCases with
    | last =>
      rw [show (Fin.last n).succ = Fin.last (n+1) by rfl,mergeInterlacing_right]
      exact hr
    | cast i => rw [mergeInterlacing_middle]; exact hm i

theorem strictly_interlaces_strictMono {n : ℕ} {a : Fin (n+1) → ℝ} {b : Fin n → ℝ}
    (h : StrictlyInterlaces a b) : StrictMono a :=
  Fin.strictMono_iff_lt_succ.mpr (fun i => (h i).1.trans (h i).2)

def PositiveLaguerreRoots (n : ℕ) (a : Fin n → ℝ) : Prop :=
  StrictMono a ∧ (∀ i, 0 < a i) ∧ monicLaguerre n = ∏ i : Fin n, (X - C (a i))

theorem laguerre_successor_roots {n : ℕ} (a : Fin (n+1) → ℝ) (b : Fin n → ℝ)
    (ha : PositiveLaguerreRoots (n+1) a) (hb : PositiveLaguerreRoots n b)
    (hI : StrictlyInterlaces a b) :
    ∃ r : Fin (n+2) → ℝ, PositiveLaguerreRoots (n+2) r ∧ StrictlyInterlaces r a := by
  classical
  have hz (i : Fin (n+1)) : (monicLaguerre (n+1)).eval (a i) = 0 := by
    rw [eval_factor_sequence ha.2.2]
    exact Finset.prod_eq_zero (Finset.mem_univ i) (sub_self _)
  obtain ⟨⟨l,hl,hl0⟩,hs,⟨r,hr,hr0⟩⟩ :=
    laguerre_next_intervals a b ha.1 (ha.2.1 0) hI hz hb.2.2
  choose m hm hm0 using hs
  let v := mergeInterlacing l r m
  have hI' : StrictlyInterlaces v a := mergeInterlacing_interlaces l r m a hl.2 hr hm
  have hmono : StrictMono v := strictly_interlaces_strictMono hI'
  have hzeros : ∀ j, (monicLaguerre (n+2)).eval (v j) = 0 :=
    mergeInterlacing_eval_zero l r m _ hl0 hr0 hm0
  refine ⟨v,⟨hmono,fun i => hl.1.trans_le (hmono.monotone (Fin.zero_le i)),?_⟩,hI'⟩
  exact monic_eq_prod_of_distinct_roots (monicLaguerre_monic _) (monicLaguerre_natDegree _)
    v hmono.injective hzeros

end WachsCompleteGraph
