module

public import Conjectures.VishnyakovaDisk
public import Mathlib.Algebra.Polynomial.Sequence
public import Mathlib.RingTheory.Polynomial.Pochhammer
public import Mathlib.LinearAlgebra.Basis.Basic

/-!
# The source polynomial class and its sharp radius

The linear map `sourceTransform` is the paper's map `L_beta`: it sends the
normalized falling-factorial polynomial of index `k` to `X^k`.  It is an
actual linear equivalence, and its preservation of polynomial degree is
proved from the degree filtration of the two bases.
-/

@[expose] public section

namespace VishnyakovaRootRadius

open Polynomial Module
open scoped BigOperators

noncomputable def normalizedFalling (beta : ℝ) (n : ℕ) : ℝ[X] :=
  Polynomial.C (risingProduct beta n)⁻¹ * descPochhammer ℝ n

theorem normalizedFalling_degree (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) :
    (normalizedFalling beta n).degree = n := by
  rw [normalizedFalling, Polynomial.degree_C_mul
    (inv_ne_zero (risingProduct_pos beta hbeta n).ne'),
    Polynomial.degree_eq_natDegree (monic_descPochhammer ℝ n).ne_zero,
    descPochhammer_natDegree]

noncomputable def fallingSequence (beta : ℝ) (hbeta : 0 < beta) : Polynomial.Sequence ℝ where
  elems' := normalizedFalling beta
  degree_eq' := normalizedFalling_degree beta hbeta

noncomputable def powerSequence : Polynomial.Sequence ℝ where
  elems' := fun n => Polynomial.X ^ n
  degree_eq' := fun n => Polynomial.degree_X_pow n

theorem sequenceLeadingCoeff_isUnit (S : Polynomial.Sequence ℝ) (n : ℕ) :
    IsUnit (S n).leadingCoeff :=
  isUnit_iff_ne_zero.mpr (Polynomial.leadingCoeff_ne_zero.mpr (S.ne_zero n))

noncomputable def fallingBasis (beta : ℝ) (hbeta : 0 < beta) : Basis ℕ ℝ ℝ[X] :=
  (fallingSequence beta hbeta).basis (sequenceLeadingCoeff_isUnit _)

noncomputable def powerBasis : Basis ℕ ℝ ℝ[X] :=
  powerSequence.basis (sequenceLeadingCoeff_isUnit _)

theorem fallingBasis_apply (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) :
    fallingBasis beta hbeta n = normalizedFalling beta n := by
  simp [fallingBasis, fallingSequence]

theorem powerBasis_apply (n : ℕ) : powerBasis n = (Polynomial.X : ℝ[X]) ^ n := by
  simp [powerBasis, powerSequence]

/-- The source's linear transform `L_beta`, defined on all real polynomials. -/
noncomputable def sourceTransform (beta : ℝ) (hbeta : 0 < beta) : ℝ[X] ≃ₗ[ℝ] ℝ[X] :=
  (fallingBasis beta hbeta).repr.trans powerBasis.repr.symm

theorem sourceTransform_normalizedFalling (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) :
    sourceTransform beta hbeta (normalizedFalling beta n) = (Polynomial.X : ℝ[X]) ^ n := by
  rw [← fallingBasis_apply beta hbeta n]
  change powerBasis.repr.symm ((fallingBasis beta hbeta).repr (fallingBasis beta hbeta n)) = _
  rw [Basis.repr_self, Basis.repr_symm_single_one, powerBasis_apply]

theorem sourceTransform_inverse_X_pow (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) :
    (sourceTransform beta hbeta).symm ((Polynomial.X : ℝ[X]) ^ n) = normalizedFalling beta n := by
  apply (sourceTransform beta hbeta).injective
  rw [LinearEquiv.apply_symm_apply, sourceTransform_normalizedFalling]

theorem sourceTransform_inverse_monomial (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) (a : ℝ) :
    (sourceTransform beta hbeta).symm (Polynomial.monomial n a) =
      Polynomial.C a * normalizedFalling beta n := by
  have hm : Polynomial.monomial n a = a • (Polynomial.X : ℝ[X]) ^ n := by
    rw [Polynomial.smul_eq_C_mul, Polynomial.C_mul_X_pow_eq_monomial]
  rw [hm, map_smul, sourceTransform_inverse_X_pow, Polynomial.smul_eq_C_mul]

theorem normalizedFalling_eval (beta : ℝ) (n : ℕ) (z : ℂ) :
    ((normalizedFalling beta n).map Complex.ofRealHom).eval z = sourceCoefficient beta z n := by
  simp only [normalizedFalling, Polynomial.map_mul, Polynomial.map_C,
    descPochhammer_map, Polynomial.eval_mul, Polynomial.eval_C,
    descPochhammer_eval_eq_prod_range, Complex.ofRealHom_eq_coe,
    Complex.ofReal_inv, sourceCoefficient, fallingProduct, div_eq_mul_inv]
  ring

/-- Inverting `L_beta` is exactly the coefficient pairing used throughout the
disk proof, with no change of the polynomial or its roots. -/
theorem sourceTransform_inverse_eval (beta : ℝ) (hbeta : 0 < beta) (Q : ℝ[X]) (z : ℂ) :
    (((sourceTransform beta hbeta).symm Q).map Complex.ofRealHom).eval z =
      coefficientPairing (sourceCoefficient beta z) (Q.map Complex.ofRealHom) := by
  induction Q using Polynomial.induction_on' with
  | add Q R hQ hR =>
    simp only [map_add, Polynomial.map_add, Polynomial.eval_add, coefficientPairing_add, hQ, hR]
  | monomial n a =>
    rw [sourceTransform_inverse_monomial]
    simp only [Polynomial.map_mul, Polynomial.map_C, Polynomial.eval_mul,
      Polynomial.eval_C, normalizedFalling_eval, Polynomial.map_monomial,
      coefficientPairing_monomial]

private theorem sequenceBasis_span_degreeLE (S : Polynomial.Sequence ℝ) (n : ℕ) :
    Submodule.span ℝ ((S.basis (sequenceLeadingCoeff_isUnit S)) '' Set.Iic n) =
      Polynomial.degreeLE ℝ n := by
  have hb : (S.basis (sequenceLeadingCoeff_isUnit S) : ℕ → ℝ[X]) = S :=
    funext (S.basis_eq_self (sequenceLeadingCoeff_isUnit S))
  rw [hb]
  exact S.span_degreeLE (fun i hi => sequenceLeadingCoeff_isUnit S i)

theorem sourceTransform_mem_degreeLE (beta : ℝ) (hbeta : 0 < beta) (P : ℝ[X]) (n : ℕ) :
    sourceTransform beta hbeta P ∈ Polynomial.degreeLE ℝ n ↔
      P ∈ Polynomial.degreeLE ℝ n := by
  have hpow : Submodule.span ℝ (powerBasis '' Set.Iic n) = Polynomial.degreeLE ℝ n :=
    sequenceBasis_span_degreeLE powerSequence n
  have hfall : Submodule.span ℝ (fallingBasis beta hbeta '' Set.Iic n) =
      Polynomial.degreeLE ℝ n := sequenceBasis_span_degreeLE (fallingSequence beta hbeta) n
  calc
    sourceTransform beta hbeta P ∈ Polynomial.degreeLE ℝ n ↔
        sourceTransform beta hbeta P ∈ Submodule.span ℝ (powerBasis '' Set.Iic n) := by rw [hpow]
    _ ↔ ↑(powerBasis.repr (sourceTransform beta hbeta P)).support ⊆ Set.Iic n :=
      powerBasis.mem_span_image
    _ ↔ ↑((fallingBasis beta hbeta).repr P).support ⊆ Set.Iic n := by
      change ↑(powerBasis.repr (powerBasis.repr.symm ((fallingBasis beta hbeta).repr P))).support ⊆
        Set.Iic n ↔ ↑((fallingBasis beta hbeta).repr P).support ⊆ Set.Iic n
      rw [LinearEquiv.apply_symm_apply]
    _ ↔ P ∈ Submodule.span ℝ (fallingBasis beta hbeta '' Set.Iic n) :=
      (fallingBasis beta hbeta).mem_span_image.symm
    _ ↔ P ∈ Polynomial.degreeLE ℝ n := by rw [hfall]

theorem sourceTransform_natDegree (beta : ℝ) (hbeta : 0 < beta) (P : ℝ[X]) :
    (sourceTransform beta hbeta P).natDegree = P.natDegree := by
  have hle (n : ℕ) : (sourceTransform beta hbeta P).natDegree ≤ n ↔ P.natDegree ≤ n := by
    simpa only [Polynomial.mem_degreeLE, ← Polynomial.natDegree_le_iff_degree_le] using
      sourceTransform_mem_degreeLE beta hbeta P n
  exact Nat.le_antisymm ((hle P.natDegree).mpr le_rfl)
    ((hle (sourceTransform beta hbeta P).natDegree).mp le_rfl)

theorem sourceTransform_inverse_natDegree (beta : ℝ) (hbeta : 0 < beta) (Q : ℝ[X]) :
    ((sourceTransform beta hbeta).symm Q).natDegree = Q.natDegree := by
  have h := sourceTransform_natDegree beta hbeta ((sourceTransform beta hbeta).symm Q)
  rw [LinearEquiv.apply_symm_apply] at h
  exact h.symm

/-- All complex roots of a real polynomial lie in the real interval `[-1,0]`. -/
def RootsInUnitInterval (Q : ℝ[X]) : Prop :=
  ∀ z : ℂ, (Q.map Complex.ofRealHom).eval z = 0 → z.im = 0 ∧ -1 ≤ z.re ∧ z.re ≤ 0

/-- The exact degree-`n` class `U_(n,beta)` in the source. -/
def WeightedClass (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) (P : ℝ[X]) : Prop :=
  P.natDegree = n ∧ RootsInUnitInterval (sourceTransform beta hbeta P)

theorem real_polynomial_factorization (Q : ℝ[X]) (hQ0 : Q ≠ 0) (hQ : RootsInUnitInterval Q) :
    ∃ as : List ℝ, as.length = Q.natDegree ∧ (∀ a ∈ as, 0 ≤ a ∧ a ≤ 1) ∧
      Q.map Complex.ofRealHom = Polynomial.C (Q.map Complex.ofRealHom).leadingCoeff *
        parameterPolynomial as := by
  classical
  let q : ℂ[X] := Q.map Complex.ofRealHom
  have hq0 : q ≠ 0 := Polynomial.map_ne_zero hQ0
  let as : List ℝ := q.roots.toList.map (fun z => -z.re)
  have hroot (z : ℂ) (hz : z ∈ q.roots) : z.im = 0 ∧ -1 ≤ z.re ∧ z.re ≤ 0 := by
    exact hQ z ((Polynomial.mem_roots hq0).mp hz)
  have hlen : as.length = Q.natDegree := by
    dsimp [as]
    rw [List.length_map, Multiset.length_toList,
      ← (IsAlgClosed.splits q).natDegree_eq_card_roots]
    exact Polynomial.natDegree_map _
  have ha : ∀ a ∈ as, 0 ≤ a ∧ a ≤ 1 := by
    intro a ha
    obtain ⟨z, hz, rfl⟩ := List.mem_map.mp ha
    have hr := hroot z (Multiset.mem_toList.mp hz)
    constructor <;> linarith
  have hprod : (q.roots.map (fun z => Polynomial.X - Polynomial.C z)).prod =
      parameterPolynomial as := by
    have hlist : q.roots.toList.map (fun z => Polynomial.X - Polynomial.C z) =
        q.roots.toList.map (fun z => Polynomial.C ((-z.re : ℝ) : ℂ) + Polynomial.X) := by
      apply List.map_congr_left
      intro z hz
      have him := (hroot z (Multiset.mem_toList.mp hz)).1
      have hzreal : z = (z.re : ℂ) := by apply Complex.ext <;> simp [him]
      rw [hzreal]
      simp only [Complex.ofReal_re, Complex.ofReal_neg, Polynomial.C_neg]
      ring
    calc
      _ = (q.roots.toList.map (fun z => Polynomial.X - Polynomial.C z)).prod := by
        rw [← Multiset.prod_coe, ← Multiset.map_coe, Multiset.coe_toList]
      _ = (q.roots.toList.map (fun z => Polynomial.C ((-z.re : ℝ) : ℂ) + Polynomial.X)).prod :=
        congrArg List.prod hlist
      _ = parameterPolynomial as := by
        rw [parameterPolynomial_eq_map]
        simp only [as, List.map_map, Function.comp_def]
  refine ⟨as, hlen, ha, ?_⟩
  have h := (IsAlgClosed.splits q).eq_prod_roots
  rw [hprod] at h
  exact h

/-- Vishnyakova's stronger disk theorem for the source's full polynomial
class, with the original transform realized as a linear equivalence. -/
theorem weighted_root_disk (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) (hn : 0 < n)
    (P : ℝ[X]) (hP : WeightedClass beta hbeta n P) (z : ℂ)
    (hz : (P.map Complex.ofRealHom).eval z = 0) :
    ‖z + ((beta / 2 : ℝ) : ℂ)‖ ≤ (n : ℝ) - 1 + beta / 2 := by
  let Q := sourceTransform beta hbeta P
  have hP0 : P ≠ 0 := Polynomial.ne_zero_of_natDegree_gt (by rw [hP.1]; exact hn)
  have hQ0 : Q ≠ 0 := by
    intro h
    apply hP0
    exact (sourceTransform beta hbeta).injective (by simpa only [map_zero] using h)
  obtain ⟨as, hlen, ha, hfactor⟩ := real_polynomial_factorization Q hQ0 hP.2
  have hlength : as.length = n := by rw [hlen, sourceTransform_natDegree, hP.1]
  have hp := sourceTransform_inverse_eval beta hbeta Q z
  have hinverse : (sourceTransform beta hbeta).symm Q = P := by
    exact (sourceTransform beta hbeta).symm_apply_apply P
  rw [hinverse, hz] at hp
  have hzero := hp.symm
  rw [hfactor, coefficientPairing_C_mul] at hzero
  have hlead : (Q.map Complex.ofRealHom).leadingCoeff ≠ 0 :=
    Polynomial.leadingCoeff_ne_zero.mpr (Polynomial.map_ne_zero hQ0)
  have hparam := (mul_eq_zero.mp hzero).resolve_left hlead
  have h := source_root_disk beta hbeta as (by rw [hlength]; exact hn) ha z hparam
  simpa only [hlength] using h

theorem weighted_root_modulus (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) (hn : 0 < n)
    (P : ℝ[X]) (hP : WeightedClass beta hbeta n P) (z : ℂ)
    (hz : (P.map Complex.ofRealHom).eval z = 0) : ‖z‖ ≤ (n : ℝ) - 1 + beta := by
  have h := weighted_root_disk beta hbeta n hn P hP z hz
  have hnorm : ‖((beta / 2 : ℝ) : ℂ)‖ = beta / 2 := by
    rw [Complex.norm_real, Real.norm_eq_abs, abs_of_pos (by positivity)]
  have htri := norm_sub_le (z + ((beta / 2 : ℝ) : ℂ)) ((beta / 2 : ℝ) : ℂ)
  rw [add_sub_cancel_right, hnorm] at htri
  linarith

/-- The set of moduli of all roots of all polynomials in the source class. -/
def weightedRootModuli (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) : Set ℝ :=
  {r | ∃ P : ℝ[X], WeightedClass beta hbeta n P ∧
    ∃ z : ℂ, (P.map Complex.ofRealHom).eval z = 0 ∧ r = ‖z‖}

theorem weighted_extremal_polynomial (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) (hn : 0 < n) :
    ∃ P : ℝ[X], WeightedClass beta hbeta n P ∧
      ∃ z : ℂ, (P.map Complex.ofRealHom).eval z = 0 ∧ ‖z‖ = (n : ℝ) - 1 + beta := by
  let Q : ℝ[X] := (Polynomial.X + Polynomial.C 1) ^ n
  let P : ℝ[X] := (sourceTransform beta hbeta).symm Q
  have hQdeg : Q.natDegree = n := by
    dsimp [Q]
    rw [Polynomial.natDegree_pow, Polynomial.natDegree_X_add_C, mul_one]
  have hQroots : RootsInUnitInterval Q := by
    intro z hz
    have hz0 : (z + 1) ^ n = 0 := by simpa [Q] using hz
    have hz1 : z + 1 = 0 := eq_zero_of_pow_eq_zero hz0
    have hz' : z = -1 := by linear_combination hz1
    simp [hz']
  have hPclass : WeightedClass beta hbeta n P := by
    constructor
    · exact (sourceTransform_inverse_natDegree beta hbeta Q).trans hQdeg
    · simpa only [P, LinearEquiv.apply_symm_apply] using hQroots
  let z : ℂ := -(beta : ℂ) - ((n - 1 : ℕ) : ℂ)
  have hz : (P.map Complex.ofRealHom).eval z = 0 := by
    dsimp [P]
    rw [sourceTransform_inverse_eval]
    have h := source_extremal_zero beta hbeta n hn
    rw [parameterPolynomial_replicate] at h
    simpa [Q, z, Polynomial.map_pow, Polynomial.map_add, Polynomial.map_C, add_comm] using h
  have hn1 : 1 ≤ n := hn
  have hnreal : (1 : ℝ) ≤ n := by exact_mod_cast hn1
  have hzreal : z = ((-((n : ℝ) - 1 + beta) : ℝ) : ℂ) := by
    dsimp [z]
    rw [Nat.cast_sub hn1]
    push_cast
    ring
  have hnorm : ‖z‖ = (n : ℝ) - 1 + beta := by
    rw [hzreal, Complex.norm_real, Real.norm_eq_abs, abs_neg,
      abs_of_pos (by linarith)]
  exact ⟨P, hPclass, z, hz, hnorm⟩

/-- The sharp weighted radius, including attainment, for every positive real
weight and every positive degree. -/
theorem weighted_radius_isGreatest (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) (hn : 0 < n) :
    IsGreatest (weightedRootModuli beta hbeta n) ((n : ℝ) - 1 + beta) := by
  constructor
  · obtain ⟨P, hP, z, hz, hnorm⟩ := weighted_extremal_polynomial beta hbeta n hn
    exact ⟨P, hP, z, hz, hnorm.symm⟩
  · intro r hr
    obtain ⟨P, hP, z, hz, rfl⟩ := hr
    exact weighted_root_modulus beta hbeta n hn P hP z hz

theorem weighted_radius_sup (beta : ℝ) (hbeta : 0 < beta) (n : ℕ) (hn : 0 < n) :
    sSup (weightedRootModuli beta hbeta n) = (n : ℝ) - 1 + beta :=
  (weighted_radius_isGreatest beta hbeta n hn).csSup_eq

theorem unit_weight_radius_sup (n : ℕ) (hn : 0 < n) :
    sSup (weightedRootModuli 1 (by norm_num) n) = (n : ℝ) := by
  have h := weighted_radius_sup 1 (by norm_num) n hn
  simpa using h

end VishnyakovaRootRadius
