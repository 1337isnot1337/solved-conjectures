import Conjectures.LonelinessSevenCoordinateLargeNorm
import Conjectures.LonelinessSevenCoordinateProductSpeeds
import Conjectures.LonelinessProductFamilySeven
import Conjectures.LonelinessModularDirections

/-! The literal large-norm seven-speed conclusion. The rational plane,
integer scale, free speed, gcd transfer, and real loneliness value are all
obtained from the preceding constructions. The remaining mathematical
inputs are explicitly the five-speed bound and primitive six-speed
classification. -/

namespace Loneliness.SevenCoordinateCritical.Quantitative

open CoordinateSubspace

noncomputable section

/-- Every positive primitive tuple in the stated norm range with value
below one seventh is an actual permutation of the consecutive product
family, with its exact real-time loneliness value. -/
theorem large_norm_family_classification
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (hbelow : value (List.ofFn v) < (1/7 : ℝ))
    (hnorm : (7*42^10 : ℝ) ≤ ‖KZBasis.realVector (fun i => (v i : ℤ))‖) :
    ∃ s : ℕ, 1 ≤ s ∧ (List.ofFn v).Perm [1,2,3,4,5,6,7*s] ∧
      value (List.ofFn v) = (s : ℝ)/(7*(s : ℝ)+1) := by
  obtain ⟨E, hvE, _hfree, _hdim, _hvalueE, hproduct⟩ :=
    large_norm_critical_plane hfive hsix v hpositive hprimitive hbelow hnorm
  obtain ⟨A, b, hA, hb, hperm⟩ :=
    product_parameters_of_positive_direction E hproduct v hpositive hvE
  have hperm' : (List.ofFn v).Perm
      (ProductFamily.speeds ProductFamily.consecutiveSevenBase A b) := by
    simpa only [sixBase, ProductFamily.consecutiveSevenBase] using hperm
  have hprimitive' :
      Normalization.gcd (ProductFamily.speeds ProductFamily.consecutiveSevenBase A b) = 1 :=
    (Modular.list_gcd_eq_of_perm hperm').symm.trans hprimitive
  have hvalue : value (List.ofFn v) =
      value (ProductFamily.speeds ProductFamily.consecutiveSevenBase A b) :=
    CriticalFamilies.value_perm hperm'
  obtain ⟨s, hs, hAone, hbvalue, hfamilyValue⟩ :=
    ProductFamily.consecutive_seven_product_classification A b hA hb hprimitive'
      (by rw [← hvalue]; exact hbelow)
  refine ⟨s, hs, ?_, ?_⟩
  · simpa [hAone, hbvalue, ProductFamily.speeds,
      ProductFamily.consecutiveSevenBase] using hperm'
  · simpa only [ProductFamily.standardSevenValue] using hvalue.trans hfamilyValue

theorem large_norm_family_iff
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (hnorm : (7*42^10 : ℝ) ≤ ‖KZBasis.realVector (fun i => (v i : ℤ))‖) :
    value (List.ofFn v) < (1/7 : ℝ) ↔
      ∃ s : ℕ, 1 ≤ s ∧ (List.ofFn v).Perm [1,2,3,4,5,6,7*s] := by
  constructor
  · intro hbelow
    obtain ⟨s, hs, hperm, _⟩ :=
      large_norm_family_classification hfive hsix v hpositive hprimitive hbelow hnorm
    exact ⟨s, hs, hperm⟩
  · rintro ⟨s, hs, hperm⟩
    have hfamily : value [1,2,3,4,5,6,7*s] = ProductFamily.standardSevenValue s := by
      simpa only [ProductFamily.consecutiveSevenBase, List.cons_append,
        List.nil_append] using ProductFamily.consecutive_seven_values s hs
    rw [CriticalFamilies.value_perm hperm, hfamily]
    exact ProductFamily.standardSevenValue_lt s

theorem large_norm_spectrum
    (hfive : LonelyRunnerBound 5) (hsix : PrimitiveSixClassification)
    (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : Normalization.gcd (List.ofFn v) = 1)
    (hbelow : value (List.ofFn v) < (1/7 : ℝ))
    (hnorm : (7*42^10 : ℝ) ≤ ‖KZBasis.realVector (fun i => (v i : ℤ))‖) :
    ∃ s : ℕ, 1 ≤ s ∧ value (List.ofFn v) = (s : ℝ)/(7*(s : ℝ)+1) := by
  obtain ⟨s, hs, _, hvalue⟩ :=
    large_norm_family_classification hfive hsix v hpositive hprimitive hbelow hnorm
  exact ⟨s, hs, hvalue⟩

end

end Loneliness.SevenCoordinateCritical.Quantitative
