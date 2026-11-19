module

public import Conjectures.FranklBoundaryFibers
public import Conjectures.FranklTreeConfigurations

/-! Fixed-boundary fibers as actual rooted graph configurations.

Exterior domination and the selected/omitted permissions are derived from
the reference independent set. Restriction to the induced interior graph
is an equivalence preserving occupation of the root. -/
@[expose] public section

namespace FranklBoundary

open SimpleGraph FranklTreeGluing FranklTreeConfigurations

variable {V : Type*}

def insideSelected (inside selected : Set V) : Set inside := {v | v.1 ∈ selected}

def ambientSelected {inside : Set V} (selected : Set inside) : Set V :=
  Subtype.val '' selected

def outsideDominated (G : SimpleGraph V) (inside reference : Set V) : Set inside :=
  {v | ∃ w ∈ reference \ inside, G.Adj v.1 w}

def boundaryCanSelect (inside boundary reference : Set V) : Set inside :=
  {v | v.1 ∈ boundary → v.1 ∈ reference}

def boundaryCanOmit (inside boundary reference : Set V) : Set inside :=
  {v | v.1 ∈ boundary → v.1 ∉ reference}

theorem ambientSelected_subset {inside : Set V} (selected : Set inside) :
    ambientSelected selected ⊆ inside := by
  rintro v ⟨w, _, rfl⟩
  exact w.2

theorem mem_ambientSelected {inside : Set V} (selected : Set inside) (v : inside) :
    v.1 ∈ ambientSelected selected ↔ v ∈ selected := by
  constructor
  · rintro ⟨w, hw, heq⟩
    have h : w = v := Subtype.ext heq
    exact h ▸ hw
  · intro hv
    exact ⟨v, hv, rfl⟩

theorem ambient_insideSelected {inside selected : Set V} (h : selected ⊆ inside) :
    ambientSelected (insideSelected inside selected) = selected := by
  ext v
  constructor
  · rintro ⟨w, hw, rfl⟩
    exact hw
  · intro hv
    exact ⟨⟨v, h hv⟩, hv, rfl⟩

theorem inside_ambientSelected {inside : Set V} (selected : Set inside) :
    insideSelected inside (ambientSelected selected) = selected := by
  ext v
  exact mem_ambientSelected selected v

theorem local_dominated_inside {G : SimpleGraph V}
    {inside boundary reference selected : Set V}
    (h : Local G inside boundary reference selected) (v : inside)
    (hv : v ∉ insideSelected inside selected) :
    Dominated (G.induce inside) (outsideDominated G inside reference)
      (insideSelected inside selected) v := by
  obtain ⟨w, hw, hadj⟩ := h.dominates v.1 v.2 hv
  rcases hw with hw | hw
  · exact Or.inl ⟨w, hw, hadj⟩
  · exact Or.inr ⟨⟨w, h.inside_subset hw⟩, hw, hadj⟩

theorem local_finished {G : SimpleGraph V}
    {inside boundary reference selected : Set V}
    (h : Local G inside boundary reference selected) (root : inside) :
    Valid (G.induce inside) root (outsideDominated G inside reference)
      (boundaryCanSelect inside boundary reference) (boundaryCanOmit inside boundary reference)
      (insideSelected inside selected) ∧
    (root ∈ insideSelected inside selected ∨
      Dominated (G.induce inside) (outsideDominated G inside reference)
        (insideSelected inside selected) root) := by
  classical
  constructor
  · refine ⟨?_, ?_, ?_, ?_⟩
    · intro v hv w hw _ hadj
      exact h.independent hv hw (fun heq => hadj.ne (Subtype.ext heq)) hadj
    · intro v hv hvb
      exact (mem_iff_of_boundary_eq h.boundary_agrees hvb).mp hv
    · intro v hv hvb href
      exact hv ((mem_iff_of_boundary_eq h.boundary_agrees hvb).mpr href)
    · intro v _ hv
      exact local_dominated_inside h v hv
  · by_cases hr : root ∈ insideSelected inside selected
    · exact Or.inl hr
    · exact Or.inr (local_dominated_inside h root hr)

theorem finished_dominated {W : Type*} {G : SimpleGraph W} {root : W}
    {outside canSelect canOmit selected : Set W}
    (h : Valid G root outside canSelect canOmit selected ∧
      (root ∈ selected ∨ Dominated G outside selected root))
    (v : W) (hv : v ∉ selected) : Dominated G outside selected v := by
  classical
  by_cases hvr : v = root
  · subst v
    exact h.2.elim (fun hs => False.elim (hv hs)) id
  · exact h.1.dominates_away v hvr hv

theorem local_of_finished {G : SimpleGraph V} {inside boundary reference : Set V}
    (hb : boundary ⊆ inside) (root : inside) {selected : Set inside}
    (h : Valid (G.induce inside) root (outsideDominated G inside reference)
      (boundaryCanSelect inside boundary reference) (boundaryCanOmit inside boundary reference)
      selected ∧ (root ∈ selected ∨
        Dominated (G.induce inside) (outsideDominated G inside reference) selected root)) :
    Local G inside boundary reference (ambientSelected selected) := by
  classical
  refine ⟨ambientSelected_subset selected, ?_, ?_, ?_⟩
  · ext v
    constructor
    · rintro ⟨⟨w, hw, heq⟩, hvb⟩
      refine ⟨?_, hvb⟩
      have hwr : w.1 ∈ reference := h.1.selected_allowed hw (by
        rw [heq]
        exact hvb)
      exact heq ▸ hwr
    · rintro ⟨hvr, hvb⟩
      have hi : v ∈ inside := hb hvb
      have hm : (⟨v, hi⟩ : inside) ∈ selected := by
        by_contra hnot
        exact h.1.omitted_allowed hnot hvb hvr
      exact ⟨⟨⟨v, hi⟩, hm, rfl⟩, hvb⟩
  · rintro u ⟨u', hu, rfl⟩ v ⟨v', hv, rfl⟩ _ hadj
    exact h.1.independent hu hv (fun heq => hadj.ne (congrArg Subtype.val heq)) hadj
  · intro v hv hnot
    have hi : (⟨v, hv⟩ : inside) ∉ selected := fun hs =>
      hnot ⟨⟨v, hv⟩, hs, rfl⟩
    have hd := finished_dominated h (⟨v, hv⟩ : inside) hi
    rcases hd with hout | ⟨w, hw, hadj⟩
    · obtain ⟨w, hw, hadj⟩ := hout
      exact ⟨w, Or.inl hw, hadj⟩
    · exact ⟨w.1, Or.inr ⟨w, hw, rfl⟩, hadj⟩

def localFinishedEquiv (G : SimpleGraph V) (inside boundary reference : Set V)
    (hb : boundary ⊆ inside) (root : inside) :
    LocalFiber G inside boundary reference ≃
    Finished (G.induce inside) root (outsideDominated G inside reference)
      (boundaryCanSelect inside boundary reference) (boundaryCanOmit inside boundary reference) where
  toFun selected := ⟨insideSelected inside selected.1, local_finished selected.2 root⟩
  invFun selected := ⟨ambientSelected selected.1, local_of_finished hb root selected.2⟩
  left_inv selected := Subtype.ext (ambient_insideSelected selected.2.inside_subset)
  right_inv selected := Subtype.ext (inside_ambientSelected selected.1)

def occupiedFinishedEquiv {W : Type*} (G : SimpleGraph W) (root : W)
    (outside canSelect canOmit : Set W) :
    {selected : Finished G root outside canSelect canOmit // root ∈ selected.1} ≃
    Occupied G root outside canSelect canOmit where
  toFun selected := ⟨selected.1.1, selected.1.2.1, selected.2⟩
  invFun selected := ⟨⟨selected.1, selected.2.1, Or.inl selected.2.2⟩, selected.2.2⟩
  left_inv _ := rfl
  right_inv _ := rfl

def occupiedLocalFinishedEquiv (G : SimpleGraph V) (inside boundary reference : Set V)
    (hb : boundary ⊆ inside) (root : inside) :
    {selected : LocalFiber G inside boundary reference // root.1 ∈ selected.1} ≃
    Occupied (G.induce inside) root (outsideDominated G inside reference)
      (boundaryCanSelect inside boundary reference) (boundaryCanOmit inside boundary reference) :=
  ((localFinishedEquiv G inside boundary reference hb root).subtypeEquiv
    (fun _ => Iff.rfl)).trans
      (occupiedFinishedEquiv (G.induce inside) root (outsideDominated G inside reference)
        (boundaryCanSelect inside boundary reference) (boundaryCanOmit inside boundary reference))

theorem local_finished_card_eq (G : SimpleGraph V) (inside boundary reference : Set V)
    (hb : boundary ⊆ inside) (root : inside) :
    Nat.card (LocalFiber G inside boundary reference) =
    Nat.card (Finished (G.induce inside) root (outsideDominated G inside reference)
      (boundaryCanSelect inside boundary reference) (boundaryCanOmit inside boundary reference)) :=
  Nat.card_congr (localFinishedEquiv G inside boundary reference hb root)

theorem local_occupied_card_eq (G : SimpleGraph V) (inside boundary reference : Set V)
    (hb : boundary ⊆ inside) (root : inside) :
    Nat.card {selected : LocalFiber G inside boundary reference // root.1 ∈ selected.1} =
    Nat.card (Occupied (G.induce inside) root (outsideDominated G inside reference)
      (boundaryCanSelect inside boundary reference) (boundaryCanOmit inside boundary reference)) :=
  Nat.card_congr (occupiedLocalFinishedEquiv G inside boundary reference hb root)

theorem global_finished_card_eq {G : SimpleGraph V} {inside boundary reference : Set V}
    (hb : Boundary G inside boundary) (href : Maximal G.IsIndepSet reference) (root : inside) :
    Nat.card (GlobalFiber G inside boundary reference) =
    Nat.card (Finished (G.induce inside) root (outsideDominated G inside reference)
      (boundaryCanSelect inside boundary reference) (boundaryCanOmit inside boundary reference)) :=
  (fiber_card_eq hb href).trans (local_finished_card_eq G inside boundary reference hb.1 root)

theorem global_occupied_card_eq {G : SimpleGraph V} {inside boundary reference : Set V}
    (hb : Boundary G inside boundary) (href : Maximal G.IsIndepSet reference) (root : inside) :
    Nat.card {selected : GlobalFiber G inside boundary reference // root.1 ∈ selected.1} =
    Nat.card (Occupied (G.induce inside) root (outsideDominated G inside reference)
      (boundaryCanSelect inside boundary reference) (boundaryCanOmit inside boundary reference)) :=
  (occupied_fiber_card_eq hb href root.1 root.2).trans
    (local_occupied_card_eq G inside boundary reference hb.1 root)


theorem permissions_free_off_boundary {G : SimpleGraph V} {inside boundary reference : Set V}
    (hb : Boundary G inside boundary) (v : inside) (hv : v.1 ∉ boundary) :
    v ∉ outsideDominated G inside reference ∧
      v ∈ boundaryCanSelect inside boundary reference ∧
      v ∈ boundaryCanOmit inside boundary reference := by
  refine ⟨?_, ?_, ?_⟩
  · rintro ⟨w, hw, hadj⟩
    exact hv (hb.2 w hw.2 v.1 v.2 hadj.symm)
  · intro hboundary
    exact False.elim (hv hboundary)
  · intro hboundary
    exact False.elim (hv hboundary)

end FranklBoundary
