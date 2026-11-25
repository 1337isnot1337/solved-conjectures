module

public import Conjectures.NuttallAndreief
import all Conjectures.NuttallAndreief
public import Mathlib.LinearAlgebra.Vandermonde
public import Mathlib.Data.Fin.Rev

public section
namespace NuttallCumulants

open MeasureTheory Finset
open Equiv

private theorem sign_eq_aux (s : ℕ) (σ : Perm (Fin s)) : Perm.sign σ = Perm.signAux σ := by
  have hs (T : Multiset (Fin s)) (hT : ∀ x, x ∈ T) :
      Perm.signAux3 σ hT = Perm.signAux σ := by
    induction T using Quotient.inductionOn with
    | h l =>
      change Perm.signAux2 l σ = Perm.signAux σ
      symm
      simpa only [Equiv.refl_symm, Equiv.refl_trans, Equiv.trans_refl] using
        Perm.signAux_eq_signAux2 l σ (Equiv.refl _) (fun x _ => hT x)
  exact hs Finset.univ.val (by simp)

private theorem card_finPairs_eq_sum (s : ℕ) :
    #(Perm.finPairsLT s) = ∑ i : Fin s, i.val := by
  unfold Perm.finPairsLT
  rw [card_sigma]
  simp

private theorem revSign_eq_product (s : ℕ) :
    (((Perm.sign (Fin.revPerm : Perm (Fin s))) : ℤ) : ℝ) = ∏ i : Fin s, (-1:ℝ)^i.val := by
  rw [sign_eq_aux, Perm.signAux]
  have he :
      (∏ x ∈ Perm.finPairsLT s, (if Fin.revPerm x.1 ≤ Fin.revPerm x.2 then -1 else 1 : ℤˣ)) =
        (-1 : ℤˣ) ^ #(Perm.finPairsLT s) := by
    rw [← Finset.prod_const]
    apply Finset.prod_congr rfl
    intro a ha
    have h := Perm.mem_finPairsLT.mp ha
    rw [ite_eq_left]
    exact Fin.rev_le_rev.mpr h.le
  rw [he, card_finPairs_eq_sum, prod_pow_eq_pow_sum]
  simp

noncomputable def cumulantVandermonde (s : ℕ) (x : Fin s → ℝ) : ℝ :=
  ∏ i : Fin s, ∏ j ∈ Ioi i, (x j - x i)

private theorem power_det_reverse (m s : ℕ) (hs : s ≤ m) (x : Fin s → ℝ) :
    (cumulantPowerMatrix m s x).det =
      (((Perm.sign (Fin.revPerm : Perm (Fin s))) : ℤ) : ℝ) *
      cumulantVandermonde s x * ∏ i : Fin s, (x i)^(m-s) := by
  have hmat : cumulantPowerMatrix m s x =
      ((Matrix.vandermonde x).transpose.submatrix Fin.revPerm id) *
        Matrix.diagonal (fun i => (x i)^(m-s)) := by
    ext i j
    rw [Matrix.mul_diagonal]
    simp only [cumulantPowerMatrix, Matrix.of_apply, Matrix.submatrix_apply,
      Matrix.transpose_apply, Matrix.vandermonde_apply, id_eq, ← pow_add]
    congr 1
    have hi := i.isLt
    simp only [rowMomentPower, Fin.revPerm_apply, Fin.val_rev]
    omega
  rw [hmat, Matrix.det_mul, Matrix.det_diagonal, Matrix.det_permute, Matrix.det_transpose,
    Matrix.det_vandermonde]
  rfl

/-- Andréief for cumulants after simplifying the power determinant; both
reversal signs cancel, leaving the ordinary Vandermonde and positive weights. -/
theorem cumulantHankel_vandermonde_integral (m s : ℕ) (hs : s ≤ m) {u : ℝ} (hu : 0 ≤ u) :
    (s.factorial : ℝ) * (cumulantHankel m s u).det =
      (∏ i : Fin s, ((rowMomentPower m i).factorial : ℝ)⁻¹) *
        ∫ x : Fin s → ℝ, cumulantVandermonde s x *
          (∏ i : Fin s, (x i)^(m-s)) *
          (thetaDerivativeMatrix s u x).det
          ∂(Measure.pi fun _ => volume.restrict (Set.Ioi (0:ℝ))) := by
  let c : ℝ := ((Perm.sign (Fin.revPerm : Perm (Fin s)) : ℤ) : ℝ)
  have hsq : c*c = 1 := by
    rcases Int.units_eq_one_or (Perm.sign (Fin.revPerm : Perm (Fin s))) with h | h <;>
      norm_num [c,h]
  have hfactor : (∏ i : Fin s, cumulantRowFactor m i) =
      c * ∏ i : Fin s, ((rowMomentPower m i).factorial : ℝ)⁻¹ := by
    unfold cumulantRowFactor c
    simp only [div_eq_mul_inv, Finset.prod_mul_distrib, revSign_eq_product]
  have he (x : Fin s → ℝ) :
      (cumulantPowerMatrix m s x).det * (thetaDerivativeMatrix s u x).det =
        c * (cumulantVandermonde s x * (∏ i : Fin s, (x i)^(m-s)) *
          (thetaDerivativeMatrix s u x).det) := by
    rw [power_det_reverse m s hs]
    unfold c
    ring
  rw [cumulantHankel_det_integral m s hs hu, hfactor]
  simp_rw [he]
  rw [integral_const_mul]
  rw [show ∀ a b : ℝ, c*a*(c*b) = c*c*(a*b) from fun a b => by ring, hsq, one_mul]

end NuttallCumulants
