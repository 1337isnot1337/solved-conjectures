import Mathlib.Combinatorics.Enumerative.InclusionExclusion
import Mathlib.Data.Fintype.Perm
import Mathlib.Tactic

/-! The actual permutations and signed adjacency selection in §1. -/

open scoped BigOperators

namespace KauersKoutschan

/-- The first vertex of a directed adjacency on one of the two parity chains. -/
def lower {n : ℕ} (i : Fin (n - 2)) : Fin n :=
  ⟨i, by have := i.isLt; omega⟩

/-- The second vertex of the same directed adjacency. -/
def upper {n : ℕ} (i : Fin (n - 2)) : Fin n :=
  ⟨(i : ℕ) + 2, by have := i.isLt; omega⟩

/-- The literal A189281 avoidance predicate, on zero-based indices and values. -/
def avoidsStepTwo {n : ℕ} (p : Equiv.Perm (Fin n)) : Prop :=
  ∀ i : Fin (n - 2), (p (upper i) : ℕ) ≠ (p (lower i) : ℕ) + 2

private def valueEdge {n : ℕ} (p : Equiv.Perm (Fin n)) (i : Fin (n - 2)) : Prop :=
  (p.symm (upper i) : ℕ) = (p.symm (lower i) : ℕ) + 2

private theorem avoidsStepTwo_iff_no_valueEdge {n : ℕ} (p : Equiv.Perm (Fin n)) :
    avoidsStepTwo p ↔ ∀ e, ¬ valueEdge p e := by
  constructor
  · intro h e he
    have hh := (p.symm (upper e)).isLt
    let i : Fin (n - 2) := ⟨p.symm (lower e), by unfold valueEdge at he; omega⟩
    have hlo : lower i = p.symm (lower e) := Fin.ext rfl
    have hhi : upper i = p.symm (upper e) := Fin.ext he.symm
    apply h i
    rw [hlo, hhi, Equiv.apply_symm_apply, Equiv.apply_symm_apply]
    rfl
  · intro h i hi
    have hh := (p (upper i)).isLt
    let e : Fin (n - 2) := ⟨p (lower i), by omega⟩
    have hlo : lower e = p (lower i) := Fin.ext rfl
    have hhi : upper e = p (upper i) := Fin.ext hi.symm
    apply h e
    unfold valueEdge
    rw [hlo, hhi, Equiv.symm_apply_apply, Equiv.symm_apply_apply]
    rfl

noncomputable def permutationCount (n : ℕ) : ℕ := by
  classical
  exact (Finset.univ.filter (avoidsStepTwo (n := n))).card

/-- The permutations realizing a given adjacency of the value chains. -/
noncomputable def edgeEvent {n : ℕ} (i : Fin (n - 2)) : Finset (Equiv.Perm (Fin n)) := by
  classical
  exact Finset.univ.filter (fun p => valueEdge p i)

/-- Inclusion–exclusion over the original ordered value adjacencies. Each selected
subset contributes the signed number of permutations realizing every edge. -/
theorem permutationCount_inclusion_exclusion (n : ℕ) :
    (permutationCount n : ℤ) =
      ∑ s ∈ (Finset.univ : Finset (Fin (n - 2))).powerset,
        (-1 : ℤ) ^ s.card * (s.inf edgeEvent).card := by
  classical
  have hvalid : (Finset.univ : Finset (Fin (n - 2))).inf (fun i => (edgeEvent i)ᶜ) =
      Finset.univ.filter (avoidsStepTwo (n := n)) := by
    ext p
    have hmem (s : Finset (Fin (n - 2))) :
        p ∈ s.inf (fun i => (edgeEvent i)ᶜ) ↔ ∀ i ∈ s, ¬valueEdge p i := by
      induction s using Finset.induction_on with
      | empty => simp
      | insert i s _ ih =>
        rw [Finset.inf_insert]
        change (p ∈ (edgeEvent i)ᶜ ∩ s.inf (fun i => (edgeEvent i)ᶜ)) ↔ _
        rw [Finset.mem_inter, ih]
        simp [edgeEvent]
    simp [hmem, avoidsStepTwo_iff_no_valueEdge]
  rw [permutationCount, ← hvalid, Finset.inclusion_exclusion_card_inf_compl]

end KauersKoutschan
