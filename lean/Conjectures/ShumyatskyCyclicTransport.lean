module

public import Conjectures.ShumyatskyCycleLabels
public import Mathlib.Algebra.Group.End
public import Conjectures.ShumyatskyFactorAction

/-! Build the conjugator labels at every vertex of each paired cycle,
including the edge which returns to its initial vertex. -/

@[expose] public section

namespace Shumyatsky

variable {A B : Type*} [Group A] [Group B]

/-- Move to the next vertex and return from the last vertex to zero. -/
def cycleNext {n : ℕ} (i : Fin n) : Fin n :=
  if h : i.val + 1 < n then ⟨i.val + 1, h⟩ else ⟨0, Nat.zero_lt_of_lt i.isLt⟩

/-- The label at a vertex is obtained by transport along its initial. -/
def cycleConjugator (edges : List (A × A)) (start : A) (i : Fin edges.length) : A :=
  transportLabels (edges.take i.val) start

theorem cycleConjugator_step (edges : List (A × A)) (start : A)
    (hClose : transportLabels edges start = start) (i : Fin edges.length) :
    cycleConjugator edges start (cycleNext i) =
      edges[i.val].2 * cycleConjugator edges start i * edges[i.val].1⁻¹ := by
  have hStep : transportLabels (edges.take (i.val + 1)) start =
      edges[i.val].2 * cycleConjugator edges start i * edges[i.val].1⁻¹ := by
    rw [List.take_succ_eq_append_getElem i.isLt, transportLabels_append]
    cases edges[i.val]
    rfl
  by_cases h : i.val + 1 < edges.length
  · simpa only [cycleNext, dite_eq_left h, cycleConjugator] using hStep
  · have hs : i.val + 1 = edges.length := Nat.le_antisymm i.isLt (Nat.le_of_not_gt h)
    rw [hs, List.take_length, hClose] at hStep
    simpa only [cycleNext, dite_eq_right h, cycleConjugator, List.take_zero, transportLabels] using hStep

theorem map_cycleConjugator_eq (f : A →* B) (edges reference : List (A × A))
    (start : A) (i : Fin edges.length) (j : Fin reference.length)
    (hIndex : i.val = j.val)
    (hEdges : edges.map (fun e => (f e.1, f e.2)) =
      reference.map (fun e => (f e.1, f e.2))) :
    f (cycleConjugator edges start i) = f (cycleConjugator reference start j) := by
  simp only [cycleConjugator, map_transportLabels, List.map_take, hIndex, hEdges]

/-- Transport can be done independently on each cycle of an indexed
    partition. The permutation follows the cyclic successor on each
    part. The resulting global labels satisfy equation (1) at every
    vertex, including each return edge. -/
theorem exists_labels_of_cycle_partition
    {ι C : Type*} (edges : C → List (A × A)) (starts : C → A)
    (seg : ι ≃ Σ c, Fin (edges c).length) (σ : Equiv.Perm ι)
    (hPerm : ∀ i, seg (σ i) = ⟨(seg i).1, cycleNext (seg i).2⟩)
    (hClose : ∀ c, transportLabels (edges c) (starts c) = starts c) :
    ∃ labels : ι → A, ∀ i,
      labels (σ i) = ((edges (seg i).1)[(seg i).2.val]).2 * labels i *
        ((edges (seg i).1)[(seg i).2.val]).1⁻¹ := by
  refine ⟨fun i => cycleConjugator (edges (seg i).1) (starts (seg i).1) (seg i).2, ?_⟩
  intro i
  dsimp only
  rw [hPerm i]
  exact cycleConjugator_step _ _ (hClose _) _

/-- The verified equations glue to an actual product conjugator when
    the paired cycles traverse the two permutations as prescribed. -/
theorem exists_factorAction_conjugator_of_cycle_partition
    {ι C S : Type*} [Group S] [Nontrivial S] [DecidableEq ι]
    (edges : C → List (MulAut S × MulAut S)) (starts : C → MulAut S)
    (seg : ι ≃ Σ c, Fin (edges c).length)
    (σ τ γ : Equiv.Perm ι) (x y : ι → MulAut S)
    (hPerm : ∀ i, seg (σ i) = ⟨(seg i).1, cycleNext (seg i).2⟩)
    (hIntertwine : γ * σ = τ * γ)
    (hx : ∀ i, x i = ((edges (seg i).1)[(seg i).2.val]).1)
    (hy : ∀ i, y (γ i) = ((edges (seg i).1)[(seg i).2.val]).2)
    (hClose : ∀ c, transportLabels (edges c) (starts c) = starts c) :
    ∃ g : ι → MulAut S,
      factorAction γ g * factorAction σ x * (factorAction γ g)⁻¹ = factorAction τ y := by
  obtain ⟨g, hg⟩ := exists_labels_of_cycle_partition edges starts seg σ hPerm hClose
  refine ⟨g, (factorAction_conj_iff _ _ _ _ _ _).2 ⟨hIntertwine, fun i => ?_⟩⟩
  rw [hx i, hy i]
  exact hg i

/-- Complete each cycle at its reserved last edge. -/
def completeCycle (initial : List (A × A)) (lastX start : A) : List (A × A) :=
  initial ++ [(lastX, closingLabel initial lastX start)]

theorem transportLabels_completeCycle (initial : List (A × A)) (lastX start : A) :
    transportLabels (completeCycle initial lastX start) start = start :=
  (transportLabels_close_iff _ _ _ _).2 rfl

/-- Every prescribed choice of the other edges retains the reference
    outer class at the reserved edge and hence at every cycle vertex. -/
theorem map_completeCycle_eq_reference (f : A →* B)
    (initial reference : List (A × A)) (lastX refX refY start : A)
    (hPrefix : initial.map (fun e => (f e.1, f e.2)) =
      reference.map (fun e => (f e.1, f e.2)))
    (hX : f lastX = f refX)
    (hRef : transportLabels (reference ++ [(refX, refY)]) start = start) :
    (completeCycle initial lastX start).map (fun e => (f e.1, f e.2)) =
      (reference ++ [(refX, refY)]).map (fun e => (f e.1, f e.2)) := by
  obtain ⟨y, ⟨hY, hClose⟩, _⟩ :=
    existsUnique_closingLabel_in_class f initial reference lastX refX refY start hPrefix hX hRef
  have hy := (transportLabels_close_iff _ _ _ _).1 hClose
  simp [completeCycle, hPrefix, hX, ← hy, hY]

end Shumyatsky
