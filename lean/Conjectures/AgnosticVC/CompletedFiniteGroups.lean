module

public import Conjectures.AgnosticVC.CompletedDisjointSupports
public import Mathlib.MeasureTheory.Constructions.UnitInterval
public import Mathlib.Probability.Distributions.Uniform

/-! The VC-one completed-iid counterexample with disjoint finite supports. -/

@[expose] public section

open Set MeasureTheory ProbabilityTheory
open scoped BigOperators ENNReal

namespace AgnosticVC

variable {X : Type} {n : ℕ}

/-- A nonzero hypothesis has one positive point per sector. -/
noncomputable def groupPredict (G : Set (Fin n → X)) : (Unit ⊕ G) → (Fin n × X) → Bool := by
  classical
  exact fun h x => h.elim (fun _ => false) (fun g => decide (g.val x.1 = x.2))

@[simp] theorem groupPredict_zero (G : Set (Fin n → X)) (u : Unit) (x : Fin n × X) :
    groupPredict G (.inl u) x = false := rfl

@[simp] theorem groupPredict_inr_true (G : Set (Fin n → X)) (g : G) (x : Fin n × X) :
    groupPredict G (.inr g) x = true ↔ g.val x.1 = x.2 := by
  classical
  simp [groupPredict]

theorem groupPredict_hit_unique {G : Set (Fin n → X)}
    (hG : ∀ i, Set.InjOn (Function.eval i) G) {h k : Unit ⊕ G} {x : Fin n × X}
    (hh : groupPredict G h x = true) (hk : groupPredict G k x = true) : h = k := by
  rcases h with ⟨⟩ | h
  · simp at hh
  rcases k with ⟨⟩ | k
  · simp at hk
  apply congrArg Sum.inr
  apply Subtype.ext
  exact hG x.1 h.property k.property ((groupPredict_inr_true _ _ _).mp hh |>.trans
    ((groupPredict_inr_true _ _ _).mp hk).symm)

theorem injective_groupPredict {G : Set (Fin n → X)} (hn : 0 < n)
    (hG : ∀ i, Set.InjOn (Function.eval i) G) : Function.Injective (groupPredict G) := by
  intro h k he
  rcases h with ⟨⟩ | h
  · rcases k with ⟨⟩ | k
    · rfl
    · let x : Fin n × X := (⟨0,hn⟩,k.val ⟨0,hn⟩)
      have heq := congrFun he x
      have hh : groupPredict G (.inr k) x = true := (groupPredict_inr_true _ _ _).mpr rfl
      rw [groupPredict_zero, hh] at heq
      cases heq
  · let x : Fin n × X := (⟨0,hn⟩,h.val ⟨0,hn⟩)
    have ht : groupPredict G (.inr h) x = true := (groupPredict_inr_true _ _ _).mpr rfl
    exact groupPredict_hit_unique hG ht (by rwa [← he])

theorem vcDimAtMostOne_groupPredict {G : Set (Fin n → X)}
    (hG : ∀ i, Set.InjOn (Function.eval i) G) : HasVCDimensionAtMost (groupPredict G) 1 := by
  classical
  intro S hS
  apply Finset.card_le_one_iff.mpr
  intro a b ha hb
  by_contra hne
  obtain ⟨h,hh⟩ := hS {a,b} (Finset.insert_subset_iff.mpr ⟨ha,Finset.singleton_subset_iff.mpr hb⟩)
  obtain ⟨k,hk⟩ := hS {a} (Finset.singleton_subset_iff.mpr ha)
  have he := groupPredict_hit_unique hG ((hh a ha).mpr (by simp)) ((hk a ha).mpr (by simp))
  have ht := (hh b hb).mpr (by simp)
  have hf : groupPredict G k b ≠ true := fun h => hne ((Finset.mem_singleton.mp ((hk b hb).mp h)).symm)
  exact hf (he ▸ ht)

theorem vcDimNotAtMostZero_groupPredict {G : Set (Fin n → X)} (hn : 0 < n) (hG : G.Nonempty) :
    ¬ HasVCDimensionAtMost (groupPredict G) 0 := by
  classical
  obtain ⟨g,hg⟩ := hG
  let x : Fin n × X := (⟨0,hn⟩,g ⟨0,hn⟩)
  intro hzero
  have hcard := hzero {x} (by
    intro t _
    by_cases ht : x ∈ t
    · refine ⟨.inr ⟨g,hg⟩, ?_⟩
      intro z hz
      obtain rfl := Finset.mem_singleton.mp hz
      simp [ht, x]
    · refine ⟨.inl (), ?_⟩
      intro z hz
      obtain rfl := Finset.mem_singleton.mp hz
      simp [ht])
  simp at hcard

theorem groupPredict_finite_support (G : Set (Fin n → X)) (h : Unit ⊕ G) :
    {x | groupPredict G h x = true}.Finite := by
  rcases h with ⟨⟩ | h
  · simp
  · apply (finite_range fun i : Fin n => (i, h.val i)).subset
    intro x hx
    exact ⟨x.1, Prod.ext rfl ((groupPredict_inr_true _ _ _).mp hx)⟩

theorem groupPredict_countable_sections {G : Set (Fin n → X)} (hG : ∀ i, Set.InjOn (Function.eval i) G)
    (x : Fin n × X) : {y | ∃ h, groupPredict G h x = true ∧ groupPredict G h y = true}.Countable := by
  by_cases he : ∃ h : Unit ⊕ G, groupPredict G h x = true
  · obtain ⟨h,hh⟩ := he
    apply (groupPredict_finite_support G h).countable.mono
    rintro y ⟨k,hkx,hky⟩
    rw [groupPredict_hit_unique hG hh hkx]
    exact hky
  · exact Set.countable_empty.mono fun y ⟨h,hh,_⟩ => (he ⟨h,hh⟩).elim

theorem measurable_groupPredict [MeasurableSpace X] [MeasurableEq X] (G : Set (Fin n → X)) :
    Measurable (fun p : (Fin n × X) × (Unit ⊕ G) => groupPredict G p.2 p.1) := by
  classical
  apply (MeasurableEquiv.prodSumDistrib (Fin n × X) Unit G).symm.measurable_comp_iff.mp
  apply measurable_fun_sum
  · exact measurable_const
  · have hvalue : Measurable (fun p : Fin n × G => p.2.val p.1) :=
      measurable_from_prod_countable_right fun i => (measurable_pi_apply i).comp measurable_subtype_coe
    have hf : Measurable (fun p : (Fin n × X) × G => p.2.val p.1.1) :=
      hvalue.comp ((measurable_fst.comp measurable_fst).prodMk measurable_snd)
    have he : MeasurableSet {p : (Fin n × X) × G | p.2.val p.1.1 = p.1.2} :=
      measurableSet_eq_fun hf (measurable_snd.comp measurable_fst)
    have hite : Measurable (fun p : (Fin n × X) × G => if p.2.val p.1.1 = p.1.2 then true else false) :=
      Measurable.ite he measurable_const measurable_const
    convert hite using 1
    funext p
    change decide (p.2.val p.1.1 = p.1.2) = _
    split <;> simp_all

/-- Equal probability on sectors, with an independent nonatomic value. -/
noncomputable def sectorLaw [MeasurableSpace X] (n : ℕ) (D : Measure X) : Measure (Fin n × X) :=
  (Measure.uniformOfFinset Finset.univ).prod D

theorem sectorLaw_probability [MeasurableSpace X] {D : Measure X} [IsProbabilityMeasure D]
    (hn : 0 < n) : IsProbabilityMeasure (sectorLaw n D) := by
  classical
  constructor
  rw [← Set.univ_prod_univ, sectorLaw, Measure.prod_prod, show D univ = 1 from measure_univ, mul_one,
    Measure.uniformOfFinset_apply]
  simp [ENNReal.div_self, hn.ne']

theorem sectorLaw_nullSingleton [MeasurableSpace X] {D : Measure X} [NullSingletonClass D] :
    NullSingletonClass (sectorLaw n D) := by unfold sectorLaw; infer_instance

private theorem positive_tagged_matching [MeasurableSpace X] [StandardBorelSpace X]
    {D : Measure X} [IsProbabilityMeasure D] (hn : 0 < n)
    (G : Set (Fin n → X)) (hG : (Measure.pi fun _ : Fin n => D) G = 1) :
    (Measure.pi fun _ : Fin n => sectorLaw n D) ((fun x : Fin n → X => fun i => (i,x i)) '' G) ≠ 0 := by
  classical
  let attach (x : Fin n → X) (i : Fin n) : Fin n × X := (i,x i)
  let tags := Measure.uniformOfFinset (Finset.univ : Finset (Fin n))
  let D' := sectorLaw n D
  let μ := Measure.pi fun _ : Fin n => D'
  let ν := Measure.pi fun _ : Fin n => D
  let c : ℝ≥0∞ := (n : ℝ≥0∞)⁻¹
  let box (i : Fin n) : Set (Fin n × X) := {i} ×ˢ univ
  have hbox (i : Fin n) : MeasurableSet (box i) := (measurableSet_singleton i).prod .univ
  let fs (i : Fin n) (x : X) : Fin n × X := (i,x)
  have hf (i : Fin n) : Measurable (fs i) := measurable_const.prodMk measurable_id
  have ht (i : Fin n) : tags {i} = c := by simp [tags, c]
  have hsec (i : Fin n) : D'.restrict (box i) = c • D.map (fs i) := by
    change (tags.prod D).restrict ({i} ×ˢ univ) = _
    rw [← Measure.restrict_prod_eq_prod_univ, Measure.restrict_singleton, Measure.prod_smul_left,
      Measure.dirac_prod, ht]
  have hc : c ≠ 0 := by simp [c]
  have hct : c ≠ ⊤ := by simp [c, hn.ne']
  let : IsProbabilityMeasure D' := sectorLaw_probability hn
  let ρ (i : Fin n) := D.map (fs i)
  have (i : Fin n) : IsProbabilityMeasure (ρ i) := (Measure.isProbabilityMeasure_map_iff (hf i).aemeasurable).2 inferInstance
  have (i : Fin n) : IsFiniteMeasure (c • ρ i) := ⟨by
    rw [Measure.smul_apply, measure_univ, smul_eq_mul, mul_one]
    exact lt_top_iff_ne_top.mpr hct⟩
  have hpi : μ.restrict (univ.pi box) = (c ^ n) • ν.map attach := by
    rw [Measure.restrict_pi_pi (fun _ : Fin n => D') box,
      Measure.pi_map_pi (fun i => (hf i).aemeasurable)]
    simp only [hsec]
    change Measure.pi (fun i => c • ρ i) = (c ^ n) • Measure.pi ρ
    refine Measure.pi_eq (μ := fun i => c • ρ i) fun s _ => ?_
    rw [Measure.smul_apply, Measure.pi_pi]
    simp [Measure.smul_apply, smul_eq_mul, Finset.prod_mul_distrib]
  have hm : Measurable attach := Measurable.of_eval fun i => measurable_const.prodMk (measurable_pi_apply i)
  have hinj : Function.Injective attach := by
    intro x y h
    funext i
    exact congrArg Prod.snd (congrFun h i)
  have hemb := hm.measurableEmbedding hinj
  let T := attach '' G
  have hsub : T ⊆ univ.pi box := by
    rintro _ ⟨x,hx,rfl⟩
    simp [attach, box]
  change μ T ≠ 0
  rw [← inter_eq_left.mpr hsub, ← Measure.restrict_apply' (.univ_pi hbox), hpi,
    Measure.smul_apply, hemb.map_apply, preimage_image_eq _ hinj, hG]
  simpa using pow_ne_zero n hc

/-- For every positive sample size, a VC-one class of disjoint finite supports
forces large empirical excess for any proper kernel on its completed iid law. -/
theorem exists_completed_finiteGroup_example (n : ℕ) :
    let X := Fin (n + 1) × unitInterval
    let D := sectorLaw (n + 1) (volume : Measure unitInterval)
    ∃ G : Set (Fin (n + 1) → unitInterval),
      let predict := groupPredict G
      Function.Injective predict ∧
      Measurable (fun p : X × (Unit ⊕ G) => predict p.2 p.1) ∧
      HasVCDimensionAtMost predict 1 ∧ ¬ HasVCDimensionAtMost predict 0 ∧
      (∀ h, {x : X | predict h x = true}.Finite) ∧
      (∀ (K : Kernel (NullMeasurableSpace (Fin (n + 1) → X) (Measure.pi fun _ : Fin (n + 1) => D))
          (Unit ⊕ G)) [IsMarkovKernel K],
        ∃ s : Fin (n + 1) → X,
          1 - 1 / (n + 1 : ℝ) ≤ (∫ h, empiricalError predict (positiveLabels s) h ∂K s) ∧
          ∃ h, empiricalError predict (positiveLabels s) h = 0) := by
  intro X D
  obtain ⟨G,hG,hi⟩ := exists_fullOuter_coordinateMatching (volume : Measure unitInterval) (n + 1)
  have hne : G.Nonempty := nonempty_iff_ne_empty.mpr (by
    intro h
    rw [h, measure_empty] at hG
    exact zero_ne_one hG)
  refine ⟨G, injective_groupPredict (Nat.succ_pos n) hi, measurable_groupPredict G,
    vcDimAtMostOne_groupPredict hi, vcDimNotAtMostZero_groupPredict (Nat.succ_pos n) hne,
    groupPredict_finite_support G, ?_⟩
  intro K _
  let : IsProbabilityMeasure D := sectorLaw_probability (Nat.succ_pos n)
  let : NullSingletonClass D := sectorLaw_nullSingleton
  let attach (x : Fin (n + 1) → unitInterval) (i : Fin (n + 1)) : X := (i, x i)
  refine exists_atMostOneHit_completed_kernel D (groupPredict G) (measurable_groupPredict G)
    (groupPredict_countable_sections hi) (attach '' G) (positive_tagged_matching (Nat.succ_pos n) G hG) ?_ K
  rintro _ ⟨x,hx,rfl⟩
  exact ⟨.inr ⟨x,hx⟩, fun i => (groupPredict_inr_true _ _ _).mpr rfl⟩

private theorem positiveLabels_measurePreserving {Y : Type*} [MeasurableSpace Y]
    (D : Measure Y) [IsProbabilityMeasure D] (m : ℕ) :
    MeasurePreserving (positiveLabels (n := m))
      (Measure.pi fun _ : Fin m => D) (Measure.pi fun _ : Fin m => D.map (fun y => (y,true))) := by
  have hlabel : MeasurePreserving (fun y : Y => (y,true)) D (D.map (fun y => (y,true))) :=
    ⟨measurable_id.prodMk measurable_const,rfl⟩
  exact measurePreserving_pi _ _ (fun _ => hlabel)

private theorem measurable_positiveLabels_completed {Y : Type*} [MeasurableSpace Y]
    (D : Measure Y) [IsProbabilityMeasure D] (m : ℕ) :
    Measurable (α := NullMeasurableSpace (Fin m → Y) (Measure.pi fun _ : Fin m => D))
      (β := NullMeasurableSpace (Fin m → Y × Bool)
        (Measure.pi fun _ : Fin m => D.map (fun y => (y,true)))) positiveLabels := by
  intro _ hs
  exact NullMeasurableSet.preimage hs (positiveLabels_measurePreserving D m).quasiMeasurePreserving

private theorem exists_finiteGroups_rate_failure (c : ℝ) :
    ∃ n : ℕ, c * Real.sqrt (1 / ((n + 1 : ℕ) : ℝ)) < 1 - 1 / ((n + 1 : ℕ) : ℝ) := by
  obtain ⟨n,hn⟩ := exists_nat_gt (4*c^2 + 2)
  let m : ℝ := ((n + 1 : ℕ) : ℝ)
  have hm : 2 < m := by dsimp [m]; push_cast; nlinarith [sq_nonneg c]
  have hc : 4*c^2 < m := by dsimp [m]; push_cast; linarith
  have hmr : 0 < m := by linarith
  have hsqrt : 2*c < Real.sqrt m := by
    by_contra! h
    have hs := pow_le_pow_left₀ (Real.sqrt_nonneg m) h 2
    rw [Real.sq_sqrt hmr.le] at hs
    nlinarith
  refine ⟨n, ?_⟩
  change c * Real.sqrt (1 / m) < 1 - 1 / m
  rw [Real.sqrt_div (by norm_num), Real.sqrt_one, mul_one_div]
  have hleft : c / Real.sqrt m < 1/2 := (div_lt_iff₀ (Real.sqrt_pos.mpr hmr)).mpr (by linarith)
  have hright : 1 / m < 1/2 := (div_lt_iff₀ hmr).mpr (by linarith)
  linarith

/-- For every candidate universal constant, one jointly measurable VC-one
class of disjoint finite supports defeats the empirical accuracy requirement
of Conjecture 6 on the completion of a single iid labeled law. -/
theorem exists_completed_finiteGroups_no_rate (c : ℝ) :
    ∃ n : ℕ, let X := Fin (n + 1) × unitInterval
      let D := sectorLaw (n + 1) (volume : Measure unitInterval)
      let labeled := D.map (fun x => (x,true))
      ∃ G : Set (Fin (n + 1) → unitInterval),
        let predict := groupPredict G
        IsProbabilityMeasure labeled ∧ Function.Injective predict ∧
        Measurable (fun p : X × (Unit ⊕ G) => predict p.2 p.1) ∧
        HasVCDimensionAtMost predict 1 ∧ ¬ HasVCDimensionAtMost predict 0 ∧
        (∀ h, {x : X | predict h x = true}.Finite) ∧
        (∀ (K : Kernel (NullMeasurableSpace (Fin (n + 1) → X × Bool)
            (Measure.pi fun _ : Fin (n + 1) => labeled)) (Unit ⊕ G)) [IsMarkovKernel K],
          ¬ ∀ z, (∫ h, empiricalError predict z h ∂K z) ≤
            (⨅ h, empiricalError predict z h) + c * Real.sqrt (1 / ((n + 1 : ℕ) : ℝ))) := by
  obtain ⟨n,hrate⟩ := exists_finiteGroups_rate_failure c
  refine ⟨n, ?_⟩
  let X := Fin (n + 1) × unitInterval
  let D := sectorLaw (n + 1) (volume : Measure unitInterval)
  let : IsProbabilityMeasure D := sectorLaw_probability (Nat.succ_pos n)
  have hlabeled : IsProbabilityMeasure (D.map (fun x : X => (x,true))) :=
    (Measure.isProbabilityMeasure_map_iff (measurable_id.prodMk measurable_const).aemeasurable).2 inferInstance
  obtain ⟨G,hi,hmeas,hvc,hvc0,hfinite,hfail⟩ := exists_completed_finiteGroup_example n
  refine ⟨G,hlabeled,hi,hmeas,hvc,hvc0,hfinite,?_⟩
  intro K hK hacc
  let L := K.comap positiveLabels (measurable_positiveLabels_completed D (n + 1))
  have hL : IsMarkovKernel L := ⟨fun s => hK.isProbabilityMeasure (positiveLabels s)⟩
  obtain ⟨s,hs,h,hfit⟩ := @hfail L hL
  let z := positiveLabels s
  have hbelow : BddBelow (range (empiricalError (groupPredict G) z)) := by
    refine ⟨0,?_⟩
    rintro _ ⟨k,rfl⟩
    rw [empiricalError_eq_zeroOne]
    positivity
  have hmin := ciInf_le hbelow h
  change empiricalError (groupPredict G) z h = 0 at hfit
  rw [hfit] at hmin
  have hbound := hacc z
  change 1 - 1 / (n + 1 : ℝ) ≤ (∫ h, empiricalError (groupPredict G) z h ∂K z) at hs
  push_cast at hrate hbound
  linarith only [hs,hrate,hbound,hmin]

/-- For every candidate constant, the empirical excess rate is impossible for
an almost-everywhere measurable real-valued expected loss. The lower inequality
is automatic for any random proper output. The statement puts no measurability
condition on the output map or on the choice of hypothesis sigma-algebra. -/
theorem exists_finiteGroups_no_measurable_loss_rate (c : ℝ) :
    ∃ n : ℕ, let X := Fin (n + 1) × unitInterval
      let D := sectorLaw (n + 1) (volume : Measure unitInterval)
      let labeled := D.map (fun x => (x,true))
      ∃ G : Set (Fin (n + 1) → unitInterval),
        let predict := groupPredict G
        IsProbabilityMeasure labeled ∧ Function.Injective predict ∧
        Measurable (fun p : X × (Unit ⊕ G) => predict p.2 p.1) ∧
        HasVCDimensionAtMost predict 1 ∧ ¬ HasVCDimensionAtMost predict 0 ∧
        (∀ h, {x : X | predict h x = true}.Finite) ∧
        ¬ ∃ r : (Fin (n + 1) → X × Bool) → ℝ,
          AEMeasurable r (Measure.pi fun _ : Fin (n + 1) => labeled) ∧
          ∀ z, let opt := ⨅ h, empiricalError predict z h
            opt ≤ r z ∧ r z ≤ opt + c * Real.sqrt (1 / ((n + 1 : ℕ) : ℝ)) := by
  obtain ⟨n,hrate⟩ := exists_finiteGroups_rate_failure c
  refine ⟨n, ?_⟩
  let X := Fin (n + 1) × unitInterval
  let D := sectorLaw (n + 1) (volume : Measure unitInterval)
  let : IsProbabilityMeasure D := sectorLaw_probability (Nat.succ_pos n)
  let : NullSingletonClass D := sectorLaw_nullSingleton
  have hlabeled : IsProbabilityMeasure (D.map (fun x : X => (x,true))) :=
    (Measure.isProbabilityMeasure_map_iff (measurable_id.prodMk measurable_const).aemeasurable).2
      inferInstance
  obtain ⟨G,hG,hi⟩ := exists_fullOuter_coordinateMatching (volume : Measure unitInterval) (n + 1)
  have hne : G.Nonempty := nonempty_iff_ne_empty.mpr (by
    intro h
    rw [h, measure_empty] at hG
    exact zero_ne_one hG)
  refine ⟨G, hlabeled, injective_groupPredict (Nat.succ_pos n) hi, measurable_groupPredict G,
    vcDimAtMostOne_groupPredict hi, vcDimNotAtMostZero_groupPredict (Nat.succ_pos n) hne,
    groupPredict_finite_support G, ?_⟩
  rintro ⟨r,hr,hbound⟩
  let attach (x : Fin (n + 1) → unitInterval) (i : Fin (n + 1)) : X := (i, x i)
  have hfit : ∀ s ∈ attach '' G, ∃ h : Unit ⊕ G, ∀ i, groupPredict G h (s i) = true := by
    rintro _ ⟨x,hx,rfl⟩
    exact ⟨.inr ⟨x,hx⟩, fun i => (groupPredict_inr_true _ _ _).mpr rfl⟩
  have hlabel := positiveLabels_measurePreserving D (n + 1)
  have hr' : AEMeasurable (fun s => r (positiveLabels s)) (Measure.pi fun _ : Fin (n + 1) => D) := by
    rw [← hlabel.map_eq] at hr
    exact hr.comp_measurable hlabel.measurable
  obtain ⟨s,hs,h,hh⟩ := exists_bad_sample_of_aemeasurable_empirical_loss D (groupPredict G)
    (groupPredict_countable_sections hi) (attach '' G)
    (positive_tagged_matching (Nat.succ_pos n) G hG) hfit _ hr'
    (fun s a ha => (le_ciInf ha).trans (hbound (positiveLabels s)).1)
  let z := positiveLabels s
  have hbelow : BddBelow (range (empiricalError (groupPredict G) z)) := by
    refine ⟨0,?_⟩
    rintro _ ⟨k,rfl⟩
    rw [empiricalError_eq_zeroOne]
    positivity
  have hmin := ciInf_le hbelow h
  change empiricalError (groupPredict G) z h = 0 at hh
  rw [hh] at hmin
  have hacc := (hbound z).2
  change 1 - 1 / (n + 1 : ℝ) ≤ r z at hs
  push_cast at hrate hacc
  linarith only [hs,hrate,hacc,hmin]

universe u

/-- Under the ordinary iid experiment with independent private randomness,
measurable realized empirical loss already rules out the all-sample rate. No
measurability condition is imposed on the learner's hypothesis-valued map. -/
theorem exists_finiteGroups_no_jointly_measurable_loss_learner (c : ℝ) :
    ∃ n : ℕ, let X := Fin (n + 1) × unitInterval
      let D := sectorLaw (n + 1) (volume : Measure unitInterval)
      let labeled := D.map (fun x => (x,true))
      ∃ G : Set (Fin (n + 1) → unitInterval),
        let predict := groupPredict G
        let μ := Measure.pi fun _ : Fin (n + 1) => labeled
        IsProbabilityMeasure labeled ∧ Function.Injective predict ∧
        Measurable (fun p : X × (Unit ⊕ G) => predict p.2 p.1) ∧
        HasVCDimensionAtMost predict 1 ∧ ¬ HasVCDimensionAtMost predict 0 ∧
        (∀ h, {x : X | predict h x = true}.Finite) ∧
        ∀ (Ω : Type u) [MeasurableSpace Ω] (ν : Measure Ω) [IsProbabilityMeasure ν]
          (A : (Fin (n + 1) → X × Bool) → Ω → Unit ⊕ G),
          AEMeasurable (fun p : (Fin (n + 1) → X × Bool) × Ω =>
            empiricalError predict p.1 (A p.1 p.2)) (μ.prod ν) →
          (∀ z, AEMeasurable (fun ω => empiricalError predict z (A z ω)) ν) →
          ¬ ∀ z, (∫ ω, empiricalError predict z (A z ω) ∂ν) ≤
            (⨅ h, empiricalError predict z h) + c * Real.sqrt (1 / ((n + 1 : ℕ) : ℝ)) := by
  obtain ⟨n,G,hD,hinj,hmeas,hvc,hvc0,hfinite,hfail⟩ := exists_finiteGroups_no_measurable_loss_rate c
  refine ⟨n,G,hD,hinj,hmeas,hvc,hvc0,hfinite,?_⟩
  intro Ω _ ν _ A hJoint hSections hacc
  let X := Fin (n + 1) × unitInterval
  let predict := groupPredict G
  let r (z : Fin (n + 1) → X × Bool) := ∫ ω, empiricalError predict z (A z ω) ∂ν
  refine hfail ⟨r, hJoint.aestronglyMeasurable.integral_prod_right'.aemeasurable, ?_⟩
  intro z
  refine ⟨?_,hacc z⟩
  have hnon (h : Unit ⊕ G) : 0 ≤ empiricalError predict z h := by
    rw [empiricalError_eq_zeroOne]
    positivity
  have hbounded (h : Unit ⊕ G) : empiricalError predict z h ≤ 1 := by
    rw [empiricalError_eq_zeroOne, div_le_iff₀ (Nat.cast_pos.mpr (Nat.succ_pos n)), one_mul]
    calc
      _ ≤ ∑ _ : Fin (n + 1), (1 : ℝ) := Finset.sum_le_sum fun i _ => by split <;> norm_num
      _ = _ := by simp
  have hBelow : BddBelow (range (empiricalError predict z)) := ⟨0,fun _ ⟨h,hh⟩ => hh ▸ hnon h⟩
  have hi : Integrable (fun ω => empiricalError predict z (A z ω)) ν :=
    Integrable.of_bound (hSections z).aestronglyMeasurable 1 (Filter.Eventually.of_forall fun ω =>
      (Real.norm_of_nonneg (hnon (A z ω))).trans_le (hbounded (A z ω)))
  simpa [r] using integral_mono (integrable_const (μ := ν) (⨅ h, empiricalError predict z h)) hi
    (fun ω => ciInf_le hBelow (A z ω))

end AgnosticVC
