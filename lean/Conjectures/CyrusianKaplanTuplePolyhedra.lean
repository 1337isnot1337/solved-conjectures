module
public import Conjectures.CyrusianKaplanTupleArrangement
public import Conjectures.CyrusianKaplanRelativeInterior
public import Mathlib.Topology.Algebra.Affine
public import Mathlib.Algebra.Module.Pi
public import Mathlib.Algebra.Module.Prod

@[expose] public section
namespace CyrusianKaplan

open Set

def highAffine {r : ℕ} (i : Fin r) : TupleSpace r →ᵃ[ℝ] ℝ :=
  ((LinearMap.proj i : (Fin r → ℝ) →ₗ[ℝ] ℝ).comp
    (LinearMap.fst ℝ (Fin r → ℝ) (Fin r → ℝ))).toAffineMap

def lowAffine {r : ℕ} (i : Fin r) : TupleSpace r →ᵃ[ℝ] ℝ :=
  ((LinearMap.proj i : (Fin r → ℝ) →ₗ[ℝ] ℝ).comp
    (LinearMap.snd ℝ (Fin r → ℝ) (Fin r → ℝ))).toAffineMap

def tupleAffineMap {r : ℕ} (g : ℝ) (i : TupleAffineTest r) :
    TupleSpace r →ᵃ[ℝ] ℝ :=
  let c := AffineMap.const ℝ (TupleSpace r) g
  match i with
  | .highLower i => c - highAffine i
  | .highUpper i => highAffine i - AffineMap.const ℝ (TupleSpace r) (2*g)
  | .lowLower i => -lowAffine i
  | .lowUpper i => lowAffine i - c
  | .highOrder i j => highAffine i - highAffine j
  | .lowOrder i j => lowAffine i - lowAffine j
  | .sumCut i j => lowAffine i + lowAffine j - c
  | .sumLow i j k => lowAffine i + lowAffine j - lowAffine k
  | .sumHigh i j k => lowAffine i + lowAffine j - highAffine k
  | .diffCut i j => highAffine i - lowAffine j - c
  | .diffLow i j k => highAffine i - lowAffine j - lowAffine k
  | .diffHigh i j k => highAffine i - lowAffine j - highAffine k

theorem tupleAffineMap_apply {r : ℕ} (g : ℝ) (i : TupleAffineTest r) (z : TupleSpace r) :
    tupleAffineMap g i z = tupleAffineForm g i z := by
  cases i <;> rfl

def orientedTupleAffineMap {r : ℕ} (g : ℝ) (s : TupleAffineTest r → Ordering)
    (i : TupleAffineTest r) : TupleSpace r →ᵃ[ℝ] ℝ :=
  if s i = .gt then -tupleAffineMap g i else tupleAffineMap g i

theorem orientedTupleAffineMap_apply {r : ℕ} (g : ℝ) (s : TupleAffineTest r → Ordering)
    (i : TupleAffineTest r) (z : TupleSpace r) :
    orientedTupleAffineMap g s i z =
      if s i = .gt then -tupleAffineForm g i z else tupleAffineForm g i z := by
  unfold orientedTupleAffineMap
  split_ifs
  · change -tupleAffineMap g i z = -tupleAffineForm g i z
    rw [tupleAffineMap_apply]
  · exact tupleAffineMap_apply g i z

def weakTupleSignPolyhedron {r : ℕ} (g : ℝ) (s : TupleAffineTest r → Ordering) :
    Set (TupleSpace r) :=
  weakAffineStratum (fun i => orientedTupleAffineMap g s i)
    {i | s i = .eq} {i | s i ≠ .eq}

private theorem exact_tupleSignFibre {r : ℕ} (g : ℝ) (s : TupleAffineTest r → Ordering) :
    affineSignFibre (tupleAffineForm g) s =
      strictAffineStratum (fun i => orientedTupleAffineMap g s i)
        {i | s i = .eq} {i | s i ≠ .eq} := by
  rw [affineSignFibre_eq_strictStratum]
  congr 1
  funext i z
  exact (orientedTupleAffineMap_apply g s i z).symm

private theorem continuous_orientedTupleAffineMap {r : ℕ} (g : ℝ)
    (s : TupleAffineTest r → Ordering) (i : TupleAffineTest r) :
    Continuous (orientedTupleAffineMap g s i) := by
  by_cases hi : s i = .gt
  · have h : (fun z => orientedTupleAffineMap g s i z) =
      fun z => -tupleAffineForm g i z := funext fun z => by
        rw [orientedTupleAffineMap_apply,ite_eq_left hi]
    change Continuous (fun z => orientedTupleAffineMap g s i z)
    rw [h]
    exact (continuous_tupleAffineForm g i).neg
  · have h : (fun z => orientedTupleAffineMap g s i z) =
      tupleAffineForm g i := funext fun z => by
        rw [orientedTupleAffineMap_apply,ite_eq_right hi]
    change Continuous (fun z => orientedTupleAffineMap g s i z)
    rw [h]
    exact continuous_tupleAffineForm g i

/-- Each nonempty sign fibre of the actual arrangement is the
relative interior of its closed weakification, as used before the
open lattice-point enumeration step. -/
theorem tupleSignFibre_eq_intrinsicInterior {r : ℕ} (g : ℝ)
    (s : TupleAffineTest r → Ordering)
    (h : (affineSignFibre (tupleAffineForm g) s).Nonempty) :
    affineSignFibre (tupleAffineForm g) s =
      intrinsicInterior ℝ (weakTupleSignPolyhedron g s) := by
  rw [exact_tupleSignFibre g s] at h ⊢
  exact (intrinsicInterior_weakAffineStratum_eq
    (fun i => orientedTupleAffineMap g s i) {i | s i = .eq} {i | s i ≠ .eq}
    (continuous_orientedTupleAffineMap g s) h).symm


/-- The weak polyhedron is exactly the closure of the nonempty
sign fibre, not merely a closed superset. -/
theorem closure_tupleSignFibre_eq {r : ℕ} (g : ℝ)
    (s : TupleAffineTest r → Ordering)
    (h : (affineSignFibre (tupleAffineForm g) s).Nonempty) :
    closure (affineSignFibre (tupleAffineForm g) s) = weakTupleSignPolyhedron g s := by
  rw [exact_tupleSignFibre g s] at h ⊢
  apply closure_strictAffineStratum_eq _ _ _ (continuous_orientedTupleAffineMap g s) _ h
  intro i x y t
  rw [← AffineMap.lineMap_apply_module,(orientedTupleAffineMap g s i).apply_lineMap,
    AffineMap.lineMap_apply_ring]

end CyrusianKaplan
