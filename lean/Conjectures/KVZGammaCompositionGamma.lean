module

public import Conjectures.KVZGammaCompositionSign
public import Conjectures.KVZGammaPower
public import Conjectures.KVZGammaDensity
public import Conjectures.KVZGammaConvolution

/-!
# Two integral compositions give the gamma quotient

The gamma density and power kernel are the literal scalar functions. Their
proved integral identity identifies the composition with the gamma quotient.
The determinant identity transfers both strict signs and the integer rank
cutoff without an assumed total-positivity composition theorem.
-/

@[expose] public section

namespace KVZGamma

open MeasureTheory Matrix Set
open scoped BigOperators

noncomputable section

/-- The first of the two positive-half-line integral transforms. -/
def halfKernel (δ a v : ℝ) : ℝ :=
  ∫ u, gammaDensity a u * powerKernel δ u v ∂volume.restrict (Ioi 0)

theorem halfKernel_eq (δ a v : ℝ) : halfKernel δ a v =
    ∫ u, gammaDensity a u * powerKernel δ u v ∂volume.restrict (Ioi 0) := by
  simp only [halfKernel]

/-- The unshifted source kernel, with positive denominator arguments. -/
def gammaQuotient (δ x y : ℝ) : ℝ := Real.Gamma (x + y + δ) / Real.Gamma (x + y)

theorem gammaQuotient_eq (δ x y : ℝ) : gammaQuotient δ x y =
    Real.Gamma (x + y + δ) / Real.Gamma (x + y) := by
  simp only [gammaQuotient]

theorem halfKernel_det_mul_signature_pos {r : ℕ} (δ : ℝ) (hδ : 0 < δ)
    (x v : Fin r → ℝ) (hx : StrictMono x) (hv : StrictMono v)
    (hxpos : ∀ i, 0 < x i) (hvpos : ∀ j, 0 < v j)
    (hfall : ∀ i : Fin r, falling δ i.val ≠ 0) :
    0 < Matrix.det (Matrix.of fun i j => halfKernel δ (x i) (v j)) * powerSignature δ r := by
  have hp := integral_composition_strict_sign
    (fun i u => gammaDensity (x i) u) (fun j u => powerKernel δ u (v j))
    (powerSignature δ r)
    (fun i j => gamma_power_integrable (a := x i) (δ := δ) (v := v j)
      (hxpos i) hδ (hvpos j)) ?_
  · simpa only [halfKernel, mul_comm] using hp
  · intro t ht hmono
    have hA : 0 < functionDet (fun i u => gammaDensity (x i) u) t :=
      gammaDensity_det_pos x t hx hmono hxpos ht
    have hB : 0 < functionDet (fun j u => powerKernel δ u (v j)) t *
        powerSignature δ r := by
      have heq : functionDet (fun j u => powerKernel δ u (v j)) t =
          Matrix.det (Matrix.of fun i j => powerKernel δ (t i) (v j)) := by
        exact Matrix.det_transpose (Matrix.of fun i j => powerKernel δ (t i) (v j))
      rw [heq]
      exact powerKernel_det_mul_signature_pos δ t v hmono hv ht hvpos hfall
    convert mul_pos hA hB using 1
    ring

/-- The exact all-order signed minor of the gamma quotient on positive nodes. -/
theorem gammaQuotient_det_mul_signature_pos {r : ℕ} (δ : ℝ) (hδ : 0 < δ)
    (x y : Fin r → ℝ) (hx : StrictMono x) (hy : StrictMono y)
    (hxpos : ∀ i, 0 < x i) (hypos : ∀ j, 0 < y j)
    (hfall : ∀ i : Fin r, falling δ i.val ≠ 0) :
    0 < Matrix.det (Matrix.of fun i j => gammaQuotient δ (x i) (y j)) *
      powerSignature δ r := by
  have hp := integral_composition_strict_sign
    (fun i v => gammaDensity (y i) v) (fun j v => halfKernel δ (x j) v)
    (powerSignature δ r)
    (fun i j => gamma_half_integrable (a := x j) (b := y i) (δ := δ)
      (hxpos j) (hypos i) hδ) ?_
  · have heq : (Matrix.of fun i j =>
        ∫ v, gammaDensity (y i) v * halfKernel δ (x j) v ∂volume.restrict (Ioi 0)) =
        (Matrix.of fun i j => gammaQuotient δ (x i) (y j))ᵀ := by
      ext i j
      exact gamma_double_integral (a := x j) (b := y i) (δ := δ)
        (hxpos j) (hypos i) hδ
    rw [heq, Matrix.det_transpose] at hp
    simpa only [mul_comm] using hp
  · intro t ht hmono
    have hA : 0 < functionDet (fun i v => gammaDensity (y i) v) t :=
      gammaDensity_det_pos y t hy hmono hypos ht
    have hB : 0 < functionDet (fun j v => halfKernel δ (x j) v) t *
        powerSignature δ r :=
      halfKernel_det_mul_signature_pos δ hδ x t hx hmono hxpos ht hfall
    convert mul_pos hA hB using 1
    ring

/-- The first transform retains the integer power kernel's finite rank. -/
theorem halfKernel_nat_det_eq_zero {r m : ℕ} (hm : 0 < m) (hr : m + 1 < r)
    (x v : Fin r → ℝ) (hxpos : ∀ i, 0 < x i) (hvpos : ∀ j, 0 < v j) :
    Matrix.det (Matrix.of fun i j => halfKernel (m : ℝ) (x i) (v j)) = 0 := by
  have hm' : (0 : ℝ) < m := by exact_mod_cast hm
  apply integral_composition_det_eq_zero
    (fun i u => gammaDensity (x i) u) (fun j u => powerKernel (m : ℝ) u (v j))
    (fun i j => gamma_power_integrable (a := x i) (δ := (m : ℝ)) (v := v j)
      (hxpos i) hm' (hvpos j))
  intro t _
  have hz : functionDet (fun j u => powerKernel (m : ℝ) u (v j)) t = 0 := by
    have heq : functionDet (fun j u => powerKernel (m : ℝ) u (v j)) t =
        Matrix.det (Matrix.of fun i j => powerKernel (m : ℝ) (t i) (v j)) :=
      Matrix.det_transpose (Matrix.of fun i j => powerKernel (m : ℝ) (t i) (v j))
    rw [heq]
    exact powerKernel_nat_det_eq_zero hr t v
  rw [hz, mul_zero]

/-- Every larger integer-parameter minor vanishes, including repeated and
unordered positive node tuples. -/
theorem gammaQuotient_nat_det_eq_zero {r m : ℕ} (hm : 0 < m) (hr : m + 1 < r)
    (x y : Fin r → ℝ) (hxpos : ∀ i, 0 < x i) (hypos : ∀ j, 0 < y j) :
    Matrix.det (Matrix.of fun i j => gammaQuotient (m : ℝ) (x i) (y j)) = 0 := by
  have hm' : (0 : ℝ) < m := by exact_mod_cast hm
  have hz := integral_composition_det_eq_zero
    (fun i v => gammaDensity (y i) v) (fun j v => halfKernel (m : ℝ) (x j) v)
    (fun i j => gamma_half_integrable (a := x j) (b := y i) (δ := (m : ℝ))
      (hxpos j) (hypos i) hm') ?_
  · have heq : (Matrix.of fun i j =>
        ∫ v, gammaDensity (y i) v * halfKernel (m : ℝ) (x j) v
          ∂volume.restrict (Ioi 0)) =
        (Matrix.of fun i j => gammaQuotient (m : ℝ) (x i) (y j))ᵀ := by
      ext i j
      exact gamma_double_integral (a := x j) (b := y i) (δ := (m : ℝ))
        (hxpos j) (hypos i) hm'
    rwa [heq, Matrix.det_transpose] at hz
  · intro t ht
    have hB : functionDet (fun j v => halfKernel (m : ℝ) (x j) v) t = 0 :=
      halfKernel_nat_det_eq_zero hm hr x t hxpos ht
    rw [hB, mul_zero]

end

end KVZGamma
