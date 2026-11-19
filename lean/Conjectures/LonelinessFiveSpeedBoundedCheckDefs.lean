import Conjectures.LonelinessFiveSpeedTupleMask
import Conjectures.LonelinessFiveSpeedBoundedSlopeRecovery
import Conjectures.LonelinessFiveSpeedCriticalCheck
import Conjectures.LonelinessModularDirections

/-! Exact checks for the remaining two-parameter maps. A first modular
slope cover reduces the bounded box to one signed lift per slope and first
parameter. A second modular witness or a literal terminal check handles
every primitive bounded lift. Only computable lists occur in the checks. -/

namespace Loneliness.FiveSpeedCertificate

open Matrix
open scoped Matrix
open Loneliness.CoordinateSubspace Loneliness.CriticalFamilies

theorem tupleMaskWitnessCheck_integerSpeeds (p : ℕ) (G : ℕ → ℕ) (v : FiveIntegerVector)
    (hG : ∀ a, GoodMask p a (G a))
    (hcheck : tupleMaskWitnessCheck p G (Modular.absoluteSpeeds v) = true) :
    Modular.HasWitness 5 p (integerSpeeds v) := by
  obtain ⟨t, ht⟩ := tupleMaskWitnessCheck_sound p G (Modular.absoluteSpeeds v) hG hcheck
  refine ⟨t, (witness_integerSpeeds_iff p t v).mpr ?_⟩
  intro j
  exact ht _ (List.mem_ofFn.mpr ⟨j, rfl⟩)

def slopeMaskWitnessCheck (p : ℕ) (G : ℕ → ℕ) (B : TwoParameterMap) (r : ℕ) : Bool :=
  tupleMaskWitnessCheck p G (Modular.absoluteSpeeds (B *ᵥ ![1, (r : ℤ)]))

theorem slopeMaskWitnessCheck_sound (p : ℕ) (G : ℕ → ℕ) (B : TwoParameterMap) (r : ℕ)
    (hG : ∀ a, GoodMask p a (G a))
    (hcheck : slopeMaskWitnessCheck p G B r = true) :
    Modular.HasWitness 5 p (slopeSpeeds B r) :=
  tupleMaskWitnessCheck_integerSpeeds p G _ hG hcheck

def slopeCoverCheck (p : ℕ) (G : ℕ → ℕ) (B : TwoParameterMap) (bad : List ℕ) : Bool :=
  (List.range p).all fun r => decide (r ∈ bad) || slopeMaskWitnessCheck p G B r

theorem slopeCoverCheck_sound (p : ℕ) (G : ℕ → ℕ) (B : TwoParameterMap) (bad : List ℕ)
    (hG : ∀ a, GoodMask p a (G a)) (hcheck : slopeCoverCheck p G B bad = true)
    (r : ℕ) (hr : r < p) : r ∈ bad ∨ Modular.HasWitness 5 p (slopeSpeeds B r) := by
  have hall := List.all_eq_true.mp hcheck
  rcases Bool.or_eq_true_iff.mp (hall r (List.mem_range.mpr hr)) with hb | hw
  · exact Or.inl (of_decide_eq_true hb)
  · exact Or.inr (slopeMaskWitnessCheck_sound p G B r hG hw)

theorem containsCriticalCheck_absolute_sound (v : FiveIntegerVector)
    (hcheck : containsCriticalCheck (Modular.absoluteSpeeds v) = true) :
    ContainsCriticalQuadruple (integerSpeeds v) := by
  obtain ⟨d, hd, hbase⟩ := (containsCriticalCheck_iff _).mp hcheck
  have hmem (a : ℕ) (ha : a ∈ Modular.absoluteSpeeds v) : a ∈ integerSpeeds v :=
    (mem_integerSpeeds v a).mpr (List.mem_ofFn.mp ha)
  refine ⟨d, hd, ?_⟩
  rcases hbase with h | h
  · exact Or.inl (fun a ha => hmem a (h ha))
  · exact Or.inr (fun a ha => hmem a (h ha))

def boundedTerminalCheck (allowed : List (List ℕ)) (v : FiveIntegerVector) : Bool :=
  decide (∃ i : Fin 5, v i = 0) ||
    (decide (∃ i j : Fin 5, i ≠ j ∧ (v i).natAbs = (v j).natAbs) ||
      (containsCriticalCheck (Modular.absoluteSpeeds v) ||
        decide (Modular.primitiveDirection v ∈ allowed)))

theorem boundedTerminalCheck_sound (allowed : List (List ℕ)) (v : FiveIntegerVector)
    (hcheck : boundedTerminalCheck allowed v = true)
    (hnonzero : ∀ i, v i ≠ 0)
    (hdistinct : Function.Injective (fun i => (v i).natAbs))
    (hnot : ¬ContainsCriticalQuadruple (integerSpeeds v)) :
    Modular.primitiveDirection v ∈ allowed := by
  rcases Bool.or_eq_true_iff.mp hcheck with hz | hrest
  · obtain ⟨i, hi⟩ := of_decide_eq_true hz
    exact (hnonzero i hi).elim
  · rcases Bool.or_eq_true_iff.mp hrest with hd | hrest
    · obtain ⟨i, j, hij, he⟩ := of_decide_eq_true hd
      exact (hij (hdistinct he)).elim
    · rcases Bool.or_eq_true_iff.mp hrest with hc | ha
      · exact (hnot (containsCriticalCheck_absolute_sound v hc)).elim
      · exact of_decide_eq_true ha

def boundedSlopePairCheck (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ) (B : TwoParameterMap)
    (K : ℕ) (allowed : List (List ℕ)) (r x : ℕ) : Bool :=
  if 0 < x ∧ x ≤ K then
    let y := signedRepresentative p₁ (x * r)
    if y.natAbs ≤ K ∧ Nat.gcd x y.natAbs = 1 then
      let v := B *ᵥ ![(x : ℤ), y]
      tupleMaskWitnessCheck p₂ G₂ (Modular.absoluteSpeeds v) || boundedTerminalCheck allowed v
    else true
  else true

def boundedSlopeScanCheck (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ) (B : TwoParameterMap)
    (K : ℕ) (bad : List ℕ) (allowed : List (List ℕ)) : Bool :=
  bad.all fun r => (List.range (K + 1)).all (boundedSlopePairCheck p₁ p₂ G₂ B K allowed r)

theorem boundedSlopeScanCheck_candidates (p₁ p₂ : ℕ) (G₁ G₂ : ℕ → ℕ)
    (B : TwoParameterMap) (K : ℕ) (bad : List ℕ) (allowed : List (List ℕ))
    (hp₁ : p₁.Prime) (hp₂ : 0 < p₂) (hK : 2 * K < p₁)
    (hG₁ : ∀ a, GoodMask p₁ a (G₁ a)) (hG₂ : ∀ a, GoodMask p₂ a (G₂ a))
    (hslopes : slopeCoverCheck p₁ G₁ B bad = true)
    (hpairs : boundedSlopeScanCheck p₁ p₂ G₂ B K bad allowed = true)
    (x : ℕ) (hx : 0 < x) (hxK : x ≤ K) (y : ℤ) (hy : y.natAbs ≤ K)
    (hcop : Nat.gcd x y.natAbs = 1)
    (hnonzero : ∀ i, (B *ᵥ ![(x : ℤ), y]) i ≠ 0)
    (hdistinct : Function.Injective (fun i => ((B *ᵥ ![(x : ℤ), y]) i).natAbs))
    (hnot : ¬ContainsCriticalQuadruple (integerSpeeds (B *ᵥ ![(x : ℤ), y])))
    (hlow : value (integerSpeeds (B *ᵥ ![(x : ℤ), y])) < (1 / 5 : ℝ)) :
    Modular.primitiveDirection (B *ᵥ ![(x : ℤ), y]) ∈ allowed := by
  have hxp : x < p₁ := by omega
  let r := slopeResidue p₁ x y
  have hr : r ∈ bad := by
    rcases slopeCoverCheck_sound p₁ G₁ B bad hG₁ hslopes r
      (slopeResidue_lt p₁ x y hp₁.pos) with hr | hw
    · exact hr
    · exact (no_slopeWitness_of_value_lt p₁ hp₁ B x hx hxp y hlow hw).elim
  have hrecovery : signedRepresentative p₁ (x * r) = y :=
    (slope_signedRepresentative_recover p₁ hp₁ K x hK hx hxp y hy).symm
  have hall : ∀ r ∈ bad, ∀ x ∈ List.range (K + 1),
      boundedSlopePairCheck p₁ p₂ G₂ B K allowed r x = true := by
    simpa only [boundedSlopeScanCheck, List.all_eq_true] using hpairs
  have hpair := hall r hr x (List.mem_range.mpr (by omega))
  have hchecked : (tupleMaskWitnessCheck p₂ G₂
      (Modular.absoluteSpeeds (B *ᵥ ![(x : ℤ), y])) ||
      boundedTerminalCheck allowed (B *ᵥ ![(x : ℤ), y])) = true := by
    simpa only [boundedSlopePairCheck, ite_eq_left (show 0 < x ∧ x ≤ K from ⟨hx, hxK⟩),
      hrecovery, ite_eq_left (show y.natAbs ≤ K ∧ Nat.gcd x y.natAbs = 1 from ⟨hy, hcop⟩)]
      using hpair
  rcases Bool.or_eq_true_iff.mp hchecked with hw | ht
  · obtain ⟨t, ht⟩ := tupleMaskWitnessCheck_integerSpeeds p₂ G₂ _ hG₂ hw
    have hbound := Modular.witness_value_lower (by decide : 2 ≤ 5) hp₂ ht
    exact (not_le_of_gt hlow hbound).elim
  · exact boundedTerminalCheck_sound allowed _ ht hnonzero hdistinct hnot

end Loneliness.FiveSpeedCertificate
