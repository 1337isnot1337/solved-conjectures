import Conjectures.FerroniHigashitaniBinomial
import Mathlib.Algebra.MvPolynomial.Eval
import Mathlib.RingTheory.Binomial
import Mathlib.LinearAlgebra.Span.Defs

/-! Polynomial extension and reflection of weighted composition counts.
The reflection changes every nonnegative coordinate `b` to `-1-b`, with
one sign per summation variable. -/

open Finset Polynomial

namespace FerroniHigashitani

private theorem choose_factorial (t : ℚ) (n : ℕ) :
    (ascPochhammer ℚ n).eval (t - n + 1) = (n.factorial : ℚ) * Ring.choose t n := by
  rw [← ascPochhammer_smeval_eq_eval, Ring.choose,
    ← Ring.factorial_nsmul_multichoose_eq_ascPochhammer, nsmul_eq_mul]

private noncomputable def choosePoly (n : ℕ) : ℚ[X] :=
  C (n.factorial : ℚ)⁻¹ * (ascPochhammer ℚ n).comp (X - C (n : ℚ) + 1)

private theorem eval_choosePoly (n : ℕ) (t : ℚ) : (choosePoly n).eval t = Ring.choose t n := by
  simp only [choosePoly, eval_mul, eval_C, eval_comp, eval_add, eval_sub, eval_X, eval_one]
  rw [choose_factorial, inv_mul_cancel_left₀ (by positivity)]

private theorem choose_neg_rat (t : ℚ) (n : ℕ) :
    Ring.choose (-t) n = (-1 : ℚ) ^ n * Ring.choose (t + n - 1) n := by
  rw [Ring.choose_neg, Units.smul_def, zsmul_eq_mul, Int.cast_negOnePow_natCast]

private theorem choose_mul_self (t : ℚ) (n : ℕ) :
    t * Ring.choose t n = (n : ℚ) * Ring.choose t n + (n + 1 : ℚ) * Ring.choose t (n + 1) := by
  have h := choose_factorial t (n + 1)
  rw [ascPochhammer_succ_left, eval_mul, eval_X, eval_comp, eval_add, eval_X, eval_one,
    Nat.cast_add, Nat.cast_one, show t - ((n : ℚ) + 1) + 1 = t - n by ring,
    choose_factorial, Nat.factorial_succ,
    Nat.cast_mul, Nat.cast_succ] at h
  have hne : (n.factorial : ℚ) ≠ 0 := by positivity
  apply mul_left_cancel₀ hne
  linear_combination h

private abbrev WeightFun (d : ℕ) := (Fin d → ℚ) → ℚ

private noncomputable def chooseProduct {d : ℕ} (a : Fin d → ℕ) : WeightFun d :=
  fun t => ∏ i, Ring.choose (t i) (a i)

private noncomputable def chooseSpan (d : ℕ) : Submodule ℚ (WeightFun d) :=
  Submodule.span ℚ (Set.range (chooseProduct (d := d)))

private theorem chooseProduct_mem {d : ℕ} (a : Fin d → ℕ) : chooseProduct a ∈ chooseSpan d :=
  Submodule.subset_span ⟨a, rfl⟩

private theorem mul_coord_chooseProduct {d : ℕ} (j : Fin d) (a : Fin d → ℕ) :
    (fun t => t j * chooseProduct a t) = (a j : ℚ) • chooseProduct a +
      (a j + 1 : ℚ) • chooseProduct (Function.update a j (a j + 1)) := by
  funext t
  let rest := ∏ i ∈ univ.erase j, Ring.choose (t i) (a i)
  have h (a' : Fin d → ℕ) (he : ∀ i, i ≠ j → a' i = a i) :
      chooseProduct a' t = Ring.choose (t j) (a' j) * rest := by
    unfold chooseProduct
    rw [← mul_prod_erase _ _ (mem_univ j)]
    congr 1
    apply prod_congr rfl
    intro i hi
    rw [he i (ne_of_mem_erase hi)]
  rw [Pi.add_apply, Pi.smul_apply, Pi.smul_apply, smul_eq_mul, smul_eq_mul,
    h a (fun _ _ => rfl), h _ (fun i hi => Function.update_of_ne hi _ _), Function.update_self]
  linear_combination rest * choose_mul_self (t j) (a j)

private theorem mul_coord_mem_chooseSpan {d : ℕ} (j : Fin d) {f : WeightFun d}
    (hf : f ∈ chooseSpan d) : (fun t => t j * f t) ∈ chooseSpan d := by
  unfold chooseSpan at hf
  induction hf using Submodule.span_induction with
  | mem f hf =>
    obtain ⟨a, rfl⟩ := hf
    rw [mul_coord_chooseProduct]
    exact (chooseSpan d).add_mem ((chooseSpan d).smul_mem _ (chooseProduct_mem a))
      ((chooseSpan d).smul_mem _ (chooseProduct_mem _))
  | zero =>
    simp only [Pi.zero_apply, mul_zero]
    exact (chooseSpan d).zero_mem
  | add f g _ _ hf hg =>
    simp only [Pi.add_apply, mul_add]
    exact (chooseSpan d).add_mem hf hg
  | smul a f _ hf =>
    convert (chooseSpan d).smul_mem a hf using 1
    funext t
    simp [mul_left_comm]

private theorem eval_mem_chooseSpan {d : ℕ} (p : MvPolynomial (Fin d) ℚ) :
    (fun t => MvPolynomial.eval t p) ∈ chooseSpan d := by
  induction p using MvPolynomial.induction_on with
  | C c =>
    convert (chooseSpan d).smul_mem c (chooseProduct_mem (fun _ => 0)) using 1
    funext t
    simp [chooseProduct]
  | add p q hp hq =>
    simp only [map_add]
    exact (chooseSpan d).add_mem hp hq
  | mul_X p j hp =>
    simpa [mul_comm] using mul_coord_mem_chooseSpan j hp

private theorem sumCompositions_add {d n : ℕ} (f g : (Fin d → ℕ) → ℚ) :
    sumCompositions d n (fun b => f b + g b) = sumCompositions d n f + sumCompositions d n g := by
  unfold sumCompositions
  induction compositions d n with
  | nil => simp
  | cons b bs ih => simp [ih, add_left_comm, add_assoc]

private theorem sumCompositions_mul {d n : ℕ} (a : ℚ) (f : (Fin d → ℕ) → ℚ) :
    sumCompositions d n (fun b => a * f b) = a * sumCompositions d n f := by
  simp [sumCompositions, List.sum_map_mul_left]

theorem sumCompositions_cast {d n : ℕ} (f : (Fin d → ℕ) → ℕ) :
    sumCompositions d n (fun b => (f b : ℚ)) = (sumCompositions (R := ℕ) d n f : ℚ) := by
  unfold sumCompositions
  induction compositions d n with
  | nil => simp
  | cons b bs ih => simp [ih]

private def Extends (d : ℕ) (f : WeightFun d) (P : ℚ[X]) : Prop :=
  (∀ n : ℕ, P.eval (n : ℚ) = sumCompositions d n (fun b => f (fun i => b i))) ∧
  (∀ k : ℕ, 0 < k → k ≤ d → P.eval (-(k : ℚ)) = 0) ∧
  (∀ n : ℕ, P.eval (-(n : ℚ) - d - 1) =
    (-1 : ℚ) ^ d * sumCompositions d n (fun b => f (fun i => -(b i : ℚ) - 1)))

private theorem chooseProduct_extends {d : ℕ} (a : Fin d → ℕ) :
    Extends d (chooseProduct a) ((choosePoly (d + ∑ i, a i)).comp (X + C (d : ℚ))) := by
  let D := d + ∑ i, a i
  have hD : d ≤ D := Nat.le_add_right _ _
  refine ⟨?_, ?_, ?_⟩
  · intro n
    simp only [eval_comp, eval_add, eval_X, eval_C, eval_choosePoly, chooseProduct,
      Ring.choose_natCast, ← Nat.cast_prod, sumCompositions_cast]
    rw [← Nat.cast_add, Ring.choose_natCast, sumCompositions_falling]
  · intro k hk hd
    simp only [eval_comp, eval_add, eval_X, eval_C, eval_choosePoly]
    rw [neg_add_eq_sub, ← Nat.cast_sub hd, Ring.choose_natCast,
      Nat.choose_eq_zero_of_lt (show d - k < D by omega), Nat.cast_zero]
  · intro n
    have hx : (-(n : ℚ) - d - 1) + d = -((n : ℚ) + 1) := by ring
    have harg (u v : ℕ) : (u : ℚ) + 1 + v - 1 = ((u + v : ℕ) : ℚ) := by
      push_cast
      ring
    simp only [eval_comp, eval_add, eval_X, eval_C, eval_choosePoly, hx, choose_neg_rat]
    have hrise (b : Fin d → ℕ) :
        chooseProduct a (fun i => -(b i : ℚ) - 1) =
          (-1 : ℚ) ^ (∑ i, a i) * ((∏ i, (b i + a i).choose (a i) : ℕ) : ℚ) := by
      unfold chooseProduct
      simp_rw [show ∀ x : ℚ, -x - 1 = -(x + 1) by intro x; ring,
        choose_neg_rat, harg, Ring.choose_natCast, prod_mul_distrib, prod_pow_eq_pow_sum, Nat.cast_prod]
    simp_rw [hrise, sumCompositions_mul, sumCompositions_cast, sumCompositions_rising]
    rw [harg, Ring.choose_natCast, ← mul_assoc, ← pow_add]
    congr 3
    omega

private theorem exists_extension {d : ℕ} {f : WeightFun d} (hf : f ∈ chooseSpan d) :
    ∃ P, Extends d f P := by
  unfold chooseSpan at hf
  induction hf using Submodule.span_induction with
  | mem f hf =>
    obtain ⟨a, rfl⟩ := hf
    exact ⟨_, chooseProduct_extends a⟩
  | zero =>
    refine ⟨0, ?_⟩
    unfold Extends sumCompositions
    simp
  | add f g _ _ hf hg =>
    obtain ⟨P, hP, hP0, hPr⟩ := hf
    obtain ⟨Q, hQ, hQ0, hQr⟩ := hg
    refine ⟨P + Q, ?_, ?_, ?_⟩
    · intro n
      simp [hP, hQ, sumCompositions_add]
    · intro k hk hd
      simp [hP0 k hk hd, hQ0 k hk hd]
    · intro n
      simp [hPr, hQr, sumCompositions_add, mul_add]
  | smul a f _ hf =>
    obtain ⟨P, hP, hP0, hPr⟩ := hf
    refine ⟨C a * P, ?_, ?_, ?_⟩
    · intro n
      simp [hP, sumCompositions_mul]
    · intro k hk hd
      simp [hP0 k hk hd]
    · intro n
      simp [hPr, sumCompositions_mul, mul_left_comm]

/-- The polynomial extension, its initial negative zeros, and its reflected
evaluations for an arbitrary polynomial weight. -/
theorem weightedPrefixPolynomial {d : ℕ} (p : MvPolynomial (Fin d) ℚ) :
    ∃ P : ℚ[X],
      (∀ n : ℕ, P.eval (n : ℚ) = sumCompositions d n (fun b => MvPolynomial.eval (fun i => (b i : ℚ)) p)) ∧
      (∀ k : ℕ, 0 < k → k ≤ d → P.eval (-(k : ℚ)) = 0) ∧
      (∀ n : ℕ, P.eval (-(n : ℚ) - d - 1) =
        (-1 : ℚ) ^ d * sumCompositions d n (fun b => MvPolynomial.eval (fun i => -(b i : ℚ) - 1) p)) :=
  exists_extension (eval_mem_chooseSpan p)

end FerroniHigashitani
