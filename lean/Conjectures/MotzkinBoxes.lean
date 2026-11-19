import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Fintype.Prod
import Mathlib.Data.Finset.Card
import Lean.Elab.Tactic.Omega

/-! Interior boxes in a finitely generated abelian group project injectively
to a finite quotient. A bounded generator cannot create a wrapped edge. -/
namespace Motzkin

variable {F I : Type*} [AddCommGroup F]

def boxQuotient (n : ℕ) : (F × (I → ℤ)) →+ (F × (I → ZMod n)) where
  toFun x := (x.1,fun i => (x.2 i : ZMod n))
  map_zero' := by
    apply Prod.ext
    · rfl
    · funext i
      exact Int.cast_zero
  map_add' x y := by
    apply Prod.ext
    · rfl
    · funext i
      exact Int.cast_add _ _

theorem boxQuotient_surjective (n : ℕ) [NeZero n] :
    Function.Surjective (boxQuotient (F:=F) (I:=I) n) := by
  intro y
  refine ⟨(y.1,fun i => (y.2 i).val),?_⟩
  apply Prod.ext
  · rfl
  · funext i
    change (((y.2 i).val:ℤ):ZMod n)=y.2 i
    rw [Int.cast_natCast,ZMod.natCast_zmod_val]

def boxLift (L : ℕ) {m : ℕ} (x : F × (I → Fin m)) : F × (I → ℤ) :=
  (x.1,fun i => (x.2 i:ℕ)+(L:ℤ))

def boxProject (L m : ℕ) (x : F × (I → Fin m)) : F × (I → ZMod (m+2*L)) :=
  boxQuotient (m+2*L) (boxLift L x)

omit [AddCommGroup F] in
theorem boxLift_injective (L : ℕ) (m : ℕ) :
    Function.Injective (boxLift (F:=F) (I:=I) L (m:=m)) := by
  intro x y hxy
  apply Prod.ext
  · have hfirst := congrArg (fun z : F × (I → ℤ) => z.1) hxy
    exact hfirst
  · funext i
    apply Fin.ext
    have hi := congrFun (congrArg Prod.snd hxy) i
    change ((x.2 i:ℕ):ℤ)+L=((y.2 i:ℕ):ℤ)+L at hi
    omega

/-- Equality after reducing an interior edge modulo the box period already
holds before reduction. Both endpoints may lie anywhere in the interior. -/
theorem boxLift_eq_of_project_step (L m : ℕ) (δ : F × (I → ℤ))
    (hδ : ∀ i, |δ.2 i| ≤ (L:ℤ)) (x y : F × (I → Fin m))
    (h : boxProject L m y = boxProject L m x + boxQuotient (m+2*L) δ) :
    boxLift L y = boxLift L x+δ := by
  apply Prod.ext
  · have hfirst := congrArg (fun z : F × (I → ZMod (m+2*L)) => z.1) h
    exact hfirst
  · funext i
    have hi := congrFun (congrArg Prod.snd h) i
    change (((y.2 i:ℕ)+(L:ℤ):ℤ):ZMod (m+2*L)) =
      (((x.2 i:ℕ)+(L:ℤ):ℤ):ZMod (m+2*L))+(δ.2 i:ZMod (m+2*L)) at hi
    rw [← Int.cast_add,ZMod.intCast_eq_intCast_iff'] at hi
    have hx := (x.2 i).isLt
    have hy := (y.2 i).isLt
    have hd := abs_le.mp (hδ i)
    rw [Int.emod_eq_of_lt (by omega) (by omega),
      Int.emod_eq_of_lt (by omega) (by omega)] at hi
    exact hi

theorem boxProject_injective (L m : ℕ) :
    Function.Injective (boxProject (F:=F) (I:=I) L m) := by
  intro x y hxy
  apply boxLift_injective L m
  have h := boxLift_eq_of_project_step L m (0 : F × (I → ℤ))
    (by intro i; simp) y x (by simpa only [map_zero,add_zero] using hxy)
  simpa only [add_zero] using h

omit [AddCommGroup F] in
theorem box_index_card [Fintype F] [Fintype I] [DecidableEq I] (m : ℕ) :
    Fintype.card (F × (I → Fin m)) = Fintype.card F*m^Fintype.card I := by
  simp only [Fintype.card_prod,Fintype.card_fun,Fintype.card_fin]

omit [AddCommGroup F] in
theorem box_quotient_card [Fintype F] [Fintype I] [DecidableEq I] (n : ℕ) [NeZero n] :
    Fintype.card (F × (I → ZMod n)) = Fintype.card F*n^Fintype.card I := by
  simp only [Fintype.card_prod,Fintype.card_fun,ZMod.card]

end Motzkin
