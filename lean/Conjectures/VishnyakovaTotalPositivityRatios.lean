module

public import Mathlib.Topology.Order.MonotoneConvergence
public import Mathlib.Topology.Instances.Real.Lemmas
public import Mathlib.Topology.Algebra.Order.Field
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Algebra.BigOperators.Field
public import Mathlib.Tactic.FieldSimp
public import Mathlib.Tactic.Linarith

/-!
Ratio limits for the rational Pólya-frequency argument.

A positive log-concave sequence has a nonnegative limiting consecutive ratio.
An eventual finite linear recurrence whose first coefficient is nonzero makes
that limit positive and supplies its exact characteristic equation. These are
the analytic ingredients in the rational-only argument of Skryabin, Lemma 3.7,
arXiv:1903.09128. No classification theorem is assumed here.
-/

@[expose] public section

namespace VishnyakovaTotalPositivity

open Filter
open scoped Topology BigOperators

noncomputable def ratio (a : ℕ → ℝ) (n : ℕ) : ℝ := a (n + 1) / a n

theorem ratio_antitone (a : ℕ → ℝ) (ha : ∀ n, 0 < a n)
    (hlc : ∀ n, a (n + 1) ^ 2 ≥ a n * a (n + 2)) :
    Antitone (ratio a) := by
  apply antitone_nat_of_succ_le
  intro n
  unfold ratio
  apply (div_le_div_iff₀ (ha (n + 1)) (ha n)).mpr
  have h := hlc n
  nlinarith

theorem exists_ratio_limit (a : ℕ → ℝ) (ha : ∀ n, 0 < a n)
    (hlc : ∀ n, a (n + 1) ^ 2 ≥ a n * a (n + 2)) :
    ∃ gamma : ℝ, 0 ≤ gamma ∧ Tendsto (ratio a) atTop (𝓝 gamma) := by
  have hb : BddBelow (Set.range (ratio a)) := by
    refine ⟨0, ?_⟩
    rintro _ ⟨n, rfl⟩
    exact (div_pos (ha (n + 1)) (ha n)).le
  refine ⟨⨅ n, ratio a n, ?_, tendsto_atTop_ciInf (ratio_antitone a ha hlc) hb⟩
  exact le_ciInf (fun n => (div_pos (ha (n + 1)) (ha n)).le)

theorem shifted_ratio_limit (a : ℕ → ℝ) (ha : ∀ n, 0 < a n)
    {gamma : ℝ} (hlim : Tendsto (ratio a) atTop (𝓝 gamma)) (k : ℕ) :
    Tendsto (fun n => a (n + k) / a n) atTop (𝓝 (gamma ^ k)) := by
  induction k with
  | zero =>
    simpa only [Nat.add_zero, div_self (ha _).ne', pow_zero] using
      (tendsto_const_nhds : Tendsto (fun _ : ℕ => (1 : ℝ)) atTop (𝓝 1))
  | succ k ih =>
    have hs := hlim.comp (tendsto_add_atTop_nat k)
    have heq (n : ℕ) :
        a (n + (k + 1)) / a n = ratio a (n + k) * (a (n + k) / a n) := by
      unfold ratio
      rw [Nat.add_assoc]
      field_simp [(ha n).ne', (ha (n + k)).ne']
    simpa only [Function.comp_def, ← heq, pow_succ, mul_comm] using hs.mul ih

theorem recurrence_at_ratio_limit (a : ℕ → ℝ) (ha : ∀ n, 0 < a n)
    {gamma : ℝ} (hlim : Tendsto (ratio a) atTop (𝓝 gamma))
    (d : ℕ) (c : Fin (d + 1) → ℝ)
    (hrec : ∀ᶠ n in atTop, (∑ i : Fin (d + 1), c i * a (n + i.val)) = 0) :
    (∑ i : Fin (d + 1), c i * gamma ^ i.val) = 0 := by
  have hs : Tendsto (fun n => ∑ i : Fin (d + 1), c i * (a (n + i.val) / a n))
      atTop (𝓝 (∑ i : Fin (d + 1), c i * gamma ^ i.val)) := by
    apply tendsto_finsetSum
    intro i _
    exact tendsto_const_nhds.mul (shifted_ratio_limit a ha hlim i.val)
  have hz : ∀ᶠ n in atTop,
      (∑ i : Fin (d + 1), c i * (a (n + i.val) / a n)) = 0 := by
    filter_upwards [hrec] with n hn
    simp_rw [← mul_div_assoc]
    rw [← Finset.sum_div, hn, zero_div]
  exact tendsto_nhds_unique hs (tendsto_const_nhds.congr' (hz.mono fun _ h => h.symm))

/-- A positive log-concave sequence with an eventual forward recurrence has a
positive ratio limit satisfying the recurrence's characteristic equation. -/
theorem positive_ratio_limit_of_recurrence (a : ℕ → ℝ) (ha : ∀ n, 0 < a n)
    (hlc : ∀ n, a (n + 1) ^ 2 ≥ a n * a (n + 2))
    (d : ℕ) (c : Fin (d + 1) → ℝ) (hc : c 0 ≠ 0)
    (hrec : ∀ᶠ n in atTop, (∑ i : Fin (d + 1), c i * a (n + i.val)) = 0) :
    ∃ gamma : ℝ, 0 < gamma ∧
      (∀ k : ℕ, Tendsto (fun n => a (n + k) / a n) atTop (𝓝 (gamma ^ k))) ∧
      (∑ i : Fin (d + 1), c i * gamma ^ i.val) = 0 := by
  obtain ⟨gamma, hnonneg, hlim⟩ := exists_ratio_limit a ha hlc
  have hroot := recurrence_at_ratio_limit a ha hlim d c hrec
  have hne : gamma ≠ 0 := by
    intro hzero
    apply hc
    simpa [hzero, Fin.sum_univ_succ] using hroot
  exact ⟨gamma, lt_of_le_of_ne hnonneg hne.symm,
    shifted_ratio_limit a ha hlim, hroot⟩

end VishnyakovaTotalPositivity
