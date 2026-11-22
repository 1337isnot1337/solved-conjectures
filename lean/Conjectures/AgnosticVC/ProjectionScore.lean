module

public import Conjectures.AgnosticVC.ProjectionConditional
public import Conjectures.AgnosticVC.ProjectionBudget
public import Conjectures.AgnosticVC.Parameters
public import Conjectures.AgnosticVC.OptimizerLossDeletion
import Mathlib.Tactic

@[expose] public section

/-! Identification of the multiscale operator with the entropy Hessian in score coordinates. -/

namespace AgnosticVC

open Finset
open scoped BigOperators InnerProductSpace

variable {I H X : Type*} [Fintype I] [DecidableEq I]

private def sliceEquivCard (m : ℕ) :
    ProjectionSlice I m ≃ {M : Finset I // M.card = m} where
  toFun M := ⟨M.1, (mem_powersetCard.mp M.2).2⟩
  invFun M := ⟨M.1, mem_powersetCard.mpr ⟨subset_univ _, M.2⟩⟩
  left_inv _ := rfl
  right_inv _ := rfl

private theorem averagedProjection_apply_card_eq
    {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    (S : Finset I → Submodule ℝ E) [∀ s, (S s).HasOrthogonalProjection]
    (m : ℕ) (u : E) :
    averagedProjection S m u =
      (Fintype.card {M : Finset I // M.card = m} : ℝ)⁻¹ •
        ∑ M : {M : Finset I // M.card = m}, (S M.1).starProjection u := by
  rw [averagedProjection, smul_apply, _root_.sum_apply, Fintype.card_congr (sliceEquivCard m)]
  congr 1
  exact Fintype.sum_equiv (sliceEquivCard m) _ _ fun _ => rfl

private noncomputable def embedLinear {A : Type*} (p : A → ℝ) :
    (A → ℝ) →ₗ[ℝ] EuclideanSpace ℝ A where
  toFun := probabilityEmbed p
  map_add' f g := by
    ext a
    simp [mul_add]
  map_smul' r f := by
    ext a
    simp [mul_left_comm]

private theorem traceProjection_restrictTrace (predict : H → X → Bool) (x : I → X)
    (σ : Schedule) (q : TraceSpace predict x → ℝ) (k : SampleSubset I σ) :
    traceProjectionSubspace (sampleFamily predict x) q k.2.1 =
      probabilityPartition q (restrictTrace predict x σ k) := by
  apply le_antisymm <;> apply probabilityPartition_mono
  · intro a b h
    exact congrArg Subtype.val h
  · intro a b h
    exact Subtype.ext h

/-- The schedule Hessian acts by the multiscale projection operator after conjugation. -/
theorem traceProjection_hessian (predict : H → X → Bool) (x : I → X) (n d : ℕ)
    (p v : TraceSpace predict x → ℝ) (hp : ∀ a, 0 < p a) :
    projectionScaleOperator (traceProjectionSubspace (sampleFamily predict x) p) d (depth n d)
        (Real.sqrt ((n : ℝ) / d)) (probabilityEmbed p (fun a => v a / p a)) =
      probabilityEmbed p (entropyHessian (schedule n d).temperature
        (restrictionCoeff (schedule n d)) (restrictTrace predict x (schedule n d)) p v) := by
  let σ := schedule n d
  let q : TraceSpace predict x → ℝ := fun a => v a / p a
  let r := restrictTrace predict x σ
  let S := traceProjectionSubspace (sampleFamily predict x) p
  let L := embedLinear p
  change projectionScaleOperator S d (depth n d) _ (L q) =
    L (entropyHessian σ.temperature (restrictionCoeff σ) r p v)
  have hproj (k : SampleSubset I σ) :
      (S k.2.1).starProjection (L q) =
        L (fun a => marginal (r k) v (r k a) / marginal (r k) p (r k a)) := by
    rw [show S k.2.1 = probabilityPartition p (r k) from traceProjection_restrictTrace _ _ _ _ _]
    change (probabilityPartition p (r k)).starProjection (probabilityEmbed p q) =
      probabilityEmbed p _
    rw [probabilityPartition_projection p q (r k) hp]
    have hv : (fun a => p a * q a) = v := by
      funext a
      dsimp [q]
      field_simp [(hp a).ne']
    rw [hv]
  have hcoeff (j : Fin σ.levels) :
      projectionScaleWeight (Real.sqrt ((n : ℝ) / d)) j -
        projectionScaleWeight (Real.sqrt ((n : ℝ) / d)) (j + 1) = σ.coeff j := rfl
  have htemp : projectionScaleWeight (Real.sqrt ((n : ℝ) / d)) (depth n d + 1) =
      σ.temperature := rfl
  rw [projectionScaleOperator_eq, add_apply, smul_apply, one_apply_eq_self, _root_.sum_apply, htemp]
  simp only [smul_apply]
  have havg (j : Fin (depth n d + 1)) :
      (projectionScaleWeight (Real.sqrt ((n : ℝ) / d)) j -
        projectionScaleWeight (Real.sqrt ((n : ℝ) / d)) (j + 1)) •
        averagedProjection S (d * 4 ^ (j : ℕ)) (L q) =
        ∑ M : {M : Finset I // M.card = σ.size j},
          restrictionCoeff σ ⟨j, M⟩ •
            L (fun a => marginal (r ⟨j, M⟩) v (r ⟨j, M⟩ a) /
              marginal (r ⟨j, M⟩) p (r ⟨j, M⟩ a)) := by
    rw [hcoeff j, averagedProjection_apply_card_eq, smul_smul, smul_sum]
    apply sum_congr rfl
    intro M _
    rw [hproj ⟨j, M⟩]
    rfl
  simp_rw [havg, ← L.map_smul]
  rw [← Fintype.sum_sigma', ← map_sum L, ← L.map_add]
  congr 1
  ext a
  simp [entropyHessian, q, Finset.sum_apply]
  exact sum_congr rfl fun k _ => by cases k; rfl

/-- The square-root density sends the mass derivative to its score norm. -/
theorem traceProjection_scoreEnergy {A : Type*} [Fintype A] (p v : A → ℝ)
    (hp : ∀ a, 0 < p a) :
    ‖probabilityEmbed p (fun a => v a / p a)‖ ^ 2 = scoreEnergy p v := by
  rw [probabilityEmbed_norm_sq (fun a => (hp a).le), scoreEnergy]
  exact sum_congr rfl fun a _ => by field_simp [(hp a).ne']


private theorem expected_entropyHessian_zero {A K : Type*} [Fintype A] [Fintype K]
    {C : K → Type*} [∀ k, Fintype (C k)] (τ : ℝ) (coeff : K → ℝ)
    (r : ∀ k, A → C k) (p v : A → ℝ) (hp : ∀ a, 0 < p a) (hv : ∑ a, v a = 0) :
    expected p (entropyHessian τ coeff r p v) = 0 := by
  have hcell (k : K) : (∑ a, p a *
      (marginal (r k) v (r k a) / marginal (r k) p (r k a))) = ∑ a, v a := by
    rw [← marginal_weighted_sum (r k) p
      (fun b => marginal (r k) v b / marginal (r k) p b)]
    rw [← marginal_sum (r k) v]
    refine sum_congr rfl fun b _ => ?_
    by_cases hb : ∃ a, r k a = b
    · obtain ⟨a, rfl⟩ := hb
      field_simp [(marginal_pos (r k) hp a).ne']
    · rw [marginal_zero_of_no_preimage (r k) v hb]
      simp
  unfold expected entropyHessian
  simp only [mul_add, sum_add_distrib, mul_sum]
  have hfull (a : A) : p a * (τ * (v a / p a)) = τ * v a := by
    field_simp [(hp a).ne']
  have hswap (a : A) (k : K) : p a * (coeff k *
      (marginal (r k) v (r k a) / marginal (r k) p (r k a))) =
      coeff k * (p a * (marginal (r k) v (r k a) / marginal (r k) p (r k a))) := by ring
  simp_rw [hfull, hswap]
  rw [sum_comm (f := fun a k => coeff k *
    (p a * (marginal (r k) v (r k a) / marginal (r k) p (r k a))))]
  simp_rw [← mul_sum, hcell, hv, mul_zero, sum_const_zero, add_zero]

/-- The tangent stationarity equation conjugates to the centered forcing equation. -/
theorem traceProjection_stationary (predict : H → X → Bool) (x : I → X) (n d : ℕ)
    (p v lossRate : TraceSpace predict x → ℝ) (hp : ∀ a, 0 < p a) (hp1 : ∑ a, p a = 1)
    (hv : ∑ a, v a = 0) (c : ℝ)
    (he : ∀ a, entropyHessian (schedule n d).temperature (restrictionCoeff (schedule n d))
      (restrictTrace predict x (schedule n d)) p v a + lossRate a = c) :
    projectionScaleOperator (traceProjectionSubspace (sampleFamily predict x) p) d (depth n d)
        (Real.sqrt ((n : ℝ) / d)) (probabilityEmbed p (fun a => v a / p a)) =
      probabilityEmbed p (fun a => expected p lossRate - lossRate a) := by
  let h := entropyHessian (schedule n d).temperature (restrictionCoeff (schedule n d))
    (restrictTrace predict x (schedule n d)) p v
  have hz : expected p h = 0 := expected_entropyHessian_zero _ _ _ p v hp hv
  have hc : c = expected p lossRate := by
    have hsum := sum_congr (s₁ := (univ : Finset (TraceSpace predict x))) rfl
      (fun a _ => congrArg (fun b => p a * b) (he a))
    change (∑ a, p a * (h a + lossRate a)) = ∑ a, p a * c at hsum
    simp only [mul_add, sum_add_distrib, ← sum_mul, hp1, one_mul] at hsum
    change expected p h + expected p lossRate = c at hsum
    simpa [hz] using hsum.symm
  rw [traceProjection_hessian predict x n d p v hp]
  congr 1
  funext a
  change h a = _
  rw [← hc, eq_sub_iff_add_eq]
  exact he a

private theorem mistakeIndicator_false {I : Type*} [DecidableEq I] (y : I → Bool) (i : I)
    (h : y i = false) (a : Finset I) :
    mistakeIndicator y i a = predictionIndicator i a := by
  by_cases hi : i ∈ a <;> simp [mistakeIndicator, predictionIndicator, h, hi]

private theorem mistakeIndicator_true {I : Type*} [DecidableEq I] (y : I → Bool) (i : I)
    (h : y i = true) (a : Finset I) :
    mistakeIndicator y i a = 1 - predictionIndicator i a := by
  by_cases hi : i ∈ a <;> norm_num [mistakeIndicator, predictionIndicator, h, hi]

/-- Uniform score energy for the coordinatewise loss-removal derivatives at a common law. -/
theorem traceProjection_scoreEnergy_sum (predict : H → X → Bool) (x : I → X) (y : I → Bool)
    {n d : ℕ} (hd : 0 < d) (hn : d ≤ n)
    (hdim : (sampleFamily predict x).vcDim ≤ d)
    (hN : n < Fintype.card I) (hNn : Fintype.card I ≤ 2 * n)
    (p : TraceSpace predict x → ℝ) (hp : ∀ a, 0 < p a) (hp1 : ∑ a, p a = 1)
    (v : I → TraceSpace predict x → ℝ) (hv : ∀ i, ∑ a, v i a = 0)
    (he : ∀ i, ∃ c, ∀ a, entropyHessian (schedule n d).temperature (restrictionCoeff (schedule n d))
      (restrictTrace predict x (schedule n d)) p (v i) a + mistakeIndicator y i a.1 = c) :
    ∑ i, scoreEnergy p (v i) ≤ 64 * d := by
  let F := sampleFamily predict x
  let S := traceProjectionSubspace F p
  let J := depth n d
  let base := Real.sqrt ((n : ℝ) / d)
  let A := projectionScaleOperator S d J base
  have hbase : 0 < base := by
    have hnr : 0 < (n : ℝ) := by exact_mod_cast hd.trans_le hn
    have hdr : 0 < (d : ℝ) := by exact_mod_cast hd
    dsimp [base]
    positivity
  have hlast : d * 4 ^ J < Fintype.card I :=
    (schedule_size_le hd hn (Fin.last (depth n d))).trans_lt hN
  have hbound (i : I) : scoreEnergy p (v i) ≤
      4 * ∑ j : Fin (J + 2), (projectionScaleWeight base j)⁻¹ ^ 2 *
        ⟪projectionScaleBand S d J j (traceProjectionCentered F p i),
          traceProjectionCentered F p i⟫_ℝ := by
    let z := probabilityEmbed p (fun a => v i a / p a)
    let f (a : F) := predictionIndicator i a.1
    let μ := expected p f
    let lossRate (a : F) := mistakeIndicator y i a.1
    obtain ⟨c, hc⟩ := he i
    have hz : A z = probabilityEmbed p (fun a => expected p lossRate - lossRate a) :=
      traceProjection_stationary predict x n d p (v i) lossRate hp hp1 (hv i) c hc
    have hsolve : A z = traceProjectionCentered F p i ∨ A (-z) = traceProjectionCentered F p i := by
      by_cases hy : y i = false
      · have hl : lossRate = f := funext (fun a => mistakeIndicator_false y i hy a.1)
        rw [hl] at hz
        right
        rw [map_neg, hz]
        ext a
        simp only [probabilityEmbed_apply, PiLp.neg_apply, traceProjectionCentered]
        change -(Real.sqrt (p a) * (μ - f a)) = Real.sqrt (p a) * (f a - μ)
        ring
      · have hy' : y i = true := by cases h : y i <;> simp_all
        have hl : lossRate = fun a => 1 - f a :=
          funext (fun a => mistakeIndicator_true y i hy' a.1)
        have hμ : expected p lossRate = 1 - μ := by
          rw [hl]
          simp only [expected, mul_sub, mul_one, sum_sub_distrib, hp1, μ]
        left
        rw [hz, hμ, hl]
        congr 1
        funext a
        change 1 - μ - (1 - f a) = f a - μ
        ring
    rw [← traceProjection_scoreEnergy p (v i) hp]
    rcases hsolve with hz | hz
    · exact projectionScale_inverse_bound hbase (traceProjectionSubspace_mono F p) hlast.le hz
    · simpa only [norm_neg] using
        projectionScale_inverse_bound hbase (traceProjectionSubspace_mono F p) hlast.le hz
  exact (sum_le_sum fun i _ => hbound i).trans
    (traceProjection_budget F p hp hp1 hd (hd.trans_le hn) hdim hlast hNn)

end AgnosticVC
