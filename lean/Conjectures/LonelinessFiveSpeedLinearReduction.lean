import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Int.Basic
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Ring

/-! Exact integer certificates for reducing two linear relations in five
coordinates.  Concrete relation rows, canonical maps, and signed permutations
are supplied by a separate finite certificate.

The projection identity initially places a nonzero multiple of the vector in
the image of a three-column matrix.  Checked signed unit rows then remove that
multiple and recover parameters which are signed original coordinates. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped BigOperators Matrix

abbrev FiveIntegerVector := Fin 5 → ℤ
abbrev ThreeIntegerVector := Fin 3 → ℤ
abbrev ThreeParameterMap := Matrix (Fin 5) (Fin 3) ℤ
abbrev TwoRelationMatrix := Matrix (Fin 2) (Fin 5) ℤ

/-- Integer numerators for a projection onto a three-parameter image. -/
structure ProjectionPayload where
  denominator : ℤ
  parameters : Matrix (Fin 3) (Fin 5) ℤ
  correction : Matrix (Fin 5) (Fin 2) ℤ

/-- The finite checker only checks an exact integer matrix identity. -/
def projectionCheck (A : ThreeParameterMap) (C : TwoRelationMatrix)
    (payload : ProjectionPayload) : Bool :=
  decide (payload.denominator ≠ 0 ∧
    ∀ i j : Fin 5,
      (if i = j then payload.denominator else 0) =
        (∑ k : Fin 3, A i k * payload.parameters k j) +
          ∑ k : Fin 2, payload.correction i k * C k j)

theorem projectionCheck_spec (A : ThreeParameterMap) (C : TwoRelationMatrix)
    (payload : ProjectionPayload) (hcheck : projectionCheck A C payload = true) :
    payload.denominator ≠ 0 ∧
      payload.denominator • (1 : Matrix (Fin 5) (Fin 5) ℤ) =
        A * payload.parameters + payload.correction * C := by
  have hc : payload.denominator ≠ 0 ∧
      ∀ i j : Fin 5,
        (if i = j then payload.denominator else 0) =
          (∑ k : Fin 3, A i k * payload.parameters k j) +
            ∑ k : Fin 2, payload.correction i k * C k j := by
    simpa only [projectionCheck, decide_eq_true_eq] using hcheck
  refine ⟨hc.1, ?_⟩
  ext i j
  simpa [Matrix.mul_apply, Matrix.one_apply, Pi.smul_apply, smul_eq_mul,
    mul_ite] using hc.2 i j

/-- A selected row for each parameter, with its sign. -/
structure UnitRowSelector where
  row : Fin 3 → Fin 5
  negative : Fin 3 → Bool

def selectedSign (selector : UnitRowSelector) (j : Fin 3) : ℤ :=
  if selector.negative j then -1 else 1

def unitRowsCheck (A : ThreeParameterMap) (selector : UnitRowSelector) : Bool :=
  decide (∀ j k : Fin 3,
    A (selector.row j) k = if k = j then selectedSign selector j else 0)

def selectedParameters (selector : UnitRowSelector) (v : FiveIntegerVector) :
    ThreeIntegerVector :=
  fun j => selectedSign selector j * v (selector.row j)

theorem selectedSign_sq (selector : UnitRowSelector) (j : Fin 3) :
    selectedSign selector j * selectedSign selector j = 1 := by
  cases h : selector.negative j <;> norm_num [selectedSign, h]

theorem selectedSign_ne_zero (selector : UnitRowSelector) (j : Fin 3) :
    selectedSign selector j ≠ 0 := by
  cases h : selector.negative j <;> norm_num [selectedSign, h]

theorem selectedSign_abs (selector : UnitRowSelector) (j : Fin 3) :
    |selectedSign selector j| = 1 := by
  cases h : selector.negative j <;> norm_num [selectedSign, h]

theorem unitRowsCheck_spec (A : ThreeParameterMap) (selector : UnitRowSelector)
    (hcheck : unitRowsCheck A selector = true) :
    ∀ j k : Fin 3,
      A (selector.row j) k = if k = j then selectedSign selector j else 0 := by
  simpa only [unitRowsCheck, decide_eq_true_eq] using hcheck

theorem selected_row_mulVec (A : ThreeParameterMap) (selector : UnitRowSelector)
    (hcheck : unitRowsCheck A selector = true) (u : ThreeIntegerVector) (j : Fin 3) :
    (A *ᵥ u) (selector.row j) = selectedSign selector j * u j := by
  have hrows := unitRowsCheck_spec A selector hcheck
  simp [Matrix.mulVec, dotProduct, hrows]

theorem unitRowsCheck_injective (A : ThreeParameterMap) (selector : UnitRowSelector)
    (hcheck : unitRowsCheck A selector = true) : Function.Injective (A *ᵥ ·) := by
  intro u w huw
  ext j
  have h := congrFun huw (selector.row j)
  change (A *ᵥ u) (selector.row j) = (A *ᵥ w) (selector.row j) at h
  rw [selected_row_mulVec A selector hcheck, selected_row_mulVec A selector hcheck] at h
  exact mul_left_cancel₀ (selectedSign_ne_zero selector j) h

theorem projectionCheck_scaled (A : ThreeParameterMap) (C : TwoRelationMatrix)
    (payload : ProjectionPayload) (hcheck : projectionCheck A C payload = true)
    (v : FiveIntegerVector) (hrelations : C *ᵥ v = 0) :
    payload.denominator • v = A *ᵥ (payload.parameters *ᵥ v) := by
  have hc := projectionCheck_spec A C payload hcheck
  have h := congrArg (fun M : Matrix (Fin 5) (Fin 5) ℤ => M *ᵥ v) hc.2
  simpa only [Matrix.smul_mulVec, Matrix.one_mulVec, Matrix.add_mulVec,
    ← Matrix.mulVec_mulVec, hrelations, Matrix.mulVec_zero, add_zero] using h

/-- The denominator disappears because the selected rows recover the original
coordinates as exact integer parameters. -/
theorem projectionCheck_exact (A : ThreeParameterMap) (C : TwoRelationMatrix)
    (payload : ProjectionPayload) (selector : UnitRowSelector)
    (hcheck : projectionCheck A C payload = true)
    (hrows : unitRowsCheck A selector = true)
    (v : FiveIntegerVector) (hrelations : C *ᵥ v = 0) :
    A *ᵥ selectedParameters selector v = v := by
  have hc := projectionCheck_spec A C payload hcheck
  have hscaled := projectionCheck_scaled A C payload hcheck v hrelations
  have hparameters : payload.parameters *ᵥ v =
      payload.denominator • selectedParameters selector v := by
    ext j
    have h := congrFun hscaled (selector.row j)
    rw [selected_row_mulVec A selector hrows] at h
    change payload.denominator * v (selector.row j) =
      selectedSign selector j * (payload.parameters *ᵥ v) j at h
    change (payload.parameters *ᵥ v) j =
      payload.denominator * (selectedSign selector j * v (selector.row j))
    calc
      _ = selectedSign selector j *
          (selectedSign selector j * (payload.parameters *ᵥ v) j) := by
        rw [← mul_assoc, selectedSign_sq, one_mul]
      _ = selectedSign selector j * (payload.denominator * v (selector.row j)) :=
        congrArg (fun z : ℤ => selectedSign selector j * z) h.symm
      _ = _ := by ring
  rw [hparameters, Matrix.mulVec_smul] at hscaled
  ext i
  have hi := congrFun hscaled i
  change payload.denominator * v i =
    payload.denominator * (A *ᵥ selectedParameters selector v) i at hi
  exact (mul_left_cancel₀ hc.1 hi).symm

theorem selectedParameters_abs (selector : UnitRowSelector) (v : FiveIntegerVector)
    (j : Fin 3) : |selectedParameters selector v j| = |v (selector.row j)| := by
  rw [selectedParameters, abs_mul, selectedSign_abs, one_mul]

theorem selectedParameters_natAbs (selector : UnitRowSelector) (v : FiveIntegerVector)
    (j : Fin 3) :
    (selectedParameters selector v j).natAbs = (v (selector.row j)).natAbs := by
  cases h : selector.negative j <;> simp [selectedParameters, selectedSign, h]

theorem selectedParameters_abs_le (selector : UnitRowSelector) (v : FiveIntegerVector)
    (B : ℤ) (hv : ∀ i, |v i| ≤ B) :
    ∀ j, |selectedParameters selector v j| ≤ B := by
  intro j
  rw [selectedParameters_abs]
  exact hv (selector.row j)

theorem selectedParameters_ne_zero (selector : UnitRowSelector) (v : FiveIntegerVector)
    (hv : ∀ i, v i ≠ 0) : ∀ j, selectedParameters selector v j ≠ 0 := by
  intro j
  exact mul_ne_zero (selectedSign_ne_zero selector j) (hv (selector.row j))

theorem projectionCheck_bounded_parameters (A : ThreeParameterMap) (C : TwoRelationMatrix)
    (payload : ProjectionPayload) (selector : UnitRowSelector)
    (hcheck : projectionCheck A C payload = true)
    (hrows : unitRowsCheck A selector = true)
    (v : FiveIntegerVector) (hrelations : C *ᵥ v = 0)
    (B : ℤ) (hv : ∀ i, |v i| ≤ B) :
    ∃ u : ThreeIntegerVector, A *ᵥ u = v ∧ ∀ j, |u j| ≤ B :=
  ⟨selectedParameters selector v, projectionCheck_exact A C payload selector hcheck hrows
    v hrelations, selectedParameters_abs_le selector v B hv⟩

/-- A row-span certificate for a forced zero or signed repeated coordinate. -/
structure RowSpanPayload where
  denominator : ℤ
  coefficients : Fin 2 → ℤ

def rowSpanCheck (C : TwoRelationMatrix) (t : FiveIntegerVector)
    (payload : RowSpanPayload) : Bool :=
  decide (payload.denominator ≠ 0 ∧
    payload.denominator • t = payload.coefficients ᵥ* C)

theorem rowSpanCheck_vanishing (C : TwoRelationMatrix) (t : FiveIntegerVector)
    (payload : RowSpanPayload) (hcheck : rowSpanCheck C t payload = true)
    (v : FiveIntegerVector) (hrelations : C *ᵥ v = 0) : t ⬝ᵥ v = 0 := by
  have hc : payload.denominator ≠ 0 ∧
      payload.denominator • t = payload.coefficients ᵥ* C := by
    simpa only [rowSpanCheck, decide_eq_true_eq] using hcheck
  have h := congrArg (fun r : FiveIntegerVector => r ⬝ᵥ v) hc.2
  rw [smul_dotProduct, ← Matrix.dotProduct_mulVec, hrelations, dotProduct_zero] at h
  change payload.denominator * (t ⬝ᵥ v) = 0 at h
  exact (mul_eq_zero.mp h).resolve_left hc.1

def coordinateRow (i : Fin 5) : FiveIntegerVector := Pi.single i 1

def signedPairRow (i j : Fin 5) (ε : ℤ) : FiveIntegerVector :=
  Pi.single i 1 + Pi.single j ε

theorem coordinateRow_dotProduct (i : Fin 5) (v : FiveIntegerVector) :
    coordinateRow i ⬝ᵥ v = v i := by
  simp [coordinateRow, single_dotProduct]

theorem signedPairRow_dotProduct (i j : Fin 5) (ε : ℤ) (v : FiveIntegerVector) :
    signedPairRow i j ε ⬝ᵥ v = v i + ε * v j := by
  simp [signedPairRow, add_dotProduct, single_dotProduct]

theorem rowSpanCheck_coordinate_zero (C : TwoRelationMatrix) (i : Fin 5)
    (payload : RowSpanPayload) (hcheck : rowSpanCheck C (coordinateRow i) payload = true)
    (v : FiveIntegerVector) (hrelations : C *ᵥ v = 0) : v i = 0 := by
  simpa only [coordinateRow_dotProduct] using
    rowSpanCheck_vanishing C (coordinateRow i) payload hcheck v hrelations

theorem rowSpanCheck_signedPair_abs_eq (C : TwoRelationMatrix) (i j : Fin 5) (ε : ℤ)
    (hε : ε = 1 ∨ ε = -1) (payload : RowSpanPayload)
    (hcheck : rowSpanCheck C (signedPairRow i j ε) payload = true)
    (v : FiveIntegerVector) (hrelations : C *ᵥ v = 0) : |v i| = |v j| := by
  have h := rowSpanCheck_vanishing C (signedPairRow i j ε) payload hcheck v hrelations
  rw [signedPairRow_dotProduct] at h
  rcases hε with rfl | rfl
  · have heq : v i = -v j := by omega
    rw [heq, abs_neg]
  · have heq : v i = v j := by omega
    rw [heq]

end Loneliness.FiveSpeedCertificate
