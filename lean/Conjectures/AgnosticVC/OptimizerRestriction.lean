module

public import Conjectures.AgnosticVC.OptimizerEnergy

@[expose] public section

open scoped BigOperators Topology
open MeasureTheory Set

namespace AgnosticVC

variable {α β κ : Type*} [Fintype α] [Fintype β] [Fintype κ]

theorem mass_log_sq_le_four {x : ℝ} (hx : 0 ≤ x) (hx₁ : x ≤ 1) : x * (Real.log x)^2 ≤ 4 := by
  rcases hx.eq_or_lt with h | h
  · rw [← h]
    norm_num
  have hs := Real.sqrt_pos.mpr h
  have hl := Real.log_le_sub_one_of_pos (inv_pos.mpr hs)
  rw [Real.log_inv, Real.log_sqrt hx] at hl
  have hm := mul_le_mul_of_nonneg_left hl hs.le
  rw [mul_sub, mul_inv_cancel₀ hs.ne', mul_one] at hm
  have htop : √x * -Real.log x ≤ 2 := by nlinarith only [hm, hs.le]
  have hbot : 0 ≤ √x * -Real.log x :=
    mul_nonneg hs.le (neg_nonneg.mpr (Real.log_nonpos hx hx₁))
  have hsq := pow_le_pow_left₀ hbot htop 2
  rw [mul_pow, Real.sq_sqrt hx, neg_sq] at hsq
  norm_num at hsq
  exact hsq

omit [Fintype β] in
private theorem refined_marginal_le (r : α → β) (f : α → Bool) {p : α → ℝ}
    (hp : ∀ a, 0 ≤ p a) (b : β) (v : Bool) :
    marginal (fun a => (r a, f a)) p (b, v) ≤ marginal r p b := by
  classical
  unfold marginal
  apply Finset.sum_le_sum_of_subset_of_nonneg _ fun a _ _ => hp a
  intro a ha
  simp only [Finset.mem_filter, Finset.mem_univ, true_and, Prod.mk.injEq] at ha ⊢
  exact ha.1

/-- The squared norm of the conditional log probability from a binary refinement is uniformly
bounded, even if some refined cells are missing. -/
theorem binary_log_refinement_bound (r : α → β) (f : α → Bool) {p : α → ℝ}
    (hp : IsLaw p) (hpos : ∀ a, 0 < p a) :
    ∑ a, p a * (Real.log (marginal (fun x => (r x, f x)) p (r a, f a)) -
      Real.log (marginal r p (r a)))^2 ≤ 8 := by
  let R := fun a => (r a, f a)
  let g := fun b : β × Bool => (Real.log (marginal R p b) - Real.log (marginal r p b.1))^2
  change ∑ a, p a * g (R a) ≤ 8
  rw [← marginal_weighted_sum R p g, Fintype.sum_prod_type]
  have he (b : β) (v : Bool) : marginal R p (b, v) * g (b, v) ≤ 4 * marginal r p b := by
    by_cases h : ∃ a, R a = (b, v)
    · obtain ⟨a, ha⟩ := h
      have hr : r a = b := congrArg Prod.fst ha
      have h₁ : 0 < marginal R p (b, v) := ha ▸ marginal_pos R hpos a
      have h₂ : 0 < marginal r p b := hr ▸ marginal_pos r hpos a
      have h₃ := refined_marginal_le r f hp.1 b v
      have hb := mass_log_sq_le_four (div_nonneg h₁.le h₂.le) ((div_le_one h₂).mpr h₃)
      have hh := mul_le_mul_of_nonneg_right hb h₂.le
      rw [Real.log_div h₁.ne' h₂.ne'] at hh
      dsimp [g]
      rwa [mul_assoc, mul_comm ((Real.log (marginal R p (b, v)) -
        Real.log (marginal r p b))^2), ← mul_assoc, div_mul_cancel₀ _ h₂.ne'] at hh
    · rw [marginal_zero_of_no_preimage R p h, zero_mul]
      exact mul_nonneg (by norm_num) (marginal_nonneg r hp.1 b)
  have hsum := Finset.sum_le_sum fun b (_ : b ∈ Finset.univ) =>
    Finset.sum_le_sum fun v (_ : v ∈ Finset.univ) => he b v
  calc
    _ ≤ ∑ b : β, ∑ _ : Bool, 4 * marginal r p b := hsum
    _ = 8 := by simp [← Finset.mul_sum, (hp.marginal r).2]; norm_num

/-- Two one-bit refinements of the same restriction have a uniformly bounded squared
difference of restriction gradients. -/
theorem binary_replacement_gradient_bound (r : α → β) (f g : α → Bool) {p : α → ℝ}
    (hp : IsLaw p) (hpos : ∀ a, 0 < p a) :
    ∑ a, p a * (Real.log (marginal (fun x => (r x, f x)) p (r a, f a)) -
      Real.log (marginal (fun x => (r x, g x)) p (r a, g a)))^2 ≤ 32 := by
  have hf := binary_log_refinement_bound r f hp hpos
  have hg := binary_log_refinement_bound r g hp hpos
  have h (a : α) (x y z : ℝ) : p a * (x - y)^2 ≤
      2 * (p a * (x - z)^2) + 2 * (p a * (y - z)^2) := by
    have hh := mul_nonneg (hp.1 a) (sq_nonneg (x + y - 2 * z))
    nlinarith only [hh]
  have hsum := Finset.sum_le_sum fun a (_ : a ∈ Finset.univ) => h a
    (Real.log (marginal (fun x => (r x, f x)) p (r a, f a)))
    (Real.log (marginal (fun x => (r x, g x)) p (r a, g a)))
    (Real.log (marginal r p (r a)))
  rw [Finset.sum_add_distrib, ← Finset.mul_sum, ← Finset.mul_sum] at hsum
  linarith only [hsum, hf, hg]

/-- For nonnegative coupling weights, a pointwise bound for the weighted squared norm of each
changed gradient controls the norm of their weighted sum. -/
theorem weighted_gradient_sum_bound (weight : κ → ℝ) (gradient : κ → α → ℝ)
    {p : α → ℝ} (hp : ∀ a, 0 ≤ p a) (hw : ∀ j, 0 ≤ weight j) {K : ℝ}
    (h : ∀ j, ∑ a, p a * (gradient j a)^2 ≤ K) :
    ∑ a, p a * (∑ j, weight j * gradient j a)^2 ≤ (∑ j, weight j)^2 * K := by
  have hcs (a : α) : (∑ j, weight j * gradient j a)^2 ≤
      (∑ j, weight j) * ∑ j, weight j * (gradient j a)^2 := by
    apply Finset.sum_sq_le_sum_mul_sum_of_sq_le_mul _ (fun j _ => hw j)
      (fun j _ => mul_nonneg (hw j) (sq_nonneg _))
    intro j _
    exact le_of_eq (by ring)
  have hs := Finset.sum_le_sum fun a (_ : a ∈ Finset.univ) => mul_le_mul_of_nonneg_left (hcs a) (hp a)
  have hterm (a : α) : p a * ((∑ j, weight j) * ∑ j, weight j * (gradient j a)^2) =
      (∑ j, weight j) * ∑ j, weight j * (p a * (gradient j a)^2) := by
    rw [mul_comm (p a), mul_assoc]
    congr 1
    rw [Finset.sum_mul]
    exact Finset.sum_congr rfl fun j _ => by ring
  simp only [hterm, ← Finset.mul_sum] at hs
  rw [Finset.sum_comm] at hs
  simp only [← Finset.mul_sum] at hs
  have hn : 0 ≤ ∑ j, weight j := Finset.sum_nonneg fun j _ => hw j
  have hb := Finset.sum_le_sum fun j (_ : j ∈ Finset.univ) => mul_le_mul_of_nonneg_left (h j) (hw j)
  rw [← Finset.sum_mul] at hb
  have hm := mul_le_mul_of_nonneg_left hb hn
  exact hs.trans (by simpa only [← mul_assoc, ← pow_two] using hm)

/-- Interpolate between two restrictions for each index while retaining the same loss and
full entropy. The squared norm of the weighted gradient change controls both endpoint laws. -/
theorem optimizer_replace_restrictions [Nonempty α] {γ δ : κ → Type u}
    [∀ j, Fintype (γ j)] [∀ j, Fintype (δ j)]
    (loss : α → ℝ) {τ : ℝ} (weight : κ → ℝ)
    (before : ∀ j, α → γ j) (after : ∀ j, α → δ j) (hτ : 0 < τ)
    (hw : ∀ j, 0 ≤ weight j) {K : ℝ}
    (hF : ∀ p : α → ℝ, IsLaw p → (∀ a, 0 < p a) → ∑ a, p a * (∑ j, weight j *
      (Real.log (marginal (after j) p (after j a)) -
        Real.log (marginal (before j) p (before j a))))^2 ≤ K) :
    hellingerSq (optimizer loss τ weight after) (optimizer loss τ weight before) ≤ K / (4 * τ^2) := by
  let target : κ ⊕ κ → Type _ := Sum.elim γ δ
  let (i : κ ⊕ κ) : Fintype (target i) := match i with
    | Sum.inl j => ‹∀ j, Fintype (γ j)› j
    | Sum.inr j => ‹∀ j, Fintype (δ j)› j
  let r : ∀ i, α → target i
    | Sum.inl j => before j
    | Sum.inr j => after j
  let coeff : κ ⊕ κ → ℝ := Sum.elim weight (fun _ => 0)
  let rate : κ ⊕ κ → ℝ := Sum.elim (fun j => -weight j) weight
  have hcoef (u : ℝ) (hu : u ∈ Icc (0 : ℝ) 1) (i : κ ⊕ κ) : 0 ≤ coeff i + u * rate i := by
    rcases i with j | j
    · change 0 ≤ weight j + u * -weight j
      rw [show weight j + u * -weight j = (1 - u) * weight j by ring]
      exact mul_nonneg (sub_nonneg.mpr hu.2) (hw j)
    · exact add_nonneg le_rfl (mul_nonneg hu.1 (hw j))
  have hforce (p : α → ℝ) (a : α) : gradientForcing (0 : α → ℝ) rate r p a =
      ∑ j, weight j * (Real.log (marginal (after j) p (after j a)) -
        Real.log (marginal (before j) p (before j a))) := by
    simp only [gradientForcing, Pi.zero_apply, zero_add, Fintype.sum_sum_type]
    change (∑ j, -weight j * (Real.log (marginal (before j) p (before j a)) + 1)) +
      (∑ j, weight j * (Real.log (marginal (after j) p (after j a)) + 1)) = _
    rw [← Finset.sum_add_distrib]
    exact Finset.sum_congr rfl fun j _ => by ring
  have h := optimizer_hellingerSq_le_forcing loss 0 τ coeff rate r
    (a := 0) (b := 1) (by norm_num) hτ hcoef
    (fun p hp hpos => ⟨0, by simpa only [hforce, sub_zero] using hF p hp hpos⟩)
  have hzero (p : α → ℝ) : objective loss τ (fun i => coeff i + (0 : ℝ) * rate i) r p =
      objective loss τ weight before p := by
    simp [objective, Fintype.sum_sum_type, coeff, r]
    rfl
  have hone (p : α → ℝ) : objective loss τ (fun i => coeff i + (1 : ℝ) * rate i) r p =
      objective loss τ weight after p := by
    simp [objective, Fintype.sum_sum_type, coeff, rate, r]
    rfl
  have hopt0 : optimizer loss τ (fun i => coeff i + (0 : ℝ) * rate i) r =
      optimizer loss τ weight before := by
    apply minimizer_unique hτ hw (optimizer_isLaw _ _ _ _) (optimizer_isLaw _ _ _ _) _
      (optimizer_min _ _ _ _)
    intro q hq
    simpa only [hzero] using optimizer_min loss τ (fun i => coeff i + (0 : ℝ) * rate i) r q hq
  have hopt1 : optimizer loss τ (fun i => coeff i + (1 : ℝ) * rate i) r =
      optimizer loss τ weight after := by
    apply minimizer_unique hτ hw (optimizer_isLaw _ _ _ _) (optimizer_isLaw _ _ _ _) _
      (optimizer_min _ _ _ _)
    intro q hq
    simpa only [hone] using optimizer_min loss τ (fun i => coeff i + (1 : ℝ) * rate i) r q hq
  simp only [one_mul] at hopt1
  simpa only [Pi.zero_apply, mul_zero, add_zero, hopt0, hopt1, sub_zero, one_pow, one_mul] using h

end AgnosticVC
