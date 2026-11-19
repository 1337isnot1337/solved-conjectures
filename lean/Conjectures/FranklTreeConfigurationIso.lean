module

public import Conjectures.FranklTreeConfigurations
public import Mathlib.Combinatorics.SimpleGraph.Maps

/-! Graph isomorphisms preserve the actual three configuration states.
All permissions and exterior domination are pulled back along the vertex
bijection; the distinguished root is tracked explicitly. -/
@[expose] public section

namespace FranklTreeConfigurations

open SimpleGraph FranklTreeGluing

variable {V W : Type*}

def setPullbackEquiv (e : V ≃ W) : Set W ≃ Set V where
  toFun S := e ⁻¹' S
  invFun S := e.symm ⁻¹' S
  left_inv S := by
    ext v
    simp only [Set.mem_preimage, Equiv.apply_symm_apply]
  right_inv S := by
    ext v
    simp only [Set.mem_preimage, Equiv.symm_apply_apply]

variable {G : SimpleGraph V} {H : SimpleGraph W}

theorem independent_pullback_iff (e : G ≃g H) (S : Set W) :
    G.IsIndepSet (e ⁻¹' S) ↔ H.IsIndepSet S := by
  constructor
  · intro h u hu v hv _ hadj
    have hu' : e.symm u ∈ e ⁻¹' S := by simpa using hu
    have hv' : e.symm v ∈ e ⁻¹' S := by simpa using hv
    have hback := e.symm.map_adj_iff.mpr hadj
    exact h hu' hv' hback.ne hback
  · intro h u hu v hv _ hadj
    have hforward := e.map_adj_iff.mpr hadj
    exact h hu hv hforward.ne hforward

theorem dominated_pullback_iff (e : G ≃g H) (outside S : Set W) (v : V) :
    Dominated G (e ⁻¹' outside) (e ⁻¹' S) v ↔ Dominated H outside S (e v) := by
  constructor
  · rintro (h | ⟨w, hw, hadj⟩)
    · exact Or.inl h
    · exact Or.inr ⟨e w, hw, e.map_adj_iff.mpr hadj⟩
  · rintro (h | ⟨w, hw, hadj⟩)
    · exact Or.inl h
    · refine Or.inr ⟨e.symm w, ?_, ?_⟩
      · simpa using hw
      · apply e.map_adj_iff.mp
        simpa using hadj

theorem valid_pullback_iff (e : G ≃g H) (root : V)
    (outside canSelect canOmit S : Set W) :
    Valid G root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit) (e ⁻¹' S) ↔
      Valid H (e root) outside canSelect canOmit S := by
  constructor
  · intro h
    refine ⟨(independent_pullback_iff e S).mp h.independent, ?_, ?_, ?_⟩
    · intro v hv
      have hv' : e.symm v ∈ e ⁻¹' S := by simpa using hv
      have hs := h.selected_allowed hv'
      simpa using hs
    · intro v hv
      have hv' : e.symm v ∉ e ⁻¹' S := by simpa using hv
      have hs := h.omitted_allowed hv'
      simpa using hs
    · intro v hvr hv
      have hneq : e.symm v ≠ root := by
        intro heq
        exact hvr (by simpa using congrArg e heq)
      have hv' : e.symm v ∉ e ⁻¹' S := by simpa using hv
      have hd := h.dominates_away (e.symm v) hneq hv'
      simpa using (dominated_pullback_iff e outside S (e.symm v)).mp hd
  · intro h
    refine ⟨(independent_pullback_iff e S).mpr h.independent, ?_, ?_, ?_⟩
    · intro v hv
      exact h.selected_allowed hv
    · intro v hv
      exact h.omitted_allowed hv
    · intro v hvr hv
      apply (dominated_pullback_iff e outside S v).mpr
      exact h.dominates_away (e v) (fun heq => hvr (e.injective heq)) hv

def occupiedIsoEquiv (e : G ≃g H) (root : V)
    (outside canSelect canOmit : Set W) :
    Occupied H (e root) outside canSelect canOmit ≃
    Occupied G root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit) :=
  (setPullbackEquiv e.toEquiv).subtypeEquiv (fun S => by
    change (Valid H (e root) outside canSelect canOmit S ∧ e root ∈ S) ↔
      (Valid G root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit) (e ⁻¹' S) ∧
        root ∈ e ⁻¹' S)
    rw [valid_pullback_iff]
    rfl)

def dominatedIsoEquiv (e : G ≃g H) (root : V)
    (outside canSelect canOmit : Set W) :
    Dom H (e root) outside canSelect canOmit ≃
    Dom G root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit) :=
  (setPullbackEquiv e.toEquiv).subtypeEquiv (fun S => by
    change (Valid H (e root) outside canSelect canOmit S ∧ e root ∉ S ∧
      Dominated H outside S (e root)) ↔
      (Valid G root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit) (e ⁻¹' S) ∧
        root ∉ e ⁻¹' S ∧ Dominated G (e ⁻¹' outside) (e ⁻¹' S) root)
    rw [valid_pullback_iff, dominated_pullback_iff]
    rfl)

def needsParentIsoEquiv (e : G ≃g H) (root : V)
    (outside canSelect canOmit : Set W) :
    NeedsParent H (e root) outside canSelect canOmit ≃
    NeedsParent G root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit) :=
  (setPullbackEquiv e.toEquiv).subtypeEquiv (fun S => by
    change (Valid H (e root) outside canSelect canOmit S ∧ e root ∉ S ∧
      ¬Dominated H outside S (e root)) ↔
      (Valid G root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit) (e ⁻¹' S) ∧
        root ∉ e ⁻¹' S ∧ ¬Dominated G (e ⁻¹' outside) (e ⁻¹' S) root)
    rw [valid_pullback_iff, dominated_pullback_iff]
    rfl)

def finishedIsoEquiv (e : G ≃g H) (root : V)
    (outside canSelect canOmit : Set W) :
    Finished H (e root) outside canSelect canOmit ≃
    Finished G root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit) :=
  (setPullbackEquiv e.toEquiv).subtypeEquiv (fun S => by
    change (Valid H (e root) outside canSelect canOmit S ∧
      (e root ∈ S ∨ Dominated H outside S (e root))) ↔
      (Valid G root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit) (e ⁻¹' S) ∧
        (root ∈ e ⁻¹' S ∨ Dominated G (e ⁻¹' outside) (e ⁻¹' S) root))
    rw [valid_pullback_iff, dominated_pullback_iff]
    rfl)

theorem occupied_card_iso (e : G ≃g H) (root : V)
    (outside canSelect canOmit : Set W) :
    Nat.card (Occupied H (e root) outside canSelect canOmit) =
    Nat.card (Occupied G root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit)) :=
  Nat.card_congr (occupiedIsoEquiv e root outside canSelect canOmit)

theorem dominated_card_iso (e : G ≃g H) (root : V)
    (outside canSelect canOmit : Set W) :
    Nat.card (Dom H (e root) outside canSelect canOmit) =
    Nat.card (Dom G root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit)) :=
  Nat.card_congr (dominatedIsoEquiv e root outside canSelect canOmit)

theorem needsParent_card_iso (e : G ≃g H) (root : V)
    (outside canSelect canOmit : Set W) :
    Nat.card (NeedsParent H (e root) outside canSelect canOmit) =
    Nat.card (NeedsParent G root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit)) :=
  Nat.card_congr (needsParentIsoEquiv e root outside canSelect canOmit)

theorem finished_card_iso (e : G ≃g H) (root : V)
    (outside canSelect canOmit : Set W) :
    Nat.card (Finished H (e root) outside canSelect canOmit) =
    Nat.card (Finished G root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit)) :=
  Nat.card_congr (finishedIsoEquiv e root outside canSelect canOmit)

end FranklTreeConfigurations
