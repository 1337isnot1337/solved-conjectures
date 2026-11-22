module

public import Mathlib.Analysis.InnerProductSpace.Positive
public import Mathlib.Algebra.BigOperators.Expect
import Mathlib.Data.Fintype.Perm
import Mathlib.Data.Fin.Tuple.Basic
import Mathlib.Tactic

@[expose] public section

/-! Uniform slice averages and the overlap estimate for nested orthogonal projections. -/

namespace AgnosticVC

open scoped BigOperators InnerProductSpace
open Finset

variable {α : Type*} [Fintype α] [DecidableEq α]
variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- The finite type of subsets of size `m`. -/
abbrev ProjectionSlice (α : Type*) [Fintype α] [DecidableEq α] (m : ℕ) :=
  ↥(powersetCard m (univ : Finset α))

private theorem slice_card {m : ℕ} (s : ProjectionSlice α m) :
    (s : Finset α).card = m :=
  (mem_powersetCard.mp s.property).2

private theorem slice_nonempty {m : ℕ} (h : m ≤ Fintype.card α) :
    Nonempty (ProjectionSlice α m) := by
  obtain ⟨s, hs⟩ := powersetCard_nonempty.mpr (by simpa using h : m ≤ (univ : Finset α).card)
  exact ⟨⟨s, hs⟩⟩

private def slicePerm (σ : Equiv.Perm α) (m : ℕ) :
    Equiv.Perm (ProjectionSlice α m) where
  toFun s := ⟨(s : Finset α).map σ.toEmbedding, by simp [slice_card]⟩
  invFun s := ⟨(s : Finset α).map σ.symm.toEmbedding, by simp [slice_card]⟩
  left_inv s := by
    apply Subtype.ext
    exact σ.finsetCongr.left_inv (s : Finset α)
  right_inv s := by
    apply Subtype.ext
    exact σ.finsetCongr.right_inv (s : Finset α)

private theorem slicePerm_trans {m : ℕ} (σ τ : Equiv.Perm α) (s : ProjectionSlice α m) :
    slicePerm τ m (slicePerm σ m s) = slicePerm (σ.trans τ) m s :=
  Subtype.ext (map_map _ _ _)

private theorem slicePerm_transitive {m : ℕ} (s t : ProjectionSlice α m) :
    ∃ σ : Equiv.Perm α, slicePerm σ m s = t := by
  classical
  let e : (s : Finset α) ≃ (t : Finset α) :=
    Fintype.equivOfCardEq (by simp [slice_card])
  refine ⟨e.extendSubtype, Subtype.ext ?_⟩
  apply eq_of_subset_of_card_le
  · intro x hx
    obtain ⟨y, hy, rfl⟩ := mem_map.mp hx
    exact e.extendSubtype_mem y hy
  · simp [slice_card]

/-- A uniform permutation of any fixed subset is uniform on its cardinality slice. -/
private theorem expect_slicePerm {V : Type*} [AddCommMonoid V] [Module ℚ≥0 V]
    {m : ℕ} (s : ProjectionSlice α m) (f : ProjectionSlice α m → V) :
    (𝔼 σ : Equiv.Perm α, f (slicePerm σ m s)) = 𝔼 t, f t := by
  let : Nonempty (ProjectionSlice α m) := ⟨s⟩
  let : Nonempty (Equiv.Perm α) := ⟨Equiv.refl α⟩
  have same (t : ProjectionSlice α m) :
      (𝔼 σ : Equiv.Perm α, f (slicePerm σ m t)) =
        𝔼 σ : Equiv.Perm α, f (slicePerm σ m s) := by
    obtain ⟨σ, rfl⟩ := slicePerm_transitive s t
    exact Fintype.expect_equiv (Equiv.mulRight σ)
      _ _ (fun τ => congrArg f (slicePerm_trans σ τ s))
  calc
    _ = 𝔼 t : ProjectionSlice α m, 𝔼 σ : Equiv.Perm α, f (slicePerm σ m t) := by
      simp_rw [same, Fintype.expect_const]
    _ = 𝔼 σ : Equiv.Perm α, 𝔼 t : ProjectionSlice α m, f (slicePerm σ m t) :=
      expect_comm _ _ _
    _ = _ := by
      have hp (σ : Equiv.Perm α) :
          (𝔼 t : ProjectionSlice α m, f (slicePerm σ m t)) = 𝔼 t, f t :=
        Fintype.expect_equiv (slicePerm σ m) _ _ (fun _ => rfl)
      simp_rw [hp, Fintype.expect_const]

private theorem realExpect_mono {ι : Type*} [Fintype ι] {f g : ι → ℝ}
    (h : ∀ i, f i ≤ g i) : (𝔼 i, f i) ≤ 𝔼 i, g i := by
  rw [Fintype.expect_eq_sum_div_card, Fintype.expect_eq_sum_div_card]
  exact div_le_div_of_nonneg_right (sum_le_sum fun i _ => h i) (by positivity)

noncomputable local instance : Module ℚ≥0 E := Module.compHom E (algebraMap ℚ≥0 ℝ)

private theorem expect_inner_left {ι : Type*} [Fintype ι] (f : ι → E) (x : E) :
    (𝔼 i, ⟪f i, x⟫_ℝ) = ⟪𝔼 i, f i, x⟫_ℝ := by
  simp only [expect]
  change (_ : ℚ≥0) • (∑ i, ⟪f i, x⟫_ℝ) =
    ⟪((↑((_ : ℚ≥0)⁻¹) : ℝ)) • ∑ i, f i, x⟫_ℝ
  rw [real_inner_smul_left, sum_inner]
  rfl

private theorem expect_norm_sum_centered {ι : Type*} [Fintype ι] [Nonempty ι]
    (f : ι → E) (hf : (𝔼 i, f i) = 0) (k : ℕ) :
    (𝔼 u : Fin k → ι, ‖∑ i, f (u i)‖ ^ 2) = k * (𝔼 i, ‖f i‖ ^ 2) := by
  classical
  induction k with
  | zero => simp
  | succ k ih =>
    let e := Fin.consEquiv (fun _ : Fin (k + 1) => ι)
    rw [show (𝔼 u : Fin (k + 1) → ι, ‖∑ i, f (u i)‖ ^ 2) =
        𝔼 u : ι × (Fin k → ι), ‖∑ i, f (e u i)‖ ^ 2 from
      (Fintype.expect_equiv e _ _ (fun _ => rfl)).symm, ← univ_product_univ,
      expect_product' (f := fun t u => ‖∑ i, f (e (t, u) i)‖ ^ 2)]
    simp only [e, Fin.consEquiv_apply, Fin.sum_univ_succ, Fin.cons_zero, Fin.cons_succ,
      norm_add_sq_real, expect_add_distrib, Nat.cast_succ]
    simp_rw [Fintype.expect_const, ih]
    rw [expect_comm (f := fun x (u : Fin k → ι) => 2 * ⟪f x, ∑ i, f (u i)⟫_ℝ)]
    have hcross (u : Fin k → ι) :
        (𝔼 x, (2 * ⟪f x, ∑ i, f (u i)⟫_ℝ)) = 0 := by
      rw [← mul_expect, expect_inner_left, hf, inner_zero_left, mul_zero]
    simp_rw [hcross]
    simp
    ring

private theorem centered_second_moment {ι : Type*} [Fintype ι] [Nonempty ι]
    (f : ι → E) :
    (𝔼 i, ‖f i - (𝔼 j, f j)‖ ^ 2) ≤ 𝔼 i, ‖f i‖ ^ 2 := by
  let μ : E := 𝔼 j, f j
  change (𝔼 i, ‖f i - μ‖ ^ 2) ≤ _
  simp_rw [norm_sub_sq_real, expect_add_distrib, expect_sub_distrib]
  rw [← mul_expect, expect_inner_left, Fintype.expect_const, real_inner_self_eq_norm_sq]
  nlinarith [sq_nonneg ‖μ‖]

variable (S : Finset α → Submodule ℝ E) [∀ s, (S s).HasOrthogonalProjection]

/-- Average orthogonal projection on the prediction subspaces at one subset size. -/
noncomputable def averagedProjection (m : ℕ) : E →L[ℝ] E :=
  (Fintype.card (ProjectionSlice α m) : ℝ)⁻¹ •
    ∑ s : ProjectionSlice α m, (S (s : Finset α)).starProjection

theorem averagedProjection_apply (m : ℕ) (x : E) :
    averagedProjection S m x = 𝔼 s : ProjectionSlice α m, (S (s : Finset α)).starProjection x := by
  rw [averagedProjection, smul_apply, _root_.sum_apply, expect, card_univ]
  change _ = (↑((Fintype.card (ProjectionSlice α m) : ℚ≥0)⁻¹) : ℝ) •
    (∑ s : ProjectionSlice α m, (S (s : Finset α)).starProjection x)
  simp

theorem averagedProjection_isPositive (m : ℕ) : (averagedProjection S m).IsPositive := by
  unfold averagedProjection
  apply ContinuousLinearMap.IsPositive.smul_of_nonneg _ (inv_nonneg.mpr (Nat.cast_nonneg _))
  exact ContinuousLinearMap.isPositive_sum univ
    (fun s _ => (Submodule.isSymmetricProjection_starProjection (S (s : Finset α))).isPositive)

private theorem starProjection_form (U : Submodule ℝ E) [U.HasOrthogonalProjection] (x : E) :
    ⟪U.starProjection x, x⟫_ℝ = ‖U.starProjection x‖ ^ 2 := by
  simpa only [RCLike.re_to_real, Submodule.starProjection_apply, Submodule.norm_coe] using
    (U.re_inner_starProjection_eq_normSq x)

theorem starProjection_residual (U : Submodule ℝ E) [U.HasOrthogonalProjection] (x : E) :
    ⟪x - U.starProjection x, x⟫_ℝ = ‖x - U.starProjection x‖ ^ 2 := by
  rw [inner_sub_left, real_inner_self_eq_norm_sq, starProjection_form]
  have h := U.norm_sq_eq_add_norm_sq_starProjection x
  have hP : Uᗮ.starProjection x = x - U.starProjection x :=
    eq_sub_of_add_eq' (U.starProjection_add_starProjection_orthogonal x)
  rw [hP] at h
  linarith

private theorem starProjection_best (U : Submodule ℝ E) [U.HasOrthogonalProjection]
    (x p : E) (hp : p ∈ U) :
    ‖x - U.starProjection x‖ ^ 2 ≤ ‖x - p‖ ^ 2 := by
  have hp' : U.starProjection (x - p) = U.starProjection x - p := by
    rw [map_sub, Submodule.starProjection_eq_self_iff.mpr hp]
  have h := U.norm_sq_eq_add_norm_sq_starProjection (x - p)
  have hP : Uᗮ.starProjection (x - p) = x - U.starProjection x := by
    calc
      Uᗮ.starProjection (x - p) = (x - p) - U.starProjection (x - p) :=
        eq_sub_of_add_eq' (U.starProjection_add_starProjection_orthogonal (x - p))
      _ = _ := by rw [hp', sub_sub_sub_cancel_right]
  rw [hp', hP] at h
  nlinarith [sq_nonneg ‖U.starProjection x - p‖]

theorem averagedProjection_le_one (m : ℕ) (hm : m ≤ Fintype.card α) :
    averagedProjection S m ≤ 1 := by
  let := slice_nonempty (α := α) hm
  apply ContinuousLinearMap.le_def.mpr
  apply (ContinuousLinearMap.isPositive_iff _).mpr
  refine ⟨ContinuousLinearMap.isPositive_one.isSymmetric.sub
    (averagedProjection_isPositive S m).isSymmetric, fun x => ?_⟩
  have h : 0 ≤ (𝔼 s : ProjectionSlice α m, ‖x - (S (s : Finset α)).starProjection x‖ ^ 2) := by
    rw [← Fintype.expect_const (ι := ProjectionSlice α m) (0 : ℝ)]
    exact realExpect_mono fun _ => sq_nonneg _
  simpa only [← starProjection_residual, inner_sub_left, expect_sub_distrib,
    Fintype.expect_const, expect_inner_left, ← averagedProjection_apply, sub_apply,
    one_apply_eq_self] using h


/-- Quadratic form of the averaged residual equals the mean squared residual. -/
theorem averagedProjection_residual (m : ℕ) (hm : m ≤ Fintype.card α) (x : E) :
    ⟪(1 - averagedProjection S m) x, x⟫_ℝ =
      𝔼 t : ProjectionSlice α m, ‖x - (S (t : Finset α)).starProjection x‖ ^ 2 := by
  let : Nonempty (ProjectionSlice α m) := slice_nonempty hm
  simp_rw [← starProjection_residual, inner_sub_left, expect_sub_distrib, Fintype.expect_const,
    expect_inner_left, ← averagedProjection_apply, sub_apply, one_apply_eq_self]
  exact inner_sub_left _ _ _

/-- Ordering by subset size holds even when the projections do not commute. -/
theorem averagedProjection_mono (hS : Monotone S) {m M : ℕ}
    (hmM : m ≤ M) (hM : M ≤ Fintype.card α) :
    averagedProjection S m ≤ averagedProjection S M := by
  obtain ⟨s⟩ := slice_nonempty (α := α) (hmM.trans hM)
  obtain ⟨t, hst, ht⟩ := exists_superset_card_eq (s := (s : Finset α))
    (by simpa only [slice_card] using hmM) hM
  let t' : ProjectionSlice α M := ⟨t, mem_powersetCard.mpr ⟨subset_univ _, ht⟩⟩
  have hp (σ : Equiv.Perm α) :
    (S (slicePerm σ m s : Finset α)).starProjection ≤
      (S (slicePerm σ M t' : Finset α)).starProjection :=
    Submodule.starProjection_le_starProjection_iff.mpr (hS (map_subset_map.mpr hst))
  apply ContinuousLinearMap.le_def.mpr
  apply (ContinuousLinearMap.isPositive_iff _).mpr
  refine ⟨(averagedProjection_isPositive S M).isSymmetric.sub
    (averagedProjection_isPositive S m).isSymmetric, fun x => ?_⟩
  rw [sub_apply, inner_sub_left, sub_nonneg, averagedProjection_apply, averagedProjection_apply,
    ← expect_inner_left, ← expect_inner_left, ← expect_slicePerm s, ← expect_slicePerm t']
  apply realExpect_mono
  intro σ
  have h := (ContinuousLinearMap.le_def.mp (hp σ)).inner_nonneg_left x
  simpa [inner_sub_left, sub_nonneg] using h

/-- Overlap in quadratic-form form. Equivalently,
`K_m^(1/2) (1 - K_M) K_m^(1/2) ≤ (1/k) • 1` on the range of `K_m`. -/
theorem averagedProjection_overlap (hS : Monotone S) {m M k : ℕ}
    (hk : 0 < k) (hmM : k * m ≤ M) (hM : M ≤ Fintype.card α) (y : E) :
    ⟪(1 - averagedProjection S M) (averagedProjection S m y), averagedProjection S m y⟫_ℝ ≤
      (k : ℝ)⁻¹ * ⟪averagedProjection S m y, y⟫_ℝ := by
  classical
  let : Nonempty (ProjectionSlice α M) := slice_nonempty hM
  let : Nonempty (ProjectionSlice α m) :=
    slice_nonempty ((Nat.le_mul_of_pos_left m hk).trans (hmM.trans hM))
  let f (s : ProjectionSlice α m) : E := (S (s : Finset α)).starProjection y
  let x := averagedProjection S m y
  have hx : x = 𝔼 s, f s := averagedProjection_apply S m y
  have unionCard (u : Fin k → ProjectionSlice α m) :
      (univ.biUnion (fun i => (u i : Finset α))).card ≤ M :=
    (card_biUnion_le_card_mul _ _ m fun i _ => (slice_card (u i)).le).trans
      (by simpa using hmM)
  let pad (u : Fin k → ProjectionSlice α m) : ProjectionSlice α M :=
    ⟨(exists_superset_card_eq (unionCard u) hM).choose, mem_powersetCard.mpr
      ⟨subset_univ _, (exists_superset_card_eq (unionCard u) hM).choose_spec.2⟩⟩
  have hpad (u : Fin k → ProjectionSlice α m) (i : Fin k) :
      (u i : Finset α) ⊆ (pad u : Finset α) :=
    (subset_biUnion_of_mem (fun i => (u i : Finset α)) (mem_univ i)).trans
      (exists_superset_card_eq (unionCard u) hM).choose_spec.1
  have hbest (u : Fin k → ProjectionSlice α m) (σ : Equiv.Perm α) :
      ‖x - (S (slicePerm σ M (pad u) : Finset α)).starProjection x‖ ^ 2 ≤
        ‖(k : ℝ)⁻¹ • ∑ i, (f (slicePerm σ m (u i)) - x)‖ ^ 2 := by
    let μ : E := (k : ℝ)⁻¹ • ∑ i, f (slicePerm σ m (u i))
    have hμ : μ ∈ S (slicePerm σ M (pad u) : Finset α) := by
      apply Submodule.smul_mem
      apply Submodule.sum_mem
      intro i _
      exact hS (map_subset_map.mpr (hpad u i)) (Submodule.starProjection_apply_mem _ _)
    have heq : (k : ℝ)⁻¹ • (∑ i, (f (slicePerm σ m (u i)) - x)) = μ - x := by
      rw [sum_sub_distrib, smul_sub, sum_const, card_univ, Fintype.card_fin,
        ← Nat.cast_smul_eq_nsmul ℝ, smul_smul, inv_mul_cancel₀ (by exact_mod_cast hk.ne'), one_smul]
    rw [heq, norm_sub_rev μ x]
    exact starProjection_best _ x μ hμ
  have havg : (𝔼 t : ProjectionSlice α M, ‖x - (S (t : Finset α)).starProjection x‖ ^ 2) ≤
      𝔼 u : Fin k → ProjectionSlice α m, ‖(k : ℝ)⁻¹ • ∑ i, (f (u i) - x)‖ ^ 2 := by
    calc
      _ = 𝔼 u : Fin k → ProjectionSlice α m, 𝔼 σ : Equiv.Perm α,
          ‖x - (S (slicePerm σ M (pad u) : Finset α)).starProjection x‖ ^ 2 := by
        have hp (u : Fin k → ProjectionSlice α m) :
            (𝔼 σ : Equiv.Perm α, ‖x - (S (slicePerm σ M (pad u) : Finset α)).starProjection x‖ ^ 2) =
              𝔼 t : ProjectionSlice α M, ‖x - (S (t : Finset α)).starProjection x‖ ^ 2 :=
          expect_slicePerm (pad u) (fun t => ‖x - (S (t : Finset α)).starProjection x‖ ^ 2)
        simp_rw [hp, Fintype.expect_const]
      _ ≤ 𝔼 u : Fin k → ProjectionSlice α m, 𝔼 σ : Equiv.Perm α,
          ‖(k : ℝ)⁻¹ • ∑ i, (f (slicePerm σ m (u i)) - x)‖ ^ 2 :=
        realExpect_mono fun u => realExpect_mono (hbest u)
      _ = _ := by
        rw [expect_comm]
        have hσ (σ : Equiv.Perm α) :
            (𝔼 u : Fin k → ProjectionSlice α m,
              ‖(k : ℝ)⁻¹ • ∑ i, (f (slicePerm σ m (u i)) - x)‖ ^ 2) =
            𝔼 u : Fin k → ProjectionSlice α m, ‖(k : ℝ)⁻¹ • ∑ i, (f (u i) - x)‖ ^ 2 :=
          Fintype.expect_equiv (Equiv.piCongrRight fun _ => slicePerm σ m) _ _ (fun _ => rfl)
        simp_rw [hσ, Fintype.expect_const]
  have hmom : (𝔼 s, ‖f s‖ ^ 2) = ⟪x, y⟫_ℝ := by
    simp_rw [f, ← starProjection_form, expect_inner_left, ← averagedProjection_apply]
    rfl
  have hcen : (𝔼 s : ProjectionSlice α m, (f s - x)) = 0 := by
    simp_rw [expect_sub_distrib, Fintype.expect_const, ← hx, sub_self]
  change ⟪(1 - averagedProjection S M) x, x⟫_ℝ ≤ (k : ℝ)⁻¹ * ⟪x, y⟫_ℝ
  rw [averagedProjection_residual S M hM]
  apply havg.trans
  simp_rw [norm_smul, mul_pow, Real.norm_eq_abs, sq_abs, ← mul_expect,
    expect_norm_sum_centered (fun s => f s - x) hcen k]
  rw [← mul_assoc, show (k : ℝ)⁻¹ ^ 2 * k = (k : ℝ)⁻¹ by
    have hk' : (k : ℝ) ≠ 0 := by exact_mod_cast hk.ne'
    field_simp]
  apply mul_le_mul_of_nonneg_left _ (by positivity)
  rw [← hmom]
  rw [hx]
  exact centered_second_moment f

end AgnosticVC
