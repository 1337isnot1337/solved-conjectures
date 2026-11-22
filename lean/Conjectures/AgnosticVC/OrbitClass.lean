module

public import Conjectures.AgnosticVC.OrderedERM
public import Mathlib.MeasureTheory.Group.Arithmetic

/-! A VC-one class with one layer for additive cosets and one layer of singleton
markers that distinguish the actual hypotheses. -/

@[expose] public section

open MeasureTheory

namespace AgnosticVC

variable {G : Type*} [AddCommGroup G]

/-- The first layer tests coset membership. The second identifies the parameter. -/
noncomputable def orbitPredict (Γ : AddSubgroup G) (a : G) (z : G × Bool) : Bool := by
  classical
  exact if z.2 then decide (z.1 = a) else decide (z.1 - a ∈ Γ)

@[simp] theorem orbitPredict_false_iff (Γ : AddSubgroup G) (a x : G) :
    orbitPredict Γ a (x, false) = true ↔ x - a ∈ Γ := by
  classical
  simp [orbitPredict]

@[simp] theorem orbitPredict_true_iff (Γ : AddSubgroup G) (a x : G) :
    orbitPredict Γ a (x, true) = true ↔ x = a := by
  classical
  simp [orbitPredict]

/-- The markers make different parameters define different hypotheses. -/
theorem orbitPredict_injective (Γ : AddSubgroup G) : Function.Injective (orbitPredict Γ) := by
  intro a b hab
  have hm : orbitPredict Γ a (a, true) = true := by simp
  rwa [hab, orbitPredict_true_iff] at hm

/-- Two features from the same coset define the same positive parameter set. -/
theorem orbit_coset_mem_iff (Γ : AddSubgroup G) {x y a : G} (hxy : x - y ∈ Γ) :
    x - a ∈ Γ ↔ y - a ∈ Γ := by
  have hyx : y - x ∈ Γ := by simpa only [neg_sub] using Γ.neg_mem hxy
  constructor
  · intro hx
    simpa only [sub_add_sub_cancel] using Γ.add_mem hyx hx
  · intro hy
    simpa only [sub_add_sub_cancel] using Γ.add_mem hxy hy

private theorem orbitPredict_compare_of_common (Γ : AddSubgroup G) (u v : G × Bool) (a : G)
    (hu : orbitPredict Γ a u = true) (hv : orbitPredict Γ a v = true) :
    (∀ b, orbitPredict Γ b u = true → orbitPredict Γ b v = true) ∨
      (∀ b, orbitPredict Γ b v = true → orbitPredict Γ b u = true) := by
  rcases u with ⟨x, tx⟩
  rcases v with ⟨y, ty⟩
  cases tx <;> cases ty
  · simp only [orbitPredict_false_iff] at hu hv ⊢
    have hxy : x - y ∈ Γ := by simpa only [sub_sub_sub_cancel_right] using Γ.sub_mem hu hv
    exact Or.inl fun b => (orbit_coset_mem_iff Γ hxy).mp
  · right
    intro b hb
    rw [orbitPredict_true_iff] at hv hb
    rwa [← hb, hv]
  · left
    intro b hb
    rw [orbitPredict_true_iff] at hu hb
    rwa [← hb, hu]
  · left
    rw [orbitPredict_true_iff] at hu hv
    rw [hu, hv]
    exact fun _ h => h

/-- Positive parameter sets of features are nested or disjoint, ruling out shattering
two distinct features. -/
theorem orbitPredict_vc_le_one (Γ : AddSubgroup G) : HasVCDimensionAtMost (orbitPredict Γ) 1 := by
  classical
  intro S hs
  obtain ⟨a, ha⟩ := hs S (Finset.Subset.refl S)
  apply Finset.card_le_one.mpr
  intro x hx y hy
  by_contra hxy
  rcases orbitPredict_compare_of_common Γ x y a ((ha x hx).mpr hx) ((ha y hy).mpr hy) with h | h
  · obtain ⟨b, hb⟩ := hs {x} (Finset.singleton_subset_iff.mpr hx)
    have hbx := (hb x hx).mpr (Finset.mem_singleton_self x)
    exact hxy (Finset.mem_singleton.mp ((hb y hy).mp (h b hbx))).symm
  · obtain ⟨b, hb⟩ := hs {y} (Finset.singleton_subset_iff.mpr hy)
    have hby := (hb y hy).mpr (Finset.mem_singleton_self y)
    exact hxy (Finset.mem_singleton.mp ((hb x hx).mp (h b hby)))

/-- A singleton marker is shattered as soon as the parameter space has two points. -/
theorem orbitPredict_vc_not_zero [Nontrivial G] (Γ : AddSubgroup G) :
    ¬ HasVCDimensionAtMost (orbitPredict Γ) 0 := by
  classical
  obtain ⟨a, b, hab⟩ := exists_pair_ne G
  intro hzero
  have hcard := hzero {(a, true)} (by
    intro t _
    by_cases ht : (a, true) ∈ t
    · exact ⟨a, by simp [ht]⟩
    · exact ⟨b, by simp [hab, ht]⟩)
  simp at hcard

/-- A countable subgroup and measurable subtraction give jointly measurable evaluation. -/
theorem measurable_orbitPredict [MeasurableSpace G] [MeasurableSub₂ G]
    [MeasurableSingletonClass G] (Γ : AddSubgroup G) [Countable Γ] :
    Measurable (fun p : G × (G × Bool) => orbitPredict Γ p.1 p.2) := by
  have hd : Measurable (fun p : G × (G × Bool) => p.2.1 - p.1) :=
    measurable_snd.fst.sub measurable_fst
  have hm : MeasurableSet {p : G × (G × Bool) | p.2.2 = true} :=
    measurable_snd.snd (measurableSet_singleton true)
  have hc : MeasurableSet {p : G × (G × Bool) | p.2.1 - p.1 ∈ Γ} :=
    hd (Set.to_countable (Γ : Set G)).measurableSet
  have he : MeasurableSet {p : G × (G × Bool) | p.2.1 = p.1} := by
    convert hd (measurableSet_singleton (0 : G)) using 1
    ext p
    simp [sub_eq_zero]
  apply measurable_to_bool
  convert (hm.inter he).union (hm.compl.inter hc) using 1
  ext p
  rcases p with ⟨a, x, t⟩
  cases t <;> simp

/-- One positive observation in the coset layer. -/
def orbitPositiveSample (x : G) : Fin 1 → (G × Bool) × Bool := fun _ => ((x, false), true)

@[simp] theorem ermMistakes_orbitPositiveSample_eq_zero_iff (Γ : AddSubgroup G) (x a : G) :
    ermMistakes (orbitPredict Γ) (orbitPositiveSample x) a = 0 ↔ x - a ∈ Γ := by
  rw [← orbitPredict_false_iff Γ a x]
  by_cases h : orbitPredict Γ a (x, false) = true <;> simp [ermMistakes, orbitPositiveSample, h]

/-- Any ordered ERM on the one-point positive samples returns a representative of
the observed coset, and its return value is constant across that coset. -/
theorem orbitPositiveERM_properties [TraceOrder G] (Γ : AddSubgroup G)
    (learn : (Fin 1 → (G × Bool) × Bool) → G)
    (hmin : ∀ x a, ermMistakes (orbitPredict Γ) (orbitPositiveSample x) (learn (orbitPositiveSample x)) ≤
      ermMistakes (orbitPredict Γ) (orbitPositiveSample x) a)
    (htie : ∀ x a, TraceOrder.rel a (learn (orbitPositiveSample x)) →
      ermMistakes (orbitPredict Γ) (orbitPositiveSample x) (learn (orbitPositiveSample x)) <
        ermMistakes (orbitPredict Γ) (orbitPositiveSample x) a) :
    let f := fun x => learn (orbitPositiveSample x)
    (∀ x, x - f x ∈ Γ) ∧ ∀ ⦃x y⦄, x - y ∈ Γ → f x = f y := by
  let f := fun x => learn (orbitPositiveSample x)
  change (∀ x, x - f x ∈ Γ) ∧ ∀ ⦃x y⦄, x - y ∈ Γ → f x = f y
  have hzero (x : G) : ermMistakes (orbitPredict Γ) (orbitPositiveSample x) (f x) = 0 :=
    Nat.eq_zero_of_le_zero ((hmin x x).trans_eq (by simp))
  have hfit (x : G) : x - f x ∈ Γ := (ermMistakes_orbitPositiveSample_eq_zero_iff Γ x _).mp (hzero x)
  refine ⟨hfit, ?_⟩
  intro x y hxy
  apply Std.Trichotomous.trichotomous (r := TraceOrder.rel (H := G)) (f x) (f y)
  · intro hlt
    have h := htie y (f x) hlt
    change ermMistakes (orbitPredict Γ) (orbitPositiveSample y) (f y) < _ at h
    have hz := (ermMistakes_orbitPositiveSample_eq_zero_iff Γ y (f x)).mpr
      ((orbit_coset_mem_iff Γ hxy).mp (hfit x))
    rw [hzero y, hz] at h
    exact (lt_irrefl _ h)
  · intro hlt
    have h := htie x (f y) hlt
    change ermMistakes (orbitPredict Γ) (orbitPositiveSample x) (f x) < _ at h
    have hz := (ermMistakes_orbitPositiveSample_eq_zero_iff Γ x (f y)).mpr
      ((orbit_coset_mem_iff Γ hxy).mpr (hfit y))
    rw [hzero x, hz] at h
    exact (lt_irrefl _ h)

end AgnosticVC
