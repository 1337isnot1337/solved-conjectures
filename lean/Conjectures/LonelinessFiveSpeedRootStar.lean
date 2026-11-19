import Conjectures.LonelinessFiveSpeedRootMaskScan
import Conjectures.LonelinessFiveSpeedRootSemanticsDefs

/-! A finite root cover using only the pair-ratio constraints incident to
the normalized coordinates 1 and b. Omitting the other pair constraints
enlarges the checked set and permits direct lookup without a ratio matrix. -/

namespace Loneliness.FiveSpeedCertificate

open Loneliness.FiveSpeedRoot

def rootStarRatio (p : ℕ) (inv : ℕ → ℕ) (x y : ℕ) : ℕ :=
  min (foldResidue p (inv x * y)) (foldResidue p (inv y * x))

def rootStarEligible (p : ℕ) (inv : ℕ → ℕ) (b x : ℕ) : Bool :=
  decide (b < x ∧ b ≤ rootStarRatio p inv 1 x ∧ b ≤ rootStarRatio p inv b x)

def rootStarValues (p : ℕ) (inv : ℕ → ℕ) (b : ℕ) : List ℕ :=
  (List.range (p / 2 + 1)).filter (rootStarEligible p inv b)

def rootStarEligibleMask (p : ℕ) (inv : ℕ → ℕ) (b : ℕ) : ℕ :=
  predicateMask (p / 2 + 1) (rootStarEligible p inv b)

theorem rootStarEligibleMask_testBit (p : ℕ) (inv : ℕ → ℕ) (b x : ℕ) :
    (rootStarEligibleMask p inv b).testBit x = true ↔
      x ≤ p / 2 ∧ b < x ∧ b ≤ rootStarRatio p inv 1 x ∧
      b ≤ rootStarRatio p inv b x := by
  rw [rootStarEligibleMask, predicateMask_testBit]
  simp only [rootStarEligible, decide_eq_true_eq, Nat.lt_succ_iff]

theorem rootStarValues_mem (p : ℕ) (inv : ℕ → ℕ) (b x : ℕ) :
    x ∈ rootStarValues p inv b ↔ (rootStarEligibleMask p inv b).testBit x = true := by
  simp only [rootStarValues, List.mem_filter, List.mem_range,
    rootStarEligibleMask, predicateMask_testBit]

def rootStarAfterMask (p eligible d : ℕ) : ℕ :=
  eraseMask p eligible (fullMask (d + 1))

theorem rootStarAfterMask_testBit (p eligible d e : ℕ) (he : e < p) :
    (rootStarAfterMask p eligible d).testBit e = true ↔
      eligible.testBit e = true ∧ d < e := by
  rw [rootStarAfterMask, eraseMask_testBit p eligible (fullMask (d + 1)) e he,
    fullMask_testBit]
  constructor
  · rintro ⟨hbit, hafter⟩
    refine ⟨hbit, ?_⟩
    by_contra hde
    have hsmall : e < d + 1 := by omega
    simp [hsmall] at hafter
  · rintro ⟨hbit, hde⟩
    refine ⟨hbit, ?_⟩
    have hsmall : ¬e < d + 1 := by omega
    simp [hsmall]

def rootStarBaseCheck (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b : ℕ) : Bool :=
  if 2 ≤ b ∧ b ≤ p / 2 ∧ b ≤ rootStarRatio p inv 1 b then
    let values := rootStarValues p inv b
    let eligible := rootStarEligibleMask p inv b
    values.all (fun c => values.all (fun d => if c < d then
      rootPrefixCheck p G b c d (rootStarAfterMask p eligible d) (leaf b c d)
      else true))
  else true

theorem rootStarBaseCheck_sound (p : ℕ) (G inv : ℕ → ℕ)
    (leaf : ℕ → ℕ → ℕ → ℕ → Bool) (b c d e : ℕ)
    (hG : ∀ a, GoodMask p a (G a))
    (hcheck : rootStarBaseCheck p G inv leaf b = true)
    (hb : 2 ≤ b ∧ b ≤ p / 2 ∧ b ≤ rootStarRatio p inv 1 b)
    (hc : (rootStarEligibleMask p inv b).testBit c = true)
    (hd : (rootStarEligibleMask p inv b).testBit d = true)
    (he : (rootStarEligibleMask p inv b).testBit e = true)
    (hcd : c < d) (hde : d < e) :
    PrefixWitness p b c d e ∨ leaf b c d e = true := by
  have he_bound := (rootStarEligibleMask_testBit p inv b e).mp he
  have hep : e < p := by omega
  have hebit : (rootStarAfterMask p (rootStarEligibleMask p inv b) d).testBit e = true :=
    (rootStarAfterMask_testBit p _ d e hep).mpr ⟨he, hde⟩
  have hall : ∀ c ∈ rootStarValues p inv b, ∀ d ∈ rootStarValues p inv b,
      (if c < d then rootPrefixCheck p G b c d
        (rootStarAfterMask p (rootStarEligibleMask p inv b) d) (leaf b c d)
      else true) = true := by
    simpa only [rootStarBaseCheck, ite_eq_left hb, List.all_eq_true] using hcheck
  have hprefix := hall c ((rootStarValues_mem p inv b c).mpr hc)
    d ((rootStarValues_mem p inv b d).mpr hd)
  apply rootPrefixCheck_sound p G b c d _ (leaf b c d) hG _ e hep he_bound.1 hebit
  simpa only [ite_eq_left hcd] using hprefix

def rootQuintuple (b c d e : ℕ) : Fin 5 → ℕ := ![1, b, c, d, e]

def rootStarLeaf (p b c d e : ℕ) : Bool :=
  rootStructuralCheck p (rootQuintuple b c d e)

theorem prefixWitness_hasWitness (p b c d e : ℕ)
    (h : PrefixWitness p b c d e) :
    Loneliness.Modular.HasWitness 5 p (List.ofFn (rootQuintuple b c d e)) := by
  obtain ⟨t, _, ht⟩ := h
  exact ⟨t, ht⟩

theorem normalizedQuintuple_half (p : ℕ) (inv : ℕ → ℕ) (q : Speeds)
    (hq : NormalizedQuintuple p inv q) (i : Fin 5) : q i ≤ p / 2 := by
  have hle : q i ≤ q 4 := hq.2.1.monotone (by omega)
  have hlast := hq.2.2.1
  omega

theorem normalizedQuintuple_starRatio (p : ℕ) (inv : ℕ → ℕ) (q : Speeds)
    (hq : NormalizedQuintuple p inv q) (i j : Fin 5) (hij : i ≠ j) :
    q 1 ≤ rootStarRatio p inv (q i) (q j) := by
  exact le_min (hq.2.2.2 i j hij) (hq.2.2.2 j i hij.symm)

theorem normalizedRootCover_of_rootStarChecks (p : ℕ) (G inv : ℕ → ℕ)
    (hG : ∀ a, GoodMask p a (G a))
    (hcheck : ∀ b, b ≤ p / 2 → rootStarBaseCheck p G inv (rootStarLeaf p) b = true) :
    NormalizedRootCover p inv := by
  intro q hq
  have h01 : q 0 < q 1 := hq.2.1 (by decide)
  have hb : 2 ≤ q 1 ∧ q 1 ≤ p / 2 ∧ q 1 ≤ rootStarRatio p inv 1 (q 1) := by
    refine ⟨by rw [hq.1] at h01; omega, normalizedQuintuple_half p inv q hq 1, ?_⟩
    simpa only [hq.1] using normalizedQuintuple_starRatio p inv q hq 0 1 (by decide)
  have heligible (i : Fin 5) (hi : 1 < i) :
      (rootStarEligibleMask p inv (q 1)).testBit (q i) = true := by
    apply (rootStarEligibleMask_testBit p inv (q 1) (q i)).mpr
    refine ⟨normalizedQuintuple_half p inv q hq i, hq.2.1 hi, ?_, ?_⟩
    · simpa only [hq.1] using
        normalizedQuintuple_starRatio p inv q hq 0 i (by omega)
    · exact normalizedQuintuple_starRatio p inv q hq 1 i (by omega)
  have heq : rootQuintuple (q 1) (q 2) (q 3) (q 4) = q := by
    funext i
    fin_cases i <;> simp [rootQuintuple, hq.1]
  have hcover := rootStarBaseCheck_sound p G inv (rootStarLeaf p)
    (q 1) (q 2) (q 3) (q 4) hG (hcheck (q 1) hb.2.1) hb
    (heligible 2 (by decide)) (heligible 3 (by decide)) (heligible 4 (by decide))
    (hq.2.1 (by decide)) (hq.2.1 (by decide))
  rcases hcover with hw | hs
  · have h := prefixWitness_hasWitness p (q 1) (q 2) (q 3) (q 4) hw
    exact Or.inl (heq ▸ h)
  · apply Or.inr
    have h := rootStructuralCheck_sound p (rootQuintuple (q 1) (q 2) (q 3) (q 4)) hs
    exact heq ▸ h

def rootStarAllCheck (p : ℕ) (G inv : ℕ → ℕ) : Bool :=
  (List.range (p / 2 + 1)).all (rootStarBaseCheck p G inv (rootStarLeaf p))

theorem normalizedRootCover_of_rootStarCheck (p : ℕ) (G inv : ℕ → ℕ)
    (hG : ∀ a, GoodMask p a (G a)) (hcheck : rootStarAllCheck p G inv = true) :
    NormalizedRootCover p inv := by
  apply normalizedRootCover_of_rootStarChecks p G inv hG
  intro b hb
  have hall := List.all_eq_true.mp hcheck
  exact hall b (List.mem_range.mpr (by omega))

end Loneliness.FiveSpeedCertificate
