import Mathlib.Data.Fintype.Card
import Mathlib.Data.Finset.Lattice.Fold

/-!
# Finite longest-path levels

The finite longest-path construction used in Step 3 of the accepted proof of
Mazák–Zrubák Conjecture 2. Every positive level has an immediate predecessor
one level below, and every intermediate level is attained. The relation need
not be transitive. Well-foundedness is the only ordering assumption.
-/

namespace CircularCompleteMinusEdge

section Levels

variable {α : Type*} [Fintype α] (R : α → α → Prop) [DecidableRel R]
    (hwf : WellFounded R)

noncomputable def longestLevel : α → ℕ := by
  exact hwf.fix fun x rec =>
    (Finset.univ : Finset {y // R y x}).sup (fun y => rec y.val y.property + 1)

theorem longestLevel_eq (x : α) :
    longestLevel R hwf x =
      (Finset.univ : Finset {y // R y x}).sup (fun y => longestLevel R hwf y.val + 1) := by
  classical
  unfold longestLevel
  rw [WellFounded.fix_eq]

theorem longestLevel_lt {x y : α} (hxy : R x y) :
    longestLevel R hwf x < longestLevel R hwf y := by
  classical
  rw [longestLevel_eq R hwf y]
  exact Nat.lt_of_succ_le (Finset.le_sup (f := fun z : {z // R z y} =>
    longestLevel R hwf z.val + 1) (Finset.mem_univ ⟨x, hxy⟩))

theorem longestLevel_zero_iff (x : α) :
    longestLevel R hwf x = 0 ↔ ∀ y, ¬ R y x := by
  classical
  constructor
  · intro hx y hy
    have := longestLevel_lt R hwf hy
    omega
  · intro hx
    rw [longestLevel_eq]
    apply (Finset.sup_eq_bot_iff _ _).mpr
    intro y _
    exact False.elim (hx y.val y.property)

theorem longestLevel_predecessor {x : α} (hx : 0 < longestLevel R hwf x) :
    ∃ y, R y x ∧ longestLevel R hwf x = longestLevel R hwf y + 1 := by
  classical
  have hn : (Finset.univ : Finset {y // R y x}).Nonempty := by
    by_contra hn
    have hz : longestLevel R hwf x = 0 := (longestLevel_zero_iff R hwf x).mpr (by
      intro y hy
      exact hn ⟨⟨y, hy⟩, Finset.mem_univ _⟩)
    omega
  obtain ⟨y, _, hy⟩ := Finset.exists_mem_eq_sup
    (Finset.univ : Finset {y // R y x}) hn (fun y => longestLevel R hwf y.val + 1)
  exact ⟨y.val, y.property, (longestLevel_eq R hwf x).trans hy⟩

theorem longestLevel_attains_below (x : α) {k : ℕ} (hk : k ≤ longestLevel R hwf x) :
    ∃ y, longestLevel R hwf y = k := by
  induction x using hwf.induction with
  | h x ih =>
    by_cases heq : longestLevel R hwf x = k
    · exact ⟨x, heq⟩
    · obtain ⟨y, hy, hlevel⟩ := longestLevel_predecessor R hwf (by omega :
        0 < longestLevel R hwf x)
      exact ih y hy (by omega)

theorem longestLevel_lt_card (x : α) : longestLevel R hwf x < Fintype.card α := by
  classical
  let f : Fin (longestLevel R hwf x + 1) → α := fun i =>
    (longestLevel_attains_below R hwf x (by omega : i.val ≤ longestLevel R hwf x)).choose
  have hf (i : Fin (longestLevel R hwf x + 1)) : longestLevel R hwf (f i) = i.val :=
    (longestLevel_attains_below R hwf x (by omega : i.val ≤ longestLevel R hwf x)).choose_spec
  have hinj : Function.Injective f := by
    intro i j hij
    apply Fin.ext
    rw [← hf i, ← hf j, hij]
  have hcard := Fintype.card_le_of_injective f hinj
  rw [Fintype.card_fin] at hcard
  omega

include hwf in
theorem exists_source [Nonempty α] : ∃ x, ∀ y, ¬ R y x := by
  obtain ⟨x, hx⟩ := longestLevel_attains_below R hwf (Classical.arbitrary α) (Nat.zero_le _)
  exact ⟨x, (longestLevel_zero_iff R hwf x).mp hx⟩

end Levels

end CircularCompleteMinusEdge
