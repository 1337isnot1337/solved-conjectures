module

public import Conjectures.KVZGammaPowerDerivatives
public import Conjectures.KVZGammaWronskian

/-!
# All-order strict sign regularity of the power kernel

The Wronskian criterion is applied to the literal functions `(u + v)^δ`.
The determinant has the source signature whenever the required falling
factorials do not vanish. Integer exponents retain the exact finite rank
cutoff proved in `KVZGammaPowerAlgebra`.
-/

@[expose] public section

namespace KVZGamma

open Matrix Set
open scoped BigOperators ContDiff

theorem powerKernel_det_mul_signature_pos {r : ℕ} (δ : ℝ)
    (u v : Fin r → ℝ) (hu : StrictMono u) (hv : StrictMono v)
    (hupos : ∀ i, 0 < u i) (hvpos : ∀ j, 0 < v j)
    (hfall : ∀ i : Fin r, falling δ i.val ≠ 0) :
    0 < (Matrix.of fun i j : Fin r => powerKernel δ (u i) (v j)).det * powerSignature δ r := by
  let f : Fin r → ℝ → ℝ := fun j x => powerKernel δ x (v j)
  have hE := evaluationDet_mul_wronskian_pos isOpen_Ioi (convex_Ioi 0) f
    (fun j => powerKernel_contDiffOn δ (hvpos j))
    (power_initialWronskiansNonzero δ v hv hvpos hfall) u hu hupos
    (t := 1) (by norm_num)
  have hW := power_wronskian_mul_signature_pos δ v hv 1
    (fun j => add_pos zero_lt_one (hvpos j)) hfall
  have hmul : 0 < (evaluationDet f u * powerSignature δ r) *
      (wronskian f 1 * wronskian f 1) := by
    convert mul_pos hE hW using 1
    ring
  exact pos_of_mul_pos_left hmul (mul_self_nonneg _)

theorem powerKernel_det_mul_signature_pos_of_not_nat {r : ℕ} (δ : ℝ)
    (hδ : ∀ m : ℕ, δ ≠ m) (u v : Fin r → ℝ)
    (hu : StrictMono u) (hv : StrictMono v)
    (hupos : ∀ i, 0 < u i) (hvpos : ∀ j, 0 < v j) :
    0 < (Matrix.of fun i j : Fin r => powerKernel δ (u i) (v j)).det * powerSignature δ r :=
  powerKernel_det_mul_signature_pos δ u v hu hv hupos hvpos
    (fun i => falling_ne_zero hδ i.val)

theorem powerKernel_det_ne_zero_of_not_nat {r : ℕ} (δ : ℝ)
    (hδ : ∀ m : ℕ, δ ≠ m) (u v : Fin r → ℝ)
    (hu : StrictMono u) (hv : StrictMono v)
    (hupos : ∀ i, 0 < u i) (hvpos : ∀ j, 0 < v j) :
    (Matrix.of fun i j : Fin r => powerKernel δ (u i) (v j)).det ≠ 0 :=
  left_ne_zero_of_mul
    (powerKernel_det_mul_signature_pos_of_not_nat δ hδ u v hu hv hupos hvpos).ne'

theorem powerKernel_nat_det_mul_sign_pos {r m : ℕ} (hr : r ≤ m + 1)
    (u v : Fin r → ℝ) (hu : StrictMono u) (hv : StrictMono v)
    (hupos : ∀ i, 0 < u i) (hvpos : ∀ j, 0 < v j) :
    0 < (Matrix.of fun i j : Fin r => powerKernel (m : ℝ) (u i) (v j)).det *
      (-1 : ℝ) ^ (r.choose 2) := by
  have hfall : ∀ i : Fin r, 0 < falling (m : ℝ) i.val :=
    fun i => falling_nat_pos (by omega)
  have hp := powerKernel_det_mul_signature_pos (m : ℝ) u v hu hv hupos hvpos
    (fun i => (hfall i).ne')
  have hp' : 0 < ((Matrix.of fun i j : Fin r => powerKernel (m : ℝ) (u i) (v j)).det *
      (-1 : ℝ) ^ (r.choose 2)) * ∏ i : Fin r, falling (m : ℝ) i.val := by
    simpa only [powerSignature, mul_assoc] using hp
  exact pos_of_mul_pos_left hp' (Finset.prod_nonneg fun i _ => (hfall i).le)

end KVZGamma
