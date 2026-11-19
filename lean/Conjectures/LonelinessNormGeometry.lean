import Conjectures.LonelinessKZBasisReduction
import Conjectures.LonelinessPrimitiveSpeeds
import Conjectures.LonelinessNearestPlanePrefix
import Conjectures.LonelinessKZGeneral

/-! The geometric inputs to the tight-runner product bounds, constructed from
the actual primitive speed vector. Only strictly lower-dimensional runner
theorems are inputs; the zero-length prefix is discharged directly. -/

namespace Loneliness.NormGeometry

open scoped BigOperators
open SubspaceDensity CoordinateSubspace

noncomputable section

def squaredNorm {n : ℕ} (v : Fin (n+1) → ℕ) : ℝ :=
  ‖KZBasis.realVector (fun i => (v i : ℤ))‖ ^ 2

theorem squaredNorm_eq_sum {n : ℕ} (v : Fin (n+1) → ℕ) :
    squaredNorm v = ∑ i, (v i : ℝ)^2 := by
  simpa [squaredNorm, KZBasis.realVector] using
    EuclideanSpace.real_norm_sq_eq (KZBasis.realVector (fun i => (v i : ℤ)))

theorem squaredNorm_pos {n : ℕ} (v : Fin (n+1) → ℕ)
    (hpositive : ∀ i, 0 < v i) : 0 < squaredNorm v := by
  rw [squaredNorm_eq_sum]
  have hzero : (0 : ℝ) < (v 0 : ℝ) := by exact_mod_cast hpositive 0
  exact (sq_pos_of_pos hzero).trans_le
    (Finset.single_le_sum (fun i _ => sq_nonneg (v i : ℝ)) (Finset.mem_univ 0))

theorem exists_tight_gram_data {n : ℕ} (v : Fin (n+1) → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 : ℝ) / (n+2 : ℕ))
    (hLRC : ∀ m : ℕ, 1 ≤ m → m < n+1 → LonelyRunnerBound m) :
    ∃ t : ℕ → ℝ,
      (∀ i < n, 0 < t i) ∧
      (∀ r ≤ n, (KZProduct.kzBound (n+1) r : ℝ) ≤
        ∑ i ∈ Finset.range r, t i) ∧
      (∀ i, i+1 < n → 3*t i ≤ 4*t (i+1)) ∧
      (∏ i ∈ Finset.range n, t i) = 1 / squaredNorm v := by
  classical
  obtain ⟨B₀, hB₀⟩ := PrimitiveBasis.primitive_speed_basis_extension v hprimitive
  obtain ⟨B, hB, hratio⟩ := KZBasis.exists_ratio_basis B₀
  have hfirst : B 0 = fun i => (v i : ℤ) := hB.trans hB₀
  let t : ℕ → ℝ := fun i =>
    ‖InnerProductSpace.gramSchmidt ℝ (KZBasis.realFamily B) (i+1)‖ ^ 2
  let w : ℕ → Fin (n+1) → ℤ := KZBasis.integerFamily B
  have hwzero : w 0 = fun i => (v i : ℤ) := by
    exact (KZBasis.integerFamily_apply B (0 : Fin (n+1))).trans hfirst
  have hwreal : integerVector (w 0) = fun i => (v i : ℝ) := by
    rw [hwzero]
    ext i
    simp [integerVector]
  have hnonzero : ∀ i, w 0 i ≠ 0 := by
    intro i
    rw [hwzero]
    exact_mod_cast (hpositive i).ne'
  have hline : spaceValue (Submodule.span ℝ {integerVector (w 0)}) ≤
      (1 : ℝ) / (n+2 : ℕ) := by
    rw [hwreal, spaceValue_speed_line]
    exact hvalue
  refine ⟨t, ?_, ?_, ?_, ?_⟩
  · intro i hi
    exact KZBasis.gs_sq_positive B (i+1) (by omega)
  · intro r hr
    by_cases hrzero : r = 0
    · subst r
      simp [KZProduct.kzBound]
    have hrpos : 0 < r := Nat.pos_of_ne_zero hrzero
    have hdim : r+1 ≤ n+1 := by omega
    have hind : LinearIndependent ℝ
        (fun i : Fin (r+1) => integerVector (w i.val)) :=
      KZBasis.integerFamily_prefix_independent B (r+1) hdim
    have hsmall : LonelyRunnerBound (n+1-r) := hLRC (n+1-r) (by omega) (by omega)
    have hgap : (1 : ℝ) / (n+2 : ℕ) ≤ 1 / ((n+1-r : ℕ) + 1) := by
      apply one_div_le_one_div_of_le (by positivity)
      exact_mod_cast (show (n+1-r)+1 ≤ n+2 by omega)
    have hprefix := NearestPlane.runner_prefix_squared_lower w r
      ((1 : ℝ) / (n+2 : ℕ))
      (by simp only [Fintype.card_fin]; omega) hind hnonzero
      (by simpa only [Fintype.card_fin] using hsmall) hline
      (by simpa only [Fintype.card_fin] using hgap)
    have hden : n+1+1-r = (n+1-r)+1 := by omega
    have hbound : (KZProduct.kzBound (n+1) r : ℝ) =
        4 * ((1 : ℝ) / ((n+1-r : ℕ)+1) - 1 / (n+2 : ℕ))^2 := by
      norm_num [KZProduct.kzBound, hden, Nat.cast_add]
    rw [hbound]
    simpa only [Fintype.card_fin, NearestPlane.tailGramSum,
      NearestPlane.euclideanVector, KZBasis.realFamily, KZBasis.realVector,
      integerVector, w, t] using hprefix
  · intro i hi
    exact hratio (i+1) (by omega) (by omega)
  · apply (eq_div_iff (squaredNorm_pos v hpositive).ne').mpr
    have hdet := KZBasis.gs_tail_product B
    rw [hfirst] at hdet
    exact hdet

/-- Any independently checked product inequality for the tight prefix system
gives the actual primitive-speed norm cutoff. The geometry is internal. -/
theorem tight_norm_cutoff {n : ℕ} (v : Fin (n+1) → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hvalue : value (List.ofFn v) ≤ (1 : ℝ) / (n+2 : ℕ))
    (hLRC : ∀ m : ℕ, 1 ≤ m → m < n+1 → LonelyRunnerBound m)
    (c : ℕ → ℝ) (C : ℝ)
    (hproduct : ∀ t : ℕ → ℝ,
      (∀ i < n, 0 < t i) →
      (∀ r ≤ n, (KZProduct.kzBound (n+1) r : ℝ) ≤
        ∑ i ∈ Finset.range r, t i) →
      (∀ i, i+1 < n → 3*t i ≤ 4*t (i+1)) →
      ∏ i ∈ Finset.range n, c i ≤ ∏ i ∈ Finset.range n, t i)
    (hmargin : 1 < C^2 * ∏ i ∈ Finset.range n, c i) :
    squaredNorm v < C^2 := by
  obtain ⟨t, ht, hp, hr, hd⟩ :=
    exists_tight_gram_data v hpositive hprimitive hvalue hLRC
  have h := KZGeneral.norm_square_cutoff n c t (squaredNorm v) 1 C
    (squaredNorm_pos v hpositive) (hproduct t ht hp hr) hd hmargin
  simpa using h

end

end Loneliness.NormGeometry
