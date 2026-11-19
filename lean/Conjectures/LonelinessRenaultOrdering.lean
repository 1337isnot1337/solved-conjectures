import Mathlib.Data.Fin.VecNotation
import Mathlib.Data.Fintype.Powerset

/-! A finite relabeling lemma for five indices. Index zero is fixed, and
the other at most two members of a selected set are moved to indices one
and two. The table contains genuine permutations, checked in the kernel. -/

namespace Loneliness.Renault

def caseOrder : Fin 9 → Fin 5 → Fin 5 :=
  ![![0, 1, 2, 3, 4],
    ![0, 2, 1, 3, 4],
    ![0, 3, 1, 2, 4],
    ![0, 4, 1, 2, 3],
    ![0, 1, 3, 2, 4],
    ![0, 1, 4, 2, 3],
    ![0, 2, 3, 1, 4],
    ![0, 2, 4, 1, 3],
    ![0, 3, 4, 1, 2]]

theorem caseOrder_bijective : ∀ k, Function.Bijective (caseOrder k) := by
  decide +kernel

theorem caseOrder_zero : ∀ k, caseOrder k 0 = 0 := by
  decide +kernel

noncomputable def caseEquiv (k : Fin 9) : Equiv.Perm (Fin 5) :=
  Equiv.ofBijective (caseOrder k) (caseOrder_bijective k)

theorem caseEquiv_zero (k : Fin 9) : caseEquiv k 0 = 0 := caseOrder_zero k

def OrderedSet (E : Finset (Fin 5)) (k : Fin 9) : Prop :=
  (∀ i, i ≠ 0 → caseOrder k i ∉ E) ∨
  (caseOrder k 1 ∈ E ∧ ∀ i, i ≠ 0 → i ≠ 1 → caseOrder k i ∉ E) ∨
  (caseOrder k 1 ∈ E ∧ caseOrder k 2 ∈ E ∧
    ∀ i, i ≠ 0 → i ≠ 1 → i ≠ 2 → caseOrder k i ∉ E)

instance (E : Finset (Fin 5)) (k : Fin 9) : Decidable (OrderedSet E k) :=
  inferInstanceAs (Decidable (_ ∨ _ ∨ _))

theorem exists_caseOrder : ∀ E : Finset (Fin 5),
    0 ∈ E → E.card ≤ 3 → ∃ k : Fin 9, OrderedSet E k := by
  decide +kernel

end Loneliness.Renault
