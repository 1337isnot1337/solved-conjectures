module

public import Conjectures.AgnosticVC.Optimizer

@[expose] public section

open scoped BigOperators

namespace AgnosticVC

variable {α β κ : Type*} [Fintype α] [Fintype κ]
variable {γ : κ → Type*} [∀ j, Fintype (γ j)]

/-- A convex combination of two probability laws, evaluated coordinatewise. -/
def mix (t : ℝ) (p q : α → ℝ) (a : α) : ℝ := (1 - t) * p a + t * q a

theorem isLaw_mix {t : ℝ} {p q : α → ℝ} (ht₀ : 0 ≤ t) (ht₁ : t ≤ 1)
    (hp : IsLaw p) (hq : IsLaw q) : IsLaw (mix t p q) := by
  refine ⟨fun a => add_nonneg (mul_nonneg (sub_nonneg.mpr ht₁) (hp.1 a))
    (mul_nonneg ht₀ (hq.1 a)), ?_⟩
  simp [mix, Finset.sum_add_distrib, ← Finset.mul_sum, hp.2, hq.2]

theorem marginal_mix (r : α → β) (t : ℝ) (p q : α → ℝ) :
    marginal r (mix t p q) = mix t (marginal r p) (marginal r q) := by
  classical
  funext b
  simp [marginal, mix, Finset.sum_add_distrib, Finset.mul_sum]

theorem expected_mix (t : ℝ) (p q loss : α → ℝ) :
    expected (mix t p q) loss = (1 - t) * expected p loss + t * expected q loss := by
  simp [expected, mix, add_mul, mul_assoc, Finset.sum_add_distrib, Finset.mul_sum]

theorem negEntropy_mix_le {t : ℝ} {p q : α → ℝ} (ht₀ : 0 ≤ t) (ht₁ : t ≤ 1)
    (hp : ∀ a, 0 ≤ p a) (hq : ∀ a, 0 ≤ q a) :
    negEntropy (mix t p q) ≤ (1 - t) * negEntropy p + t * negEntropy q := by
  unfold negEntropy
  rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
  exact Finset.sum_le_sum fun a _ =>
    Real.convexOn_mul_log.2 (hp a) (hq a) (sub_nonneg.mpr ht₁) ht₀ (by ring)

theorem negEntropy_mix_lt {t : ℝ} {p q : α → ℝ} (ht₀ : 0 < t) (ht₁ : t < 1)
    (hp : ∀ a, 0 ≤ p a) (hq : ∀ a, 0 ≤ q a) (hne : p ≠ q) :
    negEntropy (mix t p q) < (1 - t) * negEntropy p + t * negEntropy q := by
  obtain ⟨a, ha⟩ := Function.ne_iff.mp hne
  unfold negEntropy
  rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
  exact Finset.sum_lt_sum (fun x _ =>
    Real.convexOn_mul_log.2 (hp x) (hq x) (sub_nonneg.mpr ht₁.le) ht₀.le (by ring))
    ⟨a, Finset.mem_univ _, Real.strictConvexOn_mul_log.2 (hp a) (hq a) ha
      (sub_pos.mpr ht₁) ht₀ (by ring)⟩

private theorem objective_marginals_mix_le {t : ℝ} {p q : α → ℝ}
    {coeff : κ → ℝ} {restriction : ∀ j, α → γ j} (ht₀ : 0 ≤ t) (ht₁ : t ≤ 1)
    (hp : IsLaw p) (hq : IsLaw q) (hc : ∀ j, 0 ≤ coeff j) :
    ∑ j, coeff j * negEntropy (marginal (restriction j) (mix t p q)) ≤
      (1 - t) * (∑ j, coeff j * negEntropy (marginal (restriction j) p)) +
      t * (∑ j, coeff j * negEntropy (marginal (restriction j) q)) := by
  rw [Finset.mul_sum, Finset.mul_sum, ← Finset.sum_add_distrib]
  refine Finset.sum_le_sum fun j _ => ?_
  rw [marginal_mix]
  have h := mul_le_mul_of_nonneg_left (negEntropy_mix_le ht₀ ht₁
    (hp.marginal (restriction j)).1 (hq.marginal (restriction j)).1) (hc j)
  linarith only [h]

/-- Positive weight on full entropy makes the minimizing law unique. -/
theorem minimizer_unique {loss : α → ℝ} {τ : ℝ} {coeff : κ → ℝ}
    {restriction : ∀ j, α → γ j} {p q : α → ℝ} (hτ : 0 < τ) (hc : ∀ j, 0 ≤ coeff j)
    (hp : IsLaw p) (hq : IsLaw q)
    (hminp : ∀ r, IsLaw r → objective loss τ coeff restriction p ≤ objective loss τ coeff restriction r)
    (hminq : ∀ r, IsLaw r → objective loss τ coeff restriction q ≤ objective loss τ coeff restriction r) :
    p = q := by
  by_contra hne
  have hm := hminp (mix (1 / 2) p q) (isLaw_mix (by norm_num) (by norm_num) hp hq)
  have he := le_antisymm (hminp q hq) (hminq p hp)
  have h₁ := mul_lt_mul_of_pos_left
    (negEntropy_mix_lt (t := 1 / 2) (by norm_num) (by norm_num) hp.1 hq.1 hne) hτ
  have h₂ := objective_marginals_mix_le (restriction := restriction) (coeff := coeff)
    (t := 1 / 2) (by norm_num) (by norm_num) hp hq hc
  unfold objective at hm he
  rw [expected_mix] at hm
  linarith

private theorem negEntropy_mix_atom_of_zero {p : α → ℝ} (hp : IsLaw p)
    {a : α} (ha : p a = 0) {t : ℝ} (ht : t < 1) :
    negEntropy (mix t p (atom a)) =
      (1 - t) * negEntropy p + (1 - t) * Real.log (1 - t) + t * Real.log t := by
  classical
  have hs (x : α) : mix t p (atom a) x * Real.log (mix t p (atom a) x) =
      (1 - t) * (p x * Real.log (p x)) + (1 - t) * p x * Real.log (1 - t) +
        atom a x * (t * Real.log t) := by
    by_cases hx : x = a
    · simp [hx, ha, atom, mix]
    · simp only [atom, hx, ite_false, mul_zero, add_zero, zero_mul, mix]
      by_cases hz : p x = 0
      · simp [hz]
      · rw [Real.log_mul (sub_pos.mpr ht).ne' hz]
        ring
  unfold negEntropy
  simp only [hs, Finset.sum_add_distrib]
  rw [← Finset.mul_sum, ← Finset.sum_mul, ← Finset.mul_sum, ← Finset.sum_mul, hp.2,
    (isLaw_atom a).2, mul_one, one_mul]

/-- Positive full-entropy weight rules out zero mass at every candidate. -/
theorem minimizer_pos {loss : α → ℝ} {τ : ℝ} {coeff : κ → ℝ}
    {restriction : ∀ j, α → γ j} {p : α → ℝ} (hτ : 0 < τ) (hc : ∀ j, 0 ≤ coeff j)
    (hp : IsLaw p)
    (hmin : ∀ q, IsLaw q → objective loss τ coeff restriction p ≤
      objective loss τ coeff restriction q) (a : α) : 0 < p a := by
  by_contra! h
  have ha : p a = 0 := le_antisymm h (hp.1 a)
  let f := objective loss τ coeff restriction p
  let t := Real.exp (min (-1) ((f - loss a) / τ - 1))
  have ht₀ : 0 < t := Real.exp_pos _
  have ht₁ : t < 1 := Real.exp_lt_one_iff.mpr ((min_le_left _ _).trans_lt (by norm_num))
  have hlog : Real.log t ≤ (f - loss a) / τ - 1 := by
    unfold t
    rw [Real.log_exp]
    exact min_le_right _ _
  have hm := hmin _ (isLaw_mix ht₀.le ht₁.le hp (isLaw_atom a))
  have hparts := objective_marginals_mix_le (restriction := restriction) (coeff := coeff)
    ht₀.le ht₁.le hp (isLaw_atom a) hc
  simp only [marginal_atom, negEntropy_atom, mul_zero, Finset.sum_const_zero, add_zero] at hparts
  have hs : τ * Real.log t ≤ f - loss a - τ := by
    have hh := mul_le_mul_of_nonneg_left hlog hτ.le
    rw [mul_sub, mul_one] at hh
    have he : τ * ((f - loss a) / τ) = f - loss a := by field_simp
    rwa [he] at hh
  have hg := mul_le_mul_of_nonneg_left hs ht₀.le
  have hr : τ * ((1 - t) * Real.log (1 - t)) ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos hτ.le (mul_nonpos_of_nonneg_of_nonpos
      (sub_nonneg.mpr ht₁.le) (Real.log_nonpos (sub_nonneg.mpr ht₁.le) (by linarith)))
  have hpos : 0 < t * τ := mul_pos ht₀ hτ
  unfold objective at hm
  rw [expected_mix, expected_atom, negEntropy_mix_atom_of_zero hp ha ht₁] at hm
  unfold f objective at hg
  nlinarith only [hm, hg, hr, hpos, hparts]

/-- The unique optimizer, defined by compactness. -/
noncomputable def optimizer [Nonempty α] (loss : α → ℝ) (τ : ℝ) (coeff : κ → ℝ)
    (restriction : ∀ j, α → γ j) : α → ℝ :=
  (exists_minimizer loss τ coeff restriction).choose

theorem optimizer_isLaw [Nonempty α] (loss : α → ℝ) (τ : ℝ) (coeff : κ → ℝ)
    (restriction : ∀ j, α → γ j) : IsLaw (optimizer loss τ coeff restriction) :=
  (exists_minimizer loss τ coeff restriction).choose_spec.1

theorem optimizer_min [Nonempty α] (loss : α → ℝ) (τ : ℝ) (coeff : κ → ℝ)
    (restriction : ∀ j, α → γ j) (q : α → ℝ) (hq : IsLaw q) :
    objective loss τ coeff restriction (optimizer loss τ coeff restriction) ≤
      objective loss τ coeff restriction q :=
  (exists_minimizer loss τ coeff restriction).choose_spec.2 q hq

theorem optimizer_pos [Nonempty α] (loss : α → ℝ) {τ : ℝ} {coeff : κ → ℝ}
    (restriction : ∀ j, α → γ j) (hτ : 0 < τ) (hc : ∀ j, 0 ≤ coeff j) (a : α) :
    0 < optimizer loss τ coeff restriction a :=
  minimizer_pos hτ hc (optimizer_isLaw loss τ coeff restriction)
    (optimizer_min loss τ coeff restriction) a

end AgnosticVC
