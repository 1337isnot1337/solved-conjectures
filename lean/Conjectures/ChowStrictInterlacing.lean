module

public import Mathlib.Algebra.Polynomial.Derivative
public import Mathlib.Algebra.Polynomial.Roots
public import Mathlib.Analysis.Polynomial.Basic
public import Mathlib.Topology.Algebra.Polynomial
public import Mathlib.Topology.Order.IntermediateValue
public import Mathlib.Order.Fin.Basic
public import Mathlib.Tactic.Linarith
public import Lean.Elab.Tactic.Omega
public import Mathlib.Tactic.Ring

/-!
# Strict interlacing from signs at simple negative roots

The hypotheses concern complete real linear-factor products and the actual
derivative. The conclusion supplies a complete factorization of the next
polynomial, including the two outer intervals.
-/

@[expose] public section

namespace Chow

open Polynomial Filter
open scoped BigOperators Topology

theorem derivative_eval_ordered_product {d : ℕ} (p : ℝ[X]) (a : Fin d → ℝ)
    (hp : p = C p.leadingCoeff * ∏ j, (X - C (a j))) (i : Fin d) :
    p.derivative.eval (a i) =
      p.leadingCoeff * ∏ j ∈ Finset.univ.erase i, (a i - a j) := by
  classical
  let r : ℝ[X] := ∏ j ∈ Finset.univ.erase i, (X - C (a j))
  have hfactor : p = C p.leadingCoeff * ((X - C (a i)) * r) := by
    calc
      p = C p.leadingCoeff * ∏ j, (X - C (a j)) := hp
      _ = _ := congrArg (fun r : ℝ[X] => C p.leadingCoeff * r)
        (Finset.mul_prod_erase _ _ (Finset.mem_univ i)).symm
  conv_lhs => rw [hfactor]
  simp [derivative_mul, r, eval_prod]

theorem derivative_ne_zero_of_ordered_product {d : ℕ} (p : ℝ[X])
    (a : Fin d → ℝ) (ha : StrictMono a)
    (hp : p = C p.leadingCoeff * ∏ j, (X - C (a j)))
    (hpLead : 0 < p.leadingCoeff) (i : Fin d) :
    p.derivative.eval (a i) ≠ 0 := by
  classical
  rw [derivative_eval_ordered_product p a hp i]
  apply mul_ne_zero (ne_of_gt hpLead)
  apply Finset.prod_ne_zero_iff.mpr
  intro j hj
  exact sub_ne_zero.mpr (fun h => (Finset.mem_erase.mp hj).1 (ha.injective h).symm)

private theorem ordered_product_degree {d : ℕ} (p : ℝ[X]) (a : Fin d → ℝ)
    (hp : p = C p.leadingCoeff * ∏ j, (X - C (a j)))
    (hpLead : 0 < p.leadingCoeff) : p.natDegree = d := by
  conv_lhs => rw [hp]
  rw [natDegree_C_mul (ne_of_gt hpLead)]
  simp

private theorem derivative_last_pos {d : ℕ} (p : ℝ[X]) (a : Fin d → ℝ)
    (ha : StrictMono a) (hp : p = C p.leadingCoeff * ∏ j, (X - C (a j)))
    (hpLead : 0 < p.leadingCoeff) (i : Fin d) (hi : i.val + 1 = d) :
    0 < p.derivative.eval (a i) := by
  classical
  rw [derivative_eval_ordered_product p a hp i]
  apply mul_pos hpLead
  apply Finset.prod_pos
  intro j hj
  apply sub_pos.mpr
  apply ha
  have hji := (Finset.mem_erase.mp hj).1
  have hjlt := j.isLt
  have hne : j.val ≠ i.val := fun h => hji (Fin.ext h)
  omega

private theorem eval_mul_first_derivative_neg {d : ℕ} (p : ℝ[X])
    (a : Fin d → ℝ) (ha : StrictMono a)
    (hp : p = C p.leadingCoeff * ∏ j, (X - C (a j)))
    (hpLead : 0 < p.leadingCoeff) (i : Fin d) (hi : i.val = 0)
    (x : ℝ) (hx : x < a i) : p.eval x * p.derivative.eval (a i) < 0 := by
  classical
  have heval : p.eval x = p.leadingCoeff *
      ((x - a i) * ∏ j ∈ Finset.univ.erase i, (x - a j)) := by
    conv_lhs => rw [hp]
    simp only [eval_mul, eval_C, eval_prod, eval_sub, eval_X]
    rw [← Finset.mul_prod_erase _ _ (Finset.mem_univ i)]
  have hprod : 0 < ∏ j ∈ Finset.univ.erase i, ((x - a j) * (a i - a j)) := by
    apply Finset.prod_pos
    intro j hj
    have hji := (Finset.mem_erase.mp hj).1
    have hne : j.val ≠ i.val := fun h => hji (Fin.ext h)
    have hij : i < j := by omega
    have hij' := ha hij
    exact mul_pos_of_neg_of_neg (sub_neg.mpr (hx.trans hij')) (sub_neg.mpr hij')
  rw [heval, derivative_eval_ordered_product p a hp i]
  calc
    _ = (p.leadingCoeff * p.leadingCoeff) * (x - a i) *
        ∏ j ∈ Finset.univ.erase i, ((x - a j) * (a i - a j)) := by
      rw [Finset.prod_mul_distrib]
      ring
    _ < 0 := mul_neg_of_neg_of_pos
      (mul_neg_of_pos_of_neg (mul_pos hpLead hpLead) (sub_neg.mpr hx)) hprod

private theorem adjacent_derivative_product_neg {d : ℕ} (p : ℝ[X])
    (a : Fin d → ℝ) (ha : StrictMono a)
    (hp : p = C p.leadingCoeff * ∏ k, (X - C (a k)))
    (hpLead : 0 < p.leadingCoeff) (i j : Fin d) (hij : i.val + 1 = j.val) :
    p.derivative.eval (a i) * p.derivative.eval (a j) < 0 := by
  classical
  have hijlt : i < j := by omega
  have hne : i ≠ j := ne_of_lt hijlt
  let s : Finset (Fin d) := (Finset.univ.erase i).erase j
  have hi : p.derivative.eval (a i) = p.leadingCoeff *
      ((a i - a j) * ∏ k ∈ s, (a i - a k)) := by
    rw [derivative_eval_ordered_product p a hp i]
    congr 1
    exact (Finset.mul_prod_erase _ _ (by simp [hne.symm])).symm
  have hj : p.derivative.eval (a j) = p.leadingCoeff *
      ((a j - a i) * ∏ k ∈ s, (a j - a k)) := by
    rw [derivative_eval_ordered_product p a hp j]
    congr 1
    simpa only [s, Finset.erase_right_comm] using
      (Finset.mul_prod_erase (Finset.univ.erase j) (fun k => a j - a k)
        (a := i) (by simp [hne])).symm
  have hprod : 0 < ∏ k ∈ s, ((a i - a k) * (a j - a k)) := by
    apply Finset.prod_pos
    intro k hk
    have hki : k ≠ i := (Finset.mem_erase.mp (Finset.mem_erase.mp hk).2).1
    have hkj : k ≠ j := (Finset.mem_erase.mp hk).1
    have hki' : k.val ≠ i.val := fun h => hki (Fin.ext h)
    have hkj' : k.val ≠ j.val := fun h => hkj (Fin.ext h)
    have hkcase : k < i ∨ j < k := by omega
    rcases hkcase with hk | hk
    · exact mul_pos (sub_pos.mpr (ha hk)) (sub_pos.mpr (ha (hk.trans hijlt)))
    · exact mul_pos_of_neg_of_neg (sub_neg.mpr (ha (hijlt.trans hk)))
        (sub_neg.mpr (ha hk))
  rw [hi, hj]
  calc
    _ = (p.leadingCoeff * p.leadingCoeff) * ((a i - a j) * (a j - a i)) *
        ∏ k ∈ s, ((a i - a k) * (a j - a k)) := by
      rw [Finset.prod_mul_distrib]
      ring
    _ < 0 := mul_neg_of_neg_of_pos
      (mul_neg_of_pos_of_neg (mul_pos hpLead hpLead)
        (mul_neg_of_neg_of_pos (sub_neg.mpr (ha hijlt)) (sub_pos.mpr (ha hijlt)))) hprod

private theorem positive_mul_of_negative_shared {x y c : ℝ}
    (hx : x * c < 0) (hy : y * c < 0) : 0 < x * y := by
  rcases mul_neg_iff.mp hx with hx | hx <;> rcases mul_neg_iff.mp hy with hy | hy
  · exact mul_pos hx.1 hy.1
  · exact False.elim (lt_asymm hx.2 hy.2)
  · exact False.elim (lt_asymm hy.2 hx.2)
  · exact mul_pos_of_neg_of_neg hx.1 hy.1

private theorem factorization_of_distinct_roots {d : ℕ} (q : ℝ[X])
    (b : Fin d → ℝ) (hb : Function.Injective b) (hqdeg : q.natDegree = d)
    (hq : q ≠ 0) (hroot : ∀ i, q.eval (b i) = 0) :
    q = C q.leadingCoeff * ∏ i, (X - C (b i)) := by
  classical
  let s : Finset ℝ := Finset.univ.image b
  have hcard : s.card = d := by simp [s, Finset.card_image_of_injective _ hb]
  have hroots : q.roots = s.val :=
    roots_eq_of_natDegree_le_card_of_ne_zero
      (by intro x hx; obtain ⟨i, _, rfl⟩ := Finset.mem_image.mp hx; exact hroot i)
      (by rw [hqdeg, hcard]) hq
  have hfull : q.roots.card = q.natDegree := by rw [hroots]; simpa [hqdeg] using hcard
  calc
    q = C q.leadingCoeff * (q.roots.map (fun x => X - C x)).prod :=
      (C_leadingCoeff_mul_prod_multiset_X_sub_C hfull).symm
    _ = _ := by
      rw [hroots]
      congr 1
      change (∏ x ∈ s, (X - C x)) = _
      exact Finset.prod_image hb.injOn

private theorem root_between_adjacent {d : ℕ} (p q : ℝ[X]) (a : Fin d → ℝ)
    (ha : StrictMono a) (hp : p = C p.leadingCoeff * ∏ k, (X - C (a k)))
    (hpLead : 0 < p.leadingCoeff)
    (hsign : ∀ i, q.eval (a i) * p.derivative.eval (a i) < 0)
    (i j : Fin d) (hij : i.val + 1 = j.val) :
    ∃ x, x ∈ Set.Ioo (a i) (a j) ∧ q.eval x = 0 := by
  have hd := adjacent_derivative_product_neg p a ha hp hpLead i j hij
  have hright : 0 < q.eval (a j) * p.derivative.eval (a i) :=
    positive_mul_of_negative_shared (hsign j) hd
  have hleft := hsign i
  have hab : a i < a j := ha (by omega)
  obtain ⟨x, hx, hzero⟩ := intermediate_value_Ioo hab.le
    (q.continuous.mul_const (p.derivative.eval (a i))).continuousOn ⟨hleft, hright⟩
  exact ⟨x, hx, (mul_eq_zero.mp hzero).resolve_right
    (derivative_ne_zero_of_ordered_product p a ha hp hpLead i)⟩

private theorem root_right_of_last {d : ℕ} (p q : ℝ[X]) (a : Fin d → ℝ)
    (ha : StrictMono a) (hneg : ∀ i, a i < 0)
    (hp : p = C p.leadingCoeff * ∏ k, (X - C (a k)))
    (hpLead : 0 < p.leadingCoeff) (hq0 : 0 < q.eval 0)
    (hsign : ∀ i, q.eval (a i) * p.derivative.eval (a i) < 0)
    (i : Fin d) (hi : i.val + 1 = d) :
    ∃ x, x ∈ Set.Ioo (a i) 0 ∧ q.eval x = 0 := by
  have hd := derivative_last_pos p a ha hp hpLead i hi
  have hleft : q.eval (a i) < 0 := by
    rcases mul_neg_iff.mp (hsign i) with h | h
    · exact False.elim (lt_asymm h.2 hd)
    · exact h.1
  exact intermediate_value_Ioo (hneg i).le q.continuous.continuousOn ⟨hleft, hq0⟩

private theorem root_left_of_first {d : ℕ} (p q : ℝ[X]) (a : Fin d → ℝ)
    (ha : StrictMono a) (hp : p = C p.leadingCoeff * ∏ k, (X - C (a k)))
    (hpLead : 0 < p.leadingCoeff) (hqdeg : q.natDegree = d + 1)
    (hqLead : 0 < q.leadingCoeff)
    (hsign : ∀ i, q.eval (a i) * p.derivative.eval (a i) < 0)
    (i : Fin d) (hi : i.val = 0) :
    ∃ x, x < a i ∧ q.eval x = 0 := by
  have hpdeg := ordered_product_degree p a hp hpLead
  have hratio : Tendsto (fun x : ℝ => q.eval x / p.eval x) atBot atBot := by
    apply (q.isEquivalent_atBot_div p).symm.tendsto_atBot
    have he : ((d + 1 : ℕ) : ℤ) - (d : ℤ) = 1 := by omega
    simpa only [hqdeg, hpdeg, he, zpow_one, id] using
      (Filter.Tendsto.const_mul_atBot (div_pos hqLead hpLead)
        (tendsto_id : Tendsto (fun x : ℝ => x) atBot atBot))
  obtain ⟨y, hy, hquot⟩ :=
    ((eventually_lt_atBot (a i)).and (hratio.eventually (eventually_lt_atBot 0))).exists
  have hprod := eval_mul_first_derivative_neg p a ha hp hpLead i hi y hy
  have hpy : p.eval y ≠ 0 := by
    intro h
    rw [h, zero_mul] at hprod
    exact (lt_irrefl 0) hprod
  have hpositive : 0 < q.eval y * p.derivative.eval (a i) := by
    have h := mul_pos_of_neg_of_neg hquot hprod
    simpa only [← mul_assoc, div_mul_cancel₀ _ hpy] using h
  obtain ⟨x, hx, hzero⟩ := intermediate_value_Ioo' hy.le
    (q.continuous.mul_const (p.derivative.eval (a i))).continuousOn
    ⟨hsign i, hpositive⟩
  exact ⟨x, hx.2, (mul_eq_zero.mp hzero).resolve_right
    (derivative_ne_zero_of_ordered_product p a ha hp hpLead i)⟩

/-- Signs against the derivative at every simple negative root force a full
strictly interlacing family of negative roots in the next degree. -/
theorem strict_interlacing_extension {d : ℕ} (hd : 0 < d) (p q : ℝ[X])
    (a : Fin d → ℝ) (ha : StrictMono a) (hneg : ∀ i, a i < 0)
    (hp : p = C p.leadingCoeff * ∏ i, (X - C (a i)))
    (hpLead : 0 < p.leadingCoeff) (hqdeg : q.natDegree = d + 1)
    (hqLead : 0 < q.leadingCoeff) (hq0 : 0 < q.eval 0)
    (hsign : ∀ i, q.eval (a i) * p.derivative.eval (a i) < 0) :
    ∃ b : Fin (d + 1) → ℝ, StrictMono b ∧ (∀ i, b i < 0) ∧
      (∀ i : Fin d, b i.castSucc < a i ∧ a i < b i.succ) ∧
      q = C q.leadingCoeff * ∏ j, (X - C (b j)) := by
  classical
  let first : Fin d := ⟨0, hd⟩
  let last : Fin d := ⟨d - 1, by omega⟩
  have hinterval (i : Fin (d + 1)) : ∃ x : ℝ, q.eval x = 0 ∧ x < 0 ∧
      (∀ j : Fin d, i.val = j.val → x < a j) ∧
      (∀ j : Fin d, i.val = j.val + 1 → a j < x) := by
    by_cases hi0 : i.val = 0
    · obtain ⟨x, hx, hroot⟩ := root_left_of_first p q a ha hp hpLead hqdeg hqLead
        hsign first rfl
      refine ⟨x, hroot, hx.trans (hneg first), ?_, ?_⟩
      · intro j hij
        have hj : j = first := Fin.ext (by dsimp [first]; omega)
        simpa only [hj] using hx
      · intro j hij
        omega
    by_cases hid : i.val = d
    · obtain ⟨x, hx, hroot⟩ := root_right_of_last p q a ha hneg hp hpLead hq0
        hsign last (by dsimp [last]; omega)
      refine ⟨x, hroot, hx.2, ?_, ?_⟩
      · intro j hij
        have := j.isLt
        omega
      · intro j hij
        have hj : j = last := Fin.ext (by dsimp [last]; omega)
        simpa only [hj] using hx.1
    · have hilt : i.val < d := by have := i.isLt; omega
      let j : Fin d := ⟨i.val, hilt⟩
      let k : Fin d := ⟨i.val - 1, by omega⟩
      obtain ⟨x, hx, hroot⟩ := root_between_adjacent p q a ha hp hpLead hsign k j
        (by dsimp [k, j]; omega)
      refine ⟨x, hroot, hx.2.trans (hneg j), ?_, ?_⟩
      · intro l hil
        have hl : l = j := Fin.ext (by dsimp [j]; omega)
        simpa only [hl] using hx.2
      · intro l hil
        have hl : l = k := Fin.ext (by dsimp [k]; omega)
        simpa only [hl] using hx.1
  choose b hroot hbneg hupper hlower using hinterval
  have hbounds (i : Fin d) : b i.castSucc < a i ∧ a i < b i.succ :=
    ⟨hupper i.castSucc i rfl, hlower i.succ i rfl⟩
  have hb : StrictMono b := Fin.strictMono_iff_lt_succ.mpr fun i =>
    (hbounds i).1.trans (hbounds i).2
  refine ⟨b, hb, hbneg, hbounds, ?_⟩
  exact factorization_of_distinct_roots q b hb.injective hqdeg
    (leadingCoeff_ne_zero.mp (ne_of_gt hqLead)) hroot

end Chow
