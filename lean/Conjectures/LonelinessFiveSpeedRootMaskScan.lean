import Conjectures.LonelinessFiveSpeedMaskArithmetic

/-! A checked bit-mask scan removes only residues with a genuine common
multiplier witness. The lowest-bit heuristic controls evaluation time; its
correctness is not assumed by the soundness theorem. -/

namespace Loneliness.FiveSpeedCertificate

def eraseMask (p remaining mask : ℕ) : ℕ :=
  remaining &&& (fullMask p ^^^ mask)

theorem eraseMask_testBit (p remaining mask r : ℕ) (hr : r < p) :
    (eraseMask p remaining mask).testBit r = true ↔
      remaining.testBit r = true ∧ mask.testBit r ≠ true := by
  simp only [eraseMask, Nat.testBit_land, Nat.testBit_xor, fullMask_testBit,
    hr, decide_true, Bool.and_eq_true]
  cases remaining.testBit r <;> cases mask.testBit r <;> decide

def proposedFirstBit (mask : ℕ) : ℕ := Nat.log2 (mask ^^^ (mask - 1))

def scanWitnessMasks (p : ℕ) (G : ℕ → ℕ) (common : ℕ) : ℕ → ℕ → ℕ → ℕ
  | 0, _, remaining => remaining
  | fuel + 1, times, remaining =>
    if remaining = 0 ∨ times = 0 then remaining else
      let t := proposedFirstBit times
      let next := times &&& (times - 1)
      if t < p ∧ common.testBit t = true then
        scanWitnessMasks p G common fuel next (eraseMask p remaining (G t))
      else scanWitnessMasks p G common fuel next remaining

/-- Any bit removed by the scan has a checked common multiplier. Fuel
exhaustion and imperfect token selection can only leave extra bits. -/
theorem scanWitnessMasks_sound (p : ℕ) (G : ℕ → ℕ) (common fuel times remaining r : ℕ)
    (hr : r < p) (hbit : remaining.testBit r = true) :
    (scanWitnessMasks p G common fuel times remaining).testBit r = true ∨
      ∃ t, t < p ∧ common.testBit t = true ∧ (G t).testBit r = true := by
  induction fuel generalizing times remaining with
  | zero => exact Or.inl hbit
  | succ fuel ih =>
    by_cases hstop : remaining = 0 ∨ times = 0
    · rw [scanWitnessMasks, if_pos hstop]
      exact Or.inl hbit
    · rw [scanWitnessMasks, if_neg hstop]
      by_cases ht : proposedFirstBit times < p ∧ common.testBit (proposedFirstBit times) = true
      · rw [if_pos ht]
        by_cases hg : (G (proposedFirstBit times)).testBit r = true
        · exact Or.inr ⟨proposedFirstBit times, ht.1, ht.2, hg⟩
        · exact ih _ _ ((eraseMask_testBit p remaining (G (proposedFirstBit times)) r hr).mpr
            ⟨hbit, hg⟩)
      · rw [if_neg ht]
        exact ih _ _ hbit

def prefixSpeeds (b c d : ℕ) : List ℕ := [1, b, c, d]

def prefixTimeMask (p : ℕ) (G : ℕ → ℕ) (b c d : ℕ) : ℕ :=
  andMasks p ((prefixSpeeds b c d).map G)

def prefixRemaining (p : ℕ) (G : ℕ → ℕ) (b c d candidates : ℕ) : ℕ :=
  let common := prefixTimeMask p G b c d
  scanWitnessMasks p G common p common candidates

def PrefixWitness (p b c d e : ℕ) : Prop :=
  ∃ t, t < p ∧ ∀ a ∈ prefixSpeeds b c d ++ [e], good p t a

theorem good_comm (p t r : ℕ) : good p t r ↔ good p r t := by
  simp only [good, Nat.mul_comm]

theorem prefixRemaining_sound (p : ℕ) (G : ℕ → ℕ) (b c d candidates e : ℕ)
    (hG : ∀ a, GoodMask p a (G a)) (he : e < p)
    (hbit : candidates.testBit e = true) :
    (prefixRemaining p G b c d candidates).testBit e = true ∨ PrefixWitness p b c d e := by
  rcases scanWitnessMasks_sound p G (prefixTimeMask p G b c d) p
    (prefixTimeMask p G b c d) candidates e he hbit with hleft | hright
  · exact Or.inl hleft
  · obtain ⟨t, ht, hcommon, hegood⟩ := hright
    have hc := (andMasks_testBit p ((prefixSpeeds b c d).map G) t).mp hcommon
    refine Or.inr ⟨t, ht, ?_⟩
    intro a ha
    rcases List.mem_append.mp ha with ha | ha
    · apply (good_comm p a t).mp
      exact ((hG a).2 t ht).mp (hc.2 _ (List.mem_map.mpr ⟨a, ha, rfl⟩))
    · have hae : a = e := by simpa only [List.mem_singleton] using ha
      subst a
      exact ((hG t).2 e he).mp hegood

def remainingLeafCheck (p remaining : ℕ) (leaf : ℕ → Bool) : Bool :=
  if remaining = 0 then true else
    (List.range (p / 2 + 1)).all (fun e => if remaining.testBit e then leaf e else true)

theorem remainingLeafCheck_sound (p remaining : ℕ) (leaf : ℕ → Bool)
    (hcheck : remainingLeafCheck p remaining leaf = true)
    (e : ℕ) (he : e ≤ p / 2) (hbit : remaining.testBit e = true) : leaf e = true := by
  by_cases hz : remaining = 0
  · simp only [hz, Nat.zero_testBit, Bool.false_eq_true] at hbit
  · have hall : ∀ e ∈ List.range (p / 2 + 1),
        (if remaining.testBit e then leaf e else true) = true := by
      simpa only [remainingLeafCheck, if_neg hz, List.all_eq_true] using hcheck
    have hh := hall e (List.mem_range.mpr (by omega))
    simpa only [hbit, ↓reduceIte] using hh

def rootPrefixCheck (p : ℕ) (G : ℕ → ℕ) (b c d candidates : ℕ)
    (leaf : ℕ → Bool) : Bool :=
  remainingLeafCheck p (prefixRemaining p G b c d candidates) leaf

theorem rootPrefixCheck_sound (p : ℕ) (G : ℕ → ℕ) (b c d candidates : ℕ)
    (leaf : ℕ → Bool) (hG : ∀ a, GoodMask p a (G a))
    (hcheck : rootPrefixCheck p G b c d candidates leaf = true)
    (e : ℕ) (he : e < p) (hhalf : e ≤ p / 2) (hbit : candidates.testBit e = true) :
    PrefixWitness p b c d e ∨ leaf e = true := by
  rcases prefixRemaining_sound p G b c d candidates e hG he hbit with hremain | hwitness
  · exact Or.inr (remainingLeafCheck_sound p _ leaf hcheck e hhalf hremain)
  · exact Or.inl hwitness

def predicateMask (n : ℕ) (test : ℕ → Bool) : ℕ :=
  BinaryAutomata.maskOfList ((List.range n).filter test)

theorem predicateMask_testBit (n : ℕ) (test : ℕ → Bool) (r : ℕ) :
    (predicateMask n test).testBit r = true ↔ r < n ∧ test r = true := by
  simp only [predicateMask, BinaryAutomata.maskOfList_mem, List.mem_filter, List.mem_range]

end Loneliness.FiveSpeedCertificate
