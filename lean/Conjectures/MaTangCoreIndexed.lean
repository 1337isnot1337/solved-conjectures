import Conjectures.MaTangCoreBalance

/-!
# Ma–Tang's random subset-sum threshold conjecture

Extend the checked ternary balancing argument from already grouped lists
to the original ordered list of coefficient positions and column types.
All flips represented by a function of column type preserve a selected
fiber's second-coordinate sum modulo three.
-/

namespace MaTangCoreIndexed

open MaTangCoreBalance

abbrev Raw := Nat × Int

structure Annot where
  label : Nat
  coeff : Int
  bit : Bool

def project (x : Annot) : Raw := (x.label, x.coeff)

def countType : List Raw → Nat → Nat
  | [], _ => 0
  | (b,c) :: xs, d =>
    (if b = d ∧ c % 3 ≠ 0 then 1 else 0) + countType xs d

def nextBudget (p : Nat → Nat) (b : Nat) : Nat → Nat :=
  fun d => if d = b then p d - 1 else p d

def annotate : List Raw → (Nat → Nat) → List Annot
  | [], _ => []
  | (b,c) :: xs, p =>
    if c % 3 = 0 then ⟨b,c,false⟩ :: annotate xs p
    else ⟨b,c,chooseSign c (p b != 0)⟩ :: annotate xs (nextBudget p b)

def typeSignedSum : List Annot → Nat → Int
  | [], _ => 0
  | x :: xs, d =>
    (if x.label = d then signed x.coeff x.bit else 0) + typeSignedSum xs d

theorem annotate_projection (xs : List Raw) (p : Nat → Nat) :
    (annotate xs p).map project = xs := by
  induction xs generalizing p with
  | nil => rfl
  | cons x xs ih =>
    rcases x with ⟨b,c⟩
    by_cases hc : c % 3 = 0 <;> simp [annotate, hc, project, ih]

theorem annotate_type_sum (xs : List Raw) (p : Nat → Nat) (d : Nat)
    (hp : p d ≤ countType xs d) :
    typeSignedSum (annotate xs p) d % 3 =
      (2 * (countType xs d : Int) - (p d : Int)) % 3 := by
  induction xs generalizing p with
  | nil =>
    have hz : p d = 0 := by simpa [countType] using hp
    simp [annotate, typeSignedSum, countType, hz]
  | cons x xs ih =>
    rcases x with ⟨b,c⟩
    by_cases hc : c % 3 = 0
    · have hpn : p d ≤ countType xs d := by simpa [countType,hc] using hp
      have ht := ih p hpn
      by_cases hbd : b = d
      · simp [annotate, hc, countType, typeSignedSum, hbd, signed]
        omega
      · simp [annotate, hc, countType, typeSignedSum, hbd]
        exact ht
    · by_cases hbd : b = d
      · subst b
        have hpn : (nextBudget p d) d ≤ countType xs d := by
          simp [countType, hc] at hp
          simp [nextBudget]
          omega
        have ht := ih (nextBudget p d) hpn
        have hh := chooseSign_mod c (p d != 0) hc
        simp [nextBudget] at ht
        simp [annotate, hc, countType, typeSignedSum]
        by_cases hz : p d = 0
        · simp [hz] at hh ht ⊢
          omega
        · simp [hz] at hh ⊢
          omega
      · have hdb : d ≠ b := fun h => hbd h.symm
        have hpn : (nextBudget p b) d ≤ countType xs d := by
          simpa [nextBudget, hdb, countType, hbd, hc] using hp
        have ht := ih (nextBudget p b) hpn
        simpa [annotate, hc, countType, typeSignedSum, hbd, nextBudget, hdb] using ht

def initialBudget (xs : List Raw) (d : Nat) : Nat :=
  (2 * countType xs d) % 3

def chosen (xs : List Raw) : List Annot := annotate xs (initialBudget xs)

theorem chosen_projection (xs : List Raw) : (chosen xs).map project = xs :=
  annotate_projection _ _

theorem chosen_type_balanced (xs : List Raw) (d : Nat)
    (hn : countType xs d ≠ 1) :
    typeSignedSum (chosen xs) d % 3 = 0 := by
  have hp : initialBudget xs d ≤ countType xs d := by
    unfold initialBudget
    have hm := Nat.mod_lt (2 * countType xs d) (by decide : 0 < 3)
    omega
  unfold chosen
  rw [annotate_type_sum xs (initialBudget xs) d hp]
  unfold initialBudget
  omega

def delta (xs : List Annot) (a : Nat → Bool) : Int :=
  match xs with
  | [] => 0
  | x :: rest =>
    (if a x.label then signed x.coeff x.bit else 0) + delta rest a

def before (xs : List Annot) : Int :=
  match xs with
  | [] => 0
  | x :: rest => (if x.bit then x.coeff else 0) + before rest

def after (xs : List Annot) (a : Nat → Bool) : Int :=
  match xs with
  | [] => 0
  | x :: rest =>
    (if (x.bit != a x.label) then x.coeff else 0) + after rest a

theorem after_eq (xs : List Annot) (a : Nat → Bool) :
    after xs a = before xs + delta xs a := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
    rcases x with ⟨b,c,u⟩
    cases u <;> cases ha : a b <;>
      simp [after, before, delta, signed, ha, ih] <;> omega

def belowMask (a : Nat → Bool) (n : Nat) (b : Nat) : Bool :=
  a b && decide (b < n)

theorem delta_below_succ (xs : List Annot) (a : Nat → Bool) (n : Nat) :
    delta xs (belowMask a (n+1)) =
      delta xs (belowMask a n) + (if a n then typeSignedSum xs n else 0) := by
  induction xs with
  | nil => simp [delta,typeSignedSum]
  | cons x xs ih =>
    rcases x with ⟨b,c,u⟩
    by_cases hbn : b = n
    · subst b
      cases ha : a n <;> simp [delta,typeSignedSum,belowMask,ha,ih] <;> omega
    · have hlt : (b < n+1) = (b < n) := by
        apply propext
        omega
      cases hb : a b <;> cases hn : a n <;>
        simp [delta,typeSignedSum,belowMask,hbn,hlt,hb,hn,ih] <;> omega

theorem delta_below_zero (xs : List Annot) (a : Nat → Bool) :
    delta xs (belowMask a 0) = 0 := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [delta,belowMask,ih]

theorem delta_below_mod (xs : List Annot) (a : Nat → Bool)
    (h : ∀ d, d ≠ 0 → typeSignedSum xs d % 3 = 0)
    (ha : a 0 = false) (n : Nat) :
    delta xs (belowMask a n) % 3 = 0 := by
  induction n with
  | zero => simp [delta_below_zero]
  | succ n ih =>
    rw [delta_below_succ]
    by_cases hz : n = 0
    · subst n
      simp [ha,ih]
    · have ht := h n hz
      cases hn : a n <;> simp <;> omega


def labelBound : List Annot → Nat
  | [] => 0
  | x :: xs => max (x.label + 1) (labelBound xs)

theorem label_lt_bound (xs : List Annot) (x : Annot) (hx : x ∈ xs) :
    x.label < labelBound xs := by
  induction xs with
  | nil => simp at hx
  | cons y ys ih =>
    rcases List.mem_cons.mp hx with he | hm
    · subst x
      simp only [labelBound]
      omega
    · have h := ih hm
      simp only [labelBound]
      omega

theorem delta_below_eq (xs : List Annot) (a : Nat → Bool) (n : Nat)
    (h : ∀ x ∈ xs, x.label < n) :
    delta xs (belowMask a n) = delta xs a := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
    have hx := h x (by simp)
    have ht := ih (fun y hy => h y (by simp [hy]))
    simp [delta,belowMask,hx,ht]

theorem delta_mod (xs : List Annot) (a : Nat → Bool)
    (h : ∀ d, d ≠ 0 → typeSignedSum xs d % 3 = 0)
    (ha : a 0 = false) :
    delta xs a % 3 = 0 := by
  have ht := delta_below_mod xs a h ha (labelBound xs)
  rw [delta_below_eq xs a (labelBound xs) (label_lt_bound xs)] at ht
  exact ht

/-- The signed coefficients on the original, ordered positions have a
constant residue on every type-constant binary flip fixing type zero. -/
theorem chosen_mod_invariant (xs : List Raw)
    (h : ∀ d, d ≠ 0 → countType xs d ≠ 1)
    (a : Nat → Bool) (ha : a 0 = false) :
    after (chosen xs) a % 3 = before (chosen xs) % 3 := by
  have hd := delta_mod (chosen xs) a
    (fun d hd => chosen_type_balanced xs d (h d hd)) ha
  rw [after_eq]
  omega

/-- Ordinary subset sum of the given ordered coefficient positions. -/
def sumBits : List Raw → List Bool → Int
  | x :: xs, b :: bs => (if b then x.2 else 0) + sumBits xs bs
  | _, _ => 0

/-- Binary addition of a type-dependent mask to a selection vector. -/
def flipBits : List Raw → List Bool → (Nat → Bool) → List Bool
  | x :: xs, b :: bs, a => (b != a x.1) :: flipBits xs bs a
  | _, _, _ => []

theorem sumBits_before (xs : List Annot) :
    sumBits (xs.map project) (xs.map Annot.bit) = before xs := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [sumBits,before,project,ih]

theorem sumBits_after (xs : List Annot) (a : Nat → Bool) :
    sumBits (xs.map project) (flipBits (xs.map project) (xs.map Annot.bit) a)
      = after xs a := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp [sumBits,flipBits,after,project,ih]

/-- Ordered positions with no singleton occupied nonzero type admit a
binary selection whose entire type-flip fiber has a single residue. -/
theorem exists_ordered_constant_fiber (xs : List Raw)
    (h : ∀ d, d ≠ 0 → countType xs d ≠ 1) :
    ∃ u : List Bool, u.length = xs.length ∧
      ∀ a : Nat → Bool, a 0 = false →
        sumBits xs (flipBits xs u a) % 3 = sumBits xs u % 3 := by
  let ys := chosen xs
  have hp : ys.map project = xs := chosen_projection xs
  refine ⟨ys.map Annot.bit, ?_, ?_⟩
  · have hl := congrArg List.length hp
    simpa using hl
  · intro a ha
    rw [← hp, sumBits_after, sumBits_before]
    exact chosen_mod_invariant xs h a ha

/-- Deterministic noncoverage for an arbitrary first-coordinate map whose
fibers have the given binary column-type representation. The hypothesis
on fibers is explicit, rather than an asserted linear-algebra fact. -/
theorem not_covers_of_type_fibers {α : Type} (xs : List Raw) (A : List Bool → α)
    (h : ∀ d, d ≠ 0 → countType xs d ≠ 1)
    (hfiber : ∀ u v : List Bool, u.length = xs.length →
      v.length = xs.length → A u = A v →
      ∃ a : Nat → Bool, a 0 = false ∧ v = flipBits xs u a) :
    ¬ (∀ (b : α) (z : Int), 0 ≤ z → z < 3 →
      ∃ v : List Bool, v.length = xs.length ∧ A v = b ∧ sumBits xs v % 3 = z) := by
  intro hc
  obtain ⟨u,hu,hi⟩ := exists_ordered_constant_fiber xs h
  let z := (sumBits xs u + 1) % 3
  have hz0 : 0 ≤ z := by dsimp [z]; omega
  have hz3 : z < 3 := by dsimp [z]; omega
  obtain ⟨v,hv,hAv,hvsum⟩ := hc (A u) z hz0 hz3
  obtain ⟨a,ha,hva⟩ := hfiber u v hu hv hAv.symm
  have he := hi a ha
  rw [← hva,hvsum] at he
  dsimp [z] at he
  omega

end MaTangCoreIndexed
