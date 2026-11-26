import Conjectures.BraunBrueggeBicyclicThetaCount

/-! With positive path lengths and at most one unit path, every theta step
is a distinct graph edge. The vertex and edge numbers differ by one. -/

open Finset
open scoped Sym2

namespace BraunBruegge

variable {length : Fin 3 → ℕ}

theorem theta_vertex_card_add_one (positive : ∀ p, 0 < length p) :
    Fintype.card (ThetaVertex length) + 1 = ∑ p, length p := by
  simp only [ThetaVertex, Fintype.card_sum, Fintype.card_bool, Fintype.card_sigma, Fintype.card_fin, Fin.sum_univ_three]
  have h₀ := positive 0
  have h₁ := positive 1
  have h₂ := positive 2
  omega

private theorem equal_theta_positions_of_different_paths {p q : Fin 3} (hpq : p ≠ q)
    (i : Fin (length p + 1)) (j : Fin (length q + 1)) (e : thetaPosition p i = thetaPosition q j) :
    (i.val = 0 ∧ j.val = 0) ∨ (i.val = length p ∧ j.val = length q) := by
  unfold thetaPosition at e
  split_ifs at e <;> simp_all [thetaStart, thetaFinish]

abbrev ThetaEdgeIndex (length : Fin 3 → ℕ) := Σ p : Fin 3, Fin (length p)

private def thetaStepEdge (a : ThetaEdgeIndex length) : Sym2 (ThetaVertex length) :=
  s(thetaPosition a.1 a.2.castSucc, thetaPosition a.1 a.2.succ)

private theorem thetaStepEdge_injective (short : ∀ p q, length p = 1 → length q = 1 → p = q) :
    Function.Injective (thetaStepEdge (length := length)) := by
  rintro ⟨p, i⟩ ⟨q, j⟩ he
  change s(thetaPosition p i.castSucc, thetaPosition p i.succ) =
    s(thetaPosition q j.castSucc, thetaPosition q j.succ) at he
  by_cases hpq : p = q
  · subst q
    rcases Sym2.eq_iff.mp he with ⟨h, _⟩ | ⟨h₁, h₂⟩
    · have h' := congrArg Fin.val (thetaPosition_injective p h)
      exact congrArg (Sigma.mk p) (Fin.ext h')
    · have h₁' := congrArg Fin.val (thetaPosition_injective p h₁)
      have h₂' := congrArg Fin.val (thetaPosition_injective p h₂)
      simp only [Fin.val_succ, Fin.val_castSucc] at h₁' h₂'
      omega
  · rcases Sym2.eq_iff.mp he with ⟨h₁, h₂⟩ | ⟨h₁, _⟩
    · have h₁' := equal_theta_positions_of_different_paths hpq _ _ h₁
      have h₂' := equal_theta_positions_of_different_paths hpq _ _ h₂
      simp only [Fin.val_succ, Fin.val_castSucc] at h₁' h₂'
      have hi := i.isLt
      have hj := j.isLt
      have hlen₁ : length p = 1 := by omega
      have hlen₂ : length q = 1 := by omega
      exact (hpq (short p q hlen₁ hlen₂)).elim
    · have h := equal_theta_positions_of_different_paths hpq _ _ h₁
      simp only [Fin.val_succ, Fin.val_castSucc] at h
      have hi := i.isLt
      omega

noncomputable def thetaEdgesEquivSteps (short : ∀ p q, length p = 1 → length q = 1 → p = q) :
    ThetaEdgeIndex length ≃ (thetaGraph length).edgeSet := by
  let f (a : ThetaEdgeIndex length) : (thetaGraph length).edgeSet := ⟨thetaStepEdge a, theta_step_adj a.1 a.2⟩
  apply Equiv.ofBijective f
  constructor
  · intro a b h
    exact thetaStepEdge_injective short (congrArg Subtype.val h)
  · rintro ⟨e, he⟩
    induction e using Sym2.inductionOn with
    | hf u v =>
      have h : (thetaGraph length).Adj u v := he
      obtain ⟨p, i, h₁ | h₂⟩ := h.2
      · obtain ⟨rfl, rfl⟩ := h₁
        exact ⟨⟨p, i⟩, rfl⟩
      · obtain ⟨rfl, rfl⟩ := h₂
        exact ⟨⟨p, i⟩, Subtype.ext Sym2.eq_swap⟩

theorem theta_edge_card (short : ∀ p q, length p = 1 → length q = 1 → p = q) :
    Nat.card (thetaGraph length).edgeSet = ∑ p, length p := by
  rw [← Nat.card_congr (thetaEdgesEquivSteps short), Nat.card_eq_fintype_card]
  simp [ThetaEdgeIndex, Fintype.card_sigma]

end BraunBruegge
