import Conjectures.LonelinessFourSpeedCutoff
import Conjectures.LonelinessPlaneClassificationCore
import Conjectures.LonelinessProductSpectrum

/-! The five-speed finite/infinite reduction from elementary pigeonholing.
Both the four-speed gap and the exact finite-pattern coverage statement are
explicit parameters. The final cutoff module supplies the finite coverage. -/

namespace Loneliness.Pigeonhole

open CoordinateSubspace SubspaceDensity PlaneCertificate

theorem five_speed_cutoff_last_of_checked (hchecked : CandidatePairsChecked)
    (hgap : FourSpeedGap) (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : value (List.ofFn v) < (1 / 5 : ℝ))
    (hnot : ¬CriticalFamilies.SpectrumForm (List.ofFn v)) :
    v (Fin.last 4) ≤ 279841 := by
  by_contra hn
  have hlarge : (23 : ℕ) ^ 4 < v (Fin.last 4) := by
    norm_num
    exact Nat.lt_of_not_ge hn
  obtain ⟨F, hdim, hfree, hvF, hbound⟩ :=
    approximation_plane (n := 4) v hpositive hprimitive 23 (by decide) hlarge
  have hFbelow : spaceValue (realSpan F) < (2 / 9 : ℝ) := by
    change spaceValue (realSpan F) ≤ value (List.ofFn v) + 1 / (2 * (23 : ℝ)) at hbound
    norm_num only at hbound
    linarith
  have hproduct := critical_product_of_low_value_of_checked hchecked hgap F hfree hdim hFbelow
  let w : Vector := fun i => (v i : ℤ)
  have hwF : (fun i => (w i : ℚ)) ∈ F := by
    simpa only [w, Int.cast_natCast] using hvF
  have hwzero : ∀ i, w i ≠ 0 := by
    intro i
    change (v i : ℤ) ≠ 0
    exact_mod_cast (ne_of_gt (hpositive i))
  have hvalue : value (integerSpeeds w) = value (List.ofFn v) := by
    apply CriticalFamilies.value_eq_of_mem
    intro a
    simp only [mem_integerSpeeds, w, Int.natAbs_natCast, List.mem_ofFn]
  have hspec := spectrum_in_critical_product F hproduct w hwF hwzero
    (by simpa only [hvalue] using hbelow)
  apply hnot
  simpa only [CriticalFamilies.SpectrumForm, hvalue] using hspec

theorem five_speed_cutoff_of_checked (hchecked : CandidatePairsChecked)
    (hgap : FourSpeedGap) (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : value (List.ofFn v) < (1 / 5 : ℝ))
    (hnot : ¬CriticalFamilies.SpectrumForm (List.ofFn v)) :
    ∀ i, v i ≤ 279841 := by
  intro i
  let p : Equiv.Perm (Fin 5) := Equiv.swap i (Fin.last 4)
  let u : Fin 5 → ℕ := v ∘ p
  have hperm : (List.ofFn u).Perm (List.ofFn v) := p.ofFn_comp_perm v
  have huprimitive : (List.ofFn u).foldr Nat.gcd 0 = 1 :=
    (foldr_gcd_eq_of_perm hperm).trans hprimitive
  have huvalue : value (List.ofFn u) = value (List.ofFn v) := CriticalFamilies.value_perm hperm
  have hunot : ¬CriticalFamilies.SpectrumForm (List.ofFn u) := by
    intro hspec
    apply hnot
    simpa only [CriticalFamilies.SpectrumForm, huvalue] using hspec
  have hlast := five_speed_cutoff_last_of_checked hchecked hgap u (fun k => hpositive (p k)) huprimitive
    (by simpa only [huvalue] using hbelow) hunot
  simpa [u, p] using hlast

theorem five_speed_finite_or_spectrum_of_checked (hchecked : CandidatePairsChecked)
    (hgap : FourSpeedGap) (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : value (List.ofFn v) < (1 / 5 : ℝ)) :
    (∀ i, v i ≤ 279841) ∨ CriticalFamilies.SpectrumForm (List.ofFn v) := by
  by_cases hspec : CriticalFamilies.SpectrumForm (List.ofFn v)
  · exact Or.inr hspec
  · exact Or.inl (five_speed_cutoff_of_checked hchecked hgap v hpositive hprimitive hbelow hspec)

end Loneliness.Pigeonhole
