module

public import Conjectures.FranklCyclicGenerators
public import Conjectures.FranklSmallCyclicNineEncoding

/-! Exact schedule interpretation of the short-period residual certificates.

A letter is a set of the four normalized tile shapes. Its four-bit encoding
uses the same shape order as the residual graph. The final theorem assumes
literal membership of every encoded seven-letter window in the 35-edge graph.
The reduction to that graph remains a separate certificate obligation.
-/
@[expose] public section

namespace FranklSmallCyclic

/-- Bits zero through three record exactly which normalized shapes occur. -/
def encodeLetter (letter : Finset (Fin 4)) : ℕ :=
  letter.sum (fun j => 2 ^ j.val)

theorem decode_encodeLetter : ∀ letter : Finset (Fin 4),
    decodeLetter (encodeLetter letter) = letter := by
  decide +kernel

theorem encodeLetter_lt : ∀ letter : Finset (Fin 4), encodeLetter letter < 16 := by
  decide +kernel

theorem encodeLetter_eq_zero_iff (letter : Finset (Fin 4)) :
    encodeLetter letter = 0 ↔ letter = ∅ := by
  constructor
  · intro h
    rw [← decode_encodeLetter letter, h]
    decide +kernel
  · rintro rfl
    rfl

theorem encodeLetter_injective : Function.Injective encodeLetter := by
  intro a b hab
  rw [← decode_encodeLetter a, ← decode_encodeLetter b, hab]

def encodedSchedule {n : ℕ} (word : ZMod n → Finset (Fin 4)) : ZMod n → ℕ :=
  fun p => encodeLetter (word p)

theorem encodedSchedule_nonzero {n : ℕ} (word : ZMod n → Finset (Fin 4))
    (hnonzero : ∃ p, word p ≠ ∅) : ∃ p, encodedSchedule word p ≠ 0 := by
  obtain ⟨p, hp⟩ := hnonzero
  exact ⟨p, fun h => hp ((encodeLetter_eq_zero_iff (word p)).mp h)⟩

/-- The graph window is exactly the encoding of the actual seven-start window. -/
theorem encodedSchedule_window {n : ℕ} (word : ZMod n → Finset (Fin 4))
    (start : ZMod n) :
    residualWindow (encodedSchedule word) start =
      List.ofFn (fun j : Fin 7 =>
        encodeLetter (FranklCyclic.windowSchedule word start 4 j)) := by
  rfl

/-- The two shape APIs describe the same four literal offsets. -/
theorem shapeOffsets_eq (j : Fin 4) :
    FranklSpanFour.shapeOffsets j = FranklCyclic.shapeOffsets j := by
  rfl

/-- The period-nine tables generate exactly the scheduled tiles. -/
theorem codedNineResidues_encodedSchedule (word : ZMod 9 → Finset (Fin 4)) :
    codedNineResidues (encodedSchedule word) = FranklCyclic.generatedTiles word := by
  unfold codedNineResidues FranklCyclic.generatedTiles
  apply congrArg (Finset.biUnion Finset.univ)
  funext p
  change (decodeLetter (encodeLetter (word p))).image _ = _
  rw [decode_encodeLetter]
  rfl

/-- A nonzero period-nine residual schedule has point zero in at least half
of its distinct generated unions. -/
theorem residual_nine_schedule_abundant (word : ZMod 9 → Finset (Fin 4))
    (hresidual : ∀ p, residualWindow (encodedSchedule word) p ∈ residualEdges)
    (hnonzero : ∃ p, word p ≠ ∅) :
    FranklLocal.Abundant (FranklLocal.family (FranklCyclic.generatedTiles word))
      (0 : ZMod 9) := by
  have h := residual_nine_abundant (encodedSchedule word) hresidual
    (encodedSchedule_nonzero word hnonzero)
  rw [codedNineResidues_encodedSchedule] at h
  exact h

/-- The short residual schedules are exhausted: periods seven, eight, and
ten admit no nonzero schedule, and period nine has the exact abundance
certificate above. Graph membership is an explicit hypothesis. -/
theorem residual_schedule_abundant {n : ℕ} [NeZero n]
    (hn : 7 ≤ n) (hn' : n ≤ 10) (word : ZMod n → Finset (Fin 4))
    (hresidual : ∀ p, residualWindow (encodedSchedule word) p ∈ residualEdges)
    (hnonzero : ∃ p, word p ≠ ∅) :
    ∃ x, FranklLocal.Abundant
      (FranklLocal.family (FranklCyclic.generatedTiles word)) x := by
  have hcases : n = 7 ∨ n = 8 ∨ n = 9 ∨ n = 10 := by omega
  rcases hcases with rfl | rfl | rfl | rfl
  · obtain ⟨p, hp⟩ := encodedSchedule_nonzero word hnonzero
    exact (hp (residual_period_seven (encodedSchedule word) hresidual p)).elim
  · obtain ⟨p, hp⟩ := encodedSchedule_nonzero word hnonzero
    exact (hp (residual_period_eight (encodedSchedule word) hresidual p)).elim
  · exact ⟨0, residual_nine_schedule_abundant word hresidual hnonzero⟩
  · obtain ⟨p, hp⟩ := encodedSchedule_nonzero word hnonzero
    exact (hp (residual_period_ten (encodedSchedule word) hresidual p)).elim

/-- Equivalent input form matching the local seven-start schedule API. -/
theorem residual_window_schedule_abundant {n : ℕ} [NeZero n]
    (hn : 7 ≤ n) (hn' : n ≤ 10) (word : ZMod n → Finset (Fin 4))
    (hresidual : ∀ start,
      List.ofFn (fun j : Fin 7 =>
        encodeLetter (FranklCyclic.windowSchedule word start 4 j)) ∈ residualEdges)
    (hnonzero : ∃ p, word p ≠ ∅) :
    ∃ x, FranklLocal.Abundant
      (FranklLocal.family (FranklCyclic.generatedTiles word)) x := by
  apply residual_schedule_abundant hn hn' word ?_ hnonzero
  intro start
  rw [encodedSchedule_window]
  exact hresidual start

end FranklSmallCyclic
