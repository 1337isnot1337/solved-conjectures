import Conjectures.CircularIndexReal
import Mathlib.Algebra.Order.Floor.Semiring
import Mathlib.Data.Fintype.Card

/-!
# Acyclic colorings below an integer radius

This is the direction of Guichard's criterion used in Step 1 of
`results/circular-index-complete-minus-edge/PROOF.md` (proof by @aadrianvv),
for Mazák and Zrubák's Conjecture 2 in arXiv:2603.08822v1.

The source sums real color differences around a directed cycle. Here the same
inequality is recorded by the strictly increasing potential `n*c - r*floor c`.
This proves well-foundedness on the actual finite edge type without assuming
rational attainment or an acyclicity oracle.
-/

namespace CircularCompleteMinusEdge

open CircularIndex

def Incident {V : Type*} {G : SimpleGraph V} (e f : G.edgeSet) : Prop :=
  ∃ v : V, v ∈ e.val ∧ v ∈ f.val

theorem incident_symm {V : Type*} {G : SimpleGraph V} {e f : G.edgeSet}
    (h : Incident e f) : Incident f e := by
  rcases h with ⟨v, he, hf⟩
  exact ⟨v, hf, he⟩

structure ProperColoring {V : Type*} (G : SimpleGraph V) (n : ℕ) where
  color : G.edgeSet → Fin n
  proper : ∀ e f, e ≠ f → Incident e f → color e ≠ color f

def ProperColoring.Arc {V : Type*} {G : SimpleGraph V} {n : ℕ}
    (C : ProperColoring G n) (e f : G.edgeSet) : Prop :=
  e ≠ f ∧ Incident e f ∧ (C.color f).val = ((C.color e).val + 1) % n

noncomputable def floorColoring {V : Type*} {G : SimpleGraph V} {r : ℝ}
    (C : RealCircularEdgeColoring G r) {n : ℕ} (hr : r < n) : ProperColoring G n where
  color e := ⟨⌊C.colors e⌋₊, (Nat.floor_lt (C.nonneg e)).mpr ((C.lt_radius e).trans hr)⟩
  proper e f hef hinc heq := by
    have heq' : ⌊C.colors e⌋₊ = ⌊C.colors f⌋₊ := congrArg Fin.val heq
    have he₁ := Nat.floor_le (C.nonneg e)
    have he₂ := Nat.lt_floor_add_one (C.colors e)
    have hf₁ := Nat.floor_le (C.nonneg f)
    have hf₂ := Nat.lt_floor_add_one (C.colors f)
    have habs : |C.colors f - C.colors e| < 1 := by
      rw [abs_lt]
      rw [heq'] at he₁ he₂
      constructor <;> linarith
    exact (not_lt_of_ge (C.separated e f hef hinc).1) habs

noncomputable def colorPotential {V : Type*} {G : SimpleGraph V} {r : ℝ}
    (C : RealCircularEdgeColoring G r) (n : ℕ) (e : G.edgeSet) : ℝ :=
  n * C.colors e - r * (⌊C.colors e⌋₊ : ℝ)

theorem colorPotential_strict_on_arc {V : Type*} {G : SimpleGraph V} {r : ℝ}
    (C : RealCircularEdgeColoring G r) {n : ℕ} (hn : 2 ≤ n) (hr : r < n)
    {e f : G.edgeSet} (h : (floorColoring C hr).Arc e f) :
    colorPotential C n e < colorPotential C n f := by
  rcases h with ⟨hef, hinc, hnext⟩
  change ⌊C.colors f⌋₊ = (⌊C.colors e⌋₊ + 1) % n at hnext
  have he_lt : ⌊C.colors e⌋₊ < n := (floorColoring C hr).color e |>.isLt
  have he₁ := Nat.floor_le (C.nonneg e)
  have he₂ := Nat.lt_floor_add_one (C.colors e)
  have hf₁ := Nat.floor_le (C.nonneg f)
  have hf₂ := Nat.lt_floor_add_one (C.colors f)
  have hsep := C.separated e f hef hinc
  have hnpos : (0 : ℝ) < n := by exact_mod_cast (show 0 < n by omega)
  dsimp only [colorPotential]
  by_cases hwrap : ⌊C.colors e⌋₊ + 1 = n
  · have hfzero : ⌊C.colors f⌋₊ = 0 := by simpa [hwrap] using hnext
    have hcast : (⌊C.colors e⌋₊ : ℝ) + 1 = n := by exact_mod_cast hwrap
    have hdiff : 1 - r ≤ C.colors f - C.colors e := by
      have := neg_abs_le (C.colors f - C.colors e)
      linarith [hsep.2]
    rw [hfzero, Nat.cast_zero, mul_zero]
    have hmul := mul_le_mul_of_nonneg_left hdiff hnpos.le
    nlinarith
  · have hlt : ⌊C.colors e⌋₊ + 1 < n := by omega
    rw [Nat.mod_eq_of_lt hlt] at hnext
    have hcast : (⌊C.colors f⌋₊ : ℝ) = (⌊C.colors e⌋₊ : ℝ) + 1 := by
      exact_mod_cast hnext
    have hdiff : 1 ≤ C.colors f - C.colors e := by
      have hpos : 0 ≤ C.colors f - C.colors e := by linarith
      simpa only [abs_of_nonneg hpos] using hsep.1
    have hmul := mul_le_mul_of_nonneg_left hdiff hnpos.le
    nlinarith

theorem wellFounded_of_finite_potential {α : Type*} [Finite α]
    (R : α → α → Prop) (p : α → ℝ) (hp : ∀ a b, R a b → p a < p b) :
    WellFounded R := by
  let S : α → α → Prop := fun a b => p a < p b
  let : IsTrans α S := ⟨fun _ _ _ hab hbc => lt_trans hab hbc⟩
  let : Std.Irrefl S := ⟨fun _ => lt_irrefl _⟩
  exact Subrelation.wf (fun {a b} h => hp a b h)
    (Finite.wellFounded_of_trans_of_irrefl S)

theorem floorColoring_wellFounded {V : Type*} {G : SimpleGraph V}
    [Finite G.edgeSet] {r : ℝ} (C : RealCircularEdgeColoring G r)
    {n : ℕ} (hn : 2 ≤ n) (hr : r < n) :
    WellFounded (floorColoring C hr).Arc :=
  wellFounded_of_finite_potential _ (colorPotential C n)
    (fun _ _ => colorPotential_strict_on_arc C hn hr)

end CircularCompleteMinusEdge
