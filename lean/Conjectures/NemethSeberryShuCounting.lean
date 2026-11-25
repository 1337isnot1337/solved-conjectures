import Conjectures.NemethSeberryShuCongruence
import Mathlib.Data.Nat.Prime.Infinite
import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Tactic.Linarith

/-!
# Németh–Seberry–Shu conjecture

The counting reduction in §3 of the existing written disproof.  This file
does not assume the conjecture's negation.  It isolates the genuinely missing
analytic input as the existence of arbitrarily many distinct permanent
values at every dense row sum, uniformly for all sufficiently large primes.
The reduction from that input is fully checked; the input is not yet checked.
-/

namespace NemethSeberryShu

/-- Integer row sums in the source's closed density interval `[p/3, 2p/3]`. -/
def denseRowSums (p : ℕ) : Finset ℕ :=
  Finset.Icc ((p + 2) / 3) (2 * p / 3)

theorem denseRowSums_card (p : ℕ) :
    (denseRowSums p).card = 2 * p / 3 + 1 - (p + 2) / 3 := by
  simp [denseRowSums]

theorem denseRowSums_lt {p k : ℕ} (hp : 2 ≤ p) (hk : k ∈ denseRowSums p) : k < p := by
  simp only [denseRowSums, Finset.mem_Icc] at hk
  omega

/-- A convenient uniform linear lower bound; the exact count is above. -/
theorem four_mul_denseRowSums_card {p : ℕ} (hp : 2 ≤ p) :
    p ≤ 4 * (denseRowSums p).card := by
  rw [denseRowSums_card]
  omega

instance primeOrder_neZero (q : Nat.Primes) : NeZero q.val :=
  ⟨q.property.ne_zero⟩

/-- The quantity `V(p)` from the source, on the type of prime orders. -/
noncomputable def primePermanentCount (q : Nat.Primes) : ℕ :=
  (permanentValues q.val).card

/-- The exact finite-family output needed from the unformalized analytic argument. -/
def HasDensePermanentFamilies (q : Nat.Primes) (M : ℕ) : Prop :=
  ∃ S : denseRowSums q.val → Fin M → Finset (ZMod q.val),
    (∀ k j, (S k j).card = k.val) ∧
    ∀ k, Function.Injective fun j ↦ (binaryCirculant (S k j)).permanent

theorem dense_family_count (q : Nat.Primes) (M : ℕ)
    (h : HasDensePermanentFamilies q M) :
    M * (2 * q.val / 3 + 1 - (q.val + 2) / 3) ≤ primePermanentCount q := by
  obtain ⟨S, hcard, hsep⟩ := h
  rw [← denseRowSums_card]
  exact row_family_count q.property (denseRowSums q.val) M
    (fun _ hk ↦ denseRowSums_lt q.property.two_le hk) S hcard hsep

/-- Uniform dense-row separation implies eventual domination of every linear bound.

The premise is still an open formalization obligation: §1 constructs Fourier
profiles and §2 uses the uniform permanent approximation to establish it.
-/
theorem eventually_superlinear_of_dense_families
    (hfamilies : ∀ M : ℕ, ∃ N : ℕ, ∀ q : Nat.Primes, N ≤ q.val →
      HasDensePermanentFamilies q M) :
    ∀ B : ℕ, ∃ N : ℕ, ∀ q : Nat.Primes, N ≤ q.val →
      B * q.val < primePermanentCount q := by
  intro B
  obtain ⟨N, hN⟩ := hfamilies (4 * (B + 1))
  refine ⟨N, fun q hq ↦ ?_⟩
  have hc := dense_family_count q (4 * (B + 1)) (hN q hq)
  rw [← denseRowSums_card] at hc
  have hd := four_mul_denseRowSums_card q.property.two_le
  have hm := Nat.mul_le_mul_left (B + 1) hd
  have hp := q.property.pos
  nlinarith

/-- In particular the dense-family premise rules out the conjectured `O(p)` bound.

Natural constants suffice to express a linear upper bound for the
natural-valued counting function.  There is no bound asserted without the
explicit family premise.
-/
theorem no_eventual_linear_bound_of_dense_families
    (hfamilies : ∀ M : ℕ, ∃ N : ℕ, ∀ q : Nat.Primes, N ≤ q.val →
      HasDensePermanentFamilies q M) :
    ¬ ∃ B N : ℕ, ∀ q : Nat.Primes, N ≤ q.val →
      primePermanentCount q ≤ B * q.val := by
  rintro ⟨B, N, hbound⟩
  obtain ⟨K, hK⟩ := eventually_superlinear_of_dense_families hfamilies B
  obtain ⟨p, hpge, hp⟩ := Nat.exists_infinite_primes (max N K)
  let q : Nat.Primes := ⟨p, hp⟩
  have hN : N ≤ q.val := (le_max_left N K).trans hpge
  have hK' : K ≤ q.val := (le_max_right N K).trans hpge
  exact (not_lt_of_ge (hbound q hN)) (hK q hK')

end NemethSeberryShu
