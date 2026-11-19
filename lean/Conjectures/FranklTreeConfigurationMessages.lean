module

public import Conjectures.FranklTreeConfigurations
public import Conjectures.FranklTreeCertificate
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Algebra.BigOperators.Pi

/-! Actual finite configuration counts satisfy the certified real recurrence.

All three coordinates count vertex-set configurations. The subtraction in the
dominated coordinate follows from the exact dominated-plus-needs-parent
partition, so no truncated natural subtraction is cast to the reals. -/
@[expose] public section

open scoped BigOperators

namespace FranklTreeCone

/-- The three boundary rays contain every coordinatewise nonnegative message. -/
theorem mem_boundary_rayCone_of_nonneg (v : Message) (h : ∀ i, 0 ≤ v i) :
    v ∈ rayCone boundaryRays := by
  have h0 : castRay ![1, 0, 0] ∈ rayCone boundaryRays :=
    castRay_mem_rayCone (by simp [boundaryRays])
  have h1 : castRay ![0, 1, 0] ∈ rayCone boundaryRays :=
    castRay_mem_rayCone (by simp [boundaryRays])
  have h2 : castRay ![0, 0, 1] ∈ rayCone boundaryRays :=
    castRay_mem_rayCone (by simp [boundaryRays])
  have heq : v =
      v 0 • castRay ![1, 0, 0] + v 1 • castRay ![0, 1, 0] +
        v 2 • castRay ![0, 0, 1] := by
    ext i
    fin_cases i <;> simp [castRay, smul_eq_mul]
  rw [heq]
  exact (rayCone boundaryRays).add_mem
    ((rayCone boundaryRays).add_mem
      (PointedCone.smul_mem _ (h 0) h0)
      (PointedCone.smul_mem _ (h 1) h1))
    (PointedCone.smul_mem _ (h 2) h2)

end FranklTreeCone

namespace FranklTreeConfigurations

open SimpleGraph FranklTreeGluing FranklTreeCone

section OneGraph

variable {W : Type*} (G : SimpleGraph W) (top : W)
variable (outside canSelect canOmit : Set W)

/-- Occupied, internally dominated, and needs-parent counts, in that order. -/
noncomputable def realMessage : Message :=
  ![(Nat.card (Occupied G top outside canSelect canOmit) : ℝ),
    (Nat.card (Dom G top outside canSelect canOmit) : ℝ),
    (Nat.card (NeedsParent G top outside canSelect canOmit) : ℝ)]

@[simp] theorem realMessage_zero :
    realMessage G top outside canSelect canOmit 0 =
      (Nat.card (Occupied G top outside canSelect canOmit) : ℝ) := rfl

@[simp] theorem realMessage_one :
    realMessage G top outside canSelect canOmit 1 =
      (Nat.card (Dom G top outside canSelect canOmit) : ℝ) := rfl

@[simp] theorem realMessage_two :
    realMessage G top outside canSelect canOmit 2 =
      (Nat.card (NeedsParent G top outside canSelect canOmit) : ℝ) := rfl

theorem realMessage_nonneg (i : Fin 3) :
    0 ≤ realMessage G top outside canSelect canOmit i := by
  fin_cases i <;> simp [realMessage]

theorem realMessage_mem_boundary_rayCone :
    realMessage G top outside canSelect canOmit ∈ rayCone boundaryRays :=
  mem_boundary_rayCone_of_nonneg _ (realMessage_nonneg G top outside canSelect canOmit)

theorem finished_card_real [Finite W] :
    (Nat.card (Finished G top outside canSelect canOmit) : ℝ) =
      realMessage G top outside canSelect canOmit 0 +
        realMessage G top outside canSelect canOmit 1 := by
  simp only [finished_card, Nat.cast_add, realMessage_zero, realMessage_one]

/-- Occupied configurations are exactly the occupied members of the finished set. -/
def occupiedFinishedEquiv :
    {S : Finished G top outside canSelect canOmit // top ∈ S.1} ≃
      Occupied G top outside canSelect canOmit where
  toFun S := ⟨S.1.1, S.1.2.1, S.2⟩
  invFun S := ⟨⟨S.1, S.2.1, Or.inl S.2.2⟩, S.2.2⟩
  left_inv S := by
    apply Subtype.ext
    apply Subtype.ext
    rfl
  right_inv S := by
    apply Subtype.ext
    rfl

theorem occupiedFinished_card :
    Nat.card {S : Finished G top outside canSelect canOmit // top ∈ S.1} =
      Nat.card (Occupied G top outside canSelect canOmit) :=
  Nat.card_congr (occupiedFinishedEquiv G top outside canSelect canOmit)

/-- The actual fraction of finished vertex-set configurations occupying the root. -/
noncomputable def occupiedFraction : ℝ :=
  (Nat.card {S : Finished G top outside canSelect canOmit // top ∈ S.1} : ℝ) /
    (Nat.card (Finished G top outside canSelect canOmit) : ℝ)

theorem occupiedFraction_eq_card_ratio :
    occupiedFraction G top outside canSelect canOmit =
      (Nat.card (Occupied G top outside canSelect canOmit) : ℝ) /
        (Nat.card (Finished G top outside canSelect canOmit) : ℝ) := by
  rw [occupiedFraction, occupiedFinished_card]

end OneGraph

section Children

variable {ι : Type*} {V : ι → Type*}
variable [Fintype ι] [∀ i, Finite (V i)]
variable (G : ∀ i, SimpleGraph (V i)) (top : ∀ i, V i)
variable (outside canSelect canOmit : ∀ i, Set (V i))

theorem realMessage_attached_zero :
    realMessage (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit) 0 =
    ∏ i, (realMessage (G i) (top i) (outside i) (canSelect i) (canOmit i) 1 +
      realMessage (G i) (top i) (outside i) (canSelect i) (canOmit i) 2) := by
  have h := congrArg (fun n : ℕ => (n : ℝ))
    (occupied_attached_card G top outside canSelect canOmit)
  simpa only [Nat.cast_prod, Nat.cast_add, realMessage_zero, realMessage_one,
    realMessage_two] using h

omit [∀ i, Finite (V i)] in
theorem realMessage_attached_two :
    realMessage (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit) 2 =
    ∏ i, realMessage (G i) (top i) (outside i) (canSelect i) (canOmit i) 1 := by
  have h := congrArg (fun n : ℕ => (n : ℝ))
    (needsParent_attached_card G top outside canSelect canOmit)
  simpa only [Nat.cast_prod, realMessage_one, realMessage_two] using h

theorem realMessage_attached_one_add_two :
    realMessage (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit) 1 +
    realMessage (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit) 2 =
    ∏ i, (realMessage (G i) (top i) (outside i) (canSelect i) (canOmit i) 0 +
      realMessage (G i) (top i) (outside i) (canSelect i) (canOmit i) 1) := by
  have h := congrArg (fun n : ℕ => (n : ℝ))
    (dominated_add_needsParent_attached_card G top outside canSelect canOmit)
  simpa only [Nat.cast_prod, Nat.cast_add, realMessage_zero, realMessage_one,
    realMessage_two] using h

theorem realMessage_attached_one :
    realMessage (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit) 1 =
    (∏ i, (realMessage (G i) (top i) (outside i) (canSelect i) (canOmit i) 0 +
      realMessage (G i) (top i) (outside i) (canSelect i) (canOmit i) 1)) -
    ∏ i, realMessage (G i) (top i) (outside i) (canSelect i) (canOmit i) 1 := by
  rw [← realMessage_attached_two G top outside canSelect canOmit]
  exact eq_sub_of_add_eq (realMessage_attached_one_add_two G top outside canSelect canOmit)

/-- The attached graph's actual configuration message is the product recurrence. -/
theorem realMessage_attached :
    realMessage (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit) =
    returnMap (∏ i, factorMap
      (realMessage (G i) (top i) (outside i) (canSelect i) (canOmit i))) := by
  ext j
  fin_cases j
  · simpa [returnMap, factorMap] using
      realMessage_attached_zero G top outside canSelect canOmit
  · simpa [returnMap, factorMap] using
      realMessage_attached_one G top outside canSelect canOmit
  · simpa [returnMap, factorMap] using
      realMessage_attached_two G top outside canSelect canOmit

/-- An explicit finite child enumeration gives the list recurrence used by the cone certificates. -/
theorem realMessage_attached_of_equiv {n : ℕ} (e : Fin n ≃ ι) :
    realMessage (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit) =
    childrenMessage (List.ofFn (fun j =>
      realMessage (G (e j)) (top (e j)) (outside (e j)) (canSelect (e j)) (canOmit (e j)))) := by
  rw [realMessage_attached, childrenMessage, List.map_ofFn, List.prod_ofFn]
  exact congrArg returnMap (e.prod_comp (fun i => factorMap
    (realMessage (G i) (top i) (outside i) (canSelect i) (canOmit i)))).symm

end Children

section ThreeChildren

variable {V : Fin 3 → Type*} [∀ i, Finite (V i)]
variable (G : ∀ i, SimpleGraph (V i)) (top : ∀ i, V i)
variable (outside canSelect canOmit : ∀ i, Set (V i))

theorem rootOccupiedCount_eq_actual_card :
    rootOccupiedCount
      (realMessage (G 0) (top 0) (outside 0) (canSelect 0) (canOmit 0))
      (realMessage (G 1) (top 1) (outside 1) (canSelect 1) (canOmit 1))
      (realMessage (G 2) (top 2) (outside 2) (canSelect 2) (canOmit 2)) =
    (Nat.card (Occupied (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit)) : ℝ) := by
  simpa [rootOccupiedCount, factorMap, Fin.prod_univ_three] using
    (realMessage_attached_zero G top outside canSelect canOmit).symm

theorem rootUnoccupiedCount_eq_actual_card :
    rootUnoccupiedCount
      (realMessage (G 0) (top 0) (outside 0) (canSelect 0) (canOmit 0))
      (realMessage (G 1) (top 1) (outside 1) (canSelect 1) (canOmit 1))
      (realMessage (G 2) (top 2) (outside 2) (canSelect 2) (canOmit 2)) =
    (Nat.card (Dom (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit)) : ℝ) := by
  simpa [rootUnoccupiedCount, factorMap, Fin.prod_univ_three] using
    (realMessage_attached_one G top outside canSelect canOmit).symm

theorem rootTotalCount_eq_actual_card :
    rootOccupiedCount
      (realMessage (G 0) (top 0) (outside 0) (canSelect 0) (canOmit 0))
      (realMessage (G 1) (top 1) (outside 1) (canSelect 1) (canOmit 1))
      (realMessage (G 2) (top 2) (outside 2) (canSelect 2) (canOmit 2)) +
    rootUnoccupiedCount
      (realMessage (G 0) (top 0) (outside 0) (canSelect 0) (canOmit 0))
      (realMessage (G 1) (top 1) (outside 1) (canSelect 1) (canOmit 1))
      (realMessage (G 2) (top 2) (outside 2) (canSelect 2) (canOmit 2)) =
    (Nat.card (Finished (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit)) : ℝ) := by
  classical
  let _ (i : Fin 3) : Fintype (V i) := Fintype.ofFinite (V i)
  rw [rootOccupiedCount_eq_actual_card, rootUnoccupiedCount_eq_actual_card, finished_card]
  simp only [Nat.cast_add]

/-- This is the occupation fraction of the actual finished configurations. -/
theorem occupiedFraction_three :
    occupiedFraction (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit) =
    rootOccupiedCount
      (realMessage (G 0) (top 0) (outside 0) (canSelect 0) (canOmit 0))
      (realMessage (G 1) (top 1) (outside 1) (canSelect 1) (canOmit 1))
      (realMessage (G 2) (top 2) (outside 2) (canSelect 2) (canOmit 2)) /
    (rootOccupiedCount
      (realMessage (G 0) (top 0) (outside 0) (canSelect 0) (canOmit 0))
      (realMessage (G 1) (top 1) (outside 1) (canSelect 1) (canOmit 1))
      (realMessage (G 2) (top 2) (outside 2) (canSelect 2) (canOmit 2)) +
    rootUnoccupiedCount
      (realMessage (G 0) (top 0) (outside 0) (canSelect 0) (canOmit 0))
      (realMessage (G 1) (top 1) (outside 1) (canSelect 1) (canOmit 1))
      (realMessage (G 2) (top 2) (outside 2) (canSelect 2) (canOmit 2))) := by
  rw [occupiedFraction_eq_card_ratio, rootTotalCount_eq_actual_card,
    rootOccupiedCount_eq_actual_card]

theorem rootTotalCount_pos_of_actual_card_pos
    (h : 0 < Nat.card (Finished (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit))) :
    0 < rootOccupiedCount
      (realMessage (G 0) (top 0) (outside 0) (canSelect 0) (canOmit 0))
      (realMessage (G 1) (top 1) (outside 1) (canSelect 1) (canOmit 1))
      (realMessage (G 2) (top 2) (outside 2) (canSelect 2) (canOmit 2)) +
    rootUnoccupiedCount
      (realMessage (G 0) (top 0) (outside 0) (canSelect 0) (canOmit 0))
      (realMessage (G 1) (top 1) (outside 1) (canSelect 1) (canOmit 1))
      (realMessage (G 2) (top 2) (outside 2) (canSelect 2) (canOmit 2)) := by
  rw [rootTotalCount_eq_actual_card]
  exact Nat.cast_pos.mpr h

end ThreeChildren

end FranklTreeConfigurations
