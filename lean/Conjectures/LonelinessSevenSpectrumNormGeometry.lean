import Conjectures.LonelinessNormGeometry
import Conjectures.LonelinessKZSmallData
import Conjectures.LonelinessSmallRunner
import Conjectures.LonelinessFiveSpeedBound
import Conjectures.LonelinessModularPrimes
import Conjectures.LonelinessModularForcedDivisor

/-! The actual primitive-vector geometry for the seven-speed spectrum.
The containing-plane gap is the only unproved mathematical input here.
The five-speed and all smaller runner bounds are supplied by accepted proofs.
The integral basis, Gram-prefix bounds, and determinant identity are derived
from the actual primitive vector, not assumed. -/

namespace Loneliness.SevenSpectrumNormGeometry

open scoped BigOperators
open CoordinateSubspace SubspaceDensity NormGeometry

noncomputable section

/-- Every rational plane containing the given vector has the seven-plane gap. -/
def ContainingPlaneGap (v : Fin 7 → ℕ) : Prop :=
  ∀ E : Submodule ℚ (Fin 7 → ℚ),
    (fun i => (v i : ℚ)) ∈ E → Module.finrank ℚ E = 2 →
      (5 / 33 : ℝ) ≤ spaceValue (realSpan E)

/-- A reduced integral basis produces all six actual Gram-length inputs to
the finite KZ product certificate. Only the containing-plane
lower bound is an input; the basis, rounding and determinant are constructed. -/
theorem exists_gram_data (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 7 : ℝ))
    (hplane : ContainingPlaneGap v) :
    ∃ t : ℕ → ℝ,
      (∀ i < 6, 0 < t i) ∧
      (∀ r ≤ 6, KZGeneral.boundValue KZSmall.SevenSpectrum.bounds
        KZSmall.SevenSpectrum.scale r ≤ ∑ i ∈ Finset.range r, t i) ∧
      (∀ i, i + 1 < 6 → 3 * t i ≤ 4 * t (i + 1)) ∧
      (∏ i ∈ Finset.range 6, t i) = 1 / squaredNorm v := by
  classical
  obtain ⟨B₀, hB₀⟩ := PrimitiveBasis.primitive_speed_basis_extension v hprimitive
  obtain ⟨B, hB, hratio⟩ := KZBasis.exists_ratio_basis B₀
  have hfirst : B 0 = fun i => (v i : ℤ) := hB.trans hB₀
  let t : ℕ → ℝ := fun i =>
    ‖InnerProductSpace.gramSchmidt ℝ (KZBasis.realFamily B) (i + 1)‖ ^ 2
  let w : ℕ → Fin 7 → ℤ := KZBasis.integerFamily B
  have hwzero : w 0 = fun i => (v i : ℤ) :=
    (KZBasis.integerFamily_apply B (0 : Fin 7)).trans hfirst
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
      (1 / 7 : ℝ) := by
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
      norm_num [KZGeneral.boundValue, KZSmall.SevenSpectrum.bounds,
        KZSmall.SevenSpectrum.boundData, KZSmall.SevenSpectrum.scale]
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
      have hlower : (5 / 33 : ℝ) ≤ spaceValue (NearestPlane.coordinatePrefix w 2) := by
        rw [← NearestPlane.realSpan_rationalPrefix]
        exact hplane _ hmem hdim
      have hp := NearestPlane.tailGramSum_lower w 1 (5 / 33) (1 / 7)
        hlower hline (by norm_num)
      have hbound : KZGeneral.boundValue KZSmall.SevenSpectrum.bounds
          KZSmall.SevenSpectrum.scale 1 = 4 * ((5 / 33 : ℝ) - 1 / 7) ^ 2 := by
        norm_num [KZGeneral.boundValue, KZSmall.SevenSpectrum.bounds,
          KZSmall.SevenSpectrum.boundData, KZSmall.SevenSpectrum.scale]
      rw [hbound]
      simpa only [NearestPlane.tailGramSum, hfamily, t] using hp
    · have hsmall : LonelyRunnerBound (7 - r) := by
        by_cases hm : 7 - r = 5
        · simpa only [hm] using Renault.five_speed_lonelyRunnerBound
        · by_cases hm' : 7 - r = 4
          · simpa only [hm'] using CoordinateSubspace.four_speed_lonelyRunnerBound
          · exact SmallRunner.lonelyRunnerBound (7 - r) (by omega)
      have hthreshold : (1 / 7 : ℝ) ≤ 1 / ((7 - r : ℕ) + 1) := by
        apply one_div_le_one_div_of_le (by positivity)
        exact_mod_cast (show (7 - r) + 1 ≤ 7 by omega)
      have hp := NearestPlane.runner_prefix_squared_lower w r (1 / 7)
        (by simp only [Fintype.card_fin]; omega) hind hnonzero
        (by simpa only [Fintype.card_fin] using hsmall) hline
        (by simpa only [Fintype.card_fin] using hthreshold)
      have hbound : KZGeneral.boundValue KZSmall.SevenSpectrum.bounds
          KZSmall.SevenSpectrum.scale r =
          4 * ((1 : ℝ) / ((7 - r : ℕ) + 1) - 1 / 7) ^ 2 := by
        have hrmin : 2 ≤ r := by omega
        interval_cases r <;> norm_num [KZGeneral.boundValue,
          KZSmall.SevenSpectrum.bounds, KZSmall.SevenSpectrum.boundData,
          KZSmall.SevenSpectrum.scale]
      rw [hbound]
      simpa only [Fintype.card_fin, NearestPlane.tailGramSum, hfamily, t] using hp
  · intro i hi
    exact hratio (i + 1) (by omega) (by omega)
  · apply (eq_div_iff (squaredNorm_pos v hpositive).ne').mpr
    have hdet := KZBasis.gs_tail_product B
    rw [hfirst] at hdet
    exact hdet

theorem increment_product :
    (∏ i ∈ Finset.range 6,
      KZGeneral.increment KZSmall.SevenSpectrum.bounds KZSmall.SevenSpectrum.scale i) =
      (8993 / 1186638179795145 : ℝ) := by
  norm_num [KZGeneral.increment, KZGeneral.boundValue, KZSmall.SevenSpectrum.bounds,
    KZSmall.SevenSpectrum.boundData, KZSmall.SevenSpectrum.scale, Finset.prod_range_succ]

theorem numerical_margin :
    1 < (363252 : ℝ) ^ 2 * ∏ i ∈ Finset.range 6,
      KZGeneral.increment KZSmall.SevenSpectrum.bounds KZSmall.SevenSpectrum.scale i := by
  rw [increment_product]
  norm_num

theorem squaredNorm_mul_le (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 7 : ℝ))
    (hplane : ContainingPlaneGap v) :
    8993 * squaredNorm v ≤ 1186638179795145 := by
  obtain ⟨t, ht, hp, hr, hd⟩ := exists_gram_data v hpositive hprimitive hvalue hplane
  have hprod := KZSmall.SevenSpectrum.product_lower_bound t ht hp hr
  rw [hd, increment_product] at hprod
  have hscaled := (le_div_iff₀ (squaredNorm_pos v hpositive)).mp hprod
  linarith only [hscaled]

/-- Integer rounding retains the sharper bound supplied by the Gram product. -/
theorem natural_squaredNorm_le (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 7 : ℝ))
    (hplane : ContainingPlaneGap v) :
    (∑ i, (v i) ^ 2) ≤ 131951315444 := by
  have h := squaredNorm_mul_le v hpositive hprimitive hvalue hplane
  rw [squaredNorm_eq_sum] at h
  have hnat : 8993 * (∑ i, (v i) ^ 2) ≤ 1186638179795145 := by
    exact_mod_cast h
  omega

/-- The global bound is stronger than the original ambient bound 5145525. -/
theorem squaredNorm_lt (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 7 : ℝ))
    (hplane : ContainingPlaneGap v) :
    squaredNorm v < (363252 : ℝ) ^ 2 := by
  obtain ⟨t, ht, hp, hr, hd⟩ := exists_gram_data v hpositive hprimitive hvalue hplane
  have h := KZGeneral.norm_square_cutoff 6
    (KZGeneral.increment KZSmall.SevenSpectrum.bounds KZSmall.SevenSpectrum.scale)
    t (squaredNorm v) 1 363252 (squaredNorm_pos v hpositive)
    (KZSmall.SevenSpectrum.product_lower_bound t ht hp hr) hd numerical_margin
  simpa using h

theorem norm_lt (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 7 : ℝ))
    (hplane : ContainingPlaneGap v) :
    ‖KZBasis.realVector (fun i => (v i : ℤ))‖ < (363252 : ℝ) := by
  have h := squaredNorm_lt v hpositive hprimitive hvalue hplane
  unfold squaredNorm at h
  nlinarith [norm_nonneg (KZBasis.realVector (fun i => (v i : ℤ)))]

theorem natural_squaredNorm_lt (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 7 : ℝ))
    (hplane : ContainingPlaneGap v) :
    (∑ i, (v i) ^ 2) < 363252 ^ 2 := by
  have h := squaredNorm_lt v hpositive hprimitive hvalue hplane
  rw [squaredNorm_eq_sum] at h
  exact_mod_cast h

/-- The original nineteen primes in the seven-speed spectrum proof. -/
def primeList : List ℕ :=
  [151, 157, 163, 167, 173, 179, 181, 191, 193, 197,
    199, 211, 223, 227, 229, 233, 239, 241, 251]

def primeSet : Finset ℕ := primeList.toFinset

theorem all_primes : ∀ p ∈ primeSet, p.Prime := by
  norm_num [primeSet, primeList]

theorem prime_product :
    (∏ p ∈ primeSet, p) = 43068684519325081255108496305235833474106903 := by
  decide +kernel

theorem prime_product_margin :
    131951315444 ^ 7 < 7 ^ 7 * (∏ p ∈ primeSet, p) ^ 2 := by
  rw [prime_product]
  decide +kernel

/-- One of the original prime moduli divides no coordinate of the actual
primitive vector. No finite residue classification is assumed. -/
theorem exists_prime_avoiding (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 7 : ℝ))
    (hplane : ContainingPlaneGap v) :
    ∃ p ∈ primeSet, ∀ i, ¬ p ∣ v i := by
  apply Modular.exists_prime_avoiding_of_square_bound (by decide) v hpositive
    primeSet all_primes
  exact (Nat.pow_le_pow_left
    (natural_squaredNorm_le v hpositive hprimitive hvalue hplane) 7).trans_lt
      prime_product_margin

/-- The sharper norm bound needs only the first sixteen original moduli. -/
def primeSet16 : Finset ℕ := (primeList.take 16).toFinset

theorem primeSet16_subset : primeSet16 ⊆ primeSet := by
  decide +kernel

theorem primeSet16_card : primeSet16.card = 16 := by
  decide +kernel

theorem all_primes16 : ∀ p ∈ primeSet16, p.Prime :=
  fun p hp => all_primes p (primeSet16_subset hp)

theorem prime_product16 :
    (∏ p ∈ primeSet16, p) = 2979016728400558169766012863439613547 := by
  decide +kernel

theorem prime_product_margin16 :
    131951315444 ^ 7 < 7 ^ 7 * (∏ p ∈ primeSet16, p) ^ 2 := by
  rw [prime_product16]
  decide +kernel

theorem exists_prime_avoiding16 (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 / 7 : ℝ))
    (hplane : ContainingPlaneGap v) :
    ∃ p ∈ primeSet16, ∀ i, ¬ p ∣ v i := by
  apply Modular.exists_prime_avoiding_of_square_bound (by decide) v hpositive
    primeSet16 all_primes16
  exact (Nat.pow_le_pow_left
    (natural_squaredNorm_le v hpositive hprimitive hvalue hplane) 7).trans_lt
      prime_product_margin16

theorem forced_divisor_seven : Modular.forcedDivisor 7 = 420 := by
  decide +kernel

/-- The strict threshold forces a divisible speed at every denominator
from two through seven, hence their least common multiple divides the product. -/
theorem forced_divisor_of_strict (ds : List ℕ)
    (hvalue : value ds < (1 / 7 : ℝ)) : 420 ∣ ds.prod := by
  have hforced : Modular.forcedDivisor 7 ∣ ds.prod := by
    apply Finset.lcm_dvd
    intro d hd
    have hd2 : 2 ≤ d := (Finset.mem_Icc.mp hd).1
    have hd7 : d ≤ 7 := (Finset.mem_Icc.mp hd).2
    have hdpos : 0 < d := by omega
    have hdiv : ∃ a ∈ ds, d ∣ a := by
      by_contra! hnone
      have hw : Modular.Witness d d 1 ds := by
        intro a ha
        have hmod : a % d ≠ 0 := fun h => hnone a ha (Nat.dvd_of_mod_eq_zero h)
        have hlt : a % d < d := Nat.mod_lt a hdpos
        have hfold : 1 ≤ Modular.folded d a := by
          unfold Modular.folded
          omega
        simpa only [Nat.one_mul, Nat.mul_one] using Nat.mul_le_mul_left d hfold
      have hlower := Modular.witness_value_lower hd2 hdpos hw
      have hgap : (1 / 7 : ℝ) ≤ 1 / (d : ℝ) :=
        one_div_le_one_div_of_le (by exact_mod_cast hdpos) (by exact_mod_cast hd7)
      exact (not_le_of_gt hvalue) (hgap.trans hlower)
    obtain ⟨a, ha, hda⟩ := hdiv
    exact hda.trans (List.dvd_prod ha)
  simpa only [forced_divisor_seven] using hforced

/-- On the strict sublevel, the forced factor 420 removes one more modulus. -/
def primeSet15 : Finset ℕ := (primeList.take 15).toFinset

theorem primeSet15_subset : primeSet15 ⊆ primeSet := by
  decide +kernel

theorem primeSet15_card : primeSet15.card = 15 := by
  decide +kernel

theorem all_primes15 : ∀ p ∈ primeSet15, p.Prime :=
  fun p hp => all_primes p (primeSet15_subset hp)

theorem prime_product15 :
    (∏ p ∈ primeSet15, p) = 12785479521032438496849840615620659 := by
  decide +kernel

theorem prime_product_coprime15 :
    Nat.Coprime 420 (∏ p ∈ primeSet15, p) := by
  rw [prime_product15]
  decide +kernel

theorem prime_product_margin15 :
    131951315444 ^ 7 < 7 ^ 7 * (420 * ∏ p ∈ primeSet15, p) ^ 2 := by
  rw [prime_product15]
  decide +kernel

/-- The original strict sublevel needs only fifteen of the nineteen primes.
The strict inequality is essential to the proof of the forced factor 420. -/
theorem exists_prime_avoiding15 (v : Fin 7 → ℕ) (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) < (1 / 7 : ℝ))
    (hplane : ContainingPlaneGap v) :
    ∃ p ∈ primeSet15, ∀ i, ¬ p ∣ v i := by
  apply Modular.exists_prime_avoiding_with_forced_divisor (by decide) v hpositive
    420 primeSet15 all_primes15
  · simpa only [List.prod_ofFn] using forced_divisor_of_strict (List.ofFn v) hvalue
  · exact prime_product_coprime15
  · exact (Nat.pow_le_pow_left
      (natural_squaredNorm_le v hpositive hprimitive hvalue.le hplane) 7).trans_lt
        prime_product_margin15

end

end Loneliness.SevenSpectrumNormGeometry
