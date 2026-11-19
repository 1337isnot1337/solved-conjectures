module

public import Conjectures.FranklTreeGluing
public import Mathlib.Data.Fintype.Option
public import Mathlib.Data.Fintype.Sigma

/-! Exact configuration counts for a root attached to disjoint branches.

The three states are subtypes of actual independent vertex sets satisfying
the stated boundary permissions. Explicit equivalences prove the recurrence
for distinct configurations. No recurrence or count identity is an input. -/
@[expose] public section

namespace FranklTreeConfigurations

open SimpleGraph FranklTreeGluing

variable {W : Type*}

abbrev Occupied (G : SimpleGraph W) (top : W) (outside canSelect canOmit : Set W) :=
  {S : Set W // Valid G top outside canSelect canOmit S ∧ top ∈ S}

abbrev Omitted (G : SimpleGraph W) (top : W) (outside canSelect canOmit : Set W) :=
  {S : Set W // Valid G top outside canSelect canOmit S ∧ top ∉ S}

abbrev Dom (G : SimpleGraph W) (top : W) (outside canSelect canOmit : Set W) :=
  {S : Set W // Valid G top outside canSelect canOmit S ∧
    top ∉ S ∧ Dominated G outside S top}

abbrev NeedsParent (G : SimpleGraph W) (top : W) (outside canSelect canOmit : Set W) :=
  {S : Set W // Valid G top outside canSelect canOmit S ∧
    top ∉ S ∧ ¬Dominated G outside S top}

abbrev Finished (G : SimpleGraph W) (top : W) (outside canSelect canOmit : Set W) :=
  {S : Set W // Valid G top outside canSelect canOmit S ∧
    (top ∈ S ∨ Dominated G outside S top)}

noncomputable def omittedSplitEquiv (G : SimpleGraph W) (top : W)
    (outside canSelect canOmit : Set W) :
    Omitted G top outside canSelect canOmit ≃
      Dom G top outside canSelect canOmit ⊕ NeedsParent G top outside canSelect canOmit := by
  classical
  refine {
    toFun := fun S =>
      if h : Dominated G outside S.1 top then
        .inl ⟨S.1, S.2.1, S.2.2, h⟩
      else .inr ⟨S.1, S.2.1, S.2.2, h⟩
    invFun := fun S => S.elim
      (fun S => ⟨S.1, S.2.1, S.2.2.1⟩)
      (fun S => ⟨S.1, S.2.1, S.2.2.1⟩)
    left_inv := ?_
    right_inv := ?_
  }
  · intro S
    dsimp
    split <;> rfl
  · intro S
    cases S with
    | inl S =>
        dsimp
        split
        · rfl
        · rename_i h
          exact False.elim (h S.2.2.2)
    | inr S =>
        dsimp
        split
        · rename_i h
          exact False.elim (S.2.2.2 h)
        · rfl

noncomputable def finishedSplitEquiv (G : SimpleGraph W) (top : W)
    (outside canSelect canOmit : Set W) :
    Finished G top outside canSelect canOmit ≃
      Occupied G top outside canSelect canOmit ⊕ Dom G top outside canSelect canOmit := by
  classical
  refine {
    toFun := fun S =>
      if h : top ∈ S.1 then .inl ⟨S.1, S.2.1, h⟩
      else .inr ⟨S.1, S.2.1, h, S.2.2.elim (fun ht => False.elim (h ht)) id⟩
    invFun := fun S => S.elim
      (fun S => ⟨S.1, S.2.1, Or.inl S.2.2⟩)
      (fun S => ⟨S.1, S.2.1, Or.inr S.2.2.2⟩)
    left_inv := ?_
    right_inv := ?_
  }
  · intro S
    dsimp
    split <;> rfl
  · intro S
    cases S with
    | inl S =>
        dsimp
        split
        · rfl
        · rename_i h
          exact False.elim (h S.2.2)
    | inr S =>
        dsimp
        split
        · rename_i h
          exact False.elim (S.2.2.1 h)
        · rfl

theorem omitted_card [Finite W] (G : SimpleGraph W) (top : W)
    (outside canSelect canOmit : Set W) :
    Nat.card (Omitted G top outside canSelect canOmit) =
      Nat.card (Dom G top outside canSelect canOmit) +
        Nat.card (NeedsParent G top outside canSelect canOmit) := by
  rw [Nat.card_congr (omittedSplitEquiv G top outside canSelect canOmit), Nat.card_sum]

theorem finished_card [Finite W] (G : SimpleGraph W) (top : W)
    (outside canSelect canOmit : Set W) :
    Nat.card (Finished G top outside canSelect canOmit) =
      Nat.card (Occupied G top outside canSelect canOmit) +
        Nat.card (Dom G top outside canSelect canOmit) := by
  rw [Nat.card_congr (finishedSplitEquiv G top outside canSelect canOmit), Nat.card_sum]

variable {ι : Type*} {V : ι → Type*}

def branchSet (S : Set (Option (Sigma V))) (i : ι) : Set (V i) :=
  {v | some ⟨i, v⟩ ∈ S}

theorem glueSet_branchSet (S : Set (Option (Sigma V))) :
    glueSet (none ∈ S) (branchSet S) = S := by
  ext v
  cases v <;> rfl

theorem branchSet_glueSet (r : Prop) (S : ∀ i, Set (V i)) :
    branchSet (glueSet r S) = S := by
  funext i
  rfl

variable (G : ∀ i, SimpleGraph (V i)) (top : ∀ i, V i)
variable (outside canSelect canOmit : ∀ i, Set (V i))

theorem valid_iff_branches (S : Set (Option (Sigma V))) :
    Valid (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit) S ↔
    (∀ i, Valid (G i) (top i) (outside i) (canSelect i) (canOmit i) (branchSet S i)) ∧
      (none ∈ S → ∀ i, top i ∉ branchSet S i) ∧
      (none ∉ S → ∀ i, top i ∉ branchSet S i →
        Dominated (G i) (outside i) (branchSet S i) (top i)) := by
  simpa only [glueSet_branchSet] using
    (glue_valid_iff G top outside canSelect canOmit (branchSet S) (none ∈ S))

omit canSelect canOmit in
theorem dominated_root_iff_branches (S : Set (Option (Sigma V))) :
    Dominated (attachedGraph G top) (outsideSet outside) S none ↔
      ∃ i, top i ∈ branchSet S i := by
  simpa only [glueSet_branchSet] using
    (dominated_root_iff G top outside (branchSet S) (none ∈ S))

def occupiedBranchesEquiv :
    Occupied (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit) ≃
    ∀ i, Omitted (G i) (top i) (outside i) (canSelect i) (canOmit i) where
  toFun S i := ⟨branchSet S.1 i,
    ((valid_iff_branches G top outside canSelect canOmit S.1).mp S.2.1).1 i,
    ((valid_iff_branches G top outside canSelect canOmit S.1).mp S.2.1).2.1 S.2.2 i⟩
  invFun f := ⟨glueSet True (fun i => (f i).1),
    (glue_valid_iff G top outside canSelect canOmit (fun i => (f i).1) True).mpr
      ⟨fun i => (f i).2.1, fun _ i => (f i).2.2, fun h => False.elim (h trivial)⟩,
    trivial⟩
  left_inv S := by
    apply Subtype.ext
    ext v
    cases v with
    | none => exact ⟨fun _ => S.2.2, fun _ => trivial⟩
    | some v => rfl
  right_inv f := by
    funext i
    apply Subtype.ext
    rfl

noncomputable def omittedBranchesEquiv :
    Omitted (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit) ≃
    ∀ i, Finished (G i) (top i) (outside i) (canSelect i) (canOmit i) := by
  classical
  refine {
    toFun := fun S i => ⟨branchSet S.1 i,
      ((valid_iff_branches G top outside canSelect canOmit S.1).mp S.2.1).1 i, ?_⟩
    invFun := fun f => ⟨glueSet False (fun i => (f i).1),
      (glue_valid_iff G top outside canSelect canOmit (fun i => (f i).1) False).mpr
        ⟨fun i => (f i).2.1, fun h => False.elim h, ?_⟩,
      fun h => h⟩
    left_inv := ?_
    right_inv := ?_
  }
  · by_cases h : top i ∈ branchSet S.1 i
    · exact Or.inl h
    · exact Or.inr
        (((valid_iff_branches G top outside canSelect canOmit S.1).mp S.2.1).2.2 S.2.2 i h)
  · intro _ i hnot
    exact (f i).2.2.elim (fun h => False.elim (hnot h)) id
  · intro S
    apply Subtype.ext
    ext v
    cases v with
    | none => exact ⟨False.elim, fun h => S.2.2 h⟩
    | some v => rfl
  · intro f
    funext i
    apply Subtype.ext
    rfl

def needsParentBranchesEquiv :
    NeedsParent (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit) ≃
    ∀ i, Dom (G i) (top i) (outside i) (canSelect i) (canOmit i) where
  toFun S i := by
    have hnot : top i ∉ branchSet S.1 i := fun h =>
      S.2.2.2 ((dominated_root_iff_branches G top outside S.1).mpr ⟨i, h⟩)
    exact ⟨branchSet S.1 i,
      ((valid_iff_branches G top outside canSelect canOmit S.1).mp S.2.1).1 i,
      hnot,
      ((valid_iff_branches G top outside canSelect canOmit S.1).mp S.2.1).2.2 S.2.2.1 i hnot⟩
  invFun f := by
    refine ⟨glueSet False (fun i => (f i).1),
      (glue_valid_iff G top outside canSelect canOmit (fun i => (f i).1) False).mpr
        ⟨fun i => (f i).2.1, fun h => False.elim h, fun _ i _ => (f i).2.2.2⟩,
      (fun h => h), ?_⟩
    intro h
    obtain ⟨i, hi⟩ := (dominated_root_iff G top outside (fun i => (f i).1) False).mp h
    exact (f i).2.2.1 hi
  left_inv S := by
    apply Subtype.ext
    ext v
    cases v with
    | none => exact ⟨False.elim, fun h => S.2.2.1 h⟩
    | some v => rfl
  right_inv f := by
    funext i
    apply Subtype.ext
    rfl

section Finite

variable [Fintype ι] [∀ i, Finite (V i)]

theorem occupied_attached_card :
    Nat.card (Occupied (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit)) =
    ∏ i, (Nat.card (Dom (G i) (top i) (outside i) (canSelect i) (canOmit i)) +
      Nat.card (NeedsParent (G i) (top i) (outside i) (canSelect i) (canOmit i))) := by
  rw [Nat.card_congr (occupiedBranchesEquiv G top outside canSelect canOmit)]
  simp only [Nat.card_pi, omitted_card]

omit [∀ i, Finite (V i)] in
theorem needsParent_attached_card :
    Nat.card (NeedsParent (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit)) =
    ∏ i, Nat.card (Dom (G i) (top i) (outside i) (canSelect i) (canOmit i)) := by
  rw [Nat.card_congr (needsParentBranchesEquiv G top outside canSelect canOmit)]
  exact Nat.card_pi

theorem dominated_add_needsParent_attached_card :
    Nat.card (Dom (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit)) +
    Nat.card (NeedsParent (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit)) =
    ∏ i, (Nat.card (Occupied (G i) (top i) (outside i) (canSelect i) (canOmit i)) +
      Nat.card (Dom (G i) (top i) (outside i) (canSelect i) (canOmit i))) := by
  classical
  letI (i : ι) : Fintype (V i) := Fintype.ofFinite (V i)
  rw [← omitted_card, Nat.card_congr (omittedBranchesEquiv G top outside canSelect canOmit)]
  simp only [Nat.card_pi, finished_card]

theorem dominated_attached_card :
    Nat.card (Dom (attachedGraph G top) none (outsideSet outside)
      (rootFreeSet canSelect) (rootFreeSet canOmit)) =
    (∏ i, (Nat.card (Occupied (G i) (top i) (outside i) (canSelect i) (canOmit i)) +
      Nat.card (Dom (G i) (top i) (outside i) (canSelect i) (canOmit i)))) -
    ∏ i, Nat.card (Dom (G i) (top i) (outside i) (canSelect i) (canOmit i)) := by
  have h := dominated_add_needsParent_attached_card G top outside canSelect canOmit
  rw [needsParent_attached_card] at h
  omega

end Finite

end FranklTreeConfigurations
