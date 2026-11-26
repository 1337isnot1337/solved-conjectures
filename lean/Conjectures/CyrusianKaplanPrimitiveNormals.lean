module
public import Conjectures.CyrusianKaplanTupleArrangement
public import Conjectures.CyrusianKaplanIntegralSlice
public import Mathlib.Algebra.Module.Prod
public import Mathlib.Algebra.Module.Pi
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

abbrev IntegerTupleSpace (r : ℕ) := (Fin r → ℤ) × (Fin r → ℤ)

def intHighCoord {r : ℕ} (i : Fin r) : IntegerTupleSpace r →ₗ[ℤ] ℤ :=
  (LinearMap.proj i).comp (LinearMap.fst ℤ _ _)

def intLowCoord {r : ℕ} (i : Fin r) : IntegerTupleSpace r →ₗ[ℤ] ℤ :=
  (LinearMap.proj i).comp (LinearMap.snd ℤ _ _)

/-- Integral normal of the written hyperplane. Negating one row
does not affect its equation or its lattice primitivity. -/
def tupleIntegralNormal {r : ℕ} (i : TupleAffineTest r) :
    IntegerTupleSpace r →ₗ[ℤ] ℤ :=
  match i with
  | .highLower i => intHighCoord i
  | .highUpper i => intHighCoord i
  | .lowLower i => intLowCoord i
  | .lowUpper i => intLowCoord i
  | .highOrder i j => intHighCoord i - intHighCoord j
  | .lowOrder i j => intLowCoord i - intLowCoord j
  | .sumCut i j => intLowCoord i + intLowCoord j
  | .sumLow i j k => intLowCoord i + intLowCoord j - intLowCoord k
  | .sumHigh i j k => intLowCoord i + intLowCoord j - intHighCoord k
  | .diffCut i j => intHighCoord i - intLowCoord j
  | .diffLow i j k => intHighCoord i - intLowCoord j - intLowCoord k
  | .diffHigh i j k => intHighCoord i - intLowCoord j - intHighCoord k

private def highSpike {r : ℕ} (i : Fin r) : IntegerTupleSpace r :=
  (fun j => if j=i then 1 else 0,0)

private def lowSpike {r : ℕ} (i : Fin r) : IntegerTupleSpace r :=
  (0,fun j => if j=i then 1 else 0)

@[simp] theorem intHighCoord_apply {r : ℕ} (i : Fin r) (z : IntegerTupleSpace r) :
    intHighCoord i z=z.1 i := rfl

@[simp] theorem intLowCoord_apply {r : ℕ} (i : Fin r) (z : IntegerTupleSpace r) :
    intLowCoord i z=z.2 i := rfl

/-- Identity comparison rows may be zero, and doubling rows are
the sole nonzero exception to primitive coefficients. -/
def standardPrimitiveRow {r : ℕ} (test : TupleAffineTest r) : Prop :=
  match test with
  | .highOrder i j | .lowOrder i j | .sumCut i j => i≠j
  | _ => True

theorem tupleIntegralNormal_primitive {r : ℕ} (test : TupleAffineTest r)
    (h : standardPrimitiveRow test) :
    PrimitiveIntegralNormal (tupleIntegralNormal test) := by
  cases test with
  | highLower i => exact ⟨highSpike i,by simp [tupleIntegralNormal,highSpike]⟩
  | highUpper i => exact ⟨highSpike i,by simp [tupleIntegralNormal,highSpike]⟩
  | lowLower i => exact ⟨lowSpike i,by simp [tupleIntegralNormal,lowSpike]⟩
  | lowUpper i => exact ⟨lowSpike i,by simp [tupleIntegralNormal,lowSpike]⟩
  | highOrder i j => exact ⟨highSpike i,by simp [tupleIntegralNormal,highSpike,Ne.symm h]⟩
  | lowOrder i j => exact ⟨lowSpike i,by simp [tupleIntegralNormal,lowSpike,Ne.symm h]⟩
  | sumCut i j => exact ⟨lowSpike i,by simp [tupleIntegralNormal,lowSpike,Ne.symm h]⟩
  | sumLow i j k =>
    by_cases hki : k=i
    · subst k
      exact ⟨lowSpike j,by simp [tupleIntegralNormal,lowSpike]⟩
    · by_cases hkj : k=j
      · subst k
        exact ⟨lowSpike i,by simp [tupleIntegralNormal,lowSpike]⟩
      · refine ⟨-lowSpike k,?_⟩
        rw [map_neg]
        simp [tupleIntegralNormal,lowSpike,Ne.symm hki,Ne.symm hkj]
  | sumHigh i j k =>
    refine ⟨-highSpike k,?_⟩
    rw [map_neg]
    simp [tupleIntegralNormal,highSpike]
  | diffCut i j => exact ⟨highSpike i,by simp [tupleIntegralNormal,highSpike]⟩
  | diffLow i j k => exact ⟨highSpike i,by simp [tupleIntegralNormal,highSpike]⟩
  | diffHigh i j k =>
    refine ⟨-lowSpike j,?_⟩
    rw [map_neg]
    simp [tupleIntegralNormal,lowSpike]

theorem tupleIntegralNormal_doubling_even {r : ℕ} (i : Fin r)
    (z : IntegerTupleSpace r) :
    Even (tupleIntegralNormal (.sumCut i i) z) :=
  ⟨z.2 i, by simp [tupleIntegralNormal]⟩

end CyrusianKaplan
