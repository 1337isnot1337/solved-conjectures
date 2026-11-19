import Conjectures.LonelinessFourSpeedCutoff
import Conjectures.LonelinessPlaneClassification
import Conjectures.LonelinessPlaneProductFamily

/-! The structural finite/infinite reduction for five speeds. A primitive
positive tuple below one fifth either has bounded coordinates or contains a
positive integer dilation of a critical quadruple. -/

namespace Loneliness.Pigeonhole

open CoordinateSubspace SubspaceDensity PlaneCertificate CriticalFamilies

theorem five_speed_family_cutoff_last (hgap : FourSpeedGap) (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : value (List.ofFn v) < (1 / 5 : ℝ))
    (hnot : ¬ContainsCriticalQuadruple (List.ofFn v)) :
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
  have hproduct := critical_product_of_low_value hgap F hfree hdim hFbelow
  let w : Vector := fun i => (v i : ℤ)
  have hwF : (fun i => (w i : ℚ)) ∈ F := by
    simpa only [w, Int.cast_natCast] using hvF
  have hwzero : ∀ i, w i ≠ 0 := by
    intro i
    change (v i : ℤ) ≠ 0
    exact_mod_cast (ne_of_gt (hpositive i))
  have hcrit := critical_quadruple_in_critical_product F hproduct w hwF hwzero
  apply hnot
  apply containsCriticalQuadruple_of_subset (ds := integerSpeeds w) ?_ hcrit
  intro a ha
  simpa only [mem_integerSpeeds, w, Int.natAbs_natCast, List.mem_ofFn] using ha

theorem five_speed_family_cutoff (hgap : FourSpeedGap) (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : value (List.ofFn v) < (1 / 5 : ℝ))
    (hnot : ¬ContainsCriticalQuadruple (List.ofFn v)) :
    ∀ i, v i ≤ 279841 := by
  intro i
  let p : Equiv.Perm (Fin 5) := Equiv.swap i (Fin.last 4)
  let u : Fin 5 → ℕ := v ∘ p
  have hperm : (List.ofFn u).Perm (List.ofFn v) := p.ofFn_comp_perm v
  have huprimitive : (List.ofFn u).foldr Nat.gcd 0 = 1 :=
    (foldr_gcd_eq_of_perm hperm).trans hprimitive
  have huvalue : value (List.ofFn u) = value (List.ofFn v) := value_perm hperm
  have hunot : ¬ContainsCriticalQuadruple (List.ofFn u) := by
    intro hcrit
    exact hnot (containsCriticalQuadruple_of_subset
      (fun a ha => hperm.mem_iff.mp ha) hcrit)
  have hlast := five_speed_family_cutoff_last hgap u (fun k => hpositive (p k)) huprimitive
    (by simpa only [huvalue] using hbelow) hunot
  simpa [u, p] using hlast

theorem five_speed_finite_or_critical_quadruple (hgap : FourSpeedGap) (v : Fin 5 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : value (List.ofFn v) < (1 / 5 : ℝ)) :
    (∀ i, v i ≤ 279841) ∨ ContainsCriticalQuadruple (List.ofFn v) := by
  by_cases hcrit : ContainsCriticalQuadruple (List.ofFn v)
  · exact Or.inr hcrit
  · exact Or.inl (five_speed_family_cutoff hgap v hpositive hprimitive hbelow hcrit)

end Loneliness.Pigeonhole
