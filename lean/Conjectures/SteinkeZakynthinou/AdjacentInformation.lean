module

public import Conjectures.SteinkeZakynthinou.Charges

/-! From the likelihood comparison to a pointwise neighboring-selector JS bound. -/

@[expose] public section

open scoped BigOperators

namespace SteinkeZakynthinou

private theorem drawWeight_pos {n : ℕ} (z : Sample n) (d : Draw n) :
    0 < drawWeight z d := div_pos (Tree.probability_pos _ _ _ _ _) (by positivity)

theorem log_two_ge_half : (1 / 2 : ℝ) ≤ Real.log 2 := by
  have h := Real.log_le_sub_one_of_pos (by norm_num : (0 : ℝ) < 1 / 2)
  rw [Real.log_div (by norm_num) (by norm_num), Real.log_one] at h
  linarith

theorem shared_draw_js_le {n : ℕ} (hn : 0 < n) (T : Pool n) (s : Selector n) (i : Fin n)
    (d₀ d₁ : Draw n)
    (h : auxCode (branchSample T s i false) (branchSelector s i false) d₀ =
      auxCode (branchSample T s i true) (branchSelector s i true) d₁) :
    jsTerm (drawWeight (branchSample T s i false) d₀) (drawWeight (branchSample T s i true) d₁) ≤
      drawCharge (branchSample T s i false) d₀ i + drawCharge (branchSample T s i true) d₁ i := by
  rcases d₀ with ⟨θ₀,p₀⟩
  rcases d₁ with ⟨θ₁,p₁⟩
  have hp : p₀ = p₁ := congrArg Prod.snd h
  subst p₁
  let z₀ := branchSample T s i false
  let z₁ := branchSample T s i true
  let p := drawWeight z₀ (θ₀,p₀)
  let q := drawWeight z₁ (θ₁,p₀)
  let l := ownDepths z₀ (θ₀,p₀) i
  let r := ownDepths z₁ (θ₁,p₀) i
  let e := fun j : ℕ => ((4 / 3 : ℝ)^j)^2
  let X := ∑ j ∈ l, e j
  let Y := ∑ j ∈ r, e j
  have hp := drawWeight_pos z₀ (θ₀,p₀)
  have hq := drawWeight_pos z₁ (θ₁,p₀)
  have hX : 0 ≤ X := Finset.sum_nonneg (fun _ _ => sq_nonneg _)
  have hY : 0 ≤ Y := Finset.sum_nonneg (fun _ _ => sq_nonneg _)
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  have hs := Real.sqrt_pos.mpr hnR
  have hlog := shared_draw_log_le hn T s i θ₀ θ₁ p₀ h
  change |Real.log p - Real.log q| ≤ (∑ j ∈ l ∪ r, (4 / 3 : ℝ)^j) / _ at hlog
  have hg := sum_growth_le_of_internalDepth hn (l ∪ r) (fun j hj => by
    rw [Finset.mem_union] at hj
    have hdepth : j < ((sampleTree n).spans p₀).length := by
      rcases hj with h₀ | h₁
      · exact (Tree.mem_activeDepths.mp (show j ∈ (sampleTree n).activeDepths p₀
          (windowHasRow z₀ θ₀ i) from h₀)).choose
      · exact (Tree.mem_activeDepths.mp (show j ∈ (sampleTree n).activeDepths p₀
          (windowHasRow z₁ θ₁ i) from h₁)).choose
    exact internal_power_two_le hn p₀ j hdepth)
  have hquarter : |Real.log p - Real.log q| ≤ 1 / 4 :=
    hlog.trans ((div_le_iff₀ (by positivity)).mpr (by convert hg using 1; ring))
  have htransport (u v : ℝ) (hu : 0 < u) (hv : 0 < v)
      (h : Real.log u - Real.log v ≤ 1/4) : u ≤ 2 * v := by
    apply (Real.log_le_log_iff hu (by positivity)).mp
    rw [Real.log_mul (by norm_num) hv.ne']
    linarith [log_two_ge_half]
  have hpq : p ≤ 2 * q := htransport p q hp hq (abs_le.mp hquarter).2
  have hqp : q ≤ 2 * p := htransport q p hq hp (by linarith [(abs_le.mp hquarter).1])
  have hsq : (Real.log p - Real.log q)^2 ≤ (∑ j ∈ l ∪ r, e j) / (64 * n) := by
    have h₀ := pow_le_pow_left₀ (abs_nonneg _) hlog 2
    rw [sq_abs, div_pow, mul_pow, Real.sq_sqrt hnR.le] at h₀
    refine h₀.trans ?_
    have h₁ := sq_sum_growth_le (l ∪ r)
    apply (div_le_iff₀ (by positivity)).mpr
    have he : (∑ j ∈ l ∪ r, e j) / (64 * (n : ℝ)) * (32^2 * n) =
        16 * ∑ j ∈ l ∪ r, e j := by field_simp; ring
    rw [he]
    exact h₁
  have hsum : (∑ j ∈ l ∪ r, e j) ≤ X + Y := by
    change (∑ j ∈ l ∪ r, e j) ≤ (∑ j ∈ l, e j) + ∑ j ∈ r, e j
    rw [← Finset.sum_union_inter]
    exact le_add_of_nonneg_right (Finset.sum_nonneg fun _ _ => sq_nonneg _)
  have hrel : (p+q) * (X+Y) ≤ 3 * (p*X + q*Y) := by
    nlinarith [mul_nonneg (sub_nonneg.mpr hqp) hX, mul_nonneg (sub_nonneg.mpr hpq) hY]
  have hB : 0 ≤ p*X + q*Y := add_nonneg (mul_nonneg hp.le hX) (mul_nonneg hq.le hY)
  calc
    _ ≤ (p+q) * (Real.log p - Real.log q)^2 / 2 := jsTerm_le_log_sq hp hq
    _ ≤ (p+q) * ((X + Y) / (64 * n)) / 2 :=
      div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left
        (hsq.trans (div_le_div_of_nonneg_right hsum (by positivity))) (by positivity)) (by norm_num)
    _ ≤ (p * X + q * Y) / n := by
      rw [← mul_div_assoc, div_div]
      apply (div_le_iff₀ (by positivity)).mpr
      have he : (p * X + q * Y) / n * (64 * n * 2) = 128 * (p*X + q*Y) := by field_simp; ring
      rw [he]
      linarith
    _ ≤ _ := by
      change _ ≤ p * (_ + 1 / (n : ℝ) * X) + q * (_ + 1 / (n : ℝ) * Y)
      have hl : 0 ≤ Real.log 2 / 2 := div_nonneg (Real.log_nonneg (by norm_num)) (by norm_num)
      have h₀ : 0 ≤ (if (localDrawCode z₀ (θ₀,p₀)).1.1 = some i then Real.log 2 / 2 else 0) := by split <;> positivity
      have h₁ : 0 ≤ (if (localDrawCode z₁ (θ₁,p₀)).1.1 = some i then Real.log 2 / 2 else 0) := by split <;> positivity
      have he : (p * X + q * Y) / n = p * (1 / (n : ℝ) * X) + q * (1 / (n : ℝ) * Y) := by ring
      rw [he]
      exact add_le_add
        (mul_le_mul_of_nonneg_left (le_add_of_nonneg_left h₀) hp.le)
        (mul_le_mul_of_nonneg_left (le_add_of_nonneg_left h₁) hq.le)

private noncomputable def chargeMass {n : ℕ} (T : Pool n) (s : Selector n)
    (i : Fin n) (a : AuxCode n) : ℝ := by
  classical
  exact ∑ d : Draw n, if auxCode (select T s) s d = a then drawCharge (select T s) d i else 0

private theorem chargeMass_at_code {n : ℕ} (T : Pool n) (s : Selector n)
    (i : Fin n) (d : Draw n) :
    chargeMass T s i (auxCode (select T s) s d) = drawCharge (select T s) d i := by
  classical
  unfold chargeMass
  simp only [(auxCode_injective _ _).eq_iff, Finset.sum_ite_eq', Finset.mem_univ, ite_true]

private theorem chargeMass_nonneg {n : ℕ} (T : Pool n) (s : Selector n)
    (i : Fin n) (a : AuxCode n) : 0 ≤ chargeMass T s i a := by
  unfold chargeMass
  exact Finset.sum_nonneg fun d _ => by split; exact drawCharge_nonneg _ _ _; exact le_rfl

private theorem sum_chargeMass {n : ℕ} (T : Pool n) (s : Selector n) (i : Fin n) :
    (∑ a, chargeMass T s i a) = ownCharge (select T s) i := by
  classical
  unfold chargeMass ownCharge
  rw [Finset.sum_comm]
  simp

theorem sum_adjacent_js_le {n : ℕ} (hn : 0 < n) (T : Pool n) (s : Selector n) (i : Fin n) :
    (∑ a, jsTerm (auxMass T (Function.update s i false) a)
      (auxMass T (Function.update s i true) a)) ≤
      ownCharge (select T (Function.update s i false)) i +
      ownCharge (select T (Function.update s i true)) i := by
  classical
  let b₀ := Function.update s i false
  let b₁ := Function.update s i true
  rw [← sum_chargeMass T b₀ i, ← sum_chargeMass T b₁ i, ← Finset.sum_add_distrib]
  apply Finset.sum_le_sum
  intro a _
  change jsTerm (auxMass T b₀ a) (auxMass T b₁ a) ≤ chargeMass T b₀ i a + chargeMass T b₁ i a
  have hsingle (b : Bool) (d : Draw n)
      (h : auxCode (branchSample T s i b) (branchSelector s i b) d ∉
        Set.range (auxCode (branchSample T s i (!b)) (branchSelector s i (!b)))) :
      drawWeight (branchSample T s i b) d * Real.log 2 / 2 ≤ drawCharge (branchSample T s i b) d i := by
    have he : (localDrawCode (branchSample T s i b) d).1.1 = some i := by
      by_contra hn
      exact h (code_mem_other_of_ne T s i b d hn)
    unfold drawCharge
    rw [ite_eq_left he, mul_div_assoc]
    apply mul_le_mul_of_nonneg_left _ (drawWeight_nonneg _ _)
    exact le_add_of_nonneg_right (mul_nonneg (by positivity) (Finset.sum_nonneg fun _ _ => sq_nonneg _))
  by_cases h₀ : a ∈ Set.range (auxCode (select T b₀) b₀)
  · obtain ⟨d₀,ha₀⟩ := h₀
    by_cases h₁ : a ∈ Set.range (auxCode (select T b₁) b₁)
    · obtain ⟨d₁,ha₁⟩ := h₁
      rw [← ha₀, auxMass_at_code, chargeMass_at_code, ha₀, ← ha₁, auxMass_at_code, chargeMass_at_code]
      exact shared_draw_js_le hn T s i d₀ d₁ (ha₀.trans ha₁.symm)
    · rw [auxMass_eq_zero_of_not_mem_range T b₁ a h₁, ← ha₀, auxMass_at_code, chargeMass_at_code,
        jsTerm_zero_right (drawWeight_nonneg _ _)]
      exact (hsingle false d₀ (ha₀.symm ▸ h₁)).trans (le_add_of_nonneg_right (chargeMass_nonneg _ _ _ _))
  · rw [auxMass_eq_zero_of_not_mem_range T b₀ a h₀, jsTerm_comm]
    by_cases h₁ : a ∈ Set.range (auxCode (select T b₁) b₁)
    · obtain ⟨d₁,ha₁⟩ := h₁
      rw [← ha₁, auxMass_at_code, chargeMass_at_code, jsTerm_zero_right (drawWeight_nonneg _ _)]
      exact (hsingle true d₁ (ha₁.symm ▸ h₀)).trans (le_add_of_nonneg_left (chargeMass_nonneg _ _ _ _))
    · rw [auxMass_eq_zero_of_not_mem_range T b₁ a h₁, jsTerm_zero_right le_rfl]
      simp only [zero_mul, zero_div]
      exact add_nonneg (chargeMass_nonneg _ _ _ _) (chargeMass_nonneg _ _ _ _)

end SteinkeZakynthinou
