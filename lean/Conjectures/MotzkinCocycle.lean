import Conjectures.MotzkinSkew
import Mathlib.Topology.Instances.AddCircle.Real
import Mathlib.Algebra.Group.Subgroup.Ker
import Mathlib.Tactic.NormNum

/-! A closed integral cochain on a finite two-generator Cayley graph yields
a circle character whose generator values are its averaged increments. -/
namespace Motzkin

open scoped BigOperators

theorem exists_character_factor {K H C : Type*} [AddGroup K] [AddGroup H] [AddCommGroup C]
    (f : K →+ H) (g : K →+ C) (hf : Function.Surjective f) (hker : f.ker ≤ g.ker) :
    ∃ χ : H →+ C, ∀ x : K, χ (f x)=g x := by
  classical
  choose r hr using hf
  have hzero : g (r 0)=0 := hker (by change f (r 0)=0; exact hr 0)
  have hadd : ∀ x y, g (r (x+y)) = g (r x)+g (r y) := by
    intro x y
    have hh : r (x+y)-r y-r x ∈ f.ker := by
      change f (r (x+y)-r y-r x)=0
      rw [map_sub,map_sub,hr,hr,hr,add_sub_cancel_right,sub_self]
    have hg := hker hh
    change g (r (x+y)-r y-r x)=0 at hg
    rw [map_sub,map_sub] at hg
    apply sub_eq_zero.mp
    calc
      g (r (x+y))-(g (r x)+g (r y)) = g (r (x+y))-g (r y)-g (r x) := by abel
      _ = 0 := hg
  let χ : H →+ C := {toFun := fun x => g (r x),map_zero' := hzero,map_add' := hadd}
  refine ⟨χ,?_⟩
  intro x
  have hh : r (f x)-x ∈ f.ker := by
    change f (r (f x)-x)=0
    rw [map_sub,hr,sub_self]
  have hg := hker hh
  change g (r (f x)-x)=0 at hg
  rw [map_sub] at hg
  exact sub_eq_zero.mp hg

namespace IntegralLift

variable {G : Type*} [AddCommGroup G] [Fintype G]

noncomputable def averageCharacter : IntegralLift G →+ UnitAddCircle where
  toFun X := (((total X:ℤ):ℝ)/(Fintype.card G:ℝ) : UnitAddCircle)
  map_zero' := by
    simp only [total,zero_step,Finset.sum_const_zero,Int.cast_zero,zero_div,AddCircle.coe_zero]
  map_add' X Y := by
    rw [total_add,Int.cast_add,add_div,AddCircle.coe_add]

theorem averageCharacter_of_constant {X : IntegralLift G}
    (hX : ∀ x, X.step x=X.step 0) : averageCharacter X=0 := by
  have hN : (Fintype.card G : ℝ) ≠ 0 := by exact_mod_cast Fintype.card_ne_zero
  change (((total X:ℤ):ℝ)/(Fintype.card G:ℝ) : UnitAddCircle)=0
  rw [total_of_constant hX,Int.cast_mul,Int.cast_natCast,
    mul_div_cancel_left₀ _ hN]
  apply (AddCircle.coe_eq_zero_iff (1:ℝ)).mpr
  exact ⟨X.step 0,by simp⟩

theorem cocycle_character (X Y : IntegralLift G) (hcomm : X+Y=Y+X)
    (hgen : AddSubgroup.closure ({X.displacement,Y.displacement} : Set G)=⊤) :
    ∃ χ : G →+ UnitAddCircle,
      χ X.displacement=averageCharacter X ∧ χ Y.displacement=averageCharacter Y := by
  let K := AddSubgroup.centralizer ({X,Y} : Set (IntegralLift G))
  have hX : X ∈ K := by
    apply AddSubgroup.mem_centralizer_iff.mpr
    intro Z hZ
    simp only [Set.mem_insert_iff,Set.mem_singleton_iff] at hZ
    rcases hZ with rfl | rfl
    · rfl
    · exact hcomm.symm
  have hY : Y ∈ K := by
    apply AddSubgroup.mem_centralizer_iff.mpr
    intro Z hZ
    simp only [Set.mem_insert_iff,Set.mem_singleton_iff] at hZ
    rcases hZ with rfl | rfl
    · exact hcomm
    · rfl
  let f : K →+ G := displacementHom.comp K.subtype
  let g : K →+ UnitAddCircle := averageCharacter.comp K.subtype
  have hf : Function.Surjective f := by
    apply AddMonoidHom.range_eq_top.mp
    apply le_antisymm le_top
    rw [← hgen]
    apply (AddSubgroup.closure_le _).mpr
    intro z hz
    simp only [Set.mem_insert_iff,Set.mem_singleton_iff] at hz
    rcases hz with rfl | rfl
    · exact ⟨⟨X,hX⟩,rfl⟩
    · exact ⟨⟨Y,hY⟩,rfl⟩
  have hker : f.ker ≤ g.ker := by
    intro Z hZ
    have hd : Z.val.displacement=0 := hZ
    have hZX := (AddSubgroup.mem_centralizer_iff.mp Z.property) X (by simp)
    have hZY := (AddSubgroup.mem_centralizer_iff.mp Z.property) Y (by simp)
    have hc := kernel_step_constant hgen hd hZX.symm hZY.symm
    exact averageCharacter_of_constant hc
  obtain ⟨χ,hχ⟩ := exists_character_factor f g hf hker
  exact ⟨χ,hχ ⟨X,hX⟩,hχ ⟨Y,hY⟩⟩

/-- Only the closed-square equation and generation are required. -/
theorem character_of_closed (a b : G) (f g : G → ℤ)
    (hclosed : ∀ x, f x+g (x+a)=g x+f (x+b))
    (hgen : AddSubgroup.closure ({a,b} : Set G)=⊤) :
    ∃ χ : G →+ UnitAddCircle,
      χ a = (((∑ x, f x : ℤ):ℝ)/(Fintype.card G:ℝ) : UnitAddCircle) ∧
      χ b = (((∑ x, g x : ℤ):ℝ)/(Fintype.card G:ℝ) : UnitAddCircle) := by
  exact cocycle_character ⟨a,f⟩ ⟨b,g⟩ ((commute_iff _ _).mpr hclosed) hgen

end IntegralLift
end Motzkin
