module

public import Conjectures.AgnosticVC.CountableCandidateERM
public import Conjectures.AgnosticVC.OrbitWitnesses

/-! The circle-orbit class admits a Borel deterministic ERM even though no globally
ordered ERM is measurable for the completed iid Haar experiment. -/

@[expose] public section

open MeasureTheory

namespace AgnosticVC

/-- A deterministic proper ERM on all samples of the circle-orbit class, using
measurable sample-dependent candidates to break ties. -/
theorem circleOrbit_exists_measurableERM :
    ∃ learn : (n : ℕ) → (Fin n → (UnitAddCircle × Bool) × Bool) → UnitAddCircle,
      (∀ n, Measurable (learn n)) ∧
      ∀ n z h, ermMistakes (orbitPredict irrationalCircleSubgroup) z (learn n z) ≤
        ermMistakes (orbitPredict irrationalCircleSubgroup) z h := by
  have per_size (n : ℕ) :
      ∃ learn : (Fin n → (UnitAddCircle × Bool) × Bool) → UnitAddCircle,
        Measurable learn ∧
        ∀ z h, ermMistakes (orbitPredict irrationalCircleSubgroup) z (learn z) ≤
          ermMistakes (orbitPredict irrationalCircleSubgroup) z h := by
    obtain ⟨candidate, hcandidate, hcover⟩ := exists_measurable_circleOrbitTraceCandidates n
    let features (z : Fin n → (UnitAddCircle × Bool) × Bool) (i : Fin n) := (z i).1
    have hfeatures : Measurable features :=
      Measurable.of_eval fun i => measurable_fst.comp (measurable_pi_apply i)
    exact exists_measurable_erm_of_countable_candidates (orbitPredict irrationalCircleSubgroup)
      (measurable_orbitPredict _) (fun j => candidate j ∘ features)
      (fun j => (hcandidate j).comp hfeatures) (fun z h => hcover (features z) h)
  choose learn hmeas hmin using per_size
  exact ⟨learn, hmeas, hmin⟩

end AgnosticVC
