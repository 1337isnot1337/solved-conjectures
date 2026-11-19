module

public import Conjectures.LonelinessRectangularGram
public import Mathlib.LinearAlgebra.Matrix.SchurComplement
public import Mathlib.Algebra.Order.BigOperators.Ring.Finset
public import Mathlib.Data.Int.Order.Units
public import Mathlib.Data.Rat.Cast.Order
public import Mathlib.Data.Fin.VecNotation
public import Mathlib.Order.Hom.PowersetCard
public import Mathlib.Tactic.FinCases
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.NormNum
public import Lean.Elab.Tactic.Omega
public import Mathlib.Tactic.Ring

/-!
# A Gram determinant lower bound for six integral rows in rank four

For an integral six-by-four matrix with positive Gram determinant, nonzero
rows, and no two rows equal up to sign, the Gram determinant is at least six.
The normalized determinant identity is proved over any commutative ring by
reducing a rank-two update to a two-by-two determinant.

The arithmetic argument uses integer squared norms and Cauchy--Schwarz.
It does not assume a Gram determinant bound or a lattice-covolume estimate.
Cauchy--Binet supplies a nonzero four-row minor. Adjugate normalization over
the rationals shows that a value below six would force this minor to be a
unit. Its integral adjugate then gives a selected identity block, where the
normalized lower bound contradicts the value below six.
-/

@[expose] public section

namespace Loneliness.RectangularGramLowerBound

open scoped BigOperators Matrix

section Ring

variable {R : Type*} [CommRing R]

/-- The sum of the four coordinate squares. -/
def squaredNorm (a : Fin 4 → R) : R := ∑ i, a i ^ 2

/-- The coordinate dot product. -/
def dot (a b : Fin 4 → R) : R := ∑ i, a i * b i

/-- A row of the four-by-four identity matrix. -/
def basisRow (i : Fin 4) : Fin 4 → R := fun j => if j = i then 1 else 0

/-- A matrix with the two indicated rows. -/
def rowPair (a b : Fin 4 → R) : Matrix (Fin 2) (Fin 4) R := ![a, b]

/-- The identity matrix followed by the two indicated rows. -/
def normalized (a b : Fin 4 → R) : Matrix (Fin 6) (Fin 4) R :=
  ![basisRow 0, basisRow 1, basisRow 2, basisRow 3, a, b]

/-- The Gram matrix of the normalized six-row matrix is a rank-two update. -/
theorem normalized_gram (a b : Fin 4 → R) :
    (normalized a b).transpose * normalized a b =
      (1 : Matrix (Fin 4) (Fin 4) R) + (rowPair a b).transpose * rowPair a b := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [normalized, rowPair, basisRow, Matrix.mul_apply, Matrix.transpose_apply,
      Matrix.one_apply, Fin.sum_univ_succ]

/-- The determinant of the rank-two update, in squared-norm coordinates. -/
theorem gram_update_det (a b : Fin 4 → R) :
    ((1 : Matrix (Fin 4) (Fin 4) R) +
        (rowPair a b).transpose * rowPair a b).det =
      (1 + squaredNorm a) * (1 + squaredNorm b) - dot a b ^ 2 := by
  rw [Matrix.det_one_add_mul_comm, Matrix.det_fin_two]
  simp [rowPair, Matrix.mul_apply, Matrix.transpose_apply, Matrix.one_apply,
    squaredNorm, dot, pow_two, mul_comm]

/-- Exact Gram determinant of `[I₄; a; b]`. -/
theorem normalized_gram_det (a b : Fin 4 → R) :
    ((normalized a b).transpose * normalized a b).det =
      (1 + squaredNorm a) * (1 + squaredNorm b) - dot a b ^ 2 := by
  rw [normalized_gram, gram_update_det]

theorem squaredNorm_sub (a b : Fin 4 → R) :
    squaredNorm (a - b) = squaredNorm a + squaredNorm b - 2 * dot a b := by
  simp [squaredNorm, dot, Fin.sum_univ_succ]
  ring

theorem squaredNorm_add (a b : Fin 4 → R) :
    squaredNorm (a + b) = squaredNorm a + squaredNorm b + 2 * dot a b := by
  simp [squaredNorm, dot, Fin.sum_univ_succ]
  ring

/-- Scaling every coordinate scales the squared norm by the square. -/
theorem squaredNorm_mul (d : R) (a : Fin 4 → R) :
    squaredNorm (fun i => d * a i) = d ^ 2 * squaredNorm a := by
  simp [squaredNorm, Finset.mul_sum, mul_pow]

end Ring

section Integer

theorem squaredNorm_nonneg (a : Fin 4 → ℤ) : 0 ≤ squaredNorm a :=
  Finset.sum_nonneg fun _ _ => sq_nonneg _

theorem coordinate_sq_le_squaredNorm (a : Fin 4 → ℤ) (i : Fin 4) :
    a i ^ 2 ≤ squaredNorm a :=
  Finset.single_le_sum (fun _ _ => sq_nonneg _) (Finset.mem_univ i)

theorem squaredNorm_eq_zero (a : Fin 4 → ℤ) : squaredNorm a = 0 ↔ a = 0 := by
  simp [squaredNorm, Finset.sum_sq_eq_zero_iff, funext_iff]

theorem squaredNorm_pos (a : Fin 4 → ℤ) (ha : a ≠ 0) : 0 < squaredNorm a := by
  have hnonneg := squaredNorm_nonneg a
  have hne : squaredNorm a ≠ 0 := fun h => ha ((squaredNorm_eq_zero a).mp h)
  omega

/-- An integral vector of squared norm one is a signed coordinate vector. -/
theorem signed_basis_of_squaredNorm_eq_one (a : Fin 4 → ℤ)
    (ha : squaredNorm a = 1) :
    ∃ i : Fin 4, a = basisRow i ∨ a = -basisRow i := by
  have hne : a ≠ 0 := by
    intro hzero
    simp [hzero, squaredNorm] at ha
  obtain ⟨i, hi⟩ : ∃ i : Fin 4, a i ≠ 0 := by
    by_contra h
    apply hne
    funext i
    by_contra hi
    exact h ⟨i, hi⟩
  have hisq : a i ^ 2 = 1 :=
    Int.sq_eq_one_of_sq_le_three (by have h := coordinate_sq_le_squaredNorm a i; omega) hi
  have hrest : ∑ j ∈ (Finset.univ : Finset (Fin 4)).erase i, a j ^ 2 = 0 := by
    have hsum := Finset.sum_erase_add (Finset.univ : Finset (Fin 4))
      (fun j => a j ^ 2) (Finset.mem_univ i)
    change (∑ j ∈ (Finset.univ : Finset (Fin 4)).erase i, a j ^ 2) + a i ^ 2 =
      squaredNorm a at hsum
    rw [hisq, ha] at hsum
    omega
  have hzero : ∀ j : Fin 4, j ≠ i → a j = 0 := by
    intro j hji
    exact ((Finset.sum_sq_eq_zero_iff _ a).mp hrest) j
      (Finset.mem_erase.mpr ⟨hji, Finset.mem_univ j⟩)
  rcases sq_eq_one_iff.mp hisq with hone | hneg
  · refine ⟨i, Or.inl ?_⟩
    funext j
    by_cases hji : j = i
    · subst j
      simpa [basisRow] using hone
    · simp [basisRow, hji, hzero j hji]
  · refine ⟨i, Or.inr ?_⟩
    funext j
    by_cases hji : j = i
    · subst j
      simpa [basisRow] using hneg
    · simp [basisRow, hji, hzero j hji]

/-- A nonzero integral vector excluding signed coordinate vectors has squared
norm at least two. -/
theorem two_le_squaredNorm (a : Fin 4 → ℤ) (ha : a ≠ 0)
    (hbasis : ∀ i : Fin 4, a ≠ basisRow i ∧ a ≠ -basisRow i) :
    2 ≤ squaredNorm a := by
  have hpos := squaredNorm_pos a ha
  by_contra h
  have hone : squaredNorm a = 1 := by omega
  obtain ⟨i, hi | hi⟩ := signed_basis_of_squaredNorm_eq_one a hone
  · exact (hbasis i).1 hi
  · exact (hbasis i).2 hi

theorem dot_sq_le (a b : Fin 4 → ℤ) :
    dot a b ^ 2 ≤ squaredNorm a * squaredNorm b :=
  Finset.sum_mul_sq_le_sq_mul_sq Finset.univ a b

/-- Equality in the relevant integer Cauchy--Schwarz case gives equality up
to sign. The proof uses zero squared norm of the sum or difference. -/
theorem eq_or_eq_neg_of_norm_two (a b : Fin 4 → ℤ)
    (ha : squaredNorm a = 2) (hb : squaredNorm b = 2)
    (hab : dot a b ^ 2 = 4) : a = b ∨ a = -b := by
  have hdot : dot a b = 2 ∨ dot a b = -2 :=
    sq_eq_sq_iff_eq_or_eq_neg.mp hab
  rcases hdot with hdot | hdot
  · left
    have hzero : squaredNorm (a - b) = 0 := by
      rw [squaredNorm_sub, ha, hb, hdot]
      norm_num
    exact sub_eq_zero.mp ((squaredNorm_eq_zero (a - b)).mp hzero)
  · right
    have hzero : squaredNorm (a + b) = 0 := by
      rw [squaredNorm_add, ha, hb, hdot]
      norm_num
    exact eq_neg_iff_add_eq_zero.mpr ((squaredNorm_eq_zero (a + b)).mp hzero)

/-- The rank-two update has determinant at least six when the two integral
rows have squared norm at least two and do not agree up to sign. -/
theorem gram_update_det_ge_six (a b : Fin 4 → ℤ)
    (ha : 2 ≤ squaredNorm a) (hb : 2 ≤ squaredNorm b)
    (hne : a ≠ b) (hneg : a ≠ -b) :
    6 ≤ ((1 : Matrix (Fin 4) (Fin 4) ℤ) +
      (rowPair a b).transpose * rowPair a b).det := by
  rw [gram_update_det]
  by_contra h
  have hdet : (1 + squaredNorm a) * (1 + squaredNorm b) - dot a b ^ 2 ≤ 5 := by
    omega
  have hcs := dot_sq_le a b
  have hsum : squaredNorm a + squaredNorm b ≤ 4 := by nlinarith
  have hna : squaredNorm a = 2 := by omega
  have hnb : squaredNorm b = 2 := by omega
  have hdot : dot a b ^ 2 = 4 := by nlinarith
  rcases eq_or_eq_neg_of_norm_two a b hna hnb hdot with hab | hab
  · exact hne hab
  · exact hneg hab

/-- The normalized integral six-by-four lower bound, with explicit hypotheses
on the two rows outside the identity. -/
theorem normalized_gram_det_ge_six (a b : Fin 4 → ℤ)
    (ha : a ≠ 0) (hb : b ≠ 0)
    (haBasis : ∀ i : Fin 4, a ≠ basisRow i ∧ a ≠ -basisRow i)
    (hbBasis : ∀ i : Fin 4, b ≠ basisRow i ∧ b ≠ -basisRow i)
    (hne : a ≠ b) (hneg : a ≠ -b) :
    6 ≤ ((normalized a b).transpose * normalized a b).det := by
  rw [normalized_gram]
  exact gram_update_det_ge_six a b
    (two_le_squaredNorm a ha haBasis) (two_le_squaredNorm b hb hbBasis) hne hneg

/-- The index of an identity row inside the six-row matrix. -/
def basisIndex (i : Fin 4) : Fin 6 := ⟨i.val, by omega⟩

theorem normalized_basis (a b : Fin 4 → ℤ) (i : Fin 4) :
    normalized a b (basisIndex i) = basisRow i := by
  fin_cases i <;> rfl

/-- The same normalized lower bound stated using only the six rows of the
actual matrix: all are nonzero, and every pair is unequal up to sign. -/
theorem normalized_gram_det_ge_six_of_rows (a b : Fin 4 → ℤ)
    (hnonzero : ∀ i : Fin 6, normalized a b i ≠ 0)
    (hseparate : ∀ i j : Fin 6, i ≠ j →
      normalized a b i ≠ normalized a b j ∧
      normalized a b i ≠ -normalized a b j) :
    6 ≤ ((normalized a b).transpose * normalized a b).det := by
  apply normalized_gram_det_ge_six a b
  · exact hnonzero 4
  · exact hnonzero 5
  · intro i
    have hindex : (4 : Fin 6) ≠ basisIndex i := by
      intro h
      have := congrArg Fin.val h
      simp [basisIndex] at this
      omega
    simpa only [normalized_basis] using hseparate 4 (basisIndex i) hindex
  · intro i
    have hindex : (5 : Fin 6) ≠ basisIndex i := by
      intro h
      have := congrArg Fin.val h
      simp [basisIndex] at this
      omega
    simpa only [normalized_basis] using hseparate 5 (basisIndex i) hindex
  · exact (hseparate 4 5 (by decide)).1
  · exact (hseparate 4 5 (by decide)).2

end Integer

section Rational

/-- The same rank-two determinant estimate over the rationals, before using
integrality of the rows. -/
theorem rat_gram_update_det_ge_norms (a b : Fin 4 → ℚ) :
    1 + squaredNorm a + squaredNorm b ≤
      ((1 : Matrix (Fin 4) (Fin 4) ℚ) +
        (rowPair a b).transpose * rowPair a b).det := by
  rw [gram_update_det]
  have hcs : dot a b ^ 2 ≤ squaredNorm a * squaredNorm b :=
    Finset.sum_mul_sq_le_sq_mul_sq Finset.univ a b
  nlinarith

/-- Clearing a common denominator exposes two additional squared norms.
This is the inequality used when a selected four-row minor is not a unit. -/
theorem scaled_rat_gram_update_ge_norms (d : ℚ) (a b : Fin 4 → ℚ) :
    d ^ 2 + squaredNorm (fun i => d * a i) + squaredNorm (fun i => d * b i) ≤
      d ^ 2 * ((1 : Matrix (Fin 4) (Fin 4) ℚ) +
        (rowPair a b).transpose * rowPair a b).det := by
  have h := mul_le_mul_of_nonneg_left (rat_gram_update_det_ge_norms a b) (sq_nonneg d)
  simpa only [squaredNorm_mul, mul_add, mul_one] using h

theorem squaredNorm_int_cast (a : Fin 4 → ℤ) :
    squaredNorm (fun i => (a i : ℚ)) = (squaredNorm a : ℚ) := by
  simp [squaredNorm]

/-- Integral nonzero numerator rows force a contribution of at least two
beyond the squared determinant of the selected basis minor. -/
theorem scaled_integral_gram_update_ge (d : ℤ) (a b : Fin 4 → ℚ)
    (u v : Fin 4 → ℤ) (hu : u ≠ 0) (hv : v ≠ 0)
    (hdu : ∀ i, (u i : ℚ) = (d : ℚ) * a i)
    (hdv : ∀ i, (v i : ℚ) = (d : ℚ) * b i) :
    (d : ℚ) ^ 2 + 2 ≤
      (d : ℚ) ^ 2 * ((1 : Matrix (Fin 4) (Fin 4) ℚ) +
        (rowPair a b).transpose * rowPair a b).det := by
  have h := scaled_rat_gram_update_ge_norms (d : ℚ) a b
  have hu' : (fun i => (d : ℚ) * a i) = (fun i => (u i : ℚ)) :=
    funext fun i => (hdu i).symm
  have hv' : (fun i => (d : ℚ) * b i) = (fun i => (v i : ℚ)) :=
    funext fun i => (hdv i).symm
  rw [hu', hv', squaredNorm_int_cast, squaredNorm_int_cast] at h
  have huInt : (1 : ℤ) ≤ squaredNorm u := by have h := squaredNorm_pos u hu; omega
  have hvInt : (1 : ℤ) ≤ squaredNorm v := by have h := squaredNorm_pos v hv; omega
  have huRat : (1 : ℚ) ≤ (squaredNorm u : ℚ) := Int.cast_le.mpr huInt
  have hvRat : (1 : ℚ) ≤ (squaredNorm v : ℚ) := Int.cast_le.mpr hvInt
  linarith

/-- A determinant value below six forces any nonzero integral normalization
denominator to be a unit, provided both cleared rows are integral and nonzero. -/
theorem denominator_sq_eq_one_of_scaled_gram_lt_six (d : ℤ) (hd : d ≠ 0)
    (a b : Fin 4 → ℚ) (u v : Fin 4 → ℤ) (hu : u ≠ 0) (hv : v ≠ 0)
    (hdu : ∀ i, (u i : ℚ) = (d : ℚ) * a i)
    (hdv : ∀ i, (v i : ℚ) = (d : ℚ) * b i)
    (hlt : (d : ℚ) ^ 2 * ((1 : Matrix (Fin 4) (Fin 4) ℚ) +
      (rowPair a b).transpose * rowPair a b).det < 6) :
    d ^ 2 = 1 := by
  have hlower := scaled_integral_gram_update_ge d a b u v hu hv hdu hdv
  have hrat : (d : ℚ) ^ 2 < 4 := by linarith
  have hcast : ((d ^ 2 : ℤ) : ℚ) < ((4 : ℤ) : ℚ) := by simpa using hrat
  exact Int.sq_eq_one_of_sq_lt_four (Int.cast_lt.mp hcast) hd

end Rational

section RowSubsets

noncomputable section

variable {R : Type*} [CommRing R]

/-- A choice of four of the six row indices. -/
abbrev RowSet := Set.powersetCard (Fin 6) 4

/-- The increasing enumeration of the four selected rows. -/
def pickedIndex (s : RowSet) : Fin 4 ↪o Fin 6 :=
  Set.powersetCard.ofFinEmbEquiv.symm s

theorem remaining_card (s : RowSet) : (s.valᶜ).card = 2 := by
  simp [Finset.card_compl, s.property]

/-- The increasing enumeration of the two remaining rows. -/
def remainingIndex (s : RowSet) : Fin 2 ↪o Fin 6 :=
  (s.valᶜ).orderEmbOfFin (remaining_card s)

theorem pickedIndex_mem (s : RowSet) (i : Fin 4) : pickedIndex s i ∈ s.val :=
  Finset.orderEmbOfFin_mem s.val s.property i

theorem remainingIndex_mem (s : RowSet) (i : Fin 2) : remainingIndex s i ∈ s.valᶜ :=
  Finset.orderEmbOfFin_mem s.valᶜ (remaining_card s) i

theorem remainingIndex_ne_pickedIndex (s : RowSet) (i : Fin 2) (j : Fin 4) :
    remainingIndex s i ≠ pickedIndex s j := by
  intro h
  have hnot := Finset.mem_compl.mp (remainingIndex_mem s i)
  rw [h] at hnot
  exact hnot (pickedIndex_mem s j)

/-- The selected square block. Its determinant is the corresponding maximal minor. -/
def pickedBlock (A : Matrix (Fin 6) (Fin 4) R) (s : RowSet) :
    Matrix (Fin 4) (Fin 4) R := A.submatrix (pickedIndex s) id

/-- The two rows complementary to the selected square block. -/
def remainingBlock (A : Matrix (Fin 6) (Fin 4) R) (s : RowSet) :
    Matrix (Fin 2) (Fin 4) R := A.submatrix (remainingIndex s) id

private theorem sum_ordered_rows {n : ℕ} (s : Finset (Fin 6)) (hs : s.card = n)
    (f : Fin 6 → R) :
    (∑ i : Fin n, f (s.orderEmbOfFin hs i)) = ∑ i ∈ s, f i := by
  have h := congrArg (fun t : Finset (Fin 6) => ∑ i ∈ t, f i)
    (Finset.map_orderEmbOfFin_univ s hs)
  simpa only [Finset.sum_map] using h

/-- Splitting the row set splits the actual Gram matrix into two Gram matrices. -/
theorem gram_split (A : Matrix (Fin 6) (Fin 4) R) (s : RowSet) :
    A.transpose * A =
      (pickedBlock A s).transpose * pickedBlock A s +
      (remainingBlock A s).transpose * remainingBlock A s := by
  ext i j
  change (∑ k : Fin 6, A k i * A k j) =
    (∑ k : Fin 4, A (s.val.orderEmbOfFin s.property k) i *
      A (s.val.orderEmbOfFin s.property k) j) +
    (∑ k : Fin 2, A ((s.valᶜ).orderEmbOfFin (remaining_card s) k) i *
      A ((s.valᶜ).orderEmbOfFin (remaining_card s) k) j)
  rw [sum_ordered_rows, sum_ordered_rows]
  exact (Finset.sum_add_sum_compl s.val (fun k => A k i * A k j)).symm

theorem pickedBlock_mul (A : Matrix (Fin 6) (Fin 4) R)
    (C : Matrix (Fin 4) (Fin 4) R) (s : RowSet) :
    pickedBlock (A * C) s = pickedBlock A s * C := rfl

theorem remainingBlock_mul (A : Matrix (Fin 6) (Fin 4) R)
    (C : Matrix (Fin 4) (Fin 4) R) (s : RowSet) :
    remainingBlock (A * C) s = remainingBlock A s * C := rfl

/-- Exact change of Gram determinant under a square right factor. -/
theorem gram_det_mul_right (A : Matrix (Fin 6) (Fin 4) R)
    (C : Matrix (Fin 4) (Fin 4) R) :
    ((A * C).transpose * (A * C)).det = C.det ^ 2 * (A.transpose * A).det := by
  have h : (A * C).transpose * (A * C) = C.transpose * (A.transpose * A) * C := by
    simp only [Matrix.transpose_mul, Matrix.mul_assoc]
  rw [h, Matrix.det_mul, Matrix.det_mul, Matrix.det_transpose]
  ring

/-- A right inverse makes multiplication of row vectors injective. -/
theorem vecMul_injective_of_right_inverse (C E : Matrix (Fin 4) (Fin 4) R)
    (hCE : C * E = 1) : Function.Injective C.vecMul := by
  intro u v huv
  have h := congrArg (fun w : Fin 4 → R => w ᵥ* E) huv
  simpa only [Matrix.vecMul_vecMul, hCE, Matrix.vecMul_one] using h

theorem rows_nonzero_mul (A : Matrix (Fin 6) (Fin 4) R)
    (C E : Matrix (Fin 4) (Fin 4) R) (hCE : C * E = 1)
    (hnonzero : ∀ i, A i ≠ 0) : ∀ i, (A * C) i ≠ 0 := by
  intro i hzero
  apply hnonzero i
  apply vecMul_injective_of_right_inverse C E hCE
  simpa only [Matrix.zero_vecMul] using hzero

theorem rows_separate_mul (A : Matrix (Fin 6) (Fin 4) R)
    (C E : Matrix (Fin 4) (Fin 4) R) (hCE : C * E = 1)
    (hseparate : ∀ i j, i ≠ j → A i ≠ A j ∧ A i ≠ -A j) :
    ∀ i j, i ≠ j → (A * C) i ≠ (A * C) j ∧ (A * C) i ≠ -(A * C) j := by
  intro i j hij
  constructor
  · intro h
    exact (hseparate i j hij).1 (vecMul_injective_of_right_inverse C E hCE h)
  · intro h
    apply (hseparate i j hij).2
    apply vecMul_injective_of_right_inverse C E hCE
    simpa only [Matrix.neg_vecMul] using h

end

/-- A selected identity block is enough; its rows need not occur first. -/
theorem gram_det_ge_six_of_picked_identity (A : Matrix (Fin 6) (Fin 4) ℤ)
    (s : RowSet) (hidentity : pickedBlock A s = 1)
    (hnonzero : ∀ i, A i ≠ 0)
    (hseparate : ∀ i j, i ≠ j → A i ≠ A j ∧ A i ≠ -A j) :
    6 ≤ (A.transpose * A).det := by
  let a : Fin 4 → ℤ := remainingBlock A s 0
  let b : Fin 4 → ℤ := remainingBlock A s 1
  have hremaining : remainingBlock A s = rowPair a b := by
    ext i j
    fin_cases i <;> rfl
  have hbasis (i : Fin 4) : A (pickedIndex s i) = basisRow i := by
    funext j
    have h := congrArg (fun M : Matrix (Fin 4) (Fin 4) ℤ => M i j) hidentity
    simpa [pickedBlock, basisRow, Matrix.one_apply, eq_comm] using h
  have haBasis : ∀ i : Fin 4, a ≠ basisRow i ∧ a ≠ -basisRow i := by
    intro i
    have h := hseparate (remainingIndex s 0) (pickedIndex s i)
      (remainingIndex_ne_pickedIndex s 0 i)
    rw [hbasis i] at h
    exact h
  have hbBasis : ∀ i : Fin 4, b ≠ basisRow i ∧ b ≠ -basisRow i := by
    intro i
    have h := hseparate (remainingIndex s 1) (pickedIndex s i)
      (remainingIndex_ne_pickedIndex s 1 i)
    rw [hbasis i] at h
    exact h
  have hab := hseparate (remainingIndex s 0) (remainingIndex s 1)
    ((remainingIndex s).injective.ne (by decide : (0 : Fin 2) ≠ 1))
  rw [gram_split A s, hidentity, Matrix.transpose_one, Matrix.one_mul, hremaining]
  exact gram_update_det_ge_six a b
    (two_le_squaredNorm a (hnonzero (remainingIndex s 0)) haBasis)
    (two_le_squaredNorm b (hnonzero (remainingIndex s 1)) hbBasis) hab.1 hab.2

end RowSubsets

section GeneralMatrix

noncomputable section

/-- Integer Gram determinants commute with the rational scalar extension. -/
theorem gram_det_int_cast (A : Matrix (Fin 6) (Fin 4) ℤ) :
    ((A.transpose * A).det : ℚ) =
      ((A.map (Int.castRingHom ℚ)).transpose * A.map (Int.castRingHom ℚ)).det := by
  rw [Int.cast_det, Matrix.map_mul]
  rfl

theorem rows_nonzero_int_cast (A : Matrix (Fin 6) (Fin 4) ℤ)
    (hnonzero : ∀ i, A i ≠ 0) : ∀ i, A.map (Int.castRingHom ℚ) i ≠ 0 := by
  intro i hzero
  apply hnonzero i
  funext j
  have h := congrFun hzero j
  change (A i j : ℚ) = 0 at h
  exact Int.cast_eq_zero.mp h

/-- Below six, any nonzero selected maximal minor must be a unit.
The two omitted nonzero rows contribute the two extra squared norms. -/
theorem picked_det_sq_eq_one_of_gram_lt_six (A : Matrix (Fin 6) (Fin 4) ℤ)
    (hnonzero : ∀ i, A i ≠ 0)
    (hlt : (A.transpose * A).det < 6)
    (s : RowSet) (hminor : (pickedBlock A s).det ≠ 0) :
    (pickedBlock A s).det ^ 2 = 1 := by
  let C : Matrix (Fin 4) (Fin 4) ℤ := pickedBlock A s
  let d : ℤ := C.det
  let AQ : Matrix (Fin 6) (Fin 4) ℚ := A.map (Int.castRingHom ℚ)
  let CQ : Matrix (Fin 4) (Fin 4) ℚ := C.map (Int.castRingHom ℚ)
  let F : Matrix (Fin 4) (Fin 4) ℚ := C.adjugate.map (Int.castRingHom ℚ)
  let B : Matrix (Fin 4) (Fin 4) ℚ := (d : ℚ)⁻¹ • F
  let N : Matrix (Fin 6) (Fin 4) ℚ := AQ * B
  let M : Matrix (Fin 6) (Fin 4) ℤ := A * C.adjugate
  have hd : d ≠ 0 := hminor
  have hdQ : (d : ℚ) ≠ 0 := Int.cast_ne_zero.mpr hd
  have hCF : CQ * F = (d : ℚ) • (1 : Matrix (Fin 4) (Fin 4) ℚ) := by
    change C.map (Int.castRingHom ℚ) * C.adjugate.map (Int.castRingHom ℚ) = _
    rw [← Matrix.map_mul, Matrix.mul_adjugate]
    ext i j
    simp [d, Matrix.one_apply, smul_eq_mul]
  have hFC : F * CQ = (d : ℚ) • (1 : Matrix (Fin 4) (Fin 4) ℚ) := by
    change C.adjugate.map (Int.castRingHom ℚ) * C.map (Int.castRingHom ℚ) = _
    rw [← Matrix.map_mul, Matrix.adjugate_mul]
    ext i j
    simp [d, Matrix.one_apply, smul_eq_mul]
  have hCB : CQ * B = 1 := by
    change CQ * ((d : ℚ)⁻¹ • F) = 1
    rw [Matrix.mul_smul, hCF, smul_smul, inv_mul_cancel₀ hdQ, one_smul]
  have hBC : B * CQ = 1 := by
    change ((d : ℚ)⁻¹ • F) * CQ = 1
    rw [Matrix.smul_mul, hFC, smul_smul, inv_mul_cancel₀ hdQ, one_smul]
  have hNnonzero : ∀ i, N i ≠ 0 :=
    rows_nonzero_mul AQ B CQ hBC (rows_nonzero_int_cast A hnonzero)
  have hNidentity : pickedBlock N s = 1 := by
    rw [pickedBlock_mul]
    exact hCB
  let a : Fin 4 → ℚ := remainingBlock N s 0
  let b : Fin 4 → ℚ := remainingBlock N s 1
  let u : Fin 4 → ℤ := M (remainingIndex s 0)
  let v : Fin 4 → ℤ := M (remainingIndex s 1)
  have hremaining : remainingBlock N s = rowPair a b := by
    ext i j
    fin_cases i <;> rfl
  have hGram : N.transpose * N =
      (1 : Matrix (Fin 4) (Fin 4) ℚ) + (rowPair a b).transpose * rowPair a b := by
    rw [gram_split N s, hNidentity, Matrix.transpose_one, Matrix.one_mul, hremaining]
  have hN : N = (d : ℚ)⁻¹ • M.map (Int.castRingHom ℚ) := by
    change A.map (Int.castRingHom ℚ) *
      ((d : ℚ)⁻¹ • C.adjugate.map (Int.castRingHom ℚ)) = _
    rw [Matrix.mul_smul, ← Matrix.map_mul]
  have hu : u ≠ 0 := by
    intro hzero
    apply hNnonzero (remainingIndex s 0)
    rw [hN]
    change (fun j => (d : ℚ)⁻¹ * (u j : ℚ)) = 0
    simp [hzero]
  have hv : v ≠ 0 := by
    intro hzero
    apply hNnonzero (remainingIndex s 1)
    rw [hN]
    change (fun j => (d : ℚ)⁻¹ * (v j : ℚ)) = 0
    simp [hzero]
  have hdu : ∀ i, (u i : ℚ) = (d : ℚ) * a i := by
    intro i
    change (M (remainingIndex s 0) i : ℚ) = (d : ℚ) * N (remainingIndex s 0) i
    rw [hN]
    change (u i : ℚ) = (d : ℚ) * ((d : ℚ)⁻¹ * (u i : ℚ))
    rw [← mul_assoc, mul_inv_cancel₀ hdQ, one_mul]
  have hdv : ∀ i, (v i : ℚ) = (d : ℚ) * b i := by
    intro i
    change (M (remainingIndex s 1) i : ℚ) = (d : ℚ) * N (remainingIndex s 1) i
    rw [hN]
    change (v i : ℚ) = (d : ℚ) * ((d : ℚ)⁻¹ * (v i : ℚ))
    rw [← mul_assoc, mul_inv_cancel₀ hdQ, one_mul]
  have hNC : N * CQ = AQ := by
    change (AQ * B) * CQ = AQ
    rw [Matrix.mul_assoc, hBC, Matrix.mul_one]
  have hCdet : CQ.det = (d : ℚ) := (Int.cast_det C).symm
  have hdet : ((A.transpose * A).det : ℚ) =
      (d : ℚ) ^ 2 * (N.transpose * N).det := by
    calc
      ((A.transpose * A).det : ℚ) = (AQ.transpose * AQ).det := gram_det_int_cast A
      _ = ((N * CQ).transpose * (N * CQ)).det := by rw [hNC]
      _ = CQ.det ^ 2 * (N.transpose * N).det := gram_det_mul_right N CQ
      _ = (d : ℚ) ^ 2 * (N.transpose * N).det := by rw [hCdet]
  rw [hGram] at hdet
  have hltQ : ((A.transpose * A).det : ℚ) < 6 := Int.cast_lt.mpr hlt
  rw [hdet] at hltQ
  exact denominator_sq_eq_one_of_scaled_gram_lt_six d hd a b u v hu hv hdu hdv hltQ

/-- A full-rank integral six-by-four matrix with nonzero, pairwise
sign-distinct rows has Gram determinant at least six. -/
theorem gram_det_ge_six (A : Matrix (Fin 6) (Fin 4) ℤ)
    (hnonzero : ∀ i, A i ≠ 0)
    (hseparate : ∀ i j, i ≠ j → A i ≠ A j ∧ A i ≠ -A j)
    (hpositive : 0 < (A.transpose * A).det) :
    6 ≤ (A.transpose * A).det := by
  classical
  by_contra h
  have hlt : (A.transpose * A).det < 6 := by omega
  obtain ⟨s, hs⟩ : ∃ s : RowSet, (pickedBlock A s).det ≠ 0 := by
    by_contra hnone
    have hzero : ∀ s : RowSet, RectangularGram.minor A s = 0 := by
      intro s
      by_contra hs
      exact hnone ⟨s, hs⟩
    have hdetzero : (A.transpose * A).det = 0 := by
      rw [RectangularGram.gram_det_eq_sum_minors_sq]
      simp [hzero]
    omega
  let C : Matrix (Fin 4) (Fin 4) ℤ := pickedBlock A s
  have hd : C.det ^ 2 = 1 := picked_det_sq_eq_one_of_gram_lt_six A hnonzero hlt s hs
  let J : Matrix (Fin 4) (Fin 4) ℤ := C.det • C.adjugate
  have hdprod : C.det * C.det = 1 := by simpa only [pow_two] using hd
  have hCJ : C * J = 1 := by
    change C * (C.det • C.adjugate) = 1
    rw [Matrix.mul_smul, Matrix.mul_adjugate, smul_smul, hdprod, one_smul]
  have hJC : J * C = 1 := by
    change (C.det • C.adjugate) * C = 1
    rw [Matrix.smul_mul, Matrix.adjugate_mul, smul_smul, hdprod, one_smul]
  let N : Matrix (Fin 6) (Fin 4) ℤ := A * J
  have hNidentity : pickedBlock N s = 1 := by
    rw [pickedBlock_mul]
    exact hCJ
  have hlower : 6 ≤ (N.transpose * N).det :=
    gram_det_ge_six_of_picked_identity N s hNidentity
      (rows_nonzero_mul A J C hJC hnonzero) (rows_separate_mul A J C hJC hseparate)
  have hNC : N * C = A := by
    change (A * J) * C = A
    rw [Matrix.mul_assoc, hJC, Matrix.mul_one]
  have hdet : (A.transpose * A).det = (N.transpose * N).det := by
    calc
      (A.transpose * A).det = ((N * C).transpose * (N * C)).det := by rw [hNC]
      _ = C.det ^ 2 * (N.transpose * N).det := gram_det_mul_right N C
      _ = (N.transpose * N).det := by rw [hd, one_mul]
  omega

end

end GeneralMatrix

end Loneliness.RectangularGramLowerBound
