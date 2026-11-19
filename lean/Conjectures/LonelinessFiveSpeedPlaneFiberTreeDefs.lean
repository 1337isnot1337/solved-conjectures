import Conjectures.LonelinessFiveSpeedPlaneFiberDefs
import Conjectures.LonelinessFiveSpeedScalarTree

/-! Direct tree lookup and finite interval blocks for plane certificates.
The checked proposition is the same projective cover used by the scalar-array
certificates. Each interval can be checked in a separate kernel reduction. -/

namespace Loneliness.FiveSpeedCertificate

def fullTreeInverse (p : ℕ) (tree : ScalarTree) (a : ℕ) : ℕ :=
  let s := treeInverse tree (foldResidue p a)
  if a % p ≤ p / 2 then s else p - s

theorem fullTreeInverse_eq_fullScalarInverse (p : ℕ) (tree : ScalarTree) (a : ℕ)
    (hvalid : tree.valid = true) :
    fullTreeInverse p tree a = fullScalarInverse p (treeTable tree) a := by
  simp only [fullTreeInverse, fullScalarInverse,
    treeInverse_eq_scalarInverse tree _ hvalid]

def planeTreeFiberRow (p : ℕ) (tree : ScalarTree)
    (a : ThreeIntegerVector) (x y : ℕ) : FiberRow where
  offset := (integerResidue p (a 0) * x + integerResidue p (a 1) * y) % p
  slope := integerResidue p (a 2)
  inverse := fullTreeInverse p tree (integerResidue p (a 2))

theorem planeTreeFiberRow_eq (p : ℕ) (tree : ScalarTree)
    (a : ThreeIntegerVector) (x y : ℕ) (hvalid : tree.valid = true) :
    planeTreeFiberRow p tree a x y = planeFiberRow p (treeTable tree) a x y := by
  simp only [planeTreeFiberRow, planeFiberRow,
    fullTreeInverse_eq_fullScalarInverse p tree _ hvalid]

def planeTreeFiberRows (p : ℕ) (tree : ScalarTree)
    (k : Fin 9) (x y : ℕ) : List FiberRow :=
  (List.ofFn (canonicalMaps k)).map (fun a => planeTreeFiberRow p tree a x y)

def planeTreeFiberForms (p : ℕ) (tree : ScalarTree)
    (k : Fin 9) (x y : ℕ) : List FiberRow :=
  (planeStructuralForms k).map (fun a => planeTreeFiberRow p tree a x y)

theorem planeTreeFiberRows_eq (p : ℕ) (tree : ScalarTree)
    (k : Fin 9) (x y : ℕ) (hvalid : tree.valid = true) :
    planeTreeFiberRows p tree k x y = planeFiberRows p (treeTable tree) k x y := by
  simp only [planeTreeFiberRows, planeFiberRows,
    planeTreeFiberRow_eq p tree _ x y hvalid]

theorem planeTreeFiberForms_eq (p : ℕ) (tree : ScalarTree)
    (k : Fin 9) (x y : ℕ) (hvalid : tree.valid = true) :
    planeTreeFiberForms p tree k x y = planeFiberForms p (treeTable tree) k x y := by
  simp only [planeTreeFiberForms, planeFiberForms,
    planeTreeFiberRow_eq p tree _ x y hvalid]

def canonicalTreeFiberCheck (p : ℕ) (tree : ScalarTree)
    (k : Fin 9) (i : Fin (p + 2)) (certificate : FiberCertificate) : Bool :=
  let xy := fiberLabels p i
  fiberCheck p (treeMask p tree)
    (planeTreeFiberRows p tree k xy.1 xy.2)
    (planeTreeFiberForms p tree k xy.1 xy.2) certificate

theorem canonicalTreeFiberCheck_eq (p : ℕ) (tree : ScalarTree)
    (k : Fin 9) (i : Fin (p + 2)) (certificate : FiberCertificate)
    (hvalid : tree.valid = true) :
    canonicalTreeFiberCheck p tree k i certificate =
      canonicalFiberCheck p (treeTable tree) k i certificate := by
  have hG : treeMask p tree = scalarMask p (treeTable tree) :=
    funext (fun u => treeMask_eq_scalarMask p tree u hvalid)
  simp only [canonicalTreeFiberCheck, canonicalFiberCheck, hG,
    planeTreeFiberRows_eq p tree _ _ _ hvalid,
    planeTreeFiberForms_eq p tree _ _ _ hvalid]

theorem canonicalTreeFiberCheck_sound (p : ℕ) (tree : ScalarTree)
    (k : Fin 9) (i : Fin (p + 2)) (certificate : FiberCertificate)
    (htable : scalarTreeCheck p tree = true)
    (hcheck : canonicalTreeFiberCheck p tree k i certificate = true)
    (z : ℕ) (hz : z < p) :
    PlaneFiberOutcome p k (fiberLabels p i).1 (fiberLabels p i).2 z := by
  apply canonicalFiberCheck_sound p (treeTable tree) k i certificate
    (scalarTreeCheck_table p tree htable) _ z hz
  rwa [canonicalTreeFiberCheck_eq p tree k i certificate
    (scalarTreeCheck_valid p tree htable)] at hcheck

def CanonicalProjectiveBlock (p : ℕ) (k : Fin 9) (start stop : ℕ) : Prop :=
  ∀ i : Fin (p + 2), start ≤ i.val → i.val < stop → ∀ z, z < p →
    PlaneFiberOutcome p k (fiberLabels p i).1 (fiberLabels p i).2 z

theorem canonicalProjectiveBlock_append (p : ℕ) (k : Fin 9) (a b c : ℕ)
    (hleft : CanonicalProjectiveBlock p k a b)
    (hright : CanonicalProjectiveBlock p k b c) :
    CanonicalProjectiveBlock p k a c := by
  intro i ha hc
  by_cases hb : i.val < b
  · exact hleft i ha hb
  · exact hright i (Nat.le_of_not_gt hb) hc

theorem canonicalProjectiveCover_of_block (p : ℕ) (k : Fin 9)
    (h : CanonicalProjectiveBlock p k 0 (p + 2)) : CanonicalProjectiveCover p k :=
  fun i => h i (Nat.zero_le _) i.isLt

theorem checked_canonical_tree_projective_block (p : ℕ) (tree : ScalarTree)
    (k : Fin 9) (start count : ℕ) (hwithin : start + count ≤ p + 2)
    (certificates : Array FiberCertificate)
    (htable : scalarTreeCheck p tree = true)
    (hcheck : ∀ j : Fin count, canonicalTreeFiberCheck p tree k
      ⟨start + j.val, by omega⟩ (certificates[j.val]?.getD (.whole 0)) = true) :
    CanonicalProjectiveBlock p k start (start + count) := by
  intro i hlo hhi z hz
  let j : Fin count := ⟨i.val - start, by omega⟩
  have hj : (⟨start + j.val, by omega⟩ : Fin (p + 2)) = i := by
    apply Fin.ext
    dsimp [j]
    omega
  have hout := canonicalTreeFiberCheck_sound p tree k
    ⟨start + j.val, by omega⟩ (certificates[j.val]?.getD (.whole 0))
    htable (hcheck j) z hz
  simpa only [hj] using hout

end Loneliness.FiveSpeedCertificate
