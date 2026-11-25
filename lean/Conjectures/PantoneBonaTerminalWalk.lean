import Mathlib.Data.Fin.Basic
import Mathlib.Tactic

/-! Deleting a block from a strict tableau-chamber walk. -/

namespace PantoneBonaTerminal

/-- Coordinate choices after removing a block of length `g` at time `p`. -/
def deleteBlock {β : Type*} (w : List β) (p g : ℕ) : List β :=
  w.take p ++ w.drop (p + g)

/-- Adjacent coordinates stay strictly ordered at every prefix, starting
with distance `h` between adjacent coordinates. -/
def Survives {d : ℕ} (w : List (Fin (d + 1))) (h : ℕ) : Prop :=
  ∀ t ≤ w.length, ∀ i : Fin d,
    (w.take t).count i.succ < (w.take t).count i.castSucc + h

theorem deleteBlock_length {β : Type*} (w : List β) {p g : ℕ} (hp : p + g ≤ w.length) :
    (deleteBlock w p g).length = w.length - g := by
  simp only [deleteBlock, List.length_append, List.length_take_of_le (by omega : p ≤ w.length),
    List.length_drop]
  omega

theorem count_take_deleteBlock {β : Type*} [BEq β] (w : List β)
    {p g t : ℕ} (hp : p ≤ w.length) (ht : p ≤ t) (i : β) :
    (w.take (t + g)).count i =
      ((deleteBlock w p g).take t).count i + ((w.drop p).take g).count i := by
  have hprefix : (w.take p).length = p := List.length_take_of_le hp
  have hs : (deleteBlock w p g).take t = w.take p ++ (w.drop (p + g)).take (t - p) := by
    rw [deleteBlock, List.take_append, hprefix, List.take_of_length_le (by omega)]
  rw [hs, show t + g = p + (g + (t - p)) by omega, List.take_add, List.take_add, List.drop_drop]
  simp only [List.count_append]
  omega

/-- Deleting any contiguous block of length `g` preserves survival when
each initial neighboring gap is widened by `g`. -/
theorem survives_deleteBlock {d : ℕ} {w : List (Fin (d + 1))} {h p g : ℕ}
    (hw : Survives w h) (hp : p + g ≤ w.length) : Survives (deleteBlock w p g) (h + g) := by
  intro t ht i
  have htmax : t + g ≤ w.length := by
    rw [deleteBlock_length w hp] at ht
    omega
  by_cases htp : t < p
  · have he : (deleteBlock w p g).take t = w.take t := by
      rw [deleteBlock, List.take_append_of_le_length, List.take_take, Nat.min_eq_left htp.le]
      rw [List.length_take_of_le (by omega : p ≤ w.length)]
      exact htp.le
    rw [he]
    have hstrict := hw t (by omega) i
    omega
  · have hs := hw (t + g) htmax i
    rw [count_take_deleteBlock w (by omega : p ≤ w.length) (by omega : p ≤ t),
      count_take_deleteBlock w (by omega : p ≤ w.length) (by omega : p ≤ t)] at hs
    have hb : ((w.drop p).take g).count i.castSucc ≤ g :=
      (List.count_le_length).trans (List.length_take_le _ _)
    omega

end PantoneBonaTerminal
