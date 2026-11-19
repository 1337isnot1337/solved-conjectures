import Conjectures.LonelinessSixPlaneEnumeration
import Conjectures.LonelinessSixPlaneDataTables

namespace Loneliness.SixPlane.Data

def directionAt (j : Fin 10) (row : Fin 360) : Vector :=
  fun i => Int.ofNat ((((positivePacked.getD j.val #[]).getD row.val 0) >>>
    (4 * i.val)) % 16)

def rankToRow (j : Fin 10) (rank : Fin 720) : Fin 360 :=
  ⟨((rankRows.getD j.val #[]).getD rank.val 0) % 360, Nat.mod_lt _ (by decide)⟩

def acceptance0 : Acceptance where
  kind := 0
  permutation := {
    toFun := ![1, 2, 3, 4, 5, 0]
    invFun := ![5, 0, 1, 2, 3, 4]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptance1 : Acceptance where
  kind := 0
  permutation := {
    toFun := ![0, 2, 3, 4, 5, 1]
    invFun := ![0, 5, 1, 2, 3, 4]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptance2 : Acceptance where
  kind := 2
  permutation := {
    toFun := ![1, 0, 2, 3, 4, 5]
    invFun := ![1, 0, 2, 3, 4, 5]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptance3 : Acceptance where
  kind := 2
  permutation := {
    toFun := ![0, 1, 2, 3, 4, 5]
    invFun := ![0, 1, 2, 3, 4, 5]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptance4 : Acceptance where
  kind := 0
  permutation := {
    toFun := ![0, 1, 3, 4, 5, 2]
    invFun := ![0, 1, 5, 2, 3, 4]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptance5 : Acceptance where
  kind := 0
  permutation := {
    toFun := ![0, 1, 2, 4, 5, 3]
    invFun := ![0, 1, 2, 5, 3, 4]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptance6 : Acceptance where
  kind := 0
  permutation := {
    toFun := ![0, 1, 2, 3, 5, 4]
    invFun := ![0, 1, 2, 3, 5, 4]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptance7 : Acceptance where
  kind := 0
  permutation := {
    toFun := ![0, 1, 2, 3, 4, 5]
    invFun := ![0, 1, 2, 3, 4, 5]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptance8 : Acceptance where
  kind := 1
  permutation := {
    toFun := ![1, 2, 3, 4, 5, 0]
    invFun := ![5, 0, 1, 2, 3, 4]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptance9 : Acceptance where
  kind := 1
  permutation := {
    toFun := ![0, 2, 3, 4, 5, 1]
    invFun := ![0, 5, 1, 2, 3, 4]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptance10 : Acceptance where
  kind := 1
  permutation := {
    toFun := ![0, 1, 3, 4, 5, 2]
    invFun := ![0, 1, 5, 2, 3, 4]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptance11 : Acceptance where
  kind := 1
  permutation := {
    toFun := ![0, 1, 2, 4, 5, 3]
    invFun := ![0, 1, 2, 5, 3, 4]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptance12 : Acceptance where
  kind := 1
  permutation := {
    toFun := ![0, 1, 2, 3, 5, 4]
    invFun := ![0, 1, 2, 3, 5, 4]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptance13 : Acceptance where
  kind := 1
  permutation := {
    toFun := ![0, 1, 2, 3, 4, 5]
    invFun := ![0, 1, 2, 3, 4, 5]
    left_inv := by decide +kernel
    right_inv := by decide +kernel }
  mask := 63

def acceptances : Array Acceptance := #[acceptance0, acceptance1, acceptance2, acceptance3, acceptance4, acceptance5, acceptance6, acceptance7, acceptance8, acceptance9, acceptance10, acceptance11, acceptance12, acceptance13]

def rejectionPairs : Array (Fin 6 × Fin 6) := #[(0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (1, 2), (1, 3), (1, 4), (1, 5), (2, 3), (2, 4), (2, 5), (3, 4), (3, 5), (4, 5)]

def decodeCertificate (code : ℕ) : PairCertificate :=
  if code = 0 then .dependent
  else if code ≤ 30 then
    let ij := rejectionPairs.getD ((code - 1) / 2) (0, 1)
    .coordinate ij.1 ij.2 ((code - 1) % 2 == 0)
  else if code ≤ 60 then
    let ij := rejectionPairs.getD ((code - 31) / 2) (0, 1)
    .line ij.1 ij.2 ((code - 31) % 2 == 0)
  else .accepted (acceptances.getD (code - 61) acceptance0)

noncomputable def rowCertificates (i j : Fin 10) (row : Fin 360) (mask : Fin 32) : PairCertificate :=
  let wordId := (certificateWordIds.getD (10 * i.val + j.val) #[]).getD row.val 0
  let word := certificateWords.getD wordId 0
  decodeCertificate ((word >>> (8 * mask.val)) % 256)

noncomputable def partialCheck (i j : Fin 10) (start count : ℕ) : Bool :=
  (List.range count).all fun offset =>
    let row : Fin 360 := ⟨(start + offset) % 360, Nat.mod_lt _ (by decide)⟩
    certificateRowCheck directionAt i j row (rowCertificates i j row)

end Loneliness.SixPlane.Data
