import Conjectures.JohnsonPfaffianSource
import Mathlib.Analysis.SpecialFunctions.Sqrt
namespace JohnsonPfaffian

noncomputable def pairIndicator {α : Type*} [DecidableEq α] (S : Finset α) (x y : α) : ℝ :=
  if x ∈ S ∧ y ∈ S then 1 else 0

theorem product_intersection_expansion {ι α : Type*} [DecidableEq ι] [DecidableEq α]
    (T : Finset ι) (S : ι → Finset α) (t : ι → ℝ) (x y : α) :
    (∏ q ∈ T, if x ∈ S q ∧ y ∈ S q then t q else 1) =
      ∑ K ∈ T.powerset, (∏ q ∈ K, (t q-1)) *
        (if ∀ q ∈ K, x ∈ S q ∧ y ∈ S q then 1 else 0) := by
  classical
  have hf (q : ι) : (if x ∈ S q ∧ y ∈ S q then t q else 1) =
      1 + ((t q-1)*pairIndicator (S q) x y) := by
    by_cases h : x ∈ S q ∧ y ∈ S q <;> simp [pairIndicator,h]
  calc
    _ = ∏ q ∈ T, (1 + ((t q-1)*pairIndicator (S q) x y)) := by
      apply Finset.prod_congr rfl
      intro q hq
      exact hf q
    _ = ∑ K ∈ T.powerset, ∏ q ∈ K, (t q-1)*pairIndicator (S q) x y := Finset.prod_one_add T
    _ = _ := by
      apply Finset.sum_congr rfl
      intro K hK
      by_cases h : ∀ q ∈ K, x ∈ S q ∧ y ∈ S q
      · rw [ite_eq_left h, mul_one]
        apply Finset.prod_congr rfl
        intro q hq
        simp [pairIndicator, h q hq]
      · have hn : ∃ q ∈ K, ¬(x ∈ S q ∧ y ∈ S q) := by
          by_contra hn
          apply h
          intro q hq
          by_contra hqbad
          exact hn ⟨q,hq,hqbad⟩
        obtain ⟨q,hq,hqbad⟩ := hn
        have hz : (∏ q ∈ K, (t q-1)*pairIndicator (S q) x y)=0 := by
          apply Finset.prod_eq_zero hq
          simp [pairIndicator,hqbad]
        simp [h,hz]

theorem intersection_is_interval {ι : Type*} (K : Finset ι) (S : ι → Finset ℕ)
    (hS : ∀ q ∈ K, ∀ x y z, x ≤ y → y ≤ z → x ∈ S q → z ∈ S q → y ∈ S q)
    (x y z : ℕ) (hxy : x≤y) (hyz : y≤z)
    (hx : ∀ q ∈ K, x ∈ S q) (hz : ∀ q ∈ K, z ∈ S q) :
    ∀ q ∈ K, y ∈ S q := by
  intro q hq
  exact hS q hq x y z hxy hyz (hx q hq) (hz q hq)

theorem intersection_coefficient_nonnegative {ι : Type*} (K : Finset ι) (t : ι → ℝ)
    (ht : ∀ q ∈ K, 1 ≤ t q) : 0 ≤ ∏ q ∈ K, (t q-1) := by
  apply Finset.prod_nonneg
  intro q hq
  exact sub_nonneg.mpr (ht q hq)

noncomputable def intervalFactor (t : ℝ) (u v : Bool) : ℝ := if u && v then t else 1
noncomputable def complementGauge (t : ℝ) (u : Bool) : ℝ := if u then Real.sqrt t else (Real.sqrt t)⁻¹

theorem complement_gauge (t : ℝ) (u v : Bool) (ht : 0 < t) :
    intervalFactor t u v = complementGauge t u * complementGauge t v * intervalFactor t (!u) (!v) := by
  have hs : (Real.sqrt t)^2 = t := Real.sq_sqrt ht.le
  have hn : Real.sqrt t ≠ 0 := ne_of_gt (Real.sqrt_pos.2 ht)
  cases u <;> cases v <;> simp [intervalFactor, complementGauge] <;> field_simp [hn] <;> nlinarith

theorem complementGauge_positive (t : ℝ) (u : Bool) (ht : 0 < t) : 0 < complementGauge t u := by
  cases u <;> simp [complementGauge] <;> positivity

theorem product_complement_gauge {ι : Type*} (T : Finset ι) (t : ι → ℝ) (u v : ι → Bool)
    (ht : ∀ q ∈ T, 0 < t q) :
    (∏ q ∈ T, intervalFactor (t q) (u q) (v q)) =
      (∏ q ∈ T, complementGauge (t q) (u q)) *
      (∏ q ∈ T, complementGauge (t q) (v q)) *
      (∏ q ∈ T, intervalFactor (t q) (!(u q)) (!(v q))) := by
  calc
    _ = ∏ q ∈ T, (complementGauge (t q) (u q) * complementGauge (t q) (v q) *
        intervalFactor (t q) (!(u q)) (!(v q))) := by
      apply Finset.prod_congr rfl
      intro q hq
      exact complement_gauge _ _ _ (ht q hq)
    _ = _ := by simp only [Finset.prod_mul_distrib]
end JohnsonPfaffian
