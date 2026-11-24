module

public import Conjectures.GesselZhuangHistories
public import Conjectures.GesselZhuangPathPolynomial

/-!
# Gessel–Zhuang's pinnacle-set gamma-positivity conjecture

The exact weighted enumeration of finite insertion histories is the refined
polynomial recurrence. The state index in the recurrence is the reverse of the
left-to-right block index in a history.
-/

@[expose] public section

namespace GesselZhuang

open Polynomial
open scoped BigOperators

noncomputable def historyRefined {n h : ℕ} (p : HeightPath n h)
    (i : Fin (h + 1)) : ℝ[X] :=
  ∑ H : History p,
    if History.recent p H = i.rev then X ^ History.inverseDescents p H else 0

noncomputable def historyPolynomial {n h : ℕ} (p : HeightPath n h) : ℝ[X] :=
  ∑ H : History p, X ^ History.inverseDescents p H

theorem cutPolynomial_stateSum {α : Type*} [Fintype α] {m : ℕ}
    (r : α → Fin m) (w : α → ℝ[X]) (k : ℕ) :
    cutPolynomial (fun i => ∑ a, if r a = i.rev then w a else 0) k =
      ∑ a, if (r a).rev.val < k then X * w a else w a := by
  classical
  unfold cutPolynomial
  have hterm (i : Fin m) :
      (if i.val < k then X * (∑ a, if r a = i.rev then w a else 0)
        else ∑ a, if r a = i.rev then w a else 0) =
      ∑ a, if r a = i.rev then (if i.val < k then X * w a else w a) else 0 := by
    by_cases hi : i.val < k <;> simp [hi, Finset.mul_sum, mul_ite]
  simp_rw [hterm]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro a _
  rw [Finset.sum_eq_single (r a).rev]
  · simp
  · intro i _ hi
    have hne : r a ≠ i.rev := by
      intro heq
      apply hi
      apply Fin.rev_injective
      simpa using heq.symm
    simp [hne]
  · simp

theorem X_pow_add_indicator (d : ℕ) (P : Prop) [Decidable P] :
    (X : ℝ[X]) ^ (d + if P then 1 else 0) =
      if P then X * X ^ d else X ^ d := by
  split_ifs <;> simp [pow_succ, mul_comm]

theorem historyRefined_up {n h : ℕ} (p : HeightPath n h) (i : Fin (h + 2)) :
    historyRefined (.up p) i = upVector (historyRefined p) i := by
  classical
  rw [upVector]
  unfold historyRefined
  rw [cutPolynomial_stateSum]
  change (∑ H : History p × Fin (h + 2),
      if H.2 = i.rev then
        X ^ (History.inverseDescents p H.1 +
          if H.2.val ≤ (History.recent p H.1).val then 1 else 0) else 0) = _
  rw [Fintype.sum_prod_type]
  apply Finset.sum_congr rfl
  intro H _
  simp only [Finset.sum_ite_eq', Finset.mem_univ, ite_true, X_pow_add_indicator]
  have hr := (History.recent p H).isLt
  have hi := i.isLt
  have heq : i.rev.val ≤ (History.recent p H).val ↔
      (History.recent p H).rev.val < i.val := by
    change h + 2 - (i.val + 1) ≤ (History.recent p H).val ↔
      h + 1 - ((History.recent p H).val + 1) < i.val
    omega
  simp only [heq]

theorem historyRefined_flat {n h : ℕ} (p : HeightPath n h) (i : Fin (h + 1)) :
    historyRefined (.flat p) i = flatVector (historyRefined p) i := by
  classical
  rw [flatVector]
  unfold historyRefined
  rw [cutPolynomial_stateSum, cutPolynomial_stateSum]
  change (∑ H : History p × (Fin (h + 1) × Bool),
      if H.2.1 = i.rev then
        X ^ (History.inverseDescents p H.1 +
          if H.2.2 then
            (if H.2.1.val ≤ (History.recent p H.1).val then 1 else 0)
          else (if H.2.1.val < (History.recent p H.1).val then 1 else 0)) else 0) = _
  rw [Fintype.sum_prod_type, ← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro H _
  rw [Fintype.sum_prod_type]
  simp only [Fintype.sum_bool, Bool.false_eq_true, ite_false, ite_true,
    Finset.sum_add_distrib, Finset.sum_ite_eq', Finset.mem_univ, X_pow_add_indicator]
  have hr := (History.recent p H).isLt
  have hi := i.isLt
  have hlt : i.rev.val < (History.recent p H).val ↔
      (History.recent p H).rev.val < i.val := by
    change h + 1 - (i.val + 1) < (History.recent p H).val ↔
      h + 1 - ((History.recent p H).val + 1) < i.val
    omega
  have hle : i.rev.val ≤ (History.recent p H).val ↔
      (History.recent p H).rev.val < i.val + 1 := by
    change h + 1 - (i.val + 1) ≤ (History.recent p H).val ↔
      h + 1 - ((History.recent p H).val + 1) < i.val + 1
    omega
  simp only [hlt, hle]
  exact add_comm _ _

theorem historyRefined_down {n h : ℕ} (p : HeightPath n (h + 1))
    (i : Fin (h + 1)) : historyRefined (.down p) i = downVector (historyRefined p) i := by
  classical
  rw [downVector]
  unfold historyRefined
  rw [cutPolynomial_stateSum]
  change (∑ H : History p × Fin (h + 1),
      if H.2 = i.rev then
        X ^ (History.inverseDescents p H.1 +
          if H.2.val < (History.recent p H.1).val then 1 else 0) else 0) = _
  rw [Fintype.sum_prod_type]
  apply Finset.sum_congr rfl
  intro H _
  simp only [Finset.sum_ite_eq', Finset.mem_univ, ite_true, X_pow_add_indicator]
  have hr := (History.recent p H).isLt
  have hi := i.isLt
  have heq : i.rev.val < (History.recent p H).val ↔
      (History.recent p H).rev.val < i.val + 1 := by
    change h + 1 - (i.val + 1) < (History.recent p H).val ↔
      h + 2 - ((History.recent p H).val + 1) < i.val + 1
    omega
  simp only [heq]

theorem refinedPolynomial_eq_historyRefined {n h : ℕ} (p : HeightPath n h) :
    refinedPolynomial p = historyRefined p := by
  induction p with
  | start =>
      funext i
      have hi : i = 0 := by apply Fin.ext; have := i.isLt; omega
      subst i
      change (1 : ℝ[X]) = ∑ H : History HeightPath.start,
        if History.recent HeightPath.start H = (0 : Fin 1).rev then
          X ^ History.inverseDescents HeightPath.start H else 0
      change (1 : ℝ[X]) = ∑ _ : Unit, 1
      simp
  | up p ih =>
      funext i
      rw [refinedPolynomial, ih, historyRefined_up]
  | flat p ih =>
      funext i
      rw [refinedPolynomial, ih, historyRefined_flat]
  | down p ih =>
      funext i
      rw [refinedPolynomial, ih, historyRefined_down]

theorem pathPolynomial_eq_historyPolynomial {n h : ℕ} (p : HeightPath n h) :
    pathPolynomial p = historyPolynomial p := by
  classical
  simp only [pathPolynomial, refinedPolynomial_eq_historyRefined,
    historyRefined, historyPolynomial]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro H _
  rw [Finset.sum_eq_single (History.recent p H).rev]
  · simp
  · intro i _ hi
    have hne : History.recent p H ≠ i.rev := by
      intro heq
      apply hi
      apply Fin.rev_injective
      simpa using heq.symm
    simp [hne]
  · simp

end GesselZhuang
