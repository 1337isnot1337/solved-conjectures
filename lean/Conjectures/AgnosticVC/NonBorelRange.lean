module

public import Mathlib.MeasureTheory.Constructions.Polish.Basic

@[expose] public section

namespace AgnosticVC

open Set MeasureTheory TopologicalSpace

private abbrev Baire := ℕ → ℕ

/-- A sequence of natural numbers specifies which members of a countable basis to exclude.
The complementary open set of any closed set can be represented this way. -/
private theorem exists_universal_closed {X : Type*} [TopologicalSpace X]
    [SecondCountableTopology X] :
    ∃ F : Set (Baire × X), IsClosed F ∧
      ∀ s : Set X, IsClosed s → ∃ c : Baire, ∀ x, (c, x) ∈ F ↔ x ∈ s := by
  classical
  obtain ⟨b, hb, -, hbasis⟩ := exists_countable_basis X
  have : Countable b := hb.to_subtype
  obtain ⟨index, hindex⟩ := exists_injective_nat b
  let F : Set (Baire × X) := ⋂ t : b,
    {p | p.1 (index t) = 0} ∪ Prod.snd ⁻¹' (t.val)ᶜ
  refine ⟨F, isClosed_iInter (fun t => ?_), ?_⟩
  · exact (isClosed_eq ((continuous_apply (index t)).comp continuous_fst)
      continuous_const).union ((hbasis.isOpen t.property).isClosed_compl.preimage continuous_snd)
  · intro s hs
    let c : Baire := fun n => if ∃ t : b, index t = n ∧ t.val ⊆ sᶜ then 1 else 0
    have hc (t : b) : c (index t) = 0 ↔ ¬ t.val ⊆ sᶜ := by
      have he : (∃ u : b, index u = index t ∧ u.val ⊆ sᶜ) ↔ t.val ⊆ sᶜ :=
        ⟨fun ⟨u, hu, h⟩ => hindex hu ▸ h, fun h => ⟨t, rfl, h⟩⟩
      change (if ∃ u : b, index u = index t ∧ u.val ⊆ sᶜ then (1 : ℕ) else 0) = 0 ↔ _
      rw [he]
      by_cases h : t.val ⊆ sᶜ <;> simp [h]
    refine ⟨c, fun x => ?_⟩
    simp only [F, mem_iInter, mem_union, mem_ofPred_eq, mem_preimage, mem_compl_iff, hc]
    constructor
    · intro h
      by_contra hxs
      obtain ⟨t, ht, hxt, hts⟩ := hbasis.exists_subset_of_mem_open hxs hs.isOpen_compl
      exact (h ⟨t, ht⟩).elim (· hts) (· hxt)
    · intro h t
      by_cases hxt : x ∈ t.val
      · exact Or.inl (fun ht => ht hxt h)
      · exact Or.inr hxt

/-- Project a universal family of closed subsets of `Baire × Baire` along the last coordinate.
Closed graphs of continuous functions give sections for all nonempty analytic sets. -/
private theorem exists_universal_analytic :
    ∃ U : Set (Baire × Baire), AnalyticSet U ∧
      ∀ s : Set Baire, AnalyticSet s → ∃ c : Baire, ∀ x, (c, x) ∈ U ↔ x ∈ s := by
  obtain ⟨F, hF, hsection⟩ := exists_universal_closed (X := Baire × Baire)
  let project : Baire × (Baire × Baire) → Baire × Baire := fun p => (p.1, p.2.1)
  refine ⟨project '' F, hF.analyticSet.image_of_continuous
    (continuous_fst.prodMk (continuous_fst.comp continuous_snd)), ?_⟩
  intro s hs
  have hex (G : Set (Baire × Baire)) (hG : IsClosed G)
      (h : ∀ x : Baire, (∃ y, (x, y) ∈ G) ↔ x ∈ s) :
      ∃ c : Baire, ∀ x, (c, x) ∈ project '' F ↔ x ∈ s := by
    obtain ⟨c, hc⟩ := hsection G hG
    refine ⟨c, fun x => ?_⟩
    rw [← h x]
    constructor
    · rintro ⟨⟨a, u, v⟩, hm, he⟩
      change (a, u) = (c, x) at he
      cases he
      exact ⟨v, (hc _).mp hm⟩
    · rintro ⟨v, hv⟩
      exact ⟨(c, x, v), (hc (x, v)).mpr hv, rfl⟩
  rw [AnalyticSet] at hs
  rcases hs with rfl | ⟨f, hf, rfl⟩
  · exact hex ∅ isClosed_empty (fun _ => by simp)
  · exact hex {p | f p.2 = p.1} (isClosed_eq (hf.comp continuous_snd) continuous_fst) (fun _ => Iff.rfl)

/-- There is a continuous map of Baire space into itself whose range is not Borel. -/
theorem exists_continuous_nat_nat_nonmeasurable_range :
    ∃ f : (ℕ → ℕ) → ℕ → ℕ, Continuous f ∧ ¬ MeasurableSet (Set.range f) := by
  obtain ⟨U, hU, hsection⟩ := exists_universal_analytic
  let A : Set Baire := (fun x : Baire => (x, x)) ⁻¹' U
  have hA : AnalyticSet A := hU.preimage (continuous_id.prodMk continuous_id)
  have hnon : ¬ MeasurableSet A := by
    intro hm
    obtain ⟨c, hc⟩ := hsection Aᶜ hm.compl.analyticSet
    have hc' : c ∈ A ↔ c ∉ A := hc c
    have hn : c ∉ A := fun h => hc'.mp h h
    exact hn (hc'.mpr hn)
  rw [AnalyticSet] at hA
  rcases hA with h | ⟨f, hf, h⟩
  · exact (hnon (h ▸ MeasurableSet.empty)).elim
  · exact ⟨f, hf, h ▸ hnon⟩

end AgnosticVC
