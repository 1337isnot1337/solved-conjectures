import Conjectures.HartkeMatchingExcessMates
import Mathlib.Combinatorics.SimpleGraph.Maps

/-!
# Hartke–Stolee–West–Yancey's matching-excess conjecture

Both actual perfect-matching counts and unordered-edge counts are invariant
under a graph isomorphism. This permits the two-vertex extension to use a
convenient vertex type and then return to the canonical even vertex set.
-/

namespace HartkeMatchingExcess

open SimpleGraph

variable {V W : Type*} {G : SimpleGraph V} {H : SimpleGraph W}

noncomputable def isomorphMatching (e : G ≃g H) (M : PerfectMatching G) : PerfectMatching H :=
  perfectMatchingOfInvolution (fun w => e (mate M (e.symm w)))
    (by
      intro w
      simp only [RelIso.symm_apply_apply]
      rw [mate_involutive M]
      exact e.apply_symm_apply w)
    (by
      intro w
      have h := e.map_rel_iff.mpr (mate_graph_adj M (e.symm w))
      simpa only [RelIso.apply_symm_apply] using h)

theorem mate_isomorphMatching (e : G ≃g H) (M : PerfectMatching G) (w : W) :
    mate (isomorphMatching e M) w = e (mate M (e.symm w)) :=
  mate_perfectMatchingOfInvolution _ _ _ w

noncomputable def matchingIso (e : G ≃g H) : PerfectMatching G ≃ PerfectMatching H where
  toFun := isomorphMatching e
  invFun := isomorphMatching e.symm
  left_inv M := by
    apply perfectMatching_ext
    intro v
    rw [mate_isomorphMatching, mate_isomorphMatching]
    simp only [RelIso.symm_symm, RelIso.symm_apply_apply]
  right_inv N := by
    apply perfectMatching_ext
    intro w
    rw [mate_isomorphMatching, mate_isomorphMatching]
    simp only [RelIso.symm_symm, RelIso.apply_symm_apply]

theorem perfectMatchingCount_iso (e : G ≃g H) :
    perfectMatchingCount G = perfectMatchingCount H :=
  Nat.card_congr (matchingIso e)

theorem edge_card_iso (e : G ≃g H) : Nat.card G.edgeSet = Nat.card H.edgeSet :=
  Nat.card_congr e.mapEdgeSet

end HartkeMatchingExcess
