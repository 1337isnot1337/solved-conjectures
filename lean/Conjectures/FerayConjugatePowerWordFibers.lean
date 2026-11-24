import Init

/-!
# Féray's conjugate-power word: exact fiber bijections

This is the finite algebraic reduction in §1 of the existing
results/feray-conjugate-power-word/PROOF.md. It works on permutations of
any type, hence on the finite set used in the conjecture. Probability,
cardinality transfer, character estimates and the limits are not yet proved.
-/
namespace FerayConjugatePowerWord

universe u v

structure Permutation (α : Type u) where
  forward : α → α
  backward : α → α
  left_inv : ∀ x, backward (forward x) = x
  right_inv : ∀ x, forward (backward x) = x

namespace Permutation

attribute [simp] left_inv right_inv

theorem ext {α : Type u} {p q : Permutation α}
    (h : ∀ x, p.forward x = q.forward x) : p = q := by
  cases p with
  | mk f g hl hr =>
    cases q with
    | mk f' g' hl' hr' =>
      have hf : f = f' := funext h
      subst f'
      have hg : g = g' := by
        funext x
        calc
          g x = g (f (g' x)) := by rw [hr' x]
          _ = g' x := hl (g' x)
      subst g'
      rfl

def one (α : Type u) : Permutation α :=
  ⟨id, id, fun _ => rfl, fun _ => rfl⟩

def mul {α : Type u} (p q : Permutation α) : Permutation α :=
  ⟨fun x => p.forward (q.forward x),
   fun x => q.backward (p.backward x),
   fun x => by simp, fun x => by simp⟩

def inv {α : Type u} (p : Permutation α) : Permutation α :=
  ⟨p.backward, p.forward, p.right_inv, p.left_inv⟩

@[simp] theorem one_forward {α : Type u} (x : α) :
    (one α).forward x = x := rfl
@[simp] theorem one_backward {α : Type u} (x : α) :
    (one α).backward x = x := rfl
@[simp] theorem mul_forward {α : Type u} (p q : Permutation α) (x : α) :
    (mul p q).forward x = p.forward (q.forward x) := rfl
@[simp] theorem mul_backward {α : Type u} (p q : Permutation α) (x : α) :
    (mul p q).backward x = q.backward (p.backward x) := rfl
@[simp] theorem inv_forward {α : Type u} (p : Permutation α) (x : α) :
    (inv p).forward x = p.backward x := rfl
@[simp] theorem inv_backward {α : Type u} (p : Permutation α) (x : α) :
    (inv p).backward x = p.forward x := rfl

def square {α : Type u} (p : Permutation α) : Permutation α := mul p p

/-- The convention here is conjugation by the inverse on the left. -/
def conj {α : Type u} (y x : Permutation α) : Permutation α :=
  mul (mul (inv y) x) y

@[simp] theorem conj_one {α : Type u} (x : Permutation α) :
    conj (one α) x = x := by
  apply ext
  intro a
  simp [conj]

theorem conj_comp {α : Type u} (y z x : Permutation α) :
    conj z (conj y x) = conj (mul y z) x := by
  apply ext
  intro a
  simp [conj]

@[simp] theorem conj_inverse {α : Type u} (y x : Permutation α) :
    conj (inv y) (conj y x) = x := by
  apply ext
  intro a
  simp [conj]

@[simp] theorem conj_inverse' {α : Type u} (y x : Permutation α) :
    conj y (conj (inv y) x) = x := by
  apply ext
  intro a
  simp [conj]

theorem square_conj {α : Type u} (y x : Permutation α) :
    square (conj y x) = conj y (square x) := by
  apply ext
  intro a
  simp [square, conj]

/-- Change the base permutation by h and the conjugated target by k. -/
theorem conj_two_changes {α : Type u} (h y k x : Permutation α) :
    conj (mul (mul (inv h) y) k) (conj h x) = conj k (conj y x) := by
  apply ext
  intro a
  simp [conj]

def word {α : Type u} (σ τ : Permutation α) : Permutation α :=
  mul (mul (mul σ τ) (square σ)) (square τ)

/-- Exact identity for the word in Féray's Problem 5. -/
theorem word_change {α : Type u} (σ τ : Permutation α) :
    word σ τ = mul (square (mul σ τ)) (conj τ (mul σ τ)) := by
  apply ext
  intro a
  simp [word, square, conj]

end Permutation

open Permutation

structure Bijection (A : Type u) (B : Type v) where
  toFun : A → B
  invFun : B → A
  left_inv : ∀ x, invFun (toFun x) = x
  right_inv : ∀ y, toFun (invFun y) = y

/-- (σ, τ) ↔ (στ, τ), so the change of generators is a bijection. -/
def changeGenerators (α : Type u) :
    Bijection (Permutation α × Permutation α) (Permutation α × Permutation α) where
  toFun p := (mul p.1 p.2, p.2)
  invFun p := (mul p.1 (inv p.2), p.2)
  left_inv p := by
    apply Prod.ext
    · apply Permutation.ext
      intro a
      simp
    · rfl
  right_inv p := by
    apply Prod.ext
    · apply Permutation.ext
      intro a
      simp
    · rfl

def InClass {α : Type u} (x c : Permutation α) : Prop :=
  ∃ y, x = conj y c

theorem class_preserved {α : Type u} {x c : Permutation α} (h : Permutation α)
    (hc : InClass x c) : InClass (conj h x) c := by
  rcases hc with ⟨y, rfl⟩
  exact ⟨mul y h, conj_comp y h c⟩

/-- Fiber of (X,Y) ↦ (X²,Y⁻¹XY), conditioned on X's conjugacy class. -/
def Fiber {α : Type u} (c a b : Permutation α) :=
  {p : Permutation α × Permutation α //
    InClass p.1 c ∧ square p.1 = a ∧ conj p.2 p.1 = b}

def fiberForward {α : Type u} {c a b : Permutation α}
    (h k : Permutation α) (p : Fiber c a b) :
    Fiber c (conj h a) (conj k b) := by
  refine ⟨(conj h p.val.1, mul (mul (inv h) p.val.2) k), ?_⟩
  exact ⟨class_preserved h p.property.1,
    by rw [square_conj, p.property.2.1],
    by rw [conj_two_changes, p.property.2.2]⟩

def fiberBackward {α : Type u} {c a b : Permutation α}
    (h k : Permutation α) (p : Fiber c (conj h a) (conj k b)) :
    Fiber c a b := by
  let r := fiberForward (inv h) (inv k) p
  exact ⟨r.val, by simpa only [conj_inverse] using r.property⟩

/-- All output pairs in a product of conjugacy classes have bijective
conditional fibers. No probabilistic independence premise is assumed. -/
def fiberBijection {α : Type u} {c a b : Permutation α}
    (h k : Permutation α) :
    Bijection (Fiber c a b) (Fiber c (conj h a) (conj k b)) where
  toFun := fiberForward h k
  invFun := fiberBackward h k
  left_inv p := by
    apply Subtype.ext
    apply Prod.ext
    · change conj (inv h) (conj h p.val.1) = p.val.1
      exact conj_inverse h p.val.1
    · change mul (mul (inv (inv h)) (mul (mul (inv h) p.val.2) k)) (inv k) = p.val.2
      apply Permutation.ext
      intro a
      simp
  right_inv p := by
    apply Subtype.ext
    apply Prod.ext
    · change conj h (conj (inv h) p.val.1) = p.val.1
      exact conj_inverse' h p.val.1
    · change mul (mul (inv h) (mul (mul (inv (inv h)) p.val.2) (inv k))) k = p.val.2
      apply Permutation.ext
      intro a
      simp

theorem fibers_equinumerous {α : Type u} {c a b a' b' : Permutation α}
    (ha : InClass a' a) (hb : InClass b' b) :
    Nonempty (Bijection (Fiber c a b) (Fiber c a' b')) := by
  rcases ha with ⟨h, rfl⟩
  rcases hb with ⟨k, rfl⟩
  exact ⟨fiberBijection h k⟩

/-- Every pair of elements of the two target conjugacy classes occurs. -/
theorem fiber_nonempty {α : Type u} {c a b : Permutation α}
    (ha : InClass a (square c)) (hb : InClass b c) :
    Nonempty (Fiber c a b) := by
  rcases ha with ⟨h, rfl⟩
  rcases hb with ⟨k, rfl⟩
  have base : Fiber c (square c) c :=
    ⟨(c, one α), ⟨⟨one α, (conj_one c).symm⟩, rfl, conj_one c⟩⟩
  exact ⟨fiberForward h k base⟩

/-- Conversely every occupied fiber lies in exactly the claimed product of classes. -/
theorem fiber_support {α : Type u} {c a b : Permutation α}
    (p : Fiber c a b) : InClass a (square c) ∧ InClass b c := by
  rcases p.property with ⟨⟨h, hh⟩, ha, hb⟩
  constructor
  · refine ⟨h, ?_⟩
    rw [← ha, hh, square_conj]
  · refine ⟨mul h p.val.2, ?_⟩
    calc
      b = conj p.val.2 p.val.1 := hb.symm
      _ = conj p.val.2 (conj h c) := congrArg (conj p.val.2) hh
      _ = conj (mul h p.val.2) c := conj_comp h p.val.2 c

end FerayConjugatePowerWord
