module

public import Conjectures.KVZGammaCompositionIntegral
public import Mathlib.Data.Fin.Tuple.Sort
public import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
public import Mathlib.Tactic.Positivity
public import Mathlib.Tactic.Linarith

/-!
# Strict signs under integral composition

Sorting the integration nodes preserves a product of two determinants.
Repeated nodes make both determinants zero. An explicit ordered box has
positive measure and gives strict positivity of the signed integral.
-/

@[expose] public section

namespace KVZGamma

open MeasureTheory Matrix Set
open scoped BigOperators

noncomputable section

variable {n : ℕ} {E : Type*}

theorem functionDet_nodes_perm (A : Fin n → E → ℝ) (t : Fin n → E)
    (σ : Equiv.Perm (Fin n)) :
    functionDet A (t ∘ σ) = ((Equiv.Perm.sign σ : ℤ) : ℝ) * functionDet A t := by
  exact Matrix.det_permute' σ (Matrix.of fun i j => A i (t j))

theorem functionDet_mul_nodes_perm (A B : Fin n → E → ℝ) (t : Fin n → E)
    (σ : Equiv.Perm (Fin n)) :
    functionDet A (t ∘ σ) * functionDet B (t ∘ σ) = functionDet A t * functionDet B t := by
  rw [functionDet_nodes_perm, functionDet_nodes_perm]
  calc
    _ = ((((Equiv.Perm.sign σ : ℤ) : ℝ) * ((Equiv.Perm.sign σ : ℤ) : ℝ))) *
        (functionDet A t * functionDet B t) := by ring
    _ = functionDet A t * functionDet B t := by
      rw [← Int.cast_mul, Int.units_coe_mul_self, Int.cast_one, one_mul]

theorem functionDet_eq_zero_of_not_injective (A : Fin n → E → ℝ)
    (t : Fin n → E) (ht : ¬Function.Injective t) : functionDet A t = 0 := by
  classical
  obtain ⟨i, j, heq, hne⟩ := Function.not_injective_iff.mp ht
  exact Matrix.det_zero_of_column_eq hne (fun k => congrArg (A k) heq)

/-- Ordered-node signs determine nonnegativity on every positive tuple. -/
theorem signed_det_product_nonneg (A B : Fin n → ℝ → ℝ) (s : ℝ)
    (h : ∀ t : Fin n → ℝ, (∀ i, 0 < t i) → StrictMono t →
      0 < s * (functionDet A t * functionDet B t))
    (t : Fin n → ℝ) (ht : ∀ i, 0 < t i) :
    0 ≤ s * (functionDet A t * functionDet B t) := by
  classical
  by_cases hinj : Function.Injective t
  · have hm : StrictMono (t ∘ Tuple.sort t) :=
      (Tuple.monotone_sort t).strictMono_of_injective (hinj.comp (Tuple.sort t).injective)
    have hp := h (t ∘ Tuple.sort t) (fun i => ht (Tuple.sort t i)) hm
    rw [functionDet_mul_nodes_perm] at hp
    exact hp.le
  · rw [functionDet_eq_zero_of_not_injective A t hinj]
    simp

private def orderedBox (n : ℕ) : Set (Fin n → ℝ) :=
  Set.univ.pi fun i => Ioo (2 * (i.val : ℝ) + 1) (2 * (i.val : ℝ) + 2)

private theorem orderedBox_positive {t : Fin n → ℝ} (ht : t ∈ orderedBox n) :
    ∀ i, 0 < t i := by
  intro i
  have hi := ht i (Set.mem_univ i)
  have hn : (0 : ℝ) ≤ i.val := Nat.cast_nonneg _
  change 2 * (i.val : ℝ) + 1 < t i ∧ t i < 2 * (i.val : ℝ) + 2 at hi
  linarith

private theorem orderedBox_strictMono {t : Fin n → ℝ} (ht : t ∈ orderedBox n) :
    StrictMono t := by
  intro i j hij
  have hi := ht i (Set.mem_univ i)
  have hj := ht j (Set.mem_univ j)
  have hnat : i.val + 1 ≤ j.val := hij
  have hij' : (i.val : ℝ) + 1 ≤ j.val := by exact_mod_cast hnat
  change 2 * (i.val : ℝ) + 1 < t i ∧ t i < 2 * (i.val : ℝ) + 2 at hi
  change 2 * (j.val : ℝ) + 1 < t j ∧ t j < 2 * (j.val : ℝ) + 2 at hj
  linarith

private theorem orderedBox_measure :
    Measure.pi (fun _ : Fin n => volume.restrict (Ioi (0 : ℝ))) (orderedBox n) = 1 := by
  rw [orderedBox, Measure.pi_pi]
  apply Finset.prod_eq_one
  intro i _
  rw [Measure.restrict_apply measurableSet_Ioo]
  have hsub : Ioo (2 * (i.val : ℝ) + 1) (2 * (i.val : ℝ) + 2) ⊆ Ioi (0 : ℝ) := by
    intro x hx
    have hn : (0 : ℝ) ≤ i.val := Nat.cast_nonneg _
    change 0 < x
    linarith [hx.1]
  rw [Set.inter_eq_left.mpr hsub, Real.volume_Ioo]
  have hlen : (2 * (i.val : ℝ) + 2) - (2 * (i.val : ℝ) + 1) = 1 := by ring
  rw [hlen]
  norm_num

private theorem ae_positive_tuple :
    ∀ᵐ t ∂Measure.pi (fun _ : Fin n => volume.restrict (Ioi (0 : ℝ))), ∀ i, 0 < t i := by
  apply Filter.eventually_all.mpr
  intro i
  exact Measure.tendsto_eval_ae_ae.eventually (ae_restrict_mem measurableSet_Ioi)

/-- Strict signs pass through an integral composition over the positive
half-line. All scalar integrability obligations remain explicit. -/
theorem integral_composition_strict_sign (A B : Fin n → ℝ → ℝ) (s : ℝ)
    (hint : ∀ i j, Integrable (fun u => A i u * B j u) (volume.restrict (Ioi 0)))
    (hpos : ∀ t : Fin n → ℝ, (∀ i, 0 < t i) → StrictMono t →
      0 < s * (functionDet A t * functionDet B t)) :
    0 < s * Matrix.det (Matrix.of fun i j =>
      ∫ u, A i u * B j u ∂volume.restrict (Ioi 0)) := by
  let μ : Measure (Fin n → ℝ) := Measure.pi fun _ => volume.restrict (Ioi (0 : ℝ))
  let f (t : Fin n → ℝ) : ℝ := s * (functionDet A t * functionDet B t)
  have hfint : Integrable f μ := (integrable_functionDet_mul _ A B hint).const_mul s
  have hnonneg : 0 ≤ᵐ[μ] f := ae_positive_tuple.mono fun t ht =>
    signed_det_product_nonneg A B s hpos t ht
  have hsubset : orderedBox n ⊆ Function.support f := by
    intro t ht
    exact ne_of_gt (hpos t (orderedBox_positive ht) (orderedBox_strictMono ht))
  have hsupport : 0 < μ (Function.support f) := by
    have hle := measure_mono hsubset (μ := μ)
    have hb : μ (orderedBox n) = 1 := orderedBox_measure
    rw [hb] at hle
    exact lt_of_lt_of_le zero_lt_one hle
  have hposint : 0 < ∫ t, f t ∂μ :=
    (integral_pos_iff_support_of_nonneg_ae hnonneg hfint).mpr hsupport
  change 0 < ∫ t, s * (functionDet A t * functionDet B t)
    ∂Measure.pi (fun _ : Fin n => volume.restrict (Ioi (0 : ℝ))) at hposint
  rw [integral_const_mul, integral_functionDet_mul _ A B hint] at hposint
  have hfac : (0 : ℝ) < n.factorial := by exact_mod_cast Nat.factorial_pos n
  rw [mul_left_comm] at hposint
  exact (mul_pos_iff_of_pos_left hfac).mp hposint

/-- The same identity transfers a vanishing determinant to the composition. -/
theorem integral_composition_det_eq_zero (A B : Fin n → ℝ → ℝ)
    (hint : ∀ i j, Integrable (fun u => A i u * B j u) (volume.restrict (Ioi 0)))
    (hzero : ∀ t : Fin n → ℝ, (∀ i, 0 < t i) → functionDet A t * functionDet B t = 0) :
    Matrix.det (Matrix.of fun i j =>
      ∫ u, A i u * B j u ∂volume.restrict (Ioi 0)) = 0 := by
  have h : (∫ t, functionDet A t * functionDet B t
      ∂Measure.pi (fun _ : Fin n => volume.restrict (Ioi (0 : ℝ)))) = 0 := by
    apply integral_eq_zero_of_ae
    exact ae_positive_tuple.mono fun t ht => hzero t ht
  rw [integral_functionDet_mul _ A B hint] at h
  exact (mul_eq_zero.mp h).resolve_left (by exact_mod_cast Nat.factorial_ne_zero n)

end

end KVZGamma
