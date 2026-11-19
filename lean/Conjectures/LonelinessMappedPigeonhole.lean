import Conjectures.LonelinessSignedPigeonhole
import Conjectures.LonelinessIntegerPlane
import Conjectures.LonelinessPlaneProductFamily
import Conjectures.LonelinessPlaneClassification

/-! Bounded primitive parameters for integer maps from two coordinates to
five speeds. The image need not be primitive, and every coordinate may have
either sign. A row ℓ1 bound `L` gives the parameter bound `23*L` outside the
critical-quadruple families. -/

namespace Loneliness.Pigeonhole

open CoordinateSubspace SubspaceDensity PlaneCertificate CriticalFamilies

def twoParameterMap (A : Fin 5 → Fin 2 → ℤ) (u : Fin 2 → ℤ) : Fin 5 → ℤ :=
  fun i => A i 0 * u 0 + A i 1 * u 1

def twoParameterRealMap (A : Fin 5 → Fin 2 → ℤ) (u : Fin 2 → ℝ) : Fin 5 → ℝ :=
  fun i => (A i 0 : ℝ) * u 0 + (A i 1 : ℝ) * u 1

def HasPureAxisRows (A : Fin 5 → Fin 2 → ℤ) : Prop :=
  ∃ i j : Fin 5, A i 1 = 0 ∧ A i 0 ≠ 0 ∧ A j 0 = 0 ∧ A j 1 ≠ 0

theorem twoParameterRealMap_injective_of_pure_axes (A : Fin 5 → Fin 2 → ℤ)
    (haxes : HasPureAxisRows A) : Function.Injective (twoParameterRealMap A) := by
  obtain ⟨i, j, hi1, hi0, hj0, hj1⟩ := haxes
  intro x y h
  have h0 : x 0 = y 0 := by
    apply mul_left_cancel₀ (show (A i 0 : ℝ) ≠ 0 by exact_mod_cast hi0)
    simpa [twoParameterRealMap, hi1] using congrFun h i
  have h1 : x 1 = y 1 := by
    apply mul_left_cancel₀ (show (A j 1 : ℝ) ≠ 0 by exact_mod_cast hj1)
    simpa [twoParameterRealMap, hj0] using congrFun h j
  funext k
  fin_cases k
  · exact h0
  · exact h1

theorem twoParameterRealMap_integer (A : Fin 5 → Fin 2 → ℤ) (u : Fin 2 → ℤ) :
    twoParameterRealMap A (fun j => (u j : ℝ)) =
      fun i => (twoParameterMap A u i : ℝ) := by
  ext i
  simp [twoParameterRealMap, twoParameterMap]

theorem twoParameterRealMap_smul (A : Fin 5 → Fin 2 → ℤ) (r : ℝ) (u : Fin 2 → ℝ) :
    twoParameterRealMap A (fun j => r * u j) = fun i => r * twoParameterRealMap A u i := by
  ext i
  simp only [twoParameterRealMap]
  ring

theorem two_parameter_preserves_independence (A : Fin 5 → Fin 2 → ℤ)
    (hinj : Function.Injective (twoParameterRealMap A)) (u z : Fin 2 → ℤ)
    (hnot : ¬∃ r : ℝ, ∀ j, (z j : ℝ) = r * (u j : ℝ)) :
    ¬∃ r : ℝ, ∀ i, (twoParameterMap A z i : ℝ) = r * (twoParameterMap A u i : ℝ) := by
  rintro ⟨r, hr⟩
  apply hnot
  have hmap : twoParameterRealMap A (fun j => (z j : ℝ)) =
      twoParameterRealMap A (fun j => r * (u j : ℝ)) := by
    rw [twoParameterRealMap_integer, twoParameterRealMap_smul, twoParameterRealMap_integer]
    funext i
    exact hr i
  exact ⟨r, fun j => congrFun (hinj hmap) j⟩

theorem two_parameter_error_bound (A : Fin 5 → Fin 2 → ℤ) (u z : Fin 2 → ℤ)
    (t : ℝ) (B L : ℕ) (hB : 0 < B)
    (hrow : ∀ i, (A i 0).natAbs + (A i 1).natAbs ≤ L)
    (herror : ∀ j, |(z j : ℝ) - t * (u j : ℝ)| < 1 / (B : ℝ)) :
    ∀ i, |(twoParameterMap A z i : ℝ) - t * (twoParameterMap A u i : ℝ)| ≤
      (L : ℝ) / (B : ℝ) := by
  have hB' : (0 : ℝ) < B := by exact_mod_cast hB
  intro i
  have hrow' : ((A i 0).natAbs : ℝ) + ((A i 1).natAbs : ℝ) ≤ (L : ℝ) := by
    exact_mod_cast hrow i
  have hrowR : |(A i 0 : ℝ)| + |(A i 1 : ℝ)| ≤ (L : ℝ) := by
    simpa only [Nat.cast_natAbs, Int.cast_abs] using hrow'
  calc
    |(twoParameterMap A z i : ℝ) - t * (twoParameterMap A u i : ℝ)| =
        |(A i 0 : ℝ) * ((z 0 : ℝ) - t * (u 0 : ℝ)) +
          (A i 1 : ℝ) * ((z 1 : ℝ) - t * (u 1 : ℝ))| := by
      simp only [twoParameterMap, Int.cast_add, Int.cast_mul]
      congr 1
      ring
    _ ≤ |(A i 0 : ℝ) * ((z 0 : ℝ) - t * (u 0 : ℝ))| +
        |(A i 1 : ℝ) * ((z 1 : ℝ) - t * (u 1 : ℝ))| := abs_add_le _ _
    _ = |(A i 0 : ℝ)| * |(z 0 : ℝ) - t * (u 0 : ℝ)| +
        |(A i 1 : ℝ)| * |(z 1 : ℝ) - t * (u 1 : ℝ)| := by rw [abs_mul, abs_mul]
    _ ≤ |(A i 0 : ℝ)| * (1 / (B : ℝ)) + |(A i 1 : ℝ)| * (1 / (B : ℝ)) :=
      add_le_add (mul_le_mul_of_nonneg_left (herror 0).le (abs_nonneg _))
        (mul_le_mul_of_nonneg_left (herror 1).le (abs_nonneg _))
    _ = (|(A i 0 : ℝ)| + |(A i 1 : ℝ)|) / (B : ℝ) := by ring
    _ ≤ (L : ℝ) / (B : ℝ) :=
      (div_le_div_iff₀ hB' hB').mpr (mul_le_mul_of_nonneg_right hrowR hB'.le)

theorem two_parameter_family_cutoff (hgap : FourSpeedGap) (A : Fin 5 → Fin 2 → ℤ)
    (hinj : Function.Injective (twoParameterRealMap A)) (L : ℕ) (hL : 0 < L)
    (hrow : ∀ i, (A i 0).natAbs + (A i 1).natAbs ≤ L)
    (u : Fin 2 → ℤ)
    (hprimitive : (List.ofFn (fun j => (u j).natAbs)).foldr Nat.gcd 0 = 1)
    (hnonzero : ∀ i, twoParameterMap A u i ≠ 0)
    (hbelow : value (integerSpeeds (twoParameterMap A u)) < (1 / 5 : ℝ))
    (hnot : ¬ContainsCriticalQuadruple (integerSpeeds (twoParameterMap A u))) :
    ∀ j, (u j).natAbs ≤ 23 * L := by
  intro j
  by_contra hn
  let B := 23 * L
  have hB : 0 < B := Nat.mul_pos (by decide) hL
  have hlarge : B ^ 1 < (u j).natAbs := by
    simpa only [pow_one] using (Nat.lt_of_not_ge hn)
  obtain ⟨z, t, htpos, htlt, herror, hnotparallel⟩ :=
    signed_independent_integer_approximation_at (n := 1) u hprimitive B hB j hlarge
  have hmapnot := two_parameter_preserves_independence A hinj u z hnotparallel
  have hmaperror := two_parameter_error_bound A u z t B L hB hrow herror
  obtain ⟨F, hdim, hfree, hmem, hvalue⟩ := integer_approximation_plane
    (twoParameterMap A u) (twoParameterMap A z) hnonzero hmapnot
    t ((L : ℝ) / (B : ℝ)) hmaperror
  have hFbelow : spaceValue (realSpan F) < (2 / 9 : ℝ) := by
    have hL' : (0 : ℝ) < L := by exact_mod_cast hL
    have hr : (L : ℝ) / (B : ℝ) / 2 = (1 / 46 : ℝ) := by
      dsimp [B]
      simp only [Nat.cast_mul, Nat.cast_ofNat]
      field_simp [ne_of_gt hL']
      ring
    rw [hr] at hvalue
    linarith
  have hproduct := critical_product_of_low_value hgap F hfree hdim hFbelow
  exact hnot (critical_quadruple_in_critical_product F hproduct
    (twoParameterMap A u) hmem hnonzero)

theorem two_parameter_finite_or_critical_quadruple (hgap : FourSpeedGap)
    (A : Fin 5 → Fin 2 → ℤ) (hinj : Function.Injective (twoParameterRealMap A))
    (L : ℕ) (hL : 0 < L) (hrow : ∀ i, (A i 0).natAbs + (A i 1).natAbs ≤ L)
    (u : Fin 2 → ℤ)
    (hprimitive : (List.ofFn (fun j => (u j).natAbs)).foldr Nat.gcd 0 = 1)
    (hnonzero : ∀ i, twoParameterMap A u i ≠ 0)
    (hbelow : value (integerSpeeds (twoParameterMap A u)) < (1 / 5 : ℝ)) :
    (∀ j, (u j).natAbs ≤ 23 * L) ∨
      ContainsCriticalQuadruple (integerSpeeds (twoParameterMap A u)) := by
  by_cases hcrit : ContainsCriticalQuadruple (integerSpeeds (twoParameterMap A u))
  · exact Or.inr hcrit
  · exact Or.inl (two_parameter_family_cutoff hgap A hinj L hL hrow u
      hprimitive hnonzero hbelow hcrit)

theorem two_parameter_family_cutoff_of_pure_axes (hgap : FourSpeedGap)
    (A : Fin 5 → Fin 2 → ℤ) (haxes : HasPureAxisRows A)
    (L : ℕ) (hL : 0 < L) (hrow : ∀ i, (A i 0).natAbs + (A i 1).natAbs ≤ L)
    (u : Fin 2 → ℤ)
    (hprimitive : (List.ofFn (fun j => (u j).natAbs)).foldr Nat.gcd 0 = 1)
    (hnonzero : ∀ i, twoParameterMap A u i ≠ 0)
    (hbelow : value (integerSpeeds (twoParameterMap A u)) < (1 / 5 : ℝ))
    (hnot : ¬ContainsCriticalQuadruple (integerSpeeds (twoParameterMap A u))) :
    ∀ j, (u j).natAbs ≤ 23 * L :=
  two_parameter_family_cutoff hgap A (twoParameterRealMap_injective_of_pure_axes A haxes)
    L hL hrow u hprimitive hnonzero hbelow hnot

theorem two_parameter_family_cutoff_391 (hgap : FourSpeedGap)
    (A : Fin 5 → Fin 2 → ℤ) (haxes : HasPureAxisRows A)
    (hrow : ∀ i, (A i 0).natAbs + (A i 1).natAbs ≤ 17)
    (u : Fin 2 → ℤ)
    (hprimitive : (List.ofFn (fun j => (u j).natAbs)).foldr Nat.gcd 0 = 1)
    (hnonzero : ∀ i, twoParameterMap A u i ≠ 0)
    (hbelow : value (integerSpeeds (twoParameterMap A u)) < (1 / 5 : ℝ))
    (hnot : ¬ContainsCriticalQuadruple (integerSpeeds (twoParameterMap A u))) :
    ∀ j, (u j).natAbs ≤ 391 := by
  simpa using two_parameter_family_cutoff_of_pure_axes hgap A haxes 17 (by decide)
    hrow u hprimitive hnonzero hbelow hnot

end Loneliness.Pigeonhole
