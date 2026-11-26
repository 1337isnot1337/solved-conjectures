import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! # Exact averaging over all twists of a transitive component action -/

namespace Conjectures.AsgarliGhiocaYip

open Finset
open scoped Classical

/-- For a transitive right action, the total number of pairs `(x,g)` sending
`x` to a prescribed target `fr x` is exactly the group order. -/
theorem card_stable_pairs {C G : Type*} [Fintype C] [Nonempty C] [DecidableEq C] [Group G] [Fintype G]
    (act : C → G → C) (hone : ∀ x, act x 1 = x)
    (hmul : ∀ x g h, act x (g * h) = act (act x g) h)
    (htrans : ∀ x y, ∃ g, act x g = y) (fr : C → C) :
    (univ.filter fun p : C × G ↦ act p.1 p.2 = fr p.1).card = Fintype.card G := by
  classical
  let fiber (x y : C) := (univ : Finset G).filter fun h ↦ act x h = y
  have hsame (x y z : C) : (fiber x y).card = (fiber x z).card := by
    obtain ⟨g, hg⟩ := htrans y z
    refine card_bij' (fun h _ ↦ h * g) (fun h _ ↦ h * g⁻¹) ?_ ?_ ?_ ?_
    · intro h hh
      have hh' := (mem_filter.mp hh).2
      exact mem_filter.mpr ⟨mem_univ _, by rw [hmul, hh', hg]⟩
    · intro h hh
      have hh' := (mem_filter.mp hh).2
      refine mem_filter.mpr ⟨mem_univ _, ?_⟩
      rw [hmul, hh', ← hg, ← hmul, mul_inv_cancel, hone]
    · simp [mul_assoc]
    · simp [mul_assoc]
  have hsize (x y : C) : Fintype.card C * (fiber x y).card = Fintype.card G := by
    have hsum := card_eq_sum_card_fiberwise (s := (univ : Finset G)) (t := (univ : Finset C))
      (f := act x) (fun _ _ ↦ mem_univ _)
    change (univ : Finset G).card = ∑ z : C, (fiber x z).card at hsum
    rw [sum_const_nat (fun z _ ↦ hsame x z y), card_univ, card_univ] at hsum
    exact hsum.symm
  let x₀ : C := Classical.choice ‹Nonempty C›
  have heq (x : C) : (fiber x (fr x)).card = (fiber x₀ (fr x₀)).card :=
    Nat.eq_of_mul_eq_mul_left Fintype.card_pos ((hsize x (fr x)).trans (hsize x₀ (fr x₀)).symm)
  let s := (univ : Finset (C × G)).filter fun p ↦ act p.1 p.2 = fr p.1
  have hfiber (x : C) : (s.filter fun p ↦ p.1 = x).card = (fiber x (fr x)).card := by
    refine card_bij' (fun p _ ↦ p.2) (fun h _ ↦ (x, h)) ?_ ?_ ?_ ?_
    · intro p hp
      have hx := (mem_filter.mp hp).2
      have h := (mem_filter.mp (mem_filter.mp hp).1).2
      exact mem_filter.mpr ⟨mem_univ _, hx ▸ h⟩
    · intro h hh
      exact mem_filter.mpr ⟨mem_filter.mpr ⟨mem_univ _, (mem_filter.mp hh).2⟩, rfl⟩
    · intro p hp; exact Prod.ext (mem_filter.mp hp).2.symm rfl
    · intros; rfl
  calc
    s.card = ∑ x : C, (s.filter fun p ↦ p.1 = x).card :=
      card_eq_sum_card_fiberwise (f := Prod.fst) (fun _ _ ↦ mem_univ _)
    _ = Fintype.card C * (fiber x₀ (fr x₀)).card := by simp [hfiber, heq]
    _ = _ := hsize x₀ (fr x₀)

/-- The exact mass identity and the upper bounds for the other stable pairs
force a lower bound for any chosen stable pair. -/
theorem half_of_twisted_mass {ι : Type*} [DecidableEq ι] (s : Finset ι) {x : ι} (hx : x ∈ s)
    (points : ι → ℕ) {N D q good : ℕ} (hN : 0 < N) (hs : s.card = N) (hND : 2 * N ≤ D)
    (hD : 4 ≤ D) (hq : D^8 ≤ q) (hgood : q ≤ good + (2 * N^2 + 1))
    (hmass : ∑ i ∈ s, points i = good * N)
    (hupper : ∀ i ∈ s, (points i : ℝ) ≤ q + 8 * (N : ℝ)^2 * Real.sqrt q) :
    q ≤ 2 * points x := by
  let e : ℝ := 8 * (N : ℝ)^2 * Real.sqrt q
  let b : ℝ := 2 * (N : ℝ)^2 + 1
  have hS := Real.sq_sqrt (show (0 : ℝ) ≤ q by positivity)
  have hq' : (D : ℝ)^8 ≤ q := by exact_mod_cast hq
  have hN' : (1 : ℝ) ≤ N := by exact_mod_cast hN
  have hD' : (4 : ℝ) ≤ D := by exact_mod_cast hD
  have hND' : (2 : ℝ) * N ≤ D := by exact_mod_cast hND
  have hroot : (D : ℝ)^4 ≤ Real.sqrt q := by
    apply le_of_pow_le_pow_left₀ (by decide : 2 ≠ 0) (by positivity)
    rw [← pow_mul, hS]
    exact hq'
  have hcube : 8 * (N : ℝ)^3 ≤ (D : ℝ)^3 := calc
    _ = (2 * (N : ℝ))^3 := by ring
    _ ≤ _ := by gcongr
  have hbig : 32 * (N : ℝ)^3 ≤ Real.sqrt q := by
    have h := mul_le_mul_of_nonneg_right hD' (show (0 : ℝ) ≤ (D : ℝ)^3 by positivity)
    nlinarith
  have he : 4 * (N : ℝ) * e ≤ q := by
    dsimp [e]
    nlinarith [mul_le_mul_of_nonneg_right hbig (Real.sqrt_nonneg (q : ℝ))]
  have hsq : (1 : ℝ) ≤ (N : ℝ)^2 := by nlinarith [sq_nonneg ((N : ℝ) - 1)]
  have hD5 : (24 : ℝ) ≤ (D : ℝ)^5 := by
    have h : (4 : ℝ)^5 ≤ (D : ℝ)^5 := by gcongr
    linarith
  have hb : 8 * (N : ℝ) * b ≤ q := by
    dsimp [b]
    nlinarith [mul_le_mul_of_nonneg_right hsq (show (0 : ℝ) ≤ N by positivity),
      mul_le_mul_of_nonneg_right hD5 (show (0 : ℝ) ≤ (D : ℝ)^3 by positivity)]
  have hrest : (∑ i ∈ s.erase x, (points i : ℝ)) ≤ ((s.erase x).card : ℝ) * (q + e) := calc
    _ ≤ ∑ _ ∈ s.erase x, ((q : ℝ) + e) :=
      sum_le_sum (fun i hi ↦ hupper i (mem_of_mem_erase hi))
    _ = _ := by simp only [sum_const, nsmul_eq_mul]
  have hs' : ((s.erase x).card : ℝ) + 1 = N := by
    exact_mod_cast (card_erase_add_one hx).trans hs
  have hm : (∑ i ∈ s.erase x, (points i : ℝ)) + points x = (good : ℝ) * N := by
    exact_mod_cast (sum_erase_add _ _ hx).trans hmass
  have hg : (q : ℝ) ≤ good + b := by dsimp [b]; exact_mod_cast hgood
  have hqN := mul_le_mul_of_nonneg_right hg (show (0 : ℝ) ≤ N by positivity)
  have he0 : 0 ≤ e := by dsimp [e]; positivity
  exact_mod_cast (show (q : ℝ) ≤ 2 * points x by
    rw [show ((s.erase x).card : ℝ) = N - 1 by linarith] at hrest
    nlinarith)

end Conjectures.AsgarliGhiocaYip
