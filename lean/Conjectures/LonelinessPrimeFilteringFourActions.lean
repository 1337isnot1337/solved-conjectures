import Conjectures.LonelinessPrimeFilteringFourProfiles
import Mathlib.Logic.Function.Iterate

namespace Loneliness.PrimeFilteringFourProfiles

set_option maxRecDepth 100000
set_option maxHeartbeats 0

def rotate (i : Fin 210) : Fin 210 :=
  ⟨(i.val / 3) * 3 + (i.val % 3 + 1) % 3, by omega⟩

def shift (i : Fin 210) : Fin 210 :=
  ⟨30 * ((i.val / 30 + residue i) % 7) + i.val % 30, by omega⟩

def fractionCell (i : Fin 210) : ℕ := (i.val % 30) / 3

def canonical (i : Fin 210) : Fin 210 := ⟨3 * fractionCell i, by
  unfold fractionCell
  omega⟩

def rotationCount (i : Fin 210) : ℕ := (3 - i.val % 3) % 3
def shiftCount (i : Fin 210) : ℕ := (7 - i.val / 30) % 7

def normalize (pivot i : Fin 210) : Fin 210 :=
  (shift^[shiftCount pivot]) ((rotate^[rotationCount pivot]) i)

theorem normalize_pivot : ∀ i : Fin 210, normalize i i = canonical i := by decide

theorem canonical_value : ∀ i : Fin 210, ∃ f : Fin 10, (canonical i).val = 3 * f.val := by
  intro i
  exact ⟨⟨fractionCell i, by unfold fractionCell; omega⟩, rfl⟩

theorem rotate_accepts : ∀ (i : Fin 210) (j : Fin 5) (k : Fin 7),
    Accepts (rotate i) j k ↔ Accepts i j ⟨2 * k.val % 7, Nat.mod_lt _ (by decide)⟩ := by
  decide

theorem shift_accepts : ∀ (i : Fin 210) (j : Fin 5) (k : Fin 7),
    Accepts (shift i) j k ↔
      Accepts i j ⟨(k.val + j.val + 1) % 7, Nat.mod_lt _ (by decide)⟩ := by
  decide

def GoodFour (a b c d : Fin 210) : Prop :=
  ∃ (j : Fin 5) (k : Fin 7),
    Accepts a j k ∧ Accepts b j k ∧ Accepts c j k ∧ Accepts d j k

theorem goodFour_of_rotate {a b c d : Fin 210}
    (h : GoodFour (rotate a) (rotate b) (rotate c) (rotate d)) : GoodFour a b c d := by
  obtain ⟨j, k, ha, hb, hc, hd⟩ := h
  exact ⟨j, ⟨2 * k.val % 7, Nat.mod_lt _ (by decide)⟩,
    (rotate_accepts a j k).mp ha, (rotate_accepts b j k).mp hb,
    (rotate_accepts c j k).mp hc, (rotate_accepts d j k).mp hd⟩

theorem goodFour_of_shift {a b c d : Fin 210}
    (h : GoodFour (shift a) (shift b) (shift c) (shift d)) : GoodFour a b c d := by
  obtain ⟨j, k, ha, hb, hc, hd⟩ := h
  exact ⟨j, ⟨(k.val + j.val + 1) % 7, Nat.mod_lt _ (by decide)⟩,
    (shift_accepts a j k).mp ha, (shift_accepts b j k).mp hb,
    (shift_accepts c j k).mp hc, (shift_accepts d j k).mp hd⟩

theorem goodFour_of_iterate (f : Fin 210 → Fin 210)
    (hf : ∀ a b c d, GoodFour (f a) (f b) (f c) (f d) → GoodFour a b c d)
    (n : ℕ) (a b c d : Fin 210)
    (h : GoodFour (f^[n] a) (f^[n] b) (f^[n] c) (f^[n] d)) : GoodFour a b c d := by
  induction n with
  | zero => simpa using h
  | succ n ih =>
    apply ih
    apply hf
    simpa only [Function.iterate_succ_apply'] using h

theorem goodFour_of_normalize (pivot a b c d : Fin 210)
    (h : GoodFour (normalize pivot a) (normalize pivot b)
      (normalize pivot c) (normalize pivot d)) : GoodFour a b c d := by
  apply goodFour_of_iterate rotate (fun _ _ _ _ => goodFour_of_rotate) (rotationCount pivot)
  apply goodFour_of_iterate shift (fun _ _ _ _ => goodFour_of_shift) (shiftCount pivot)
  exact h

end Loneliness.PrimeFilteringFourProfiles
