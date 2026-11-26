module
public import Conjectures.PomeranceSarkozyRareSlopeTop
public import Mathlib.Topology.Order.IntermediateValue
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Filter MeasureTheory Set
open scoped Topology

theorem gaussianRareCumulant_even (t : ℝ) : gaussianRareCumulant (-t)=gaussianRareCumulant t := by
  let f := gaussianRareCumulantIntegrand t
  have h : ∀ s : ℝ,gaussianRareCumulantIntegrand (-t) s=f (-s) := by
    intro s
    obtain ⟨hp₀,hp₁⟩ := normalTailProbability_mem_Icc s
    unfold f gaussianRareCumulantIntegrand
    rw [normalTailProbability_neg,bernoulliCenteredCumulant_symmetry hp₀ hp₁]
  have hM : MeasurePreserving (fun s : ℝ=>-s) volume volume :=
    ⟨(continuous_neg (G:=ℝ)).measurable,Measure.map_neg_eq_self volume⟩
  have hEmb : MeasurableEmbedding (fun s : ℝ=>-s) :=
    (Homeomorph.neg ℝ).isClosedEmbedding.measurableEmbedding
  unfold gaussianRareCumulant
  simp_rw [h]
  exact hM.integral_comp hEmb f

theorem gaussianRareCumulantSlope_odd (t : ℝ) :
    gaussianRareCumulantSlope (-t)=-gaussianRareCumulantSlope t := by
  have h := (gaussianRareCumulant_hasDerivAt (-t)).2.comp t (hasDerivAt_neg t)
  have he : (gaussianRareCumulant ∘ fun x : ℝ=>-x)=gaussianRareCumulant :=
    funext gaussianRareCumulant_even
  rw [he,mul_neg_one] at h
  have h' := h.unique (gaussianRareCumulant_hasDerivAt t).2
  change -gaussianRareCumulantSlope (-t)=gaussianRareCumulantSlope t at h'
  linarith

theorem gaussianRareCumulantSlope_tendsto_atBot :
    Tendsto gaussianRareCumulantSlope atBot atBot := by
  have h := (tendsto_neg_atTop_atBot.comp gaussianRareCumulantSlope_tendsto_atTop).comp
    (tendsto_neg_atBot_atTop (G:=ℝ))
  refine h.congr (fun x=>?_ )
  change -gaussianRareCumulantSlope (-x)=gaussianRareCumulantSlope x
  rw [gaussianRareCumulantSlope_odd,neg_neg]

theorem continuous_gaussianRareCumulantSlope : Continuous gaussianRareCumulantSlope :=
  continuous_iff_continuousAt.mpr (fun t=>(gaussianRareFirst_hasDerivAt t).2.continuousAt)

theorem exists_unique_gaussianRareCumulant_tilt (x : ℝ) :
    ∃! t : ℝ,gaussianRareCumulantSlope t=x := by
  obtain ⟨a,ha⟩ := (gaussianRareCumulantSlope_tendsto_atBot.eventually_le_atBot x).exists
  obtain ⟨b,hb⟩ := (gaussianRareCumulantSlope_tendsto_atTop.eventually_ge_atTop x).exists
  have hAB : a≤b := gaussianRareCumulantSlope_strictMono.le_iff_le.mp (ha.trans hb)
  have hIV := intermediate_value_Icc hAB continuous_gaussianRareCumulantSlope.continuousOn
  obtain ⟨t,_,ht⟩ := hIV (show x∈Icc (gaussianRareCumulantSlope a) (gaussianRareCumulantSlope b)
    from ⟨ha,hb⟩)
  exact ⟨t,ht,fun z hz=>gaussianRareCumulantSlope_strictMono.injective (hz.trans ht.symm)⟩

noncomputable def gaussianRareRate (x : ℝ) : ℝ :=
  sSup (Set.range fun t : ℝ=>t*x-gaussianRareCumulant t)

/-- The Legendre supremum is attained at the unique interior tilt,
with no appeal to an unformalized large-deviation theorem. -/
theorem gaussianRareRate_isGreatest_at_tilt (x t : ℝ) (ht : gaussianRareCumulantSlope t=x) :
    IsGreatest (Set.range fun z : ℝ=>z*x-gaussianRareCumulant z) (t*x-gaussianRareCumulant t) := by
  let f (z : ℝ) := z*x-gaussianRareCumulant z
  have hD (z : ℝ) : HasDerivAt f (x-gaussianRareCumulantSlope z) z := by
    have hC : HasDerivAt gaussianRareCumulant (gaussianRareCumulantSlope z) z :=
      (gaussianRareCumulant_hasDerivAt z).2
    have hX : HasDerivAt (fun y : ℝ => y * x) x z := by
      simpa only [one_mul,id_eq] using (hasDerivAt_id z).mul_const x
    exact hX.sub hC
  have hF : Differentiable ℝ f := fun z=>(hD z).differentiableAt
  have hL : MonotoneOn f (Iic t) := by
    apply monotoneOn_of_deriv_nonneg (convex_Iic _) hF.continuous.continuousOn hF.differentiableOn
    intro u hu
    rw [(hD u).deriv,← ht]
    have hu' : u≤t := by
      have hm := interior_subset hu
      exact hm
    exact sub_nonneg.mpr (gaussianRareCumulantSlope_strictMono.monotone hu')
  have hR : AntitoneOn f (Ici t) := by
    apply antitoneOn_of_deriv_nonpos (convex_Ici _) hF.continuous.continuousOn hF.differentiableOn
    intro u hu
    rw [(hD u).deriv,← ht]
    have hu' : t≤u := by
      have hm := interior_subset hu
      exact hm
    exact sub_nonpos.mpr (gaussianRareCumulantSlope_strictMono.monotone hu')
  have hTop : ∀ z : ℝ,f z≤f t := by
    intro z
    rcases le_total z t with hz|hz
    · exact hL hz le_rfl hz
    · exact hR le_rfl hz hz
  have hGreatest : IsGreatest (Set.range f) (f t) := ⟨Set.mem_range_self t,by rintro _ ⟨z,rfl⟩; exact hTop z⟩
  exact hGreatest

theorem gaussianRareRate_eq_at_tilt (x t : ℝ) (ht : gaussianRareCumulantSlope t=x) :
    gaussianRareRate x=t*x-gaussianRareCumulant t :=
  (gaussianRareRate_isGreatest_at_tilt x t ht).csSup_eq

theorem le_gaussianRareRate_from_tilt (x t : ℝ) :
    t*x-gaussianRareCumulant t≤gaussianRareRate x := by
  obtain ⟨z,hz,_⟩ := exists_unique_gaussianRareCumulant_tilt x
  rw [gaussianRareRate_eq_at_tilt x z hz]
  exact (gaussianRareRate_isGreatest_at_tilt x z hz).2 (Set.mem_range_self t)

end PomeranceSarkozy
