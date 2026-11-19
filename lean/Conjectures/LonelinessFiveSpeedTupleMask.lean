import Conjectures.LonelinessFiveSpeedRootMaskScan
import Conjectures.LonelinessModularWitness

/-! A common scalar-mask bit certifies a modular witness for an entire
speed list. The proposed bit position is checked before it is used. -/

namespace Loneliness.FiveSpeedCertificate

def tupleMaskWitnessCheck (p : ℕ) (G : ℕ → ℕ) (speeds : List ℕ) : Bool :=
  let common := andMasks p (speeds.map G)
  let t := proposedFirstBit common
  decide (t < p) && common.testBit t

theorem tupleMaskWitnessCheck_sound (p : ℕ) (G : ℕ → ℕ) (speeds : List ℕ)
    (hG : ∀ a, GoodMask p a (G a))
    (hcheck : tupleMaskWitnessCheck p G speeds = true) :
    Loneliness.Modular.HasWitness 5 p speeds := by
  let common := andMasks p (speeds.map G)
  let t := proposedFirstBit common
  have hh : t < p ∧ common.testBit t = true := by
    simpa only [tupleMaskWitnessCheck, Bool.and_eq_true, decide_eq_true_eq] using hcheck
  have hbits := (andMasks_testBit p (speeds.map G) t).mp hh.2
  refine ⟨t, ?_⟩
  intro a ha
  change good p t a
  apply (good_comm p a t).mp
  exact ((hG a).2 t hh.1).mp (hbits.2 (G a) (List.mem_map.mpr ⟨a, ha, rfl⟩))

theorem tupleMaskWitnessCheck_value (p : ℕ) (G : ℕ → ℕ) (speeds : List ℕ)
    (hp : 0 < p) (hG : ∀ a, GoodMask p a (G a))
    (hcheck : tupleMaskWitnessCheck p G speeds = true) :
    (1 / 5 : ℝ) ≤ Loneliness.value speeds := by
  obtain ⟨t, ht⟩ := tupleMaskWitnessCheck_sound p G speeds hG hcheck
  exact Loneliness.Modular.witness_value_lower (by decide) hp ht

end Loneliness.FiveSpeedCertificate
