module

public import Mathlib.Analysis.SpecialFunctions.Log.NegMulLog

@[expose] public section

open scoped BigOperators Pointwise Topology

namespace AgnosticVC

variable {α β κ : Type*} [Fintype α] [Fintype β] [Fintype κ]

/-- A probability mass function on a finite type. -/
def IsLaw (p : α → ℝ) : Prop := (∀ a, 0 ≤ p a) ∧ ∑ a, p a = 1

noncomputable def atom (a : α) : α → ℝ := by
  classical
  exact fun x => if x = a then 1 else 0

theorem isLaw_atom (a : α) : IsLaw (atom a) := by
  classical
  exact ⟨fun x => by rw [atom]; split <;> norm_num, by simp [atom]⟩

theorem IsLaw.le_one {p : α → ℝ} (hp : IsLaw p) (a : α) : p a ≤ 1 := by
  rw [← hp.2]
  exact Finset.single_le_sum (fun x _ => hp.1 x) (Finset.mem_univ a)

theorem isCompact_laws : IsCompact {p : α → ℝ | IsLaw p} := by
  have he : {p : α → ℝ | IsLaw p} =
      (Set.univ.pi fun _ : α => Set.Icc (0 : ℝ) 1) ∩ {p | ∑ a, p a = 1} := by
    ext p
    constructor
    · intro hp
      exact ⟨fun a _ => ⟨hp.1 a, hp.le_one a⟩, hp.2⟩
    · rintro ⟨hp, hs⟩
      exact ⟨fun a => (hp a (Set.mem_univ _)).1, hs⟩
  rw [he]
  exact (isCompact_univ_pi fun _ => isCompact_Icc).inter_right
    (isClosed_eq (continuous_finsetSum _ fun i _ => continuous_apply i) continuous_const)

/-- The mass of each fiber of a map. The definition also applies to signed weights. -/
noncomputable def marginal (r : α → β) (p : α → ℝ) (b : β) : ℝ := by
  classical
  exact ∑ a ∈ Finset.univ.filter (fun a => r a = b), p a

omit [Fintype β] in
theorem marginal_nonneg (r : α → β) {p : α → ℝ} (hp : ∀ a, 0 ≤ p a) (b : β) :
    0 ≤ marginal r p b := Finset.sum_nonneg fun a _ => hp a

omit [Fintype β] in
theorem marginal_pos (r : α → β) {p : α → ℝ} (hp : ∀ a, 0 < p a) (a : α) :
    0 < marginal r p (r a) := by
  classical
  exact lt_of_lt_of_le (hp a) (Finset.single_le_sum (fun x _ => (hp x).le) (by simp))

theorem marginal_sum (r : α → β) (p : α → ℝ) : ∑ b, marginal r p b = ∑ a, p a := by
  classical
  exact Finset.sum_fiberwise Finset.univ r p

theorem IsLaw.marginal {p : α → ℝ} (hp : IsLaw p) (r : α → β) : IsLaw (marginal r p) :=
  ⟨marginal_nonneg r hp.1, (marginal_sum r p).trans hp.2⟩

omit [Fintype β] in
@[simp] theorem marginal_atom (r : α → β) (a : α) : marginal r (atom a) = atom (r a) := by
  classical
  funext b
  simp [marginal, atom, eq_comm]

omit [Fintype β] in
@[fun_prop] theorem continuous_marginal_apply (r : α → β) (b : β) :
    Continuous (fun p : α → ℝ => marginal r p b) := by
  classical
  unfold marginal
  exact continuous_finsetSum _ fun a _ => continuous_apply a

/-- The linear loss of a probability law. -/
noncomputable def expected (p f : α → ℝ) : ℝ := ∑ a, p a * f a

@[simp] theorem expected_atom (a : α) (f : α → ℝ) : expected (atom a) f = f a := by
  classical
  simp [expected, atom, ite_mul, Finset.sum_ite_eq']

/-- Negative Shannon entropy, with the value zero at a zero mass. -/
noncomputable def negEntropy (p : α → ℝ) : ℝ := ∑ a, p a * Real.log (p a)

@[simp] theorem negEntropy_atom (a : α) : negEntropy (atom a) = 0 := by
  classical
  simp [negEntropy, atom, apply_ite (fun x : ℝ => x * Real.log x)]

@[fun_prop] theorem continuous_negEntropy : Continuous (negEntropy : (α → ℝ) → ℝ) := by
  unfold negEntropy
  exact continuous_finsetSum _ fun a _ => Real.continuous_mul_log.comp (continuous_apply a)

theorem negEntropy_nonpos {p : α → ℝ} (hp : IsLaw p) : negEntropy p ≤ 0 :=
  Finset.sum_nonpos fun a _ => Real.mul_log_nonpos (hp.1 a) (hp.le_one a)

/-- The scalar Bregman remainder of `x log x` is nonnegative on the half line. -/
theorem mul_log_support {x y : ℝ} (hx : 0 ≤ x) (hy : 0 < y) :
    y * Real.log y + (Real.log y + 1) * (x - y) ≤ x * Real.log x := by
  have hc := Real.self_sub_one_le_mul_log (div_nonneg hx hy.le)
  by_cases h : x = 0
  · simp [h]; linarith
  rw [Real.log_div h hy.ne'] at hc
  have hm := mul_le_mul_of_nonneg_left hc hy.le
  field_simp [hy.ne'] at hm
  nlinarith

theorem negEntropy_lower {p : α → ℝ} (hp : IsLaw p) :
    -Real.log (Fintype.card α : ℝ) ≤ negEntropy p := by
  classical
  have hn : Nonempty α := by
    by_contra! h
    have hz := hp.2
    simp at hz
  let k : ℝ := Fintype.card α
  have hk : 0 < k := by dsimp [k]; exact_mod_cast Fintype.card_pos
  have hb := Finset.sum_le_sum fun a (_ : a ∈ Finset.univ) =>
    mul_log_support (hp.1 a) (inv_pos.mpr hk)
  simp only [Finset.sum_add_distrib, Finset.sum_sub_distrib, ← Finset.mul_sum,
    Finset.sum_const, Finset.card_univ, nsmul_eq_mul, hp.2] at hb
  change k⁻¹ * (k * Real.log k⁻¹) + (Real.log k⁻¹ + 1) * (1 - k * k⁻¹) ≤ negEntropy p at hb
  rw [← mul_assoc, inv_mul_cancel₀ hk.ne', mul_inv_cancel₀ hk.ne', one_mul, sub_self,
    mul_zero, add_zero, Real.log_inv] at hb
  exact hb

variable {γ : κ → Type*} [∀ j, Fintype (γ j)]

/-- Loss with a full-entropy term and any finite collection of weighted restriction entropies. -/
noncomputable def objective (loss : α → ℝ) (τ : ℝ) (coeff : κ → ℝ)
    (restriction : ∀ j, α → γ j) (p : α → ℝ) : ℝ :=
  expected p loss + τ * negEntropy p +
    ∑ j, coeff j * negEntropy (marginal (restriction j) p)

@[fun_prop] theorem continuous_objective (loss : α → ℝ) (τ : ℝ) (coeff : κ → ℝ)
    (restriction : ∀ j, α → γ j) : Continuous (objective loss τ coeff restriction) := by
  unfold objective expected
  fun_prop

@[simp] theorem objective_atom (loss : α → ℝ) (τ : ℝ) (coeff : κ → ℝ)
    (restriction : ∀ j, α → γ j) (a : α) : objective loss τ coeff restriction (atom a) = loss a := by
  simp [objective]

/-- Every finite nonempty trace family has an entropy-regularized minimizer. -/
theorem exists_minimizer [Nonempty α] (loss : α → ℝ) (τ : ℝ) (coeff : κ → ℝ)
    (restriction : ∀ j, α → γ j) :
    ∃ p, IsLaw p ∧ ∀ q, IsLaw q → objective loss τ coeff restriction p ≤
      objective loss τ coeff restriction q := by
  classical
  obtain ⟨p, hp, hmin⟩ := (isCompact_laws (α := α)).exists_isMinOn
    ⟨atom (Classical.choice inferInstance), isLaw_atom _⟩
    (continuous_objective loss τ coeff restriction).continuousOn
  exact ⟨p, hp, fun q hq => hmin hq⟩

/-- Against every point-mass comparator, the increase in weighted loss is at most the entropy
penalty evaluated at the minimizer. -/
theorem expected_le_comparator {loss : α → ℝ} {τ : ℝ} {coeff : κ → ℝ}
    {restriction : ∀ j, α → γ j} {p : α → ℝ}
    (hmin : ∀ q, IsLaw q → objective loss τ coeff restriction p ≤
      objective loss τ coeff restriction q) (a : α) :
    expected p loss ≤ loss a - τ * negEntropy p -
      ∑ j, coeff j * negEntropy (marginal (restriction j) p) := by
  have h := hmin (atom a) (isLaw_atom a)
  rw [objective_atom, objective] at h
  linarith

/-- The objective comparison for empirical loss, with an arbitrary uniform bound on the
weighted-to-unweighted discrepancy. -/
theorem empirical_le_comparator {loss empirical : α → ℝ} {τ slack : ℝ} {coeff : κ → ℝ}
    {restriction : ∀ j, α → γ j} {p : α → ℝ}
    (hp : IsLaw p) (hτ : 0 ≤ τ) (hc : ∀ j, 0 ≤ coeff j)
    (hmin : ∀ q, IsLaw q → objective loss τ coeff restriction p ≤
      objective loss τ coeff restriction q)
    (hdiff : ∀ a, |loss a - empirical a| ≤ slack) (a : α) :
    expected p empirical ≤ empirical a + τ * Real.log (Fintype.card α) +
      (∑ j, coeff j * Real.log (Fintype.card (γ j))) + 2 * slack := by
  have hdiff' (x : α) := abs_le.mp (hdiff x)
  have hdis : expected p empirical ≤ expected p loss + slack := by
    have h := Finset.sum_le_sum fun x (_ : x ∈ Finset.univ) =>
      mul_le_mul_of_nonneg_left (show empirical x ≤ loss x + slack by linarith [(hdiff' x).1])
        (hp.1 x)
    simpa only [expected, mul_add, Finset.sum_add_distrib, ← Finset.sum_mul, hp.2, one_mul] using h
  have hfull := mul_le_mul_of_nonneg_left (negEntropy_lower hp) hτ
  have hparts := Finset.sum_le_sum fun j (_ : j ∈ Finset.univ) =>
    mul_le_mul_of_nonneg_left (negEntropy_lower (hp.marginal (restriction j))) (hc j)
  simp only [mul_neg, Finset.sum_neg_distrib] at hparts hfull
  linarith [expected_le_comparator hmin a, (hdiff' a).2]

end AgnosticVC
