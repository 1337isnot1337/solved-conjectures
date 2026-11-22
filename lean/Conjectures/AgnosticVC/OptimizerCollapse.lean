module

public import Conjectures.AgnosticVC.OptimizerEnergy

@[expose] public section

open scoped BigOperators

namespace AgnosticVC

variable {α β κ : Type*} [Fintype α] [Fintype β] [Fintype κ]
variable {γ : κ → Type*} [∀ j, Fintype (γ j)]

theorem marginal_comp {δ : Type*} (r : α → β) (s : β → δ) (p : α → ℝ) :
    marginal s (marginal r p) = marginal (s ∘ r) p := by
  classical
  funext c
  have h := marginal_weighted_sum r p (fun b => if s b = c then (1 : ℝ) else 0)
  simpa only [marginal, Finset.sum_filter, mul_ite, mul_one, mul_zero, Function.comp_apply] using h

/-- Number of candidates with a given coarser trace. -/
noncomputable def fiberSize (r : α → β) (b : β) : ℕ := by
  classical
  exact (Finset.univ.filter (fun a => r a = b)).card

omit [Fintype β] in
theorem fiberSize_pos (r : α → β) {b : β} (hb : ∃ a, r a = b) : 0 < fiberSize r b := by
  classical
  obtain ⟨a, ha⟩ := hb
  exact Finset.card_pos.mpr ⟨a, by simp [ha]⟩

/-- Lift a law on the coarser traces by splitting each mass equally among its extensions. -/
noncomputable def equalLift (r : α → β) (q : β → ℝ) (a : α) : ℝ :=
  q (r a) / (fiberSize r (r a) : ℝ)

omit [Fintype β] in
theorem marginal_equalLift (r : α → β) (hr : Function.Surjective r) (q : β → ℝ) :
    marginal r (equalLift r q) = q := by
  classical
  funext b
  have hc : (fiberSize r b : ℝ) ≠ 0 := by exact_mod_cast (fiberSize_pos r (hr b)).ne'
  unfold marginal
  calc
    _ = ∑ a ∈ Finset.univ.filter (fun a => r a = b), q b / (fiberSize r b : ℝ) := by
      refine Finset.sum_congr rfl fun a ha => ?_
      rw [equalLift, (Finset.mem_filter.mp ha).2]
    _ = q b := by
      rw [Finset.sum_const, nsmul_eq_mul]
      change (fiberSize r b : ℝ) * (q b / (fiberSize r b : ℝ)) = q b
      field_simp

theorem equalLift_isLaw (r : α → β) (hr : Function.Surjective r) {q : β → ℝ} (hq : IsLaw q) :
    IsLaw (equalLift r q) := by
  refine ⟨fun a => div_nonneg (hq.1 (r a)) (by positivity), ?_⟩
  rw [← marginal_sum r, marginal_equalLift r hr, hq.2]

omit [Fintype β] in
theorem equalLift_marginal_of_const (r : α → β) (p : α → ℝ)
    (hp : ∀ a b, r a = r b → p a = p b) : equalLift r (marginal r p) = p := by
  classical
  funext a
  have hc : (fiberSize r (r a) : ℝ) ≠ 0 := by exact_mod_cast (fiberSize_pos r ⟨a, rfl⟩).ne'
  unfold equalLift
  have h : marginal r p (r a) = (fiberSize r (r a) : ℝ) * p a := by
    unfold marginal
    calc
      _ = ∑ b ∈ Finset.univ.filter (fun b => r b = r a), p a :=
        Finset.sum_congr rfl fun b hb => hp b a (Finset.mem_filter.mp hb).2
      _ = _ := by simp [fiberSize, Finset.sum_const, nsmul_eq_mul]
  rw [h, mul_comm, mul_div_cancel_right₀ _ hc]

/-- Splitting a coarse mass over `k` equal extensions adds its mass times `log k` to entropy. -/
theorem negEntropy_equalLift (r : α → β) (hr : Function.Surjective r) (q : β → ℝ) :
    negEntropy (equalLift r q) = negEntropy q - expected q (fun b => Real.log (fiberSize r b)) := by
  classical
  unfold negEntropy expected
  rw [← Finset.sum_fiberwise Finset.univ r (fun a => equalLift r q a * Real.log (equalLift r q a)),
    ← Finset.sum_sub_distrib]
  refine Finset.sum_congr rfl fun b _ => ?_
  have hc : (fiberSize r b : ℝ) ≠ 0 := by exact_mod_cast (fiberSize_pos r (hr b)).ne'
  let k : ℝ := fiberSize r b
  calc
    _ = ∑ a ∈ Finset.univ.filter (fun a => r a = b), (q b / k) * Real.log (q b / k) := by
      refine Finset.sum_congr rfl fun a ha => ?_
      rw [equalLift, (Finset.mem_filter.mp ha).2]
    _ = k * ((q b / k) * Real.log (q b / k)) := by
      simp [Finset.sum_const, nsmul_eq_mul, fiberSize, k]
    _ = _ := by
      by_cases hq : q b = 0
      · simp [hq]
      · change k * ((q b / k) * Real.log (q b / k)) = q b * Real.log (q b) - q b * Real.log k
        rw [Real.log_div hq hc, ← mul_assoc]
        have he : k * (q b / k) = q b := by
          have hk : k ≠ 0 := hc
          field_simp
        rw [he, mul_sub]

omit [Fintype β] in
/-- Under a restriction scheme and loss defined on coarse traces, the full-support optimizing law
splits each coarse mass evenly on its fiber. -/
theorem optimizer_eq_equalLift [Nonempty α] (r : α → β) (loss : β → ℝ) {τ : ℝ}
    {coeff : κ → ℝ} (restriction : ∀ j, β → γ j) (hτ : 0 < τ) (hc : ∀ j, 0 ≤ coeff j) :
    let p := optimizer (loss ∘ r) τ coeff (fun j => restriction j ∘ r)
    p = equalLift r (marginal r p) := by
  intro p
  apply (equalLift_marginal_of_const r p ?_).symm
  intro a b hab
  have hp : IsLaw p := optimizer_isLaw _ _ _ _
  have hpos : ∀ x, 0 < p x := optimizer_pos _ _ hτ hc
  have he := minimizer_gradient_constant hp hpos
    (optimizer_min (loss ∘ r) τ coeff (fun j => restriction j ∘ r)) a b
  unfold objectiveGradient at he
  simp only [Function.comp_apply, hab, add_left_inj] at he
  have hh : Real.log (p a) = Real.log (p b) := by nlinarith only [he, hτ]
  exact Real.log_injOn_pos (hpos a) (hpos b) hh

/-- Evaluating the full objective on an equal lift subtracts the average log multiplicity from
the coarse objective, with the same full-entropy coefficient. -/
theorem objective_equalLift (r : α → β) (hr : Function.Surjective r) (loss : β → ℝ)
    (τ : ℝ) (coeff : κ → ℝ) (restriction : ∀ j, β → γ j) (q : β → ℝ) :
    objective (loss ∘ r) τ coeff (fun j => restriction j ∘ r) (equalLift r q) =
      objective loss τ coeff restriction q - τ * expected q (fun b => Real.log (fiberSize r b)) := by
  have hl : expected (equalLift r q) (loss ∘ r) = expected q loss := by
    simp only [expected, Function.comp_apply]
    rw [← marginal_weighted_sum r _ loss, marginal_equalLift r hr]
  unfold objective
  simp_rw [hl, negEntropy_equalLift r hr, ← marginal_comp r, marginal_equalLift r hr]
  ring

/-- Relative entropy cost of discarding redundant candidates. No bound on the size of a fiber is
needed: the penalty is the optimizing law's expected log fiber size. -/
theorem optimizer_collapse_relativeEntropy [Nonempty α] [Nonempty β]
    (r : α → β) (hr : Function.Surjective r) (loss : β → ℝ) {τ : ℝ} {coeff : κ → ℝ}
    (restriction : ∀ j, β → γ j) (hτ : 0 < τ) (hc : ∀ j, 0 ≤ coeff j) :
    let p := marginal r (optimizer (loss ∘ r) τ coeff (fun j => restriction j ∘ r))
    let q := optimizer loss τ coeff restriction
    relativeEntropy p q ≤ expected p (fun b => Real.log (fiberSize r b)) := by
  intro p q
  let full := optimizer (loss ∘ r) τ coeff (fun j => restriction j ∘ r)
  have hp : IsLaw p := (optimizer_isLaw _ _ _ _).marginal r
  have hopt := optimizer_min (loss ∘ r) τ coeff (fun j => restriction j ∘ r)
    (equalLift r q) (equalLift_isLaw r hr (optimizer_isLaw loss τ coeff restriction))
  have he : full = equalLift r p := optimizer_eq_equalLift r loss restriction hτ hc
  change objective (loss ∘ r) τ coeff (fun j => restriction j ∘ r) full ≤
    objective (loss ∘ r) τ coeff (fun j => restriction j ∘ r) (equalLift r q) at hopt
  rw [he, objective_equalLift r hr, objective_equalLift r hr] at hopt
  have hgap := minimizer_relativeEntropy_le_gap hc
    (optimizer_isLaw loss τ coeff restriction) hp
    (optimizer_pos loss restriction hτ hc) (optimizer_min loss τ coeff restriction)
  have hnon (b : β) : 0 ≤ Real.log (fiberSize r b) := Real.log_nonneg (by
    exact_mod_cast Nat.one_le_of_lt (fiberSize_pos r (hr b)))
  have hQ : 0 ≤ τ * expected q (fun b => Real.log (fiberSize r b)) :=
    mul_nonneg hτ.le (Finset.sum_nonneg fun b _ => mul_nonneg ((optimizer_isLaw loss τ coeff restriction).1 b) (hnon b))
  apply le_of_mul_le_mul_left _ hτ
  linarith only [hopt, hgap, hQ]

private theorem sqrt_sub_sq_le_relative {x y : ℝ} (hx : 0 ≤ x) (hy : 0 < y) :
    (√x - √y)^2 ≤ x * Real.log (x / y) + y - x := by
  rcases hx.eq_or_lt with h | h
  · rw [← h]
    simp [Real.sq_sqrt hy.le]
  have hsx := Real.sqrt_pos.mpr h
  have hsy := Real.sqrt_pos.mpr hy
  have hl := Real.log_le_sub_one_of_pos (div_pos hsy hsx)
  rw [Real.log_div hsy.ne' hsx.ne', Real.log_sqrt hy.le, Real.log_sqrt hx] at hl
  have hm := mul_le_mul_of_nonneg_left hl (show 0 ≤ 2 * x by positivity)
  have he : (2 * x) * (√y / √x - 1) = 2 * √x * √y - 2 * x := by
    nth_rewrite 1 [← Real.sq_sqrt hx]
    field_simp [hsx.ne']
    nlinarith only [Real.sq_sqrt hx]
  rw [he] at hm
  rw [Real.log_div h.ne' hy.ne']
  nlinarith only [hm, Real.sq_sqrt hx, Real.sq_sqrt hy.le]

/-- Squared Hellinger distance is bounded by relative entropy with a positive reference law. -/
theorem hellingerSq_le_relativeEntropy {p q : α → ℝ} (hp : IsLaw p) (hq : IsLaw q)
    (hpos : ∀ a, 0 < q a) : hellingerSq p q ≤ relativeEntropy p q := by
  have h := Finset.sum_le_sum fun a (_ : a ∈ Finset.univ) => sqrt_sub_sq_le_relative (hp.1 a) (hpos a)
  simpa only [Finset.sum_sub_distrib, Finset.sum_add_distrib, hp.2, hq.2, add_sub_cancel_right,
    hellingerSq, relativeEntropy] using h

omit [Fintype α] in
/-- Pushing forward through an injection preserves the mass of each source point. -/
theorem marginal_injective_apply {s : β → α} (hs : Function.Injective s) (q : β → ℝ) (b : β) :
    marginal s q (s b) = q b := by
  classical
  unfold marginal
  refine Finset.sum_eq_single b ?_ ?_
  · exact fun c hc hcb => False.elim (hcb (hs (Finset.mem_filter.mp hc).2))
  · simp

/-- An injective relabeling preserves squared Hellinger distance. -/
theorem hellingerSq_marginal_injective (s : β → α) (hs : Function.Injective s) (p q : β → ℝ) :
    hellingerSq (marginal s p) (marginal s q) = hellingerSq p q := by
  classical
  unfold hellingerSq
  calc
    _ = ∑ a ∈ Finset.univ.image s, (√(marginal s p a) - √(marginal s q a))^2 := by
      symm
      refine Finset.sum_subset (Finset.subset_univ _) fun a _ ha => ?_
      have hb : ¬ ∃ b, s b = a := by
        simpa only [Finset.mem_image, Finset.mem_univ, true_and] using ha
      simp [marginal_zero_of_no_preimage s _ hb]
    _ = _ := by
      rw [Finset.sum_image (fun x _ y _ h => hs h)]
      exact Finset.sum_congr rfl fun b _ => by rw [marginal_injective_apply hs, marginal_injective_apply hs]

/-- The Hellinger cost of placing every equal-split fiber entirely on a chosen section. -/
theorem hellingerSq_equalLift_collapse (r : α → β) (s : β → α)
    (hs : Function.LeftInverse r s) {q : β → ℝ} (hq : IsLaw q) :
    hellingerSq (equalLift r q) (marginal s q) =
      ∑ b, q b * (2 - 2 / √(fiberSize r b : ℝ)) := by
  have hLift := equalLift_isLaw r hs.rightInverse.surjective hq
  have hEmbed := hq.marginal s
  have hmul (a : α) : √(equalLift r q a) * √(marginal s q a) =
      marginal s q a * (√(equalLift r q a) / √(marginal s q a)) := by
    by_cases h : marginal s q a = 0
    · simp [h]
    have hh := (Real.sqrt_pos.mpr (lt_of_le_of_ne (hEmbed.1 a) (Ne.symm h))).ne'
    field_simp [hh]
    rw [Real.sq_sqrt (hEmbed.1 a)]
  have hL (b : β) : equalLift r q (s b) = q b / (fiberSize r b : ℝ) := by simp [equalLift, hs b]
  have hsum : (∑ a, √(equalLift r q a) * √(marginal s q a)) =
      ∑ b, q b / √(fiberSize r b : ℝ) := by
    simp_rw [hmul, marginal_weighted_sum s q (fun a => √(equalLift r q a) / √(marginal s q a)),
      marginal_injective_apply hs.injective, hL]
    refine Finset.sum_congr rfl fun b _ => ?_
    rw [Real.sqrt_div (hq.1 b)]
    by_cases hz : q b = 0
    · simp [hz]
    have hq' := (Real.sqrt_pos.mpr (lt_of_le_of_ne (hq.1 b) (Ne.symm hz))).ne'
    have hk : √(fiberSize r b : ℝ) ≠ 0 :=
      (Real.sqrt_pos.mpr (by exact_mod_cast fiberSize_pos r ⟨s b, hs b⟩)).ne'
    field_simp [hq', hk]
  have hsq (a : α) : (√(equalLift r q a) - √(marginal s q a))^2 =
      equalLift r q a + marginal s q a - 2 * (√(equalLift r q a) * √(marginal s q a)) := by
    nlinarith only [Real.sq_sqrt (hLift.1 a), Real.sq_sqrt (hEmbed.1 a)]
  unfold hellingerSq
  simp only [hsq, Finset.sum_add_distrib, Finset.sum_sub_distrib, ← Finset.mul_sum,
    hLift.2, hEmbed.2, hsum]
  have he (b : β) : q b * (2 / √(fiberSize r b : ℝ)) = 2 * (q b / √(fiberSize r b : ℝ)) := by ring
  simp only [mul_sub, Finset.sum_sub_distrib, he, ← Finset.sum_mul, ← Finset.mul_sum, hq.2, one_mul]
  ring

/-- Mass carried by coarser traces with two extensions. -/
noncomputable def doubleMass (r : α → β) (q : β → ℝ) : ℝ := by
  classical
  exact ∑ b ∈ Finset.univ.filter (fun b => fiberSize r b = 2), q b

theorem doubleMass_nonneg (r : α → β) {q : β → ℝ} (hq : IsLaw q) : 0 ≤ doubleMass r q :=
  Finset.sum_nonneg fun b _ => hq.1 b

theorem expected_log_fiberSize_eq_doubleMass (r : α → β) (q : β → ℝ)
    (hsize : ∀ b, fiberSize r b = 1 ∨ fiberSize r b = 2) :
    expected q (fun b => Real.log (fiberSize r b)) = Real.log 2 * doubleMass r q := by
  classical
  unfold expected doubleMass
  rw [Finset.mul_sum, Finset.sum_filter]
  refine Finset.sum_congr rfl fun b _ => ?_
  rcases hsize b with h | h <;> simp [h, mul_comm]

theorem mass_le_two_mass_add_hellingerSq (p q : α → ℝ)
    (hp : ∀ a, 0 ≤ p a) (hq : ∀ a, 0 ≤ q a) (E : Finset α) :
    (∑ a ∈ E, q a) ≤ 2 * (∑ a ∈ E, p a) + 2 * hellingerSq p q := by
  have hcoord (a : α) : q a ≤ 2 * p a + 2 * (√(p a) - √(q a))^2 := by
    nlinarith only [Real.sq_sqrt (hp a), Real.sq_sqrt (hq a),
      sq_nonneg (2 * √(p a) - √(q a))]
  have hsum := Finset.sum_le_sum fun a (_ : a ∈ E) => hcoord a
  rw [Finset.sum_add_distrib, ← Finset.mul_sum, ← Finset.mul_sum] at hsum
  have hh : (∑ a ∈ E, (√(p a) - √(q a))^2) ≤ hellingerSq p q :=
    Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ E) fun a _ _ => sq_nonneg _
  linarith only [hsum, hh]

theorem doubleMass_le_marked [DecidableEq α] (r : α → β) (mark : β → α) (hm : Function.LeftInverse r mark)
    {p : α → ℝ} {q : β → ℝ} (hp : IsLaw p) (hq : IsLaw q) :
    doubleMass r q ≤ 4 * (∑ a ∈ (Finset.univ.filter (fun b => fiberSize r b = 2)).image mark, p a) +
      4 * hellingerSq p (equalLift r q) := by
  classical
  let E := (Finset.univ.filter (fun b => fiberSize r b = 2)).image mark
  have hmass : (∑ a ∈ E, equalLift r q a) = doubleMass r q / 2 := by
    unfold E doubleMass
    rw [Finset.sum_image (fun x _ y _ h => hm.injective h), Finset.sum_div]
    refine Finset.sum_congr rfl fun b hb => ?_
    simp [equalLift, hm b, (Finset.mem_filter.mp hb).2]
  have hh := mass_le_two_mass_add_hellingerSq p (equalLift r q) hp.1
    (equalLift_isLaw r hm.rightInverse.surjective hq).1 E
  rw [hmass] at hh
  linarith only [hh]

/-- The optimizer comparison and fiber collapse together cost at most four times the mass of
coarse traces with two extensions. -/
theorem optimizer_collapse_hellingerSq [Nonempty α] [Nonempty β]
    (r : α → β) (s : β → α) (hs : Function.LeftInverse r s) (loss : β → ℝ) {τ : ℝ}
    {coeff : κ → ℝ} (restriction : ∀ j, β → γ j) (hτ : 0 < τ) (hc : ∀ j, 0 ≤ coeff j)
    (hsize : ∀ b, fiberSize r b = 1 ∨ fiberSize r b = 2) :
    let f := optimizer (loss ∘ r) τ coeff (fun j => restriction j ∘ r)
    let q := optimizer loss τ coeff restriction
    hellingerSq f (marginal s q) ≤ 4 * doubleMass r (marginal r f) := by
  intro f q
  let p := marginal r f
  have hp : IsLaw p := (optimizer_isLaw _ _ _ _).marginal r
  have hpos : ∀ b, 0 < q b := optimizer_pos _ _ hτ hc
  have hsmall : hellingerSq (marginal s p) (marginal s q) ≤ doubleMass r p := by
    rw [hellingerSq_marginal_injective s hs.injective]
    have h₁ := hellingerSq_le_relativeEntropy hp (optimizer_isLaw loss τ coeff restriction) hpos
    have h₂ := optimizer_collapse_relativeEntropy r hs.rightInverse.surjective loss restriction hτ hc
    have he := expected_log_fiberSize_eq_doubleMass r p hsize
    change relativeEntropy p q ≤ expected p (fun b => Real.log (fiberSize r b)) at h₂
    rw [he] at h₂
    have hl := Real.log_le_sub_one_of_pos (by norm_num : (0 : ℝ) < 2)
    have hh : Real.log 2 * doubleMass r p ≤ 1 * doubleMass r p :=
      mul_le_mul_of_nonneg_right (by linarith only [hl]) (doubleMass_nonneg r hp)
    linarith only [h₁, h₂, hh]
  have hbare : hellingerSq f (marginal s p) ≤ doubleMass r p := by
    have he : f = equalLift r p := optimizer_eq_equalLift r loss restriction hτ hc
    rw [he, hellingerSq_equalLift_collapse r s hs hp]
    classical
    unfold doubleMass
    rw [Finset.sum_filter]
    refine Finset.sum_le_sum fun b _ => ?_
    rcases hsize b with h | h
    · norm_num [h]
    · have hs₂ : 0 < √(2 : ℝ) := Real.sqrt_pos.mpr (by norm_num)
      have hu : √(2 : ℝ) ≤ 2 := by nlinarith only [Real.sq_sqrt (by norm_num : (0 : ℝ) ≤ 2), hs₂]
      have hd : 1 ≤ 2 / √(2 : ℝ) := (le_div_iff₀ hs₂).mpr (by linarith only [hu])
      simp only [h, Nat.cast_ofNat, ite_true]
      exact (mul_le_mul_of_nonneg_left (show 2 - 2 / √(2 : ℝ) ≤ 1 by linarith only [hd]) (hp.1 b)).trans_eq (mul_one _)
  have h := hellingerSq_triangle f (marginal s q) (marginal s p)
  rw [hellingerSq_comm (marginal s q) (marginal s p)] at h
  linarith only [h, hbare, hsmall]

end AgnosticVC
