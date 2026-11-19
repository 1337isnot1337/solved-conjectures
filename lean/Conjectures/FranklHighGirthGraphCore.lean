module

public import Conjectures.FranklTreeOccupation
public import Conjectures.FranklBoundaryConfigurationHelpers
public import Conjectures.FranklBoundaryBall
public import Conjectures.FranklIncidenceFinite

/-! Transfer a certified root-message bound to every actual graph configuration.

The theorem fixes exterior and boundary data, uses the exact induced-ball
configuration equivalence, transports it through the unfolding graph
isomorphism, and then averages over all finite fibers. The root-message
inequality remains an explicit input in this generic transfer module. -/
@[expose] public section

namespace FranklHighGirth

open SimpleGraph FranklTreeBall FranklTreeUnfolding FranklTreeCone
open FranklTreeConfigurations FranklBoundary

variable {V : Type*} [Finite V] {G : SimpleGraph V} {points : Set V} {k : ℕ}

theorem fixed_boundary_occupation_bound
    (hregular : Biregular G points k) (hg : NoShortCycle G 16)
    (root : V) (hpoint : root ∈ points) (reference : MaximalIndependent G) (bound : ℝ)
    (hbound : ∀ x ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2,
      ∀ y ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2,
      ∀ z ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2,
      0 < rootOccupiedCount x y z + rootUnoccupiedCount x y z →
      rootOccupiedCount x y z / (rootOccupiedCount x y z + rootUnoccupiedCount x y z) ≤ bound) :
    (Nat.card {S : GlobalFiber G (pathBall G root 7)
      (pathBall G root 7 \ pathBall G root 6) reference.1 // root ∈ S.1} : ℝ) ≤
    bound * (Nat.card (GlobalFiber G (pathBall G root 7)
      (pathBall G root 7 \ pathBall G root 6) reference.1) : ℝ) := by
  classical
  let inside := pathBall G root 7
  let boundary := pathBall G root 7 \ pathBall G root 6
  let rootInside : inside := ⟨root, root_mem_pathBall G root 7⟩
  let e : graph G 7 root root ≃g G.induce inside := ballIso hg 7 (by omega) root
  let outside := outsideDominated G inside reference.1
  let canSelect := boundaryCanSelect inside boundary reference.1
  let canOmit := boundaryCanOmit inside boundary reference.1
  have hb : Boundary G inside boundary := pathBall_boundary G root 6
  have hroot : e (rootVertex G 7 root root) = rootInside := ballIso_root hg 7 (by omega) root
  have hfree : FreeInterior G 7 root root (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit) := by
    intro x hx
    have hnot : (e x).1 ∉ boundary := by
      intro hboundary
      have hdepth : (walk G 7 root root x).length = 7 :=
        (boundary_layer_iff hg root x).mp hboundary
      omega
    exact permissions_free_off_boundary hb (e x) hnot
  have htotal :
      Nat.card (GlobalFiber G inside boundary reference.1) =
      Nat.card (Finished (graph G 7 root root) (rootVertex G 7 root root)
        (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit)) := by
    calc
      _ = Nat.card (Finished (G.induce inside) rootInside outside canSelect canOmit) :=
        global_finished_card_eq hb reference.2 rootInside
      _ = _ := by
        have ht := finished_card_iso e (rootVertex G 7 root root) outside canSelect canOmit
        rw [hroot] at ht
        exact ht
  have hoccupied :
      Nat.card {S : GlobalFiber G inside boundary reference.1 // root ∈ S.1} =
      Nat.card (Occupied (graph G 7 root root) (rootVertex G 7 root root)
        (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit)) := by
    calc
      _ = Nat.card (Occupied (G.induce inside) rootInside outside canSelect canOmit) :=
        global_occupied_card_eq hb reference.2 rootInside
      _ = _ := by
        have ho := occupied_card_iso e (rootVertex G 7 root root) outside canSelect canOmit
        rw [hroot] at ho
        exact ho
  let _ : Nonempty (GlobalFiber G inside boundary reference.1) :=
    ⟨⟨reference.1, reference.2, rfl, rfl⟩⟩
  have hpositive : 0 < Nat.card (Finished (graph G 7 root root) (rootVertex G 7 root root)
      (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit)) := by
    rw [← htotal]
    exact Nat.card_pos
  have hratio := unfolding_occupation_bound hregular root hpoint
    (e ⁻¹' outside) (e ⁻¹' canSelect) (e ⁻¹' canOmit) hfree hpositive bound hbound
  have hscaled := (div_le_iff₀ (Nat.cast_pos.mpr hpositive)).mp hratio
  change (Nat.card {S : GlobalFiber G inside boundary reference.1 // root ∈ S.1} : ℝ) ≤
    bound * (Nat.card (GlobalFiber G inside boundary reference.1) : ℝ)
  rw [hoccupied, htotal]
  exact hscaled

theorem maximal_independent_point_bound
    (hregular : Biregular G points k) (hg : NoShortCycle G 16)
    (root : V) (hpoint : root ∈ points) (bound : ℝ)
    (hbound : ∀ x ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2,
      ∀ y ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2,
      ∀ z ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2,
      0 < rootOccupiedCount x y z + rootUnoccupiedCount x y z →
      rootOccupiedCount x y z / (rootOccupiedCount x y z + rootUnoccupiedCount x y z) ≤ bound) :
    (Nat.card {S : MaximalIndependent G // root ∈ S.1} : ℝ) ≤
      bound * (Nat.card (MaximalIndependent G) : ℝ) := by
  have h := maximal_independent_real_bound_of_fibers G (pathBall G root 7)
    (pathBall G root 7 \ pathBall G root 6) root bound 1 (fun reference => by
      simpa only [one_mul] using
        fixed_boundary_occupation_bound hregular hg root hpoint reference bound hbound)
  simpa only [one_mul] using h

end FranklHighGirth

namespace FranklHighGirth

open SimpleGraph FranklIncidence FranklTreeBall FranklTreeUnfolding FranklTreeCone

variable {α ι : Type*} [DecidableEq α] [Fintype ι]

theorem incidence_biregular (gen : ι → Finset α) (k : ℕ)
    (hsize : ∀ i, (gen i).card = k)
    (hregular : ∀ a, (Frankl.Large.incident gen a).card = 3) :
    Biregular (incidenceGraph (fun i => (gen i : Set α))) (Set.range Sum.inl) k where
  opposite := by
    rintro (a | i) (b | j) h
    · exact h.elim
    · simp
    · simp
    · exact h.elim
  point_card := by
    intro v hv
    obtain ⟨a, rfl⟩ := hv
    exact (point_neighbors_card gen a).trans (hregular a)
  generator_card := by
    intro v hv
    cases v with
    | inl a => exact False.elim (hv ⟨a, rfl⟩)
    | inr i => exact (generator_neighbors_card gen i).trans (hsize i)

theorem distinct_union_absence_bound (gen : ι → Finset α) (k : ℕ)
    (hsize : ∀ i, (gen i).card = k)
    (hregular : ∀ a, (Frankl.Large.incident gen a).card = 3)
    (hg : NoShortCycle (incidenceGraph (fun i => (gen i : Set α))) 16)
    (a : α) (bound : ℝ)
    (hbound : ∀ x ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2,
      ∀ y ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2,
      ∀ z ∈ (iterateMessageSets k (rayCone boundaryRays) (rayCone boundaryRays) 6).2,
      0 < rootOccupiedCount x y z + rootUnoccupiedCount x y z →
      rootOccupiedCount x y z / (rootOccupiedCount x y z + rootUnoccupiedCount x y z) ≤ bound) :
    (((FranklLocal.family (Finset.univ.image gen)).filter (fun U => a ∉ U)).card : ℝ) ≤
      bound * ((FranklLocal.family (Finset.univ.image gen)).card : ℝ) := by
  classical
  let _ : Finite α := finite_ground_of_three_regular gen hregular
  let _ : Fintype α := Fintype.ofFinite α
  have h := maximal_independent_point_bound (incidence_biregular gen k hsize hregular)
    hg (.inl a) ⟨a, rfl⟩ bound hbound
  rw [← absentUnion_card_eq (fun i => (gen i : Set α)) a,
    ← generatedUnion_card_eq (fun i => (gen i : Set α))] at h
  rw [← absent_family_card_eq_generated gen a, ← family_card_eq_generated gen] at h
  exact h

end FranklHighGirth
