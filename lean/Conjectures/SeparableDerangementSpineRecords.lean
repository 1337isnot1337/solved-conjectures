module

public import Conjectures.SeparableDerangementTreeDiagonals
public import Mathlib.Algebra.Order.BigOperators.Group.Finset
public import Mathlib.Basic.Finite.Sigma

/-! A specified finite spine record fixes the side trees but leaves
its terminal subtree free. At sufficiently large total leaf count
the selected child is strictly the largest throughout the record. -/

@[expose] public section

open scoped BigOperators

namespace SeparableDerangements.SchroederTree

theorem arity_le_leafCount {k : ℕ} (child : Fin (k + 2) → SchroederTree) :
    k + 2 ≤ (.node k child : SchroederTree).leafCount := by
  change k + 2 ≤ ∑ j, (child j).leafCount
  calc
    k + 2 = ∑ _ : Fin (k + 2), 1 := by simp
    _ ≤ _ := Finset.sum_le_sum (fun j _ => leafCount_pos (child j))

theorem child_leafCount_lt {k : ℕ} (child : Fin (k + 2) → SchroederTree) (i : Fin (k + 2)) :
    (child i).leafCount < (.node k child : SchroederTree).leafCount := by
  obtain ⟨j, hj⟩ := exists_ne i
  exact Finset.single_lt_sum (f := fun k => (child k).leafCount) hj (Finset.mem_univ i) (Finset.mem_univ j)
    (leafCount_pos (child j)) (fun _ _ _ => Nat.zero_le _)

/-- There are finitely many ordered Schröder trees with a given leaf count. -/
theorem finite_leafCount (n : ℕ) : Finite {t : SchroederTree // t.leafCount = n} := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    let Smaller := Σ m : Fin n, {t : SchroederTree // t.leafCount = m.val}
    have : ∀ m : Fin n, Finite {t : SchroederTree // t.leafCount = m.val} :=
      fun m => ih m.val m.isLt
    have : Finite Smaller := inferInstanceAs (Finite (Σ m : Fin n, {t : SchroederTree //
      t.leafCount = m.val}))
    let Shapes := Σ k : Fin n, (Fin (k.val + 2) → Smaller)
    have : Finite Shapes := inferInstanceAs (Finite (Σ k : Fin n, (Fin (k.val + 2) → Smaller)))
    let encode : {t : SchroederTree // t.leafCount = n} → Option Shapes
      | ⟨.leaf, _⟩ => none
      | ⟨.node k child, h⟩ =>
        some ⟨⟨k, by
          have hArity := arity_le_leafCount child
          rw [h] at hArity
          omega⟩, fun j => ⟨⟨(child j).leafCount, (child_leafCount_lt child j).trans_eq h⟩,
            ⟨child j, rfl⟩⟩⟩
    let decode : Option Shapes → SchroederTree
      | none => .leaf
      | some ⟨k, branches⟩ => .node k.val (fun i => (branches i).2.val)
    have hDecode (t : {t : SchroederTree // t.leafCount = n}) : decode (encode t) = t.val := by
      rcases t with ⟨t, h⟩
      cases t <;> rfl
    exact Finite.of_injective encode (fun x y h => Subtype.ext ((hDecode x).symm.trans
      ((congrArg decode h).trans (hDecode y))))

/-- Every positive leaf count is attained, by a leaf or a star. -/
theorem exists_leafCount (n : ℕ) (h : 0 < n) : ∃ t : SchroederTree, t.leafCount = n := by
  rcases n with _ | n
  · omega
  rcases n with _ | n
  · exact ⟨.leaf, rfl⟩
  exact ⟨.node n (fun _ => .leaf), by simp [leafCount]⟩

/-- One step of the record consists of the selected child index and
    the complete shapes of all other children. -/
structure SpineFrame where
  arityOffset : ℕ
  selected : Fin (arityOffset + 2)
  siblings : (j : Fin (arityOffset + 2)) → j ≠ selected → SchroederTree

namespace SpineFrame

/-- Fill the selected child slot with a terminal tree. -/
def fillChild (f : SpineFrame) (t : SchroederTree) (j : Fin (f.arityOffset + 2)) :
    SchroederTree :=
  if h : j = f.selected then t else f.siblings j h

/-- Reconstruct the internal vertex with the specified side trees. -/
def plug (f : SpineFrame) (t : SchroederTree) : SchroederTree :=
  .node f.arityOffset (f.fillChild t)

/-- Number of leaves fixed by this record step. -/
def sideLeaves (f : SpineFrame) : ℕ :=
  ∑ j : Fin (f.arityOffset + 2), if h : j = f.selected then 0 else (f.siblings j h).leafCount

@[simp] theorem fillChild_selected (f : SpineFrame) (t : SchroederTree) :
    f.fillChild t f.selected = t := by
  unfold fillChild
  rw [dite_eq_left rfl]

theorem plug_injective (f : SpineFrame) : Function.Injective f.plug := by
  intro x y h
  have he := (SchroederTree.node.inj h).2
  have hh := congrFun (eq_of_heq he) f.selected
  simpa only [fillChild_selected] using hh

@[simp] theorem leafCount_plug (f : SpineFrame) (t : SchroederTree) :
    (f.plug t).leafCount = f.sideLeaves + t.leafCount := by
  change (∑ j, (f.fillChild t j).leafCount) = f.sideLeaves + t.leafCount
  unfold sideLeaves
  calc
    _ = ∑ j : Fin (f.arityOffset + 2),
        ((if h : j = f.selected then 0 else (f.siblings j h).leafCount) +
          (if j = f.selected then t.leafCount else 0)) := by
      apply Finset.sum_congr rfl
      intro j _
      by_cases h : j = f.selected
      · subst j
        simp [fillChild]
      · simp [fillChild, h]
    _ = _ := by rw [Finset.sum_add_distrib]; simp

/-- The recorded child is the largest, ties broken by smaller index. -/
def SelectsFirstLargest (f : SpineFrame) (t : SchroederTree) : Prop :=
  (∀ j, (f.fillChild t j).leafCount ≤ t.leafCount) ∧
    ∀ j < f.selected, (f.fillChild t j).leafCount < t.leafCount

/-- If the continuation has more leaves than all side children
    together, it is selected under the actual tie-breaking rule. -/
theorem selectsFirstLargest_of_sideLeaves_lt (f : SpineFrame) (t : SchroederTree)
    (h : f.sideLeaves < t.leafCount) : f.SelectsFirstLargest t := by
  have hLess (j : Fin (f.arityOffset + 2)) (hj : j ≠ f.selected) :
      (f.fillChild t j).leafCount < t.leafCount := by
    have hSum : (if h' : j = f.selected then 0 else (f.siblings j h').leafCount) ≤ f.sideLeaves :=
      Finset.single_le_sum (f := fun i =>
        if h' : i = f.selected then 0 else (f.siblings i h').leafCount)
        (fun _ _ => Nat.zero_le _) (Finset.mem_univ j)
    exact lt_of_le_of_lt (by simpa only [fillChild, dite_eq_right hj] using hSum) h
  refine ⟨?_, fun j hj => hLess j (ne_of_lt hj)⟩
  intro j
  by_cases hj : j = f.selected
  · subst j
    rw [fillChild_selected]
  · exact (hLess j hj).le

end SpineFrame

/-- Record steps ordered from the root toward the terminal subtree. -/
abbrev SpineRecord := List SpineFrame

namespace SpineRecord

def sideLeaves (r : SpineRecord) : ℕ := (r.map SpineFrame.sideLeaves).sum

def plug (r : SpineRecord) (t : SchroederTree) : SchroederTree :=
  r.foldr SpineFrame.plug t

/-- Read the specified shape and child index at each successive
    largest-child step. -/
def Matches : SpineRecord → SchroederTree → Prop
  | [], _ => True
  | f :: r, t => ∃ u, t = f.plug u ∧ f.SelectsFirstLargest u ∧ Matches r u

@[simp] theorem leafCount_plug (r : SpineRecord) (t : SchroederTree) :
    (r.plug t).leafCount = r.sideLeaves + t.leafCount := by
  induction r with
  | nil => simp [plug, sideLeaves]
  | cons f r ih =>
    change (f.plug (plug r t)).leafCount =
      f.sideLeaves + sideLeaves r + t.leafCount
    rw [SpineFrame.leafCount_plug, ih, Nat.add_assoc]

theorem plug_injective (r : SpineRecord) : Function.Injective r.plug := by
  induction r with
  | nil => exact fun _ _ h => h
  | cons f r ih => exact f.plug_injective.comp ih

theorem matches_plug_of_sideLeaves_lt (r : SpineRecord) (t : SchroederTree)
    (h : r.sideLeaves < t.leafCount) : r.Matches (r.plug t) := by
  induction r with
  | nil => trivial
  | cons f r ih =>
    change f.sideLeaves + sideLeaves r < t.leafCount at h
    refine ⟨plug r t, rfl, f.selectsFirstLargest_of_sideLeaves_lt _ ?_, ih ?_⟩
    · rw [leafCount_plug]
      omega
    · omega

theorem exists_terminal_of_matches (r : SpineRecord) (t : SchroederTree)
    (h : r.Matches t) : ∃ u, r.plug u = t := by
  induction r generalizing t with
  | nil => exact ⟨t, rfl⟩
  | cons f r ih =>
    obtain ⟨v, rfl, _, hv⟩ := h
    obtain ⟨u, hu⟩ := ih v hv
    exact ⟨u, congrArg f.plug hu⟩

/-- For a fixed prefix and sufficiently large leaf count, the finite
    trees with this recorded prefix are exactly the freely chosen
    terminal trees of the remaining leaf count. -/
noncomputable def fiberEquiv (r : SpineRecord) (n : ℕ)
    (h : r.sideLeaves < n - r.sideLeaves) :
    {u : SchroederTree // u.leafCount = n - r.sideLeaves} ≃
      {t : SchroederTree // t.leafCount = n ∧ r.Matches t} := by
  let f (u : {u : SchroederTree // u.leafCount = n - r.sideLeaves}) :
      {t : SchroederTree // t.leafCount = n ∧ r.Matches t} :=
    ⟨r.plug u.val, by rw [leafCount_plug, u.property]; omega,
      r.matches_plug_of_sideLeaves_lt _ (u.property.symm ▸ h)⟩
  apply Equiv.ofBijective f
  constructor
  · intro a b hab
    exact Subtype.ext (r.plug_injective (congrArg Subtype.val hab))
  · intro t
    obtain ⟨u, hu⟩ := r.exists_terminal_of_matches t.val t.property.2
    have hCard : r.sideLeaves + u.leafCount = n :=
      (leafCount_plug r u).symm.trans ((congrArg leafCount hu).trans t.property.1)
    exact ⟨⟨u, by omega⟩, Subtype.ext hu⟩

/-- The numerator of the uniform probability of a fixed record is
    the exact number of trees with the remaining leaf count. -/
theorem card_matches (r : SpineRecord) (n : ℕ)
    (h : r.sideLeaves < n - r.sideLeaves) :
    Nat.card {t : SchroederTree // t.leafCount = n ∧ r.Matches t} =
      Nat.card {t : SchroederTree // t.leafCount = n - r.sideLeaves} :=
  (Nat.card_congr (r.fiberEquiv n h)).symm

end SpineRecord

end SeparableDerangements.SchroederTree
