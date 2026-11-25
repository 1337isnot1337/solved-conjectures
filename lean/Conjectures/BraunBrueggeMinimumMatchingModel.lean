import Conjectures.BraunBrueggeMinimumAugmenting
import Mathlib.Data.Nat.Find
import Mathlib.SetTheory.Cardinal.Finite
import Mathlib.Combinatorics.SimpleGraph.Connectivity.Connected

/-! Matching endpoints and uncovered vertices partition the vertex type. -/

open Set

namespace BraunBruegge

variable {V M : Type*} {G : SimpleGraph V}

namespace IndexedMatching

abbrev Uncovered (m : IndexedMatching G M) := {v : V // m.Unmatched v}

noncomputable def endpointsEquiv (m : IndexedMatching G M) : (M ⊕ M) ⊕ m.Uncovered ≃ V := by
  classical
  exact (Equiv.sumCongr (Equiv.ofInjective m.endpoints m.endpoints.injective) (Equiv.refl _)).trans
    (Equiv.sumCompl (fun v => v ∈ Set.range m.endpoints))

@[simp] theorem endpointsEquiv_inl (m : IndexedMatching G M) (i : M ⊕ M) :
    m.endpointsEquiv (.inl i) = m.endpoints i := rfl

@[simp] theorem endpointsEquiv_inr (m : IndexedMatching G M) (v : m.Uncovered) :
    m.endpointsEquiv (.inr v) = v.val := rfl

noncomputable def label (m : IndexedMatching G M) (t : M → ℝ) (u : m.Uncovered → ℝ) : V → ℝ :=
  Sum.elim (Sum.elim t (fun i => t i + 1)) u ∘ m.endpointsEquiv.symm

@[simp] theorem label_low (m : IndexedMatching G M) (t : M → ℝ) (u : m.Uncovered → ℝ) (i : M) :
    m.label t u (m.low i) = t i := by
  rw [low, ← m.endpointsEquiv_inl (.inl i)]
  simp only [label, Function.comp_apply, Equiv.symm_apply_apply, Sum.elim_inl]

@[simp] theorem label_high (m : IndexedMatching G M) (t : M → ℝ) (u : m.Uncovered → ℝ) (i : M) :
    m.label t u (m.high i) = t i + 1 := by
  rw [high, ← m.endpointsEquiv_inl (.inr i)]
  simp only [label, Function.comp_apply, Equiv.symm_apply_apply, Sum.elim_inl, Sum.elim_inr]

@[simp] theorem label_uncovered (m : IndexedMatching G M) (t : M → ℝ) (u : m.Uncovered → ℝ)
    (v : m.Uncovered) : m.label t u v.val = u v := by
  rw [← m.endpointsEquiv_inr v]
  simp only [label, Function.comp_apply, Equiv.symm_apply_apply, Sum.elim_inr]

theorem card_eq [Fintype V] [Fintype M] (m : IndexedMatching G M) :
    Fintype.card V = 2 * Fintype.card M + Nat.card m.Uncovered := by
  have h := Nat.card_congr m.endpointsEquiv
  have hv : Nat.card V = Fintype.card V := Nat.card_eq_fintype_card
  have hm : Nat.card M = Fintype.card M := Nat.card_eq_fintype_card
  simp only [Nat.card_sum, hv, hm] at h
  omega

theorem exists_matched_neighbor [Fintype M] [Nontrivial V] (m : IndexedMatching G M)
    (hm : m.IsMaximum) (hG : G.Connected) (u : m.Uncovered) :
    ∃ v : M ⊕ M, G.Adj u.val (m.endpoints v) := by
  obtain ⟨v, he⟩ := hG.preconnected.exists_adj_of_nontrivial u.val
  have hv : v ∈ Set.range m.endpoints := by
    by_contra! hn
    exact unmatched_independent m hm u.property hn he
  obtain ⟨i, rfl⟩ := hv
  exact ⟨i, he⟩

end IndexedMatching

theorem exists_maximum_matching [Fintype V] (G : SimpleGraph V) :
    ∃ (m : ℕ) (M : IndexedMatching G (Fin m)), M.IsMaximum := by
  classical
  let P (n : ℕ) := Nonempty (IndexedMatching G (Fin n))
  have h0 : P 0 := ⟨⟨⟨fun i => isEmptyElim i, fun i _ _ => isEmptyElim i⟩, fun i => i.elim0⟩⟩
  let m := Nat.findGreatest P (Fintype.card V)
  have hm : P m := Nat.findGreatest_spec (Nat.zero_le _) h0
  obtain ⟨M⟩ := hm
  refine ⟨m, M, ?_⟩
  intro k K
  have hcard := Fintype.card_le_of_injective K.endpoints K.endpoints.injective
  simp only [Fintype.card_sum, Fintype.card_fin] at hcard ⊢
  exact Nat.le_findGreatest (by omega) ⟨K⟩

end BraunBruegge
