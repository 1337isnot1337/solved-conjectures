import Conjectures.LonelinessNormGeometry
import Conjectures.LonelinessKZSmallData
import Conjectures.LonelinessSmallRunner

/-! The actual primitive-vector geometry for the off-critical six-speed
spectrum. The containing-plane gap and four-speed bound are explicit inputs
here; the classification assembly supplies them from its proved components.
No projected-lattice volume or successive-minimum product premise is used.
-/

namespace Loneliness.SixSpectrumNormGeometry

open scoped BigOperators
open CoordinateSubspace SubspaceDensity NormGeometry

noncomputable section

/-- Every rational plane containing the given vector has the six-plane gap. -/
def ContainingPlaneGap (v : Fin 6 → ℕ) : Prop :=
  ∀ E : Submodule ℚ (Fin 6 → ℚ),
    (fun i => (v i : ℚ)) ∈ E → Module.finrank ℚ E = 2 →
      (2 / 11 : ℝ) ≤ spaceValue (realSpan E)

/-- A reduced integral basis produces all five actual Gram-length inputs to
the finite KZ product certificate. Only the containing-plane and four-speed
lower bounds are inputs; the basis, rounding and determinant are constructed. -/
theorem exists_gram_data (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 6 : ℝ))
    (hfour : LonelyRunnerBound 4) (hplane : ContainingPlaneGap v) :
    ∃ t : ℕ → ℝ,
      (∀ i < 5, 0 < t i) ∧
      (∀ r ≤ 5, KZGeneral.boundValue KZSmall.SixSpectrum.bounds
        KZSmall.SixSpectrum.scale r ≤ ∑ i ∈ Finset.range r, t i) ∧
      (∀ i, i + 1 < 5 → 3 * t i ≤ 4 * t (i + 1)) ∧
      (∏ i ∈ Finset.range 5, t i) = 1 / squaredNorm v := by
  classical
  obtain ⟨B₀, hB₀⟩ := PrimitiveBasis.primitive_speed_basis_extension v hprimitive
  obtain ⟨B, hB, hratio⟩ := KZBasis.exists_ratio_basis B₀
  have hfirst : B 0 = fun i => (v i : ℤ) := hB.trans hB₀
  let t : ℕ → ℝ := fun i =>
    ‖InnerProductSpace.gramSchmidt ℝ (KZBasis.realFamily B) (i + 1)‖ ^ 2
  let w : ℕ → Fin 6 → ℤ := KZBasis.integerFamily B
  have hwzero : w 0 = fun i => (v i : ℤ) :=
    (KZBasis.integerFamily_apply B (0 : Fin 6)).trans hfirst
  have hwreal : integerVector (w 0) = fun i => (v i : ℝ) := by
    rw [hwzero]
    ext i
    simp [integerVector]
  have hnonzero : ∀ i, w 0 i ≠ 0 := by
    intro i
    rw [hwzero]
    change (v i : ℤ) ≠ 0
    exact_mod_cast (hpositive i).ne'
  have hline : spaceValue (Submodule.span ℝ {integerVector (w 0)}) ≤
      (1 / 6 : ℝ) := by
    rw [hwreal, spaceValue_speed_line]
    exact hvalue
  have hfamily : (fun j => NearestPlane.euclideanVector (w j)) =
      KZBasis.realFamily B := by
    funext j
    rfl
  refine ⟨t, ?_, ?_, ?_, ?_⟩
  · intro i hi
    exact KZBasis.gs_sq_positive B (i + 1) (by omega)
  · intro r hr
    by_cases hrzero : r = 0
    · subst r
      norm_num [KZGeneral.boundValue, KZSmall.SixSpectrum.bounds,
        KZSmall.SixSpectrum.boundData, KZSmall.SixSpectrum.scale]
    have hind : LinearIndependent ℝ
        (fun i : Fin (r + 1) => integerVector (w i.val)) :=
      KZBasis.integerFamily_prefix_independent B (r + 1) (by omega)
    by_cases hrone : r = 1
    · subst r
      have hdim : Module.finrank ℚ (NearestPlane.rationalPrefix w 2) = 2 := by
        rw [← finrank_realSpan, NearestPlane.realSpan_rationalPrefix]
        exact NearestPlane.coordinatePrefix_finrank w 2 hind
      have hmem : (fun i => (v i : ℚ)) ∈ NearestPlane.rationalPrefix w 2 := by
        apply Submodule.subset_span
        refine ⟨(0 : Fin 2), ?_⟩
        change (fun i => (w 0 i : ℚ)) = fun i => (v i : ℚ)
        rw [hwzero]
        simp
      have hlower : (2 / 11 : ℝ) ≤ spaceValue (NearestPlane.coordinatePrefix w 2) := by
        rw [← NearestPlane.realSpan_rationalPrefix]
        exact hplane _ hmem hdim
      have hp := NearestPlane.tailGramSum_lower w 1 (2 / 11) (1 / 6)
        hlower hline (by norm_num)
      have hbound : KZGeneral.boundValue KZSmall.SixSpectrum.bounds
          KZSmall.SixSpectrum.scale 1 = 4 * ((2 / 11 : ℝ) - 1 / 6) ^ 2 := by
        norm_num [KZGeneral.boundValue, KZSmall.SixSpectrum.bounds,
          KZSmall.SixSpectrum.boundData, KZSmall.SixSpectrum.scale]
      rw [hbound]
      simpa only [NearestPlane.tailGramSum, hfamily, t] using hp
    · have hsmall : LonelyRunnerBound (6 - r) := by
        by_cases hm : 6 - r = 4
        · simpa only [hm] using hfour
        · exact SmallRunner.lonelyRunnerBound (6 - r) (by omega)
      have hthreshold : (1 / 6 : ℝ) ≤ 1 / ((6 - r : ℕ) + 1) := by
        apply one_div_le_one_div_of_le (by positivity)
        exact_mod_cast (show (6 - r) + 1 ≤ 6 by omega)
      have hp := NearestPlane.runner_prefix_squared_lower w r (1 / 6)
        (by simp only [Fintype.card_fin]; omega) hind hnonzero
        (by simpa only [Fintype.card_fin] using hsmall) hline
        (by simpa only [Fintype.card_fin] using hthreshold)
      have hbound : KZGeneral.boundValue KZSmall.SixSpectrum.bounds
          KZSmall.SixSpectrum.scale r =
          4 * ((1 : ℝ) / ((6 - r : ℕ) + 1) - 1 / 6) ^ 2 := by
        have hrmin : 2 ≤ r := by omega
        interval_cases r <;> norm_num [KZGeneral.boundValue,
          KZSmall.SixSpectrum.bounds, KZSmall.SixSpectrum.boundData,
          KZSmall.SixSpectrum.scale]
      rw [hbound]
      simpa only [Fintype.card_fin, NearestPlane.tailGramSum, hfamily, t] using hp
  · intro i hi
    exact hratio (i + 1) (by omega) (by omega)
  · apply (eq_div_iff (squaredNorm_pos v hpositive).ne').mpr
    have hdet := KZBasis.gs_tail_product B
    rw [hfirst] at hdet
    exact hdet

theorem numerical_margin :
    1 < (21829 : ℝ) ^ 2 * ∏ i ∈ Finset.range 5,
      KZGeneral.increment KZSmall.SixSpectrum.bounds KZSmall.SixSpectrum.scale i := by
  norm_num [KZGeneral.increment, KZGeneral.boundValue, KZSmall.SixSpectrum.bounds,
    KZSmall.SixSpectrum.boundData, KZSmall.SixSpectrum.scale, Finset.prod_range_succ]

/-- The global bound is stronger than the original ambient bound 163350. -/
theorem squaredNorm_lt (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 6 : ℝ))
    (hfour : LonelyRunnerBound 4) (hplane : ContainingPlaneGap v) :
    squaredNorm v < (21829 : ℝ) ^ 2 := by
  obtain ⟨t, ht, hp, hr, hd⟩ := exists_gram_data v hpositive hprimitive hvalue hfour hplane
  have h := KZGeneral.norm_square_cutoff 5
    (KZGeneral.increment KZSmall.SixSpectrum.bounds KZSmall.SixSpectrum.scale)
    t (squaredNorm v) 1 21829 (squaredNorm_pos v hpositive)
    (KZSmall.SixSpectrum.product_lower_bound t ht hp hr) hd numerical_margin
  simpa using h

theorem norm_lt (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 6 : ℝ))
    (hfour : LonelyRunnerBound 4) (hplane : ContainingPlaneGap v) :
    ‖KZBasis.realVector (fun i => (v i : ℤ))‖ < (21829 : ℝ) := by
  have h := squaredNorm_lt v hpositive hprimitive hvalue hfour hplane
  unfold squaredNorm at h
  nlinarith [norm_nonneg (KZBasis.realVector (fun i => (v i : ℤ)))]

theorem natural_squaredNorm_lt (v : Fin 6 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 6 : ℝ))
    (hfour : LonelyRunnerBound 4) (hplane : ContainingPlaneGap v) :
    (∑ i, (v i) ^ 2) < 21829 ^ 2 := by
  have h := squaredNorm_lt v hpositive hprimitive hvalue hfour hplane
  rw [squaredNorm_eq_sum] at h
  exact_mod_cast h

end

end Loneliness.SixSpectrumNormGeometry
