import Mathlib.Data.Matrix.PEquiv
import Mathlib.LinearAlgebra.Matrix.Trace
import Mathlib.LinearAlgebra.Matrix.SemiringInverse
import Mathlib.Basic.Real.Basic
import Mathlib.GroupTheory.Perm.Cycle.Type
import Mathlib.Tactic.Ring
import Mathlib.Tactic.NormNum.Prime
import Mathlib.Tactic.Push

/-!
# Fixed points of prime-order Hadamard symmetries

The bound is proved from the full row orthogonality equations by a finite
sum-of-squares argument. No operator-norm or unproved Hadamard classification
result is assumed.
-/

namespace HadamardAutomorphism

open scoped BigOperators
open Matrix

variable {R C : Type*} [Fintype R] [Fintype C]

/-- Squared length of a linear combination of orthogonal rows. -/
theorem row_combination_sq_sum [DecidableEq R] (H : Matrix R C ℝ) (b : R → ℝ)
    (n : ℝ) (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then n else 0) :
    ∑ j, (∑ i, b i * H i j) ^ 2 = n * ∑ i, b i ^ 2 := by
  calc
    ∑ j, (∑ i, b i * H i j) ^ 2 =
        ∑ j, ∑ i, ∑ k, (b i * H i j) * (b k * H k j) := by
          simp only [pow_two, Finset.sum_mul, Finset.mul_sum]
          apply Finset.sum_congr rfl
          intro j _
          exact Finset.sum_comm
    _ = ∑ i, ∑ k, b i * b k * (∑ j, H i j * H k j) := by
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro i _
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro k _
      rw [Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro j _
      ring
    _ = n * ∑ i, b i ^ 2 := by
      simp_rw [horth]
      simp [mul_ite, ← Finset.mul_sum, pow_two, mul_comm]

/-- A repeated column pattern in orthogonal sign rows bounds the row count. -/
theorem repeated_columns_bound [DecidableEq R] [DecidableEq C]
    (H : Matrix R C ℝ) (n : ℝ)
    (hn : 0 ≤ n)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then n else 0)
    (hsign : ∀ i j, H i j ^ 2 = 1) (J : Finset C) (j₀ : C)
    (hconstant : ∀ i j, j ∈ J → H i j = H i j₀) :
    (J.card : ℝ) * Fintype.card R ≤ n := by
  have hlength := row_combination_sq_sum H (fun i => H i j₀) n horth
  simp only [hsign, Finset.sum_const, Finset.card_univ, nsmul_eq_mul, mul_one] at hlength
  have hv (j : C) (hj : j ∈ J) :
      (∑ i, H i j₀ * H i j) = (Fintype.card R : ℝ) := by
    simp_rw [hconstant _ j hj, ← pow_two, hsign]
    simp
  have hbound : (J.card : ℝ) * (Fintype.card R : ℝ) ^ 2 ≤
      n * (Fintype.card R : ℝ) := by
    calc
      (J.card : ℝ) * (Fintype.card R : ℝ) ^ 2 =
          ∑ j ∈ J, (∑ i, H i j₀ * H i j) ^ 2 := by
            symm
            calc
              (∑ j ∈ J, (∑ i, H i j₀ * H i j) ^ 2) =
                  ∑ _j ∈ J, (Fintype.card R : ℝ) ^ 2 := by
                    apply Finset.sum_congr rfl
                    intro j hj
                    rw [hv j hj]
              _ = (J.card : ℝ) * (Fintype.card R : ℝ) ^ 2 := by
                rw [Finset.sum_const, nsmul_eq_mul]
      _ ≤ ∑ j, (∑ i, H i j₀ * H i j) ^ 2 :=
        Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ J)
          (fun j _ _ => sq_nonneg _)
      _ = n * (Fintype.card R : ℝ) := hlength
  by_cases hf : Fintype.card R = 0
  · simp [hf, hn]
  · have hpos : (0 : ℝ) < Fintype.card R := by exact_mod_cast Nat.pos_of_ne_zero hf
    exact le_of_mul_le_mul_right (by simpa only [pow_two, mul_assoc] using hbound) hpos

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- The standard permutation matrix, expressed through Mathlib's partial-equivalence matrix. -/
abbrev permutationMatrix (σ : Equiv.Perm ι) : Matrix ι ι ℝ := σ.toPEquiv.toMatrix

/-- The trace of a permutation matrix counts its fixed points. -/
theorem trace_permutationMatrix (σ : Equiv.Perm ι) :
    Matrix.trace (permutationMatrix σ) = (Function.fixedPoints σ).ncard := by
  delta Matrix.trace
  simp [permutationMatrix, Equiv.toPEquiv_apply, ← Set.ncard_coe_finset,
    Function.fixedPoints, Function.IsFixedPt]

/-- For a square real matrix, row orthogonality also gives column orthogonality. -/
theorem transpose_mul_eq_of_mul_transpose (H : Matrix ι ι ℝ) {n : ℝ} (hn : n ≠ 0)
    (horth : H * H.transpose = n • (1 : Matrix ι ι ℝ)) :
    H.transpose * H = n • (1 : Matrix ι ι ℝ) := by
  have hr : H * (n⁻¹ • H.transpose) = 1 := by
    rw [Matrix.mul_smul, horth, smul_smul, inv_mul_cancel₀ hn, one_smul]
  have hl := mul_eq_one_comm.mp hr
  have hs := congrArg (fun A : Matrix ι ι ℝ => n • A) hl
  simpa only [Matrix.smul_mul, smul_smul, mul_inv_cancel₀ hn, one_smul] using hs

/-- Intertwined permutation matrices have the same fixed-point count. -/
theorem equal_fixed_counts (H : Matrix ι ι ℝ) (σ τ : Equiv.Perm ι) {n : ℝ}
    (hn : n ≠ 0) (horth : H * H.transpose = n • (1 : Matrix ι ι ℝ))
    (hinter : permutationMatrix σ * H = H * permutationMatrix τ) :
    Fintype.card (Function.fixedPoints σ) = Fintype.card (Function.fixedPoints τ) := by
  have hcol := transpose_mul_eq_of_mul_transpose H hn horth
  have ht : n * Matrix.trace (permutationMatrix σ) = n * Matrix.trace (permutationMatrix τ) := by
    calc
      n * Matrix.trace (permutationMatrix σ) =
          Matrix.trace ((permutationMatrix σ * H) * H.transpose) := by
            rw [Matrix.mul_assoc, horth]
            simp
      _ = Matrix.trace ((H * permutationMatrix τ) * H.transpose) := by rw [hinter]
      _ = Matrix.trace ((H.transpose * H) * permutationMatrix τ) :=
        Matrix.trace_mul_cycle H (permutationMatrix τ) H.transpose
      _ = n * Matrix.trace (permutationMatrix τ) := by rw [hcol]; simp
  have heq := mul_left_cancel₀ hn ht
  rw [trace_permutationMatrix, trace_permutationMatrix] at heq
  rw [Set.fintypeCard_eq_ncard, Set.fintypeCard_eq_ncard]
  exact_mod_cast heq

/-- Entrywise simultaneous symmetry is the usual permutation intertwining equation. -/
theorem intertwining_of_invariant (H : Matrix ι ι ℝ) (σ τ : Equiv.Perm ι)
    (hinv : ∀ i j, H (σ i) (τ j) = H i j) :
    permutationMatrix σ * H = H * permutationMatrix τ := by
  change σ.toPEquiv.toMatrix * H = H * τ.toPEquiv.toMatrix
  rw [PEquiv.toMatrix_toPEquiv_mul, PEquiv.mul_toMatrix_toPEquiv]
  ext i j
  simpa only [Matrix.submatrix_apply, id_eq, Equiv.apply_symm_apply] using hinv i (τ.symm j)

/-- Fixing as many indices as the whole finite index set means the permutation is the identity. -/
theorem eq_one_of_full_fixed_count (σ : Equiv.Perm ι)
    (hfixed : Fintype.card (Function.fixedPoints σ) = Fintype.card ι) : σ = 1 := by
  have hle := σ.sum_cycleType_le
  rw [σ.card_fixedPoints] at hfixed
  have hs : σ.cycleType.sum = 0 := by omega
  rw [σ.sum_cycleType, Finset.card_eq_zero, Equiv.Perm.support_eq_empty_iff] at hs
  exact hs

/-- Nontrivial row and column permutations occur together in a Hadamard symmetry. -/
theorem nontrivial_column_of_nontrivial_row (H : Matrix ι ι ℝ)
    (σ τ : Equiv.Perm ι) {n : ℝ} (hn : n ≠ 0)
    (horth : H * H.transpose = n • (1 : Matrix ι ι ℝ))
    (hinv : ∀ i j, H (σ i) (τ j) = H i j) (hσ : σ ≠ 1) : τ ≠ 1 := by
  intro hτ
  have heq := equal_fixed_counts H σ τ hn horth (intertwining_of_invariant H σ τ hinv)
  apply hσ
  apply eq_one_of_full_fixed_count σ
  rw [heq, hτ, Equiv.Perm.card_fixedPoints]
  simp

/-- Prime-order permutation cycles give the exact fixed/moving decomposition. -/
theorem fixed_count_add_prime_cycles (σ : Equiv.Perm ι) {q : ℕ}
    (hq : q.Prime) (hσ : σ ^ q = 1) :
    Fintype.card (Function.fixedPoints σ) + q * σ.cycleType.card = Fintype.card ι := by
  let : Fact q.Prime := ⟨hq⟩
  have hsum : σ.cycleType.sum = q * σ.cycleType.card := by
    rw [Equiv.Perm.cycleType_of_pow_prime_eq_one hσ]
    simp [mul_comm]
  have hle := σ.sum_cycleType_le
  rw [σ.card_fixedPoints]
  omega

/-- A moving orbit has exactly `q` entries for a permutation with prime exponent `q`. -/
theorem moving_cycle_card (σ : Equiv.Perm ι) {q : ℕ} (hq : q.Prime)
    (hσ : σ ^ q = 1) (j : ι) (hj : σ j ≠ j) :
    (σ.cycleOf j).support.card = q := by
  have hc := Equiv.Perm.isCycle_cycleOf σ hj
  have hd := (Equiv.Perm.orderOf_cycleOf_dvd_orderOf σ j).trans
    (orderOf_dvd_of_pow_eq_one hσ)
  have ho : orderOf (σ.cycleOf j) = q :=
    (hq.eq_one_or_self_of_dvd _ hd).resolve_left (by
      intro h
      exact hc.ne_one (orderOf_eq_one_iff.mp h))
  simpa only [hc.orderOf] using ho

omit [DecidableEq ι] in
/-- A fixed row is constant on each column cycle. -/
theorem fixed_row_constant_on_cycle (H : Matrix ι ι ℝ) (σ τ : Equiv.Perm ι)
    (hinv : ∀ i j, H (σ i) (τ j) = H i j) (i : Function.fixedPoints σ)
    (j₀ j : ι) (hj : τ.SameCycle j₀ j) : H i j = H i j₀ := by
  obtain ⟨k, rfl⟩ := hj.exists_nat_pow_eq
  clear hj
  induction k with
  | zero => simp
  | succ k ih =>
    rw [pow_succ', Equiv.Perm.mul_apply]
    have h := hinv i ((τ ^ k) j₀)
    have hi : σ i.val = i.val := i.property
    rw [hi] at h
    exact h.trans ih

/-- A nontrivial column permutation forces `q` times the fixed-row count below the order. -/
theorem fixed_rows_bound (H : Matrix ι ι ℝ) (n : ℝ) (σ τ : Equiv.Perm ι)
    (hn : 0 ≤ n)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then n else 0)
    (hsign : ∀ i j, H i j ^ 2 = 1)
    (hinv : ∀ i j, H (σ i) (τ j) = H i j)
    {q : ℕ} (hq : q.Prime) (hτ : τ ^ q = 1) (hnt : τ ≠ 1) :
    (q : ℝ) * Fintype.card (Function.fixedPoints σ) ≤ n := by
  classical
  obtain ⟨j₀, hj₀⟩ : ∃ j, τ j ≠ j := by
    by_contra h
    push Not at h
    exact hnt (Equiv.ext h)
  let J := (τ.cycleOf j₀).support
  have hJ : J.card = q := moving_cycle_card τ hq hτ j₀ hj₀
  have h := repeated_columns_bound (fun (i : Function.fixedPoints σ) j => H i j)
    n hn (fun i k => by simpa only [Subtype.val_inj] using horth i k)
    (fun i j => hsign i j) J j₀ (fun i j hj =>
      fixed_row_constant_on_cycle H σ τ hinv i j₀ j
        ((Equiv.Perm.mem_support_cycleOf_iff' hj₀).mp hj))
  simpa only [hJ] using h

/-- Numerical forcing for order 2396 and prime 479. -/
theorem fixed_count_2396_eq_one (σ : Equiv.Perm ι)
    (hcard : Fintype.card ι = 2396) (hσ : σ ^ 479 = 1)
    (hbound : (479 : ℝ) * Fintype.card (Function.fixedPoints σ) ≤ 2396) :
    Fintype.card (Function.fixedPoints σ) = 1 ∧ σ.cycleType.card = 5 := by
  have hprime : Nat.Prime 479 := by norm_num
  have heq := fixed_count_add_prime_cycles σ hprime hσ
  rw [hcard] at heq
  have hb : 479 * Fintype.card (Function.fixedPoints σ) ≤ 2396 := by
    exact_mod_cast hbound
  omega

/-- The actual row and column permutations of a 2396 by 2396 Hadamard matrix
each have one fixed point and five moving cycles, when their common prime
exponent is 479 and the column permutation is nontrivial. -/
theorem order2396_fixed_points_and_cycles (H : Matrix ι ι ℝ)
    (σ τ : Equiv.Perm ι) (hcard : Fintype.card ι = 2396)
    (horth : ∀ i k, ∑ j, H i j * H k j = if i = k then (2396 : ℝ) else 0)
    (hsign : ∀ i j, H i j ^ 2 = 1)
    (hinv : ∀ i j, H (σ i) (τ j) = H i j)
    (hσ : σ ^ 479 = 1) (hτ : τ ^ 479 = 1) (hnt : τ ≠ 1) :
    (Fintype.card (Function.fixedPoints σ) = 1 ∧ σ.cycleType.card = 5) ∧
      (Fintype.card (Function.fixedPoints τ) = 1 ∧ τ.cycleType.card = 5) := by
  have hb := fixed_rows_bound H 2396 σ τ (by norm_num) horth hsign hinv
    (by norm_num : Nat.Prime 479) hτ hnt
  have hm : H * H.transpose = (2396 : ℝ) • (1 : Matrix ι ι ℝ) := by
    ext i k
    simpa [Matrix.mul_apply, Matrix.transpose_apply, Matrix.smul_apply,
      Matrix.one_apply] using horth i k
  have heq := equal_fixed_counts H σ τ (by norm_num : (2396 : ℝ) ≠ 0)
    hm (intertwining_of_invariant H σ τ hinv)
  exact ⟨fixed_count_2396_eq_one σ hcard hσ hb,
    fixed_count_2396_eq_one τ hcard hτ (by rwa [← heq])⟩

end HadamardAutomorphism
