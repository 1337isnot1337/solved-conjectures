import Conjectures.LonelinessModularWitness

/-! A finite table separates listed exceptions from tuples having an
explicit rational witness with clearance at least one fifth. -/

namespace Loneliness.FiveSpeedCertificate

structure RationalCandidate where
  speeds : List ℕ
  denominator : ℕ
  numerator : ℕ
  deriving Repr

def rationalCandidateCheck (exceptions : List (List ℕ)) (entry : RationalCandidate) : Bool :=
  decide (entry.speeds ∈ exceptions) ||
    decide (0 < entry.denominator ∧
      Loneliness.Modular.Witness 5 entry.denominator entry.numerator entry.speeds)

theorem rationalCandidateCheck_sound (exceptions : List (List ℕ)) (entry : RationalCandidate)
    (hcheck : rationalCandidateCheck exceptions entry = true) :
    entry.speeds ∈ exceptions ∨ (1 / 5 : ℝ) ≤ Loneliness.value entry.speeds := by
  rcases Bool.or_eq_true_iff.mp hcheck with he | hw
  · exact Or.inl (of_decide_eq_true he)
  · have hh := of_decide_eq_true hw
    exact Or.inr (Loneliness.Modular.witness_value_lower (by decide) hh.1 hh.2)

def candidateTableCheck (exceptions : List (List ℕ)) (entries : List RationalCandidate) : Bool :=
  entries.all (rationalCandidateCheck exceptions)

theorem candidateTableCheck_low (exceptions : List (List ℕ)) (entries : List RationalCandidate)
    (hcheck : candidateTableCheck exceptions entries = true) (speeds : List ℕ)
    (hmem : speeds ∈ entries.map RationalCandidate.speeds)
    (hlow : Loneliness.value speeds < (1 / 5 : ℝ)) : speeds ∈ exceptions := by
  obtain ⟨entry, hentry, rfl⟩ := List.mem_map.mp hmem
  have hall := List.all_eq_true.mp hcheck
  rcases rationalCandidateCheck_sound exceptions entry (hall entry hentry) with he | hw
  · exact he
  · exact (not_le_of_gt hlow hw).elim

end Loneliness.FiveSpeedCertificate
