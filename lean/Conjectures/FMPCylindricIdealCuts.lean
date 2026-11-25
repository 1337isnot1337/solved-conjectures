import Mathlib.Order.Hom.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Data.Fintype.Powerset
import Mathlib.SetTheory.Cardinal.Finite
import Lean.Elab.Tactic.Omega

namespace FMPCylindricIdealCuts

noncomputable section

variable {P : Type*} [Fintype P] [DecidableEq P] [Preorder P]

/-- A downward-closed subset of the given finite preorder. -/
def Cut (P : Type*) [Preorder P] :=
  { s : Finset P // ∀ ⦃x y : P⦄, x ≤ y → y ∈ s → x ∈ s }

abbrev L (c : Cut P) := { x : P // x ∈ c.1 }
abbrev U (c : Cut P) := { x : P // x ∉ c.1 }

def cutOf {a b : ℕ} (f : P →o Fin (a+b)) : Cut P :=
  ⟨Finset.univ.filter (fun x => (f x).val < a), fun _ _ hxy hy => by
    have hy' := (Finset.mem_filter.mp hy).2
    exact Finset.mem_filter.mpr ⟨Finset.mem_univ _, lt_of_le_of_lt (f.monotone hxy) hy'⟩⟩

omit [DecidableEq P] in
theorem mem_cutOf {a b : ℕ} (f : P →o Fin (a+b)) (x : P) :
    x ∈ (cutOf f).1 ↔ (f x).val < a := by
  simp [cutOf]

def Split (P : Type*) [Preorder P] (a b : ℕ) :=
  Σ c : Cut P, (L c →o Fin a) × (U c →o Fin b)

def split {a b : ℕ} (f : P →o Fin (a+b)) : Split P a b :=
  ⟨cutOf f,
    ⟨⟨fun x => ⟨(f x.1).val, (mem_cutOf f x.1).mp x.2⟩,
      fun _ _ h => f.monotone h⟩,
      ⟨fun x => ⟨(f x.1).val - a, by
        have hx := not_lt.mp (fun h => x.2 ((mem_cutOf f x.1).mpr h))
        have hf := (f x.1).isLt
        omega⟩, fun x y h => Nat.sub_le_sub_right (f.monotone h) a⟩⟩⟩

def glue {a b : ℕ} (z : Split P a b) : P →o Fin (a+b) where
  toFun x :=
    if hx : x ∈ z.1.1
    then Fin.castAdd b (z.2.1 ⟨x,hx⟩)
    else Fin.natAdd a (z.2.2 ⟨x,hx⟩)
  monotone' := by
    intro x y hxy
    by_cases hx : x ∈ z.1.1 <;> by_cases hy : y ∈ z.1.1
    · simp only [dite_eq_left hx, dite_eq_left hy]
      exact z.2.1.monotone hxy
    · simp only [dite_eq_left hx, dite_eq_right hy]
      have ht := (z.2.1 ⟨x,hx⟩).isLt
      change (z.2.1 ⟨x,hx⟩).val ≤ a + (z.2.2 ⟨y,hy⟩).val
      omega
    · exact (hx (z.1.2 hxy hy)).elim
    · simp only [dite_eq_right hx, dite_eq_right hy]
      exact Nat.add_le_add_left (z.2.2.monotone hxy) a

theorem glue_split {a b : ℕ} (f : P →o Fin (a+b)) :
    glue (split f) = f := by
  ext x
  change (if hx : x ∈ (cutOf f).1 then
    Fin.castAdd b ((split f).2.1 ⟨x,hx⟩) else
    Fin.natAdd a ((split f).2.2 ⟨x,hx⟩)).val = (f x).val
  split
  · rfl
  · rename_i hx
    have hh : a ≤ (f x).val := not_lt.mp (fun ht => hx ((mem_cutOf f x).mpr ht))
    change a + ((f x).val-a) = (f x).val
    omega

theorem cutOf_glue {a b : ℕ} (z : Split P a b) : cutOf (glue z) = z.1 := by
  apply Subtype.ext
  ext x
  rw [mem_cutOf]
  by_cases hx : x ∈ z.1.1
  · simp only [hx, iff_true]
    change (if h : x ∈ z.1.1 then Fin.castAdd b (z.2.1 ⟨x,h⟩) else
      Fin.natAdd a (z.2.2 ⟨x,h⟩)).val < a
    rw [dite_eq_left hx]
    exact (z.2.1 ⟨x,hx⟩).isLt
  · simp only [hx, iff_false]
    change ¬ (if h : x ∈ z.1.1 then Fin.castAdd b (z.2.1 ⟨x,h⟩) else
      Fin.natAdd a (z.2.2 ⟨x,h⟩)).val < a
    rw [dite_eq_right hx]
    change ¬ a + (z.2.2 ⟨x,hx⟩).val < a
    omega

theorem glue_injective {a b : ℕ} :
    Function.Injective (glue : Split P a b → P →o Fin (a+b)) := by
  rintro ⟨c,l,u⟩ ⟨d,l',u'⟩ h
  have he := congrArg cutOf h
  rw [cutOf_glue (⟨c,(l,u)⟩ : Split P a b), cutOf_glue (⟨d,(l',u')⟩ : Split P a b)] at he
  change c = d at he
  subst d
  have hl : l = l' := by
    apply OrderHom.ext
    funext x
    have hx := DFunLike.congr_fun h x.1
    apply Fin.ext
    have hm := x.2
    change (if h : x.1 ∈ c.1 then Fin.castAdd b (l ⟨x.1,h⟩) else
      Fin.natAdd a (u ⟨x.1,h⟩)) = (if h : x.1 ∈ c.1 then Fin.castAdd b (l' ⟨x.1,h⟩)
      else Fin.natAdd a (u' ⟨x.1,h⟩)) at hx
    rw [dite_eq_left hm, dite_eq_left hm] at hx
    exact congrArg (fun y : Fin (a+b) => y.val) hx
  have hu : u = u' := by
    apply OrderHom.ext
    funext x
    have hx := DFunLike.congr_fun h x.1
    apply Fin.ext
    have hm := x.2
    change (if h : x.1 ∈ c.1 then Fin.castAdd b (l ⟨x.1,h⟩) else
      Fin.natAdd a (u ⟨x.1,h⟩)) = (if h : x.1 ∈ c.1 then Fin.castAdd b (l' ⟨x.1,h⟩)
      else Fin.natAdd a (u' ⟨x.1,h⟩)) at hx
    rw [dite_eq_right hm, dite_eq_right hm] at hx
    have hh := congrArg Fin.val hx
    change a+(u x).val = a+(u' x).val at hh
    exact Nat.add_left_cancel hh
  rw [hl,hu]

def cutEquiv (a b : ℕ) : (P →o Fin (a+b)) ≃ Split P a b where
  toFun := split
  invFun := glue
  left_inv := glue_split
  right_inv z := glue_injective (glue_split (glue z))

private instance finiteOrderHom (A B : Type*) [Preorder A] [Preorder B] [Finite A] [Finite B] :
    Finite (A →o B) := Finite.of_injective (fun f : A →o B => (f : A → B)) DFunLike.coe_injective

noncomputable instance cutFintype : Fintype (Cut P) := by
  unfold Cut
  exact Fintype.ofFinite _

def weakCount (A : Type*) [Preorder A] (t : ℕ) : ℕ :=
  Nat.card (A →o Fin t)

theorem weakCount_add (a b : ℕ) :
    weakCount P (a+b) =
      ∑ c : Cut P, weakCount (L c) a * weakCount (U c) b := by
  unfold weakCount
  rw [Nat.card_congr (cutEquiv (P := P) a b)]
  unfold Split
  simp only [Nat.card_sigma, Nat.card_prod]

end

end FMPCylindricIdealCuts
