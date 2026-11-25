module

public import Mathlib.Data.Fin.Tuple.Basic
public import Mathlib.Data.List.OfFn
public import Mathlib.SetTheory.Cardinal.NatCard
public import Mathlib.Data.Fintype.Perm
public import Mathlib.Data.Multiset.Basic
public import Mathlib.Tactic

@[expose] public section
namespace LassalleRefinement

/-- Process the next input of West's deterministic stack sort. The stack
head is the top; the output accumulated so far is in reverse order. -/
def stackPush (x : ℕ) : List ℕ → List ℕ → List ℕ × List ℕ
  | [],o => ([x],o)
  | y::ys,o => if x<y then (x::y::ys,o) else stackPush x ys (y::o)

def stackLoop : List ℕ → List ℕ → List ℕ → List ℕ
  | [],s,o => o.reverse ++ s
  | x::xs,s,o =>
    let z := stackPush x s o
    stackLoop xs z.1 z.2

/-- West's stack-sorting map on lists of natural labels. On permutations
there are no equal input labels. -/
def westStackSort (w : List ℕ) : List ℕ := stackLoop w [] []

theorem stackPush_multiset (x : ℕ) (s o : List ℕ) :
    ((stackPush x s o).1 : Multiset ℕ) + ((stackPush x s o).2 : Multiset ℕ) =
      (x::s : List ℕ) + (o : Multiset ℕ) := by
  induction s generalizing o with
  | nil => rfl
  | cons y ys ih =>
    by_cases h : x<y
    · simp [stackPush,h]
    · simp only [stackPush,ite_eq_right h,ih]
      simp only [← Multiset.cons_coe,Multiset.cons_add]
      rw [Multiset.add_cons]

theorem stackLoop_multiset (w s o : List ℕ) :
    (stackLoop w s o : Multiset ℕ) = (w : Multiset ℕ)+(s : Multiset ℕ)+(o : Multiset ℕ) := by
  induction w generalizing s o with
  | nil =>
    rw [stackLoop,← Multiset.coe_add,Multiset.coe_reverse,Multiset.coe_nil,zero_add,add_comm]
  | cons x xs ih =>
    simp only [stackLoop,ih]
    rw [add_assoc,stackPush_multiset]
    simp only [← Multiset.cons_coe,Multiset.cons_add,Multiset.add_cons]
    rw [add_assoc]

theorem westStackSort_multiset (w : List ℕ) : (westStackSort w : Multiset ℕ)=(w : Multiset ℕ) := by
  simp [westStackSort,stackLoop_multiset]

def permWord {n : ℕ} (π : Equiv.Perm (Fin n)) : List ℕ :=
  List.ofFn fun i => (π i).val

/-- Exactly one permutation maps to this permutation under West stack sorting. -/
def UniquelySorted {n : ℕ} (π : Equiv.Perm (Fin n)) : Prop :=
  ∃! τ : Equiv.Perm (Fin n), westStackSort (permWord τ) = permWord π

/-- First-value refinement from Defant–Engen–Miller, using zero-based labels. -/
noncomputable def refinement (k a : ℕ) : ℕ :=
  Nat.card {π : Equiv.Perm (Fin (2*k+1)) // UniquelySorted π ∧ (π 0).val=a}

def ExactLassalleConjecture : Prop :=
  ∀ k a : ℕ, 0<a → a<2*k →
    refinement k (a-1)*refinement k (a+1) ≤ (refinement k a)^2

theorem refinement_one (a : ℕ) : refinement 0 a = if a=0 then 1 else 0 := by
  classical
  let p : Equiv.Perm (Fin 1) := Equiv.refl _
  have hu : UniquelySorted p := by
    refine ⟨p,?_,fun q _ => Subsingleton.elim q p⟩
    rfl
  have hv (q : Equiv.Perm (Fin (2*0+1))) : (q 0).val=0 := by omega
  by_cases ha : a=0
  · subst a
    simp only [ite_true]
    let e : {π : Equiv.Perm (Fin (2*0+1)) // UniquelySorted π ∧ (π 0).val=0} ≃ Unit :=
      { toFun := fun _ => ()
        invFun := fun _ => ⟨p,hu,hv p⟩
        left_inv := fun q => Subtype.ext (show p = (q.val : Equiv.Perm (Fin 1)) from Subsingleton.elim _ _)
        right_inv := fun u => by cases u; rfl }
    exact (Nat.card_congr e).trans (by simp)
  · rw [ite_eq_right ha]
    let _ : IsEmpty {π : Equiv.Perm (Fin (2*0+1)) // UniquelySorted π ∧ (π 0).val=a} :=
      ⟨fun q => ha (q.property.2.symm.trans (hv q.val))⟩
    exact Nat.card_of_isEmpty

end LassalleRefinement
