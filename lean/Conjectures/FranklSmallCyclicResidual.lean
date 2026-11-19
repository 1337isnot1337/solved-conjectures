module

public import Mathlib.Data.ZMod.Basic
public import Mathlib.Data.Finset.Basic
public import Mathlib.Data.List.OfFn

/-! Short-period consequences of the 35-edge residual graph. These theorems
consume explicit residual-edge membership; graph exhaustion is a separate
certificate. Positions are literal residues modulo the cycle length. -/
@[expose] public section

namespace FranklSmallCyclic

open scoped Fin.NatCast

def residualEdges : Finset (List ℕ) :=
  {[0, 0, 0, 0, 0, 0, 0],
   [0, 4, 2, 0, 4, 2, 0],
   [0, 4, 2, 0, 4, 10, 0],
   [0, 4, 2, 0, 12, 2, 0],
   [0, 4, 10, 0, 4, 2, 0],
   [0, 4, 10, 0, 4, 10, 0],
   [0, 12, 2, 0, 4, 2, 0],
   [0, 12, 2, 0, 4, 10, 0],
   [0, 12, 2, 0, 12, 2, 0],
   [2, 0, 4, 2, 0, 4, 2],
   [2, 0, 4, 2, 0, 4, 10],
   [2, 0, 4, 2, 0, 12, 2],
   [2, 0, 4, 10, 0, 4, 2],
   [2, 0, 4, 10, 0, 4, 10],
   [2, 0, 12, 2, 0, 4, 2],
   [2, 0, 12, 2, 0, 4, 10],
   [2, 0, 12, 2, 0, 12, 2],
   [4, 2, 0, 4, 2, 0, 4],
   [4, 2, 0, 4, 2, 0, 12],
   [4, 2, 0, 4, 10, 0, 4],
   [4, 2, 0, 12, 2, 0, 4],
   [4, 2, 0, 12, 2, 0, 12],
   [4, 10, 0, 4, 2, 0, 4],
   [4, 10, 0, 4, 2, 0, 12],
   [4, 10, 0, 4, 10, 0, 4],
   [10, 0, 4, 2, 0, 4, 2],
   [10, 0, 4, 2, 0, 4, 10],
   [10, 0, 4, 2, 0, 12, 2],
   [10, 0, 4, 10, 0, 4, 2],
   [10, 0, 4, 10, 0, 4, 10],
   [12, 2, 0, 4, 2, 0, 4],
   [12, 2, 0, 4, 2, 0, 12],
   [12, 2, 0, 4, 10, 0, 4],
   [12, 2, 0, 12, 2, 0, 4],
   [12, 2, 0, 12, 2, 0, 12]}

theorem residual_edge_facts : ∀ e ∈ residualEdges,
    (e.getD 0 0 = 0 ↔ e.getD 3 0 = 0) ∧
      (e.getD 0 0 = 0 ∨ e.getD 1 0 = 0 ∨ e.getD 2 0 = 0) := by
  decide +kernel

variable {n : ℕ}

def residualWindow (word : ZMod n → ℕ) (q : ZMod n) : List ℕ :=
  List.ofFn (fun i : Fin 7 => word (q + (i.val : ZMod n)))

theorem residualWindow_getD (word : ZMod n → ℕ) (q : ZMod n) (i : ℕ)
    (hi : i < 7) :
    (residualWindow word q).getD i 0 = word (q + (i : ZMod n)) := by
  simp only [residualWindow, List.getD_eq_getElem?_getD, List.getElem?_ofFn,
    dite_eq_left hi, Option.getD_some]

/-- Invariance under three steps propagates through every multiple of three. -/
theorem three_step_iter {P : ZMod n → Prop}
    (hp : ∀ q, P (q + 3) ↔ P q) (q : ZMod n) (k : ℕ) :
    P (q + ((3 * k : ℕ) : ZMod n)) ↔ P q := by
  induction k with
  | zero => simp
  | succ k ih =>
      rw [Nat.mul_succ, Nat.cast_add, ← add_assoc]
      exact (hp _).trans ih

theorem all_of_three_step {P : ZMod n → Prop}
    (hs : ∀ q : ZMod n, ∃ k : Fin n, ((3 * k.val : ℕ) : ZMod n) = q)
    (hp : ∀ q, P (q + 3) ↔ P q) (hex : ∃ q, P q) : ∀ q, P q := by
  have heq : ∀ q, P q ↔ P 0 := by
    intro q
    obtain ⟨k, hk⟩ := hs q
    have h := three_step_iter hp (0 : ZMod n) k.val
    simpa only [zero_add, hk] using h
  obtain ⟨q, hq⟩ := hex
  intro r
  exact (heq r).mpr ((heq q).mp hq)

theorem residual_zero_step (word : ZMod n → ℕ)
    (hw : ∀ q, residualWindow word q ∈ residualEdges) :
    ∀ q, word (q + 3) = 0 ↔ word q = 0 := by
  intro q
  have h := (residual_edge_facts _ (hw q)).1.symm
  simpa only [residualWindow_getD word q 0 (by decide),
    residualWindow_getD word q 3 (by decide), Nat.cast_zero, Nat.cast_ofNat, add_zero]
    using h

theorem residual_some_zero (word : ZMod n → ℕ)
    (hw : ∀ q, residualWindow word q ∈ residualEdges) : ∃ q, word q = 0 := by
  have h := (residual_edge_facts _ (hw 0)).2
  have h' : word 0 = 0 ∨ word (1 : ZMod n) = 0 ∨ word (2 : ZMod n) = 0 := by
    simpa only [residualWindow_getD word 0 0 (by decide),
      residualWindow_getD word 0 1 (by decide), residualWindow_getD word 0 2 (by decide),
      Nat.cast_zero, Nat.cast_one, Nat.cast_ofNat, zero_add] using h
  rcases h' with h0 | h1 | h2
  · exact ⟨0, h0⟩
  · exact ⟨1, h1⟩
  · exact ⟨2, h2⟩

theorem residual_all_zero (word : ZMod n → ℕ)
    (hs : ∀ q : ZMod n, ∃ k : Fin n, ((3 * k.val : ℕ) : ZMod n) = q)
    (hw : ∀ q, residualWindow word q ∈ residualEdges) : ∀ q, word q = 0 :=
  all_of_three_step hs (residual_zero_step word hw) (residual_some_zero word hw)

theorem residual_period_seven (word : ZMod 7 → ℕ)
    (hw : ∀ q, residualWindow word q ∈ residualEdges) : ∀ q, word q = 0 :=
  residual_all_zero word (by decide +kernel) hw

theorem residual_period_eight (word : ZMod 8 → ℕ)
    (hw : ∀ q, residualWindow word q ∈ residualEdges) : ∀ q, word q = 0 :=
  residual_all_zero word (by decide +kernel) hw

theorem residual_period_ten (word : ZMod 10 → ℕ)
    (hw : ∀ q, residualWindow word q ∈ residualEdges) : ∀ q, word q = 0 :=
  residual_all_zero word (by decide +kernel) hw

end FranklSmallCyclic
