import Conjectures.LonelinessFiveSpeedBoundedCheckDefs

/-! Block composition for the exact bounded slope scan. The slope-list lemmas
allow separate certificates to reuse the original checker. The range checker
uses the same pair predicate, including its exact signed representative. -/

namespace Loneliness.FiveSpeedCertificate

theorem boundedSlopeScanCheck_nil (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ) (B : TwoParameterMap)
    (K : ℕ) (allowed : List (List ℕ)) :
    boundedSlopeScanCheck p₁ p₂ G₂ B K [] allowed = true := rfl

theorem boundedSlopeScanCheck_append (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ) (B : TwoParameterMap)
    (K : ℕ) (bad₁ bad₂ : List ℕ) (allowed : List (List ℕ)) :
    boundedSlopeScanCheck p₁ p₂ G₂ B K (bad₁ ++ bad₂) allowed =
      (boundedSlopeScanCheck p₁ p₂ G₂ B K bad₁ allowed &&
        boundedSlopeScanCheck p₁ p₂ G₂ B K bad₂ allowed) := by
  simp only [boundedSlopeScanCheck, List.all_append]

theorem boundedSlopeScanCheck_append_true (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ)
    (B : TwoParameterMap) (K : ℕ) (bad₁ bad₂ : List ℕ) (allowed : List (List ℕ))
    (h₁ : boundedSlopeScanCheck p₁ p₂ G₂ B K bad₁ allowed = true)
    (h₂ : boundedSlopeScanCheck p₁ p₂ G₂ B K bad₂ allowed = true) :
    boundedSlopeScanCheck p₁ p₂ G₂ B K (bad₁ ++ bad₂) allowed = true := by
  rw [boundedSlopeScanCheck_append, h₁, h₂]
  rfl

theorem boundedSlopeScanCheck_flatten (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ)
    (B : TwoParameterMap) (K : ℕ) (blocks : List (List ℕ))
    (allowed : List (List ℕ)) :
    boundedSlopeScanCheck p₁ p₂ G₂ B K blocks.flatten allowed =
      blocks.all (fun bad => boundedSlopeScanCheck p₁ p₂ G₂ B K bad allowed) := by
  simp only [boundedSlopeScanCheck, List.all_flatten]

/-- Check the original pair predicate on one interval of first parameters. -/
def boundedSlopeRangeCheck (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ) (B : TwoParameterMap)
    (K : ℕ) (bad : List ℕ) (allowed : List (List ℕ)) (start count : ℕ) : Bool :=
  bad.all fun r =>
    (List.range' start count).all (boundedSlopePairCheck p₁ p₂ G₂ B K allowed r)

theorem boundedSlopeRangeCheck_zero (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ) (B : TwoParameterMap)
    (K : ℕ) (bad : List ℕ) (allowed : List (List ℕ)) (start : ℕ) :
    boundedSlopeRangeCheck p₁ p₂ G₂ B K bad allowed start 0 = true := by
  simp [boundedSlopeRangeCheck]

theorem boundedSlopeRangeCheck_bad_append (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ)
    (B : TwoParameterMap) (K : ℕ) (bad₁ bad₂ : List ℕ)
    (allowed : List (List ℕ)) (start count : ℕ) :
    boundedSlopeRangeCheck p₁ p₂ G₂ B K (bad₁ ++ bad₂) allowed start count =
      (boundedSlopeRangeCheck p₁ p₂ G₂ B K bad₁ allowed start count &&
        boundedSlopeRangeCheck p₁ p₂ G₂ B K bad₂ allowed start count) := by
  simp only [boundedSlopeRangeCheck, List.all_append]

theorem boundedSlopeRangeCheck_bad_append_true (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ)
    (B : TwoParameterMap) (K : ℕ) (bad₁ bad₂ : List ℕ)
    (allowed : List (List ℕ)) (start count : ℕ)
    (h₁ : boundedSlopeRangeCheck p₁ p₂ G₂ B K bad₁ allowed start count = true)
    (h₂ : boundedSlopeRangeCheck p₁ p₂ G₂ B K bad₂ allowed start count = true) :
    boundedSlopeRangeCheck p₁ p₂ G₂ B K (bad₁ ++ bad₂) allowed start count = true := by
  rw [boundedSlopeRangeCheck_bad_append, h₁, h₂]
  rfl

theorem boundedSlopeRangeCheck_append (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ)
    (B : TwoParameterMap) (K : ℕ) (bad : List ℕ)
    (allowed : List (List ℕ)) (start count₁ count₂ : ℕ) :
    boundedSlopeRangeCheck p₁ p₂ G₂ B K bad allowed start (count₁ + count₂) =
      (boundedSlopeRangeCheck p₁ p₂ G₂ B K bad allowed start count₁ &&
        boundedSlopeRangeCheck p₁ p₂ G₂ B K bad allowed (start + count₁) count₂) := by
  apply Bool.eq_iff_iff.mpr
  simp only [boundedSlopeRangeCheck, ← List.range'_append_1, List.all_append,
    Bool.and_eq_true_iff, List.all_eq_true, forall_and]

theorem boundedSlopeRangeCheck_append_true (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ)
    (B : TwoParameterMap) (K : ℕ) (bad : List ℕ)
    (allowed : List (List ℕ)) (start count₁ count₂ : ℕ)
    (h₁ : boundedSlopeRangeCheck p₁ p₂ G₂ B K bad allowed start count₁ = true)
    (h₂ : boundedSlopeRangeCheck p₁ p₂ G₂ B K bad allowed
      (start + count₁) count₂ = true) :
    boundedSlopeRangeCheck p₁ p₂ G₂ B K bad allowed start (count₁ + count₂) = true := by
  rw [boundedSlopeRangeCheck_append, h₁, h₂]
  rfl

theorem boundedSlopeRangeCheck_full (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ) (B : TwoParameterMap)
    (K : ℕ) (bad : List ℕ) (allowed : List (List ℕ)) :
    boundedSlopeRangeCheck p₁ p₂ G₂ B K bad allowed 0 (K + 1) =
      boundedSlopeScanCheck p₁ p₂ G₂ B K bad allowed := by
  simp only [boundedSlopeRangeCheck, boundedSlopeScanCheck, List.range_eq_range']

theorem boundedSlopeScanCheck_of_full_range (p₁ p₂ : ℕ) (G₂ : ℕ → ℕ)
    (B : TwoParameterMap) (K : ℕ) (bad : List ℕ) (allowed : List (List ℕ))
    (h : boundedSlopeRangeCheck p₁ p₂ G₂ B K bad allowed 0 (K + 1) = true) :
    boundedSlopeScanCheck p₁ p₂ G₂ B K bad allowed = true := by
  rwa [boundedSlopeRangeCheck_full] at h

end Loneliness.FiveSpeedCertificate
