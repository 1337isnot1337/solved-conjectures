module

public import Conjectures.FranklIncidence

/-! Exact local fibers after fixing exterior vertices and a separating boundary.

A reference maximal independent set supplies the fixed exterior configuration.
Only the boundary can meet an exterior vertex. Local independence and local
domination therefore characterize every global extension of that fixed data.
The equivalence counts distinct configurations and preserves occupation of
every interior vertex. No tree recurrence or frequency bound is assumed. -/
@[expose] public section

namespace FranklBoundary

open SimpleGraph

variable {V : Type*}

def Boundary (G : SimpleGraph V) (inside boundary : Set V) : Prop :=
  boundary ⊆ inside ∧
    ∀ u, u ∉ inside → ∀ v, v ∈ inside → G.Adj u v → v ∈ boundary

structure Local (G : SimpleGraph V) (inside boundary reference selected : Set V) : Prop where
  inside_subset : selected ⊆ inside
  boundary_agrees : selected ∩ boundary = reference ∩ boundary
  independent : G.IsIndepSet selected
  dominates : ∀ v ∈ inside, v ∉ selected →
    ∃ w ∈ (reference \ inside) ∪ selected, G.Adj v w

abbrev GlobalFiber (G : SimpleGraph V) (inside boundary reference : Set V) :=
  {selected : Set V //
    Maximal G.IsIndepSet selected ∧
      selected \ inside = reference \ inside ∧
      selected ∩ boundary = reference ∩ boundary}

abbrev LocalFiber (G : SimpleGraph V) (inside boundary reference : Set V) :=
  {selected : Set V // Local G inside boundary reference selected}

theorem mem_iff_of_boundary_eq {boundary reference selected : Set V}
    (h : selected ∩ boundary = reference ∩ boundary)
    {v : V} (hv : v ∈ boundary) : v ∈ selected ↔ v ∈ reference := by
  constructor
  · intro hs
    have ht : v ∈ selected ∩ boundary := ⟨hs, hv⟩
    rw [h] at ht
    exact ht.1
  · intro ht
    have hs : v ∈ reference ∩ boundary := ⟨ht, hv⟩
    rw [← h] at hs
    exact hs.1

theorem outside_join {inside reference selected : Set V}
    (hs : selected ⊆ inside) :
    ((reference \ inside) ∪ selected) \ inside = reference \ inside := by
  ext v
  constructor
  · rintro ⟨hv, hnot⟩
    rcases hv with hv | hv
    · exact hv
    · exact False.elim (hnot (hs hv))
  · intro hv
    exact ⟨Or.inl hv, hv.2⟩

theorem inside_join {inside reference selected : Set V}
    (hs : selected ⊆ inside) :
    ((reference \ inside) ∪ selected) ∩ inside = selected := by
  ext v
  constructor
  · rintro ⟨hv, hinside⟩
    rcases hv with hv | hv
    · exact False.elim (hv.2 hinside)
    · exact hv
  · intro hv
    exact ⟨Or.inr hv, hs hv⟩

theorem boundary_join {inside boundary reference selected : Set V}
    (hb : boundary ⊆ inside) :
    ((reference \ inside) ∪ selected) ∩ boundary = selected ∩ boundary := by
  ext v
  constructor
  · rintro ⟨hv, hboundary⟩
    rcases hv with hv | hv
    · exact False.elim (hv.2 (hb hboundary))
    · exact ⟨hv, hboundary⟩
  · rintro ⟨hv, hboundary⟩
    exact ⟨Or.inr hv, hboundary⟩

theorem reconstruct {inside reference selected : Set V}
    (h : selected \ inside = reference \ inside) :
    (reference \ inside) ∪ (selected ∩ inside) = selected := by
  classical
  ext v
  constructor
  · intro hv
    rcases hv with hv | hv
    · have hs : v ∈ selected \ inside := by
        rw [h]
        exact hv
      exact hs.1
    · exact hv.1
  · intro hv
    by_cases hi : v ∈ inside
    · exact Or.inr ⟨hv, hi⟩
    · apply Or.inl
      rw [← h]
      exact ⟨hv, hi⟩

theorem restrict_local {G : SimpleGraph V} {inside boundary reference selected : Set V}
    (hb : boundary ⊆ inside)
    (hmax : Maximal G.IsIndepSet selected)
    (houtside : selected \ inside = reference \ inside)
    (hboundary : selected ∩ boundary = reference ∩ boundary) :
    Local G inside boundary reference (selected ∩ inside) := by
  refine ⟨fun _ hv => hv.2, ?_, ?_, ?_⟩
  · calc
      (selected ∩ inside) ∩ boundary = selected ∩ boundary := by
        ext v
        constructor
        · rintro ⟨⟨hv, _⟩, hboundary⟩
          exact ⟨hv, hboundary⟩
        · rintro ⟨hv, hboundary⟩
          exact ⟨⟨hv, hb hboundary⟩, hboundary⟩
      _ = reference ∩ boundary := hboundary
  · intro u hu v hv hne
    exact hmax.1 hu.1 hv.1 hne
  · intro v hv hnot
    have hvnot : v ∉ selected := fun hs => hnot ⟨hs, hv⟩
    obtain ⟨w, hw, hadj⟩ := (FranklIncidence.maximal_independent_iff G selected).mp hmax |>.2 v hvnot
    refine ⟨w, ?_, hadj⟩
    rw [reconstruct houtside]
    exact hw

theorem join_maximal {G : SimpleGraph V} {inside boundary reference selected : Set V}
    (hb : Boundary G inside boundary)
    (href : Maximal G.IsIndepSet reference)
    (hlocal : Local G inside boundary reference selected) :
    Maximal G.IsIndepSet ((reference \ inside) ∪ selected) := by
  classical
  apply (FranklIncidence.maximal_independent_iff G _).mpr
  constructor
  · intro u hu v hv hne hadj
    rcases hu with hu | hu <;> rcases hv with hv | hv
    · exact href.1 hu.1 hv.1 hne hadj
    · have hvb := hb.2 u hu.2 v (hlocal.inside_subset hv) hadj
      have hvr := (mem_iff_of_boundary_eq hlocal.boundary_agrees hvb).mp hv
      exact href.1 hu.1 hvr hne hadj
    · have hub := hb.2 v hv.2 u (hlocal.inside_subset hu) hadj.symm
      have hur := (mem_iff_of_boundary_eq hlocal.boundary_agrees hub).mp hu
      exact href.1 hur hv.1 hne hadj
    · exact hlocal.independent hu hv hne hadj
  · intro v hnot
    by_cases hi : v ∈ inside
    · exact hlocal.dominates v hi (fun hs => hnot (Or.inr hs))
    · have hvr : v ∉ reference := fun hv => hnot (Or.inl ⟨hv, hi⟩)
      obtain ⟨w, hw, hadj⟩ := (FranklIncidence.maximal_independent_iff G reference).mp href |>.2 v hvr
      refine ⟨w, ?_, hadj⟩
      by_cases hwi : w ∈ inside
      · have hwb := hb.2 v hi w hwi hadj
        exact Or.inr ((mem_iff_of_boundary_eq hlocal.boundary_agrees hwb).mpr hw)
      · exact Or.inl ⟨hw, hwi⟩

def globalLocalEquiv {G : SimpleGraph V} {inside boundary reference : Set V}
    (hb : Boundary G inside boundary)
    (href : Maximal G.IsIndepSet reference) :
    GlobalFiber G inside boundary reference ≃ LocalFiber G inside boundary reference where
  toFun selected := ⟨selected.1 ∩ inside,
    restrict_local hb.1 selected.2.1 selected.2.2.1 selected.2.2.2⟩
  invFun selected := ⟨(reference \ inside) ∪ selected.1,
    join_maximal hb href selected.2, outside_join selected.2.inside_subset,
    (boundary_join hb.1).trans selected.2.boundary_agrees⟩
  left_inv selected := by
    apply Subtype.ext
    exact reconstruct selected.2.2.1
  right_inv selected := by
    apply Subtype.ext
    exact inside_join selected.2.inside_subset

theorem fiber_card_eq {G : SimpleGraph V} {inside boundary reference : Set V}
    (hb : Boundary G inside boundary)
    (href : Maximal G.IsIndepSet reference) :
    Nat.card (GlobalFiber G inside boundary reference) =
      Nat.card (LocalFiber G inside boundary reference) :=
  Nat.card_congr (globalLocalEquiv hb href)

def occupiedFiberEquiv {G : SimpleGraph V} {inside boundary reference : Set V}
    (hb : Boundary G inside boundary)
    (href : Maximal G.IsIndepSet reference) (v : V) (hv : v ∈ inside) :
    {selected : GlobalFiber G inside boundary reference // v ∈ selected.1} ≃
      {selected : LocalFiber G inside boundary reference // v ∈ selected.1} :=
  (globalLocalEquiv hb href).subtypeEquiv (fun selected => by
    change v ∈ selected.1 ↔ v ∈ selected.1 ∩ inside
    exact ⟨fun h => ⟨h, hv⟩, fun h => h.1⟩)

theorem occupied_fiber_card_eq {G : SimpleGraph V} {inside boundary reference : Set V}
    (hb : Boundary G inside boundary)
    (href : Maximal G.IsIndepSet reference) (v : V) (hv : v ∈ inside) :
    Nat.card {selected : GlobalFiber G inside boundary reference // v ∈ selected.1} =
      Nat.card {selected : LocalFiber G inside boundary reference // v ∈ selected.1} :=
  Nat.card_congr (occupiedFiberEquiv hb href v hv)

end FranklBoundary
