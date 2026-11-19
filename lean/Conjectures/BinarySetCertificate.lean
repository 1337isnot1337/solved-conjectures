import Conjectures.BinaryAutomata

/-! Finite set-equality certificates independent of bit-mask width. -/
namespace BinaryAutomata

def insertState (i : Nat) : List Nat → List Nat
  | [] => [i]
  | x::xs => if i<x then i::x::xs else if i=x then x::xs else x::insertState i xs

def normalizeStates : List Nat → List Nat
  | [] => []
  | x::xs => insertState x (normalizeStates xs)

theorem mem_insertState (n i : Nat) (xs : List Nat) :
    n∈insertState i xs ↔ n=i ∨ n∈xs := by
  induction xs with
  | nil => simp [insertState]
  | cons x xs ih =>
    simp only [insertState]
    split_ifs with hlt heq
    · simp [List.mem_cons]
    · subst i
      simp [List.mem_cons]
    · simp only [List.mem_cons,ih]
      tauto

theorem mem_normalizeStates (i : Nat) (xs : List Nat) :
    i∈normalizeStates xs ↔ i∈xs := by
  induction xs with
  | nil => rfl
  | cons x xs ih => simp only [normalizeStates,mem_insertState,ih,List.mem_cons]

/-- Checking sorted state lists suffices for the original bit-mask semantics. -/
theorem maskOfList_eq_of_normalized {xs ys : List Nat}
    (h : normalizeStates xs=normalizeStates ys) : maskOfList xs=maskOfList ys := by
  apply Nat.eq_of_testBit_eq
  intro i
  apply Bool.eq_iff_iff.mpr
  rw [maskOfList_mem,maskOfList_mem]
  rw [←mem_normalizeStates i xs,←mem_normalizeStates i ys,h]

#print axioms maskOfList_eq_of_normalized
end BinaryAutomata
