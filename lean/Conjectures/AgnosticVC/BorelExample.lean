module

public import Conjectures.AgnosticVC.NonBorelRange
public import Conjectures.AgnosticVC.Obstruction
public import Conjectures.AgnosticVC.Traces
public import Mathlib.MeasureTheory.MeasurableSpace.Embedding

/-! A two-copy VC-one class whose jointly measurable evaluation has a nonmeasurable
positive locus. The second copy gives each nonzero hypothesis a unique positive point. -/

@[expose] public section

open MeasureTheory ProbabilityTheory TopologicalSpace

namespace AgnosticVC

variable {X U : Type*}

/-- The zero hypothesis is named by `Sum.inl ()`. Each `Sum.inr u` labels exactly the
two points `Sum.inl (f u)` and `Sum.inr u` positive. -/
noncomputable def borelPairPredict (f : U → X) : (Unit ⊕ U) → (X ⊕ U) → Bool := by
  classical
  exact fun h x => match h, x with
    | .inl _, _ => false
    | .inr u, .inl x => if f u = x then true else false
    | .inr u, .inr v => if u = v then true else false

@[simp] theorem borelPairPredict_zero (f : U → X) (a : Unit) (x : X ⊕ U) :
    borelPairPredict f (.inl a) x = false := by
  cases x <;> rfl

@[simp] theorem borelPairPredict_inl_true (f : U → X) (u : U) (x : X) :
    borelPairPredict f (.inr u) (.inl x) = true ↔ f u = x := by
  classical
  simp [borelPairPredict]

@[simp] theorem borelPairPredict_inr_true (f : U → X) (h : Unit ⊕ U) (u : U) :
    borelPairPredict f h (.inr u) = true ↔ h = .inr u := by
  classical
  rcases h with _ | v <;> simp [borelPairPredict]

theorem injective_borelPairPredict (f : U → X) : Function.Injective (borelPairPredict f) := by
  intro h g heq
  rcases h with a | u
  · rcases g with b | v
    · exact congrArg Sum.inl (Subsingleton.elim a b)
    · exact (borelPairPredict_inr_true f _ v).mp
        (heq.symm ▸ (borelPairPredict_inr_true f (.inr v) v).mpr rfl)
  · exact ((borelPairPredict_inr_true f g u).mp
      (heq ▸ (borelPairPredict_inr_true f (.inr u) u).mpr rfl)).symm

theorem hasVCDimensionAtMost_borelPairPredict (f : U → X) :
    HasVCDimensionAtMost (borelPairPredict f) 1 := by
  classical
  intro S hS
  have both (x y : X ⊕ U) (hx : x ∈ S) (hy : y ∈ S) :
      ∃ h, borelPairPredict f h x = true ∧ borelPairPredict f h y = true := by
    obtain ⟨h, hh⟩ := hS {x, y}
      (Finset.insert_subset_iff.mpr ⟨hx, Finset.singleton_subset_iff.mpr hy⟩)
    exact ⟨h, (hh x hx).mpr (by simp), (hh y hy).mpr (by simp)⟩
  have mixed (x : X) (u : U) (hx : Sum.inl x ∈ S) (hu : Sum.inr u ∈ S) : False := by
    obtain ⟨h, hhx, hhu⟩ := both (.inl x) (.inr u) hx hu
    obtain ⟨g, hg⟩ := hS {Sum.inr u} (Finset.singleton_subset_iff.mpr hu)
    have hh := (borelPairPredict_inr_true f h u).mp hhu
    have he := (borelPairPredict_inr_true f g u).mp ((hg _ hu).mpr (by simp))
    have hnot : ¬ borelPairPredict f g (.inl x) = true := fun hp => by
      simpa using (hg _ hx).mp hp
    exact hnot ((hh.trans he.symm) ▸ hhx)
  apply Finset.card_le_one_iff.mpr
  intro a b ha hb
  rcases a with x | u <;> rcases b with y | v
  · obtain ⟨h, hax, hby⟩ := both _ _ ha hb
    rcases h with _ | w
    · simp at hax
    · exact congrArg Sum.inl (((borelPairPredict_inl_true f w x).mp hax).symm.trans
        ((borelPairPredict_inl_true f w y).mp hby))
  · exact (mixed x v ha hb).elim
  · exact (mixed y u hb ha).elim
  · obtain ⟨h, hau, hbv⟩ := both _ _ ha hb
    exact congrArg Sum.inr (Sum.inr.inj
      (((borelPairPredict_inr_true f h u).mp hau).symm.trans
        ((borelPairPredict_inr_true f h v).mp hbv)))

theorem not_hasVCDimensionAtMost_zero_borelPairPredict [Nonempty U] (f : U → X) :
    ¬ HasVCDimensionAtMost (borelPairPredict f) 0 := by
  classical
  obtain ⟨u⟩ := ‹Nonempty U›
  let x : X ⊕ U := .inr u
  intro hzero
  have hcard := hzero {x} (by
    intro t _
    by_cases ht : x ∈ t
    · refine ⟨.inr u, ?_⟩
      intro z hz
      obtain rfl := Finset.mem_singleton.mp hz
      simp [x, ht]
    · refine ⟨.inl (), ?_⟩
      intro z hz
      obtain rfl := Finset.mem_singleton.mp hz
      simp [ht])
  simp at hcard

theorem inl_preimage_borelPair_positive (f : U → X) :
    Sum.inl ⁻¹' {x : X ⊕ U | ∃ h, borelPairPredict f h x = true} = Set.range f := by
  ext x
  change (∃ h, borelPairPredict f h (.inl x) = true) ↔ ∃ u, f u = x
  constructor
  · rintro ⟨_ | u, hh⟩
    · simp at hh
    · exact ⟨u, (borelPairPredict_inl_true f u x).mp hh⟩
  · rintro ⟨u, hu⟩
    exact ⟨.inr u, (borelPairPredict_inl_true f u x).mpr hu⟩

variable [MeasurableSpace X] [MeasurableSpace U]

theorem measurableSet_range_of_borelPair_positive (f : U → X)
    (h : MeasurableSet {x | ∃ g, borelPairPredict f g x = true}) :
    MeasurableSet (Set.range f) := by
  rw [← inl_preimage_borelPair_positive f]
  exact h.preimage measurable_inl

/-- Evaluation is jointly measurable on the product of the example and hypothesis spaces. -/
theorem measurable_borelPairPredict [MeasurableEq X] [MeasurableEq U]
    (f : U → X) (hf : Measurable f) :
    Measurable (fun p : (X ⊕ U) × (Unit ⊕ U) => borelPairPredict f p.2 p.1) := by
  classical
  apply (MeasurableEquiv.sumProdSum X U Unit U).symm.measurable_comp_iff.mp
  apply measurable_fun_sum <;> apply measurable_fun_sum
  · exact measurable_const
  · change Measurable (fun p : X × U => if f p.2 = p.1 then true else false)
    exact Measurable.ite (measurableSet_eq_fun (hf.comp measurable_snd) measurable_fst)
      measurable_const measurable_const
  · exact measurable_const
  · change Measurable (fun p : U × U => if p.2 = p.1 then true else false)
    exact Measurable.ite (measurableSet_eq_fun measurable_snd measurable_fst)
      measurable_const measurable_const

/-- A finite disjoint union retains the standard Borel structures of its two summands. -/
theorem standardBorelSpace_sum [StandardBorelSpace X] [StandardBorelSpace U] :
    StandardBorelSpace (X ⊕ U) := by
  let := upgradeStandardBorel X
  let := upgradeStandardBorel U
  let _ : BorelSpace (X ⊕ U) := ⟨by
    apply le_antisymm
    · intro s hs
      obtain ⟨hl, hr⟩ := measurableSet_sum_iff.mp hs
      let _ : MeasurableSpace (X ⊕ U) := borel (X ⊕ U)
      let _ : BorelSpace (X ⊕ U) := ⟨rfl⟩
      have hinl : MeasurableEmbedding (Sum.inl : X → X ⊕ U) :=
        Topology.IsOpenEmbedding.inl.measurableEmbedding
      have hinr : MeasurableEmbedding (Sum.inr : U → X ⊕ U) :=
        Topology.IsOpenEmbedding.inr.measurableEmbedding
      simpa [Set.image_preimage_eq_inter_range, ← Set.inter_union_distrib_left,
        Set.range_inl_union_range_inr] using
        (hinl.measurableSet_image.mpr hl).union (hinr.measurableSet_image.mpr hr)
    · intro s hs
      apply measurableSet_sum_iff.mpr
      let _ : MeasurableSpace (X ⊕ U) := borel (X ⊕ U)
      let _ : BorelSpace (X ⊕ U) := ⟨rfl⟩
      exact ⟨continuous_inl.measurable hs, continuous_inr.measurable hs⟩⟩
  infer_instance

/-- A nonmeasurable range rules out uniform empirical excess below one for this proper class. -/
theorem borelPair_no_accurateKernel [MeasurableEq X] [MeasurableEq U] (f : U → X)
    (hf : Measurable f) (hrange : ¬ MeasurableSet (Set.range f)) {n : ℕ} (hn : 0 < n)
    (K : Kernel (Fin n → (X ⊕ U) × Bool) (Unit ⊕ U)) [IsMarkovKernel K]
    {ε : ℝ} (hε : ε < 1) :
    ¬ ∀ z, (∫ h, empiricalError (borelPairPredict f) z h ∂K z) ≤
      (⨅ h, empiricalError (borelPairPredict f) z h) + ε := by
  intro hacc
  exact hrange (measurableSet_range_of_borelPair_positive f
    (measurableSet_exists_predict_true_of_kernel hn _ (measurable_borelPairPredict f hf) K hε hacc))

/-- Any constant in the VC-one empirical rate is ruled out at sample sizes above its square. -/
theorem borelPair_no_accurateKernel_rate [MeasurableEq X] [MeasurableEq U] (f : U → X)
    (hf : Measurable f) (hrange : ¬ MeasurableSet (Set.range f)) {n : ℕ}
    (K : Kernel (Fin n → (X ⊕ U) × Bool) (Unit ⊕ U)) [IsMarkovKernel K]
    {c : ℝ} (hnc : c ^ 2 < (n : ℝ)) :
    ¬ ∀ z, (∫ h, empiricalError (borelPairPredict f) z h ∂K z) ≤
      (⨅ h, empiricalError (borelPairPredict f) z h) + c * Real.sqrt (1 / (n : ℝ)) := by
  intro hacc
  exact hrange (measurableSet_range_of_borelPair_positive f
    (measurableSet_exists_predict_true_of_kernel_rate _ (measurable_borelPairPredict f hf) K hnc hacc))

/-- A concrete standard Borel class of VC dimension one admits no proper Markov kernel
with uniform empirical excess below one, at any positive sample size. Its hypothesis space
indexes distinct functions and its evaluation map is jointly measurable. -/
theorem exists_standardBorel_vcOne_no_accurateKernel :
    let Baire := ℕ → ℕ
    StandardBorelSpace (Baire ⊕ Baire) ∧ StandardBorelSpace (Unit ⊕ Baire) ∧
    ∃ f : Baire → Baire, Continuous f ∧ ¬ MeasurableSet (Set.range f) ∧
      let predict := borelPairPredict f
      Function.Injective predict ∧
      Measurable (fun p : (Baire ⊕ Baire) × (Unit ⊕ Baire) => predict p.2 p.1) ∧
      HasVCDimensionAtMost predict 1 ∧ ¬ HasVCDimensionAtMost predict 0 ∧
      (∀ {n : ℕ}, 0 < n → ∀ (K : Kernel (Fin n → (Baire ⊕ Baire) × Bool) (Unit ⊕ Baire))
        [IsMarkovKernel K] {ε : ℝ}, ε < 1 →
        ¬ ∀ z, (∫ h, empiricalError predict z h ∂K z) ≤ (⨅ h, empiricalError predict z h) + ε) := by
  obtain ⟨f, hf, hrange⟩ := exists_continuous_nat_nat_nonmeasurable_range
  refine ⟨standardBorelSpace_sum, standardBorelSpace_sum, f, hf, hrange,
    injective_borelPairPredict f, measurable_borelPairPredict f hf.measurable,
    hasVCDimensionAtMost_borelPairPredict f, not_hasVCDimensionAtMost_zero_borelPairPredict f,
    ?_⟩
  intro n hn K _ ε hε
  exact borelPair_no_accurateKernel f hf.measurable hrange hn K hε

end AgnosticVC
