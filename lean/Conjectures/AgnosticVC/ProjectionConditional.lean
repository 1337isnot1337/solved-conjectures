module

public import Conjectures.AgnosticVC.ProjectionOverlap
public import Conjectures.AgnosticVC.OptimizerEnergy
public import Conjectures.AgnosticVC.VCVariance
import Mathlib.Tactic

@[expose] public section

/-! Realization of the projection operators on a positive finite probability law. -/

namespace AgnosticVC

open Finset
open scoped BigOperators InnerProductSpace

variable {H C D : Type*} [Fintype H]

/-- Real functions embedded in Euclidean space by multiplying by the square-root density. -/
noncomputable def probabilityEmbed (p f : H → ℝ) : EuclideanSpace ℝ H :=
  WithLp.toLp 2 fun a => Real.sqrt (p a) * f a

omit [Fintype H] in
@[simp] theorem probabilityEmbed_apply (p f : H → ℝ) (a : H) :
    probabilityEmbed p f a = Real.sqrt (p a) * f a := rfl

theorem probabilityEmbed_norm_sq {p : H → ℝ} (hp : ∀ a, 0 ≤ p a) (f : H → ℝ) :
    ‖probabilityEmbed p f‖ ^ 2 = ∑ a, p a * f a ^ 2 := by
  simp only [EuclideanSpace.real_norm_sq_eq, probabilityEmbed_apply, mul_pow, Real.sq_sqrt (hp _)]

/-- The square-root-density image of functions constant on the fibers of `r`. -/
noncomputable def probabilityPartition (p : H → ℝ) (r : H → C) :
    Submodule ℝ (EuclideanSpace ℝ H) where
  carrier := {u | ∃ g : C → ℝ, u = probabilityEmbed p (g ∘ r)}
  zero_mem' := by
    refine ⟨fun _ => 0, ?_⟩
    ext a
    simp [probabilityEmbed_apply]
  add_mem' := by
    rintro _ _ ⟨f, rfl⟩ ⟨g, rfl⟩
    refine ⟨f + g, ?_⟩
    ext a
    simp [probabilityEmbed_apply, mul_add]
  smul_mem' := by
    rintro c _ ⟨f, rfl⟩
    refine ⟨c • f, ?_⟩
    ext a
    simp [probabilityEmbed_apply, mul_left_comm]

theorem probabilityPartition_mono (p : H → ℝ) {r : H → C} {s : H → D}
    (h : ∀ a b, s a = s b → r a = r b) :
    probabilityPartition p r ≤ probabilityPartition p s := by
  classical
  rintro u ⟨f, rfl⟩
  let g (b : D) := if h : ∃ a, s a = b then f (r h.choose) else 0
  refine ⟨g, ?_⟩
  ext a
  simp only [probabilityEmbed_apply, Function.comp_apply]
  congr 1
  have ha : ∃ b, s b = s a := ⟨a, rfl⟩
  rw [show g (s a) = f (r ha.choose) from dite_eq_left ha]
  rw [h _ _ ha.choose_spec]

variable [Fintype C]

/-- Projection onto a partition is conditional expectation under the weighted embedding. -/
theorem probabilityPartition_projection (p f : H → ℝ) (r : H → C)
    (hp : ∀ a, 0 < p a) :
    (probabilityPartition p r).starProjection (probabilityEmbed p f) =
      probabilityEmbed p (fun a => marginal r (fun b => p b * f b) (r a) / marginal r p (r a)) := by
  classical
  let avg (b : C) := marginal r (fun a => p a * f a) b / marginal r p b
  change (probabilityPartition p r).starProjection (probabilityEmbed p f) =
    probabilityEmbed p (avg ∘ r)
  have havg : probabilityEmbed p (avg ∘ r) ∈ probabilityPartition p r := ⟨avg, rfl⟩
  apply Submodule.eq_starProjection_of_mem_orthogonal havg
  intro u hu
  obtain ⟨g, rfl⟩ := hu
  rw [inner_sub_right]
  simp only [PiLp.inner_apply, RCLike.inner_apply, RCLike.conj_to_real, probabilityEmbed_apply,
    Function.comp_apply]
  have hprod (a : H) (z w : ℝ) :
      (Real.sqrt (p a) * z) * (Real.sqrt (p a) * w) = p a * z * w := by
    rw [show (Real.sqrt (p a) * z) * (Real.sqrt (p a) * w) =
      Real.sqrt (p a) ^ 2 * z * w by ring, Real.sq_sqrt (hp a).le]
  simp_rw [hprod]
  have h₁ := marginal_weighted_sum r (fun a => p a * f a) g
  have h₂ := marginal_weighted_sum r p (fun b => avg b * g b)
  simp only [← mul_assoc] at h₂
  rw [← h₁, ← h₂]
  apply sub_eq_zero.mpr
  refine sum_congr rfl fun b _ => ?_
  by_cases hb : ∃ a, r a = b
  · obtain ⟨a, rfl⟩ := hb
    have hp' := (marginal_pos r hp a).ne'
    dsimp [avg]
    field_simp
  · rw [marginal_zero_of_no_preimage r p (by simpa using hb),
       marginal_zero_of_no_preimage r _ (by simpa using hb)]; simp


omit [Fintype H] in
theorem probabilityEmbed_sub (p f g : H → ℝ) :
    probabilityEmbed p (f - g) = probabilityEmbed p f - probabilityEmbed p g := by
  ext a
  simp [mul_sub]

omit [Fintype H] [Fintype C] in
theorem probabilityEmbed_const_mem (p : H → ℝ) (r : H → C) (μ : ℝ) :
    probabilityEmbed p (fun _ => μ) ∈ probabilityPartition p r :=
  ⟨fun _ => μ, rfl⟩

variable {I : Type*} [Fintype I] [DecidableEq I]

/-- The finite restriction subspaces for a law on a trace family. -/
noncomputable def traceProjectionSubspace (F : Finset (Finset I)) (p : F → ℝ) (M : Finset I) :
    Submodule ℝ (EuclideanSpace ℝ F) :=
  probabilityPartition p (fun a : F => M ∩ a.1)

omit [Fintype I] in
theorem traceProjectionSubspace_mono (F : Finset (Finset I)) (p : F → ℝ) :
    Monotone (traceProjectionSubspace F p) := by
  intro M V hMV
  apply probabilityPartition_mono
  intro a b h
  calc
    M ∩ a.1 = M ∩ (V ∩ a.1) := by rw [← inter_assoc, inter_eq_left.mpr hMV]
    _ = M ∩ (V ∩ b.1) := congrArg (fun s => M ∩ s) h
    _ = M ∩ b.1 := by rw [← inter_assoc, inter_eq_left.mpr hMV]

/-- Extend a finite trace law by zero outside its given support. -/
noncomputable def traceLawExtension (F : Finset (Finset I)) (p : F → ℝ) (a : Finset I) : ℝ :=
  if h : a ∈ F then p ⟨a, h⟩ else 0

omit [Fintype I] in
private theorem extendTrace_sum (F : Finset (Finset I)) (p : F → ℝ) (g : Finset I → ℝ) :
    (∑ a ∈ F, traceLawExtension F p a * g a) = ∑ a : F, p a * g a.1 := by
  rw [← sum_attach F (fun a => traceLawExtension F p a * g a), univ_eq_attach]
  exact sum_congr rfl fun a _ => by rw [traceLawExtension, dite_eq_left a.property]

omit [Fintype I] in
private theorem traceMass_eq_marginal (F : Finset (Finset I)) (p : F → ℝ) (M v : Finset I) :
    traceMass F (traceLawExtension F p) M v = marginal (fun a : F => M ∩ a.1) p v := by
  classical
  rw [traceMass, marginal, sum_filter, sum_filter]
  have h := extendTrace_sum F p (fun a => if M ∩ a = v then 1 else 0)
  simp only [mul_ite, mul_one, mul_zero] at h
  convert h using 1
  refine sum_congr rfl fun a _ => ?_
  by_cases hs : M ∩ a.1 = v <;> simp [hs]

omit [Fintype I] in
private theorem conditionalPredictionMean_eq_marginal (F : Finset (Finset I)) (p : F → ℝ)
    (M : Finset I) (i : I) (v : Finset I) :
    conditionalPredictionMean F (traceLawExtension F p) M i v =
      marginal (fun a : F => M ∩ a.1) (fun a : F => p a * predictionIndicator i a.1) v /
      marginal (fun a : F => M ∩ a.1) p v := by
  classical
  rw [conditionalPredictionMean, traceMass_eq_marginal]
  congr 1
  rw [marginal, sum_filter, sum_filter]
  have h := extendTrace_sum F p (fun a => if M ∩ a = v ∧ i ∈ a then 1 else 0)
  simp only [mul_ite, mul_one, mul_zero] at h
  convert h using 1
  refine sum_congr rfl fun a _ => ?_
  by_cases hv : M ∩ a.1 = v <;> by_cases hi : i ∈ a.1 <;> simp [predictionIndicator, hv, hi]

/-- The norm of the orthogonal projection residual equals the finite conditional variance. -/
theorem traceProjection_residual (F : Finset (Finset I)) (p : F → ℝ)
    (hp : ∀ a, 0 < p a) (M : Finset I) (i : I) (μ : ℝ) :
    ‖probabilityEmbed p (fun a : F => predictionIndicator i a.1 - μ) -
        (traceProjectionSubspace F p M).starProjection
          (probabilityEmbed p (fun a : F => predictionIndicator i a.1 - μ))‖ ^ 2 =
      conditionalPredictionVariance F (traceLawExtension F p) M i := by
  let f (a : F) := predictionIndicator i a.1
  let r (a : F) := M ∩ a.1
  let g (a : F) := conditionalPredictionMean F (traceLawExtension F p) M i (r a)
  let c : F → ℝ := fun _ => μ
  have hconst : (traceProjectionSubspace F p M).starProjection (probabilityEmbed p c) =
      probabilityEmbed p c :=
    Submodule.starProjection_eq_self_iff.mpr (probabilityEmbed_const_mem p r μ)
  have hmean : (traceProjectionSubspace F p M).starProjection (probabilityEmbed p f) =
      probabilityEmbed p g := by
    rw [show traceProjectionSubspace F p M = probabilityPartition p r from rfl,
      probabilityPartition_projection p f r hp]
    congr 1
    ext a
    rw [show g a = conditionalPredictionMean F (traceLawExtension F p) M i (r a) from rfl,
      conditionalPredictionMean_eq_marginal]
  change ‖probabilityEmbed p (f - c) -
    (traceProjectionSubspace F p M).starProjection (probabilityEmbed p (f - c))‖ ^ 2 = _
  rw [probabilityEmbed_sub, map_sub, hconst, hmean, sub_sub_sub_cancel_right, ← probabilityEmbed_sub,
    probabilityEmbed_norm_sq (fun a => (hp a).le), conditionalPredictionVariance]
  exact (extendTrace_sum F p (fun a =>
    (predictionIndicator i a - conditionalPredictionMean F (traceLawExtension F p) M i (M ∩ a)) ^ 2)).symm

/-- Uniform averaged residual bound on a finite trace family. -/
theorem traceProjection_average_residual_le (F : Finset (Finset I)) (p : F → ℝ)
    (hp : ∀ a, 0 < p a) (hp1 : ∑ a, p a = 1)
    {m d : ℕ} (hm : m < Fintype.card I) (hd : F.vcDim ≤ d) (μ : I → ℝ) :
    let x (i : I) := probabilityEmbed p (fun a : F => predictionIndicator i a.1 - μ i)
    ∑ i, ⟪(1 - averagedProjection (traceProjectionSubspace F p) m) (x i), x i⟫_ℝ ≤
      Fintype.card I * ((d : ℝ) / (m + 1 : ℝ)) := by
  intro x
  have hx (i : I) :
      ⟪(1 - averagedProjection (traceProjectionSubspace F p) m) (x i), x i⟫_ℝ =
      (∑ M ∈ (univ : Finset I).powersetCard m, conditionalPredictionVariance F
        (traceLawExtension F p) M i) / (((univ : Finset I).powersetCard m).card : ℝ) := by
    rw [averagedProjection_residual _ m hm.le]
    simp_rw [x, traceProjection_residual F p hp]
    exact (Finset.expect_eq_sum_div_card (univ : Finset (ProjectionSlice I m))
      (fun M => conditionalPredictionVariance F (traceLawExtension F p) M i)).trans (by
        rw [card_univ, Fintype.card_coe]
        congr 1
        rw [univ_eq_attach]
        exact sum_attach ((univ : Finset I).powersetCard m)
          (fun M => conditionalPredictionVariance F (traceLawExtension F p) M i))
  have hq (a : Finset I) (ha : a ∈ F) : 0 ≤ traceLawExtension F p a := by
    simpa [traceLawExtension, ha] using (hp ⟨a, ha⟩).le
  have hq1 : ∑ a ∈ F, traceLawExtension F p a = 1 := by
    simpa using (extendTrace_sum F p (fun _ => 1)).trans (by simpa using hp1)
  have hb := average_conditionalPredictionVariance_le F (traceLawExtension F p) hq
    (univ : Finset I) m d (by simpa using hm) hd
  rw [hq1, mul_one, card_univ] at hb
  have hN : (Fintype.card I : ℝ) ≠ 0 := by exact_mod_cast (Nat.zero_lt_of_lt hm).ne'
  simp_rw [hx]
  rw [← sum_div, sum_comm]
  calc
    _ = (Fintype.card I : ℝ) * ((∑ M ∈ (univ : Finset I).powersetCard m, ∑ i,
          conditionalPredictionVariance F (traceLawExtension F p) M i) /
        ((Fintype.card I : ℝ) * (((univ : Finset I).powersetCard m).card : ℝ))) := by
      rw [div_mul_eq_div_div_swap, ← mul_div_assoc, mul_div_cancel_left₀ _ hN]
    _ ≤ _ := mul_le_mul_of_nonneg_left hb (Nat.cast_nonneg _)

end AgnosticVC
