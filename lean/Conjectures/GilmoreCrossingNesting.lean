import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Matrix.Mul
import Mathlib.Tactic.Ring

namespace GilmoreCrossingNesting

open Finset

variable {R : Type*} [CommSemiring R]

def quantum (r s : R) (h : ℕ) : R :=
  ∑ j ∈ Finset.range h, r^(h-1-j) * s^j

def rowTerm (μ y : R) (q : ℕ → R) (prev : ℕ → R) (n k j : ℕ) : R :=
  μ^(n-j) * prev (j-1) * y^(j-k) * ∏ v ∈ Finset.Ico k j, q v

def rowSum (μ y : R) (q : ℕ → R) (prev : ℕ → R) (n k : ℕ) : R :=
  ∑ j ∈ Finset.Icc k n, rowTerm μ y q prev n k j

theorem interval_split (k n : ℕ) (hkn : k ≤ n) :
    Finset.Icc k n = insert k (Finset.Icc (k+1) n) := by
  ext j
  simp only [Finset.mem_Icc, Finset.mem_insert]
  omega

theorem rowTerm_base (μ y : R) (q : ℕ → R) (prev : ℕ → R) (n k : ℕ) :
    rowTerm μ y q prev n k k = μ^(n-k) * prev (k-1) := by
  simp [rowTerm]

theorem rowTerm_step (μ y : R) (q : ℕ → R) (prev : ℕ → R)
    (n k j : ℕ) (hkj : k < j) :
    rowTerm μ y q prev n k j = y * q k * rowTerm μ y q prev n (k+1) j := by
  unfold rowTerm
  rw [Finset.prod_eq_prod_Ico_succ_bot hkj]
  have hd : j-k = (j-(k+1))+1 := by omega
  rw [hd, pow_succ]
  ring

theorem row_recurrence (μ y : R) (q : ℕ → R) (prev : ℕ → R)
    (n k : ℕ) (hkn : k ≤ n) :
    rowSum μ y q prev n k = y*q k*rowSum μ y q prev n (k+1) +
      μ^(n-k)*prev (k-1) := by
  unfold rowSum
  rw [interval_split k n hkn, Finset.sum_insert (by simp)]
  rw [rowTerm_base]
  rw [Finset.mul_sum]
  have he : (∑ j ∈ Finset.Icc (k+1) n, rowTerm μ y q prev n k j) =
      ∑ j ∈ Finset.Icc (k+1) n, y*q k*rowTerm μ y q prev n (k+1) j := by
    apply Finset.sum_congr rfl
    intro j hj
    apply rowTerm_step
    have h := Finset.mem_Icc.mp hj
    omega
  rw [← he]
  exact add_comm _ _

inductive Path : ℕ → ℕ → Type
  | empty : Path 0 0
  | up {u d : ℕ} : Path u d → Path (u+1) d
  | down {u d : ℕ} : Path u d → d < u → Path u (d+1)
  deriving DecidableEq

def Path.weight (μ y : R) (q : ℕ → R) : {u d : ℕ} → Path u d → R
  | _, _, .empty => 1
  | _, _, @Path.up u d p => p.weight μ y q * μ^d
  | _, _, @Path.down u d p _ => p.weight μ y q * y * q (u-d)

def paths : (u d : ℕ) → Finset (Path u d)
  | 0, 0 => {Path.empty}
  | 0, d+1 => ∅
  | u+1, 0 => (paths u 0).image Path.up
  | u+1, d+1 =>
      (paths u (d+1)).image Path.up ∪
      if h : d < u+1 then (paths (u+1) d).image (fun p => Path.down p h) else ∅
termination_by u d => u+d

theorem paths_complete (u d : ℕ) (p : Path u d) : p ∈ paths u d := by
  induction p with
  | empty => simp [paths]
  | @up u d p ih =>
    cases d with
    | zero => simp [paths, ih]
    | succ d => simp [paths, ih]
  | @down u d p h ih =>
    cases u with
    | zero => omega
    | succ u =>
      simp [paths, h, ih]

def pathSum (μ y : R) (q : ℕ → R) (u d : ℕ) : R :=
  ∑ p ∈ paths u d, p.weight μ y q

theorem pathSum_base (μ y : R) (q : ℕ → R) : pathSum μ y q 0 0 = 1 := by
  simp [pathSum, paths, Path.weight]

theorem pathSum_step (μ y : R) (q : ℕ → R) (u d : ℕ) (h : d < u+1) :
    pathSum μ y q (u+1) (d+1) =
      pathSum μ y q u (d+1) * μ^(d+1) +
      pathSum μ y q (u+1) d * y * q (u+1-d) := by
  unfold pathSum
  rw [paths, dite_eq_left h]
  rw [Finset.sum_union]
  · rw [Finset.sum_image, Finset.sum_image]
    · simp only [Path.weight, Finset.sum_mul]
    · intro a _ b _ he
      cases he
      rfl
    · intro a _ b _ he
      cases he
      rfl
  · apply Finset.disjoint_left.mpr
    intro p hp1 hp2
    obtain ⟨a, _, rfl⟩ := Finset.mem_image.mp hp1
    obtain ⟨b, _, hb⟩ := Finset.mem_image.mp hp2
    cases hb

theorem Path.valid {u d : ℕ} (p : Path u d) : d ≤ u := by
  induction p with
  | empty => omega
  | up _ ih => omega
  | down _ h _ => omega

theorem paths_empty_of_excess (u d : ℕ) (h : u < d) : paths u d = ∅ := by
  apply Finset.eq_empty_iff_forall_notMem.mpr
  intro p hp
  have hv := p.valid
  omega

theorem pathSum_zero_of_excess (μ y : R) (q : ℕ → R) (u d : ℕ) (h : u < d) :
    pathSum μ y q u d = 0 := by
  simp [pathSum, paths_empty_of_excess u d h]

theorem pathSum_no_down (μ y : R) (q : ℕ → R) (u : ℕ) : pathSum μ y q u 0 = 1 := by
  induction u with
  | zero => exact pathSum_base μ y q
  | succ u ih =>
    unfold pathSum at *
    rw [paths, Finset.sum_image]
    · simp only [Path.weight, pow_zero, mul_one]
      exact ih
    · intro a _ b _ h
      cases h
      rfl

def pathEntry (μ y : R) (q : ℕ → R) (n k : ℕ) : R :=
  pathSum μ y q (n-1) (n-k)

theorem pathEntry_step (μ y : R) (q : ℕ → R) (n k : ℕ)
    (hn : 2 ≤ n) (hk : 1 ≤ k) (hkn : k < n) :
    pathEntry μ y q n k = y*q k*pathEntry μ y q n (k+1) +
      μ^(n-k)*pathEntry μ y q (n-1) (k-1) := by
  have h := pathSum_step μ y q (n-2) (n-k-1) (by omega)
  have h1 : n-2+1 = n-1 := by omega
  have h2 : n-k-1+1 = n-k := by omega
  have h3 : n-1-(n-k-1) = k := by omega
  have h4 : n-(k+1) = n-k-1 := by omega
  have h5 : (n-1)-1 = n-2 := by omega
  have h6 : (n-1)-(k-1) = n-k := by omega
  rw [h1, h2, h3] at h
  unfold pathEntry
  rw [h4, h5, h6]
  calc
    pathSum μ y q (n-1) (n-k) =
      pathSum μ y q (n-2) (n-k) * μ^(n-k) +
        pathSum μ y q (n-1) (n-k-1) * y * q k := h
    _ = _ := by ring

theorem pathEntry_diagonal (μ y : R) (q : ℕ → R) (n : ℕ) :
    pathEntry μ y q n n = 1 := by
  simp [pathEntry, pathSum_no_down]

theorem pathEntry_zero (μ y : R) (q : ℕ → R) (n : ℕ) (hn : 1 ≤ n) :
    pathEntry μ y q n 0 = 0 := by
  unfold pathEntry
  simp only [Nat.sub_zero]
  apply pathSum_zero_of_excess
  omega

theorem recurrence_unique (μ y : R) (q : ℕ → R) (M : ℕ → ℕ → R)
    (hdiag : ∀ n, 1 ≤ n → M n n = 1)
    (hzero : ∀ n, 1 ≤ n → M n 0 = 0)
    (hstep : ∀ n k, 2 ≤ n → 1 ≤ k → k < n →
      M n k = y*q k*M n (k+1) + μ^(n-k)*M (n-1) (k-1)) :
    ∀ n k, 1 ≤ n → 1 ≤ k → k ≤ n → M n k = pathEntry μ y q n k := by
  intro n
  induction n using Nat.strong_induction_on with
  | h n ih =>
    intro k hn hk hkn
    have hrow : ∀ d k, d = n-k → 1 ≤ k → k ≤ n → M n k = pathEntry μ y q n k := by
      intro d
      induction d using Nat.strong_induction_on with
      | h d ihd =>
        intro k hd hk hkn
        by_cases heq : k = n
        · subst k
          rw [hdiag n hn, pathEntry_diagonal]
        · have hlt : k < n := by omega
          have hn2 : 2 ≤ n := by omega
          rw [hstep n k hn2 hk hlt, pathEntry_step μ y q n k hn2 hk hlt]
          have hnext : M n (k+1) = pathEntry μ y q n (k+1) :=
            ihd (n-(k+1)) (by omega) (k+1) rfl (by omega) (by omega)
          rw [hnext]
          by_cases hk1 : k = 1
          · subst k
            have hprev : M (n-1) 0 = 0 := hzero (n-1) (by omega)
            have hp : pathEntry μ y q (n-1) 0 = 0 := pathEntry_zero μ y q (n-1) (by omega)
            simp only [Nat.sub_self, hprev, hp]
          · have hprev := ih (n-1) (by omega) (k-1) (by omega) (by omega) (by omega)
            rw [hprev]
    exact hrow (n-k) k rfl hk hkn

theorem row_formula_implies_paths (μ y : R) (q : ℕ → R) (M : ℕ → ℕ → R)
    (hdiag : ∀ n, 1 ≤ n → M n n = 1)
    (hzero : ∀ n, 1 ≤ n → M n 0 = 0)
    (hformula : ∀ n k, 2 ≤ n → 1 ≤ k → k ≤ n →
      M n k = rowSum μ y q (M (n-1)) n k) :
    ∀ n k, 1 ≤ n → 1 ≤ k → k ≤ n → M n k = pathEntry μ y q n k := by
  apply recurrence_unique μ y q M hdiag hzero
  intro n k hn hk hkn
  rw [hformula n k hn hk (by omega), row_recurrence μ y q (M (n-1)) n k (by omega)]
  rw [hformula n (k+1) hn (by omega) (by omega)]

def bidiagonalInverseEntry (z : R) (q : ℕ → R) (a b : ℕ) : R :=
  if b ≤ a then z^(a-b) * ∏ v ∈ Finset.Ico (b+1) (a+1), q v else 0

theorem inverseEntry_above (z : R) (q : ℕ → R) (a b : ℕ) (h : a < b) :
    bidiagonalInverseEntry z q a b = 0 := by
  simp [bidiagonalInverseEntry, Nat.not_le_of_gt h]

theorem inverseEntry_diagonal (z : R) (q : ℕ → R) (a : ℕ) :
    bidiagonalInverseEntry z q a a = 1 := by
  simp [bidiagonalInverseEntry]

theorem inverseEntry_step (z : R) (q : ℕ → R) (a b : ℕ) (h : b < a) :
    bidiagonalInverseEntry z q a b = z*q (b+1)*bidiagonalInverseEntry z q a (b+1) := by
  unfold bidiagonalInverseEntry
  rw [ite_eq_left (by omega : b ≤ a), ite_eq_left (by omega : b+1 ≤ a)]
  rw [Finset.prod_eq_prod_Ico_succ_bot (by omega : b+1 < a+1)]
  have he : a-b = (a-(b+1))+1 := by omega
  rw [he, pow_succ]
  ring

section Ring
variable {S : Type*} [CommRing S]

theorem inverseEntry_right_inverse (z : S) (q : ℕ → S) (a b : ℕ) :
    bidiagonalInverseEntry z q a b -
      bidiagonalInverseEntry z q a (b+1)*z*q (b+1) = if a = b then 1 else 0 := by
  by_cases hab : a = b
  · subst b
    rw [inverseEntry_diagonal, inverseEntry_above z q a (a+1) (by omega)]
    simp
  · by_cases hba : b < a
    · rw [inverseEntry_step z q a b hba]
      simp only [ite_eq_right hab]
      ring
    · have hlt : a < b := by omega
      rw [inverseEntry_above z q a b hlt, inverseEntry_above z q a (b+1) (by omega)]
      simp [hab]

noncomputable def inverseMatrix (N : ℕ) (z : S) (q : ℕ → S) : Matrix (Fin N) (Fin N) S :=
  fun a b => bidiagonalInverseEntry z q a.val b.val

noncomputable def bidiagonalMatrix (N : ℕ) (z : S) (q : ℕ → S) : Matrix (Fin N) (Fin N) S :=
  fun a b => (if a = b then 1 else 0) - (if a.val = b.val+1 then z*q a.val else 0)

theorem inverseMatrix_mul_bidiagonal (N : ℕ) (z : S) (q : ℕ → S) :
    inverseMatrix N z q * bidiagonalMatrix N z q = 1 := by
  classical
  ext a b
  simp only [Matrix.mul_apply, inverseMatrix, bidiagonalMatrix, mul_sub, Finset.sum_sub_distrib]
  have hdiag : (∑ x : Fin N, bidiagonalInverseEntry z q a.val x.val * (if x = b then 1 else 0)) =
      bidiagonalInverseEntry z q a.val b.val := by simp
  rw [hdiag]
  by_cases hb : b.val+1 < N
  · let nb : Fin N := ⟨b.val+1, hb⟩
    have hsum : (∑ x : Fin N, bidiagonalInverseEntry z q a.val x.val *
        (if x.val = b.val+1 then z*q x.val else 0)) =
        bidiagonalInverseEntry z q a.val (b.val+1) * z * q (b.val+1) := by
      calc
        (∑ x : Fin N, bidiagonalInverseEntry z q a.val x.val *
          (if x.val = b.val+1 then z*q x.val else 0)) =
          bidiagonalInverseEntry z q a.val nb.val *
          (if nb.val = b.val+1 then z*q nb.val else 0) := by
            apply Finset.sum_eq_single nb
            · intro x _ hne
              have hval : x.val ≠ b.val+1 := by
                intro he
                apply hne
                exact Fin.ext he
              simp [hval]
            · simp
        _ = _ := by simp [nb, mul_assoc]
    rw [hsum, inverseEntry_right_inverse]
    simp [Matrix.one_apply, Fin.ext_iff]
  · have hsum : (∑ x : Fin N, bidiagonalInverseEntry z q a.val x.val *
        (if x.val = b.val+1 then z*q x.val else 0)) = 0 := by
      apply Finset.sum_eq_zero
      intro x hx
      have hval : x.val ≠ b.val+1 := by have := x.isLt; omega
      simp [hval]
    rw [hsum, sub_zero]
    have hnext : bidiagonalInverseEntry z q a.val (b.val+1) = 0 :=
      inverseEntry_above z q a.val (b.val+1) (by have := a.isLt; omega)
    have hi := inverseEntry_right_inverse z q a.val b.val
    rw [hnext] at hi
    simp only [zero_mul, sub_zero] at hi
    rw [hi]
    simp [Matrix.one_apply, Fin.ext_iff]

end Ring

end GilmoreCrossingNesting
