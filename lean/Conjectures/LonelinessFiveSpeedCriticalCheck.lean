import Conjectures.LonelinessCriticalFamilies

/-! A finite membership test for containing a critical quadruple.
The entry one in both patterns forces the dilation factor to occur in the
input list, so no unbounded search is needed. -/

namespace Loneliness.FiveSpeedCertificate

open Loneliness.CriticalFamilies

theorem containsCriticalQuadruple_iff_exists_mem (ds : List ℕ) :
    ContainsCriticalQuadruple ds ↔
      ∃ d ∈ ds, 0 < d ∧
        (([1, 2, 3, 4].map (fun a => d * a)) ⊆ ds ∨
          ([1, 3, 4, 7].map (fun a => d * a)) ⊆ ds) := by
  constructor
  · rintro ⟨d, hd, hsub⟩
    refine ⟨d, ?_, hd, hsub⟩
    rcases hsub with h | h
    · exact h (by simp)
    · exact h (by simp)
  · rintro ⟨d, _, hd, hsub⟩
    exact ⟨d, hd, hsub⟩

def containsCriticalCheck (ds : List ℕ) : Bool :=
  ds.any fun d => decide (0 < d ∧
    (([1, 2, 3, 4].map (fun a => d * a)) ⊆ ds ∨
      ([1, 3, 4, 7].map (fun a => d * a)) ⊆ ds))

theorem containsCriticalCheck_iff (ds : List ℕ) :
    containsCriticalCheck ds = true ↔ ContainsCriticalQuadruple ds := by
  rw [containsCriticalQuadruple_iff_exists_mem]
  simp only [containsCriticalCheck, List.any_eq_true, decide_eq_true_eq]

theorem containsCriticalCheck_false_iff (ds : List ℕ) :
    containsCriticalCheck ds = false ↔ ¬ContainsCriticalQuadruple ds := by
  rw [← containsCriticalCheck_iff]
  exact Bool.eq_false_iff

end Loneliness.FiveSpeedCertificate
