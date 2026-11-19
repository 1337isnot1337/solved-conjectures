module

public import Conjectures.FranklSpanFourAdmissibleCore
public import Conjectures.FranklFCVaughan

/-! Vaughan and irredundancy imply the literal six-start admissibility test. -/
@[expose] public section

namespace FranklSpanFour

open FranklLocal FranklCyclic

variable {α : Type*} [DecidableEq α]

theorem vaughan_three_triples_shortcut (G : Finset (Finset α)) : ThreeTriplesShortcut G := by
  intro A B C p hAG hBG hCG hA hB hC hAB hAC hBC hpA hpB hpC
  have hu : Frankl.UnionClosed (family G) := by
    intro A hA B hB
    exact union_mem_family hA hB
  obtain ⟨x, _, hx⟩ := Frankl.Vaughan.three_triples_abundant hu
    (generator_mem_family hAG) (generator_mem_family hBG) (generator_mem_family hCG)
    hA hB hC hAB hAC hBC hpA hpB hpC
  exact ⟨x, hx⟩

section Cycle

variable {n : ℕ} [NeZero n]

theorem literal_six_window_admissible (hn : 7 ≤ n)
    (word : ZMod n → Finset (Fin 4)) (start : ZMod n)
    (hneed : NeededGenerators (generatedTiles word))
    (hno : ∀ x, ¬ Abundant (family (generatedTiles word)) x) :
    AdmissibleGenerators (localTiles 3 (windowSchedule word start 3)) :=
  literal_six_window_admissible_of_shortcut hn word start
    (vaughan_three_triples_shortcut (generatedTiles word)) hneed hno

/-- This is the six-start test on the exact normalized schedule of a literal
span-four generator family; no Vaughan premise remains exposed. -/
theorem normalized_six_window_admissible (hn : 7 ≤ n)
    (G : Finset (Finset (ZMod n))) (hspan : SpanFourGenerators G)
    (hlarge : ∀ g ∈ G, 3 ≤ g.card) (hneed : NeededGenerators G)
    (hno : ∀ x, ¬ Abundant (family G) x) (start : ZMod n) :
    AdmissibleGenerators (localTiles 3 (windowSchedule (scheduleFor G) start 3)) := by
  have hgen := generatedTiles_scheduleFor G hspan hlarge
  apply literal_six_window_admissible hn (scheduleFor G) start
  · rwa [hgen]
  · rwa [hgen]

theorem normalized_six_window_check (hn : 7 ≤ n)
    (G : Finset (Finset (ZMod n))) (hspan : SpanFourGenerators G)
    (hlarge : ∀ g ∈ G, 3 ≤ g.card) (hneed : NeededGenerators G)
    (hno : ∀ x, ¬ Abundant (family G) x) (start : ZMod n) :
    windowAdmissibleCheck 3 (windowSchedule (scheduleFor G) start 3) = true :=
  (windowAdmissibleCheck_eq_true 3 _).mpr
    (normalized_six_window_admissible hn G hspan hlarge hneed hno start)

/-- A counterexample would produce a nonzero cyclic schedule with exactly
the same distinct unions and with every six-start window admissible. -/
theorem counterexample_has_admissible_schedule (hn : 7 ≤ n)
    (G : Finset (Finset (ZMod n))) (hspan : SpanFourGenerators G)
    (hpos : ∃ g ∈ G, g.Nonempty) (hno : ∀ x, ¬ Abundant (family G) x) :
    ∃ word : ZMod n → Finset (Fin 4),
      family (generatedTiles word) = family G ∧ NeededGenerators (generatedTiles word) ∧
        (∃ p, word p ≠ ∅) ∧
          ∀ start, windowAdmissibleCheck 3 (windowSchedule word start 3) = true := by
  obtain ⟨H, hHG, hfamily, hneed, hlarge, hgen⟩ := needed_normalized_schedule G hspan hno
  have hspanH : SpanFourGenerators H := fun g hg => hspan g (hHG hg)
  have hnoH : ∀ x, ¬ Abundant (family H) x := by
    intro x hx
    exact hno x (by simpa only [hfamily] using hx)
  refine ⟨scheduleFor H, ?_, ?_, ?_, ?_⟩
  · rw [hgen]
    exact hfamily
  · rw [hgen]
    exact hneed
  · obtain ⟨g, hg, x, hx⟩ := hpos
    have hgf : g ∈ family H := by
      rw [hfamily]
      exact generator_mem_family hg
    obtain ⟨A, hAH, _, _⟩ := mem_family_iff_covered.mp hgf x hx
    have hAword : A ∈ generatedTiles (scheduleFor H) := by rwa [hgen]
    obtain ⟨p, t, ht, _⟩ := (mem_generatedTiles (scheduleFor H) A).mp hAword
    exact ⟨p, Finset.nonempty_iff_ne_empty.mp ⟨t, ht⟩⟩
  · intro start
    exact normalized_six_window_check hn H hspanH hlarge hneed hnoH start

end Cycle

end FranklSpanFour
