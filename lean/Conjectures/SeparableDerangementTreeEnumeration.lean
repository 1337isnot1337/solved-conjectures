module

public import Conjectures.SeparableDerangementSpineRecords
public import Mathlib.Combinatorics.Enumerative.Schroder

/-! Extract the first child from a nonleaf tree. The remaining
ordered forest is either one tree or the child forest of a nonleaf
tree. This is the finite decomposition underlying the count. -/

@[expose] public section

open scoped BigOperators

namespace SeparableDerangements.SchroederTree

/-- Two trees of the specified total size. The second summand encodes
    a remainder forest with at least two root trees. -/
def RootFactors (n : ℕ) :=
  {p : SchroederTree × SchroederTree // p.1.leafCount + p.2.leafCount = n} ⊕
  {p : SchroederTree × SchroederTree // p.1.leafCount + p.2.leafCount = n ∧ 1 < p.2.leafCount}

def splitRoot (n : ℕ) (hn : 1 < n) :
    {t : SchroederTree // t.leafCount = n} → RootFactors n
  | ⟨.leaf, h⟩ => False.elim (by change 1 = n at h; omega)
  | ⟨.node 0 child, h⟩ => .inl ⟨(child 0, child 1), by
      have h' : (∑ i : Fin 2, (child i).leafCount) = n := h
      rwa [Fin.sum_univ_two] at h'⟩
  | ⟨.node (k + 1) child, h⟩ =>
    let tail := node k (fun i : Fin (k + 2) => child i.succ)
    .inr ⟨(child 0, tail), by
      constructor
      · have h' : (∑ i : Fin (k + 1 + 2), (child i).leafCount) = n := h
        rw [Fin.sum_univ_succ] at h'
        exact h'
      · exact lt_of_lt_of_le (by omega) (arity_le_leafCount _)⟩

def joinRoot (n : ℕ) : RootFactors n → {t : SchroederTree // t.leafCount = n}
  | .inl ⟨(a, b), h⟩ =>
    ⟨.node 0 (Fin.cases (motive := fun _ => SchroederTree) a fun _ => b), by
      change (∑ i : Fin 2, (Fin.cases (motive := fun _ => SchroederTree) a (fun _ => b) i).leafCount) = n
      rw [Fin.sum_univ_two]
      exact h⟩
  | .inr ⟨(a, .leaf), h⟩ => False.elim ((Nat.lt_irrefl 1) h.2)
  | .inr ⟨(a, .node k child), h⟩ =>
    ⟨.node (k + 1) (Fin.cases (motive := fun _ => SchroederTree) a child), by
      change (∑ i : Fin (k + 1 + 2), (Fin.cases (motive := fun _ => SchroederTree) a child i).leafCount) = n
      rw [Fin.sum_univ_succ]
      exact h.1⟩

/-- Exact root decomposition of every tree of size at least two. -/
def rootFactorsEquiv (n : ℕ) (hn : 1 < n) :
    {t : SchroederTree // t.leafCount = n} ≃ RootFactors n where
  toFun := splitRoot n hn
  invFun := joinRoot n
  left_inv := by
    rintro ⟨t, h⟩
    cases t with
    | leaf =>
      change 1 = n at h
      omega
    | node k child =>
      cases k with
      | zero =>
        apply Subtype.ext
        change node 0 (Fin.cases (child 0) (fun _ => child 1)) = node 0 child
        congr 1
        funext i
        refine Fin.cases rfl (fun j => ?_) i
        have hj : j = 0 := Subsingleton.elim _ _
        subst j
        rfl
      | succ k =>
        apply Subtype.ext
        change node (k + 1) (Fin.cases (child 0) (fun i => child i.succ)) = node (k + 1) child
        congr 1
        funext i
        exact Fin.cases rfl (fun _ => rfl) i
  right_inv := by
    rintro (⟨⟨a, b⟩, h⟩ | ⟨⟨a, b⟩, h⟩)
    · rfl
    · cases b with
      | leaf => exact ((Nat.lt_irrefl 1) h.2).elim
      | node k child => rfl

/-- The set of trees with the prescribed number of leaves. -/
abbrev LeafFiber (n : ℕ) := {t : SchroederTree // t.leafCount = n}

private instance (n : ℕ) : Finite (LeafFiber n) := finite_leafCount n

/-- The number of ordered Schröder trees with `n` leaves. -/
noncomputable def leafFiberCount (n : ℕ) : ℕ := Nat.card (LeafFiber n)

def pairSizesEquiv (n b : ℕ) (hb : 0 < b) :
    {p : SchroederTree × SchroederTree // p.1.leafCount + p.2.leafCount = n ∧ b ≤ p.2.leafCount} ≃
      (Σ k : Fin (n - b), LeafFiber (k.val + 1) × LeafFiber (n - (k.val + 1))) := by
  let into : {p : SchroederTree × SchroederTree //
        p.1.leafCount + p.2.leafCount = n ∧ b ≤ p.2.leafCount} ≃
      (Σ k : Fin (n - b), {p : SchroederTree × SchroederTree //
        p.1.leafCount = k.val + 1 ∧ p.2.leafCount = n - (k.val + 1)}) :=
    { toFun := fun p => by
        have hPos := p.val.1.leafCount_pos
        obtain ⟨hSize, hMin⟩ := p.property
        refine ⟨⟨p.val.1.leafCount - 1, by omega⟩, ⟨p.val, ?_, ?_⟩⟩ <;> dsimp <;> omega
      invFun := fun ⟨k, p⟩ => by
        have hk := k.isLt
        obtain ⟨ha, hz⟩ := p.property
        exact ⟨p.val, by omega, by omega⟩
      left_inv := fun _ => Subtype.ext rfl
      right_inv := by
        rintro ⟨k, p⟩
        apply Sigma.subtype_ext
        · apply Fin.ext
          change p.val.1.leafCount - 1 = k.val
          have := p.property.1
          omega
        · rfl }
  exact into.trans (Equiv.sigmaCongrRight fun k =>
    Equiv.subtypeProdEquivProd (p := fun t : SchroederTree => t.leafCount = k.val + 1)
      (q := fun t : SchroederTree => t.leafCount = n - (k.val + 1)))

def pairSizesOneEquiv (n : ℕ) :
    {p : SchroederTree × SchroederTree // p.1.leafCount + p.2.leafCount = n} ≃
      (Σ k : Fin (n - 1), LeafFiber (k.val + 1) × LeafFiber (n - (k.val + 1))) :=
  (Equiv.subtypeEquivRight fun (p : SchroederTree × SchroederTree) =>
    (and_iff_left (show 1 ≤ p.2.leafCount from leafCount_pos p.2)).symm).trans
    (pairSizesEquiv n 1 (by decide))

/-- Counting the two types of root factors gives the leaf-count
    recurrence with one copy for a singleton tail and two for longer tails. -/
theorem leafFiberCount_recurrence (n : ℕ) (hn : 1 < n) :
    leafFiberCount n =
      (∑ k : Fin (n - 1), leafFiberCount (k.val + 1) * leafFiberCount (n - (k.val + 1))) +
      (∑ k : Fin (n - 2), leafFiberCount (k.val + 1) * leafFiberCount (n - (k.val + 1))) := by
  let e := (rootFactorsEquiv n hn).trans
    (Equiv.sumCongr (pairSizesOneEquiv n) (pairSizesEquiv n 2 (by decide)))
  unfold leafFiberCount
  rw [Nat.card_congr e, Nat.card_sum, Nat.card_sigma, Nat.card_sigma]
  simp only [Nat.card_prod]

@[simp] theorem leafFiberCount_one : leafFiberCount 1 = 1 := by
  have : Subsingleton (LeafFiber 1) := by
    constructor
    intro a b
    obtain ⟨a, ha⟩ := a
    obtain ⟨b, hb⟩ := b
    apply Subtype.ext
    cases a with
    | leaf =>
      cases b with
      | leaf => rfl
      | node k child =>
        have h := arity_le_leafCount child
        omega
    | node k child =>
      have h := arity_le_leafCount child
      omega
  exact Nat.card_eq_one_iff_unique.mpr ⟨inferInstance, ⟨⟨.leaf, rfl⟩⟩⟩

@[simp] theorem leafFiberCount_two : leafFiberCount 2 = 1 := by
  rw [leafFiberCount_recurrence 2 (by decide)]
  simp

theorem leafFiberCount_succ (n : ℕ) (hn : 1 < n) :
    leafFiberCount (n + 1) =
      3 * leafFiberCount n +
        2 * ∑ i ∈ Finset.Ioo 0 (n - 1), leafFiberCount (i + 1) * leafFiberCount (n - i) := by
  let f (i : ℕ) := leafFiberCount (i + 1) * leafFiberCount (n - i)
  have hRec := leafFiberCount_recurrence (n + 1) (by omega)
  simp only [Nat.succ_sub_succ_eq_sub] at hRec
  change leafFiberCount (n + 1) = (∑ i : Fin n, f i) + ∑ i : Fin (n - 1), f i at hRec
  rw [Fin.sum_univ_eq_sum_range, Fin.sum_univ_eq_sum_range] at hRec
  have hRange : Finset.range n = insert (n - 1) (Finset.range (n - 1)) := by
    ext i
    simp only [Finset.mem_range, Finset.mem_insert]
    omega
  have hRange' : Finset.range (n - 1) = insert 0 (Finset.Ioo 0 (n - 1)) := by
    ext i
    simp only [Finset.mem_range, Finset.mem_insert, Finset.mem_Ioo]
    omega
  rw [hRange, Finset.sum_insert (by simp), hRange', Finset.sum_insert (by simp)] at hRec
  have hEdge : f (n - 1) = leafFiberCount n := by
    have hSum : n - 1 + 1 = n := by omega
    have hDiff : n - (n - 1) = 1 := by omega
    simp [f, hSum, hDiff]
  rw [hEdge, show f 0 = leafFiberCount n by simp [f]] at hRec
  exact hRec.trans (by
    change _ = 3 * leafFiberCount n + 2 * (∑ i ∈ Finset.Ioo 0 (n - 1), f i)
    omega)

/-- The literal finite tree count agrees with Mathlib’s small
    Schröder number at every positive leaf count. -/
theorem leafFiberCount_eq_smallSchroder (n : ℕ) (hn : 0 < n) :
    leafFiberCount n = Nat.smallSchroder n := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    rcases n with _ | _ | _ | n
    · omega
    · simp
    · simp [Nat.smallSchroder]
    · rw [leafFiberCount_succ (n + 2) (by omega), Nat.smallSchroder_succ (by omega)]
      rw [ih (n + 2) (by omega) (by omega)]
      congr 1
      congr 1
      apply Finset.sum_congr rfl
      intro i hi
      obtain ⟨hLo, hHi⟩ := Finset.mem_Ioo.mp hi
      rw [ih (i + 1) (by omega) (by omega), ih (n + 2 - i) (by omega) (by omega)]

end SeparableDerangements.SchroederTree
