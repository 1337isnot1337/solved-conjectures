import Conjectures.LonelinessFiveSpeedScalarInverse

/-! Counted binary trees provide direct scalar lookup during kernel reduction.
The checked leaves are the same half-table entries used by `scalarTableCheck`.
No balance condition is needed for soundness; generators may choose balanced trees. -/
namespace Loneliness.FiveSpeedCertificate

inductive ScalarTree where
  | leaf (entry : ScalarMaskEntry)
  | branch (leftCount : ℕ) (left right : ScalarTree)
  deriving Repr

namespace ScalarTree

def toList : ScalarTree → List ScalarMaskEntry
  | .leaf entry => [entry]
  | .branch _ left right => left.toList ++ right.toList

/-- Branch counts are checked against the literal left subtree. -/
def valid : ScalarTree → Bool
  | .leaf _ => true
  | .branch count left right =>
      decide (count = left.toList.length) && (left.valid && right.valid)

/-- Direct lookup visits only one child at each branch. -/
def lookup : ScalarTree → ℕ → Option ScalarMaskEntry
  | .leaf entry, n => if n = 0 then some entry else none
  | .branch count left right, n =>
      if n < count then left.lookup n else right.lookup (n - count)

def getD (tree : ScalarTree) (n : ℕ) (fallback : ScalarMaskEntry) : ScalarMaskEntry :=
  (tree.lookup n).getD fallback

theorem lookup_eq_getElem? (tree : ScalarTree) (n : ℕ)
    (hvalid : tree.valid = true) : tree.lookup n = tree.toList[n]? := by
  induction tree generalizing n with
  | leaf entry =>
      cases n <;> simp [lookup, toList]
  | branch count left right ihl ihr =>
      have hc : count = left.toList.length ∧ left.valid = true ∧ right.valid = true := by
        simpa only [valid, Bool.and_eq_true, decide_eq_true_eq] using hvalid
      rcases hc with ⟨rfl, hl, hr⟩
      by_cases hn : n < left.toList.length
      · rw [lookup, ite_eq_left hn, toList, List.getElem?_append_left hn]
        exact ihl n hl
      · rw [lookup, ite_eq_right hn, toList,
          List.getElem?_append_right (Nat.le_of_not_gt hn)]
        exact ihr (n - left.toList.length) hr

theorem getD_eq_list_getD (tree : ScalarTree) (n : ℕ) (fallback : ScalarMaskEntry)
    (hvalid : tree.valid = true) : tree.getD n fallback = tree.toList.getD n fallback := by
  rw [getD, lookup_eq_getElem? tree n hvalid, List.getD_eq_getElem?_getD]

end ScalarTree

/-- The existing table checker sees precisely the leaves in their indexed order. -/
def treeTable (tree : ScalarTree) : Array ScalarMaskEntry := tree.toList.toArray

def treeMaskLookup (tree : ScalarTree) (u : ℕ) : ℕ :=
  if u = 0 then 0 else
    match tree.lookup (u - 1) with
    | none => 0
    | some entry => entry.mask

def treeMask (p : ℕ) (tree : ScalarTree) (u : ℕ) : ℕ :=
  treeMaskLookup tree (foldResidue p u)

def treeInverse (tree : ScalarTree) (u : ℕ) : ℕ :=
  if u = 0 then 0 else
    match tree.lookup (u - 1) with
    | none => 0
    | some entry => entry.inverse

def scalarTreeCheck (p : ℕ) (tree : ScalarTree) : Bool :=
  tree.valid && scalarTableCheck p (treeTable tree)

theorem treeMaskLookup_eq_scalarMaskLookup (tree : ScalarTree) (u : ℕ)
    (hvalid : tree.valid = true) :
    treeMaskLookup tree u = scalarMaskLookup (treeTable tree) u := by
  simp only [treeMaskLookup, scalarMaskLookup, treeTable, List.getElem?_toArray,
    ScalarTree.lookup_eq_getElem? tree (u - 1) hvalid]
  rfl

theorem treeMask_eq_scalarMask (p : ℕ) (tree : ScalarTree) (u : ℕ)
    (hvalid : tree.valid = true) :
    treeMask p tree u = scalarMask p (treeTable tree) u := by
  exact treeMaskLookup_eq_scalarMaskLookup tree (foldResidue p u) hvalid

theorem treeInverse_eq_scalarInverse (tree : ScalarTree) (u : ℕ)
    (hvalid : tree.valid = true) :
    treeInverse tree u = scalarInverse (treeTable tree) u := by
  simp only [treeInverse, scalarInverse, treeTable, List.getElem?_toArray,
    ScalarTree.lookup_eq_getElem? tree (u - 1) hvalid]
  rfl

theorem scalarTreeCheck_valid (p : ℕ) (tree : ScalarTree)
    (hcheck : scalarTreeCheck p tree = true) : tree.valid = true :=
  (Bool.and_eq_true_iff.mp hcheck).1

theorem scalarTreeCheck_table (p : ℕ) (tree : ScalarTree)
    (hcheck : scalarTreeCheck p tree = true) : scalarTableCheck p (treeTable tree) = true :=
  (Bool.and_eq_true_iff.mp hcheck).2

/-- One scalar-tree check yields the full good-mask oracle, including multiplier zero. -/
theorem scalarTreeCheck_sound (p : ℕ) (tree : ScalarTree)
    (hcheck : scalarTreeCheck p tree = true) (u : ℕ) : GoodMask p u (treeMask p tree u) := by
  rw [treeMask_eq_scalarMask p tree u (scalarTreeCheck_valid p tree hcheck)]
  exact scalarTableCheck_sound p (treeTable tree) (scalarTreeCheck_table p tree hcheck) u

theorem scalarTreeCheck_inverse (p : ℕ) (tree : ScalarTree)
    (hcheck : scalarTreeCheck p tree = true) (u : ℕ)
    (hu : 0 < u) (hhalf : 2 * u ≤ p) : u * treeInverse tree u % p = 1 % p := by
  rw [treeInverse_eq_scalarInverse tree u (scalarTreeCheck_valid p tree hcheck)]
  exact scalarTableCheck_inverse p (treeTable tree)
    (scalarTreeCheck_table p tree hcheck) u hu hhalf

end Loneliness.FiveSpeedCertificate
