import Conjectures.LonelinessFiveSpeedReduction
import Conjectures.LonelinessPlaneClassification

/-! The five-speed finite/infinite reduction obtained from elementary
pigeonholing. The four-speed gap is an explicit input. Finite critical-plane
coverage is supplied by all 64 kernel-checked certificate blocks. -/

namespace Loneliness.Pigeonhole

open CoordinateSubspace PlaneCertificate

theorem five_speed_cutoff_last (hgap : FourSpeedGap) (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : value (List.ofFn v) < (1 / 5 : ℝ))
    (hnot : ¬CriticalFamilies.SpectrumForm (List.ofFn v)) :
    v (Fin.last 4) ≤ 279841 :=
  five_speed_cutoff_last_of_checked all_candidates_checked hgap v hpositive hprimitive hbelow hnot

theorem five_speed_cutoff (hgap : FourSpeedGap) (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : value (List.ofFn v) < (1 / 5 : ℝ))
    (hnot : ¬CriticalFamilies.SpectrumForm (List.ofFn v)) :
    ∀ i, v i ≤ 279841 :=
  five_speed_cutoff_of_checked all_candidates_checked hgap v hpositive hprimitive hbelow hnot

theorem five_speed_finite_or_spectrum (hgap : FourSpeedGap) (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : value (List.ofFn v) < (1 / 5 : ℝ)) :
    (∀ i, v i ≤ 279841) ∨ CriticalFamilies.SpectrumForm (List.ofFn v) :=
  five_speed_finite_or_spectrum_of_checked all_candidates_checked hgap v hpositive hprimitive hbelow

end Loneliness.Pigeonhole
