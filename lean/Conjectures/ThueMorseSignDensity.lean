module

public import Mathlib
public import Conjectures.ThueMorseValuationBasic

@[expose] public section

noncomputable section

namespace ThueMorseSignDensity

open ThueMorseValuation Polynomial Finset

/-!
# Gawron–Miska–Ulas's Thue–Morse sign-density conjecture

Candidate formalization of the disproof of Conjecture 5.8 of
Gawron, Miska and Ulas, arXiv:1703.01955, using the documented argument in
results/gawron-miska-ulas-thue-morse-sign-density/PROOF.md.
The coefficient model is the stabilized product from ThueMorseValuationBasic.
The source's exception-index variable, not the coefficient index, is counted.
This file is a candidate until its exact build, audit and replay pass.
-/

def prev (n : ℕ) : ℤ := if n = 0 then 0 else t 2 (n - 1)

theorem t_zero : t 2 0 = 1 := by
  simp [t, truncProduct]

theorem pow_bound (n : ℕ) : 2 * n + 1 < 2 ^ (n + 2) := by
  have h : n < 2 ^ n := Nat.lt_two_pow_self
  rw [pow_succ, pow_succ]
  omega

theorem prefix_bound (n : ℕ) : n < 2 ^ (n + 1) := by
  have h : n < 2 ^ n := Nat.lt_two_pow_self
  rw [pow_succ]
  omega

def stepTerm (d N i : ℕ) : ℤ :=
  if 2 ∣ (N - i) then
    ((-1) ^ i * (Nat.choose 2 i : ℤ)) *
      ((truncProduct ℤ d) ^ 2).coeff ((N - i) / 2)
  else 0

theorem t_even (n : ℕ) : t 2 (2 * n) = t 2 n + prev n := by
  by_cases hn : n = 0
  · subst n
    simp [prev, t_zero]
  have hp : n < 2 ^ (n + 1) := prefix_bound n
  have hq : n - 1 < 2 ^ (n + 1) := by omega
  have hr : 2 * n < 2 ^ (n + 2) := by
    have := pow_bound n
    omega
  rw [t_eq_coeff 2 (2*n) (n+2) hr, coeff_prefix_pow_step]
  change (∑ i ∈ range (2*n+1), stepTerm (n+1) (2*n) i) =
    t 2 n + prev n
  have hsub : ({0, 2} : Finset ℕ) ⊆ range (2*n+1) := by
    intro i hi
    simp at hi
    rcases hi with rfl | rfl <;> simp <;> omega
  have hsum : (∑ i ∈ ({0,2} : Finset ℕ), stepTerm (n+1) (2*n) i) =
      ∑ i ∈ range (2*n+1), stepTerm (n+1) (2*n) i := by
    apply Finset.sum_subset hsub
    intro i hi hout
    have hn02 : i ≠ 0 ∧ i ≠ 2 := by simpa using hout
    by_cases hle : i ≤ 2
    · have hi1 : i = 1 := by omega
      subst i
      have hodd : ¬ 2 ∣ 2*n-1 := by omega
      simp [stepTerm, hodd]
    · have hgt : 2 < i := by omega
      simp [stepTerm, Nat.choose_eq_zero_of_lt hgt]
  rw [← hsum]
  have h0 : stepTerm (n+1) (2*n) 0 = t 2 n := by
    have hd : 2 ∣ 2*n-0 := by omega
    have he : (2*n-0)/2 = n := by omega
    simp [stepTerm, hd, he, t_eq_coeff 2 n (n+1) hp]
  have h2 : stepTerm (n+1) (2*n) 2 = t 2 (n-1) := by
    have hd : 2 ∣ 2*n-2 := by omega
    have he : (2*n-2)/2 = n-1 := by omega
    norm_num [stepTerm, hd, he, t_eq_coeff 2 (n-1) (n+1) hq]
  simp [h0, h2, prev, hn]

theorem t_odd (n : ℕ) : t 2 (2*n+1) = -2 * t 2 n := by
  rw [t_eq_coeff 2 (2*n+1) (n+2) (pow_bound n), coeff_prefix_pow_step]
  change (∑ i ∈ range (2*n+1+1), stepTerm (n+1) (2*n+1) i) = _
  have hm : 1 ∈ range (2*n+1+1) := by simp; omega
  rw [Finset.sum_eq_single_of_mem 1 hm]
  · have hd : 2 ∣ 2*n+1-1 := by omega
    have he : (2*n+1-1)/2 = n := by omega
    norm_num [stepTerm, hd, he, t_eq_coeff 2 n (n+1) (prefix_bound n)]
  · intro i hi hne
    have hi' : i < 2*n+1+1 := mem_range.mp hi
    by_cases hle : i ≤ 2
    · have hodd : ¬ 2 ∣ 2*n+1-i := by omega
      simp [stepTerm, hodd]
    · have hgt : 2 < i := by omega
      simp [stepTerm, Nat.choose_eq_zero_of_lt hgt]

theorem prev_even (n : ℕ) : prev (2*n) = -2 * prev n := by
  by_cases hn : n = 0
  · simp [hn, prev]
  · have h2n : 2*n ≠ 0 := by omega
    have he : 2*n-1 = 2*(n-1)+1 := by omega
    simp only [prev, if_neg hn, if_neg h2n, he, t_odd]

theorem prev_odd (n : ℕ) : prev (2*n+1) = t 2 n + prev n := by
  have hne : 2*n+1 ≠ 0 := by omega
  have he : 2*n+1-1 = 2*n := by omega
  simp only [prev, if_neg hne, he]
  rw [t_even]
  rfl

theorem parity (n : ℕ) : t 2 n % 2 = if n % 2 = 0 then 1 else 0 := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases hz : n = 0
    · simp [hz, t_zero]
    · by_cases he : n % 2 = 0
      · let k := n / 2
        have hnk : n = 2*k := by dsimp [k]; omega
        have hk : k < n := by dsimp [k]; omega
        have hk0 : k ≠ 0 := by omega
        have hk1 : k-1 < n := by omega
        have h₁ := ih k hk
        have h₂ := ih (k-1) hk1
        rw [if_pos he, hnk, t_even, prev, if_neg hk0]
        split_ifs at h₁ h₂ <;> omega
      · let k := n / 2
        have hnk : n = 2*k+1 := by dsimp [k]; omega
        rw [if_neg he, hnk, t_odd]
        omega

theorem t_nonzero (n : ℕ) : t 2 n ≠ 0 := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases he : n % 2 = 0
    · have hp := parity n
      rw [if_pos he] at hp
      omega
    · let k := n / 2
      have hnk : n = 2*k+1 := by dsimp [k]; omega
      have hk : k < n := by dsimp [k]; omega
      have hne := ih k hk
      rw [hnk, t_odd]
      omega

theorem row_512_0 (n : ℕ) :
    t 2 (512 * n + 0) = 1 * t 2 n + 171 * prev n := by
  have h : 512 * n + 0 = (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * n))))))))) := by ring
  rw [h]
  simp only [t_even, t_odd, prev_even, prev_odd]
  ring

theorem row_512_30 (n : ℕ) :
    t 2 (512 * n + 30) = 11 * t 2 n - 39 * prev n := by
  have h : 512 * n + 30 = (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * n)))) + 1) + 1) + 1) + 1)) := by ring
  rw [h]
  simp only [t_even, t_odd, prev_even, prev_odd]
  ring

theorem row_512_324 (n : ℕ) :
    t 2 (512 * n + 324) = -3 * t 2 n + 7 * prev n := by
  have h : 512 * n + 324 = (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * n + 1)) + 1)))) + 1))) := by ring
  rw [h]
  simp only [t_even, t_odd, prev_even, prev_odd]
  ring

theorem row_256_1 (n : ℕ) :
    t 2 (256 * n + 1) = -2 * t 2 n - 86 * prev n := by
  have h : 256 * n + 1 = (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * n))))))) + 1) := by ring
  rw [h]
  simp only [t_even, t_odd, prev_even, prev_odd]
  ring

theorem row_256_16 (n : ℕ) :
    t 2 (256 * n + 16) = -7 * t 2 n + 19 * prev n := by
  have h : 256 * n + 16 = (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * n))) + 1))))) := by ring
  rw [h]
  simp only [t_even, t_odd, prev_even, prev_odd]
  ring

theorem row_256_166 (n : ℕ) :
    t 2 (256 * n + 166) = 3 * t 2 n - 7 * prev n := by
  have h : 256 * n + 166 = (2 * (2 * (2 * (2 * (2 * (2 * (2 * (2 * n + 1)) + 1))) + 1) + 1)) := by ring
  rw [h]
  simp only [t_even, t_odd, prev_even, prev_odd]
  ring

theorem identity0 (n : ℕ) :
    t 2 (512*n+0) + 13*t 2 (512*n+30) + 48*t 2 (512*n+324) = 0 := by
  rw [row_512_0, row_512_30, row_512_324]
  ring

theorem identity1 (n : ℕ) :
    t 2 (256*n+1) + 34*t 2 (256*n+16) + 80*t 2 (256*n+166) = 0 := by
  rw [row_256_1, row_256_16, row_256_166]
  ring

theorem block0 (h : ℕ) :
    ∃ s < 512, t 2 (3*(512*h+s)) < 0 := by
  by_contra! hn
  have h0 := hn 0 (by decide)
  have h1 := hn 10 (by decide)
  have h2 := hn 108 (by decide)
  rw [show 3*(512*h+0) = 512*(3*h)+0 by ring] at h0
  rw [show 3*(512*h+10) = 512*(3*h)+30 by ring] at h1
  rw [show 3*(512*h+108) = 512*(3*h)+324 by ring] at h2
  have hid := identity0 (3*h)
  have hne := t_nonzero (512*(3*h)+0)
  omega

theorem block1 (h : ℕ) :
    ∃ s < 256, 0 < t 2 (3*(256*h+s)+1) := by
  by_contra! hn
  have h0 := hn 0 (by decide)
  have h1 := hn 5 (by decide)
  have h2 := hn 55 (by decide)
  rw [show 3*(256*h+0)+1 = 256*(3*h)+1 by ring] at h0
  rw [show 3*(256*h+5)+1 = 256*(3*h)+16 by ring] at h1
  rw [show 3*(256*h+55)+1 = 256*(3*h)+166 by ring] at h2
  have hid := identity1 (3*h)
  have hne := t_nonzero (256*(3*h)+1)
  omega

def sign (a : ℤ) : ℤ := if a < 0 then -1 else if a = 0 then 0 else 1

def exception (m j n : ℕ) : Prop := sign (t m (3*n+j)) ≠ (-1 : ℤ)^j

def exceptions (m j X : ℕ) : Finset ℕ :=
  (range X).filter (fun n => sign (t m (3*n+j)) ≠ (-1 : ℤ)^j)

theorem exception_block0 (h : ℕ) : ∃ s < 512, exception 2 0 (512*h+s) := by
  obtain ⟨s, hs, ht⟩ := block0 h
  exact ⟨s, hs, by simp [exception, sign, ht]⟩

theorem exception_block1 (h : ℕ) : ∃ s < 256, exception 2 1 (256*h+s) := by
  obtain ⟨s, hs, ht⟩ := block1 h
  exact ⟨s, hs, by simp [exception, sign, not_lt.mpr (le_of_lt ht), ne_of_gt ht]⟩

theorem count_from_blocks (p : ℕ → Prop) [DecidablePred p] (L X : ℕ)
    (hL : 0 < L) (h : ∀ h : ℕ, ∃ s < L, p (L*h+s)) :
    X/L ≤ ((range X).filter p).card := by
  classical
  choose s hs hp using h
  let f : ℕ → ℕ := fun i => L*i+s i
  have hmono : StrictMono f := by
    intro a b hab
    have hm := Nat.mul_le_mul_left L (show a+1 ≤ b by omega)
    rw [Nat.mul_succ] at hm
    dsimp [f]
    have ha := hs a
    omega
  have hsub : (range (X/L)).image f ⊆ (range X).filter p := by
    intro j hj
    obtain ⟨i, hi, rfl⟩ := mem_image.mp hj
    have hi' : i < X/L := mem_range.mp hi
    have hm := Nat.mul_le_mul_left L (show i+1 ≤ X/L by omega)
    rw [Nat.mul_succ] at hm
    have hdiv : L*(X/L) ≤ X := by
      simpa [Nat.mul_comm] using Nat.div_mul_le_self X L
    have hf : f i < X := by
      dsimp [f]
      have := hs i
      omega
    exact mem_filter.mpr ⟨mem_range.mpr hf, hp i⟩
  have hh := card_le_card hsub
  rw [card_image_of_injective _ hmono.injective, card_range] at hh
  exact hh

theorem lower_bound0 (X : ℕ) : X/512 ≤ (exceptions 2 0 X).card := by
  exact count_from_blocks _ 512 X (by decide) exception_block0

theorem lower_bound1 (X : ℕ) : X/256 ≤ (exceptions 2 1 X).card := by
  exact count_from_blocks _ 256 X (by decide) exception_block1

/-- The epsilon-N definition of natural density zero, for nonnegative ratios. -/
def ZeroDensity (m j : ℕ) : Prop :=
  ∀ ε : ℝ, 0 < ε → ∃ N : ℕ, ∀ X : ℕ, N ≤ X →
    ((exceptions m j X).card : ℝ) / (X : ℝ) < ε

theorem not_zero_density_of_bound (m j L : ℕ) (hL : 0 < L)
    (h : ∀ X : ℕ, X/L ≤ (exceptions m j X).card) : ¬ ZeroDensity m j := by
  intro hd
  have hLr : (0 : ℝ) < L := by exact_mod_cast hL
  obtain ⟨N, hN⟩ := hd (1/(2*(L : ℝ))) (by positivity)
  let X := L*(N+1)
  have hX : N ≤ X := by
    have hm := Nat.mul_le_mul_right (N+1) (show 1 ≤ L by omega)
    dsimp [X]
    omega
  have hXpos : (0 : ℝ) < X := by dsimp [X]; positivity
  have hdiv : X/L = N+1 := by
    dsimp [X]
    exact Nat.mul_div_cancel_left (N+1) hL
  have hc := h X
  rw [hdiv] at hc
  have hcr : ((N+1 : ℕ) : ℝ) ≤ ((exceptions m j X).card : ℝ) := by exact_mod_cast hc
  have hs := (div_lt_iff₀ hXpos).mp (hN X hX)
  have he : 1/(2*(L : ℝ)) * (X : ℝ) = ((N : ℝ)+1)/2 := by
    simp only [X, Nat.cast_mul, Nat.cast_add, Nat.cast_one]
    field_simp
    <;> ring
  rw [he] at hs
  push_cast at hcr
  linarith

theorem not_zero_density0 : ¬ ZeroDensity 2 0 :=
  not_zero_density_of_bound 2 0 512 (by decide) lower_bound0

theorem not_zero_density1 : ¬ ZeroDensity 2 1 :=
  not_zero_density_of_bound 2 1 256 (by decide) lower_bound1

/-- Conjecture 5.8 is false, with its original quantification over m and j. -/
theorem conjecture_false :
    ¬ (∀ m : ℕ, 2 ≤ m → ∀ j : ℕ, j < 2 →
      Set.Infinite {n | exception m j n} ∧ ZeroDensity m j) := by
  intro h
  exact not_zero_density0 (h 2 (by decide) 0 (by decide)).2

end ThueMorseSignDensity
