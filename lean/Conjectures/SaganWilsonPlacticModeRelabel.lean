import Conjectures.SaganWilsonPlacticModeCardinality

/-!
Order-preserving relabeling of the actual plactic centralizer predicate.
This is the first step toward deriving its binomial-polynomial extension
without assuming the hook-content count or evaluating large alphabets.
-/

namespace SaganWilsonPlacticMode

def OrderRelabel (f : Nat → Nat) : Prop :=
  (∀ a b, f a < f b ↔ a < b) ∧ f 1 = 1

theorem relabel_injective {f : Nat → Nat} (hf : OrderRelabel f)
    {a b : Nat} (h : f a = f b) : a = b := by
  by_cases hab : a < b
  · have hh := (hf.1 a b).mpr hab
    omega
  · by_cases hba : b < a
    · have hh := (hf.1 b a).mpr hba
      omega
    · omega

theorem relabel_eq_one {f : Nat → Nat} (hf : OrderRelabel f) (a : Nat) :
    f a = 1 ↔ a = 1 := by
  constructor
  · intro h
    exact relabel_injective hf (h.trans hf.2.symm)
  · intro h
    rw [h, hf.2]

theorem insertRow_map_relabel (f : Nat → Nat) (hf : OrderRelabel f)
    (x : Nat) (r : List Nat) :
    insertRow (f x) (r.map f) =
      (((insertRow x r).1).map f, ((insertRow x r).2).map f) := by
  induction r with
  | nil => rfl
  | cons y ys ih =>
    by_cases hxy : x < y
    · have hh := (hf.1 x y).mpr hxy
      simp [insertRow, hxy, hh]
    · have hh : ¬ f x < f y := fun h => hxy ((hf.1 x y).mp h)
      cases he : insertRow x ys with
      | mk rr b =>
        rw [he] at ih
        simp [insertRow, hxy, hh, he, ih]

theorem next_map_relabel (f : Nat → Nat) (hf : OrderRelabel f)
    (x : Nat) (r : List Nat) :
    next (f x) (r.map f) = (next x r).map f := by
  by_cases hx : x = 1
  · subst x
    rw [hf.2]
    cases r <;> rfl
  · have hfx : ¬ f x = 1 := fun h => hx ((relabel_eq_one hf x).mp h)
    simp only [next, ite_eq_right hx, ite_eq_right hfx]
    rw [insertRow_map_relabel f hf]

theorem run_map_relabel (f : Nat → Nat) (hf : OrderRelabel f)
    (r w : List Nat) :
    run (r.map f) (w.map f) = (run r w).map f := by
  induction w generalizing r with
  | nil => rfl
  | cons x xs ih =>
    simp only [List.map_cons, run]
    rw [next_map_relabel f hf, ih]

theorem run_empty_map_relabel (f : Nat → Nat) (hf : OrderRelabel f)
    (w : List Nat) :
    run [] (w.map f) = [] ↔ run [] w = [] := by
  have h := run_map_relabel f hf [] w
  change run [] (w.map f) = (run [] w).map f at h
  rw [h]
  cases run [] w <;> simp

theorem centralizes_map_relabel (f : Nat → Nat) (hf : OrderRelabel f)
    (w : List Nat) (hp : ∀ x ∈ w, 1 ≤ x) :
    CentralizesOne (w.map f) ↔ CentralizesOne w := by
  have hpos : ∀ y ∈ w.map f, 1 ≤ y := by
    intro y hy
    rcases List.mem_map.mp hy with ⟨x, hx, rfl⟩
    by_cases h : x = 1
    · rw [h, hf.2]
      exact Nat.le_refl 1
    · have hlt : 1 < x := by have hh := hp x hx; omega
      have hh := (hf.1 1 x).mpr hlt
      rw [hf.2] at hh
      omega
  rw [centralizes_iff_empty_state _ hpos, centralizes_iff_empty_state w hp,
      run_empty_map_relabel f hf]

def skipLetter (p x : Nat) : Nat := if x < p then x else x+1

theorem skipLetter_relabel (p : Nat) (hp : 2 ≤ p) :
    OrderRelabel (skipLetter p) := by
  constructor
  · intro a b
    by_cases ha : a < p <;> by_cases hb : b < p <;>
      simp [skipLetter, ha, hb] <;> omega
  · simp [skipLetter, show 1 < p by omega]

theorem skipLetter_fixed (p x : Nat) (hx : x < p) : skipLetter p x = x := by
  simp [skipLetter, hx]

theorem skipLetter_avoids (p x : Nat) : skipLetter p x ≠ p := by
  by_cases hx : x < p <;> simp [skipLetter, hx] <;> omega

theorem fixed_letter_mem_map {f : Nat → Nat} (hf : OrderRelabel f)
    (j : Nat) (hj : f j = j) (w : List Nat) :
    j ∈ w.map f ↔ j ∈ w := by
  constructor
  · intro hm
    rcases List.mem_map.mp hm with ⟨x, hx, he⟩
    have hh := relabel_injective hf (he.trans hj.symm)
    subst x
    exact hx
  · intro hm
    exact List.mem_map.mpr ⟨j, hm, hj⟩

end SaganWilsonPlacticMode
