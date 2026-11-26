module
public import Conjectures.CyrusianKaplanCorrectionSupport
public import Conjectures.CyrusianKaplanHyperplaneLattice
public import Conjectures.CyrusianKaplanTuplePolyhedra
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

@[expose] public section
namespace CyrusianKaplan
open Set

/-- Any active signed correction point lies on a primitive row.
If the first exceptional row is a doubling row, baseline points
cannot be on it, and admissible points lie on a primitive low-upper
row as well. This yields a primitive containing plane directly. -/
theorem primitive_row_of_correctionPoint {r : ℕ} {g : ℝ} (hg : 0<g)
    {z : TupleSpace r}
    (hz : (z∈admissibleTupleRegion r g ∧ z∉baselineTupleRegion r g) ∨
      (z∈baselineTupleRegion r g ∧ z∉admissibleTupleRegion r g)) :
    ∃ t : TupleAffineTest r, standardPrimitiveRow t ∧ tupleAffineForm g t z=0 := by
  have hn : ¬regularCorrectionPoint g z :=
    both_corrections_supported_on_exceptional_rows r g (show z∈_ from hz)
  by_contra! hNo
  apply hn
  refine ⟨⟨?_,?_,?_,?_,?_⟩,?_⟩
  · intro i hi
    rcases hz with ⟨ha,_⟩|⟨hb,_⟩
    · obtain ⟨k,_,hk⟩ := admissible_doubling_forces_distinct_boundary_row g hg z ha i hi
      exact hNo (.lowUpper k) trivial (sub_eq_zero.mpr hk)
    · exact (ne_of_gt (hb.2.2.2.2.1 i)) hi
  · exact fun i j k he => hNo (.sumLow i j k) trivial (sub_eq_zero.mpr he)
  · exact fun i j k he => hNo (.sumHigh i j k) trivial (sub_eq_zero.mpr he)
  · exact fun i j he => hNo (.diffCut i j) trivial (sub_eq_zero.mpr he)
  · exact fun i j k he => hNo (.diffHigh i j k) trivial (sub_eq_zero.mpr he)
  · exact fun i hi => hNo (.highUpper i) trivial (sub_eq_zero.mpr hi)

theorem primitive_row_integral_genus_one_point {r : ℕ} (t : TupleAffineTest r)
    (ht : standardPrimitiveRow t) :
    ∃ z : IntegerTupleSpace r,tupleAffineForm 1 t (integerTupleCast r z)=0 := by
  obtain ⟨v,hv⟩ := tupleIntegralNormal_primitive t ht
  let z := tupleIntegralIntercept t • v
  refine ⟨z,?_⟩
  have he := (exact_tuple_hyperplane_equation t 1 z).mpr (by
    change tupleIntegralNormal t (tupleIntegralIntercept t • v) = _
    rw [map_smul,hv]
    simp)
  norm_num at he
  exact he

theorem primitive_row_genus_one_nonzero_somewhere {r : ℕ} (t : TupleAffineTest r)
    (ht : standardPrimitiveRow t) : ∃ x : TupleSpace r, tupleAffineMap 1 t x≠0 := by
  obtain ⟨v,hv⟩ := tupleIntegralNormal_primitive t ht
  let z := (tupleIntegralIntercept t+1) • v
  refine ⟨integerTupleCast r z,?_⟩
  rw [tupleAffineMap_apply]
  intro h
  have h' : tupleAffineForm ((1:ℤ):ℝ) t (integerTupleCast r z)=0 := by norm_num; exact h
  have he := (exact_tuple_hyperplane_equation t 1 z).mp h'
  change tupleIntegralNormal t ((tupleIntegralIntercept t+1) • v) = _ at he
  rw [map_smul,hv] at he
  simp at he

end CyrusianKaplan
