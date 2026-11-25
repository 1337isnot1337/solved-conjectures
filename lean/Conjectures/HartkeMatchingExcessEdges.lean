import Conjectures.HartkeMatchingExcessSplit
import Mathlib.Combinatorics.SimpleGraph.Operations
import Lean.Elab.Tactic.Omega

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

Exact edge counts in the split-clique construction. The undeleted graph
without return arcs has `(R+1)^2` actual unordered edges: an ordered pair
`(i,j)` encodes a cross edge when `i ≤ j` and a left-clique edge otherwise.
-/

namespace HartkeMatchingExcess

open SimpleGraph Finset

def baseGraph (R : ℕ) : SimpleGraph (Fin (R + 1) ⊕ Fin (R + 1)) :=
  splitGraph (fun i j => i ≤ j)

def baseEdgeMap (R : ℕ) (p : Fin (R + 1) × Fin (R + 1)) : (baseGraph R).edgeSet :=
  if hp : p.1 ≤ p.2 then ⟨s(Sum.inl p.1, Sum.inr p.2), hp⟩
  else ⟨s(Sum.inl p.1, Sum.inl p.2), fun he => hp he.le⟩

theorem baseEdgeMap_injective (R : ℕ) : Function.Injective (baseEdgeMap R) := by
  rintro ⟨i, j⟩ ⟨k, l⟩ h
  have hv := congrArg Subtype.val h
  by_cases hij : i ≤ j <;> by_cases hkl : k ≤ l
  · simpa [baseEdgeMap, hij, hkl, Sym2.eq_iff] using hv
  · simp [baseEdgeMap, hij, hkl] at hv
  · simp [baseEdgeMap, hij, hkl] at hv
  · simp only [baseEdgeMap, hij, hkl, ↓reduceDIte, Sym2.eq_iff, Sum.inl.injEq] at hv
    rcases hv with ⟨rfl, rfl⟩ | ⟨hil, hjk⟩
    · rfl
    · have hil' := congrArg Fin.val hil
      have hjk' := congrArg Fin.val hjk
      omega

theorem baseEdgeMap_surjective (R : ℕ) : Function.Surjective (baseEdgeMap R) := by
  rintro ⟨⟨x, y⟩, hxy⟩
  cases x with
  | inl i =>
    cases y with
    | inl j =>
      change i ≠ j at hxy
      by_cases hij : i ≤ j
      · have hji : ¬j ≤ i := by
          intro hji
          exact hxy (le_antisymm hij hji)
        refine ⟨(j, i), ?_⟩
        apply Subtype.ext
        simp only [baseEdgeMap, hji, ↓reduceDIte]
        exact Sym2.eq_swap
      · refine ⟨(i, j), ?_⟩
        apply Subtype.ext
        simp only [baseEdgeMap, hij, ↓reduceDIte]
    | inr j =>
      change i ≤ j at hxy
      refine ⟨(i, j), ?_⟩
      apply Subtype.ext
      simp only [baseEdgeMap, hxy, ↓reduceDIte]
  | inr i =>
    cases y with
    | inl j =>
      change j ≤ i at hxy
      refine ⟨(j, i), ?_⟩
      apply Subtype.ext
      simp only [baseEdgeMap, hxy, ↓reduceDIte]
      exact Sym2.eq_swap
    | inr j => exact False.elim hxy

theorem baseGraph_edge_card (R : ℕ) :
    Nat.card (baseGraph R).edgeSet = (R + 1) ^ 2 := by
  have h := Nat.card_congr
    (Equiv.ofBijective (baseEdgeMap R) ⟨baseEdgeMap_injective R, baseEdgeMap_surjective R⟩)
  simpa [Nat.card_prod, pow_two] using h.symm

theorem baseGraph_edgeFinset_card (R : ℕ) :
    letI : DecidableRel (baseGraph R).Adj := Classical.decRel _
    (baseGraph R).edgeFinset.card = (R + 1) ^ 2 := by
  classical
  rw [SimpleGraph.edgeFinset_card, ← Nat.card_eq_fintype_card]
  exact baseGraph_edge_card R

end HartkeMatchingExcess
