module

public import Conjectures.NuttallThetaTermDerivatives
import all Conjectures.NuttallThetaTermDerivatives
public import Mathlib.LinearAlgebra.Matrix.Determinant.Basic

public section
namespace NuttallCumulants

open Polynomial Finset Equiv

theorem polynomial_derivative_det {ι : Type*} [Fintype ι] [DecidableEq ι]
    (A : Matrix ι ι ℝ[X]) :
    A.det.derivative = ∑ j : ι, (A.updateCol j (fun i => (A i j).derivative)).det := by
  classical
  simp only [Matrix.det_apply', derivative_sum, derivative_mul, derivative_intCast, zero_mul,
    zero_add, derivative_prod_finset, mul_sum]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro j _
  apply Finset.sum_congr rfl
  intro σ _
  congr 1
  rw [← Finset.mul_prod_erase Finset.univ _ (Finset.mem_univ j), Matrix.updateCol_self, mul_comm]
  congr 1
  apply Finset.prod_congr rfl
  intro i hi
  rw [Matrix.updateCol_ne (Finset.ne_of_mem_erase hi)]

noncomputable def hankelDelta (P : ℝ[X]) : ℝ[X] := C 4 * X * P.derivative

noncomputable def hankelDrift : ℝ[X] := 1 - C 4 * X

theorem hankelDelta_det {ι : Type*} [Fintype ι] [DecidableEq ι] (A : Matrix ι ι ℝ[X]) :
    hankelDelta A.det = ∑ j : ι, (A.updateCol j (fun i => hankelDelta (A i j))).det := by
  unfold hankelDelta
  rw [polynomial_derivative_det, mul_sum]
  apply Finset.sum_congr rfl
  intro j _
  change _ = (A.updateCol j ((C (4:ℝ) * X) • (fun i => (A i j).derivative))).det
  rw [Matrix.det_updateCol_smul]

theorem hankelDelta_modePolynomial (j : ℕ) :
    hankelDelta (modePolynomials j) =
      modePolynomials (j+1) - hankelDrift * modePolynomials j := by
  rw [show modePolynomials (j+1) = modeDerivativePolynomial (modePolynomials j) from rfl]
  unfold hankelDelta hankelDrift modeDerivativePolynomial
  ring

noncomputable def modeHankelMatrix {s : ℕ} (r c : Fin s → ℕ) : Matrix (Fin s) (Fin s) ℝ[X] :=
  Matrix.of fun i j => modePolynomials (r i + c j)

def lastShift (s : ℕ) (i : Fin (s+1)) : ℕ :=
  if i = Fin.last s then i.val+1 else i.val

/-- For consecutive columns, every derivative shift except the very last
duplicates the next column. This identity works for arbitrary row indices,
including the singly shifted row used for the second adjacent minor. -/
theorem hankelDelta_consecutive_cols (s : ℕ) (r : Fin (s+1) → ℕ) :
    hankelDelta (modeHankelMatrix r Fin.val).det =
      (modeHankelMatrix r (lastShift s)).det -
        C ((s+1 : ℕ):ℝ) * hankelDrift * (modeHankelMatrix r Fin.val).det := by
  let A := modeHankelMatrix r Fin.val
  let V (j : Fin (s+1)) (i : Fin (s+1)) := modePolynomials (r i+j.val+1)
  have hterm (j : Fin (s+1)) :
      (A.updateCol j (fun i => hankelDelta (A i j))).det =
      (A.updateCol j (V j)).det - hankelDrift * A.det := by
    have he : (fun i => hankelDelta (A i j)) =
        V j + (-hankelDrift) • (fun i => A i j) := by
      funext i
      change hankelDelta (modePolynomials (r i+j.val)) =
        modePolynomials (r i+j.val+1) + (-hankelDrift) * modePolynomials (r i+j.val)
      rw [hankelDelta_modePolynomial]
      ring
    rw [he, Matrix.det_updateCol_add, Matrix.det_updateCol_smul, Matrix.updateCol_eq_self]
    ring
  have hlast : A.updateCol (Fin.last s) (V (Fin.last s)) =
      modeHankelMatrix r (lastShift s) := by
    ext i j
    by_cases hj : j = Fin.last s
    · subst j
      rw [Matrix.updateCol_self]
      simp only [V, modeHankelMatrix, Matrix.of_apply, lastShift]
      congr 1
    · rw [Matrix.updateCol_ne hj]
      simp only [A, modeHankelMatrix, Matrix.of_apply, lastShift, ite_eq_right hj]
  have hzero (j : Fin (s+1)) (hj : j ≠ Fin.last s) : (A.updateCol j (V j)).det = 0 := by
    have hlt : j.val+1 < s+1 := by
      have hn : j.val ≠ s := by
        intro h
        apply hj
        exact Fin.ext h
      omega
    let q : Fin (s+1) := ⟨j.val+1,hlt⟩
    have hq : q ≠ j := by intro h; have := Fin.val_inj.mpr h; dsimp [q] at this; omega
    have he : V j = fun i => A i q := by
      funext i
      change modePolynomials (r i+j.val+1) = modePolynomials (r i+(j.val+1))
      congr 1
    rw [he]
    exact Matrix.det_updateCol_eq_zero hq
  change hankelDelta A.det = _
  rw [hankelDelta_det]
  simp_rw [hterm, Finset.sum_sub_distrib]
  rw [Finset.sum_eq_single (Fin.last s) (fun j _ hj => hzero j hj)
    (fun h => (h (Finset.mem_univ _)).elim), hlast]
  simp only [sum_const, card_univ, Fintype.card_fin, nsmul_eq_mul,
    ← Polynomial.C_eq_natCast, A, mul_assoc]

theorem modeHankel_transpose {s : ℕ} (r c : Fin s → ℕ) :
    (modeHankelMatrix r c).transpose = modeHankelMatrix c r := by
  ext i j
  simp only [modeHankelMatrix, Matrix.transpose_apply, Matrix.of_apply, Nat.add_comm]

noncomputable def polyHankelA (s : ℕ) : ℝ[X] :=
  (modeHankelMatrix (Fin.val : Fin s → ℕ) Fin.val).det

noncomputable def polyHankelB (s : ℕ) : ℝ[X] :=
  (modeHankelMatrix Fin.val (lastShift s)).det

noncomputable def polyHankelC (s : ℕ) : ℝ[X] :=
  (modeHankelMatrix (lastShift s) (lastShift s)).det

theorem hankelDelta_polyHankelA (s : ℕ) :
    hankelDelta (polyHankelA (s+1)) =
      polyHankelB s - C ((s+1 : ℕ):ℝ) * hankelDrift * polyHankelA (s+1) :=
  hankelDelta_consecutive_cols s Fin.val

theorem hankelDelta_polyHankelB (s : ℕ) :
    hankelDelta (polyHankelB s) =
      polyHankelC s - C ((s+1 : ℕ):ℝ) * hankelDrift * polyHankelB s := by
  have hB : polyHankelB s = (modeHankelMatrix (lastShift s) Fin.val).det := by
    unfold polyHankelB
    rw [← Matrix.det_transpose, modeHankel_transpose]
  rw [hB, hankelDelta_consecutive_cols]
  rfl

theorem hankelDelta_add (p q : ℝ[X]) :
    hankelDelta (p+q) = hankelDelta p + hankelDelta q := by
  simp only [hankelDelta, derivative_add, mul_add]

theorem hankelDelta_mul (p q : ℝ[X]) :
    hankelDelta (p*q) = hankelDelta p*q + p*hankelDelta q := by
  simp only [hankelDelta, derivative_mul]
  ring

theorem hankelDelta_C (a : ℝ) : hankelDelta (C a) = 0 := by
  simp only [hankelDelta, derivative_C, mul_zero]

theorem hankelDelta_drift : hankelDelta hankelDrift = -C 16 * X := by
  simp only [hankelDelta, hankelDrift, derivative_sub, derivative_one, derivative_C_mul_X,
    zero_sub, mul_neg]
  rw [mul_comm (C (4:ℝ)) X]
  calc
    -(X * C (4:ℝ) * C 4) = -(X * C ((4:ℝ)*4)) := by rw [mul_assoc, map_mul]
    _ = _ := by norm_num

/-- The polynomial square difference of adjacent Hankel minors after
eliminating both derivative-column corrections. -/
theorem polyHankel_square_difference (s : ℕ) :
    polyHankelA (s+1) * polyHankelC s - (polyHankelB s)^2 =
      polyHankelA (s+1) * hankelDelta (hankelDelta (polyHankelA (s+1))) -
      (hankelDelta (polyHankelA (s+1)))^2 -
      C 16 * C ((s+1 : ℕ):ℝ) * X * (polyHankelA (s+1))^2 := by
  let a := polyHankelA (s+1)
  let b := polyHankelB s
  let c := polyHankelC s
  let n := C ((s+1 : ℕ):ℝ)
  have hA : b = hankelDelta a + n*hankelDrift*a :=
    eq_add_of_sub_eq (hankelDelta_polyHankelA s).symm
  have hB : c = hankelDelta b + n*hankelDrift*b :=
    eq_add_of_sub_eq (hankelDelta_polyHankelB s).symm
  change a*c-b^2 = a*hankelDelta (hankelDelta a) - (hankelDelta a)^2 - C 16*n*X*a^2
  rw [hB, hA, hankelDelta_add, hankelDelta_mul, hankelDelta_mul]
  rw [show hankelDelta n = 0 from hankelDelta_C _, hankelDelta_drift]
  ring

theorem hankelDelta_natDegree_le (p : ℝ[X]) :
    (hankelDelta p).natDegree ≤ p.natDegree := by
  by_cases hp : p.natDegree = 0
  · have h : p.derivative = 0 := by
      rw [eq_C_of_natDegree_eq_zero hp, derivative_C]
    simp [hankelDelta,h,hp]
  · unfold hankelDelta
    calc
      _ ≤ (C (4:ℝ)*X).natDegree + p.derivative.natDegree := natDegree_mul_le
      _ = 1 + p.derivative.natDegree := by rw [natDegree_C_mul_X _ (by norm_num)]
      _ ≤ 1 + (p.natDegree - 1) := Nat.add_le_add_left (natDegree_derivative_le _) 1
      _ = _ := by omega

/-- Provided the preceding Hankel polynomial is nonzero, the expression for
the adjacent minor square difference has a single highest-degree term. -/
theorem polyHankel_square_difference_top (s : ℕ) (hA : polyHankelA (s+1) ≠ 0) :
    let A := polyHankelA (s+1)
    let Q := A * polyHankelC s - (polyHankelB s)^2
    Q.natDegree = 2*A.natDegree+1 ∧
      Q.leadingCoeff = -(16*((s+1 : ℕ):ℝ)) * A.leadingCoeff^2 := by
  dsimp only
  rw [polyHankel_square_difference]
  let A := polyHankelA (s+1)
  let L := A*hankelDelta (hankelDelta A) - (hankelDelta A)^2
  let c : ℝ := 16*((s+1 : ℕ):ℝ)
  let H := C c*X*A^2
  have he : C (16:ℝ)*C ((s+1:ℕ):ℝ)*X*A^2 = H := by unfold H c; rw [map_mul]
  have hL : L.natDegree ≤ 2*A.natDegree := by
    unfold L
    refine le_trans (natDegree_sub_le _ _) ?_
    apply max_le
    · exact natDegree_mul_le.trans (by
        have h := (hankelDelta_natDegree_le (hankelDelta A)).trans (hankelDelta_natDegree_le A)
        omega)
    · rw [natDegree_pow]
      have h := hankelDelta_natDegree_le A
      omega
  have hc : c ≠ 0 := by dsimp [c]; positivity
  have hcx : C c*X ≠ 0 := mul_ne_zero (C_ne_zero.mpr hc) X_ne_zero
  have hH : H.natDegree = 2*A.natDegree+1 := by
    unfold H
    rw [natDegree_mul hcx (pow_ne_zero _ hA), natDegree_C_mul_X _ hc, natDegree_pow]
    change 1 + 2 * A.natDegree = 2 * A.natDegree + 1
    omega
  have hlt : L.natDegree < H.natDegree := by omega
  change (L - (C (16:ℝ)*C ((s+1:ℕ):ℝ)*X*A^2)).natDegree = _ ∧
    (L - (C (16:ℝ)*C ((s+1:ℕ):ℝ)*X*A^2)).leadingCoeff = _
  rw [he]
  refine ⟨(natDegree_sub_eq_right_of_natDegree_lt hlt).trans hH, ?_⟩
  rw [leadingCoeff_sub_of_degree_lt' (degree_lt_degree hlt)]
  unfold H
  rw [leadingCoeff_mul, leadingCoeff_C_mul_X, leadingCoeff_pow]
  ring

end NuttallCumulants
