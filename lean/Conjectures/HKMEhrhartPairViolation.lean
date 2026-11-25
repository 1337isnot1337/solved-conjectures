module

public import Conjectures.HKMEhrhartCountBridge
public import Conjectures.HKMEhrhartUnclippedPolynomial
import all Conjectures.HKMEhrhartSupportShells
import all Conjectures.HKMEhrhartConvolution
import all Conjectures.HKMEhrhartCountBridge

@[expose] public section
namespace HKMEhrhart
open Finset
open scoped BigOperators

def restPos {α : Type*} [Fintype α] (w : α→ℤ) : ℕ := ∑ i,natPositiveMass (w i)
def restNeg {α : Type*} [Fintype α] (w : α→ℤ) : ℕ := ∑ i,natNegativeMass (w i)

abbrev PairViolationData (α : Type*) [Fintype α] (m : ℕ) :=
  {v : (ℤ×ℤ) × (α→ℤ) //
    pairPosNat v.1 + restPos v.2 = pairNegNat v.1 + restNeg v.2 ∧
    pairPosNat v.1 + restPos v.2 ≤ m ∧
    m < pairPosNat v.1 + pairNegNat v.1}

abbrev ViolationTail (α : Type*) [Fintype α] (m : ℕ) :=
  {v : (α→ℤ) × ℕ // restPos v.1 + restNeg v.1 + 2*v.2 < m}

def orientedPair (reversed : Bool) (a b : ℕ) : ℤ×ℤ :=
  if reversed then (-(b:ℤ),(a:ℤ)) else ((a:ℤ),-(b:ℤ))

theorem orientedPair_pos (r : Bool) (a b : ℕ) : pairPosNat (orientedPair r a b) = a := by
  apply Int.ofNat.inj
  change (pairPosNat (orientedPair r a b):ℤ) = (a:ℤ)
  rw [pairPosNat_cast]
  cases r <;> simp [orientedPair,positiveMass]

theorem orientedPair_neg (r : Bool) (a b : ℕ) : pairNegNat (orientedPair r a b) = b := by
  apply Int.ofNat.inj
  change (pairNegNat (orientedPair r a b):ℤ) = (b:ℤ)
  rw [pairNegNat_cast]
  cases r <;> simp [orientedPair,negativeMass]

theorem orientedPair_orientation (r : Bool) {a b : ℕ} (hb : 0<b) :
    decide ((orientedPair r a b).1 < 0) = r := by
  cases r <;> simp [orientedPair,hb]

theorem orient_pair_of_masses (z : ℤ×ℤ) (hP : 0 < pairPosNat z) (hN : 0 < pairNegNat z) :
    orientedPair (decide (z.1 < 0)) (pairPosNat z) (pairNegNat z) = z := by
  have hP' := pairPosNat_cast z
  have hN' := pairNegNat_cast z
  unfold positiveMass at hP'
  unfold negativeMass at hN'
  by_cases h : z.1 < 0
  · simp only [orientedPair,h,decide_true,ite_true]
    exact Prod.ext (by omega) (by omega)
  · simp only [orientedPair,h,decide_false,Bool.false_eq_true,ite_false]
    exact Prod.ext (by omega) (by omega)

variable {α : Type*} [Fintype α]

def packViolation {m : ℕ} (v : PairViolationData α m) : Bool × ViolationTail α m :=
  (decide (v.val.1.1 < 0),⟨(v.val.2,m-(pairPosNat v.val.1+restPos v.val.2)),by
    change restPos v.val.2 + restNeg v.val.2 + 2*(m-(pairPosNat v.val.1+restPos v.val.2)) < m
    obtain ⟨h1,h2,h3⟩ := v.property
    omega⟩)

def unpackViolation {m : ℕ} (v : Bool × ViolationTail α m) : PairViolationData α m := by
  let a := m-v.2.val.2-restPos v.2.val.1
  let b := m-v.2.val.2-restNeg v.2.val.1
  refine ⟨(orientedPair v.1 a b,v.2.val.1),?_⟩
  rw [orientedPair_pos,orientedPair_neg]
  have h := v.2.property
  dsimp only [a,b]
  exact ⟨by omega,by omega,by omega⟩

theorem unpack_packViolation {m : ℕ} (v : PairViolationData α m) :
    unpackViolation (packViolation v) = v := by
  obtain ⟨h1,h2,h3⟩ := v.property
  have hp : 0 < pairPosNat v.val.1 := by omega
  have hn : 0 < pairNegNat v.val.1 := by omega
  apply Subtype.ext
  apply Prod.ext
  · change orientedPair (decide (v.val.1.1 < 0))
        (m-(m-(pairPosNat v.val.1+restPos v.val.2))-restPos v.val.2)
        (m-(m-(pairPosNat v.val.1+restPos v.val.2))-restNeg v.val.2) = v.val.1
    have hP : m-(m-(pairPosNat v.val.1+restPos v.val.2))-restPos v.val.2 =
        pairPosNat v.val.1 := by omega
    have hN : m-(m-(pairPosNat v.val.1+restPos v.val.2))-restNeg v.val.2 =
        pairNegNat v.val.1 := by omega
    rw [hP,hN]
    exact orient_pair_of_masses _ hp hn
  · rfl

theorem pack_unpackViolation {m : ℕ} (v : Bool × ViolationTail α m) :
    packViolation (unpackViolation v) = v := by
  have h := v.2.property
  apply Prod.ext
  · change decide ((orientedPair v.1 (m-v.2.val.2-restPos v.2.val.1)
        (m-v.2.val.2-restNeg v.2.val.1)).1 < 0) = v.1
    exact orientedPair_orientation _ (by omega)
  · apply Subtype.ext
    apply Prod.ext
    · rfl
    · change m-(pairPosNat (orientedPair v.1 (m-v.2.val.2-restPos v.2.val.1)
        (m-v.2.val.2-restNeg v.2.val.1))+restPos v.2.val.1) = v.2.val.2
      rw [orientedPair_pos]
      omega

def pairViolationEquiv (m : ℕ) : PairViolationData α m ≃ Bool × ViolationTail α m :=
  ⟨packViolation,unpackViolation,unpack_packViolation,pack_unpackViolation⟩

end HKMEhrhart
