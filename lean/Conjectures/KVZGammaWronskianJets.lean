module

public import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas
public import Mathlib.Analysis.Calculus.ContDiff.Deriv
public import Mathlib.LinearAlgebra.Matrix.Block
public import Mathlib.Algebra.BigOperators.Fin
public import Mathlib.Tactic.Ring
public import Lean.Elab.Tactic.Omega

/-!
# Wronskian normalization from the Leibniz jet matrix

The product rule gives a lower-triangular matrix with diagonal equal to the
common multiplier. Its determinant proves the common-factor Wronskian
identity at every order. Normalizing by the nonzero first function then
reduces the Wronskian to that of the derivatives of the remaining quotients.
-/

@[expose] public section

namespace KVZGamma

open Matrix Set
open scoped BigOperators ContDiff Topology

noncomputable def jetMatrix {n : ℕ} (f : Fin n → ℝ → ℝ) (t : ℝ) :
    Matrix (Fin n) (Fin n) ℝ := fun i j => iteratedDeriv i.val (f j) t

/-- Rows are derivative orders and columns are functions, in their given order. -/
noncomputable def wronskian {n : ℕ} (f : Fin n → ℝ → ℝ) (t : ℝ) : ℝ :=
  (jetMatrix f t).det

/-- Every leading function prefix has a nonzero Wronskian on the interval. -/
def initialWronskiansNonzero {n : ℕ} (f : Fin n → ℝ → ℝ) (I : Set ℝ) : Prop :=
  ∀ k (hk : k ≤ n) t, t ∈ I →
    wronskian (fun j : Fin k => f (j.castLE hk)) t ≠ 0

theorem initialWronskiansNonzero_iff {n : ℕ} (f : Fin n → ℝ → ℝ) (I : Set ℝ) :
    initialWronskiansNonzero f I ↔ ∀ k (hk : k ≤ n) t, t ∈ I →
      wronskian (fun j : Fin k => f (j.castLE hk)) t ≠ 0 := by
  simp only [initialWronskiansNonzero]

@[simp] theorem wronskian_zero (f : Fin 0 → ℝ → ℝ) (t : ℝ) : wronskian f t = 1 := by
  simp [wronskian]

@[simp] theorem wronskian_one (f : Fin 1 → ℝ → ℝ) (t : ℝ) : wronskian f t = f 0 t := by
  simp [wronskian, jetMatrix, Matrix.det_unique]

theorem wronskian_congrOn {n : ℕ} {I : Set ℝ} (hI : IsOpen I)
    (f g : Fin n → ℝ → ℝ) (hfg : ∀ j, EqOn (f j) (g j) I)
    {t : ℝ} (ht : t ∈ I) : wronskian f t = wronskian g t := by
  apply congrArg Matrix.det
  ext i j
  exact (hfg j).iteratedDeriv_of_isOpen hI i.val ht

noncomputable def leibnizJet (n : ℕ) (a : ℝ → ℝ) (t : ℝ) :
    Matrix (Fin n) (Fin n) ℝ :=
  fun i j => (i.val.choose j.val : ℝ) * iteratedDeriv (i.val - j.val) a t

theorem leibnizJet_lower (n : ℕ) (a : ℝ → ℝ) (t : ℝ) :
    (leibnizJet n a t).IsLowerTriangular := by
  intro i j hij
  change i < j at hij
  simp [leibnizJet, Nat.choose_eq_zero_of_lt hij]

@[simp] theorem leibnizJet_diag (n : ℕ) (a : ℝ → ℝ) (t : ℝ) (i : Fin n) :
    leibnizJet n a t i i = a t := by
  simp [leibnizJet]

theorem leibnizJet_det (n : ℕ) (a : ℝ → ℝ) (t : ℝ) :
    (leibnizJet n a t).det = a t ^ n := by
  rw [Matrix.det_of_isLowerTriangular _ (leibnizJet_lower n a t)]
  simp

/-- The full Leibniz rule, assembled as matrix multiplication of jets. -/
theorem jetMatrix_mul {n : ℕ} (a : ℝ → ℝ) (f : Fin n → ℝ → ℝ) (t : ℝ)
    (ha : ContDiffAt ℝ n a t) (hf : ∀ j, ContDiffAt ℝ n (f j) t) :
    jetMatrix (fun j x => a x * f j x) t = leibnizJet n a t * jetMatrix f t := by
  ext i j
  have hi : (i.val : ℕ∞ω) ≤ n := by exact_mod_cast i.isLt.le
  have hcomm : (fun x => a x * f j x) = (fun x => f j x * a x) := by
    funext x
    ring
  change iteratedDeriv i.val (fun x => a x * f j x) t = _
  rw [hcomm, iteratedDeriv_fun_mul ((hf j).of_le hi) (ha.of_le hi)]
  simp only [Matrix.mul_apply, leibnizJet, jetMatrix]
  rw [Fin.sum_univ_eq_sum_range (fun k : ℕ =>
    ((i.val.choose k : ℝ) * iteratedDeriv (i.val - k) a t) * iteratedDeriv k (f j) t) n]
  calc
    (∑ k ∈ Finset.range (i.val + 1),
        (i.val.choose k : ℝ) * iteratedDeriv k (f j) t * iteratedDeriv (i.val - k) a t) =
      ∑ k ∈ Finset.range (i.val + 1),
        ((i.val.choose k : ℝ) * iteratedDeriv (i.val - k) a t) * iteratedDeriv k (f j) t := by
          apply Finset.sum_congr rfl
          intro k hk
          ring
    _ = ∑ k ∈ Finset.range n,
        ((i.val.choose k : ℝ) * iteratedDeriv (i.val - k) a t) * iteratedDeriv k (f j) t := by
      apply Finset.sum_subset (Finset.range_mono (Nat.succ_le_iff.mpr i.isLt))
      intro k hk hki
      have hik : i.val < k := by simp only [Finset.mem_range] at hki; omega
      simp [Nat.choose_eq_zero_of_lt hik]

theorem wronskian_mul {n : ℕ} (a : ℝ → ℝ) (f : Fin n → ℝ → ℝ) (t : ℝ)
    (ha : ContDiffAt ℝ n a t) (hf : ∀ j, ContDiffAt ℝ n (f j) t) :
    wronskian (fun j x => a x * f j x) t = a t ^ n * wronskian f t := by
  rw [wronskian, jetMatrix_mul a f t ha hf, Matrix.det_mul, leibnizJet_det]
  rfl

noncomputable def normalizedDerivatives {n : ℕ} (f : Fin (n + 1) → ℝ → ℝ) :
    Fin n → ℝ → ℝ := fun j => deriv (fun t => f j.succ t / f 0 t)

theorem normalizedDerivatives_apply {n : ℕ} (f : Fin (n + 1) → ℝ → ℝ)
    (j : Fin n) (t : ℝ) :
    normalizedDerivatives f j t = deriv (fun x => f j.succ x / f 0 x) t := by
  simp only [normalizedDerivatives]

theorem normalizedDerivatives_contDiffOn {n : ℕ} {I : Set ℝ} (hI : IsOpen I)
    (f : Fin (n + 1) → ℝ → ℝ) (hf : ∀ j, ContDiffOn ℝ ∞ (f j) I)
    (hfirst : ∀ t ∈ I, f 0 t ≠ 0) (j : Fin n) :
    ContDiffOn ℝ ∞ (normalizedDerivatives f j) I := by
  exact ((hf j.succ).div (hf 0) hfirst).deriv_of_isOpen hI (by simp)

/-- After the first function is normalized to one, expansion along the
constant column leaves precisely the Wronskian of quotient derivatives. -/
theorem wronskian_normalized {n : ℕ} {I : Set ℝ} (hI : IsOpen I)
    (f : Fin (n + 1) → ℝ → ℝ) (hfirst : ∀ t ∈ I, f 0 t ≠ 0)
    {t : ℝ} (ht : t ∈ I) :
    wronskian (fun j x => f j x / f 0 x) t = wronskian (normalizedDerivatives f) t := by
  let q : Fin (n + 1) → ℝ → ℝ := fun j x => f j x / f 0 x
  have hq : EqOn (q 0) (fun _ => (1 : ℝ)) I := fun x hx => div_self (hfirst x hx)
  have hzero : jetMatrix q t 0 0 = 1 := by simp [jetMatrix, q, hfirst t ht]
  have hsucc (i : Fin n) : jetMatrix q t i.succ 0 = 0 := by
    change iteratedDeriv (i.val + 1) (q 0) t = 0
    rw [hq.iteratedDeriv_of_isOpen hI (i.val + 1) ht]
    simp [iteratedDeriv_const]
  change (jetMatrix q t).det = _
  rw [Matrix.det_succ_column_zero, Fin.sum_univ_succ]
  simp only [hzero, hsucc, Fin.val_zero, pow_zero, one_mul, mul_zero, zero_mul,
    Finset.sum_const_zero, add_zero, Fin.succAbove_zero]
  apply congrArg Matrix.det
  ext i j
  exact congrFun (iteratedDeriv_succ' (n := i.val) (f := q j.succ)) t

/-- The Wronskian reduction used in the all-order criterion. -/
theorem wronskian_normalizedDerivatives {n : ℕ} {I : Set ℝ} (hI : IsOpen I)
    (f : Fin (n + 1) → ℝ → ℝ) (hf : ∀ j, ContDiffOn ℝ ∞ (f j) I)
    (hfirst : ∀ t ∈ I, f 0 t ≠ 0) {t : ℝ} (ht : t ∈ I) :
    wronskian f t = f 0 t ^ (n + 1) * wronskian (normalizedDerivatives f) t := by
  let q : Fin (n + 1) → ℝ → ℝ := fun j x => f j x / f 0 x
  have hq : ∀ j, ContDiffOn ℝ ∞ (q j) I := fun j => (hf j).div (hf 0) hfirst
  calc
    wronskian f t = wronskian (fun j x => f 0 x * q j x) t := by
      apply wronskian_congrOn hI f _ _ ht
      intro j x hx
      dsimp [q]
      field_simp [hfirst x hx]
    _ = f 0 t ^ (n + 1) * wronskian q t :=
      wronskian_mul (f 0) q t
        (((hf 0).contDiffAt (hI.mem_nhds ht)).of_le (by simp))
        (fun j => ((hq j).contDiffAt (hI.mem_nhds ht)).of_le (by simp))
    _ = _ := congrArg (f 0 t ^ (n + 1) * ·) (wronskian_normalized hI f hfirst ht)

end KVZGamma
