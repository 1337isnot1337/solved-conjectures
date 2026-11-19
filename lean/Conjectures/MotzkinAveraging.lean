import Conjectures.MotzkinMeasure
import Mathlib.Data.Finset.Card
import Mathlib.Logic.Equiv.Fin.Rotate
import Mathlib.Tactic.Abel

/-! Averaging a finite indexed family, including repeated vertices. A closed
walk of odd length gives the sharp odd-cycle upper bound for Haar measure. -/
namespace Motzkin

open MeasureTheory MeasureTheory.Measure
open scoped BigOperators

variable {G I : Type*} [AddCommGroup G] [Fintype I]

noncomputable def familyCount (A : Set G) (p : I → G) (t : G) : ℕ := by
  classical
  exact (Finset.univ.filter (fun i => p i+t ∈ A)).card

theorem familyCount_eq_sum (A : Set G) (p : I → G) (t : G) :
    (familyCount A p t : ℝ) = ∑ i, indicator A (p i+t) := by
  classical
  simp only [familyCount,Finset.card_filter,indicator,Set.indicator_apply]
  push_cast
  rfl

variable [MeasurableSpace G] [MeasurableAdd G]

theorem integrable_familyCount (μ : Measure G) [IsFiniteMeasure μ]
    [IsAddLeftInvariant μ] {A : Set G} (hA : MeasurableSet A) (p : I → G) :
    Integrable (fun t => (familyCount A p t : ℝ)) μ := by
  simp only [familyCount_eq_sum]
  exact integrable_finsetSum Finset.univ
    (fun i _ => (integrable_indicator μ hA).comp_add_left (p i))

theorem integral_familyCount (μ : Measure G) [IsFiniteMeasure μ]
    [IsAddLeftInvariant μ] {A : Set G} (hA : MeasurableSet A) (p : I → G) :
    (∫ t, (familyCount A p t : ℝ) ∂μ) = (Fintype.card I:ℝ)*μ.real A := by
  simp only [familyCount_eq_sum]
  rw [integral_finsetSum Finset.univ
    (fun i _ => (integrable_indicator μ hA).comp_add_left (p i))]
  simp only [integral_add_left_eq_self,integral_indicator μ hA,Finset.sum_const,
    Finset.card_univ,nsmul_eq_mul]

theorem exists_familyCount_ge (μ : Measure G) [IsProbabilityMeasure μ]
    [IsAddLeftInvariant μ] {A : Set G} (hA : MeasurableSet A) (p : I → G) :
    ∃ t : G, (Fintype.card I:ℝ)*μ.real A ≤ (familyCount A p t : ℝ) := by
  obtain ⟨t,ht⟩ := exists_integral_le (integrable_familyCount μ hA p)
  rw [integral_familyCount μ hA p] at ht
  exact ⟨t,ht⟩

omit [MeasurableSpace G] [MeasurableAdd G] in
def ForbiddenStep (a b x y : G) : Prop :=
  y=x+a ∨ x=y+a ∨ y=x+b ∨ x=y+b

omit [MeasurableSpace G] [MeasurableAdd G] in
theorem avoids_forbiddenStep {A : Set G} {a b x y : G} (hA : Avoids A a b)
    (hxy : ForbiddenStep a b x y) (hx : x ∈ A) : y ∉ A := by
  intro hy
  rcases hxy with h | h | h | h
  · exact (hA x hx).1 (h ▸ hy)
  · exact (hA y hy).1 (h ▸ hx)
  · exact (hA x hx).2 (h ▸ hy)
  · exact (hA y hy).2 (h ▸ hx)

omit [MeasurableSpace G] [MeasurableAdd G] in
theorem ForbiddenStep.add_right {a b x y : G} (h : ForbiddenStep a b x y) (t : G) :
    ForbiddenStep a b (x+t) (y+t) := by
  rcases h with h | h | h | h
  · exact Or.inl (by rw [h]; abel)
  · exact Or.inr (Or.inl (by rw [h]; abel))
  · exact Or.inr (Or.inr (Or.inl (by rw [h]; abel)))
  · exact Or.inr (Or.inr (Or.inr (by rw [h]; abel)))

omit [AddCommGroup G] [MeasurableSpace G] [MeasurableAdd G] in
theorem permutation_independent_card (σ : Equiv.Perm I) (S : Finset I)
    (hS : ∀ i ∈ S, σ i ∉ S) : S.card ≤ Fintype.card I / 2 := by
  classical
  have hd : Disjoint S (S.map σ.toEmbedding) := by
    apply Finset.disjoint_left.mpr
    intro i hi hmap
    obtain ⟨j,hjS,rfl⟩ := Finset.mem_map.mp hmap
    exact hS j hjS hi
  have hc := Finset.card_le_univ (S ∪ S.map σ.toEmbedding)
  rw [Finset.card_union_of_disjoint hd,Finset.card_map] at hc
  omega

omit [MeasurableSpace G] [MeasurableAdd G] in
theorem walk_familyCount_le {A : Set G} {a b : G} (hA : Avoids A a b)
    (p : I → G) (σ : Equiv.Perm I)
    (hstep : ∀ i, ForbiddenStep a b (p i) (p (σ i))) (t : G) :
    familyCount A p t ≤ Fintype.card I / 2 := by
  classical
  apply permutation_independent_card σ
  intro i hi hj
  exact avoids_forbiddenStep hA ((hstep i).add_right t)
    (Finset.mem_filter.mp hi).2 (Finset.mem_filter.mp hj).2

/-- A finite closed walk, with repetitions allowed, bounds the measure of every
measurable avoiding set by the independence ratio of the cycle of that length. -/
theorem closed_walk_measure_bound (μ : Measure G) [IsProbabilityMeasure μ]
    [IsAddLeftInvariant μ] {A : Set G} (hA : MeasurableSet A) {a b : G}
    (havoid : Avoids A a b) {n : ℕ} (hn : 0 < n) (p : Fin n → G)
    (hstep : ∀ i, ForbiddenStep a b (p i) (p (finRotate n i))) :
    μ.real A ≤ (n/2:ℕ)/(n:ℝ) := by
  obtain ⟨t,ht⟩ := exists_familyCount_ge μ hA p
  have hc := walk_familyCount_le havoid p (finRotate n) hstep t
  rw [Fintype.card_fin] at ht hc
  have hcr : (familyCount A p t:ℝ) ≤ (n/2:ℕ) := by exact_mod_cast hc
  apply (le_div_iff₀ (by exact_mod_cast hn : (0:ℝ) < n)).mpr
  nlinarith only [ht,hcr]

end Motzkin
