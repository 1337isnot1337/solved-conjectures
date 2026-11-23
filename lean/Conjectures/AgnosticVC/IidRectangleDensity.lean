module

public import Mathlib.MeasureTheory.Measure.MeasuredSets
public import Mathlib.MeasureTheory.Measure.Real
public import Mathlib.MeasureTheory.Constructions.Pi
public import Mathlib.MeasureTheory.MeasurableSpace.CountablyGenerated
public import Mathlib.Probability.Independence.Basic
public import Mathlib.Probability.ProbabilityMassFunction.Constructions
public import Mathlib.Analysis.Complex.Exponential

/-! Finite product partitions approximate arbitrary measurable events.
This supplies the positive-density rectangle in the sharp-VC argument. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory Set MeasurableSpace
open scoped BigOperators ENNReal symmDiff

/-- Projection onto an injectively chosen set of coordinates preserves their
independent product law, even when the coordinate marginals differ. -/
theorem measurePreserving_product_subtuple {I K Z : Type*} [Fintype I] [Fintype K]
    [MeasurableSpace Z] (D : I → Measure Z) [∀ i, IsProbabilityMeasure (D i)]
    (e : K → I) (he : Function.Injective e) :
    MeasurePreserving (fun z : I → Z => z ∘ e) (Measure.pi D) (Measure.pi fun k => D (e k)) := by
  have hi : ProbabilityTheory.iIndepFun (fun i (z : I → Z) => z i) (Measure.pi D) :=
    ProbabilityTheory.iIndepFun_pi (X := fun _ : I => id) (fun _ => aemeasurable_id)
  have h := (hi.precomp he).map_fun_eq_pi_map (fun k => (measurable_pi_apply (e k)).aemeasurable)
  refine ⟨Measurable.of_eval (fun k => measurable_pi_apply (e k)), ?_⟩
  simpa only [Function.comp_def, (measurePreserving_eval D _).map_eq] using h

/-- The marginal feature law obtained by first drawing a finite index. -/
noncomputable def probabilityMixture {I X : Type*} [MeasurableSpace X]
    (w : PMF I) (N : I → Measure X) : Measure X :=
  Measure.sum fun i => w i • N i

theorem probabilityMixture_probability {I X : Type*} [MeasurableSpace X]
    (w : PMF I) (N : I → Measure X) [∀ i, IsProbabilityMeasure (N i)] :
    IsProbabilityMeasure (probabilityMixture w N) := by
  constructor
  rw [probabilityMixture, Measure.sum_apply _ MeasurableSet.univ]
  simpa only [Measure.smul_apply, smul_eq_mul, measure_univ, mul_one] using w.tsum_coe

/-- A sample from the mixture has the law of independent latent indices
followed by independent draws at their respective coordinate laws. -/
theorem pi_probabilityMixture {I R X : Type*} [Fintype I] [Fintype R] [MeasurableSpace X]
    (w : PMF I) (N : I → Measure X) [∀ i, IsProbabilityMeasure (N i)] :
    Measure.pi (fun _ : R => probabilityMixture w N) =
      Measure.sum fun p : R → I => (∏ j, w (p j)) • Measure.pi (N ∘ p) := by
  classical
  let : IsProbabilityMeasure (probabilityMixture w N) := probabilityMixture_probability w N
  apply Measure.pi_eq
  intro S hS
  have hpi (p : R → I) : (Measure.pi (N ∘ p)) (univ.pi S) = ∏ i, N (p i) (S i) := by
    let : ∀ i, IsProbabilityMeasure ((N ∘ p) i) := fun i => inferInstanceAs (IsProbabilityMeasure (N (p i)))
    exact Measure.pi_pi _ _
  rw [Measure.sum_apply _ (MeasurableSet.univ_pi hS), tsum_fintype]
  simp only [Measure.smul_apply, smul_eq_mul, hpi, ← Finset.prod_mul_distrib]
  rw [← Fintype.prod_sum (fun (r : R) (i : I) => w i * N i (S r))]
  apply Finset.prod_congr rfl
  intro j _
  rw [probabilityMixture, Measure.sum_apply _ (hS j), tsum_fintype]
  simp only [Measure.smul_apply, smul_eq_mul]

/-- A pointwise lower bound on a possibly nonmeasurable event gives the
corresponding lower bound on the integral of a measurable envelope. -/
theorem outer_event_mul_le_lintegral {X : Type*} [MeasurableSpace X]
    (μ : Measure X) {E : X → ℝ≥0∞} (hE : Measurable E) (S : Set X) (a : ℝ≥0∞)
    (hS : ∀ x ∈ S, a ≤ E x) : a * μ S ≤ ∫⁻ x, E x ∂μ := by
  let T := {x | a ≤ E x}
  have hT : MeasurableSet T := measurableSet_le measurable_const hE
  calc
    _ ≤ a * μ T := by gcongr; exact fun x hx => hS x hx
    _ = ∫⁻ x, T.indicator (fun _ => a) x ∂μ := (lintegral_indicator_const hT a).symm
    _ ≤ _ := lintegral_mono fun x => by
      by_cases hx : x ∈ T
      · rw [indicator_of_mem hx]
        exact hx
      · rw [indicator_of_notMem hx]
        exact bot_le

/-- Couple a sample with fixed latent indices to a single draw per index.
One row of each occupied index uses its original draw, and the remaining
rows use fresh independent coordinates. -/
theorem exists_copy_occupied_coordinates {I R X : Type*} [Fintype I] [Fintype R] [MeasurableSpace X]
    (N : I → Measure X) [∀ i, IsProbabilityMeasure (N i)] (p : R → I) :
    ∃ (f : (I → X) × (R → X) → R → X),
      MeasurePreserving f ((Measure.pi N).prod (Measure.pi (N ∘ p))) (Measure.pi (N ∘ p)) ∧
      ∃ r : Set.range p → R, Function.Injective r ∧
        ∀ z (i : Set.range p), f z (r i) = z.1 i.val := by
  classical
  let r (i : Set.range p) : R := Classical.choose i.property
  have hr (i : Set.range p) : p (r i) = i.val := Classical.choose_spec i.property
  have hri : Function.Injective r := fun i j he => Subtype.ext ((hr i).symm.trans ((congrArg p he).trans (hr j)))
  let e (j : R) : I ⊕ R := if j ∈ Set.range r then .inl (p j) else .inr j
  have hei : Function.Injective e := by
    intro j l he
    by_cases hj : j ∈ Set.range r <;> by_cases hl : l ∈ Set.range r
    · obtain ⟨i,rfl⟩ := hj
      obtain ⟨k,rfl⟩ := hl
      have h := Sum.inl.inj (by simpa only [e, ite_eq_left (Set.mem_range_self _)] using he)
      exact congrArg r (Subtype.ext ((hr i).symm.trans (h.trans (hr k))))
    · simp only [e, ite_eq_left hj, ite_eq_right hl, Sum.inl_ne_inr] at he
    · simp only [e, ite_eq_right hj, ite_eq_left hl, Sum.inr_ne_inl] at he
    · simpa only [e, ite_eq_right hj, ite_eq_right hl, Sum.inr.injEq] using he
  let M : I ⊕ R → Measure X := Sum.elim N (N ∘ p)
  let : ∀ i, IsProbabilityMeasure (M i) := fun i => by
    cases i with
    | inl i => exact inferInstanceAs (IsProbabilityMeasure (N i))
    | inr j => exact inferInstanceAs (IsProbabilityMeasure (N (p j)))
  have heM : (fun j => M (e j)) = N ∘ p := by
    funext j
    unfold e M
    split <;> rfl
  let f (z : (I → X) × (R → X)) (j : R) := Sum.elim z.1 z.2 (e j)
  refine ⟨f,?_,r,hri,?_⟩
  · have h := (measurePreserving_product_subtuple M e hei).comp (measurePreserving_sumPiEquivProdPi_symm M)
    rw [heM] at h
    exact h
  · intro z i
    simp only [f,e,ite_eq_left (Set.mem_range_self i),Sum.elim_inl,hr]

/-- The expected fraction of occupied latent indices, multiplied by the
outer mass of a common-support witness event, lower bounds every measurable
envelope for the fraction of hits on null supports. -/
theorem occupancy_mul_outer_le_null_hit_envelope
    {I R X H : Type*} [Fintype I] [Fintype R] [DecidableEq R] [MeasurableSpace X]
    (w : PMF I) (N : I → Measure X) [∀ i, IsProbabilityMeasure (N i)]
    (S : H → Set X) (T : Set (I → X)) (hT : ∀ z ∈ T,
      ∃ h, (∀ i, N i (S h) = 0) ∧ ∀ i, z i ∈ S h)
    (E : (R → X) → ℝ≥0∞) (hE : Measurable E)
    (hdom : ∀ z h, (∀ i, N i (S h) = 0) →
      (Nat.card {j : R // z j ∈ S h} : ℝ≥0∞) / Fintype.card R ≤ E z) :
    (Measure.pi N) T * ∑ p : R → I, (∏ j, w (p j)) *
      ((Nat.card (Set.range p) : ℝ≥0∞) / Fintype.card R) ≤
      ∫⁻ z, E z ∂Measure.pi (fun _ : R => probabilityMixture w N) := by
  classical
  let C (p : R → I) : ℝ≥0∞ := (Nat.card (Set.range p) : ℝ≥0∞) / Fintype.card R
  let v (p : R → I) : ℝ≥0∞ := ∏ j, w (p j)
  have hlow (p : R → I) : C p * (Measure.pi N) T ≤ ∫⁻ z, E z ∂Measure.pi (N ∘ p) := by
    obtain ⟨f,hf,r,hri,hr⟩ := exists_copy_occupied_coordinates N p
    have hgeom : ∀ z ∈ T ×ˢ (univ : Set (R → X)), C p ≤ E (f z) := by
      intro z hz
      obtain ⟨h,hh,hall⟩ := hT z.1 hz.1
      have hcard : Nat.card (Set.range p) ≤ Nat.card {j : R // f z j ∈ S h} := by
        let e (i : Set.range p) : {j : R // f z j ∈ S h} := ⟨r i, by rw [hr z i]; exact hall i.val⟩
        exact Nat.card_le_card_of_injective e (fun _ _ he => hri (congrArg (fun u : {j : R // f z j ∈ S h} => u.val) he))
      refine le_trans ?_ (hdom (f z) h hh)
      unfold C
      gcongr
    rw [← hf.lintegral_comp hE]
    have hlow' := outer_event_mul_le_lintegral ((Measure.pi N).prod (Measure.pi (N ∘ p)))
      (hE.comp hf.measurable) _ (C p) hgeom
    let : ∀ i, IsProbabilityMeasure ((N ∘ p) i) := fun i => inferInstanceAs (IsProbabilityMeasure (N (p i)))
    simpa only [Measure.prod_prod, measure_univ, mul_one, Function.comp_def] using hlow'
  rw [pi_probabilityMixture, lintegral_sum_measure, tsum_fintype]
  simp_rw [lintegral_smul_measure, smul_eq_mul, Finset.mul_sum]
  refine Finset.sum_le_sum fun p _ => ?_
  change (Measure.pi N) T * (v p * C p) ≤ v p * ∫⁻ z, E z ∂Measure.pi (N ∘ p)
  rw [mul_left_comm, mul_comm ((Measure.pi N) T) (C p)]
  exact mul_le_mul_of_nonneg_left (hlow p) bot_le

/-- Drawing as many independent uniform indices as the number of possible
indices occupies at least half of them in expectation. -/
theorem exists_uniform_occupancy_ge_half {k : ℕ} (hk : 0 < k) :
    ∃ w : PMF (Fin k), (1 : ℝ≥0∞)/2 ≤ ∑ p : Fin k → Fin k, (∏ j, w (p j)) *
      ((Nat.card (Set.range p) : ℝ≥0∞) / k) := by
  classical
  let c := (k : ℝ)⁻¹
  have hkR : 0 < (k : ℝ) := Nat.cast_pos.mpr hk
  have hc : 0 < c := inv_pos.mpr hkR
  have hm : ∑ _ : Fin k, c = 1 := by
    simp [c,hkR.ne']
  have hnorm : ∑ _ : Fin k, ENNReal.ofReal c = 1 := by
    rw [← ENNReal.ofReal_sum_of_nonneg (fun _ _ => hc.le), hm, ENNReal.ofReal_one]
  refine ⟨PMF.ofFintype (fun _ => ENNReal.ofReal c) hnorm,?_⟩
  let mass (_ : Fin k → Fin k) := ∏ _ : Fin k, c
  have hmass : ∑ p : Fin k → Fin k, mass p = 1 := by
    unfold mass
    rw [← Fintype.prod_sum (fun _ : Fin k => fun _ : Fin k => c)]
    simp only [hm,Finset.prod_const_one]
  have hmiss (i : Fin k) : ∑ p : Fin k → Fin k, (if i ∈ Set.range p then 0 else mass p) ≤ 1/2 := by
    let u (j : Fin k) : ℝ := if j = i then 0 else c
    have hsum : ∑ j, u j = 1 - c := by
      have hu (j : Fin k) : u j = c - (if j = i then c else 0) := by
        by_cases hj : j = i <;> simp [u,hj]
      simp_rw [hu,Finset.sum_sub_distrib,hm,Finset.sum_ite_eq',Finset.mem_univ,ite_true]
    have hprod (p : Fin k → Fin k) : (if i ∈ Set.range p then 0 else mass p) = ∏ j, u (p j) := by
      by_cases hp : i ∈ Set.range p
      · obtain ⟨j,hj⟩ := hp
        rw [ite_eq_left (show i ∈ Set.range p from ⟨j,hj⟩)]
        exact (Finset.prod_eq_zero (Finset.mem_univ j) (by simp [u,hj])).symm
      · have hne (j : Fin k) : p j ≠ i := fun hj => hp ⟨j,hj⟩
        simp only [hp,ite_false,mass,u,hne]
    have hc₁ : c ≤ 1 := inv_le_one_of_one_le₀ (by exact_mod_cast hk)
    have hp := pow_le_pow_left₀ (sub_nonneg.mpr hc₁)
      (show 1-c ≤ Real.exp (-c) by linarith only [Real.add_one_le_exp (-c)]) k
    simp_rw [hprod]
    rw [← Fintype.prod_sum (fun _ : Fin k => u)]
    simp only [hsum,Finset.prod_const,Finset.card_univ,Fintype.card_fin]
    calc
      _ ≤ Real.exp (-c) ^ k := hp
      _ = Real.exp (-1) := by
        rw [← Real.exp_nat_mul,show (k : ℝ) * (-c) = -1 by simp [c,hkR.ne']]
      _ ≤ 1/2 := by
        rw [Real.exp_neg,one_div]
        exact inv_anti₀ (by norm_num) (by linarith only [Real.add_one_le_exp (1 : ℝ)])
  have hpres (i : Fin k) : 1/2 ≤ ∑ p : Fin k → Fin k, (if i ∈ Set.range p then mass p else 0) := by
    have he : (∑ p : Fin k → Fin k, (if i ∈ Set.range p then mass p else 0)) +
        (∑ p : Fin k → Fin k, (if i ∈ Set.range p then 0 else mass p)) = 1 := by
      rw [← Finset.sum_add_distrib, ← hmass]
      exact Finset.sum_congr rfl fun _ _ => by split <;> simp
    linarith only [he,hmiss i]
  have hcard (p : Fin k → Fin k) : (Nat.card (Set.range p) : ℝ) =
      ∑ i : Fin k, (if i ∈ Set.range p then 1 else 0) := by
    rw [Nat.card_eq_fintype_card,← Finset.sum_filter,Finset.sum_const,nsmul_eq_mul,mul_one,
      Fintype.card_subtype]
  have hweight : (k : ℝ)/2 ≤ ∑ p : Fin k → Fin k, mass p * (Nat.card (Set.range p) : ℝ) := by
    simp_rw [hcard, Finset.mul_sum, mul_ite, mul_one, mul_zero]
    rw [Finset.sum_comm]
    simpa only [Finset.sum_const,Finset.card_univ,Fintype.card_fin,nsmul_eq_mul,mul_one_div,mul_one]
      using (Finset.sum_le_sum (s := Finset.univ) fun i _ => hpres i)
  have hr : (1 : ℝ)/2 ≤ ∑ p : Fin k → Fin k, mass p * ((Nat.card (Set.range p) : ℝ) / k) := by
    have h := div_le_div_of_nonneg_right hweight hkR.le
    simp_rw [← mul_div_assoc,← Finset.sum_div]
    convert h using 1
    field_simp [hkR.ne']
  have he := ENNReal.ofReal_le_ofReal hr
  rw [ENNReal.ofReal_div_of_pos (by norm_num : (0 : ℝ) < 2), ENNReal.ofReal_one,
    show ENNReal.ofReal 2 = 2 by norm_num] at he
  rw [ENNReal.ofReal_sum_of_nonneg (fun p _ => by unfold mass; positivity)] at he
  convert he using 1
  apply Finset.sum_congr rfl
  intro p _
  rw [ENNReal.ofReal_mul (by unfold mass; positivity), ENNReal.ofReal_div_of_pos hkR,
    ENNReal.ofReal_natCast,ENNReal.ofReal_natCast]
  simp only [PMF.ofFintype_apply, mass, ENNReal.ofReal_prod_of_nonneg (fun _ _ => hc.le)]

/-- Approximate one measurable event by an event from a stage of a monotone
sequence generating the ambient sigma-algebra. -/
theorem exists_measure_symmDiff_lt_of_monotone_iSup {X : Type*} [m : MeasurableSpace X]
    (μ : Measure X) [IsFiniteMeasure μ] (m₀ : ℕ → MeasurableSpace X)
    (hmono : Monotone m₀) (hm : (⨆ i, m₀ i) = m)
    {S : Set X} (hS : MeasurableSet S) {ε : ℝ≥0∞} (hε : 0 < ε) :
    ∃ (i : ℕ) (T : Set X), MeasurableSet[m₀ i] T ∧ μ (T ∆ S) < ε := by
  let R : Set (Set X) := {s | ∃ i, MeasurableSet[m₀ i] s}
  have hR : IsSetRing R := by
    refine ⟨⟨0,@MeasurableSet.empty X (m₀ 0)⟩,?_,?_⟩
    · rintro s t ⟨i,hi⟩ ⟨j,hj⟩
      exact ⟨max i j, (hmono (le_max_left _ _) _ hi).union (hmono (le_max_right _ _) _ hj)⟩
    · rintro s t ⟨i,hi⟩ ⟨j,hj⟩
      exact ⟨max i j, (hmono (le_max_left _ _) _ hi).diff (hmono (le_max_right _ _) _ hj)⟩
  have hgen : generateFrom R = m := by
    apply le_antisymm
    · apply generateFrom_le
      rintro s ⟨n,hn⟩
      exact (hm ▸ (le_iSup m₀ n)) s hn
    · rw [← hm]
      apply iSup_le
      intro i s hs
      exact measurableSet_generateFrom ⟨i,hs⟩
  have hcover : ∃ A : Set (Set X), A.Countable ∧ A ⊆ R ∧ μ (⋃₀ A)ᶜ = 0 := by
    refine ⟨{univ}, countable_singleton _, ?_, by simp⟩
    intro s hs
    have he : s = univ := hs
    exact ⟨0,he ▸ @MeasurableSet.univ X (m₀ 0)⟩
  obtain ⟨T,⟨i,hi⟩,hδ⟩ :=
    exists_measure_symmDiff_lt_of_generateFrom_isSetRing hR hcover hgen.symm hS hε
  exact ⟨i,T,hi,hδ⟩

section PiPartitions

variable {R X : Type*} [MeasurableSpace X] [CountablyGenerated X]

/-- The finite partition labels of all coordinates of a tuple. -/
noncomputable def piPartitionCode (j : ℕ) (z : R → X) (i : R) : countablePartition X j :=
  ⟨countablePartitionSet j (z i), countablePartitionSet_mem j (z i)⟩

/-- The product sigma-algebra at one depth of the coordinate partitions. -/
@[instance_reducible] noncomputable def piPartitionSpace (R X : Type*) [MeasurableSpace X] [CountablyGenerated X]
    (j : ℕ) : MeasurableSpace (R → X) :=
  ⨆ i : R, (generateFrom (countablePartition X j)).comap (Function.eval i)

theorem piPartitionSpace_monotone : Monotone (piPartitionSpace R X) := by
  apply monotone_nat_of_le_succ
  intro j
  unfold piPartitionSpace
  exact iSup_mono fun i => comap_mono (generateFrom_countablePartition_le_succ X j)

theorem iSup_piPartitionSpace : (⨆ j, piPartitionSpace R X j) = MeasurableSpace.pi := by
  have hgen : (⨆ j, generateFrom (countablePartition X j)) = (inferInstance : MeasurableSpace X) := by
    apply le_antisymm
    · exact iSup_le (generateFrom_countablePartition_le X)
    · calc
        _ = generateFrom (⋃ j, countablePartition X j) := (generateFrom_iUnion_countablePartition X).symm
        _ ≤ _ := by
          apply generateFrom_le
          intro C hC
          obtain ⟨j,hj⟩ := mem_iUnion.mp hC
          exact (le_iSup (fun j => generateFrom (countablePartition X j)) j) _ (measurableSet_generateFrom hj)
  unfold piPartitionSpace MeasurableSpace.pi
  calc
    _ = ⨆ i : R, ⨆ j, (generateFrom (countablePartition X j)).comap (Function.eval i) := iSup_comm
    _ = ⨆ i : R, (⨆ j, generateFrom (countablePartition X j)).comap (Function.eval i) := by simp_rw [comap_iSup]
    _ = _ := iSup_congr fun i => congrArg (MeasurableSpace.comap (Function.eval i)) hgen

theorem piPartitionSpace_measurableSet_preimage {j : ℕ} {T : Set (R → X)}
    (hT : MeasurableSet[piPartitionSpace R X j] T) :
    ∃ U : Set (R → countablePartition X j), T = piPartitionCode j ⁻¹' U := by
  suffices h : piPartitionSpace R X j ≤ (⊤ : MeasurableSpace (R → countablePartition X j)).comap (piPartitionCode j) by
    obtain ⟨U,_,he⟩ := h T hT
    exact ⟨U,he.symm⟩
  unfold piPartitionSpace
  apply iSup_le
  intro i
  rw [comap_generateFrom]
  apply generateFrom_le
  rintro _ ⟨C,hC,rfl⟩
  refine ⟨{c | (c i).val = C}, trivial, ?_⟩
  ext z
  exact countablePartitionSet_eq_iff (z i) hC

/-- Each fiber of a product partition code is the corresponding rectangle. -/
theorem piPartitionCode_fiber (j : ℕ) (u : R → countablePartition X j) :
    piPartitionCode j ⁻¹' {u} = univ.pi (fun i => (u i).val) := by
  ext z
  simp only [mem_preimage, mem_singleton_iff, mem_univ_pi, funext_iff]
  constructor <;> intro hz i
  · exact (countablePartitionSet_eq_iff (z i) (u i).property).mp (congrArg Subtype.val (hz i))
  · exact Subtype.ext ((countablePartitionSet_eq_iff (z i) (u i).property).mpr (hz i))

/-- A positive-measure event has arbitrarily high relative density on some
cell of a finite product partition. -/
theorem exists_piPartition_density [Finite R] (μ : Measure (R → X)) [IsFiniteMeasure μ]
    {E : Set (R → X)} (hE : MeasurableSet E) (hμ : 0 < μ E)
    {q : ℝ} (hq₀ : 0 ≤ q) (hq₁ : q < 1) :
    ∃ (j : ℕ) (u : R → countablePartition X j),
      q * μ.real (univ.pi fun i => (u i).val) < μ.real (E ∩ univ.pi fun i => (u i).val) := by
  classical
  have hμR : 0 < μ.real E := ENNReal.toReal_pos hμ.ne' (measure_ne_top μ E)
  let ε := (1-q) * μ.real E / 4
  have hε : 0 < ε := div_pos (mul_pos (sub_pos.mpr hq₁) hμR) (by norm_num)
  obtain ⟨j,T,hT,herr⟩ := exists_measure_symmDiff_lt_of_monotone_iSup μ (piPartitionSpace R X)
    piPartitionSpace_monotone iSup_piPartitionSpace hE (ENNReal.ofReal_pos.mpr hε)
  have herrR : μ.real (T ∆ E) < ε := by
    have he := (ENNReal.toReal_lt_toReal (measure_ne_top μ (T ∆ E)) ENNReal.ofReal_ne_top).mpr herr
    simpa only [measureReal_def, ENNReal.toReal_ofReal hε.le] using he
  obtain ⟨U,hU⟩ := piPartitionSpace_measurableSet_preimage hT
  let : Fintype U := Fintype.ofFinite _
  let B (u : U) := piPartitionCode j ⁻¹' {u.val}
  have hB (u : U) : MeasurableSet (B u) := by
    rw [show B u = _ from piPartitionCode_fiber j u.val]
    exact MeasurableSet.pi countable_univ fun i _ => measurableSet_countablePartition _ (u.val i).property
  have hd : Pairwise (fun a b => Disjoint (B a) (B b)) := by
    intro a b hne
    apply Set.disjoint_left.mpr
    intro z hz hz'
    exact hne (Subtype.ext (hz.symm.trans hz'))
  have hsplit : T = ⋃ u : U, B u := by
    rw [hU]
    ext z
    constructor
    · intro hz
      exact mem_iUnion.mpr ⟨⟨piPartitionCode j z,hz⟩,rfl⟩
    · intro hz
      obtain ⟨u,hu⟩ := mem_iUnion.mp hz
      change piPartitionCode j z = u.val at hu
      change piPartitionCode j z ∈ U
      rw [hu]
      exact u.property
  by_contra hneg
  push Not at hneg
  have hineq : μ.real (E ∩ T) ≤ q * μ.real T := by
    rw [hsplit, inter_iUnion, measureReal_iUnion_fintype hd hB, Finset.mul_sum,
      measureReal_iUnion_fintype (fun a b hne => (hd hne).mono inter_subset_right inter_subset_right)
        (fun u => hE.inter (hB u))]
    exact Finset.sum_le_sum fun u _ => by
      rw [show B u = _ from piPartitionCode_fiber j u.val]
      exact hneg j u.val
  have hleft : μ.real E ≤ μ.real (E ∩ T) + μ.real (T ∆ E) := by
    refine (measureReal_mono (show E ⊆ (E ∩ T) ∪ (T ∆ E) from ?_)).trans (measureReal_union_le _ _)
    intro x hx
    by_cases ht : x ∈ T
    · exact Or.inl ⟨hx,ht⟩
    · exact Or.inr (by simp [symmDiff_def, hx, ht])
  have hright : μ.real T ≤ μ.real E + μ.real (T ∆ E) := by
    refine (measureReal_mono (show T ⊆ E ∪ (T ∆ E) from ?_)).trans (measureReal_union_le _ _)
    intro x hx
    by_cases ht : x ∈ E
    · exact Or.inl ht
    · exact Or.inr (by simp [symmDiff_def, hx, ht])
  have hq := mul_le_mul_of_nonneg_left hright hq₀
  have hqerr : q * μ.real (T ∆ E) ≤ μ.real (T ∆ E) := by
    simpa only [one_mul] using mul_le_mul_of_nonneg_right hq₁.le (measureReal_nonneg (μ := μ) (s := T ∆ E))
  unfold ε at herrR
  nlinarith only [hineq,hleft,hq,hqerr,herrR,hμR,mul_pos (sub_pos.mpr hq₁) hμR]

/-- Any positive-outer-measure event has arbitrarily large outer measure
after independently conditioning its coordinates on measurable sets. -/
theorem exists_piRectangle_outer_density [Fintype R] (M : Measure X) [IsProbabilityMeasure M]
    {T : Set (R → X)} (hT : 0 < (Measure.pi fun _ : R => M) T)
    {q : ℝ} (hq₀ : 0 ≤ q) (hq₁ : q < 1) :
    ∃ B : R → Set X, (∀ i, MeasurableSet (B i) ∧ 0 < M (B i)) ∧
      q < (Measure.pi fun i => (M (B i))⁻¹ • M.restrict (B i)).real T := by
  classical
  let μ := Measure.pi fun _ : R => M
  let E := toMeasurable μ T
  have hE : MeasurableSet E := measurableSet_toMeasurable _ _
  have hμ : 0 < μ E := by simpa [E] using hT
  obtain ⟨j,u,hd⟩ := exists_piPartition_density μ hE hμ hq₀ hq₁
  let B (i : R) := (u i).val
  let P := univ.pi B
  have hB (i : R) : MeasurableSet (B i) := measurableSet_countablePartition j (u i).property
  have hP : MeasurableSet P := MeasurableSet.univ_pi hB
  change q * μ.real P < μ.real (E ∩ P) at hd
  have hPpos : 0 < μ.real P :=
    (mul_nonneg hq₀ measureReal_nonneg).trans_lt (hd.trans_le (measureReal_mono inter_subset_right))
  have hPne : μ P ≠ 0 := by intro h; simp [measureReal_def,h] at hPpos
  have hprod : μ P = ∏ i, M (B i) := Measure.pi_pi _ _
  have hBne (i : R) : M (B i) ≠ 0 := by
    intro h
    exact hPne (hprod.trans (Finset.prod_eq_zero (Finset.mem_univ i) h))
  refine ⟨B,fun i => ⟨hB i,pos_iff_ne_zero.mpr (hBne i)⟩,?_⟩
  let N (i : R) := (M (B i))⁻¹ • M.restrict (B i)
  let c := ∏ i, (M (B i))⁻¹
  let : ∀ i, IsProbabilityMeasure (N i) := fun i => ⟨by
    simp only [N, Measure.smul_apply, smul_eq_mul, Measure.restrict_apply_univ]
    exact ENNReal.inv_mul_cancel (hBne i) (measure_ne_top M _)⟩
  have hc : c = (μ P)⁻¹ := by
    have h : c * μ P = 1 := by
      rw [hprod, ← Finset.prod_mul_distrib]
      exact Finset.prod_eq_one fun i _ => ENNReal.inv_mul_cancel (hBne i) (measure_ne_top M _)
    calc
      c = c * (μ P * (μ P)⁻¹) := by rw [ENNReal.mul_inv_cancel hPne (measure_ne_top μ P), mul_one]
      _ = (μ P)⁻¹ := by rw [← mul_assoc, h, one_mul]
  have he : Measure.pi N = c • μ.restrict P := by
    apply Measure.pi_eq
    intro U _
    rw [Measure.smul_apply, smul_eq_mul, show μ.restrict P = _ from Measure.restrict_pi_pi _ _,
      Measure.pi_pi, ← Finset.prod_mul_distrib]
    simp only [N, Measure.smul_apply, smul_eq_mul]
    rfl
  have hTP : μ (E ∩ P) = μ (T ∩ P) := μ.measure_toMeasurable_inter hP (measure_ne_top μ T)
  change q < (Measure.pi N).real T
  rw [he,hc,measureReal_def,Measure.smul_apply,smul_eq_mul,
    Measure.restrict_apply' hP,ENNReal.toReal_mul,ENNReal.toReal_inv,← hTP,← measureReal_def,← measureReal_def,
    inv_mul_eq_div]
  exact (lt_div_iff₀ hPpos).mpr hd

/-- A positive-outer-measure event of many hits on a null support can be
amplified by changing the feature distribution. The indices used in the
amplification are latent and impose no disjointness condition on the cells. -/
theorem exists_reweighted_null_hit_lower
    {I H : Type*} [Fintype I] [DecidableEq I] (M : Measure X) [IsProbabilityMeasure M]
    (S : H → Set X) (w : PMF I)
    (houter : 0 < (Measure.pi fun _ : I => M) {z | ∃ h, M (S h) = 0 ∧ ∀ i, z i ∈ S h})
    {q : ℝ} (hq₀ : 0 ≤ q) (hq₁ : q < 1) :
    ∃ N : Measure X, IsProbabilityMeasure N ∧
      ∀ (E : (I → X) → ℝ≥0∞), Measurable E →
        (∀ z h, N (S h) = 0 → (Nat.card {i : I // z i ∈ S h} : ℝ≥0∞) / Fintype.card I ≤ E z) →
        ENNReal.ofReal q * ∑ p : I → I, (∏ j, w (p j)) *
          ((Nat.card (Set.range p) : ℝ≥0∞) / Fintype.card I) ≤ ∫⁻ z, E z ∂Measure.pi (fun _ : I => N) := by
  classical
  let T : Set (I → X) := {z | ∃ h, M (S h) = 0 ∧ ∀ i, z i ∈ S h}
  obtain ⟨B,hB,hq⟩ := exists_piRectangle_outer_density M houter hq₀ hq₁
  let M' (i : I) : Measure X := (M (B i))⁻¹ • M.restrict (B i)
  let : ∀ i, IsProbabilityMeasure (M' i) := fun i => ⟨by
    rw [show M' i = _ from rfl, Measure.smul_apply, smul_eq_mul, Measure.restrict_apply_univ]
    exact ENNReal.inv_mul_cancel (hB i).2.ne' (measure_ne_top M _)⟩
  let N := probabilityMixture w M'
  refine ⟨N,probabilityMixture_probability w M',?_⟩
  intro E hE hdom
  have hT (z : I → X) (hz : z ∈ T) : ∃ h, (∀ i, M' i (S h) = 0) ∧ ∀ i, z i ∈ S h := by
    obtain ⟨h,hn,hh⟩ := hz
    refine ⟨h,fun i => ?_,hh⟩
    have hz0 : M.restrict (B i) (S h) = 0 := le_antisymm
      ((Measure.restrict_le_self : M.restrict (B i) ≤ M) (S h) |>.trans_eq hn) bot_le
    rw [show M' i = _ from rfl, Measure.smul_apply, smul_eq_mul, hz0, mul_zero]
  have hzero (h : H) (hh : ∀ i, M' i (S h) = 0) : N (S h) = 0 := by
    change (Measure.sum fun i => w i • M' i) (S h) = 0
    rw [Measure.sum_apply_of_countable]
    simp only [Measure.smul_apply, smul_eq_mul, hh, mul_zero, tsum_zero]
  have hle : ENNReal.ofReal q ≤ (Measure.pi M') T :=
    (ENNReal.ofReal_le_ofReal hq.le).trans (ENNReal.ofReal_toReal_le)
  calc
    _ ≤ (Measure.pi M') T * ∑ p : I → I, (∏ j, w (p j)) *
        ((Nat.card (Set.range p) : ℝ≥0∞) / Fintype.card I) := by gcongr
    _ ≤ _ := occupancy_mul_outer_le_null_hit_envelope w M' S T hT E hE
      (fun z h hh => hdom z h (hzero h hh))

/-- The uniform bound at a single sample size used by the null-support
argument. A sharp outer uniform-convergence bound implies it at a large
enough size, by taking all labels positive. -/
def NullHitEnvelopeAt {H : Type*} (S : H → Set X) (k : ℕ) : Prop :=
  ∀ M : Measure X, [IsProbabilityMeasure M] →
    ∃ E : (Fin k → X) → ℝ≥0∞, Measurable E ∧
      (∫⁻ z, E z ∂Measure.pi (fun _ : Fin k => M)) < 1/4 ∧
      ∀ z h, M (S h) = 0 →
        (Nat.card {i : Fin k // z i ∈ S h} : ℝ≥0∞) / k ≤ E z

/-- A sufficiently small null-support envelope at size `k` forces every iid
law to assign outer measure zero to the event of `k` hits on one null support. -/
theorem null_support_hit_event_null {H : Type*} (S : H → Set X) {k : ℕ} (hk : 0 < k)
    (henvelope : NullHitEnvelopeAt S k) (M : Measure X) [IsProbabilityMeasure M] :
    (Measure.pi fun _ : Fin k => M) {z | ∃ h, M (S h) = 0 ∧ ∀ i, z i ∈ S h} = 0 := by
  by_contra hne
  obtain ⟨w,hw⟩ := exists_uniform_occupancy_ge_half hk
  obtain ⟨N,hN,h⟩ := exists_reweighted_null_hit_lower M S w (pos_iff_ne_zero.mpr hne)
    (q := 1/2) (by norm_num) (by norm_num)
  obtain ⟨E,hE,hlt,hdom⟩ := @henvelope N hN
  have hbound := h E hE (by simpa only [Fintype.card_fin] using hdom)
  have hn : (1 : ℝ≥0∞)/4 ≤ ∫⁻ z, E z ∂Measure.pi (fun _ : Fin k => N) := by
    calc
      _ = ENNReal.ofReal ((1 : ℝ)/2) * ((1 : ℝ≥0∞)/2) := by
        have h₂ : (1 : ℝ≥0∞)/2 = ENNReal.ofReal ((1 : ℝ)/2) := by
          rw [ENNReal.ofReal_div_of_pos (by norm_num : (0 : ℝ) < 2), ENNReal.ofReal_one]
          norm_num
        have h₄ : (1 : ℝ≥0∞)/4 = ENNReal.ofReal ((1 : ℝ)/4) := by
          rw [ENNReal.ofReal_div_of_pos (by norm_num : (0 : ℝ) < 4), ENNReal.ofReal_one]
          norm_num
        rw [h₂,h₄,← ENNReal.ofReal_mul (by norm_num)]
        norm_num
      _ ≤ _ := by
        simp only [Fintype.card_fin] at hbound
        exact (mul_le_mul_of_nonneg_left hw bot_le).trans hbound
  exact (not_lt_of_ge hn) hlt

/-- The same cutoff holds at every sample size, simultaneously for all
supports that have zero mass under the sampled law. -/
theorem iid_nullSupport_hits_lt_of_envelope {H : Type*} (S : H → Set X) {k n : ℕ} (hk : 0 < k)
    (henvelope : NullHitEnvelopeAt S k) (M : Measure X) [IsProbabilityMeasure M] :
    ∀ᵐ z ∂(Measure.pi fun _ : Fin n => M), ∀ h, M (S h) = 0 →
      Nat.card {i : Fin n // z i ∈ S h} < k := by
  classical
  let T : Set (Fin k → X) := {z | ∃ h, M (S h) = 0 ∧ ∀ i, z i ∈ S h}
  have hn : (Measure.pi fun _ : Fin k => M) T = 0 := null_support_hit_event_null S hk henvelope M
  have hae : ∀ᵐ z ∂(Measure.pi fun _ : Fin k => M), z ∉ T := by
    rw [ae_iff]
    simpa using hn
  have hsub (e : Fin k ↪ Fin n) : ∀ᵐ z ∂(Measure.pi fun _ : Fin n => M), (z ∘ e) ∉ T :=
    (measurePreserving_product_subtuple (fun _ : Fin n => M) e e.injective).quasiMeasurePreserving.ae hae
  have hall : ∀ᵐ z ∂(Measure.pi fun _ : Fin n => M), ∀ e : Fin k ↪ Fin n, (z ∘ e) ∉ T :=
    ae_all_iff.mpr hsub
  filter_upwards [hall] with z hz
  intro h hzero
  by_contra! hc
  have hc' : k ≤ Fintype.card {i : Fin n // z i ∈ S h} := by
    simpa only [Nat.card_eq_fintype_card] using hc
  let e : Fin k ↪ {i : Fin n // z i ∈ S h} :=
    (Fin.castLEEmb hc').trans (Fintype.equivFin _).symm.toEmbedding
  let u : Fin k ↪ Fin n := e.trans ⟨Subtype.val,Subtype.val_injective⟩
  exact hz u ⟨h,hzero,fun i => (e i).property⟩

end PiPartitions

end AgnosticVC
