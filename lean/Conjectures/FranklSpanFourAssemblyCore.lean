module

public import Conjectures.FranklCyclicGenerators
public import Conjectures.FranklCyclicRankList
public import Mathlib.Data.Fin.Tuple.Basic

/-! Apply finite list rank certificates to the literal residue-coordinate
windows used by the span-four generator construction. -/
@[expose] public section

namespace FranklSpanFour.Assembly

open FranklCyclic

abbrev Letter := Finset (Fin 4)
abbrev Word (k : ℕ) := Fin k → Letter

def edge {k : ℕ} (v : Word (k + 1)) : Word k × Word k :=
  (wordPrefix v, wordSuffix v)

/-- Recover a seven-letter window from its two overlapping six-letter ends. -/
def sevenOfEdge (e : Word 6 × Word 6) : Word 7 :=
  Fin.snoc e.1 (e.2 ⟨5, by decide⟩)

@[simp] theorem sevenOfEdge_edge (v : Word 7) : sevenOfEdge (edge v) = v := by
  funext i
  refine Fin.lastCases ?_ (fun j => ?_) i
  · simp only [sevenOfEdge, edge, Fin.snoc_last, wordSuffix]
    rfl
  · simp only [sevenOfEdge, edge, Fin.snoc_castSucc, wordPrefix]

@[simp] theorem prefix_windowSchedule {n : ℕ}
    (word : ZMod n → Letter) (start : ZMod n) (w : ℕ) :
    wordPrefix (windowSchedule word start (w + 1)) =
      windowSchedule word start w := rfl

@[simp] theorem suffix_windowSchedule {n : ℕ}
    (word : ZMod n → Letter) (start : ZMod n) (w : ℕ) :
    wordSuffix (windowSchedule word start (w + 1)) =
      windowSchedule word (start + 1) w := by
  funext j
  change word (start + ((j.val + 1 : ℕ) : ZMod n)) =
    word ((start + 1) + (j.val : ZMod n))
  congr 1
  simp only [Nat.cast_add, Nat.cast_one]
  ac_rfl

/-- Every literal window on a positive cycle is an edge of a closed walk.
A checked finite rank list therefore keeps each such edge. -/
theorem checked_cyclic_windows {n : ℕ} [NeZero n]
    (word : ZMod n → Letter) (w : ℕ)
    (windows : List (Word (w + 4)))
    (keep : Word (w + 3) × Word (w + 3) → Bool)
    (rank : Word (w + 3) → ℕ)
    (hc : rankListCheck (windows.map edge) keep rank = true)
    (hwalk : ∀ start, windowSchedule word start (w + 1) ∈ windows) :
    ∀ start, keep (edge (windowSchedule word start (w + 1))) = true := by
  let walk (i : ℕ) := windowSchedule word (i : ZMod n) w
  have hclose : walk n = walk 0 := by
    simp only [walk, ZMod.natCast_self, Nat.cast_zero]
  have hstep (i : ℕ) :
      (walk i, walk (i + 1)) = edge (windowSchedule word (i : ZMod n) (w + 1)) := by
    simp only [edge, prefix_windowSchedule, suffix_windowSchedule, walk,
      Nat.cast_add, Nat.cast_one]
  have hwalk' : ∀ i < n, (walk i, walk (i + 1)) ∈ windows.map edge := by
    intro i _
    rw [hstep]
    exact List.mem_map.mpr ⟨windowSchedule word (i : ZMod n) (w + 1),
      hwalk (i : ZMod n), rfl⟩
  have hkeep := checked_list_closed_walk_edges hc walk n hclose hwalk'
  intro start
  have h := hkeep start.val start.val_lt
  rw [hstep, ZMod.natCast_zmod_val] at h
  exact h

theorem checked_seven_windows_mem {n : ℕ} [NeZero n]
    (word : ZMod n → Letter) (windows kept : List (Word 7))
    (rank : Word 6 → ℕ)
    (hc : rankListCheck (windows.map edge)
      (fun e => decide (sevenOfEdge e ∈ kept)) rank = true)
    (hwalk : ∀ start, windowSchedule word start 4 ∈ windows) :
    ∀ start, windowSchedule word start 4 ∈ kept := by
  intro start
  have h := checked_cyclic_windows word 3 windows
    (fun e => decide (sevenOfEdge e ∈ kept)) rank hc hwalk start
  simpa only [sevenOfEdge_edge] using of_decide_eq_true h

/-- The final finite rank list excludes every nonzero cyclic schedule. -/
theorem zero_of_checked_eight_windows {n : ℕ} [NeZero n]
    (word : ZMod n → Letter) (windows : List (Word 8))
    (rank : Word 7 → ℕ)
    (hc : rankListCheck (windows.map edge)
      (fun e => decide (e = ((fun _ => ∅), (fun _ => ∅)))) rank = true)
    (hwalk : ∀ start, windowSchedule word start 5 ∈ windows) :
    ∀ start, word start = ∅ := by
  intro start
  have h := checked_cyclic_windows word 4 windows
    (fun e => decide (e = ((fun _ => ∅), (fun _ => ∅)))) rank hc hwalk start
  have he := of_decide_eq_true h
  have hfirst := congrArg Prod.fst he
  have hzero := congrFun hfirst ⟨0, by decide⟩
  simpa [edge, wordPrefix, windowSchedule, rawPosition] using hzero

end FranklSpanFour.Assembly
