module

public import Conjectures.FranklBoundaryFibers
public import Conjectures.FranklTreeBall

/-! A graph-ball layer separates its interior from all exterior vertices.
Combining this geometric fact with the exact fiber equivalence formalizes
boundary conditioning at radius seven. Acyclicity and branch-count recursion
remain separate inputs to the high-girth occupation bound. -/
@[expose] public section

namespace FranklBoundary

open SimpleGraph FranklTreeBall

variable {V : Type*}

theorem pathBall_boundary (G : SimpleGraph V) (root : V) (radius : ℕ) :
    Boundary G (pathBall G root (radius + 1))
      (pathBall G root (radius + 1) \ pathBall G root radius) := by
  classical
  refine ⟨fun _ hv => hv.1, ?_⟩
  intro u hu v hv hadj
  refine ⟨hv, ?_⟩
  rintro ⟨p, hp, hlen⟩
  have hnot : u ∉ p.support := by
    intro hmem
    exact hu ⟨p.takeUntil u hmem, hp.takeUntil hmem,
      (p.length_takeUntil_le_length hmem).trans (hlen.trans (Nat.le_succ radius))⟩
  apply hu
  refine ⟨p.concat hadj.symm, hp.concat hnot hadj.symm, ?_⟩
  simp only [Walk.length_concat]
  exact Nat.succ_le_succ hlen

theorem radius_seven_fiber_card_eq (G : SimpleGraph V) (root : V)
    {reference : Set V} (href : Maximal G.IsIndepSet reference) :
    Nat.card (GlobalFiber G (pathBall G root 7)
      (pathBall G root 7 \ pathBall G root 6) reference) =
    Nat.card (LocalFiber G (pathBall G root 7)
      (pathBall G root 7 \ pathBall G root 6) reference) :=
  fiber_card_eq (pathBall_boundary G root 6) href

theorem radius_seven_occupied_fiber_card_eq (G : SimpleGraph V) (root : V)
    {reference : Set V} (href : Maximal G.IsIndepSet reference) :
    Nat.card {selected : GlobalFiber G (pathBall G root 7)
      (pathBall G root 7 \ pathBall G root 6) reference // root ∈ selected.1} =
    Nat.card {selected : LocalFiber G (pathBall G root 7)
      (pathBall G root 7 \ pathBall G root 6) reference // root ∈ selected.1} :=
  occupied_fiber_card_eq (pathBall_boundary G root 6) href root
    (root_mem_pathBall G root 7)

end FranklBoundary
