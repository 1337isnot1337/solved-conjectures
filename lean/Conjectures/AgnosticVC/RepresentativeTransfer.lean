module

public import Conjectures.AgnosticVC.OptimizerCollapse
public import Conjectures.AgnosticVC.OptimizerGradient

/-! A deletion estimate on traces transfers to output names when each selected
representative depends on a bounded set of rows. -/

@[expose] public section

open scoped BigOperators

namespace AgnosticVC

variable {A B C I : Type*} [Fintype A] [Fintype B] [Fintype C] [Fintype I]

omit [Fintype B] [Fintype I] in
/-- If two readouts agree off a set of mass ε, their squared Hellinger distance
is at most 2ε. -/
theorem hellingerSq_marginal_le_of_eq_off (f g : A → C) (p : A → ℝ)
    (hp : ∀ a, 0 ≤ p a) (bad : Finset A) (he : ∀ a, a ∉ bad → f a = g a) :
    hellingerSq (marginal f p) (marginal g p) ≤ 2 * ∑ a ∈ bad, p a := by
  classical
  let q (a : A) := if a ∈ bad then 0 else p a
  have hq (a : A) : 0 ≤ q a := by dsimp [q]; split <;> simp [hp]
  have hqp (a : A) : q a ≤ p a := by dsimp [q]; split <;> simp [hp]
  have heq : marginal f q = marginal g q := by
    funext c
    simp only [marginal, Finset.sum_filter]
    apply Finset.sum_congr rfl
    intro a _
    by_cases ha : a ∈ bad
    · simp [q, ha]
    · rw [he a ha]
  let u := marginal f p
  let v := marginal g p
  let w := marginal f q
  have hw (c : C) : 0 ≤ w c := marginal_nonneg f hq c
  have hwu (c : C) : w c ≤ u c := Finset.sum_le_sum fun a _ => hqp a
  have hwv (c : C) : w c ≤ v c := by
    change marginal f q c ≤ marginal g p c
    rw [heq]
    exact Finset.sum_le_sum fun a _ => hqp a
  have hcoord (c : C) : (√(u c) - √(v c)) ^ 2 ≤ u c + v c - 2 * w c := by
    have hprod : w c ≤ √(u c) * √(v c) := by
      have hh := mul_le_mul (Real.sqrt_le_sqrt (hwu c)) (Real.sqrt_le_sqrt (hwv c))
        (Real.sqrt_nonneg _) (Real.sqrt_nonneg _)
      rwa [← sq, Real.sq_sqrt (hw c)] at hh
    nlinarith only [hprod, Real.sq_sqrt (marginal_nonneg f hp c), Real.sq_sqrt (marginal_nonneg g hp c)]
  unfold hellingerSq
  calc
    _ ≤ ∑ c, (u c + v c - 2 * w c) := Finset.sum_le_sum fun c _ => hcoord c
    _ = 2 * ∑ a ∈ bad, p a := by
      dsimp only [u, v, w]
      rw [Finset.sum_sub_distrib, Finset.sum_add_distrib, ← Finset.mul_sum,
        marginal_sum, marginal_sum, marginal_sum]
      have hsplit := Finset.sum_filter_add_sum_filter_not Finset.univ (fun a => a ∈ bad) p
      simp only [Finset.filter_univ_mem] at hsplit
      have hqsum : (∑ a, q a) = ∑ a ∈ Finset.univ.filter (fun a => a ∉ bad), p a := by
        rw [Finset.sum_filter]
        apply Finset.sum_congr rfl
        intro a _
        by_cases ha : a ∈ bad <;> simp [q, ha]
      rw [hqsum, ← hsplit]
      ring

omit [Fintype I] in
open Classical in
private theorem mass_marginal_on (s : B → A) (p : B → ℝ) (bad : Finset A) :
    (∑ b ∈ Finset.univ.filter (fun b => s b ∈ bad), p b) =
      ∑ a ∈ bad, marginal s p a := by
  classical
  have he := marginal_weighted_sum s p (fun a => if a ∈ bad then (1 : ℝ) else 0)
  simp only [mul_ite, mul_one, mul_zero, ← Finset.sum_filter, Finset.filter_univ_mem] at he
  exact he.symm

omit [Fintype I] in
/-- Compare actual output names using any trace lift. The lift should use the
full trace of the short-sample output. Its name can differ from the full
representative only on the exceptional traces. -/
theorem hellingerSq_named_le_of_trace_lift (f : A → C) (hf : Function.Injective f)
    (g : B → C) (s : B → A) (q : A → ℝ) (p : B → ℝ)
    (hq : ∀ a, 0 ≤ q a) (hp : ∀ b, 0 ≤ p b)
    (bad : Finset A) (he : ∀ b, s b ∉ bad → f (s b) = g b) :
    hellingerSq (marginal f q) (marginal g p) ≤
      10 * hellingerSq q (marginal s p) + 8 * ∑ a ∈ bad, q a := by
  classical
  let r := marginal s p
  have hmatch := hellingerSq_marginal_le_of_eq_off (f ∘ s) g p hp
    (Finset.univ.filter (fun b => s b ∈ bad)) (by simpa only [Finset.mem_filter, Finset.mem_univ,
      true_and, Function.comp_apply] using he)
  change hellingerSq (marginal (f ∘ s) p) (marginal g p) ≤ _ at hmatch
  rw [mass_marginal_on s p bad, ← marginal_comp] at hmatch
  change hellingerSq (marginal f r) (marginal g p) ≤ 2 * ∑ a ∈ bad, r a at hmatch
  have hmass := mass_le_two_mass_add_hellingerSq q r hq (marginal_nonneg s hp) bad
  have htri := hellingerSq_triangle (marginal f q) (marginal g p) (marginal f r)
  rw [hellingerSq_marginal_injective f hf, hellingerSq_comm (marginal g p)] at htri
  linarith only [hmatch, hmass, htri]

omit [Fintype B] in
open Classical in
/-- If a trace representative uses at most `k` rows, the sum of the masses
charged to the rows is at most `k`. -/
theorem representative_anchor_mass_le (q : A → ℝ) (hq : IsLaw q)
    (anchor : A → Finset I) (k : ℕ) (hk : ∀ a, (anchor a).card ≤ k) :
    (∑ i, ∑ a ∈ Finset.univ.filter (fun a => i ∈ anchor a), q a) ≤ (k : ℝ) := by
  classical
  simp_rw [Finset.sum_filter]
  rw [Finset.sum_comm]
  calc
    _ = ∑ a, (anchor a).card * q a := by
      apply Finset.sum_congr rfl
      intro a _
      rw [← Finset.sum_filter, Finset.filter_univ_mem, Finset.sum_const, nsmul_eq_mul]
    _ ≤ ∑ a, (k : ℝ) * q a :=
      Finset.sum_le_sum fun a _ => mul_le_mul_of_nonneg_right (by exact_mod_cast hk a) (hq.1 a)
    _ = (k : ℝ) := by rw [← Finset.mul_sum, hq.2, mul_one]

end AgnosticVC
