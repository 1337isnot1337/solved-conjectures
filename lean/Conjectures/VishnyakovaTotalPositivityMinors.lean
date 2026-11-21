module

public import Mathlib.LinearAlgebra.Matrix.Determinant.TotallyNonneg
public import Mathlib.Topology.Instances.Matrix
public import Mathlib.Topology.Order.OrderClosed
public import Mathlib.Order.Fin.Tuple
public import Mathlib.Topology.Instances.Real.Lemmas
public import Mathlib.Tactic.FinCases
public import Mathlib.Tactic.Linarith
public import Mathlib.Tactic.Ring

/-!
# Toeplitz minors and removal of a real pole

Only minors with consecutive columns are needed for rational pole removal.
The proof uses a bordered minor whose normalized first row tends to
`1, γ, γ^2, ...`; successive column operations then produce the coefficients
of `(1 - γ X) F(X)`.

This is the finite determinant argument in Lemma 3.7 of S. Skryabin,
*On the graded algebras associated with Hecke symmetries, II. The Hilbert
series*, arXiv:1903.09128. The argument below does not assume a classification
of Pólya frequency sequences.
-/

@[expose] public section

namespace VishnyakovaTotalPositivity

open Matrix Filter Topology
open scoped BigOperators

/-- The upper triangular Toeplitz matrix of a sequence. -/
def toeplitz (a : ℕ → ℝ) : Matrix ℕ ℕ ℝ :=
  fun i j => if i ≤ j then a (j - i) else 0

@[simp] theorem toeplitz_zero_row (a : ℕ → ℝ) (j : ℕ) :
    toeplitz a 0 j = a j := by simp [toeplitz]

@[simp] theorem toeplitz_add (a : ℕ → ℝ) (n i j : ℕ) :
    toeplitz a (n + i) (n + j) = toeplitz a i j := by
  simp only [toeplitz, Nat.add_le_add_iff_left, Nat.add_sub_add_left]

/-- Nonnegativity of every minor whose columns form a consecutive interval. -/
def ConsecutiveColumnMinorsNonneg (a : ℕ → ℝ) : Prop :=
  ∀ (k : ℕ) (rows : Fin k → ℕ) (start : ℕ), StrictMono rows →
    0 ≤ Matrix.det (fun i j : Fin k => toeplitz a (rows i) (start + j.val))

theorem consecutiveColumnMinorsNonneg_of_totallyNonneg {a : ℕ → ℝ}
    (ha : (toeplitz a).IsTotallyNonneg) : ConsecutiveColumnMinorsNonneg a := by
  intro k rows start hrows
  apply ha hrows
  intro i j hij
  exact Nat.add_lt_add_left hij start

theorem ConsecutiveColumnMinorsNonneg.nonneg {a : ℕ → ℝ}
    (ha : ConsecutiveColumnMinorsNonneg a) (n : ℕ) : 0 ≤ a n := by
  have h := ha 1 (fun _ => 0) n (by intro i j hij; fin_cases i; fin_cases j; simp at hij)
  rw [Matrix.det_fin_one (fun i j : Fin 1 => toeplitz a 0 (n + j.val))] at h
  simpa using h

theorem ConsecutiveColumnMinorsNonneg.logConcave {a : ℕ → ℝ}
    (ha : ConsecutiveColumnMinorsNonneg a) (n : ℕ) :
    a n * a (n + 2) ≤ a (n + 1) ^ 2 := by
  have h := ha 2 (fun i => i.val) (n + 1) (fun _ _ h => h)
  rw [Matrix.det_fin_two (fun i j : Fin 2 => toeplitz a i.val (n + 1 + j.val))] at h
  simp only [Fin.val_zero, Fin.val_one, Nat.add_zero,
    toeplitz_zero_row] at h
  have h1 : toeplitz a 1 (n + 1) = a n := by simp [toeplitz]
  have h2 : toeplitz a 1 (n + 1 + 1) = a (n + 1) := by simp [toeplitz]
  rw [h1, h2] at h
  nlinarith

theorem ConsecutiveColumnMinorsNonneg.zero_tail {a : ℕ → ℝ}
    (ha : ConsecutiveColumnMinorsNonneg a) {n : ℕ}
    (hn : 0 < a n) (hz : a (n + 1) = 0) {m : ℕ} (hm : n < m) :
    a (m + 1) = 0 := by
  have hr : StrictMono (![0, m - n] : Fin 2 → ℕ) := by
    intro i j hij
    fin_cases i <;> fin_cases j <;> simp_all
  have h := ha 2 ![0, m - n] m hr
  rw [Matrix.det_fin_two (fun i j : Fin 2 => toeplitz a (![0, m - n] i) (m + j.val))] at h
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one,
    Fin.val_zero, Fin.val_one, Nat.add_zero, toeplitz_zero_row] at h
  have h1 : toeplitz a (m - n) m = a n := by
    rw [toeplitz, ite_eq_left (Nat.sub_le _ _)]
    congr 1
    omega
  have h2 : toeplitz a (m - n) (m + 1) = a (n + 1) := by
    rw [toeplitz, ite_eq_left (by omega)]
    congr 1
    omega
  rw [h1, h2, hz] at h
  have hm0 := ha.nonneg (m + 1)
  nlinarith

theorem ConsecutiveColumnMinorsNonneg.positive_or_finite_support {a : ℕ → ℝ}
    (ha : ConsecutiveColumnMinorsNonneg a) (ha0 : 0 < a 0) :
    (∀ n, 0 < a n) ∨ ∃ N, ∀ n, N ≤ n → a n = 0 := by
  classical
  by_cases hpos : ∀ n, 0 < a n
  · exact Or.inl hpos
  · right
    have hex : ∃ n, a n = 0 := by
      push Not at hpos
      obtain ⟨n, hn⟩ := hpos
      exact ⟨n, le_antisymm hn (ha.nonneg n)⟩
    let N := Nat.find hex
    have hN : a N = 0 := Nat.find_spec hex
    have hNpos : 0 < N := by
      by_contra h
      have : N = 0 := by omega
      rw [this] at hN
      exact ha0.ne' hN
    have hprev : 0 < a (N - 1) := by
      have hne : a (N - 1) ≠ 0 := Nat.find_min hex (by omega)
      exact lt_of_le_of_ne (ha.nonneg _) hne.symm
    refine ⟨N, fun n hn => ?_⟩
    obtain rfl | hlt := eq_or_lt_of_le hn
    · exact hN
    · have h := ha.zero_tail hprev (by simpa [Nat.sub_add_cancel hNpos] using hN)
        (m := n - 1) (by omega)
      simpa [Nat.sub_add_cancel (by omega : 1 ≤ n)] using h

theorem toeplitz_shift_of_initial_zeros (a : ℕ → ℝ) (m : ℕ)
    (hz : ∀ k, k < m → a k = 0) (i j : ℕ) :
    toeplitz (fun n => a (n + m)) i j = toeplitz a i (j + m) := by
  by_cases hij : i ≤ j
  · simp only [toeplitz, ite_eq_left hij, ite_eq_left (by omega : i ≤ j + m)]
    congr 1
    omega
  · simp only [toeplitz, ite_eq_right hij]
    split_ifs with h
    · exact (hz _ (by omega)).symm
    · rfl

theorem totallyNonneg_shift_of_initial_zeros {a : ℕ → ℝ}
    (ha : (toeplitz a).IsTotallyNonneg) (m : ℕ)
    (hz : ∀ k, k < m → a k = 0) :
    (toeplitz (fun n => a (n + m))).IsTotallyNonneg := by
  have h := ha.submatrix (f := id) (g := fun j => j + m)
    strictMono_id (fun _ _ h => Nat.add_lt_add_right h m)
  have heq : (toeplitz a).submatrix id (fun j => j + m) =
      toeplitz (fun n => a (n + m)) := by
    ext i j
    exact (toeplitz_shift_of_initial_zeros a m hz i j).symm
  rwa [heq] at h

/-- Coefficients after multiplication of a generating series by `1 - γ X`. -/
def removePole (a : ℕ → ℝ) (γ : ℝ) : ℕ → ℝ
  | 0 => a 0
  | n + 1 => a (n + 1) - γ * a n

theorem toeplitz_removePole (a : ℕ → ℝ) (γ : ℝ) (i j : ℕ) :
    toeplitz (removePole a γ) i j =
      toeplitz a i j - γ * toeplitz a (i + 1) j := by
  by_cases hij : i ≤ j
  · obtain rfl | hij' := eq_or_lt_of_le hij
    · simp [toeplitz, removePole]
    · have hs : j - i = (j - (i + 1)) + 1 := by omega
      simp only [toeplitz, ite_eq_left hij, ite_eq_left (by omega : i + 1 ≤ j), hs,
        removePole]
  · have hij' : ¬ i + 1 ≤ j := by omega
    simp [toeplitz, hij, hij']

/-- The determinant identity behind pole removal. -/
theorem geometric_border_det {k : ℕ} (γ : ℝ)
    (A : Matrix (Fin (k + 1)) (Fin (k + 1)) ℝ)
    (hA : ∀ j, A 0 j = γ ^ j.val) :
    A.det = Matrix.det (fun i j : Fin k => A i.succ j.succ - γ * A i.succ j.castSucc) := by
  let B : Matrix (Fin (k + 1)) (Fin (k + 1)) ℝ :=
    fun i => Fin.cons (A i 0) (fun j => A i j.succ - γ * A i j.castSucc)
  have hdet : A.det = B.det := by
    apply Matrix.det_eq_of_forall_col_eq_smul_add_pred (fun _ => γ)
    · intro i
      simp [B]
    · intro i j
      simp only [B, Fin.cons_succ]
      ring
  have hzero : B 0 0 = 1 := by simp [B, hA]
  have hsucc (j : Fin k) : B 0 j.succ = 0 := by
    simp only [B, Fin.cons_succ, hA, Fin.val_succ, Fin.val_castSucc, pow_succ]
    ring
  rw [hdet, Matrix.det_succ_row_zero, Fin.sum_univ_succ]
  simp only [Fin.val_zero, pow_zero, hzero, one_mul, Fin.succAbove_zero,
    hsucc, mul_zero, zero_mul, Finset.sum_const_zero, add_zero]
  rfl

theorem ConsecutiveColumnMinorsNonneg.removePole {a : ℕ → ℝ} {γ : ℝ}
    (ha : ConsecutiveColumnMinorsNonneg a) (hpos : ∀ n, 0 < a n)
    (hratio : ∀ k : ℕ, Tendsto (fun n => a (n + k) / a n) atTop (𝓝 (γ ^ k))) :
    ConsecutiveColumnMinorsNonneg (removePole a γ) := by
  intro k rows start hrows
  let rowsN (n : ℕ) : Fin (k + 1) → ℕ :=
    Fin.cons 0 (fun i => n + rows i + 1)
  let A (n : ℕ) : Matrix (Fin (k + 1)) (Fin (k + 1)) ℝ :=
    fun i j => toeplitz a (rowsN n i) (n + start + j.val)
  let B (n : ℕ) : Matrix (Fin (k + 1)) (Fin (k + 1)) ℝ :=
    (A n).updateRow 0 ((a (n + start))⁻¹ • A n 0)
  let L : Matrix (Fin (k + 1)) (Fin (k + 1)) ℝ :=
    Fin.cons (fun j => γ ^ j.val)
      (fun i j => toeplitz a (rows i + 1) (start + j.val))
  have hrowsN (n : ℕ) : StrictMono (rowsN n) := by
    apply Fin.strictMono_cons.mpr
    constructor
    · intro i
      omega
    · intro i j hij
      have := hrows hij
      change n + rows i + 1 < n + rows j + 1
      omega
  have hA (n : ℕ) : 0 ≤ (A n).det := ha (k + 1) (rowsN n) (n + start) (hrowsN n)
  have hB (n : ℕ) : 0 ≤ (B n).det := by
    change 0 ≤ ((A n).updateRow 0 ((a (n + start))⁻¹ • A n 0)).det
    rw [Matrix.det_updateRow_smul, Matrix.updateRow_eq_self]
    exact mul_nonneg (inv_nonneg.mpr (hpos (n + start)).le) (hA n)
  have hlim : Tendsto B atTop (𝓝 L) := by
    apply tendsto_pi_nhds.mpr
    intro i
    apply tendsto_pi_nhds.mpr
    intro j
    refine Fin.cases ?_ (fun i => ?_) i
    · have h := (hratio j.val).comp (tendsto_add_atTop_nat start)
      change Tendsto (fun n => ((a (n + start))⁻¹ • A n 0) j) atTop (𝓝 (γ ^ j.val))
      simpa [A, rowsN, Function.comp_def, div_eq_mul_inv, mul_comm, Nat.add_assoc] using h
    · have hconst : (fun n => B n i.succ j) =
          fun _ => toeplitz a (rows i + 1) (start + j.val) := by
        funext n
        change ((A n).updateRow 0 ((a (n + start))⁻¹ • A n 0)) i.succ j = _
        rw [Matrix.updateRow_ne (Fin.succ_ne_zero i)]
        change toeplitz a (n + rows i + 1) (n + start + j.val) = _
        rw [show n + rows i + 1 = n + (rows i + 1) by omega,
          show n + start + j.val = n + (start + j.val) by omega, toeplitz_add]
      rw [hconst]
      exact tendsto_const_nhds
  have hdetlim : Tendsto (fun n => (B n).det) atTop (𝓝 L.det) :=
    (continuous_id.matrix_det.tendsto L).comp hlim
  have hL : 0 ≤ L.det := ge_of_tendsto' hdetlim hB
  have hLdet := geometric_border_det γ L (by intro j; simp [L])
  rw [hLdet] at hL
  convert hL using 1
  congr 1
  ext i j
  simp only [L, Fin.cons_succ, Fin.val_succ, Fin.val_castSucc]
  rw [toeplitz_removePole]
  congr 1
  rw [show start + (j.val + 1) = (start + j.val) + 1 by omega]
  simpa only [Nat.add_comm 1] using (toeplitz_add a 1 (rows i) (start + j.val)).symm

end VishnyakovaTotalPositivity
