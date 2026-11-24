module

public import Mathlib.Data.List.Basic
public import Mathlib.Data.List.Perm.Basic
public import Init.Data.List.SplitOn.Lemmas

/-!
# Gessel–Zhuang conjecture

Literal nonempty blocks separated by internal gaps. The three insertion
operations and the delete-maximum inverse are functions on actual words.
-/

@[expose] public section

namespace GesselZhuang

abbrev Blocks := List (List ℕ)

def NonemptyBlocks (B : Blocks) : Prop := ∀ b ∈ B, b ≠ []

def Avoids (x : ℕ) (B : Blocks) : Prop := x ∉ B.flatten

def upBlocks (B : Blocks) (i x : ℕ) : Blocks :=
  B.take i ++ [[x]] ++ B.drop i

def flatBlocks (B : Blocks) (i x : ℕ) (prepend : Bool) : Blocks :=
  B.take i ++ [if prepend then x :: (B[i]?.getD []) else (B[i]?.getD []) ++ [x]] ++
    B.drop (i + 1)

def downBlocks (B : Blocks) (i x : ℕ) : Blocks :=
  B.take i ++ [(B[i]?.getD []) ++ x :: (B[i + 1]?.getD [])] ++ B.drop (i + 2)

/-- Delete a value and turn its position into a gap, suppressing empty exterior pieces. -/
def eraseBlocks (B : Blocks) (x : ℕ) : Blocks :=
  B.flatMap fun b => (b.splitOn x).filter (fun c => decide (c ≠ []))

/-- Index of the block containing a specified value. -/
def blockIndex (x : ℕ) : Blocks → ℕ
  | [] => 0
  | b :: B => if x ∈ b then 0 else blockIndex x B + 1

theorem nonemptyBlocks_append {A B : Blocks} :
    NonemptyBlocks (A ++ B) ↔ NonemptyBlocks A ∧ NonemptyBlocks B := by
  simp [NonemptyBlocks, List.mem_append, or_imp, forall_and]

theorem avoids_append {x : ℕ} {A B : Blocks} :
    Avoids x (A ++ B) ↔ Avoids x A ∧ Avoids x B := by
  simp [Avoids]

theorem avoids_iff {x : ℕ} {B : Blocks} :
    Avoids x B ↔ ∀ b ∈ B, x ∉ b := by
  simp [Avoids, List.mem_flatten]

theorem upBlocks_append (A B : Blocks) (x : ℕ) :
    upBlocks (A ++ B) A.length x = A ++ [[x]] ++ B := by
  simp [upBlocks]

theorem flatBlocks_append (A B : Blocks) (b : List ℕ) (x : ℕ) (e : Bool) :
    flatBlocks (A ++ b :: B) A.length x e =
      A ++ [if e then x :: b else b ++ [x]] ++ B := by
  simp [flatBlocks]

theorem downBlocks_append (A B : Blocks) (b c : List ℕ) (x : ℕ) :
    downBlocks (A ++ b :: c :: B) A.length x = A ++ [b ++ x :: c] ++ B := by
  simp [downBlocks]

theorem splitOn_once {x : ℕ} {a b : List ℕ} (ha : x ∉ a) (hb : x ∉ b) :
    (a ++ x :: b).splitOn x = [a, b] := by
  rw [List.splitOn_append_cons_self, List.splitOn_eq_singleton ha,
    List.splitOn_eq_singleton hb]
  rfl

theorem eraseBlocks_append (A B : Blocks) (x : ℕ) :
    eraseBlocks (A ++ B) x = eraseBlocks A x ++ eraseBlocks B x := by
  simp [eraseBlocks]

theorem eraseBlocks_of_avoids {B : Blocks} {x : ℕ}
    (hne : NonemptyBlocks B) (hx : Avoids x B) : eraseBlocks B x = B := by
  induction B with
  | nil => rfl
  | cons b B ih =>
    have hb : b ≠ [] := hne b (by simp)
    have hB : NonemptyBlocks B := fun c hc => hne c (by simp [hc])
    have hxb : x ∉ b := (avoids_iff.mp hx) b (by simp)
    have hxB : Avoids x B := avoids_iff.mpr fun c hc => (avoids_iff.mp hx) c (by simp [hc])
    change (b.splitOn x).filter (fun c => decide (c ≠ [])) ++ eraseBlocks B x = b :: B
    rw [List.splitOn_eq_singleton hxb, ih hB hxB]
    simp [hb]

theorem eraseBlocks_up {A B : Blocks} {x : ℕ}
    (hA : NonemptyBlocks A) (hB : NonemptyBlocks B)
    (hxA : Avoids x A) (hxB : Avoids x B) :
    eraseBlocks (A ++ [[x]] ++ B) x = A ++ B := by
  rw [eraseBlocks_append, eraseBlocks_append,
    eraseBlocks_of_avoids hA hxA, eraseBlocks_of_avoids hB hxB]
  simp [eraseBlocks, List.splitOn_cons_eq_ite_modifyHead]

theorem eraseBlocks_flat_left {A B : Blocks} {b : List ℕ} {x : ℕ}
    (hA : NonemptyBlocks A) (hB : NonemptyBlocks B) (hb : b ≠ [])
    (hxA : Avoids x A) (hxB : Avoids x B) (hxb : x ∉ b) :
    eraseBlocks (A ++ [x :: b] ++ B) x = A ++ [b] ++ B := by
  rw [eraseBlocks_append, eraseBlocks_append,
    eraseBlocks_of_avoids hA hxA, eraseBlocks_of_avoids hB hxB]
  have hs : (x :: b).splitOn x = [[], b] :=
    splitOn_once (a := []) (by simp) hxb
  simp [eraseBlocks, hs, hb]

theorem eraseBlocks_flat_right {A B : Blocks} {b : List ℕ} {x : ℕ}
    (hA : NonemptyBlocks A) (hB : NonemptyBlocks B) (hb : b ≠ [])
    (hxA : Avoids x A) (hxB : Avoids x B) (hxb : x ∉ b) :
    eraseBlocks (A ++ [b ++ [x]] ++ B) x = A ++ [b] ++ B := by
  rw [eraseBlocks_append, eraseBlocks_append,
    eraseBlocks_of_avoids hA hxA, eraseBlocks_of_avoids hB hxB]
  have hs : (b ++ [x]).splitOn x = [b, []] := splitOn_once hxb (by simp)
  simp [eraseBlocks, hs, hb]

theorem eraseBlocks_down {A B : Blocks} {b c : List ℕ} {x : ℕ}
    (hA : NonemptyBlocks A) (hB : NonemptyBlocks B) (hb : b ≠ []) (hc : c ≠ [])
    (hxA : Avoids x A) (hxB : Avoids x B) (hxb : x ∉ b) (hxc : x ∉ c) :
    eraseBlocks (A ++ [b ++ x :: c] ++ B) x = A ++ [b, c] ++ B := by
  rw [eraseBlocks_append, eraseBlocks_append,
    eraseBlocks_of_avoids hA hxA, eraseBlocks_of_avoids hB hxB]
  simp [eraseBlocks, splitOn_once hxb hxc, hb, hc]

theorem blockIndex_append {A B : Blocks} {b : List ℕ} {x : ℕ}
    (hA : Avoids x A) (hb : x ∈ b) : blockIndex x (A ++ b :: B) = A.length := by
  induction A with
  | nil => simp [blockIndex, hb]
  | cons a A ih =>
    have hxa : x ∉ a := (avoids_iff.mp hA) a (by simp)
    have hxA : Avoids x A := avoids_iff.mpr fun c hc => (avoids_iff.mp hA) c (by simp [hc])
    simp [blockIndex, hxa, ih hxA]

end GesselZhuang
