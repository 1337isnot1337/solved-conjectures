import Conjectures.LonelinessFiveSpeedPlaneFiberData
import Conjectures.LonelinessFiveSpeedFiberMasks
import Conjectures.LonelinessFiveSpeedScalarInverse

/-! Binding of affine fiber certificates to the literal nine integer maps
and their stated parameter forms. Projective normalization and the integer
prime-product lift are separate from these finite arithmetic checks. -/

namespace Loneliness.FiveSpeedCertificate

def integerResidue (p : ℕ) (a : ℤ) : ℕ := (a % (p : ℤ)).toNat

def residue3 (p : ℕ) (a : ThreeIntegerVector) (x y z : ℕ) : ℕ :=
  (integerResidue p (a 0) * x + integerResidue p (a 1) * y +
    integerResidue p (a 2) * z) % p

/-- The inverse field is only a proposed witness. `rowCheck` verifies it
before any mask identity is used. -/
def fullScalarInverse (p : ℕ) (table : Array ScalarMaskEntry) (a : ℕ) : ℕ :=
  let s := scalarInverse table (foldResidue p a)
  if a % p ≤ p / 2 then s else p - s

def planeFiberRow (p : ℕ) (table : Array ScalarMaskEntry)
    (a : ThreeIntegerVector) (x y : ℕ) : FiberRow where
  offset := (integerResidue p (a 0) * x + integerResidue p (a 1) * y) % p
  slope := integerResidue p (a 2)
  inverse := fullScalarInverse p table (integerResidue p (a 2))

theorem planeFiberRow_mod (p : ℕ) (table : Array ScalarMaskEntry)
    (a : ThreeIntegerVector) (x y z : ℕ) :
    rowValue (planeFiberRow p table a x y) z % p = residue3 p a x y z := by
  simp only [rowValue, planeFiberRow, residue3, Nat.add_mod, Nat.mul_mod, Nat.mod_mod]

def planeFiberRows (p : ℕ) (table : Array ScalarMaskEntry)
    (k : Fin 9) (x y : ℕ) : List FiberRow :=
  (List.ofFn (canonicalMaps k)).map (fun a => planeFiberRow p table a x y)

def planeFiberForms (p : ℕ) (table : Array ScalarMaskEntry)
    (k : Fin 9) (x y : ℕ) : List FiberRow :=
  (planeStructuralForms k).map (fun a => planeFiberRow p table a x y)

/-- These labels cover `(1,i,z)`, `(0,1,z)`, and `(0,0,z)`. The last family
contains the remaining projective point `(0,0,1)` and the zero vector. -/
def fiberLabels (p : ℕ) (i : Fin (p + 2)) : ℕ × ℕ :=
  if i.val < p then (1, i.val) else (0, if i.val = p then 1 else 0)

def canonicalFiberCheck (p : ℕ) (table : Array ScalarMaskEntry)
    (k : Fin 9) (i : Fin (p + 2)) (certificate : FiberCertificate) : Bool :=
  let xy := fiberLabels p i
  fiberCheck p (scalarMask p table)
    (planeFiberRows p table k xy.1 xy.2)
    (planeFiberForms p table k xy.1 xy.2) certificate

def PlaneFiberOutcome (p : ℕ) (k : Fin 9) (x y z : ℕ) : Prop :=
  (∃ a ∈ planeStructuralForms k, residue3 p a x y z = 0) ∨
    ∃ t, 0 < t ∧ t < p ∧ ∀ j : Fin 5, good p t (residue3 p (canonicalMaps k j) x y z)

def CanonicalProjectiveCover (p : ℕ) (k : Fin 9) : Prop :=
  ∀ i : Fin (p + 2), ∀ z, z < p →
    PlaneFiberOutcome p k (fiberLabels p i).1 (fiberLabels p i).2 z

theorem canonicalFiberCheck_sound (p : ℕ) (table : Array ScalarMaskEntry)
    (k : Fin 9) (i : Fin (p + 2)) (certificate : FiberCertificate)
    (htable : scalarTableCheck p table = true)
    (hcheck : canonicalFiberCheck p table k i certificate = true)
    (z : ℕ) (hz : z < p) :
    PlaneFiberOutcome p k (fiberLabels p i).1 (fiberLabels p i).2 z := by
  let x := (fiberLabels p i).1
  let y := (fiberLabels p i).2
  have hc : fiberCheck p (scalarMask p table)
      (planeFiberRows p table k x y) (planeFiberForms p table k x y) certificate = true :=
    hcheck
  rcases checked_fiber_sound p table _ _ certificate htable hc z hz with hroot | hwitness
  · obtain ⟨row, hrow, hzrow⟩ := hroot
    obtain ⟨a, ha, rfl⟩ := List.mem_map.mp hrow
    exact Or.inl ⟨a, ha, (planeFiberRow_mod p table a x y z) ▸ hzrow⟩
  · obtain ⟨t, _, htpos, htlt, hgood⟩ := hwitness
    apply Or.inr
    refine ⟨t, htpos, htlt, ?_⟩
    intro j
    have hj : planeFiberRow p table (canonicalMaps k j) x y ∈ planeFiberRows p table k x y :=
      List.mem_map.mpr ⟨canonicalMaps k j, List.mem_ofFn.mpr ⟨j, rfl⟩, rfl⟩
    have hh := (good_mod_right p t _).mpr (hgood _ hj)
    rw [planeFiberRow_mod] at hh
    exact hh

theorem checked_canonical_projective_cover (p : ℕ) (table : Array ScalarMaskEntry)
    (k : Fin 9) (certificates : Array FiberCertificate)
    (htable : scalarTableCheck p table = true)
    (hcheck : ∀ i : Fin (p + 2), canonicalFiberCheck p table k i
      (certificates[i.val]?.getD (.whole 0)) = true) :
    CanonicalProjectiveCover p k := by
  intro i z hz
  exact canonicalFiberCheck_sound p table k i _ htable (hcheck i) z hz

end Loneliness.FiveSpeedCertificate
