module
public import Conjectures.CyrusianKaplanPeriodReduction
public import Conjectures.CyrusianKaplanConeBoxFinite
public import Conjectures.CyrusianKaplanRayResidues
import Mathlib.Tactic.Ring

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

def PeriodBoxPoints {d : ℕ} (P : AddSubgroup (CoefficientSpace d)) (m : Fin d → ℕ) :=
  {x : CoefficientSpace d // x∈P ∧ ∀ i,0<x i ∧ x i≤(m i:ℝ)}

noncomputable def reduceOpenPeriodTuple {d : ℕ} (m : Fin d → ℕ) (x : CoefficientSpace d) :
    CoefficientSpace d :=
  fun i => reduceOpenPeriod (m i:ℝ) (x i)

theorem reduceOpenPeriodTuple_mem {d : ℕ} (P : AddSubgroup (CoefficientSpace d))
    (hInt : ∀ n : Fin d → ℤ,integerCoordinatesHom d n∈P)
    (m : Fin d → ℕ) (x : CoefficientSpace d) (hx : x∈P) :
    reduceOpenPeriodTuple m x∈P := by
  let k (i : Fin d) : ℤ := (m i:ℤ)*openPeriodOffset (m i:ℝ) (x i)
  have hk := P.sub_mem hx (hInt k)
  have hEq : reduceOpenPeriodTuple m x=x-integerCoordinatesHom d k := by
    funext i
    change x i-(m i:ℝ)*(openPeriodOffset (m i:ℝ) (x i):ℝ)=
      x i-(((m i:ℤ)*openPeriodOffset (m i:ℝ) (x i):ℤ):ℝ)
    rw [Int.cast_mul,Int.cast_natCast]
  rwa [hEq]

noncomputable def reduceOpenPeriodToBox {d : ℕ} (P : AddSubgroup (CoefficientSpace d))
    (hInt : ∀ n : Fin d → ℤ,integerCoordinatesHom d n∈P)
    (m : Fin d → ℕ) (hm : ∀ i,0<m i) (x : P) : PeriodBoxPoints P m :=
  ⟨reduceOpenPeriodTuple m x.val,reduceOpenPeriodTuple_mem P hInt m x.val x.property,
    fun i => reduceOpenPeriod_bounds (by exact_mod_cast hm i) (x.val i)⟩

/-- Arbitrary lattice translation is a bijection of half-open
period-box representatives, including translations from height zero
to one. The inverse uses the negated lattice vector. -/
noncomputable def periodBoxTranslation {d : ℕ} (P : AddSubgroup (CoefficientSpace d))
    (hInt : ∀ n : Fin d → ℤ,integerCoordinatesHom d n∈P)
    (m : Fin d → ℕ) (hm : ∀ i,0<m i) (v : P) :
    PeriodBoxPoints P m ≃ PeriodBoxPoints P m where
  toFun x := reduceOpenPeriodToBox P hInt m hm
    ⟨x.val+v.val,P.add_mem x.property.1 v.property⟩
  invFun x := reduceOpenPeriodToBox P hInt m hm
    ⟨x.val-v.val,P.sub_mem x.property.1 v.property⟩
  left_inv x := by
    apply Subtype.ext
    funext i
    let p := (m i:ℝ)
    have hp : 0<p := by change (0:ℝ)<(m i:ℝ); exact_mod_cast hm i
    change reduceOpenPeriod p (reduceOpenPeriod p (x.val i+v.val i)-v.val i)=x.val i
    calc
      _ = reduceOpenPeriod p ((x.val i+v.val i)+(-v.val i)) := by
        rw [sub_eq_add_neg,reduceOpenPeriod_translate_restore hp]
      _ = x.val i := by
        rw [add_assoc,add_neg_cancel,add_zero,reduceOpenPeriod_eq_self hp (x.property.2 i)]
  right_inv x := by
    apply Subtype.ext
    funext i
    let p := (m i:ℝ)
    have hp : 0<p := by change (0:ℝ)<(m i:ℝ); exact_mod_cast hm i
    change reduceOpenPeriod p (reduceOpenPeriod p (x.val i-v.val i)+v.val i)=x.val i
    rw [reduceOpenPeriod_translate_restore hp,sub_add_cancel,
      reduceOpenPeriod_eq_self hp (x.property.2 i)]

/-- When each coordinate period contributes the same integer p
to the height, reducing a tuple changes its height by a multiple
of p. This is the exact algebra behind uniform residue fibres. -/
theorem reduceOpenPeriodTuple_weighted_height {d : ℕ} (w m : Fin d → ℕ) (p : ℕ)
    (h : ∀ i,w i*m i=p) (x : CoefficientSpace d) :
    (∑ i,(w i:ℝ)*reduceOpenPeriodTuple m x i) =
      (∑ i,(w i:ℝ)*x i)-(p:ℝ)*
        ((∑ i,openPeriodOffset (m i:ℝ) (x i):ℤ):ℝ) := by
  rw [Int.cast_sum,Finset.mul_sum,← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro i _
  have h' : (w i:ℝ)*(m i:ℝ)=(p:ℝ) := by exact_mod_cast h i
  change (w i:ℝ)*(x i-(m i:ℝ)*(openPeriodOffset (m i:ℝ) (x i):ℝ)) = _
  rw [mul_sub,← mul_assoc,h']

end CyrusianKaplan
