module
public import Conjectures.CyrusianKaplanIntegerLattice
public import Conjectures.CyrusianKaplanPrimitiveNormals
import Mathlib.Tactic.NormNum

@[expose] public section
namespace CyrusianKaplan

/-- Genus-one intercept of the normalized integral affine equation. -/
def tupleIntegralIntercept {r : ℕ} : TupleAffineTest r → ℤ
  | .highLower _ | .lowUpper _ | .sumCut _ _ | .diffCut _ _ => 1
  | .highUpper _ => 2
  | _ => 0

/-- Identify the zero of the actual real arrangement row with
the exact lattice equation at every integral dilation. -/
theorem exact_tuple_hyperplane_equation {r : ℕ} (test : TupleAffineTest r)
    (g : ℤ) (z : IntegerTupleSpace r) :
    tupleAffineForm (g:ℝ) test (integerTupleCast r z) = 0 ↔
      tupleIntegralNormal test z = g*tupleIntegralIntercept test := by
  cases test
  all_goals
    simp only [tupleAffineForm,tupleIntegralNormal,tupleIntegralIntercept,
      integerTupleCast,LinearMap.add_apply,LinearMap.sub_apply,intHighCoord_apply,
      intLowCoord_apply,mul_one,mul_zero,neg_eq_zero,sub_eq_zero]
    try rw [mul_comm g 2]
    try norm_cast
    try exact eq_comm

/-- Every nondegenerate primitive arrangement row has exactly the
lattice of its normal's kernel after translation by an integral
origin times the genus. This statement concerns the literal
arrangement, not an unrelated abstract slice. -/
noncomputable def exact_tuple_hyperplane_translate {r : ℕ} (test : TupleAffineTest r)
    (ht : standardPrimitiveRow test) (g : ℤ) :
    {z : IntegerTupleSpace r // tupleAffineForm (g:ℝ) test (integerTupleCast r z)=0} ≃
      ↥(LinearMap.ker (tupleIntegralNormal test)) := by
  let c := tupleIntegralIntercept test
  let f := tupleIntegralNormal test
  have h := integral_intercept_has_lattice_origin f (tupleIntegralNormal_primitive test ht) c
  exact (Equiv.subtypeEquivRight (fun z => exact_tuple_hyperplane_equation test g z)).trans
    (integral_hyperplane_translate f c g h.choose h.choose_spec)

end CyrusianKaplan
