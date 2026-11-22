module

public import Conjectures.AgnosticVC.CompletedFiniteGroups
public import Mathlib.Probability.Moments.Variance

/-! A sharp uniform-deviation envelope for disjoint finite supports. -/

@[expose] public section

namespace AgnosticVC

open MeasureTheory ProbabilityTheory Set
open scoped BigOperators ENNReal

variable {Z : Type*} [MeasurableSpace Z]

/-- Difference between an iid empirical mean and the population mean. -/
noncomputable def iidDeviation (D : Measure Z) {n : ℕ} (f : Z → ℝ) (s : Fin n → Z) : ℝ :=
  (∑ i, f (s i)) / (n : ℝ) - ∫ z, f z ∂D

private theorem iidDeviation_square_le (D : Measure Z) [IsProbabilityMeasure D]
    {n : ℕ} (hn : 0 < n) (f : Z → ℝ) (hf : Measurable f) (hb : ∀ z, |f z| ≤ 1) :
    (∫⁻ s, ENNReal.ofReal (iidDeviation D f s ^ 2) ∂Measure.pi (fun _ : Fin n => D)) ≤
      ENNReal.ofReal (1 / (n : ℝ)) * ∫⁻ z, ENNReal.ofReal (f z ^ 2) ∂D := by
  let μ := Measure.pi fun _ : Fin n => D
  let g (s : Fin n → Z) := (∑ i, f (s i)) / (n : ℝ)
  have hnR : 0 < (n : ℝ) := Nat.cast_pos.mpr hn
  have hfLp : MemLp f 2 D := MemLp.of_bound hf.aestronglyMeasurable 1
    (Filter.Eventually.of_forall fun z => by simpa only [Real.norm_eq_abs] using hb z)
  have hg : Measurable g := (Finset.measurable_sum _ fun i _ =>
    hf.comp (measurable_pi_apply i)).div_const _
  have hgLp : MemLp g 2 μ := by
    apply MemLp.of_bound hg.aestronglyMeasurable 1
    filter_upwards with s
    rw [Real.norm_eq_abs, show g s = _ from rfl, abs_div, abs_of_nonneg hnR.le,
      div_le_iff₀ hnR, one_mul]
    calc
      _ ≤ ∑ i, |f (s i)| := Finset.abs_sum_le_sum_abs _ _
      _ ≤ ∑ _ : Fin n, (1 : ℝ) := Finset.sum_le_sum fun i _ => hb (s i)
      _ = _ := by simp
  have hi' : Integrable f D := Integrable.of_bound hf.aestronglyMeasurable 1
    (Filter.Eventually.of_forall fun z => by simpa only [Real.norm_eq_abs] using hb z)
  have hEval (i : Fin n) : (∫ s, f (s i) ∂μ) = ∫ z, f z ∂D := by
    have mp := measurePreserving_eval (fun _ : Fin n => D) i
    rw [← mp.map_eq] at hi' ⊢
    exact (integral_map mp.measurable.aemeasurable hi'.aestronglyMeasurable).symm
  have hmean : (∫ s, g s ∂μ) = ∫ z, f z ∂D := by
    unfold g
    rw [integral_div, integral_finsetSum (μ := μ) (f := fun (i : Fin n) (s : Fin n → Z) => f (s i)) _
      (fun i _ => (measurePreserving_eval (fun _ : Fin n => D) i).integrable_comp_of_integrable hi')]
    simp only [hEval, Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
    field_simp
  have hvar : variance g μ = variance f D / (n : ℝ) := by
    have he : g = fun s => (n : ℝ)⁻¹ * ∑ i, f (s i) := by
      funext s
      simp [g, div_eq_inv_mul]
    have hv : variance (fun s : Fin n → Z => ∑ i, f (s i)) μ =
        ∑ _ : Fin n, variance f D := by
      rw [show (fun s : Fin n → Z => ∑ i, f (s i)) = ∑ i : Fin n, (fun s => f (s i)) from
        by funext s; simp [Finset.sum_apply]]
      exact variance_sum_pi (μ := fun _ : Fin n => D) (X := fun _ => f) (fun _ => hfLp)
    rw [he, variance_const_mul, hv]
    simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul]
    field_simp
  have hsq : Integrable (fun z => f z ^ 2) D := hfLp.integrable_sq
  calc
    _ = evariance g μ := by rw [evariance_eq_lintegral_ofReal, hmean]; rfl
    _ = ENNReal.ofReal (variance g μ) := hgLp.ofReal_variance_eq.symm
    _ ≤ ENNReal.ofReal ((1 / (n : ℝ)) * ∫ z, f z ^ 2 ∂D) := by
      rw [hvar, one_div, ← div_eq_inv_mul]
      exact ENNReal.ofReal_le_ofReal
        (div_le_div_of_nonneg_right (variance_le_expectation_sq hfLp.aestronglyMeasurable) hnR.le)
    _ = _ := by
      rw [ENNReal.ofReal_mul (by positivity), ofReal_integral_eq_lintegral_ofReal hsq]
      exact Filter.Eventually.of_forall fun _ => sq_nonneg _

private theorem measurable_iidDeviation (D : Measure Z) {n : ℕ} {f : Z → ℝ} (hf : Measurable f) :
    Measurable (iidDeviation D (n := n) f) := by
  unfold iidDeviation
  exact ((Finset.measurable_sum _ fun i _ => hf.comp (measurable_pi_apply i)).div_const _).sub
    measurable_const

private theorem iidDeviation_sub (D : Measure Z) {n : ℕ} {f g : Z → ℝ}
    (hf : Integrable f D) (hg : Integrable g D) (s : Fin n → Z) :
    iidDeviation D (fun z => f z - g z) s = iidDeviation D f s - iidDeviation D g s := by
  simp only [iidDeviation, integral_sub hf hg, Finset.sum_sub_distrib, sub_div]
  ring

/-- Two distinct iid rows cannot share a feature with zero marginal mass. -/
theorem iid_no_repeat_at_null_singletons {X : Type*} [MeasurableSpace X] [MeasurableEq X]
    (D : Measure (X × Bool)) [IsProbabilityMeasure D] (n : ℕ) :
    ∀ᵐ s ∂(Measure.pi fun _ : Fin n => D), ∀ i j : Fin n, i ≠ j →
      (D.map Prod.fst) {(s i).1} = 0 → (s i).1 ≠ (s j).1 := by
  let M := D.map Prod.fst
  let μ := Measure.pi fun _ : Fin n => D
  have hM : IsProbabilityMeasure M :=
    (Measure.isProbabilityMeasure_map_iff measurable_fst.aemeasurable).mpr inferInstance
  let B : Set (X × X) := {p | p.1 = p.2 ∧ M {p.1} = 0}
  have hdiag : MeasurableSet (diagonal X) := measurableSet_diagonal
  have hpoint : Measurable (fun x : X => M {x}) := by
    have h := measurable_measure_prodMk_left (ν := M) hdiag
    convert h using 1
    funext x
    congr 1
    ext y
    simp [Set.diagonal, eq_comm]
  have hB : MeasurableSet B := hdiag.inter
    (measurableSet_eq_fun (hpoint.comp measurable_fst) measurable_const)
  have hzero (x : X) : M (Prod.mk x ⁻¹' B) = 0 := by
    by_cases hx : M {x} = 0
    · apply measure_mono_null _ hx
      intro y hy
      exact hy.1.symm
    · have he : Prod.mk x ⁻¹' B = ∅ := by
        ext y
        simp [B, hx]
      rw [he, measure_empty]
  have hprod : (M.prod M) B = 0 := by
    rw [Measure.prod_apply hB]
    simp only [hzero, lintegral_zero]
  simp only [ae_all_iff]
  intro i j hij
  let f (i : Fin n) (s : Fin n → X × Bool) := (s i).1
  have hf (i : Fin n) : Measurable (f i) := measurable_fst.comp (measurable_pi_apply i)
  have hi (i : Fin n) : μ.map (f i) = M := by
    change μ.map (Prod.fst ∘ Function.eval i) = _
    rw [← Measure.map_map measurable_fst (measurable_pi_apply i),
      (measurePreserving_eval (fun _ : Fin n => D) i).map_eq]
  have hpair := (iIndepFun_pi (μ := fun _ : Fin n => D)
    (X := fun _ => (Prod.fst : X × Bool → X)) (fun _ => measurable_fst.aemeasurable)).indepFun hij
  have hmap : μ.map (fun s => (f i s, f j s)) = M.prod M := by
    rw [hpair.map_prod_eq_prod_map_map (hf i).aemeasurable (hf j).aemeasurable, hi, hi]
  have hn : μ ((fun s => (f i s, f j s)) ⁻¹' B) = 0 := by
    rw [← Measure.map_apply ((hf i).prodMk (hf j)) hB, hmap, hprod]
  have hae : ∀ᵐ s ∂μ, s ∉ (fun s => (f i s, f j s)) ⁻¹' B := by
    rw [ae_iff]
    simp only [not_not]
    exact hn
  exact hae.mono (fun s houtside hnull he => houtside ⟨he,hnull⟩)

private theorem young_abs_bound {t : ℝ} (ht : 0 < t) (a : ℝ) :
    |a| ≤ t / 2 * a^2 + (1/t)/2 := by
  rw [← sub_nonneg, show t / 2 * a ^ 2 + (1 / t) / 2 - |a| = (t/2) * (|a| - 1/t)^2 by
    rw [← sq_abs a]; field_simp; ring]
  positivity

/-- At every iid law, the loss deviations of the disjoint m-point supports
have a measurable envelope with outer expectation at most 2/sqrt(n) + m/n.
The supremum over the entire hypothesis space need not be measurable. -/
theorem groupPredict_uniform_deviation_envelope {X : Type} [MeasurableSpace X] [MeasurableEq X]
    {m n : ℕ} (hn : 0 < n) {G : Set (Fin m → X)}
    (hG : ∀ i, Set.InjOn (Function.eval i) G)
    (D : Measure ((Fin m × X) × Bool)) [IsProbabilityMeasure D] :
    ∃ E : (Fin n → (Fin m × X) × Bool) → ℝ≥0∞, Measurable E ∧
      (∫⁻ s, E s ∂Measure.pi (fun _ : Fin n => D)) ≤
        ENNReal.ofReal (2 / Real.sqrt (n : ℝ) + (m : ℝ) / n) ∧
      ∀ᵐ s ∂(Measure.pi fun _ : Fin n => D), ∀ h : Unit ⊕ G,
        ENNReal.ofReal
          |iidDeviation D (fun z => if groupPredict G h z.1 = z.2 then 0 else 1) s| ≤ E s := by
  classical
  let : MeasurableEq (Fin m × X) := ⟨by
    rw [show diagonal (Fin m × X) = {p | p.1.1 = p.2.1} ∩ {p | p.1.2 = p.2.2} by
      ext p; simp [diagonal, Prod.ext_iff]]
    exact (measurableSet_eq_fun (measurable_fst.comp measurable_fst) (measurable_fst.comp measurable_snd)).inter
      (measurableSet_eq_fun (measurable_snd.comp measurable_fst) (measurable_snd.comp measurable_snd))⟩
  let Z := (Fin m × X) × Bool
  let H := Unit ⊕ G
  let h₀ : H := Sum.inl ()
  let P (h : H) : Set Z := {z | groupPredict G h z.1 = true}
  let F (h : H) (z : Z) : ℝ := if groupPredict G h z.1 = z.2 then 0 else 1
  let g (h : H) (z : Z) : ℝ := F h z - F h₀ z
  let μ := Measure.pi fun _ : Fin n => D
  have hpred (h : H) : Measurable (fun z : Z => groupPredict G h z.1) :=
    (measurable_groupPredict G).comp (measurable_fst.prodMk measurable_const)
  have hP (h : H) : MeasurableSet (P h) := (hpred h) (measurableSet_singleton true)
  have hF (h : H) : Measurable (F h) := Measurable.ite
    (measurableSet_eq_fun (hpred h) measurable_snd) measurable_const measurable_const
  have hg (h : H) : Measurable (g h) := (hF h).sub (hF h₀)
  have hFB (h : H) (z : Z) : |F h z| ≤ 1 := by unfold F; split <;> norm_num
  have hgval (h : H) (z : Z) : |g h z| = if z ∈ P h then 1 else 0 := by
    rcases z with ⟨x,y⟩
    by_cases hp : groupPredict G h x = true
    · cases y <;> norm_num [g, F, P, h₀, hp]
    · have hp' : groupPredict G h x = false := Bool.eq_false_of_not_eq_true hp
      cases y <;> norm_num [g, F, P, h₀, hp']
  have hgB (h : H) (z : Z) : |g h z| ≤ 1 := by rw [hgval]; split <;> norm_num
  have hFi (h : H) : Integrable (F h) D := Integrable.of_bound (hF h).aestronglyMeasurable 1
    (Filter.Eventually.of_forall fun z => by rw [Real.norm_eq_abs]; exact hFB h z)
  have hdisj : Pairwise (fun h k => Disjoint (P h) (P k)) := by
    intro h k hne
    apply Set.disjoint_left.mpr
    intro z hz hz'
    exact hne (groupPredict_hit_unique hG hz hz')
  let C := {h : H | 0 < D (P h)}
  have hC : C.Countable := Measure.countable_meas_pos_of_disjoint_iUnion hP hdisj
  let : Countable C := hC.to_subtype
  let V₀ (s : Fin n → Z) := ENNReal.ofReal (iidDeviation D (F h₀) s ^ 2)
  let V (s : Fin n → Z) := ∑' h : C, ENNReal.ofReal (iidDeviation D (g h.val) s ^ 2)
  have hV₀ : Measurable V₀ := ENNReal.measurable_ofReal.comp ((measurable_iidDeviation D (hF h₀)).pow_const 2)
  have hV (h : C) : Measurable (fun s : Fin n → Z => ENNReal.ofReal (iidDeviation D (g h.val) s ^ 2)) :=
    ENNReal.measurable_ofReal.comp ((measurable_iidDeviation D (hg h.val)).pow_const 2)
  have hVm : Measurable V := Measurable.tsum hV
  let a := ENNReal.ofReal (1 / (n : ℝ))
  have hV₀mean : (∫⁻ s, V₀ s ∂μ) ≤ a := by
    refine (iidDeviation_square_le D hn (F h₀) (hF h₀) (hFB h₀)).trans ?_
    have hb : (∫⁻ z, ENNReal.ofReal (F h₀ z ^ 2) ∂D) ≤ 1 := by
      calc
        _ ≤ ∫⁻ _ : Z, (1 : ℝ≥0∞) ∂D := lintegral_mono fun z => by
          rw [← ENNReal.ofReal_one]
          apply ENNReal.ofReal_le_ofReal
          rw [← sq_abs (F h₀ z)]
          exact (pow_le_pow_left₀ (abs_nonneg _) (hFB h₀ z) 2).trans_eq (one_pow 2)
        _ = 1 := by rw [lintegral_const, measure_univ, mul_one]
    calc
      _ ≤ a * 1 := by gcongr
      _ = a := mul_one a
  have hVmean : (∫⁻ s, V s ∂μ) ≤ a := by
    have hgmean (h : C) : (∫⁻ z, ENNReal.ofReal (g h.val z ^ 2) ∂D) = D (P h.val) := by
      have he (z : Z) : ENNReal.ofReal (g h.val z ^ 2) = (P h.val).indicator (fun _ => 1) z := by
        rw [← sq_abs (g h.val z), hgval, Set.indicator_apply]
        by_cases hp : z ∈ P h.val <;> simp [hp]
      simp_rw [he]
      rw [lintegral_indicator_const (hP h.val), one_mul]
    have hsum : ∑' h : C, D (P h.val) ≤ 1 := by
      have hd : Pairwise (fun (h k : C) => Disjoint (P h.val) (P k.val)) := fun h k hne =>
        hdisj (fun he => hne (Subtype.ext he))
      rw [← measure_iUnion hd (fun h => hP h.val)]
      exact (measure_mono (subset_univ _)).trans_eq measure_univ
    unfold V
    rw [lintegral_tsum (fun h => (hV h).aemeasurable)]
    calc
      _ ≤ ∑' h : C, a * D (P h.val) := ENNReal.tsum_le_tsum fun h => by
        rw [← hgmean h]
        exact iidDeviation_square_le D hn (g h.val) (hg h.val) (hgB h.val)
      _ = a * (∑' h : C, D (P h.val)) := ENNReal.tsum_mul_left
      _ ≤ a * 1 := by gcongr
      _ = a := mul_one a
  let t := Real.sqrt (n : ℝ)
  have ht : 0 < t := Real.sqrt_pos.mpr (Nat.cast_pos.mpr hn)
  let offset := (1 / t) + (m : ℝ) / n
  have hoff : 0 ≤ offset := by positivity
  let factor := ENNReal.ofReal (t/2)
  let E (s : Fin n → Z) := factor * (V₀ s + V s) + ENNReal.ofReal offset
  have hAdd : Measurable (fun s => V₀ s + V s) := hV₀.add hVm
  have hpart : Measurable (fun s => factor * (V₀ s + V s)) := measurable_const.mul hAdd
  refine ⟨E, hpart.add measurable_const, ?_,?_⟩
  · change (∫⁻ s, factor * (V₀ s + V s) + ENNReal.ofReal offset ∂μ) ≤ _
    rw [lintegral_add_left hpart, lintegral_const, measure_univ, mul_one,
      lintegral_const_mul factor hAdd, lintegral_add_left hV₀]
    calc
      _ ≤ factor * (a + a) + ENNReal.ofReal offset := by gcongr
      _ = _ := by
        unfold a factor offset
        rw [← ENNReal.ofReal_add (by positivity) (by positivity),
          ← ENNReal.ofReal_mul (by positivity), ← ENNReal.ofReal_add (by positivity) hoff]
        congr 1
        have hs : t^2 = (n : ℝ) := Real.sq_sqrt (Nat.cast_nonneg n)
        change t / 2 * (1 / (n : ℝ) + 1 / n) + (1 / t + m / n) = 2 / t + m / n
        rw [← hs]
        field_simp
        ring
  filter_upwards [iid_no_repeat_at_null_singletons D n] with s hno
  intro h
  have hrel := iidDeviation_sub D (hFi h) (hFi h₀) s
  have htri : |iidDeviation D (F h) s| ≤ |iidDeviation D (F h₀) s| + |iidDeviation D (g h) s| := by
    change iidDeviation D (g h) s = iidDeviation D (F h) s - iidDeviation D (F h₀) s at hrel
    rw [hrel]
    simpa only [add_sub_cancel] using
      abs_add_le (iidDeviation D (F h₀) s) (iidDeviation D (F h) s - iidDeviation D (F h₀) s)
  have hgc : ∃ v : ℝ, ENNReal.ofReal (v^2) ≤ V s ∧
      |iidDeviation D (g h) s| ≤ (t/2)*v^2 + (1/t)/2 + (m : ℝ)/n := by
    by_cases hc : h ∈ C
    · refine ⟨iidDeviation D (g h) s, ?_, ?_⟩
      · exact ENNReal.le_tsum (f := fun k : C => ENNReal.ofReal (iidDeviation D (g k.val) s ^ 2)) ⟨h,hc⟩
      exact (young_abs_bound ht _).trans (le_add_of_nonneg_right (by positivity))
    · have hp : D (P h) = 0 := le_antisymm (le_of_not_gt hc) bot_le
      have hzero : (∫ z, g h z ∂D) = 0 := by
        have he : ∀ᵐ z ∂D, g h z = 0 := by
          have hnot : ∀ᵐ z ∂D, z ∉ P h := by
            rw [ae_iff]
            simp only [not_not]
            exact hp
          filter_upwards [hnot] with z hz
          apply abs_eq_zero.mp
          rw [hgval, ite_eq_right hz]
        rw [integral_congr_ae he, integral_zero]
      let I := Finset.univ.filter (fun i : Fin n => s i ∈ P h)
      have hI : I.card ≤ m := by
        have hinj : Set.InjOn (fun i : Fin n => (s i).1.1) (I : Set (Fin n)) := by
          intro i hi j hj he
          by_contra hij
          have hii := (Finset.mem_filter.mp hi).2
          have hjj := (Finset.mem_filter.mp hj).2
          have hsame : (s i).1 = (s j).1 := by
            rcases h with u | w
            · exact (Bool.false_ne_true hii).elim
            · have hwi := (groupPredict_inr_true G w (s i).1).mp hii
              have hwj := (groupPredict_inr_true G w (s j).1).mp hjj
              change (s i).1.1 = (s j).1.1 at he
              rw [← he] at hwj
              exact Prod.ext he (hwi.symm.trans hwj)
          have hnull : (D.map Prod.fst) {(s i).1} = 0 := by
            rw [Measure.map_apply measurable_fst (measurableSet_singleton _)]
            exact measure_mono_null (fun z hz => by
              have hz' : z.1 = (s i).1 := hz
              change groupPredict G h z.1 = true
              rw [hz']
              exact hii) hp
          exact hno i j hij hnull hsame
        rw [← Finset.card_image_of_injOn hinj]
        simpa using Finset.card_le_univ (I.image (fun i => (s i).1.1))
      have hsmall : |iidDeviation D (g h) s| ≤ (m : ℝ) / n := by
        unfold iidDeviation
        rw [hzero, sub_zero, abs_div, abs_of_nonneg (show (0 : ℝ) ≤ n from Nat.cast_nonneg n)]
        apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg n)
        refine (Finset.abs_sum_le_sum_abs _ _).trans ?_
        simp_rw [hgval]
        rw [← Finset.sum_filter, Finset.sum_const, nsmul_eq_mul, mul_one]
        exact_mod_cast hI
      exact ⟨0, by simp, by simpa using hsmall.trans (le_add_of_nonneg_left (show 0 ≤ (1/t)/2 by positivity))⟩
  obtain ⟨v,hv,hvs⟩ := hgc
  change ENNReal.ofReal |iidDeviation D (F h) s| ≤ E s
  calc
    _ ≤ ENNReal.ofReal ((t/2) * ((iidDeviation D (F h₀) s)^2 + v^2) + offset) :=
      ENNReal.ofReal_le_ofReal (by
        unfold offset
        rw [mul_add]
        linarith only [htri, young_abs_bound ht (iidDeviation D (F h₀) s), hvs])
    _ = factor * (V₀ s + ENNReal.ofReal (v^2)) + ENNReal.ofReal offset := by
      unfold factor V₀
      rw [ENNReal.ofReal_add (by positivity) hoff, ENNReal.ofReal_mul (by positivity),
        ENNReal.ofReal_add (sq_nonneg _) (sq_nonneg _)]
    _ ≤ E s := by unfold E; gcongr

end AgnosticVC
