module

public import Conjectures.KVZGammaPowerAlgebra
public import Conjectures.KVZGammaWronskianJets
public import Mathlib.Analysis.SpecialFunctions.Pow.Deriv

/-!
# The power-kernel Wronskian

All derivatives are computed on the positive half-line. Factoring the
resulting jet matrix gives a Vandermonde determinant at the increasing
nodes `-(u + v)⁻¹`, and therefore exactly the source signature.
-/

@[expose] public section

namespace KVZGamma

open Matrix Set Filter
open scoped BigOperators Topology ContDiff

theorem iteratedDeriv_rpow_of_pos (δ : ℝ) (n : ℕ) {x : ℝ} (hx : 0 < x) :
    iteratedDeriv n (fun y : ℝ => y ^ δ) x = falling δ n * x ^ (δ - (n : ℝ)) := by
  induction n generalizing x with
  | zero => simp
  | succ n ih =>
    have hpositive : ∀ᶠ y : ℝ in 𝓝 x, 0 < y := eventually_gt_nhds hx
    have hlocal : iteratedDeriv n (fun y : ℝ => y ^ δ) =ᶠ[𝓝 x]
        (fun y : ℝ => falling δ n * y ^ (δ - (n : ℝ))) :=
      hpositive.mono fun y hy => ih hy
    have hd := ((Real.hasDerivAt_rpow_const
      (x := x) (p := δ - (n : ℝ)) (Or.inl hx.ne')).const_mul (falling δ n)).deriv
    rw [iteratedDeriv_succ, hlocal.deriv_eq, hd, falling_succ]
    have he : δ - ((n + 1 : ℕ) : ℝ) = δ - (n : ℝ) - 1 := by
      simp only [Nat.cast_add, Nat.cast_one]
      ring
    rw [he]
    ring

theorem iteratedDeriv_powerKernel (δ : ℝ) (n : ℕ) (v u : ℝ) (huv : 0 < u + v) :
    iteratedDeriv n (fun x => powerKernel δ x v) u =
      falling δ n * (u + v) ^ (δ - (n : ℝ)) := by
  change iteratedDeriv n (fun x : ℝ => (x + v) ^ δ) u = _
  rw [iteratedDeriv_comp_add_const (n := n) (f := fun x : ℝ => x ^ δ) (s := v)]
  exact iteratedDeriv_rpow_of_pos δ n huv

theorem powerKernel_contDiffOn (δ : ℝ) {v : ℝ} (hv : 0 < v) :
    ContDiffOn ℝ ∞ (fun u => powerKernel δ u v) (Ioi 0) := by
  have hf : ContDiffOn ℝ ∞ (fun u : ℝ => u + v) (Ioi 0) :=
    contDiffOn_id.add contDiffOn_const
  exact hf.rpow_const_of_ne fun u hu =>
    (add_pos hu hv).ne'

theorem power_wronskian_eq {r : ℕ} (δ : ℝ) (v : Fin r → ℝ) (u : ℝ)
    (hpos : ∀ j, 0 < u + v j) :
    wronskian (fun j x => powerKernel δ x (v j)) u =
      powerSignature δ r * ((∏ j : Fin r, (u + v j) ^ δ) *
        (Matrix.vandermonde fun j => -(u + v j)⁻¹).det) := by
  let w : Fin r → ℝ := fun j => (u + v j)⁻¹
  have hmatrix : jetMatrix (fun j x => powerKernel δ x (v j)) u =
      Matrix.of (fun i j : Fin r => falling δ i.val *
        ((u + v j) ^ δ * (Matrix.vandermonde w)ᵀ i j)) := by
    ext i j
    change iteratedDeriv i.val (fun x => powerKernel δ x (v j)) u = _
    rw [iteratedDeriv_powerKernel δ i.val (v j) u (hpos j),
      Real.rpow_sub_natCast (hpos j).ne']
    simp only [Matrix.of_apply, Matrix.transpose_apply, Matrix.vandermonde,
      w, div_eq_mul_inv, inv_pow]
  have hw : (Matrix.vandermonde w).det =
      (-1 : ℝ) ^ (r.choose 2) * (Matrix.vandermonde fun j => -w j).det := by
    rw [vandermonde_neg_det, ← mul_assoc, neg_one_pow_mul_self, one_mul]
  have hd : wronskian (fun j x => powerKernel δ x (v j)) u =
      (∏ i : Fin r, falling δ i.val) *
        ((∏ j : Fin r, (u + v j) ^ δ) * (Matrix.vandermonde w).det) := by
    rw [wronskian, hmatrix]
    calc
      _ = (∏ i : Fin r, falling δ i.val) *
          (Matrix.of fun i j : Fin r => (u + v j) ^ δ *
            (Matrix.vandermonde w)ᵀ i j).det :=
        Matrix.det_mul_column (fun i : Fin r => falling δ i.val)
          (Matrix.of fun i j : Fin r => (u + v j) ^ δ *
            (Matrix.vandermonde w)ᵀ i j)
      _ = (∏ i : Fin r, falling δ i.val) *
          ((∏ j : Fin r, (u + v j) ^ δ) * (Matrix.vandermonde w)ᵀ.det) :=
        congrArg ((∏ i : Fin r, falling δ i.val) * ·)
          (Matrix.det_mul_row (fun j : Fin r => (u + v j) ^ δ) (Matrix.vandermonde w)ᵀ)
      _ = _ := by rw [Matrix.det_transpose]
  rw [hd, hw]
  dsimp [powerSignature, w]
  ring

theorem power_wronskian_mul_signature_pos {r : ℕ} (δ : ℝ)
    (v : Fin r → ℝ) (hv : StrictMono v) (u : ℝ)
    (hpos : ∀ j, 0 < u + v j)
    (hfall : ∀ i : Fin r, falling δ i.val ≠ 0) :
    0 < wronskian (fun j x => powerKernel δ x (v j)) u * powerSignature δ r := by
  have hw : StrictMono (fun j => -(u + v j)⁻¹) := by
    intro i j hij
    apply neg_lt_neg
    exact (inv_lt_inv₀ (hpos j) (hpos i)).mpr
      (by simpa only [add_comm] using add_lt_add_left (hv hij) u)
  have hp : 0 < (∏ j : Fin r, (u + v j) ^ δ) *
      (Matrix.vandermonde fun j => -(u + v j)⁻¹).det := by
    exact mul_pos (Finset.prod_pos fun j _ => Real.rpow_pos_of_pos (hpos j) δ)
      (vandermonde_det_pos hw)
  rw [power_wronskian_eq δ v u hpos, mul_right_comm]
  exact mul_pos (mul_self_pos.mpr (powerSignature_ne_zero hfall)) hp

theorem power_initialWronskiansNonzero {r : ℕ} (δ : ℝ)
    (v : Fin r → ℝ) (hv : StrictMono v) (hvpos : ∀ j, 0 < v j)
    (hfall : ∀ i : Fin r, falling δ i.val ≠ 0) :
    initialWronskiansNonzero (fun j x => powerKernel δ x (v j)) (Ioi 0) := by
  intro k hk u hu
  have hmono : StrictMono (fun j : Fin k => v (j.castLE hk)) := by
    intro i j hij
    exact hv hij
  have hp := power_wronskian_mul_signature_pos δ (fun j : Fin k => v (j.castLE hk))
    hmono u (fun j => add_pos hu (hvpos (j.castLE hk)))
    (fun i => hfall (i.castLE hk))
  exact left_ne_zero_of_mul hp.ne'

end KVZGamma
