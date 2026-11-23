module

public import Conjectures.AgnosticVC.IidRectangleDensity
public import Conjectures.AgnosticVC.CompletedFiniteGroups
public import Mathlib.MeasureTheory.Integral.Bochner.SumMeasure
public import Mathlib.Algebra.Order.Floor.Semiring

/-! Fair independent labels turn the outer-measure matching into a lower bound for improper outputs. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory ProbabilityTheory Set
open scoped ENNReal

private theorem intersects_of_outer_one {Y : Type*} [MeasurableSpace Y]
    (μ : Measure Y) [IsProbabilityMeasure μ] {G B : Set Y}
    (hG : μ G = 1) (hB : MeasurableSet B) (hpos : μ B ≠ 0) : (G ∩ B).Nonempty := by
  by_contra h
  have hle : G ⊆ Bᶜ := fun p hp hmem => h ⟨p,hp,hmem⟩
  have hlt : μ Bᶜ < 1 := by
    rw [measure_compl hB (measure_ne_top _ _), measure_univ]
    exact ENNReal.sub_lt_self (by simp) (by simp) hpos
  exact hlt.not_ge (hG ▸ measure_mono hle)

/-- On any injectively assigned sectors, every prescribed label pattern has
perfect proper fits in every positive-measure Borel set of sampled values. -/
theorem exists_groupPredict_fit_in_positive_set {X : Type} [MeasurableSpace X]
    (D : Measure X) [IsProbabilityMeasure D] [NullSingletonClass D] {m n : ℕ}
    (G : Set (Fin m → X)) (hG : (Measure.pi fun _ : Fin m => D) G = 1)
    (tag : Fin n → Fin m) (htag : Function.Injective tag) (labels : Fin n → Bool)
    {B : Set (Fin n → X)} (hB : MeasurableSet B) (hpos : (Measure.pi fun _ : Fin n => D) B ≠ 0) :
    ∃ x ∈ B, ∃ h : Unit ⊕ G, ∀ i, groupPredict G h (tag i,x i) = labels i := by
  classical
  let P := {i : Fin n // labels i = true}
  let N := {i : Fin n // ¬ labels i = true}
  let μ := Measure.pi fun _ : P => D
  let ν := Measure.pi fun _ : N => D
  let e := MeasurableEquiv.piEquivPiSubtypeProd (fun _ : Fin n => X) (fun i => labels i = true)
  let T := e.symm ⁻¹' B
  have hT : MeasurableSet T := e.symm.measurable hB
  have hTpos : (μ.prod ν) T ≠ 0 := by
    let he := (measurePreserving_piEquivPiSubtypeProd (fun _ : Fin n => D)
      (fun i => labels i = true)).symm e
    rw [← he.map_eq, Measure.map_apply e.symm.measurable hB] at hpos
    exact hpos
  let A : Set (P → X) := {u | ν (Prod.mk u ⁻¹' T) ≠ 0}
  have hA : MeasurableSet A := (measurableSet_eq_fun (measurable_measure_prodMk_left hT)
    measurable_const).compl
  have hApos : μ A ≠ 0 := fun h => hTpos ((Measure.measure_prod_null hT).2 (ae_iff.mpr h))
  let v (i : P) := tag i.val
  have hv := measurePreserving_product_subtuple (fun _ : Fin m => D) v
    (htag.comp Subtype.val_injective)
  have hvA : MeasurableSet ((fun g : Fin m → X => g ∘ v) ⁻¹' A) := hv.measurable hA
  have hvpos : (Measure.pi fun _ : Fin m => D) ((fun g : Fin m → X => g ∘ v) ⁻¹' A) ≠ 0 := by
    rw [← Measure.map_apply hv.measurable hA, hv.map_eq]
    exact hApos
  obtain ⟨g,hg,hgpos⟩ := intersects_of_outer_one _ hG hvA hvpos
  let C : Set (N → X) := Prod.mk (g ∘ v) ⁻¹' T
  have hC : ν C ≠ 0 := hgpos
  have havoid : ∀ᵐ y ∂ν, ∀ i : N, y i ≠ g (tag i.val) := by
    rw [ae_all_iff]
    intro i
    rw [ae_iff]
    simp only [not_not]
    change ν (Function.eval i ⁻¹' {g (tag i.val)}) = 0
    exact (measurePreserving_eval (fun _ : N => D) i).quasiMeasurePreserving.preimage_null
      (measure_singleton (g (tag i.val)))
  obtain ⟨y,hy,hyavoid⟩ : ∃ y ∈ C, ∀ i : N, y i ≠ g (tag i.val) := by
    by_contra hb
    have hsub : C ⊆ {y | ¬ ∀ i : N, y i ≠ g (tag i.val)} := fun y hy h => hb ⟨y,hy,h⟩
    exact hC (measure_mono_null hsub (ae_iff.mp havoid))
  refine ⟨e.symm (g ∘ v,y),hy,.inr ⟨g,hg⟩,?_⟩
  intro i
  by_cases hp : labels i = true
  · rw [hp, groupPredict_inr_true]
    simp [e, MeasurableEquiv.piEquivPiSubtypeProd, Equiv.piEquivPiSubtypeProd, v, hp]
  · have hn := hyavoid ⟨i,hp⟩
    cases hl : labels i with
    | true => exact (hp hl).elim
    | false =>
      apply Bool.eq_false_iff.mpr
      intro ht
      apply hn
      have hh := (groupPredict_inr_true _ _ _).mp ht
      simpa [e, MeasurableEquiv.piEquivPiSubtypeProd, Equiv.piEquivPiSubtypeProd, hp] using hh.symm

/-- Samplewise comparison with the proper optimum can force a small loss
almost everywhere even when the scalar loss comes from an improper learner. -/
theorem ae_groupLoss_le_of_injective_tags {X : Type} [MeasurableSpace X]
    (D : Measure X) [IsProbabilityMeasure D] [NullSingletonClass D] {m n : ℕ}
    (G : Set (Fin m → X)) (hG : (Measure.pi fun _ : Fin m => D) G = 1)
    (tag : Fin n → Fin m) (htag : Function.Injective tag) (labels : Fin n → Bool)
    (r : (Fin n → X) → ℝ) (hr : AEMeasurable r (Measure.pi fun _ : Fin n => D)) (ε : ℝ)
    (hbound : ∀ x, r x ≤ (⨅ h,
      empiricalError (groupPredict G) (fun i => ((tag i,x i),labels i)) h) + ε) :
    ∀ᵐ x ∂(Measure.pi fun _ : Fin n => D), r x ≤ ε := by
  let μ := Measure.pi fun _ : Fin n => D
  let A := {x | ε < r x}
  have hA : NullMeasurableSet A μ := nullMeasurableSet_lt aemeasurable_const hr
  obtain ⟨B,hBA,hB,hAB⟩ := hA.exists_measurable_subset_ae_eq
  have hBnull : μ B = 0 := by
    by_contra hpos
    obtain ⟨x,hx,k,hk⟩ := exists_groupPredict_fit_in_positive_set D G hG tag htag labels hB hpos
    let z (i : Fin n) : (Fin m × X) × Bool := ((tag i,x i),labels i)
    have hkz : empiricalError (groupPredict G) z k = 0 := by
      simp [z, empiricalError_eq_zeroOne, hk]
    have hbelow : BddBelow (range (empiricalError (groupPredict G) z)) := by
      refine ⟨0,?_⟩
      rintro _ ⟨h,rfl⟩
      rw [empiricalError_eq_zeroOne]
      positivity
    have hmin := ciInf_le hbelow k
    rw [hkz] at hmin
    have hle := hbound x
    change r x ≤ (⨅ h, empiricalError (groupPredict G) z h) + ε at hle
    exact (not_lt_of_ge (by linarith only [hle,hmin] : r x ≤ ε)) (hBA hx)
  have hAnull : μ A = 0 := (measure_congr hAB.symm).trans hBnull
  rw [ae_iff]
  simpa only [not_le] using hAnull

/-- An observation with a given sector and label and a variable feature value. -/
def attachSectorLabel {X : Type} {m : ℕ} (a : Fin m × Bool) (x : X) : (Fin m × X) × Bool :=
  ((a.1,x),a.2)

/-- The feature law lifted to a fixed sector and label. -/
noncomputable def sectorLabelComponent {X : Type} [MeasurableSpace X] {m : ℕ}
    (D : Measure X) (a : Fin m × Bool) : Measure ((Fin m × X) × Bool) :=
  D.map (attachSectorLabel a)

private theorem measurable_attachSectorLabel {X : Type} [MeasurableSpace X] {m : ℕ}
    (a : Fin m × Bool) : Measurable (attachSectorLabel (X := X) a) :=
  (measurable_const.prodMk measurable_id).prodMk measurable_const

private instance {X : Type} [MeasurableSpace X] {m : ℕ}
    (D : Measure X) [IsProbabilityMeasure D] (a : Fin m × Bool) :
    IsProbabilityMeasure (sectorLabelComponent D a) :=
  (Measure.isProbabilityMeasure_map_iff (measurable_attachSectorLabel a).aemeasurable).2 inferInstance

/-- Sample a sector and label, then draw an independent value from `D`. -/
noncomputable def sectorLabelLaw {X : Type} [MeasurableSpace X] {m : ℕ}
    (D : Measure X) (w : PMF (Fin m × Bool)) : Measure ((Fin m × X) × Bool) :=
  probabilityMixture w (sectorLabelComponent D)

theorem sectorLabelLaw_probability {X : Type} [MeasurableSpace X] {m : ℕ}
    (D : Measure X) [IsProbabilityMeasure D] (w : PMF (Fin m × Bool)) :
    IsProbabilityMeasure (sectorLabelLaw D w) := probabilityMixture_probability _ _

/-- The scalar risk of any learner satisfying the empirical comparison is
bounded by the tolerance on injective sector patterns and by one otherwise. -/
theorem integral_groupLoss_le_by_sector_pattern {X : Type} [MeasurableSpace X]
    (D : Measure X) [IsProbabilityMeasure D] [NullSingletonClass D] {m n : ℕ}
    (G : Set (Fin m → X)) (hG : (Measure.pi fun _ : Fin m => D) G = 1)
    (w : PMF (Fin m × Bool)) (r : (Fin n → (Fin m × X) × Bool) → ℝ)
    (hr : AEMeasurable r (Measure.pi fun _ : Fin n => sectorLabelLaw D w))
    (hrange : ∀ z, r z ∈ Icc 0 1) (ε : ℝ)
    (hbound : ∀ z, r z ≤ (⨅ h, empiricalError (groupPredict G) z h) + ε) :
    (∫ z, r z ∂Measure.pi (fun _ : Fin n => sectorLabelLaw D w)) ≤
      ∑ p : Fin n → Fin m × Bool, (∏ i, w (p i)).toReal *
        (if Function.Injective (fun i => (p i).1) then ε else 1) := by
  classical
  let : IsProbabilityMeasure (sectorLabelLaw D w) := sectorLabelLaw_probability D w
  let μ := Measure.pi (fun _ : Fin n => sectorLabelLaw D w)
  let M (p : Fin n → Fin m × Bool) := Measure.pi (sectorLabelComponent D ∘ p)
  let weight (p : Fin n → Fin m × Bool) := ∏ i, w (p i)
  let : ∀ (p : Fin n → Fin m × Bool) (i : Fin n),
      IsProbabilityMeasure ((sectorLabelComponent D ∘ p) i) := fun p i =>
    inferInstanceAs (IsProbabilityMeasure (sectorLabelComponent D (p i)))
  let : ∀ p, IsProbabilityMeasure (M p) := fun p => by unfold M; infer_instance
  have hdecomp : μ = Measure.sum (fun p => weight p • M p) := pi_probabilityMixture w (sectorLabelComponent D)
  have hI : Integrable r μ := Integrable.of_bound hr.aestronglyMeasurable 1 (.of_forall fun z =>
    (Real.norm_of_nonneg (hrange z).1).trans_le (hrange z).2)
  change (∫ z, r z ∂μ) ≤ _
  rw [hdecomp] at hI ⊢
  rw [integral_sum_measure hI, tsum_fintype]
  simp only [integral_smul_measure, smul_eq_mul]
  apply Finset.sum_le_sum
  intro p _
  change (weight p).toReal * ∫ z, r z ∂M p ≤ _
  by_cases hz : weight p = 0
  · simp [← show weight p = ∏ i, w (p i) from rfl, hz]
  have hMp : M p ≪ μ := by
    intro A hA
    have hle : weight p • M p ≤ μ := by
      rw [hdecomp]
      exact Measure.le_sum (fun p => weight p • M p) p
    have hh := le_antisymm ((hle A).trans_eq hA) bot_le
    rw [Measure.smul_apply, smul_eq_mul, mul_eq_zero] at hh
    exact hh.resolve_left hz
  have hrp := hr.mono_ac hMp
  have hIr : Integrable r (M p) := Integrable.of_bound hrp.aestronglyMeasurable 1 (.of_forall fun z =>
    (Real.norm_of_nonneg (hrange z).1).trans_le (hrange z).2)
  apply mul_le_mul_of_nonneg_left _ ENNReal.toReal_nonneg
  by_cases hinj : Function.Injective (fun i => (p i).1)
  · rw [ite_eq_left hinj]
    let assemble (x : Fin n → X) (i : Fin n) := attachSectorLabel (p i) (x i)
    have hp : MeasurePreserving assemble (Measure.pi fun _ : Fin n => D) (M p) :=
      measurePreserving_pi _ _ fun i => ⟨measurable_attachSectorLabel (p i),rfl⟩
    have hrp' : AEMeasurable (fun x => r (assemble x)) (Measure.pi fun _ : Fin n => D) :=
      hrp.comp_quasiMeasurePreserving hp.quasiMeasurePreserving
    have hae := ae_groupLoss_le_of_injective_tags D G hG (fun i => (p i).1) hinj
      (fun i => (p i).2) (fun x => r (assemble x)) hrp' ε (fun x => hbound (assemble x))
    have hAE : ∀ᵐ z ∂M p, r z ≤ ε := by
      have hSet : NullMeasurableSet {z | ¬ r z ≤ ε} (M p) :=
        (nullMeasurableSet_le hrp aemeasurable_const).compl
      rw [ae_iff]
      rw [← hp.map_eq]
      rw [Measure.map_apply₀ hp.measurable.aemeasurable (hp.map_eq.symm ▸ hSet)]
      exact ae_iff.mp hae
    simpa using integral_mono_ae hIr (integrable_const (μ := M p) ε) hAE
  · rw [ite_eq_right hinj]
    simpa using integral_mono_ae hIr (integrable_const (μ := M p) (1 : ℝ))
      (.of_forall fun z => (hrange z).2)

private theorem measure_pi_singleton_sectorLabels {m n : ℕ}
    (w : PMF (Fin m × Bool)) (p : Fin n → Fin m × Bool) :
    (Measure.pi fun _ : Fin n => w.toMeasure) {p} = ∏ i, w (p i) := by
  classical
  have h : ({p} : Set (Fin n → Fin m × Bool)) = univ.pi (fun i => {p i}) := by
    ext q
    simp [funext_iff]
  rw [h, Measure.pi_pi]
  exact Finset.prod_congr rfl fun i _ => PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton _)

/-- Outside collisions, the empirical comparison forces a small scalar risk
regardless of the learner's output class. -/
theorem integral_groupLoss_le_epsilon_add_collision {X : Type} [MeasurableSpace X]
    (D : Measure X) [IsProbabilityMeasure D] [NullSingletonClass D] {m n : ℕ}
    (G : Set (Fin m → X)) (hG : (Measure.pi fun _ : Fin m => D) G = 1)
    (w : PMF (Fin m × Bool)) (r : (Fin n → (Fin m × X) × Bool) → ℝ)
    (hr : AEMeasurable r (Measure.pi fun _ : Fin n => sectorLabelLaw D w))
    (hrange : ∀ z, r z ∈ Icc 0 1) {ε : ℝ} (hε : 0 ≤ ε)
    (hbound : ∀ z, r z ≤ (⨅ h, empiricalError (groupPredict G) z h) + ε) :
    (∫ z, r z ∂Measure.pi (fun _ : Fin n => sectorLabelLaw D w)) ≤
      ε + ((Measure.pi fun _ : Fin n => w.toMeasure)
        {p | ¬ Function.Injective (fun i => (p i).1)}).toReal := by
  classical
  let μ := Measure.pi (fun _ : Fin n => w.toMeasure)
  let Bad := {p : Fin n → Fin m × Bool | ¬ Function.Injective (fun i => (p i).1)}
  let f (p : Fin n → Fin m × Bool) : ℝ := if Function.Injective (fun i => (p i).1) then ε else 1
  have hsum := integral_groupLoss_le_by_sector_pattern D G hG w r hr hrange ε hbound
  have hEq : (∫ p, f p ∂μ) = ∑ p, (∏ i, w (p i)).toReal * f p := by
    rw [integral_fintype Integrable.of_finite]
    simp only [measureReal_def, μ, measure_pi_singleton_sectorLabels, smul_eq_mul]
  refine hsum.trans ?_
  change (∑ p, (∏ i, w (p i)).toReal * f p) ≤ ε + (μ Bad).toReal
  rw [← hEq]
  have hB : MeasurableSet Bad := Bad.to_countable.measurableSet
  have hdom : ∀ p, f p ≤ ε + Bad.indicator (fun _ => (1 : ℝ)) p := by
    intro p
    by_cases hp : Function.Injective (fun i => (p i).1)
    · simp [f, Bad, hp]
    · simp [f, Bad, hp, hε]
  calc
    _ ≤ ∫ p, ε + Bad.indicator (fun _ => (1 : ℝ)) p ∂μ :=
      integral_mono Integrable.of_finite Integrable.of_finite hdom
    _ = _ := by
      rw [integral_add (integrable_const _) Integrable.of_finite, integral_indicator hB]
      simp [measureReal_def]

theorem uniform_univ_probability (I : Type) [Fintype I] [Nonempty I]
    [MeasurableSpace I] [MeasurableSingletonClass I] :
    IsProbabilityMeasure (Measure.uniformOfFinset (Finset.univ : Finset I)) := by
  classical
  constructor
  rw [Measure.uniformOfFinset_apply]
  simp [ENNReal.div_self, Fintype.card_ne_zero]

/-- Draw independent uniform sector and label. -/
noncomputable def fairSectorLabelPMF {m : ℕ} (hm : 0 < m) : PMF (Fin m × Bool) := by
  let B := Measure.uniformOfFinset (Finset.univ : Finset Bool)
  let : IsProbabilityMeasure B := uniform_univ_probability Bool
  let : IsProbabilityMeasure (sectorLaw m B) := sectorLaw_probability hm
  exact (sectorLaw m B).toPMF

private theorem measure_diagonal_uniform_sectors {m : ℕ} (hm : 0 < m) :
    let ν := Measure.uniformOfFinset (Finset.univ : Finset (Fin m))
    (ν.prod ν) {p | p.1 = p.2} ≤ (m : ℝ≥0∞)⁻¹ := by
  classical
  let ν := Measure.uniformOfFinset (Finset.univ : Finset (Fin m))
  let C (i : Fin m) := ({i} : Set (Fin m)) ×ˢ {i}
  have hsub : {p : Fin m × Fin m | p.1 = p.2} ⊆ ⋃ i : Fin m, C i := by
    rintro ⟨i,j⟩ h
    change i = j at h
    subst j
    exact mem_iUnion.mpr ⟨i,by simp [C]⟩
  change (ν.prod ν) {p | p.1 = p.2} ≤ _
  refine (measure_mono hsub).trans ((measure_iUnion_le _).trans ?_)
  rw [tsum_fintype]
  have hC (i : Fin m) : (ν.prod ν) (C i) = (m : ℝ≥0∞)⁻¹ * (m : ℝ≥0∞)⁻¹ := by
    change (ν.prod ν) (({i} : Set (Fin m)) ×ˢ {i}) = _
    rw [Measure.prod_prod]
    simp [ν]
  simp only [hC, Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
  have hpos : (m : ℝ≥0∞) ≠ 0 := by exact_mod_cast hm.ne'
  rw [← mul_assoc, ENNReal.mul_inv_cancel hpos (by simp), one_mul]

/-- A union bound over pairs of iid rows. The estimate uses all ordered pairs. -/
theorem measure_collision_fairSectorLabel {m : ℕ} (hm : 0 < m) (n : ℕ) :
    (Measure.pi fun _ : Fin n => (fairSectorLabelPMF hm).toMeasure)
        {p | ¬ Function.Injective (fun i => (p i).1)} ≤
      (n : ℝ≥0∞)^2 * (m : ℝ≥0∞)⁻¹ := by
  classical
  let w := fairSectorLabelPMF hm
  let ν := Measure.uniformOfFinset (Finset.univ : Finset (Fin m))
  let B := Measure.uniformOfFinset (Finset.univ : Finset Bool)
  let μ := Measure.pi fun _ : Fin n => w.toMeasure
  let : IsProbabilityMeasure B := uniform_univ_probability Bool
  have hw : w.toMeasure = ν.prod B := by
    simp [w, fairSectorLabelPMF, sectorLaw, ν, B]
  have hfst : MeasurePreserving Prod.fst w.toMeasure ν := by
    rw [hw]
    exact measurePreserving_fst
  let E (a : Fin n × Fin n) := {p : Fin n → Fin m × Bool | a.1 ≠ a.2 ∧ (p a.1).1 = (p a.2).1}
  have hsub : {p : Fin n → Fin m × Bool | ¬ Function.Injective (fun i => (p i).1)} ⊆ ⋃ a, E a := by
    intro p hp
    change ¬ ∀ i j, (p i).1 = (p j).1 → i = j at hp
    push Not at hp
    obtain ⟨i,j,heq,hne⟩ := hp
    exact mem_iUnion.mpr ⟨(i,j),hne,heq⟩
  have hE (a : Fin n × Fin n) : μ (E a) ≤ (m : ℝ≥0∞)⁻¹ := by
    rcases a with ⟨i,j⟩
    by_cases hij : i = j
    · simp [E, hij]
    let e : Fin 2 → Fin n := ![i,j]
    have he : Function.Injective e := by
      intro a b h
      fin_cases a <;> fin_cases b <;> simp [e, hij, Ne.symm hij] at h ⊢
    have hpair := (hfst.prod hfst).comp ((measurePreserving_finTwoArrow w.toMeasure).comp
      (measurePreserving_product_subtuple (fun _ : Fin n => w.toMeasure) e he))
    let Diag := {p : Fin m × Fin m | p.1 = p.2}
    have hD : MeasurableSet Diag := measurableSet_eq_fun measurable_fst measurable_snd
    have hcalc : μ (E (i,j)) = (ν.prod ν) Diag := by
      rw [← hpair.map_eq, Measure.map_apply hpair.measurable hD]
      congr 1
      ext p
      simp [E, hij, Diag, e, MeasurableEquiv.finTwoArrow]
    rw [hcalc]
    exact measure_diagonal_uniform_sectors hm
  change μ _ ≤ _
  refine (measure_mono hsub).trans ((measure_iUnion_le _).trans ?_)
  rw [tsum_fintype]
  calc
    _ ≤ ∑ _ : Fin n × Fin n, (m : ℝ≥0∞)⁻¹ := Finset.sum_le_sum fun a _ => hE a
    _ = _ := by simp [nsmul_eq_mul, pow_two]

private theorem sectorLabelLaw_eq_map {X : Type} [MeasurableSpace X] {m : ℕ}
    (D : Measure X) [IsProbabilityMeasure D] (w : PMF (Fin m × Bool)) :
    sectorLabelLaw D w = (w.toMeasure.prod D).map (fun p => attachSectorLabel p.1 p.2) := by
  have hf : Measurable (fun p : (Fin m × Bool) × X => attachSectorLabel p.1 p.2) :=
    ((measurable_fst.comp measurable_fst).prodMk measurable_snd).prodMk
      (measurable_snd.comp measurable_fst)
  ext s hs
  rw [sectorLabelLaw, probabilityMixture, Measure.sum_apply _ hs, Measure.map_apply hf hs,
    Measure.prod_apply (hf hs), lintegral_countable']
  apply tsum_congr
  intro a
  rw [Measure.smul_apply, smul_eq_mul, sectorLabelComponent, Measure.map_apply
    (measurable_attachSectorLabel a) hs, PMF.toMeasure_apply_singleton _ _ (measurableSet_singleton a)]
  rw [mul_comm]
  rfl

/-- The fair tagged law has an independent uniform label. -/
theorem sectorLabelLaw_fair_eq_prod {X : Type} [MeasurableSpace X] {m : ℕ}
    (D : Measure X) [IsProbabilityMeasure D] (hm : 0 < m) :
    sectorLabelLaw D (fairSectorLabelPMF hm) = (sectorLaw m D).prod
      (Measure.uniformOfFinset (Finset.univ : Finset Bool)) := by
  let ν := Measure.uniformOfFinset (Finset.univ : Finset (Fin m))
  let B := Measure.uniformOfFinset (Finset.univ : Finset Bool)
  let : IsProbabilityMeasure B := uniform_univ_probability Bool
  have hw : (fairSectorLabelPMF hm).toMeasure = ν.prod B := by
    simp [fairSectorLabelPMF, sectorLaw, ν, B]
  have h₁ := measurePreserving_prodAssoc ν B D
  have h₂ := (MeasurePreserving.id ν).prod (Measure.measurePreserving_swap (μ := B) (ν := D))
  have h₃ := (measurePreserving_prodAssoc ν D B).symm MeasurableEquiv.prodAssoc
  rw [sectorLabelLaw_eq_map, hw]
  exact (h₃.comp (h₂.comp h₁)).map_eq

/-- Under independent fair labels, every measurable binary classifier has
population loss one half, including classifiers outside the benchmark class. -/
theorem population_loss_fair_sector {X : Type} [MeasurableSpace X] {m : ℕ}
    (D : Measure X) [IsProbabilityMeasure D] (hm : 0 < m)
    (f : Fin m × X → Bool) (hf : Measurable f) :
    (∫ p, (if f p.1 = p.2 then (0 : ℝ) else 1) ∂sectorLabelLaw D (fairSectorLabelPMF hm)) = 1/2 := by
  let B := Measure.uniformOfFinset (Finset.univ : Finset Bool)
  let : IsProbabilityMeasure B := uniform_univ_probability Bool
  let : IsProbabilityMeasure (sectorLaw m D) := sectorLaw_probability hm
  let loss (p : (Fin m × X) × Bool) := if f p.1 = p.2 then (0 : ℝ) else 1
  have hmeas : Measurable loss := Measurable.ite (measurableSet_eq_fun (hf.comp measurable_fst)
    measurable_snd) measurable_const measurable_const
  have hi : Integrable loss ((sectorLaw m D).prod B) := Integrable.of_bound hmeas.aestronglyMeasurable 1
    (.of_forall fun p => by simp [loss]; split <;> norm_num)
  change (∫ p, loss p ∂sectorLabelLaw D (fairSectorLabelPMF hm)) = 1/2
  rw [sectorLabelLaw_fair_eq_prod D hm, integral_prod _ hi]
  have hinner (x : Fin m × X) : (∫ b, loss (x,b) ∂B) = 1/2 := by
    rw [integral_fintype Integrable.of_finite]
    cases hx : f x <;> norm_num [loss, hx, Fintype.sum_bool, measureReal_def, B]
  simp [hinner]

/-- The fair-label obstruction quantified using the original generalization
inequality. That external theorem is the explicit final premise. -/
theorem fair_sector_information_lower_bound {X : Type} [MeasurableSpace X]
    (D : Measure X) [IsProbabilityMeasure D] [NullSingletonClass D] {m n : ℕ}
    (hm : 0 < m) (hn : 0 < n) (hsize : 8*n^2 ≤ m)
    (G : Set (Fin m → X)) (hG : (Measure.pi fun _ : Fin m => D) G = 1)
    (r : (Fin n → (Fin m × X) × Bool) → ℝ)
    (hr : AEMeasurable r (Measure.pi fun _ : Fin n => sectorLabelLaw D (fairSectorLabelPMF hm)))
    (hrange : ∀ z, r z ∈ Icc 0 1) {ε I : ℝ} (hε : 0 ≤ ε) (hεsmall : ε ≤ 1/8) (hI : 0 ≤ I)
    (hbound : ∀ z, r z ≤ (⨅ h, empiricalError (groupPredict G) z h) + ε)
    (hgen : 1/2 - (∫ z, r z ∂Measure.pi (fun _ : Fin n => sectorLabelLaw D (fairSectorLabelPMF hm))) ≤
      Real.sqrt (2*I/n)) : (n : ℝ)/32 ≤ I := by
  have hmR : 0 < (m : ℝ) := Nat.cast_pos.mpr hm
  have hnR : 0 < (n : ℝ) := Nat.cast_pos.mpr hn
  have hmass := ENNReal.toReal_mono (by finiteness) (measure_collision_fairSectorLabel hm n)
  have hδ : ((Measure.pi fun _ : Fin n => (fairSectorLabelPMF hm).toMeasure)
      {p | ¬ Function.Injective (fun i => (p i).1)}).toReal ≤ 1/8 := by
    refine hmass.trans ?_
    simp only [ENNReal.toReal_mul, ENNReal.toReal_inv, ENNReal.toReal_pow, ENNReal.toReal_natCast]
    rw [← div_eq_mul_inv, div_le_iff₀ hmR]
    have hs : 8 * (n : ℝ)^2 ≤ m := by exact_mod_cast hsize
    linarith only [hs]
  have hrisk := integral_groupLoss_le_epsilon_add_collision D G hG (fairSectorLabelPMF hm)
    r hr hrange hε hbound
  have hgap : (1/4 : ℝ) ≤ Real.sqrt (2*I/n) := by linarith only [hrisk,hδ,hεsmall,hgen]
  have hsq : (1/4 : ℝ)^2 ≤ (Real.sqrt (2*I/n))^2 := by gcongr
  rw [Real.sq_sqrt (by positivity)] at hsq
  have hnm := (le_div_iff₀ hnR).mp hsq
  linarith only [hnm]

/-- The printed all-class empirical and information rates contradict the
COLT generalization inequality even if the output classifier is improper.
The only external premise is the displayed form of that inequality. -/
theorem exists_fair_sector_vcOne_no_improper_rate_of_generalization (c : ℝ) (hc : 0 ≤ c) :
    ∃ (n m : ℕ) (hm : 0 < m), 0 < n ∧
      let X := Fin m × unitInterval
      let D := sectorLabelLaw (volume : Measure unitInterval) (fairSectorLabelPMF hm)
      ∃ G : Set (Fin m → unitInterval),
        let predict := groupPredict G
        IsProbabilityMeasure D ∧ Function.Injective predict ∧
        Measurable (fun p : X × (Unit ⊕ G) => predict p.2 p.1) ∧
        HasVCDimensionAtMost predict 1 ∧ ¬ HasVCDimensionAtMost predict 0 ∧
        (∀ h, {x : X | predict h x = true}.Finite) ∧
        ∀ (r : (Fin n → X × Bool) → ℝ) (I : ℝ),
          AEMeasurable r (Measure.pi fun _ : Fin n => D) → (∀ z, r z ∈ Icc 0 1) →
          0 ≤ I → I ≤ c →
          (∀ z, r z ≤ (⨅ h, empiricalError predict z h) + c*Real.sqrt (1/(n : ℝ))) →
          (1/2 - (∫ z, r z ∂Measure.pi (fun _ : Fin n => D)) ≤ Real.sqrt (2*I/n)) → False := by
  let n := ⌈64*c^2+32*c⌉₊ + 1
  let m := 8*n^2
  have hn : 0 < n := Nat.succ_pos _
  have hm : 0 < m := by dsimp [m]; positivity
  have hnR : 0 < (n : ℝ) := Nat.cast_pos.mpr hn
  have hnLarge : 64*c^2+32*c < (n : ℝ) := by
    have h := Nat.le_ceil (64*c^2+32*c)
    dsimp [n]
    push_cast
    linarith only [h]
  have hroot : 8*c ≤ Real.sqrt (n : ℝ) := by
    apply (Real.le_sqrt (by positivity) hnR.le).2
    nlinarith only [hnLarge, mul_nonneg (by norm_num : (0:ℝ) ≤ 32) hc]
  have hsmall : c*Real.sqrt (1/(n : ℝ)) ≤ 1/8 := by
    rw [Real.sqrt_div zero_le_one, Real.sqrt_one, mul_one_div, div_le_iff₀ (Real.sqrt_pos.2 hnR)]
    linarith only [hroot]
  refine ⟨n,m,hm,hn,?_⟩
  obtain ⟨G,hG,hi⟩ := exists_fullOuter_coordinateMatching (volume : Measure unitInterval) m
  have hne : G.Nonempty := nonempty_iff_ne_empty.mpr (by
    intro h
    rw [h, measure_empty] at hG
    exact zero_ne_one hG)
  refine ⟨G, sectorLabelLaw_probability _ _, injective_groupPredict hm hi, measurable_groupPredict G,
    vcDimAtMostOne_groupPredict hi, vcDimNotAtMostZero_groupPredict hm hne,
    groupPredict_finite_support G, ?_⟩
  intro r I hr hrange hI hIc hbound hgen
  have hlo := fair_sector_information_lower_bound (volume : Measure unitInterval) hm hn (le_refl m)
    G hG r hr hrange (mul_nonneg hc (Real.sqrt_nonneg _)) hsmall hI hbound hgen
  nlinarith only [hlo,hIc,hnLarge,mul_nonneg (by norm_num : (0:ℝ) ≤ 64) (sq_nonneg c)]

end AgnosticVC
