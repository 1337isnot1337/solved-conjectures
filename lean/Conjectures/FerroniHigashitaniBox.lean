import Mathlib.Algebra.BigOperators.Fin
import Mathlib.Data.Fintype.Pi
import Mathlib.Tactic

/-! The integer Cayley boxes in the old lattice. Six base coordinates
encode the homogeneous degree, and each of five groups has `m` shared
coordinates and `2 * m` singleton coordinates. -/

open Finset

namespace FerroniHigashitani

abbrev BoxIndex (m : ℕ) := Fin 5 × Fin m × Fin 3

variable {m : ℕ}

def capacity (b : Fin 6 → ℕ) (c : BoxIndex m) : ℕ :=
  if c.2.2 = 0 then b 0 + b c.1.succ else 2 * b c.1.succ

theorem capacity_add (a b : Fin 6 → ℕ) (c : BoxIndex m) :
    capacity (a + b) c = capacity a c + capacity b c := by
  simp only [capacity, Pi.add_apply]
  split_ifs <;> omega

def baseVertex (j : Fin 6) (i : Fin 6) : ℕ := if i = j then 1 else 0

@[simp] theorem sum_baseVertex (j : Fin 6) : ∑ i, baseVertex j i = 1 := by
  simp [baseVertex]

/-- Points of any homogeneous degree in the old lattice and closed cone. -/
structure OldPoint (m : ℕ) where
  b : Fin 6 → ℕ
  x : BoxIndex m → ℕ
  bounded : ∀ c, x c ≤ capacity b c

def OldPoint.degree (p : OldPoint m) : ℕ := ∑ i, p.b i

private theorem exists_positive_base {p : OldPoint m} (hp : 0 < p.degree) :
    ∃ j, 0 < p.b j := by
  by_contra! h
  have hb (i : Fin 6) : p.b i = 0 := by have := h i; omega
  simp [OldPoint.degree, hb] at hp

/-- Split off a degree-one box point over a positive base coordinate. -/
theorem split_degree_one (p : OldPoint m) (hp : 0 < p.degree) :
    ∃ q r : OldPoint m, q.degree = 1 ∧ r.degree + 1 = p.degree ∧
      q.b + r.b = p.b ∧ q.x + r.x = p.x := by
  obtain ⟨j, hj⟩ := exists_positive_base hp
  let a := baseVertex j
  let b : Fin 6 → ℕ := fun i => p.b i - a i
  have hab : a + b = p.b := by
    funext i
    by_cases hi : i = j
    · subst i
      simp only [Pi.add_apply, b, a, baseVertex, ↓reduceIte]
      omega
    · simp [b, a, baseVertex, hi]
  let x (c : BoxIndex m) := min (p.x c) (capacity a c)
  let y (c : BoxIndex m) := p.x c - x c
  let q : OldPoint m := ⟨a, x, fun c => min_le_right _ _⟩
  let r : OldPoint m := ⟨b, y, fun c => by
    have hc := p.bounded c
    rw [← hab, capacity_add] at hc
    dsimp [y, x]
    omega⟩
  have hdq : q.degree = 1 := sum_baseVertex j
  have hdegree : q.degree + r.degree = p.degree := by
    unfold OldPoint.degree q r
    rw [← sum_add_distrib]
    change ∑ i, (a + b) i = _
    rw [hab]
  refine ⟨q, r, hdq, by omega, hab, ?_⟩
  funext c
  change x c + (p.x c - x c) = p.x c
  have hx : x c ≤ p.x c := min_le_left _ _
  omega

/-- Every old-lattice point is the sum of exactly its degree many degree-one
points, with the sum taken separately on the base and spatial coordinates. -/
theorem oldPoint_idp (p : OldPoint m) :
    ∃ f : Fin p.degree → OldPoint m, (∀ t, (f t).degree = 1) ∧
      (∀ i, ∑ t, (f t).b i = p.b i) ∧ (∀ c, ∑ t, (f t).x c = p.x c) := by
  suffices ∀ (k : ℕ) (q : OldPoint m), q.degree = k →
      ∃ f : Fin k → OldPoint m, (∀ t, (f t).degree = 1) ∧
        (∀ i, ∑ t, (f t).b i = q.b i) ∧ (∀ c, ∑ t, (f t).x c = q.x c) from
    this p.degree p rfl
  intro k
  induction k with
  | zero =>
    intro q hq
    have hb (i : Fin 6) : q.b i = 0 := by
      have hi : q.b i ≤ q.degree := single_le_sum (f := q.b) (fun _ _ => Nat.zero_le _) (mem_univ _)
      omega
    have hx (c : BoxIndex m) : q.x c = 0 := by
      have hc := q.bounded c
      simp [capacity, hb] at hc
      exact hc
    exact ⟨Fin.elim0, fun t => t.elim0, fun i => by simp [hb i], fun c => by simp [hx c]⟩
  | succ k ih =>
    intro q hq
    have hpos : 0 < q.degree := by omega
    obtain ⟨u, v, hu, hv, hb, hx⟩ := split_degree_one q hpos
    obtain ⟨f, hf, hfb, hfx⟩ := ih v (by omega)
    refine ⟨Fin.cons u f, ?_, ?_, ?_⟩
    · intro t
      exact Fin.cases hu hf t
    · intro i
      simpa [Fin.sum_univ_succ, hfb] using congrFun hb i
    · intro c
      simpa [Fin.sum_univ_succ, hfx] using congrFun hx c

end FerroniHigashitani
