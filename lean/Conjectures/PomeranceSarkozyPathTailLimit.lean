module
public import Conjectures.PomeranceSarkozyPathWeakLimit

@[expose] public section
namespace PomeranceSarkozy

open MeasureTheory Filter Set
open scoped Topology

/-- The process criterion needs tightness only for a tail of the
sequence. Initial small samples do not enter the analytic estimates. -/
theorem process_pathLaw_tendsto_of_tail_tight (μ : ℕ→ProbabilityMeasure UnitIntervalPath)
    (N : ℕ) (hTight : IsTightMeasureSet (Set.range fun n=>(μ (n+N):Measure UnitIntervalPath)))
    (ν : (s : Finset ProcessTime)→ProbabilityMeasure (↥s→ℝ))
    (hFin : ∀ s,Tendsto (fun n=>(μ n).map (finitePathEvaluation s)) atTop (𝓝 (ν s))) :
    ∃ μ₀ : ProbabilityMeasure UnitIntervalPath,
      Tendsto μ atTop (𝓝 μ₀) ∧ ∀ s,μ₀.map (finitePathEvaluation s)=ν s := by
  obtain ⟨r,h,hR⟩ := process_pathLaw_tendsto_of_tight (fun n=>μ (n+N)) hTight ν
    (fun s=>(hFin s).comp (tendsto_add_atTop_nat N))
  exact ⟨r,(tendsto_add_atTop_iff_nat N).1 h,hR⟩

end PomeranceSarkozy
