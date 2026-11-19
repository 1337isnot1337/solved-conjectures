import Conjectures.BinaryDecision
import Conjectures.BinaryEncoding
import Conjectures.CutFamily

/-! Necessary and sufficient finite mex tests when exact finite recognizers
are supplied. Constructing those recognizers for every proposed arithmetic
tail is a separate part of the general CUT algorithm. -/
namespace CutPeriod.Decision
open BinaryAutomata CutFamily

theorem satisfiesMex_iff_finite_tests {Q R S : Type}
    [Fintype Q] [Fintype R] [Fintype S]
    (cuts : Set Nat) (f : Nat → Nat)
    (graph : BinaryAutomata.DFA Q) (lower : BinaryAutomata.DFA R) (options : BinaryAutomata.DFA S)
    (hgraph : ∀ w, graph.accepts w=true ↔
      0<decodeHigh sizeBit w ∧ decodeHigh valueBit w=f (decodeHigh sizeBit w))
    (hlower : ∀ w, lower.accepts w=true ↔
      0<decodeHigh sizeBit w ∧ decodeHigh valueBit w<f (decodeHigh sizeBit w))
    (hoptions : ∀ w, options.accepts w=true ↔
      OptionValue cuts f (decodeHigh sizeBit w) (decodeHigh valueBit w)) :
    SatisfiesMex cuts f ↔
      (graph.product options (fun a b => a && b)).emptyCheck=true ∧
      (lower.product options (fun a b => a && !b)).emptyCheck=true := by
  rw [DFA.emptyCheck_correct,DFA.emptyCheck_correct]
  simp only [DFA.product_accepts]
  constructor
  · intro hmex
    constructor
    · intro w
      cases hg : graph.accepts w <;> cases ho : options.accepts w <;> try rfl
      exfalso
      obtain ⟨hn,hv⟩ := (hgraph w).mp hg
      have hop := (hoptions w).mp ho
      rw [hv] at hop
      exact (hmex _ hn).1 hop
    · intro w
      cases hl : lower.accepts w <;> cases ho : options.accepts w <;> try rfl
      exfalso
      obtain ⟨hn,hv⟩ := (hlower w).mp hl
      have hop := (hmex _ hn).2 _ hv
      have ho' := (hoptions w).mpr hop
      rw [ho] at ho'
      contradiction
  · rintro ⟨hcollision,hmissing⟩ n hn
    constructor
    · intro hop
      obtain ⟨w,hwN,hwG⟩ := exists_encoding n (f n)
      have hg : graph.accepts w=true :=
        (hgraph w).mpr (by rw [hwN,hwG]; exact ⟨hn,rfl⟩)
      have ho : options.accepts w=true :=
        (hoptions w).mpr (by rw [hwN,hwG]; exact hop)
      have hbad := hcollision w
      simp only [hg,ho,Bool.true_and] at hbad
      contradiction
    · intro g hg
      obtain ⟨w,hwN,hwG⟩ := exists_encoding n g
      have hl : lower.accepts w=true :=
        (hlower w).mpr (by rw [hwN,hwG]; exact ⟨hn,hg⟩)
      have hbad := hmissing w
      rw [hl,Bool.true_and] at hbad
      have ho : options.accepts w=true := by cases he : options.accepts w <;> simp_all
      have hop := (hoptions w).mp ho
      simpa only [hwN,hwG] using hop

#print axioms satisfiesMex_iff_finite_tests
end CutPeriod.Decision
