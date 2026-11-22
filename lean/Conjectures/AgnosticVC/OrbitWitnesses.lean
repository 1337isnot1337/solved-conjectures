module

public import Conjectures.AgnosticVC.OrbitClass
public import Conjectures.AgnosticVC.OrbitTransversal
public import Mathlib.Analysis.Normed.Group.AddCircle

import Mathlib.Analysis.Real.Cardinality

/-! Countably many measurable, sample-dependent candidates realize all finite traces
of the orbit class. -/

@[expose] public section

open Function MeasureTheory Set

namespace AgnosticVC

section Candidates

variable {G : Type*} [AddCommGroup G] [MeasurableSpace G] [MeasurableAdd₂ G]

/-- Translate each observed feature by each subgroup element. These candidates suffice
for nonempty traces. From the fixed sequence of distinct cosets, one representative
can avoid all observed cosets and hence realize the empty trace. -/
theorem exists_measurable_orbitTraceCandidates (Γ : AddSubgroup G) [Countable Γ]
    (b : ℕ → G) (hcosets : ∀ {i j : ℕ}, b i - b j ∈ Γ → i = j) (n : ℕ) :
    ∃ candidate : ℕ → (Fin n → G × Bool) → G,
      (∀ j, Measurable (candidate j)) ∧
      ∀ x h, ∃ j, sampleTrace (orbitPredict Γ) x (candidate j x) =
        sampleTrace (orbitPredict Γ) x h := by
  classical
  let I := (Fin n × Γ) ⊕ ℕ
  obtain ⟨e, he⟩ := exists_surjective_nat I
  let pick (j : I) (x : Fin n → G × Bool) : G :=
    match j with
    | .inl (i, γ) => (x i).1 + (γ : G)
    | .inr l => b l
  have hpick (j : I) : Measurable (pick j) := by
    rcases j with ⟨i, γ⟩ | l
    · exact (measurable_pi_apply i).fst.add measurable_const
    · exact measurable_const
  refine ⟨fun j => pick (e j), fun j => hpick (e j), ?_⟩
  intro x h
  by_cases hh : ∃ i, orbitPredict Γ h (x i) = true
  · obtain ⟨i, hi⟩ := hh
    have hγ : h - (x i).1 ∈ Γ := by
      rcases hrow : x i with ⟨a, label⟩
      cases label
      · have ha : a - h ∈ Γ := by simpa [hrow] using hi
        simpa [hrow, neg_sub] using Γ.neg_mem ha
      · have ha : a = h := by simpa [hrow] using hi
        simp [ha]
    obtain ⟨j, hj⟩ := he (.inl (i, ⟨h - (x i).1, hγ⟩))
    refine ⟨j, ?_⟩
    have heq : pick (e j) x = h := by
      rw [hj]
      change (x i).1 + (h - (x i).1) = h
      rw [add_comm, sub_add_cancel]
    exact congrArg (sampleTrace (orbitPredict Γ) x) heq
  · let bad (i : Fin n) : Set ℕ := {l | (x i).1 - b l ∈ Γ}
    have hfinite (i : Fin n) : (bad i).Finite := Set.Subsingleton.finite (by
      intro p hp q hq
      apply hcosets
      change (x i).1 - b p ∈ Γ at hp
      change (x i).1 - b q ∈ Γ at hq
      simpa [sub_sub_sub_cancel_left] using Γ.sub_mem hq hp)
    obtain ⟨l, hl⟩ := (finite_iUnion hfinite).exists_notMem
    obtain ⟨j, hj⟩ := he (.inr l)
    refine ⟨j, ?_⟩
    change sampleTrace (orbitPredict Γ) x (pick (e j) x) = sampleTrace (orbitPredict Γ) x h
    rw [hj]
    ext i
    simp only [mem_sampleTrace]
    have hi : (x i).1 - b l ∉ Γ := fun hm => hl (mem_iUnion.mpr ⟨i, hm⟩)
    have hz : orbitPredict Γ (b l) (x i) ≠ true := by
      rcases hrow : x i with ⟨a, label⟩
      cases label
      · simpa [hrow] using hi
      · intro hpos
        have ha : a = b l := by simpa [hrow] using hpos
        exact hi (by simp [hrow, ha])
    exact iff_of_false hz (fun hpos => hh ⟨i, hpos⟩)

end Candidates

private theorem countable_of_countable_orbitQuotient {G : Type*} [AddCommGroup G]
    (Γ : AddSubgroup G) [Countable Γ] [Countable (G ⧸ Γ)] : Countable G := by
  let q : G → G ⧸ Γ := QuotientAddGroup.mk
  have hq : Surjective q := QuotientAddGroup.mk_surjective
  obtain ⟨r, hr⟩ := hq.hasRightInverse
  have hs : Surjective (fun p : (G ⧸ Γ) × Γ => (p.2 : G) + r p.1) := by
    intro x
    have heq : q x = q (r (q x)) := (hr (q x)).symm
    have hmem : x - r (q x) ∈ Γ := QuotientAddGroup.eq_iff_sub_mem.mp heq
    exact ⟨(q x, ⟨x - r (q x), hmem⟩), sub_add_cancel _ _⟩
  exact hs.countable

private theorem not_countable_unitAddCircle : ¬ Countable UnitAddCircle := by
  intro h
  let Γ := AddSubgroup.zmultiples (1 : ℝ)
  let _ : Countable Γ := by
    have hc : Set.Countable (Γ : Set ℝ) := by
      rw [AddSubgroup.coe_zmultiples]
      exact countable_range _
    exact hc.to_subtype
  let _ : Countable (ℝ ⧸ Γ) := h
  let _ : Countable ℝ := countable_of_countable_orbitQuotient Γ
  exact Cardinal.not_countable_real Set.countable_univ

private theorem circle_exists_distinctCosets :
    ∃ b : ℕ → UnitAddCircle,
      ∀ {i j : ℕ}, b i - b j ∈ irrationalCircleSubgroup → i = j := by
  let Γ := irrationalCircleSubgroup
  let _ : Infinite (UnitAddCircle ⧸ Γ) := by
    by_contra h
    let _ : Finite (UnitAddCircle ⧸ Γ) := not_infinite_iff_finite.mp h
    exact not_countable_unitAddCircle (countable_of_countable_orbitQuotient Γ)
  let e := Infinite.natEmbedding (UnitAddCircle ⧸ Γ)
  let q : UnitAddCircle → UnitAddCircle ⧸ Γ := QuotientAddGroup.mk
  have hq : Surjective q := QuotientAddGroup.mk_surjective
  obtain ⟨r, hr⟩ := hq.hasRightInverse
  refine ⟨r ∘ e, fun {i j} h => e.injective ?_⟩
  exact (hr (e i)).symm.trans ((QuotientAddGroup.eq_iff_sub_mem.mpr h).trans (hr (e j)))

/-- The circle orbit class has countably many Borel candidate maps realizing every
finite trace. -/
theorem exists_measurable_circleOrbitTraceCandidates (n : ℕ) :
    ∃ candidate : ℕ → (Fin n → UnitAddCircle × Bool) → UnitAddCircle,
      (∀ j, Measurable (candidate j)) ∧
      ∀ x h, ∃ j, sampleTrace (orbitPredict irrationalCircleSubgroup) x (candidate j x) =
        sampleTrace (orbitPredict irrationalCircleSubgroup) x h := by
  obtain ⟨b, hb⟩ := circle_exists_distinctCosets
  exact exists_measurable_orbitTraceCandidates irrationalCircleSubgroup b hb n

end AgnosticVC
