import Conjectures.MotzkinDualRestriction
import Conjectures.MotzkinDensity
import Mathlib.Analysis.SpecialFunctions.Complex.Circle

/-! Transfer of two character values from an abstract subgroup into a compact
group. Dense restriction, not extension of a character, supplies the inequality. -/
namespace Motzkin

noncomputable def circleInverse : Circle → UnitAddCircle :=
  (AddCircle.homeomorphCircle (T:=1) one_ne_zero).symm

theorem continuous_circleInverse : Continuous circleInverse :=
  (AddCircle.homeomorphCircle (T:=1) one_ne_zero).symm.continuous

theorem toCircle_circleInverse (z : Circle) : AddCircle.toCircle (circleInverse z)=z := by
  rw [← AddCircle.homeomorphCircle_apply one_ne_zero]
  exact (AddCircle.homeomorphCircle (T:=1) one_ne_zero).apply_symm_apply z

theorem circleInverse_toCircle (z : UnitAddCircle) : circleInverse (AddCircle.toCircle z)=z := by
  rw [← AddCircle.homeomorphCircle_apply one_ne_zero]
  exact (AddCircle.homeomorphCircle (T:=1) one_ne_zero).symm_apply_apply z

theorem circleInverse_one : circleInverse 1=0 := by
  apply AddCircle.injective_toCircle one_ne_zero
  rw [toCircle_circleInverse,AddCircle.toCircle_zero]

theorem circleInverse_mul (z w : Circle) : circleInverse (z*w)=circleInverse z+circleInverse w := by
  apply AddCircle.injective_toCircle one_ne_zero
  rw [toCircle_circleInverse,AddCircle.toCircle_add,toCircle_circleInverse,toCircle_circleInverse]

noncomputable def additiveCharacter {G : Type*} [AddCommGroup G] [TopologicalSpace G]
    (χ : PontryaginDual (Multiplicative G)) : G →ₜ+ UnitAddCircle where
  toFun x := circleInverse (χ (Multiplicative.ofAdd x))
  map_zero' := by
    change circleInverse (χ 1)=0
    rw [map_one,circleInverse_one]
  map_add' x y := by
    change circleInverse (χ (Multiplicative.ofAdd x*Multiplicative.ofAdd y))=_
    rw [map_mul,circleInverse_mul]
  continuous_toFun := continuous_circleInverse.comp (χ.continuous.comp continuous_ofAdd)

noncomputable def multiplicativeCharacter {H : Type*} [AddCommGroup H]
    [TopologicalSpace H] [DiscreteTopology H] (ψ : H →+ UnitAddCircle) :
    PontryaginDual (Multiplicative H) where
  toFun x := AddCircle.toCircle (ψ x.toAdd)
  map_one' := by
    change AddCircle.toCircle (ψ 0)=1
    rw [map_zero,AddCircle.toCircle_zero]
  map_mul' x y := by
    change AddCircle.toCircle (ψ (x.toAdd+y.toAdd))=_
    rw [map_add,AddCircle.toCircle_add]
  continuous_toFun := continuous_of_discreteTopology

/-- Every algebraic character of an abstract subgroup gives a lower bound for
the supremum over continuous characters of the ambient compact abelian group. -/
theorem algebraic_character_le_characterValue {H G : Type*} [AddCommGroup H] [AddCommGroup G]
    [TopologicalSpace G] [IsTopologicalAddGroup G] [CompactSpace G] [T2Space G]
    (f : H →+ G) (hf : Function.Injective f) (a b : H) (ψ : H →+ UnitAddCircle) :
    min ‖ψ a‖ ‖ψ b‖ ≤ characterValue (f a) (f b) := by
  let _ : TopologicalSpace H := ⊥
  let _ : DiscreteTopology H := ⟨rfl⟩
  let f' : Multiplicative H →ₜ* Multiplicative G :=
    {toFun := fun x => Multiplicative.ofAdd (f x.toAdd),
     map_one' := f.map_zero,
     map_mul' := fun x y => f.map_add x.toAdd y.toAdd,
     continuous_toFun := continuous_of_discreteTopology}
  have hf' : Function.Injective f' := by
    intro x y h
    change f x.toAdd=f y.toAdd at h
    exact congrArg Multiplicative.ofAdd (hf h)
  have hdense := denseRange_dual_map f' hf'
  let s : PontryaginDual (Multiplicative H) → ℝ := fun χ =>
    min ‖circleInverse (χ (Multiplicative.ofAdd a))‖
      ‖circleInverse (χ (Multiplicative.ofAdd b))‖
  have hs : Continuous s :=
    (continuous_circleInverse.comp
      (continuous_eval_const (F:=Multiplicative H →ₜ* Circle) (Multiplicative.ofAdd a))).norm.min
      (continuous_circleInverse.comp
        (continuous_eval_const (F:=Multiplicative H →ₜ* Circle) (Multiplicative.ofAdd b))).norm
  have hclosed : IsClosed {χ | s χ ≤ characterValue (f a) (f b)} :=
    isClosed_le hs continuous_const
  have hsub : Set.range (PontryaginDual.map f') ⊆
      {χ | s χ ≤ characterValue (f a) (f b)} := by
    rintro χ ⟨η,rfl⟩
    exact le_characterValue (f a) (f b) (additiveCharacter η)
  have hb := closure_minimal hsub hclosed (hdense (multiplicativeCharacter ψ))
  change min ‖circleInverse (AddCircle.toCircle (ψ a))‖
    ‖circleInverse (AddCircle.toCircle (ψ b))‖ ≤ characterValue (f a) (f b) at hb
  simpa only [circleInverse_toCircle] using hb

end Motzkin
