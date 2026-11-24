import Conjectures.SternHalfPlaneBasic
import Mathlib.Data.Nat.Log
import Mathlib.Data.List.Induction

/-!
# Dilcher–Kidwai–Tomkins Stern-polynomial half-plane conjecture

The Schinzel shift identity and the alternating binary-run continuant.
These connect the actual Stern recurrence to the local nonvanishing
criterion; they do not assume a formula for the Stern polynomials.
-/

namespace Conjectures.SternHalfPlane

section CommSemiring

variable {R : Type*} [CommSemiring R]

/-- The exact Schinzel identity, including both endpoints of the interval. -/
theorem stern_shift (a m r : ℕ) (hr : r ≤ 2 ^ a) (z : R) :
    stern (m * 2 ^ a + r) z =
      stern (2 ^ a - r) z * stern m z + stern r z * stern (m + 1) z := by
  induction a generalizing r with
  | zero =>
    have : r = 0 ∨ r = 1 := by simp only [pow_zero] at hr; omega
    rcases this with rfl | rfl <;> simp
  | succ a ih =>
    obtain ⟨s, hs | hs⟩ := r.even_or_odd'
    · subst r
      have hs : s ≤ 2 ^ a := by rw [pow_succ] at hr; omega
      have hleft : m * 2 ^ (a + 1) + 2 * s = 2 * (m * 2 ^ a + s) := by
        rw [pow_succ]
        ring
      have hright : 2 ^ (a + 1) - 2 * s = 2 * (2 ^ a - s) := by
        rw [pow_succ]
        omega
      rw [hleft, hright, stern_even, stern_even, stern_even, ih s hs]
      ring
    · subst r
      have hs : s + 1 ≤ 2 ^ a := by rw [pow_succ] at hr; omega
      have hleft : m * 2 ^ (a + 1) + (2 * s + 1) =
          2 * (m * 2 ^ a + s) + 1 := by rw [pow_succ]; ring
      have hright : 2 ^ (a + 1) - (2 * s + 1) =
          2 * (2 ^ a - (s + 1)) + 1 := by rw [pow_succ]; omega
      rw [hleft, stern_odd, show m * 2 ^ a + s + 1 = m * 2 ^ a + (s + 1) by omega,
        ih s (by omega), ih (s + 1) hs, hright, stern_odd, stern_odd,
        show 2 ^ a - (s + 1) + 1 = 2 ^ a - s by omega]
      ring

/-- The alternating sum of powers of two associated to the positive runs. -/
def runIndex : List ℕ → ℕ
  | [] => 1
  | a :: l => 2 ^ (a + l.sum) - runIndex l

/-- The unnormalized continuant in the source's run-length formula. -/
def runContinuant (z : R) : List ℕ → R
  | [] => 1
  | [a] => geom a z
  | a :: b :: l => geom a z * runContinuant z (b :: l) + z ^ a * runContinuant z l

theorem runIndex_bounds {l : List ℕ} (hl : ∀ a ∈ l, 0 < a) :
    0 < runIndex l ∧ runIndex l ≤ 2 ^ l.sum := by
  induction l with
  | nil => simp [runIndex]
  | cons a l ih =>
    have ha : 0 < a := hl a (by simp)
    have ht : ∀ b ∈ l, 0 < b := fun b hb => hl b (by simp [hb])
    obtain ⟨hpos, hle⟩ := ih ht
    have hp : 2 ^ l.sum < 2 ^ (a + l.sum) := by
      exact Nat.pow_lt_pow_right (by decide) (by omega)
    simp only [runIndex, List.sum_cons]
    omega

theorem runIndex_two {a b : ℕ} {l : List ℕ}
    (hb : 0 < b) (hl : ∀ c ∈ l, 0 < c) :
    runIndex (a :: b :: l) =
      (2 ^ a - 1) * 2 ^ (b + l.sum) + runIndex l := by
  have ht := (runIndex_bounds hl).2
  have hp : 2 ^ l.sum ≤ 2 ^ (b + l.sum) := by
    exact Nat.pow_le_pow_right (by decide) (by omega)
  have hpa : 0 < 2 ^ a := by positivity
  have hmul : 2 ^ (b + l.sum) ≤ 2 ^ a * 2 ^ (b + l.sum) := by
    nlinarith [show 0 < 2 ^ (b + l.sum) by positivity]
  simp only [runIndex, List.sum_cons]
  rw [pow_add, Nat.sub_mul, one_mul]
  omega

theorem stern_runIndex {l : List ℕ} (hl : ∀ a ∈ l, 0 < a) (z : R) :
    stern (runIndex l) z = runContinuant z l := by
  induction l using List.twoStepInduction with
  | nil => simp [runIndex, runContinuant]
  | singleton a => simp [runIndex, runContinuant, stern_pow_two_sub_one]
  | cons_cons a b l ih₁ ih₂ =>
    have hb : 0 < b := hl b (by simp)
    have ht : ∀ c ∈ l, 0 < c := fun c hc => hl c (by simp [hc])
    have hbt : ∀ c ∈ b :: l, 0 < c := fun c hc => hl c (by simp [hc])
    have hle : runIndex l ≤ 2 ^ (b + l.sum) :=
      (runIndex_bounds ht).2.trans (Nat.pow_le_pow_right (by decide) (by omega))
    have hpa : 0 < 2 ^ a := by positivity
    rw [runIndex_two hb ht, stern_shift _ _ _ hle,
      stern_pow_two_sub_one, Nat.sub_add_cancel (show 1 ≤ 2 ^ a by omega),
      stern_pow_two]
    change stern (runIndex (b :: l)) z * geom a z +
      stern (runIndex l) z * z ^ a = _
    rw [ih₂ b hbt, ih₁ ht]
    simp only [runContinuant]
    ring

end CommSemiring

/-- Every positive odd index has positive binary runs, with no bound on the index. -/
theorem exists_runIndex {n : ℕ} (hn : Odd n) :
    ∃ l : List ℕ, (∀ a ∈ l, 0 < a) ∧ runIndex l = n ∧ l.sum ≤ Nat.clog 2 n := by
  induction n using Nat.strong_induction_on with
  | h n ih =>
    by_cases h1 : n = 1
    · subst n
      exact ⟨[], by simp, rfl, by simp⟩
    have hnpos : 0 < n := hn.pos
    have hn1 : 1 < n := by omega
    let q := Nat.clog 2 n
    have hq : 0 < q := Nat.clog_pos (by decide) hn1
    have hnle : n ≤ 2 ^ q := Nat.le_pow_clog (by decide) n
    have heven : Even (2 ^ q) := (Nat.even_pow).mpr ⟨by decide, by omega⟩
    have hnlt : n < 2 ^ q := by
      by_contra h
      have heq : n = 2 ^ q := by omega
      exact (Nat.not_even_iff_odd.mpr (heq ▸ hn)) heven
    have hpred : 2 ^ (q - 1) < n := Nat.pow_pred_clog_lt_self (by decide) hn1
    have hpow : 2 ^ q = 2 * 2 ^ (q - 1) := by
      have heq : q = q - 1 + 1 := by omega
      conv_lhs => rw [heq, pow_succ]
      omega
    let m := 2 ^ q - n
    have hmpos : 0 < m := by dsimp [m]; omega
    have hmlt : m < n := by dsimp [m]; omega
    have hmodd : Odd m := by
      apply (Nat.odd_sub' hnle).mpr
      exact ⟨fun _ => heven, fun _ => hn⟩
    obtain ⟨l, hl, hi, hsum⟩ := ih m hmlt hmodd
    have hmle : m ≤ 2 ^ (q - 1) := by dsimp [m]; omega
    have hsumlt : l.sum < q := by
      have := Nat.clog_le_of_le_pow hmle
      omega
    refine ⟨(q - l.sum) :: l, ?_, ?_, ?_⟩
    · intro a ha
      rcases List.mem_cons.mp ha with rfl | ha
      · omega
      · exact hl a ha
    · simp only [runIndex, Nat.sub_add_cancel hsumlt.le, hi]
      dsimp [m]
      omega
    · simp only [List.sum_cons, Nat.sub_add_cancel hsumlt.le]
      exact le_rfl

end Conjectures.SternHalfPlane
