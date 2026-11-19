import Conjectures.LonelinessSixSpectrumFieldsDefs
import Mathlib.Data.Finset.Sort

/-! The terminal checks for complete six-speed support searches. A support
of size six gives one tuple. A support of size five checks every possible
duplicated member. Smaller supports are rejected by this terminal. -/

namespace Loneliness.SixSpectrumFields

def listTuple (ds : List ℕ) : Fin 6 → ℕ := fun i => ds.getD i.val 0

def listRelationsCheck (p : ℕ) (ds : List ℕ) : Bool :=
  decide (ds.length = 6) && twoRelationsCheck p (fun i => (listTuple ds i : ℤ))

def supportRelationsCheck (p : ℕ) (s : Finset ℕ) : Bool :=
  if s.card = 6 then listRelationsCheck p (s.sort (· ≤ ·))
  else if s.card = 5 then
    (s.sort (· ≤ ·)).all (fun a => listRelationsCheck p (a :: s.sort (· ≤ ·)))
  else false

theorem listRelationsCheck_sound (p : ℕ) (ds : List ℕ)
    (h : listRelationsCheck p ds = true) :
    ds.length = 6 ∧ TwoRelations p (fun i => (listTuple ds i : ℤ)) := by
  have hh := Bool.and_eq_true_iff.mp h
  exact ⟨of_decide_eq_true hh.1, twoRelationsCheck_sound p _ hh.2⟩

theorem supportRelationsCheck_cases (p : ℕ) (s : Finset ℕ)
    (h : supportRelationsCheck p s = true) :
    (s.card = 6 ∧ listRelationsCheck p (s.sort (· ≤ ·)) = true) ∨
      (s.card = 5 ∧ ∀ a ∈ s, listRelationsCheck p (a :: s.sort (· ≤ ·)) = true) := by
  by_cases h6 : s.card = 6
  · exact Or.inl ⟨h6, by simpa only [supportRelationsCheck, ite_true, h6] using h⟩
  · by_cases h5 : s.card = 5
    · have hall : (s.sort (· ≤ ·)).all
          (fun a => listRelationsCheck p (a :: s.sort (· ≤ ·))) = true := by
        simpa only [supportRelationsCheck, ite_eq_right h6, ite_eq_left h5] using h
      refine Or.inr ⟨h5, ?_⟩
      intro a ha
      exact List.all_eq_true.mp hall a ((Finset.mem_sort (· ≤ ·)).mpr ha)
    · simp only [supportRelationsCheck, h6, h5, ite_false, Bool.false_eq_true] at h

end Loneliness.SixSpectrumFields
