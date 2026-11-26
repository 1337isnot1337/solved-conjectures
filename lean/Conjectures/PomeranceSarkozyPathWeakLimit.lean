module
public import Conjectures.PomeranceSarkozyPathFiniteLaws
public import Mathlib.MeasureTheory.Measure.Prokhorov

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory Filter Set
open scoped Topology

/-- Tight continuous paths with convergent finite-dimensional laws
have a unique weak limit. It is obtained as a cluster law, so no
separate continuous Gaussian-path extension is assumed. -/
theorem process_pathLaw_tendsto_of_tight (μ : ℕ→ProbabilityMeasure UnitIntervalPath)
    (hTight : IsTightMeasureSet (Set.range fun n=>(μ n:Measure UnitIntervalPath)))
    (ν : (s : Finset ProcessTime)→ProbabilityMeasure (↥s→ℝ))
    (hFin : ∀ s,Tendsto (fun n=>(μ n).map (finitePathEvaluation s)) atTop (𝓝 (ν s))) :
    ∃ μ₀ : ProbabilityMeasure UnitIntervalPath,
      Tendsto μ atTop (𝓝 μ₀) ∧ ∀ s,μ₀.map (finitePathEvaluation s)=ν s := by
  have hC : IsCompact (closure (Set.range μ)) :=
    isCompact_closure_of_isTightMeasureSet (by
      change IsTightMeasureSet {(η:Measure UnitIntervalPath) | η∈Set.range μ}
      convert hTight using 1
      ext η
      simp)
  have hR : ∀ᶠ n in atTop,μ n∈closure (Set.range μ) :=
    Filter.Eventually.of_forall (fun n=>subset_closure (Set.mem_range_self n))
  obtain ⟨μ₀,_,hμ₀⟩ := hC.exists_mapClusterPt (le_principal_iff.mpr (mem_map.mpr hR))
  have hCluster (η : ProbabilityMeasure UnitIntervalPath) (hη : MapClusterPt η atTop μ)
      (s : Finset ProcessTime) : η.map (finitePathEvaluation s)=ν s := by
    have hCont : ContinuousAt (fun z : ProbabilityMeasure UnitIntervalPath => z.map (finitePathEvaluation s)) η :=
      (ProbabilityMeasure.continuous_map (continuous_finitePathEvaluation s)).continuousAt
    have hc := hη.continuousAt_comp hCont
    have hp : ClusterPt (η.map (finitePathEvaluation s)) (𝓝 (ν s)) :=
      hc.clusterPt.mono (hFin s)
    by_contra! hne
    exact hp.neBot.ne ((disjoint_nhds_nhds.mpr hne).eq_bot)
  refine ⟨μ₀,hC.tendsto_nhds_of_unique_mapClusterPt hR (fun η _ hη=>?_),
    hCluster μ₀ hμ₀⟩
  exact pathMeasure_ext_finitedim η μ₀ (fun s=>(hCluster η hη s).trans (hCluster μ₀ hμ₀ s).symm)

end PomeranceSarkozy
