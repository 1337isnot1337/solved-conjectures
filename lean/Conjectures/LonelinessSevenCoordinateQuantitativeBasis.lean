import Conjectures.LonelinessKZBasisReduction
import Conjectures.LonelinessPrimitiveSpeeds
import Conjectures.LonelinessNearestPlanePrefix
import Conjectures.LonelinessSevenCoordinateQuantitativeArithmetic
import Conjectures.LonelinessSevenCoordinateMinorBound

/-! An actual rational plane close to a large primitive seven-speed line.
The plane is the first two columns of the checked reduced integer basis.
Every bound is obtained from that basis and the five-speed runner theorem. -/

namespace Loneliness.SevenCoordinateCritical.Quantitative

open scoped BigOperators
open CoordinateSubspace SubspaceDensity

noncomputable section

def basisPlane (B : Module.Basis (Fin 7) ℤ (Fin 7 → ℤ)) :
    Submodule ℚ (Fin 7 → ℚ) :=
  Submodule.span ℚ {(fun i => (B 0 i : ℚ)), (fun i => (B 1 i : ℚ))}

theorem basisPlane_eq_prefix
    (B : Module.Basis (Fin 7) ℤ (Fin 7 → ℤ)) :
    basisPlane B = NearestPlane.rationalPrefix (KZBasis.integerFamily B) 2 := by
  unfold basisPlane NearestPlane.rationalPrefix
  congr 1
  ext x
  constructor
  · rintro (hx | hx)
    · exact ⟨0, by simpa only [KZBasis.integerFamily_apply B (0 : Fin 7)] using hx.symm⟩
    · exact ⟨1, by simpa only [KZBasis.integerFamily_apply B (1 : Fin 7)] using hx.symm⟩
  · rintro ⟨i, rfl⟩
    fin_cases i
    · simp only [KZBasis.integerFamily_apply B (0 : Fin 7)]
      exact Set.mem_insert _ _
    · simp only [KZBasis.integerFamily_apply B (1 : Fin 7)]
      exact Set.mem_insert_of_mem _ (Set.mem_singleton _)

theorem basisPlane_realSpan
    (B : Module.Basis (Fin 7) ℤ (Fin 7 → ℤ)) :
    realSpan (basisPlane B) = NearestPlane.coordinatePrefix (KZBasis.integerFamily B) 2 := by
  rw [basisPlane_eq_prefix, NearestPlane.realSpan_rationalPrefix]

theorem basisPlane_finrank
    (B : Module.Basis (Fin 7) ℤ (Fin 7 → ℤ)) :
    Module.finrank ℚ (basisPlane B) = 2 := by
  rw [← finrank_realSpan, basisPlane_realSpan]
  exact NearestPlane.coordinatePrefix_finrank _ 2
    (KZBasis.integerFamily_prefix_independent B 2 (by decide))

theorem basisPlane_coordinateFree
    (B : Module.Basis (Fin 7) ℤ (Fin 7 → ℤ)) (hfirst : ∀ i, B 0 i ≠ 0) :
    CoordinateFree (basisPlane B) := by
  intro i
  refine ⟨(fun j => (B 0 j : ℚ)), Submodule.subset_span (by simp [basisPlane]), ?_⟩
  exact_mod_cast hfirst i

/-- The norm is Euclidean, the plane contains the original integer vector,
and every minor bound refers to its actual integer spanning columns. -/
theorem exists_near_plane (hfive : LonelyRunnerBound 5) (v : Fin 7 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : value (List.ofFn v) < (1 / 7 : ℝ))
    (hnorm : normCutoff ≤ ‖KZBasis.realVector (fun i => (v i : ℤ))‖) :
    ∃ (B : Module.Basis (Fin 7) ℤ (Fin 7 → ℤ)) (A : ℝ),
      B 0 = (fun i => (v i : ℤ)) ∧ CoordinateFree (basisPlane B) ∧
      Module.finrank ℚ (basisPlane B) = 2 ∧ 0 < A ∧
      (∀ i j, |(minor (B 0) (B 1) i j : ℝ)| ≤ A) ∧
      spaceValue (realSpan (basisPlane B)) < 1/7 + 1/(28*A) ∧
      spaceValue (realSpan (basisPlane B)) < 229/1596 ∧
      spaceValue (realSpan (basisPlane B)) < 1/6 := by
  classical
  obtain ⟨B₀, hB₀⟩ := PrimitiveBasis.primitive_speed_basis_extension v hprimitive
  obtain ⟨B, hB, hratio⟩ := KZBasis.exists_ratio_basis B₀
  have hfirst : B 0 = fun i => (v i : ℤ) := hB.trans hB₀
  let V := ‖KZBasis.realVector (B 0)‖
  let t : ℕ → ℝ := fun i =>
    ‖InnerProductSpace.gramSchmidt ℝ (KZBasis.realFamily B) (i+1)‖^2
  let w := KZBasis.integerFamily B
  have hV : normCutoff ≤ V := by simpa only [V, hfirst] using hnorm
  have ht (i : ℕ) (hi : i < 6) : 0 < t i :=
    KZBasis.gs_sq_positive B (i+1) (by omega)
  have hr (i : ℕ) (hi : i+1 < 6) : 3*t i ≤ 4*t (i+1) :=
    hratio (i+1) (by omega) (by omega)
  have hwzero : w 0 = fun i => (v i : ℤ) := by
    exact (KZBasis.integerFamily_apply B (0 : Fin 7)).trans hfirst
  have hwreal : integerVector (w 0) = fun i => (v i : ℝ) := by
    rw [hwzero]
    ext i
    simp only [integerVector, Int.cast_natCast]
  have hnonzero (i : Fin 7) : w 0 i ≠ 0 := by
    rw [hwzero]
    exact_mod_cast (hpositive i).ne'
  have hline : spaceValue (Submodule.span ℝ {integerVector (w 0)}) =
      value (List.ofFn v) := by
    rw [hwreal, spaceValue_speed_line]
  have hfamily : (fun j => NearestPlane.euclideanVector (w j)) =
      KZBasis.realFamily B := rfl
  have hprefix : (1 / 441 : ℝ) ≤ t 0 + t 1 := by
    have hp := NearestPlane.runner_prefix_squared_lower w 2 (1/7 : ℝ)
      (by norm_num) (KZBasis.integerFamily_prefix_independent B 3 (by decide))
      hnonzero (by simpa using hfive) (by rw [hline]; exact hbelow.le) (by norm_num)
    norm_num only [Fintype.card_fin, NearestPlane.tailGramSum, hfamily,
      Finset.sum_range_succ, Finset.sum_range_zero, zero_add, t] at hp ⊢
    exact hp
  have hdet : V^2 * (t 0*t 1*t 2*t 3*t 4*t 5) = 1 := by
    have h := KZBasis.gs_tail_product B
    simpa only [V, t, Finset.prod_range_succ, Finset.prod_range_zero,
      one_mul, mul_comm] using h
  have hsmall := first_plane_area_small V (t 0) (t 1) (t 2) (t 3) (t 4) (t 5)
    hV (ht 0 (by decide)) (ht 1 (by decide)) (ht 2 (by decide))
    (ht 3 (by decide)) (ht 4 (by decide)) (ht 5 (by decide))
    (hr 0 (by decide)) (hr 1 (by decide)) (hr 2 (by decide))
    (hr 3 (by decide)) (hr 4 (by decide)) hprefix hdet
  let A := V * ‖InnerProductSpace.gramSchmidt ℝ (KZBasis.realFamily B) 1‖
  have hA : 0 < A := by
    have hVpos := normCutoff_pos.trans_le hV
    have hgs : 0 < ‖InnerProductSpace.gramSchmidt ℝ (KZBasis.realFamily B) 1‖ := by
      have h := ht 0 (by decide)
      dsimp [t] at h
      nlinarith [norm_nonneg (InnerProductSpace.gramSchmidt ℝ (KZBasis.realFamily B) 1)]
    exact mul_pos hVpos hgs
  have harea : A^2 = V^2*t 0 := by simp [A, t, mul_pow]
  have hround : spaceValue (realSpan (basisPlane B)) ≤
      value (List.ofFn v) + (1/2 : ℝ)*Real.sqrt (t 0) := by
    have h := NearestPlane.prefix_spaceValue_le w 1
    rw [hline] at h
    simpa only [basisPlane_realSpan, NearestPlane.tailGramSum, hfamily,
      Finset.sum_range_one, t] using h
  obtain ⟨hgap, htangent, hsixth⟩ := plane_value_bounds V A (t 0)
    (value (List.ofFn v)) (spaceValue (realSpan (basisPlane B))) hV hA
    (ht 0 (by decide)).le harea (by rw [harea]; exact hsmall) hbelow hround
  refine ⟨B, A, hfirst, ?_, basisPlane_finrank B, hA, ?_, hgap, htangent, hsixth⟩
  · apply basisPlane_coordinateFree
    intro i
    rw [hfirst]
    exact_mod_cast (hpositive i).ne'
  · intro i j
    exact basis_minor_abs_le B i j

end

end Loneliness.SevenCoordinateCritical.Quantitative
