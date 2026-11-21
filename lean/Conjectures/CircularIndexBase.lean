import Std

/-!
# The base matchings for the upper-half circulant family

These definitions are the two base edge classes in Section 2.3 of
`results/circular-index-upper-half-circulants/PROOF.md`.  All bounds below
hold for every `g ≥ 2`; there is no finite parameter cutoff.

This module proves the arithmetic properties of the base classes.  Circular
edge coloring, its optimality, and vertex connectivity are separate obligations.
-/

namespace CircularIndex

def order (g : Nat) : Nat := 6 * g + 1

def BaseVertex (g ε x : Nat) : Prop :=
  x = ε ∨ (2 * g + 2 ≤ x ∧ x ≤ 4 * g)

def baseLeft (g ε j : Nat) : Nat :=
  if j = 0 then ε else 2 * g + 1 + j

def baseRight (g ε j : Nat) : Nat :=
  if j = 0 then (if ε = 0 then 4 * g else 3 * g + 1)
  else 4 * g + ε - j

def baseLength (g ε j : Nat) : Nat :=
  if j = 0 then (if ε = 0 then 2 * g + 1 else 3 * g)
  else 2 * g + ε - 1 - 2 * j

def AllowedLength (g s : Nat) : Prop :=
  (1 ≤ s ∧ s ≤ 2 * g - 2) ∨ s = 2 * g + 1 ∨ s = 3 * g

theorem baseLeft_mem (g ε j : Nat) (hg : 2 ≤ g) (hε : ε ≤ 1) (hj : j < g) :
    BaseVertex g ε (baseLeft g ε j) := by
  simp only [BaseVertex, baseLeft]
  repeat' split <;> omega

theorem baseRight_mem (g ε j : Nat) (hg : 2 ≤ g) (hε : ε ≤ 1) (hj : j < g) :
    BaseVertex g ε (baseRight g ε j) := by
  by_cases hj0 : j = 0 <;> by_cases he : ε = 0 <;>
    simp_all [BaseVertex, baseRight] <;> omega

theorem baseVertex_lt_order (g ε x : Nat) (hg : 2 ≤ g) (hε : ε ≤ 1)
    (hx : BaseVertex g ε x) : x < order g := by
  simp only [BaseVertex, order] at *
  omega

theorem baseLeft_injective (g ε j k : Nat) (_hg : 2 ≤ g) (hε : ε ≤ 1)
    (hj : j < g) (hk : k < g) (h : baseLeft g ε j = baseLeft g ε k) : j = k := by
  by_cases hj0 : j = 0 <;> by_cases hk0 : k = 0 <;>
    simp_all [baseLeft] <;> omega

theorem baseRight_injective (g ε j k : Nat) (hg : 2 ≤ g) (hε : ε ≤ 1)
    (hj : j < g) (hk : k < g) (h : baseRight g ε j = baseRight g ε k) : j = k := by
  by_cases hj0 : j = 0 <;> by_cases hk0 : k = 0 <;> by_cases he : ε = 0 <;>
    simp_all [baseRight] <;> omega

theorem baseLeft_ne_baseRight (g ε j k : Nat) (hg : 2 ≤ g) (hε : ε ≤ 1)
    (hj : j < g) (hk : k < g) : baseLeft g ε j ≠ baseRight g ε k := by
  by_cases hj0 : j = 0 <;> by_cases hk0 : k = 0 <;> by_cases he : ε = 0 <;>
    simp_all [baseLeft, baseRight] <;> omega

theorem base_endpoints_distinct (g ε j : Nat) (hg : 2 ≤ g) (hε : ε ≤ 1)
    (hj : j < g) : baseLeft g ε j ≠ baseRight g ε j :=
  baseLeft_ne_baseRight g ε j j hg hε hj hj

def baseEndpoint (g ε j : Nat) (side : Bool) : Nat :=
  if side then baseRight g ε j else baseLeft g ε j

theorem baseEndpoint_injective (g ε : Nat) (hg : 2 ≤ g) (hε : ε ≤ 1) :
    Function.Injective (fun a : Fin g × Bool => baseEndpoint g ε a.1 a.2) := by
  rintro ⟨⟨j, hj⟩, side⟩ ⟨⟨k, hk⟩, side'⟩ h
  cases side <;> cases side' <;> simp only [baseEndpoint, Bool.false_eq_true,
    ↓reduceIte] at h
  · have he := baseLeft_injective g ε j k hg hε hj hk h
    simp only [Prod.mk.injEq, Fin.mk.injEq, and_true]
    exact he
  · exact False.elim (baseLeft_ne_baseRight g ε j k hg hε hj hk h)
  · exact False.elim (baseLeft_ne_baseRight g ε k j hg hε hk hj h.symm)
  · have he := baseRight_injective g ε j k hg hε hj hk h
    simp only [Prod.mk.injEq, Fin.mk.injEq, and_true]
    exact he

theorem baseLength_bounds (g ε j : Nat) (hg : 2 ≤ g) (hε : ε ≤ 1)
    (hj : j < g) : 1 ≤ baseLength g ε j ∧ baseLength g ε j ≤ 3 * g := by
  by_cases hj0 : j = 0 <;> by_cases he : ε = 0 <;>
    simp_all [baseLength] <;> omega

theorem baseLength_allowed (g ε j : Nat) (hg : 2 ≤ g) (hε : ε ≤ 1)
    (hj : j < g) : AllowedLength g (baseLength g ε j) := by
  by_cases hj0 : j = 0 <;> by_cases he : ε = 0 <;>
    simp_all [baseLength, AllowedLength] <;> omega

theorem baseLength_injective (g ε η j k : Nat) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hη : η ≤ 1) (hj : j < g) (hk : k < g)
    (h : baseLength g ε j = baseLength g η k) : ε = η ∧ j = k := by
  by_cases hj0 : j = 0 <;> by_cases hk0 : k = 0 <;>
    by_cases he : ε = 0 <;> by_cases ht : η = 0 <;>
    simp_all [baseLength] <;> omega

theorem baseLength_surjective (g s : Nat) (hg : 2 ≤ g) (hs : AllowedLength g s) :
    ∃ ε ≤ 1, ∃ j < g, baseLength g ε j = s := by
  rcases hs with hs | hs | hs
  · by_cases h : s % 2 = 0
    · refine ⟨1, by omega, g - s / 2, by omega, ?_⟩
      have hj : g - s / 2 ≠ 0 := by omega
      simp only [baseLength, hj, ↓reduceIte]
      omega
    · refine ⟨0, by omega, g - (s + 1) / 2, by omega, ?_⟩
      have hj : g - (s + 1) / 2 ≠ 0 := by omega
      simp only [baseLength, hj, ↓reduceIte]
      omega
  · refine ⟨0, by omega, 0, by omega, ?_⟩
    simp [baseLength, hs]
  · refine ⟨1, by omega, 0, by omega, ?_⟩
    simp [baseLength, hs]

theorem base_oriented_difference (g ε j : Nat) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hj : j < g) :
    baseLeft g ε j + baseLength g ε j = baseRight g ε j ∨
      baseRight g ε j + baseLength g ε j = baseLeft g ε j + order g := by
  by_cases hj0 : j = 0 <;> by_cases he : ε = 0 <;>
    simp_all [baseLeft, baseRight, baseLength, order] <;> omega

/-! The four disjointness checks C1--C4 of the written proof. -/

theorem baseVertex_shift_two_g (g ε η x y : Nat) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hη : η ≤ 1) (hx : BaseVertex g ε x) (hy : BaseVertex g η y) :
    x ≠ (y + 2 * g) % order g := by
  have hylt : y + 2 * g < order g := by
    simp only [BaseVertex, order] at *
    omega
  rw [Nat.mod_eq_of_lt hylt]
  simp only [BaseVertex] at *
  omega

theorem baseVertex_shift_two_g_succ (g x y : Nat) (hg : 2 ≤ g)
    (hx : BaseVertex g 1 x) (hy : BaseVertex g 0 y) :
    x ≠ (y + (2 * g + 1)) % order g := by
  have hyle : y + (2 * g + 1) ≤ order g := by
    simp only [BaseVertex, order] at *
    omega
  rcases Nat.lt_or_eq_of_le hyle with hylt | hyeq
  · rw [Nat.mod_eq_of_lt hylt]
    simp only [BaseVertex] at *
    omega
  · rw [hyeq, Nat.mod_self]
    simp only [BaseVertex] at hx
    omega

theorem inverse_three_identity (g : Nat) : 3 * (4 * g + 1) = 2 * order g + 1 := by
  simp only [order]
  omega

theorem inverse_three (g : Nat) (hg : 2 ≤ g) :
    (3 * (4 * g + 1)) % (2 * order g) = 1 := by
  rw [inverse_three_identity]
  have h : 1 < 2 * order g := by simp only [order]; omega
  simp only [Nat.add_mod, Nat.mod_self, Nat.zero_add, Nat.mod_eq_of_lt h]

theorem order_odd (g : Nat) : order g % 2 = 1 := by
  simp only [order]
  omega

theorem order_not_dvd_three (g : Nat) : order g % 3 = 1 := by
  simp only [order]
  omega

end CircularIndex
