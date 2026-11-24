import Conjectures.HartkeMatchingExcessMates

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

The source's two-vertex extension: a new universal old-neighbor vertex and
a leaf adjacent only to it. Restriction and extension give an equivalence
of the actual spanning perfect matchings.
-/

namespace HartkeMatchingExcess

open SimpleGraph

variable {V : Type*} {G : SimpleGraph V}

def extendGraph (G : SimpleGraph V) : SimpleGraph (V ⊕ Bool) where
  Adj x y := match x, y with
    | .inl v, .inl w => G.Adj v w
    | .inl _, .inr b => b = false
    | .inr b, .inl _ => b = false
    | .inr a, .inr b => a ≠ b
  symm := ⟨by
    intro x y h
    cases x with
    | inl v => cases y with
      | inl w => exact h.symm
      | inr b => exact h
    | inr a => cases y with
      | inl w => exact h
      | inr b => exact Ne.symm h⟩
  loopless := ⟨by intro x; cases x <;> simp⟩

noncomputable def extendedMate (M : PerfectMatching G) : V ⊕ Bool → V ⊕ Bool
  | .inl v => .inl (mate M v)
  | .inr b => .inr (!b)

theorem extendedMate_involutive (M : PerfectMatching G) :
    Function.Involutive (extendedMate M) := by
  intro x
  cases x with
  | inl v => exact congrArg Sum.inl (mate_involutive M v)
  | inr b => simp [extendedMate]

theorem extendedMate_adj (M : PerfectMatching G) (x : V ⊕ Bool) :
    (extendGraph G).Adj x (extendedMate M x) := by
  cases x with
  | inl v => exact mate_graph_adj M v
  | inr b => cases b <;> simp [extendedMate, extendGraph]

noncomputable def extendMatching (M : PerfectMatching G) : PerfectMatching (extendGraph G) :=
  perfectMatchingOfInvolution (extendedMate M) (extendedMate_involutive M) (extendedMate_adj M)

theorem mate_extendMatching (M : PerfectMatching G) (x : V ⊕ Bool) :
    mate (extendMatching M) x = extendedMate M x :=
  mate_perfectMatchingOfInvolution _ _ _ x

theorem extendGraph_leaf_adj (w : V ⊕ Bool) :
    (extendGraph G).Adj (Sum.inr true) w ↔ w = Sum.inr false := by
  cases w with
  | inl v => simp [extendGraph]
  | inr b => cases b <;> simp [extendGraph]

theorem mate_extended_leaf (N : PerfectMatching (extendGraph G)) :
    mate N (Sum.inr true) = Sum.inr false :=
  (extendGraph_leaf_adj _).mp (mate_graph_adj N _)

theorem mate_extended_hub (N : PerfectMatching (extendGraph G)) :
    mate N (Sum.inr false) = Sum.inr true := by
  have h := mate_involutive N (Sum.inr true)
  rwa [mate_extended_leaf] at h

theorem extended_old_mate_exists (N : PerfectMatching (extendGraph G)) (v : V) :
    ∃ w : V, mate N (Sum.inl v) = Sum.inl w := by
  cases h : mate N (Sum.inl v) with
  | inl w => exact ⟨w, rfl⟩
  | inr b =>
    cases b with
    | false =>
      have he : Sum.inl v = Sum.inr true :=
        mate_injective N (h.trans (mate_extended_leaf N).symm)
      cases he
    | true =>
      have he : Sum.inl v = Sum.inr false :=
        mate_injective N (h.trans (mate_extended_hub N).symm)
      cases he

noncomputable def restrictedMate (N : PerfectMatching (extendGraph G)) (v : V) : V :=
  Classical.choose (extended_old_mate_exists N v)

theorem restrictedMate_spec (N : PerfectMatching (extendGraph G)) (v : V) :
    mate N (Sum.inl v) = Sum.inl (restrictedMate N v) :=
  Classical.choose_spec (extended_old_mate_exists N v)

theorem restrictedMate_involutive (N : PerfectMatching (extendGraph G)) :
    Function.Involutive (restrictedMate N) := by
  intro v
  have h := mate_involutive N (Sum.inl v)
  rw [restrictedMate_spec N v, restrictedMate_spec] at h
  exact Sum.inl_injective h

theorem restrictedMate_adj (N : PerfectMatching (extendGraph G)) (v : V) :
    G.Adj v (restrictedMate N v) := by
  have h := mate_graph_adj N (Sum.inl v)
  rw [restrictedMate_spec] at h
  exact h

noncomputable def restrictMatching (N : PerfectMatching (extendGraph G)) : PerfectMatching G :=
  perfectMatchingOfInvolution (restrictedMate N)
    (restrictedMate_involutive N) (restrictedMate_adj N)

theorem mate_restrictMatching (N : PerfectMatching (extendGraph G)) (v : V) :
    mate (restrictMatching N) v = restrictedMate N v :=
  mate_perfectMatchingOfInvolution _ _ _ v

theorem restrictedMate_extendMatching (M : PerfectMatching G) (v : V) :
    restrictedMate (extendMatching M) v = mate M v := by
  have h := restrictedMate_spec (extendMatching M) v
  rw [mate_extendMatching] at h
  exact (Sum.inl_injective h).symm

theorem restrict_extendMatching (M : PerfectMatching G) :
    restrictMatching (extendMatching M) = M := by
  apply perfectMatching_ext
  intro v
  rw [mate_restrictMatching, restrictedMate_extendMatching]

theorem extend_restrictMatching (N : PerfectMatching (extendGraph G)) :
    extendMatching (restrictMatching N) = N := by
  apply perfectMatching_ext
  intro x
  rw [mate_extendMatching]
  cases x with
  | inl v =>
    change Sum.inl (mate (restrictMatching N) v) = mate N (Sum.inl v)
    rw [mate_restrictMatching]
    exact (restrictedMate_spec N v).symm
  | inr b =>
    cases b with
    | false => exact (mate_extended_hub N).symm
    | true => exact (mate_extended_leaf N).symm

noncomputable def extendMatchingEquiv (G : SimpleGraph V) :
    PerfectMatching G ≃ PerfectMatching (extendGraph G) where
  toFun := extendMatching
  invFun := restrictMatching
  left_inv := restrict_extendMatching
  right_inv := extend_restrictMatching

theorem perfectMatchingCount_extendGraph (G : SimpleGraph V) :
    perfectMatchingCount (extendGraph G) = perfectMatchingCount G :=
  (Nat.card_congr (extendMatchingEquiv G)).symm

end HartkeMatchingExcess
