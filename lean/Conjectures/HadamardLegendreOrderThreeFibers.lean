import Conjectures.HadamardLegendreOrderNine
import Conjectures.HadamardLegendreCompression
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Abel

/-!
# The three-point fibres forced by an actual order-three automorphism

The fixed subgroup and difference image coincide and have order three.
Outside that subgroup, an invariant row is constant on each entire
three-point coset. Its compression consequently has squared value nine
on the two nonzero quotient points, and at least one at zero.
-/

namespace HadamardLegendre

open scoped BigOperators
open HadamardBorderNormalizationTransport
open HadamardBorderConstruction

theorem group_card_three_cover {D : Type*} [AddCommGroup D] [Finite D]
    (hD : Nat.card D = 3) (a : D) (ha : a ≠ 0) (z : D) :
    z = 0 ∨ z = a ∨ z = -a := by
  classical
  let : Fintype D := Fintype.ofFinite D
  have ha3 : (a + a) + a = 0 := by
    have h : (3 : ℕ) • a = 0 := by
      simpa only [hD] using card_nsmul_eq_zero' (x := a)
    calc
      (a + a) + a = (3 : ℕ) • a := by abel
      _ = 0 := h
  have hneg : -a ≠ a := by
    intro h
    have htwo : a + a = 0 :=
      (congrArg (fun b : D => a + b) h.symm).trans (add_neg_cancel a)
    rw [htwo, zero_add] at ha3
    exact ha ha3
  have hneg0 : -a ≠ 0 := neg_ne_zero.mpr ha
  let S : Finset D := {-a, a, 0}
  have hS : S.card = 3 := by
    change ({-a, a, 0} : Finset D).card = 3
    rw [Finset.card_insert_of_not_mem (by
      simp only [Finset.mem_insert, Finset.mem_singleton]
      exact not_or.mpr ⟨hneg, hneg0⟩)]
    rw [Finset.card_insert_of_not_mem (by
      simpa only [Finset.mem_singleton] using ha), Finset.card_singleton]
  have hSuniv : S = Finset.univ :=
    Finset.eq_of_subset_of_card_le (Finset.subset_univ S) (by
      rw [Finset.card_univ, ← Nat.card_eq_fintype_card, hD, hS])
  have hz : z ∈ S := by rw [hSuniv]; exact Finset.mem_univ z
  change z ∈ ({-a, a, 0} : Finset D) at hz
  simp only [Finset.mem_insert, Finset.mem_singleton] at hz
  rcases hz with hz | hz | hz
  · exact Or.inr (Or.inr hz)
  · exact Or.inr (Or.inl hz)
  · exact Or.inl hz

variable {R : Type*} [AddCommGroup R]

theorem order_three_row_constant_on_nonzero_coset [Finite R] (hR : Nat.card R = 9)
    (u : Multiplicative (AddAut R)) (hu : u ^ 3 = 1) (hne : u ≠ 1)
    (f : R → ℤ) (hf : ∀ x, f (u.toAdd x) = f x)
    (x : R) (hx : x ∉ automorphismFixedSubgroup u)
    (z : R) (hz : z ∈ automorphismFixedSubgroup u) :
    f (x + z) = f x := by
  have hfixed := (prime_automorphism_fixed_card_nine hR u
    (by decide : Nat.Prime 3) (by decide) hu hne).2
  have hpoint := (order_three_difference_range_fixed hR u hu hne).2.1
  let t := automorphismDifference u x
  have htmem : t ∈ automorphismFixedSubgroup u := hpoint x
  have htne : (⟨t, htmem⟩ : automorphismFixedSubgroup u) ≠ 0 := by
    intro h
    apply hx
    have hval := congrArg (fun a : automorphismFixedSubgroup u => (a : R)) h
    change u.toAdd x - x = 0 at hval
    exact sub_eq_zero.mp hval
  have ht3 : (t + t) + t = 0 := by
    have h : (3 : ℕ) • (⟨t, htmem⟩ : automorphismFixedSubgroup u) = 0 := by
      simpa only [hfixed] using
        card_nsmul_eq_zero' (x := (⟨t, htmem⟩ : automorphismFixedSubgroup u))
    have hv := congrArg (fun a : automorphismFixedSubgroup u => (a : R)) h
    change (3 : ℕ) • t = 0 at hv
    calc
      (t + t) + t = (3 : ℕ) • t := by abel
      _ = 0 := hv
  have ht2 : t + t = -t := eq_neg_iff_add_eq_zero.mpr ht3
  have hux : u.toAdd x = x + t := by
    dsimp only [t, automorphismDifference]
    change u.toAdd x = x + (u.toAdd x - x)
    abel
  have hut : u.toAdd t = t := hpoint x
  have huux : u.toAdd (u.toAdd x) = x - t := by
    calc
      u.toAdd (u.toAdd x) = u.toAdd (x + t) := congrArg u.toAdd hux
      _ = (x + t) + t := by rw [map_add, hux, hut]
      _ = x - t := by rw [add_assoc, ht2, sub_eq_add_neg]
  have hplus : f (x + t) = f x := by rw [← hux, hf x]
  have hminus : f (x - t) = f x := by
    rw [← huux, hf (u.toAdd x), hf x]
  rcases group_card_three_cover hfixed
      (⟨t, htmem⟩ : automorphismFixedSubgroup u) htne ⟨z, hz⟩ with h | h | h
  · have hz0 : z = 0 := congrArg (fun a : automorphismFixedSubgroup u => (a : R)) h
    rw [hz0, add_zero]
  · have hzt : z = t := congrArg (fun a : automorphismFixedSubgroup u => (a : R)) h
    rwa [hzt]
  · have hzneg : z = -t := congrArg (fun a : automorphismFixedSubgroup u => (a : R)) h
    simpa only [hzneg, ← sub_eq_add_neg] using hminus

theorem order_three_quotient_card [Finite R] (hR : Nat.card R = 9)
    (u : Multiplicative (AddAut R)) (hu : u ^ 3 = 1) (hne : u ≠ 1) :
    Nat.card (R ⧸ automorphismFixedSubgroup u) = 3 := by
  have hfixed := (prime_automorphism_fixed_card_nine hR u
    (by decide : Nat.Prime 3) (by decide) hu hne).2
  have h := (automorphismFixedSubgroup u).card_eq_card_quotient_mul_card_addSubgroup
  rw [hR, hfixed] at h
  omega

theorem order_three_compressed_square_nonzero [Fintype R]
    (hR : Nat.card R = 9) (u : Multiplicative (AddAut R))
    [Fintype (R ⧸ automorphismFixedSubgroup u)]
    [DecidableEq (R ⧸ automorphismFixedSubgroup u)]
    (hu : u ^ 3 = 1) (hne : u ≠ 1)
    (f : R → ℤ) (hsign : SignValued f) (hf : ∀ x, f (u.toAdd x) = f x)
    (q : R ⧸ automorphismFixedSubgroup u) (hq : q ≠ 0) :
    (compress (QuotientAddGroup.mk' (automorphismFixedSubgroup u)) f q) ^ 2 = 9 := by
  let π := QuotientAddGroup.mk' (automorphismFixedSubgroup u)
  have hπ := QuotientAddGroup.mk'_surjective (automorphismFixedSubgroup u)
  have hfixed := (prime_automorphism_fixed_card_nine hR u
    (by decide : Nat.Prime 3) (by decide) hu hne).2
  have hker : Nat.card π.ker = 3 := by
    simpa only [π, QuotientAddGroup.ker_mk'] using hfixed
  obtain ⟨x, hx⟩ := hπ q
  have hxn : x ∉ automorphismFixedSubgroup u := by
    intro h
    exact hq (hx.symm.trans ((QuotientAddGroup.eq_zero_iff x).mpr h))
  have hconstant (y : R) (hy : π y = q) : f y = f x := by
    have hmem : y - x ∈ automorphismFixedSubgroup u := by
      apply (QuotientAddGroup.eq_zero_iff _).mp
      change π (y - x) = 0
      rw [map_sub, hy, hx, sub_self]
    have h := order_three_row_constant_on_nonzero_coset hR u hu hne f hf x hxn
      (y - x) hmem
    have he : x + (y - x) = y := by abel
    rwa [he] at h
  have hcompress : compress π f q = f x * 3 := by
    calc
      compress π f q = compress π (fun _ : R => f x) q := by
        unfold compress
        apply Finset.sum_congr rfl
        intro y hy
        by_cases h : π y = q
        · simp only [ite_eq_left h, hconstant y h]
        · simp only [ite_eq_right h]
      _ = f x * 3 := by rw [compress_const π hπ, hker]
  change (compress π f q) ^ 2 = 9
  rw [hcompress]
  rcases hsign x with h | h <;> norm_num [h]

theorem order_three_compressed_energy_ge [Fintype R]
    (hR : Nat.card R = 9) (u : Multiplicative (AddAut R))
    [Fintype (R ⧸ automorphismFixedSubgroup u)]
    [DecidableEq (R ⧸ automorphismFixedSubgroup u)]
    (hu : u ^ 3 = 1) (hne : u ≠ 1)
    (f : R → ℤ) (hsign : SignValued f) (hf : ∀ x, f (u.toAdd x) = f x) :
    19 ≤ ∑ q : R ⧸ automorphismFixedSubgroup u,
      (compress (QuotientAddGroup.mk' (automorphismFixedSubgroup u)) f q) ^ 2 := by
  let π := QuotientAddGroup.mk' (automorphismFixedSubgroup u)
  have hπ := QuotientAddGroup.mk'_surjective (automorphismFixedSubgroup u)
  have hfixed := (prime_automorphism_fixed_card_nine hR u
    (by decide : Nat.Prime 3) (by decide) hu hne).2
  have hker : Nat.card π.ker = 3 := by
    simpa only [π, QuotientAddGroup.ker_mk'] using hfixed
  have hmod := compress_mod_two π hπ f hsign 0
  rw [hker] at hmod
  norm_num at hmod
  have hzero : 1 ≤ (compress π f 0) ^ 2 := by
    have hside : compress π f 0 ≤ -1 ∨ 1 ≤ compress π f 0 := by omega
    rcases hside with h | h
    · nlinarith [sq_nonneg (compress π f 0 + 1)]
    · nlinarith [sq_nonneg (compress π f 0 - 1)]
  have hpoint (q : R ⧸ automorphismFixedSubgroup u) :
      9 - 8 * (if q = 0 then (1 : ℤ) else 0) ≤ (compress π f q) ^ 2 := by
    by_cases hq : q = 0
    · simpa only [hq, ite_true, mul_one] using hzero
    · rw [order_three_compressed_square_nonzero hR u hu hne f hsign hf q hq]
      simp only [ite_eq_right hq, mul_zero, sub_zero, le_refl]
  have hsum := Finset.sum_le_sum
    (fun q (_ : q ∈ (Finset.univ : Finset (R ⧸ automorphismFixedSubgroup u))) => hpoint q)
  have hQ : Fintype.card (R ⧸ automorphismFixedSubgroup u) = 3 := by
    simpa only [Nat.card_eq_fintype_card] using order_three_quotient_card hR u hu hne
  simpa only [Finset.sum_sub_distrib, ← Finset.mul_sum, Fintype.sum_ite_eq',
    Finset.sum_const, Finset.card_univ, hQ, nsmul_eq_mul] using hsum

end HadamardLegendre
