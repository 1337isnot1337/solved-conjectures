module

public import Conjectures.AgnosticVC.OptimizerInterior
public import Mathlib.Analysis.Calculus.LocalExtr.Basic

@[expose] public section

open scoped BigOperators Topology

namespace AgnosticVC

variable {α β κ : Type*} [Fintype α] [Fintype κ]
variable {γ : κ → Type*} [∀ j, Fintype (γ j)]

theorem marginal_zero_of_no_preimage (r : α → β) (p : α → ℝ) {b : β}
    (hb : ¬ ∃ a, r a = b) : marginal r p b = 0 := by
  classical
  unfold marginal
  refine Finset.sum_eq_zero fun a ha => ?_
  exact False.elim (hb ⟨a, (Finset.mem_filter.mp ha).2⟩)

theorem marginal_weighted_sum [Fintype β] (r : α → β) (v : α → ℝ) (f : β → ℝ) :
    ∑ b, marginal r v b * f b = ∑ a, v a * f (r a) := by
  classical
  rw [← Finset.sum_fiberwise _ r (fun a => v a * f (r a))]
  refine Finset.sum_congr rfl fun b _ => ?_
  unfold marginal
  rw [Finset.sum_mul]
  exact Finset.sum_congr rfl fun a ha => by rw [(Finset.mem_filter.mp ha).2]

theorem marginal_line (r : α → β) (p v : α → ℝ) (t : ℝ) (b : β) :
    marginal r (fun a => p a + t * v a) b = marginal r p b + t * marginal r v b := by
  classical
  unfold marginal
  rw [Finset.sum_add_distrib, Finset.mul_sum]

/-- The loss gradient plus the derivatives of full and restricted negative entropies. -/
noncomputable def objectiveGradient (loss : α → ℝ) (τ : ℝ) (coeff : κ → ℝ)
    (restriction : ∀ j, α → γ j) (p : α → ℝ) (a : α) : ℝ :=
  loss a + τ * (Real.log (p a) + 1) +
    ∑ j, coeff j * (Real.log (marginal (restriction j) p (restriction j a)) + 1)

omit [∀ j, Fintype (γ j)] in
theorem expected_gradient_eq (loss : α → ℝ) (τ : ℝ) (coeff : κ → ℝ)
    (restriction : ∀ j, α → γ j) (p v : α → ℝ) :
    expected v (objectiveGradient loss τ coeff restriction p) = expected v loss +
      τ * expected v (fun a => Real.log (p a) + 1) +
      ∑ j, coeff j * expected v (fun a => Real.log (marginal (restriction j) p (restriction j a)) + 1) := by
  have h (f g : α → ℝ) : expected v (fun a => f a + g a) = expected v f + expected v g := by
    unfold expected
    simp only [mul_add, Finset.sum_add_distrib]
  have hc (c : ℝ) (f : α → ℝ) : expected v (fun a => c * f a) = c * expected v f := by
    unfold expected
    rw [Finset.mul_sum]
    exact Finset.sum_congr rfl fun a _ => by ring
  unfold objectiveGradient
  rw [h, h, hc]
  congr 1
  calc
    expected v (fun a => ∑ j, coeff j * (Real.log (marginal (restriction j) p (restriction j a)) + 1)) =
        ∑ j, expected v (fun a => coeff j * (Real.log (marginal (restriction j) p (restriction j a)) + 1)) := by
      unfold expected
      rw [← Finset.sum_comm]
      exact Finset.sum_congr rfl fun a _ => Finset.mul_sum _ _ _
    _ = _ := Finset.sum_congr rfl fun j _ => hc _ _

private theorem hasDerivAt_affine (p v : ℝ) :
    HasDerivAt (fun t : ℝ => p + t * v) v 0 := by
  simpa using ((hasDerivAt_id (0 : ℝ)).mul_const v).const_add p

private theorem hasDerivAt_entropy_line {p v : α → ℝ} (hp : ∀ a, 0 < p a) :
    HasDerivAt (fun t : ℝ => negEntropy (fun a => p a + t * v a))
      (∑ a, (Real.log (p a) + 1) * v a) 0 := by
  unfold negEntropy
  exact HasDerivAt.fun_sum fun a _ => by
    simpa only [Function.comp_def, zero_mul, add_zero] using
      (Real.hasDerivAt_mul_log (by simpa using (hp a).ne' : p a + 0 * v a ≠ 0)).comp 0
        (hasDerivAt_affine (p a) (v a))

private theorem hasDerivAt_marginal_entropy_line [Fintype β] (r : α → β)
    {p v : α → ℝ} (hp : ∀ a, 0 < p a) :
    HasDerivAt (fun t : ℝ => negEntropy (marginal r (fun a => p a + t * v a)))
      (∑ a, v a * (Real.log (marginal r p (r a)) + 1)) 0 := by
  rw [← marginal_weighted_sum r v (fun b => Real.log (marginal r p b) + 1)]
  simp only [negEntropy, marginal_line]
  exact HasDerivAt.fun_sum fun b _ => by
    by_cases hb : ∃ a, r a = b
    · obtain ⟨a, rfl⟩ := hb
      have hb := (marginal_pos r hp a).ne'
      simpa only [Function.comp_def, zero_mul, mul_zero, add_zero, mul_comm] using
        (Real.hasDerivAt_mul_log (by simpa using hb : marginal r p (r a) +
          0 * marginal r v (r a) ≠ 0)).comp 0
          (hasDerivAt_affine (marginal r p (r a)) (marginal r v (r a)))
    · simp only [marginal_zero_of_no_preimage r _ hb, mul_zero, add_zero, zero_mul]
      exact hasDerivAt_const _ _

theorem hasDerivAt_objective_line (loss : α → ℝ) (τ : ℝ) (coeff : κ → ℝ)
    (restriction : ∀ j, α → γ j) {p v : α → ℝ} (hp : ∀ a, 0 < p a) :
    HasDerivAt (fun t : ℝ => objective loss τ coeff restriction (fun a => p a + t * v a))
      (expected v (objectiveGradient loss τ coeff restriction p)) 0 := by
  have h₁ : HasDerivAt (fun t : ℝ => expected (fun a => p a + t * v a) loss)
      (expected v loss) 0 :=
    HasDerivAt.fun_sum fun a _ => (hasDerivAt_affine _ _).mul_const (loss a)
  have he : (∑ a, (Real.log (p a) + 1) * v a) =
      expected v (fun a => Real.log (p a) + 1) := by
    unfold expected
    exact Finset.sum_congr rfl fun a _ => mul_comm _ _
  have h₂ := ((hasDerivAt_entropy_line (v := v) hp).congr_deriv he).const_mul τ
  have h₃ := HasDerivAt.fun_sum fun j (_ : j ∈ Finset.univ) =>
    (hasDerivAt_marginal_entropy_line (restriction j) (v := v) hp).const_mul (coeff j)
  refine ((h₁.add h₂).add h₃).congr_deriv ?_
  rw [expected_gradient_eq]
  rfl

/-- The gradient at a positive optimum vanishes in every zero-mass direction. -/
theorem minimizer_stationary {loss : α → ℝ} {τ : ℝ} {coeff : κ → ℝ}
    {restriction : ∀ j, α → γ j} {p : α → ℝ} (hp : IsLaw p) (hpos : ∀ a, 0 < p a)
    (hmin : ∀ q, IsLaw q → objective loss τ coeff restriction p ≤
      objective loss τ coeff restriction q) (v : α → ℝ) (hv : ∑ a, v a = 0) :
    expected v (objectiveGradient loss τ coeff restriction p) = 0 := by
  have hnear : ∀ᶠ t : ℝ in 𝓝 0, ∀ a, 0 < p a + t * v a := by
    rw [Filter.eventually_all]
    intro a
    have hc : Continuous (fun t : ℝ => p a + t * v a) := by fun_prop
    exact hc.continuousAt.eventually_const_lt (by simpa using hpos a)
  have hlocal : IsLocalMin
      (fun t : ℝ => objective loss τ coeff restriction (fun a => p a + t * v a)) 0 := by
    filter_upwards [hnear] with t ht
    have h := hmin (fun a => p a + t * v a) ⟨fun a => (ht a).le,
      by simp [Finset.sum_add_distrib, ← Finset.mul_sum, hp.2, hv]⟩
    simpa only [zero_mul, add_zero] using h
  exact hlocal.hasDerivAt_eq_zero (hasDerivAt_objective_line loss τ coeff restriction hpos)

/-- The first-order condition also means that all gradient coordinates are equal. -/
theorem minimizer_gradient_constant {loss : α → ℝ} {τ : ℝ} {coeff : κ → ℝ}
    {restriction : ∀ j, α → γ j} {p : α → ℝ} (hp : IsLaw p) (hpos : ∀ a, 0 < p a)
    (hmin : ∀ q, IsLaw q → objective loss τ coeff restriction p ≤
      objective loss τ coeff restriction q) (a b : α) :
    objectiveGradient loss τ coeff restriction p a = objectiveGradient loss τ coeff restriction p b := by
  have h := minimizer_stationary hp hpos hmin (fun x => atom a x - atom b x)
    (by simp [Finset.sum_sub_distrib, (isLaw_atom a).2, (isLaw_atom b).2])
  simp only [expected, sub_mul, Finset.sum_sub_distrib] at h
  change expected (atom a) (objectiveGradient loss τ coeff restriction p) -
    expected (atom b) (objectiveGradient loss τ coeff restriction p) = 0 at h
  simpa only [expected_atom, sub_eq_zero] using h

/-- Finite relative entropy. This formula is used with a positive reference law. -/
noncomputable def relativeEntropy (q p : α → ℝ) : ℝ := ∑ a, q a * Real.log (q a / p a)

private theorem mul_log_bregman (x y : ℝ) (hy : y ≠ 0) :
    x * Real.log x - y * Real.log y - (x - y) * (Real.log y + 1) =
      x * Real.log (x / y) + y - x := by
  rcases eq_or_ne x 0 with rfl | hx
  · simp; ring
  · rw [Real.log_div hx hy]; ring

private theorem negEntropy_bregman {p q : α → ℝ} (hp : IsLaw p) (hq : IsLaw q)
    (hpos : ∀ a, 0 < p a) :
    negEntropy q - negEntropy p - expected (fun a => q a - p a) (fun a => Real.log (p a) + 1) =
      relativeEntropy q p := by
  unfold negEntropy expected relativeEntropy
  simp_rw [← Finset.sum_sub_distrib, mul_log_bregman _ _ (hpos _).ne',
    Finset.sum_sub_distrib, Finset.sum_add_distrib, hp.2, hq.2, add_sub_cancel_right]

private theorem marginal_bregman_nonneg [Fintype β] (r : α → β)
    {p q : α → ℝ} (hq : IsLaw q) (hpos : ∀ a, 0 < p a) :
    0 ≤ negEntropy (marginal r q) - negEntropy (marginal r p) -
      expected (fun a => q a - p a) (fun a => Real.log (marginal r p (r a)) + 1) := by
  unfold negEntropy expected
  rw [← marginal_weighted_sum r (fun a => q a - p a) (fun b => Real.log (marginal r p b) + 1),
    ← Finset.sum_sub_distrib,
    ← Finset.sum_sub_distrib]
  refine Finset.sum_nonneg fun b _ => ?_
  have he : marginal r (fun a => q a - p a) b = marginal r q b - marginal r p b := by
    classical
    unfold marginal
    rw [Finset.sum_sub_distrib]
  rw [he]
  by_cases hb : ∃ a, r a = b
  · obtain ⟨a, rfl⟩ := hb
    linarith [mul_log_support ((hq.marginal r).1 (r a)) (marginal_pos r hpos a)]
  · simp [marginal_zero_of_no_preimage r _ hb]

/-- The full-entropy term contributes its entire relative entropy to the objective remainder. -/
theorem objective_bregman {loss : α → ℝ} {τ : ℝ} {coeff : κ → ℝ}
    {restriction : ∀ j, α → γ j} {p q : α → ℝ} (hc : ∀ j, 0 ≤ coeff j)
    (hp : IsLaw p) (hq : IsLaw q) (hpos : ∀ a, 0 < p a) :
    τ * relativeEntropy q p + expected (fun a => q a - p a)
      (objectiveGradient loss τ coeff restriction p) ≤
      objective loss τ coeff restriction q - objective loss τ coeff restriction p := by
  have hfull := congrArg (τ * ·) (negEntropy_bregman hp hq hpos)
  have hparts := Finset.sum_nonneg fun j (_ : j ∈ Finset.univ) =>
    mul_nonneg (hc j) (marginal_bregman_nonneg (restriction j) hq hpos)
  rw [expected_gradient_eq]
  have hl : expected (fun a => q a - p a) loss = expected q loss - expected p loss := by
    simp only [expected, sub_mul, Finset.sum_sub_distrib]
  rw [hl]
  unfold objective
  simp only [mul_sub] at hfull hparts
  simp only [Finset.sum_sub_distrib] at hparts
  linarith only [hfull, hparts]

/-- At an interior optimum the linear part vanishes on another probability law. -/
theorem minimizer_relativeEntropy_le_gap {loss : α → ℝ} {τ : ℝ} {coeff : κ → ℝ}
    {restriction : ∀ j, α → γ j} {p q : α → ℝ} (hc : ∀ j, 0 ≤ coeff j)
    (hp : IsLaw p) (hq : IsLaw q) (hpos : ∀ a, 0 < p a)
    (hmin : ∀ r, IsLaw r → objective loss τ coeff restriction p ≤
      objective loss τ coeff restriction r) :
    τ * relativeEntropy q p ≤ objective loss τ coeff restriction q -
      objective loss τ coeff restriction p := by
  have hs := minimizer_stationary hp hpos hmin (fun a => q a - p a)
    (by simp [Finset.sum_sub_distrib, hp.2, hq.2])
  simpa only [hs, add_zero] using objective_bregman (loss := loss) (τ := τ) (restriction := restriction) hc hp hq hpos

theorem relativeEntropy_nonneg {p q : α → ℝ} (hp : IsLaw p) (hq : IsLaw q)
    (hpos : ∀ a, 0 < p a) : 0 ≤ relativeEntropy q p := by
  have h := Finset.sum_nonneg fun a (_ : a ∈ Finset.univ) =>
    sub_nonneg.mpr (mul_log_support (hq.1 a) (hpos a))
  have he (a : α) : q a * Real.log (q a) -
      (p a * Real.log (p a) + (Real.log (p a) + 1) * (q a - p a)) =
      q a * Real.log (q a / p a) + p a - q a := by
    rw [← mul_log_bregman _ _ (hpos a).ne']
    ring
  simpa only [he, Finset.sum_add_distrib, Finset.sum_sub_distrib, hp.2, hq.2,
    add_sub_cancel_right, relativeEntropy] using h

/-- A positive law with constant gradient minimizes the objective. -/
theorem minimizes_of_gradient_constant {loss : α → ℝ} {τ : ℝ} {coeff : κ → ℝ}
    {restriction : ∀ j, α → γ j} {p : α → ℝ} {c : ℝ} (hτ : 0 ≤ τ)
    (hc : ∀ j, 0 ≤ coeff j) (hp : IsLaw p) (hpos : ∀ a, 0 < p a)
    (hg : ∀ a, objectiveGradient loss τ coeff restriction p a = c) (q : α → ℝ)
    (hq : IsLaw q) : objective loss τ coeff restriction p ≤ objective loss τ coeff restriction q := by
  have hb := objective_bregman (loss := loss) (τ := τ) (restriction := restriction) hc hp hq hpos
  have hs : expected (fun a => q a - p a) (objectiveGradient loss τ coeff restriction p) = 0 := by
    simp only [expected, hg, ← Finset.sum_mul, Finset.sum_sub_distrib, hp.2, hq.2, sub_self, zero_mul]
  rw [hs, add_zero] at hb
  exact sub_nonneg.mp ((mul_nonneg hτ (relativeEntropy_nonneg hp hq hpos)).trans hb)

end AgnosticVC
