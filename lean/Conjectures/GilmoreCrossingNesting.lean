import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fintype.Prod
import Mathlib.Algebra.BigOperators.Fin
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

def Labels : {u d : ℕ} → Path u d → Type
  | _, _, .empty => PUnit
  | _, _, .up p => Labels p
  | _, _, @Path.down u d p _ => Labels p × Fin (u-d)

@[instance_reducible] noncomputable def labelsFintype : {u d : ℕ} → (p : Path u d) → Fintype (Labels p)
  | _, _, .empty => by dsimp [Labels]; exact inferInstance
  | _, _, .up p => labelsFintype p
  | _, _, @Path.down u d p _ => by
      letI := labelsFintype p
      dsimp [Labels]
      exact inferInstance

noncomputable def labelsWeight (r s μ y : R) : {u d : ℕ} → (p : Path u d) → Labels p → R
  | _, _, .empty, _ => 1
  | _, _, @Path.up u d p, l => labelsWeight r s μ y p l * μ^d
  | _, _, @Path.down u d p _, l =>
      labelsWeight r s μ y p l.1 * y * r^(u-d-1-l.2.val) * s^l.2.val


theorem labels_sum (r s μ y : R) {u d : ℕ} (p : Path u d) :
    letI := labelsFintype p
    ∑ l : Labels p, labelsWeight r s μ y p l = p.weight μ y (quantum r s) := by
  induction p with
  | empty => simp [Labels, labelsWeight, Path.weight]
  | @up u d p ih =>
    simp [Labels, labelsWeight, Path.weight, ← Finset.sum_mul, ih]
  | @down u d p h ih =>
    simp only [Labels, labelsWeight, Path.weight]
    let : Fintype (Labels p) := labelsFintype p
    rw [Fintype.sum_prod_type]
    simp_rw [mul_assoc, ← Finset.mul_sum]
    rw [← Finset.sum_mul, ih]
    congr 1
    unfold quantum
    congr 1
    exact Fin.sum_univ_eq_sum_range (fun j => r^(u-d-1-j) * s^j) (u-d)



noncomputable def labelledPathSum (r s μ y : R) (u d : ℕ) : R :=
  ∑ p ∈ paths u d, letI := labelsFintype p; ∑ l : Labels p, labelsWeight r s μ y p l

theorem labelledPathSum_eq_pathSum (r s μ y : R) (u d : ℕ) :
    labelledPathSum r s μ y u d = pathSum μ y (quantum r s) u d := by
  unfold labelledPathSum pathSum
  apply Finset.sum_congr rfl
  intro p hp
  exact labels_sum r s μ y p


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

noncomputable def shiftedBlock (N i : ℕ) (μ y : S) (q : ℕ → S) : Matrix (Fin N) (Fin N) S :=
  fun a b => if a.val ≤ i then (if a = b then 1 else 0)
    else if b.val ≤ i then 0
    else bidiagonalInverseEntry (μ^i*y) q (a.val-(i+1)) (b.val-(i+1))

theorem shiftedBlock_row_fixed (N i : ℕ) (μ y : S) (q : ℕ → S)
    (a b : Fin N) (h : a.val ≤ i) :
    shiftedBlock N i μ y q a b = if a = b then 1 else 0 := by
  simp [shiftedBlock, h]

theorem shiftedBlock_above (N i : ℕ) (μ y : S) (q : ℕ → S)
    (a b : Fin N) (h : a.val < b.val) : shiftedBlock N i μ y q a b = 0 := by
  have hne : a ≠ b := by intro he; have := congrArg Fin.val he; omega
  by_cases ha : a.val ≤ i
  · simp [shiftedBlock, ha, hne]
  · have hb : ¬ b.val ≤ i := by omega
    have ht : a.val-(i+1) < b.val-(i+1) := by omega
    simp [shiftedBlock, ha, hb, inverseEntry_above (μ^i*y) q _ _ ht]

theorem shiftedBlock_diagonal (N i : ℕ) (μ y : S) (q : ℕ → S) (a : Fin N) :
    shiftedBlock N i μ y q a a = 1 := by
  by_cases ha : a.val ≤ i
  · simp [shiftedBlock, ha]
  · simp [shiftedBlock, ha, inverseEntry_diagonal]

noncomputable def blockProduct (N : ℕ) (μ y : S) (q : ℕ → S) : ℕ → Matrix (Fin N) (Fin N) S
  | 0 => 1
  | i+1 => shiftedBlock N i μ y q * blockProduct N μ y q i

theorem blockProduct_row_step_fixed (N i : ℕ) (μ y : S) (q : ℕ → S)
    (a b : Fin N) (h : a.val ≤ i) :
    blockProduct N μ y q (i+1) a b = blockProduct N μ y q i a b := by
  rw [blockProduct]
  simp [Matrix.mul_apply, shiftedBlock, h]

theorem blockProduct_row_stable (N i : ℕ) (μ y : S) (q : ℕ → S)
    (a b : Fin N) (h : a.val ≤ i) :
    blockProduct N μ y q (i+1) a b = blockProduct N μ y q (a.val+1) a b := by
  induction i with
  | zero =>
    have ha : a.val = 0 := by omega
    simp [ha]
  | succ i ih =>
    by_cases hi : a.val ≤ i
    · rw [blockProduct_row_step_fixed N (i+1) μ y q a b (by omega), ih hi]
    · have he : a.val = i+1 := by omega
      simp [he]

theorem blockProduct_above (N i : ℕ) (μ y : S) (q : ℕ → S)
    (a b : Fin N) (h : a.val < b.val) : blockProduct N μ y q i a b = 0 := by
  induction i generalizing a b with
  | zero =>
    have hne : a ≠ b := by intro he; have := congrArg Fin.val he; omega
    simp [blockProduct, hne]
  | succ i ih =>
    rw [blockProduct, Matrix.mul_apply]
    apply Finset.sum_eq_zero
    intro x hx
    by_cases hax : a.val < x.val
    · rw [shiftedBlock_above N i μ y q a x hax, zero_mul]
    · have hxb : x.val < b.val := by omega
      rw [ih x b hxb, mul_zero]

theorem blockProduct_diagonal (N i : ℕ) (μ y : S) (q : ℕ → S) (a : Fin N) :
    blockProduct N μ y q i a a = 1 := by
  induction i with
  | zero => simp [blockProduct]
  | succ i ih =>
    rw [blockProduct, Matrix.mul_apply]
    calc
      (∑ x : Fin N, shiftedBlock N i μ y q a x * blockProduct N μ y q i x a) =
          shiftedBlock N i μ y q a a * blockProduct N μ y q i a a := by
        apply Finset.sum_eq_single a
        · intro x hx hne
          have hval : x.val ≠ a.val := by intro he; apply hne; exact Fin.ext he
          by_cases hax : a.val < x.val
          · rw [shiftedBlock_above N i μ y q a x hax, zero_mul]
          · have hxa : x.val < a.val := by omega
            rw [blockProduct_above N i μ y q x a hxa, mul_zero]
        · simp
      _ = 1 := by rw [shiftedBlock_diagonal, ih]; simp

theorem blockProduct_stable_step (N i : ℕ) (μ y : S) (q : ℕ → S) (h : N ≤ i) :
    blockProduct N μ y q (i+1) = blockProduct N μ y q i := by
  ext a b
  exact blockProduct_row_step_fixed N i μ y q a b (by have := a.isLt; omega)

theorem blockProduct_stable (N i : ℕ) (μ y : S) (q : ℕ → S) :
    blockProduct N μ y q (N+i) = blockProduct N μ y q N := by
  induction i with
  | zero => simp
  | succ i ih =>
    rw [show N+(i+1) = (N+i)+1 by omega,
      blockProduct_stable_step N (N+i) μ y q (by omega), ih]

theorem shiftedBlock_shift (N i : ℕ) (μ y : S) (q : ℕ → S) (a b : Fin N) :
    shiftedBlock (N+1) (i+1) μ y q a.succ b.succ = shiftedBlock N i μ (μ*y) q a b := by
  have hpow : μ^(i+1)*y = μ^i*(μ*y) := by rw [pow_succ]; ring
  have ha : (a.succ : Fin (N+1)).val ≤ i+1 ↔ a.val ≤ i := by simp
  have hb : (b.succ : Fin (N+1)).val ≤ i+1 ↔ b.val ≤ i := by simp
  have hsuba : (a.succ : Fin (N+1)).val - (i+1+1) = a.val-(i+1) := by simp
  have hsubb : (b.succ : Fin (N+1)).val - (i+1+1) = b.val-(i+1) := by simp
  simp only [shiftedBlock, ha, hb, Fin.succ_inj, hsuba, hsubb, hpow]

noncomputable def tailProduct (N : ℕ) (μ y : S) (q : ℕ → S) : ℕ → Matrix (Fin (N+1)) (Fin (N+1)) S
  | 0 => 1
  | i+1 => shiftedBlock (N+1) (i+1) μ y q * tailProduct N μ y q i

theorem shiftedBlock_succ_zero (N i : ℕ) (μ y : S) (q : ℕ → S) (a : Fin N) :
    shiftedBlock (N+1) (i+1) μ y q a.succ 0 = 0 := by
  simp [shiftedBlock, Fin.succ_ne_zero]

theorem tailProduct_shift (N i : ℕ) (μ y : S) (q : ℕ → S) (a b : Fin N) :
    tailProduct N μ y q i a.succ b.succ = blockProduct N μ (μ*y) q i a b := by
  induction i generalizing a b with
  | zero => simp [tailProduct, blockProduct, Matrix.one_apply, Fin.succ_inj]
  | succ i ih =>
    rw [tailProduct, blockProduct, Matrix.mul_apply, Matrix.mul_apply, Fin.sum_univ_succ]
    simp only [shiftedBlock_succ_zero, zero_mul, zero_add]
    apply Finset.sum_congr rfl
    intro x hx
    rw [shiftedBlock_shift, ih x b]

theorem blockProduct_split_head (N i : ℕ) (μ y : S) (q : ℕ → S) :
    blockProduct (N+1) μ y q (i+1) =
      tailProduct N μ y q i * shiftedBlock (N+1) 0 μ y q := by
  induction i with
  | zero => simp [blockProduct, tailProduct]
  | succ i ih =>
    rw [blockProduct, tailProduct, ih, Matrix.mul_assoc]

theorem shiftedBlock_zero_succ (N : ℕ) (μ y : S) (q : ℕ → S) (b : Fin N) :
    shiftedBlock (N+1) 0 μ y q 0 b.succ = 0 := by
  simp [shiftedBlock, Ne.symm (Fin.succ_ne_zero b)]

theorem shiftedBlock_zero_tail (N : ℕ) (μ y : S) (q : ℕ → S) (a b : Fin N) :
    shiftedBlock (N+1) 0 μ y q a.succ b.succ = bidiagonalInverseEntry y q a.val b.val := by
  simp [shiftedBlock]

theorem blockProduct_row_formula_scaled (N i : ℕ) (μ y : S) (q : ℕ → S) (a b : Fin N) :
    blockProduct (N+1) μ y q (i+1) a.succ b.succ =
      ∑ j : Fin N, blockProduct N μ (μ*y) q i a j * bidiagonalInverseEntry y q j.val b.val := by
  rw [blockProduct_split_head, Matrix.mul_apply, Fin.sum_univ_succ]
  simp only [shiftedBlock_zero_succ, mul_zero, zero_add]
  apply Finset.sum_congr rfl
  intro j hj
  rw [tailProduct_shift, shiftedBlock_zero_tail]

theorem inverseEntry_scale (z t : S) (q : ℕ → S) (a b : ℕ) :
    bidiagonalInverseEntry (t*z) q a b = t^(a-b) * bidiagonalInverseEntry z q a b := by
  unfold bidiagonalInverseEntry
  by_cases h : b ≤ a
  · simp only [h, ite_true, mul_pow]
    ring
  · simp [h]

theorem shiftedBlock_scale (N i : ℕ) (μ y t : S) (q : ℕ → S) (a b : Fin N) :
    shiftedBlock N i μ (t*y) q a b = t^(a.val-b.val) * shiftedBlock N i μ y q a b := by
  by_cases hab : a.val < b.val
  · rw [shiftedBlock_above _ _ _ _ _ _ _ hab, shiftedBlock_above _ _ _ _ _ _ _ hab, mul_zero]
  · by_cases ha : a.val ≤ i
    · rw [shiftedBlock_row_fixed N i μ (t*y) q a b ha, shiftedBlock_row_fixed N i μ y q a b ha]
      by_cases he : a = b
      · subst b; simp
      · simp [he]
    · by_cases hb : b.val ≤ i
      · simp [shiftedBlock, ha, hb]
      · have hsub : (a.val-(i+1))-(b.val-(i+1)) = a.val-b.val := by omega
        have hmul : μ^i*(t*y) = t*(μ^i*y) := by ring
        simp only [shiftedBlock, ha, hb, ite_false, hmul, inverseEntry_scale, hsub]

theorem blockProduct_scale (N i : ℕ) (μ y t : S) (q : ℕ → S) (a b : Fin N) :
    blockProduct N μ (t*y) q i a b = t^(a.val-b.val) * blockProduct N μ y q i a b := by
  induction i generalizing a b with
  | zero =>
    by_cases h : a = b
    · subst b; simp [blockProduct]
    · simp [blockProduct, h]
  | succ i ih =>
    rw [blockProduct, blockProduct, Matrix.mul_apply, Matrix.mul_apply, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro x hx
    rw [shiftedBlock_scale, ih]
    by_cases hax : a.val < x.val
    · rw [shiftedBlock_above N i μ y q a x hax]
      simp
    · by_cases hxb : x.val < b.val
      · rw [blockProduct_above N i μ y q x b hxb]
        simp
      · have hexp : (a.val-x.val) + (x.val-b.val) = a.val-b.val := by omega
        have hpow : t^(a.val-x.val)*t^(x.val-b.val) = t^(a.val-b.val) := by
          rw [← pow_add, hexp]
        calc
          t^(a.val-x.val) * shiftedBlock N i μ y q a x *
              (t^(x.val-b.val) * blockProduct N μ y q i x b) =
            (t^(a.val-x.val)*t^(x.val-b.val)) *
              (shiftedBlock N i μ y q a x * blockProduct N μ y q i x b) := by ring
          _ = _ := by rw [hpow]

noncomputable def matrixEntry (μ y : S) (q : ℕ → S) (n k : ℕ) : S :=
  if h : k ≤ n then blockProduct (n+1) μ y q (n+1) ⟨n, by omega⟩ ⟨k, by omega⟩ else 0

theorem matrixEntry_diagonal (μ y : S) (q : ℕ → S) (n : ℕ) : matrixEntry μ y q n n = 1 := by
  simp [matrixEntry, blockProduct_diagonal]

theorem shiftedBlock_column_zero (N i : ℕ) (μ y : S) (q : ℕ → S) (a : Fin N)
    (ha : a.val ≠ 0) : shiftedBlock N i μ y q a ⟨0, by have := a.isLt; omega⟩ = 0 := by
  by_cases h : a.val ≤ i
  · have hne : a ≠ (⟨0, by have := a.isLt; omega⟩ : Fin N) := by
      intro he
      have hv := congrArg Fin.val he
      simp only at hv
      exact ha hv
    simp [shiftedBlock, h, hne]
  · simp [shiftedBlock, h]

theorem blockProduct_column_zero (N i : ℕ) (μ y : S) (q : ℕ → S) (a : Fin N)
    (ha : a.val ≠ 0) : blockProduct N μ y q i a ⟨0, by have := a.isLt; omega⟩ = 0 := by
  induction i generalizing a with
  | zero =>
    have hne : a ≠ (⟨0, by have := a.isLt; omega⟩ : Fin N) := by
      intro he
      have hv := congrArg Fin.val he
      exact ha hv
    simp [blockProduct, hne]
  | succ i ih =>
    rw [blockProduct, Matrix.mul_apply]
    apply Finset.sum_eq_zero
    intro j hj
    by_cases hj0 : j.val = 0
    · have he : j = (⟨0, by have := a.isLt; omega⟩ : Fin N) := Fin.ext hj0
      rw [he, shiftedBlock_column_zero N i μ y q a ha, zero_mul]
    · rw [ih j hj0, mul_zero]

theorem matrixEntry_zero (μ y : S) (q : ℕ → S) (n : ℕ) (hn : 1 ≤ n) :
    matrixEntry μ y q n 0 = 0 := by
  simp only [matrixEntry, Nat.zero_le, dite_eq_left]
  exact blockProduct_column_zero (n+1) (n+1) μ y q ⟨n, by omega⟩ (by simp; omega)

theorem matrixEntry_row_fin (μ y : S) (q : ℕ → S) (n k : ℕ)
    (hn : 1 ≤ n) (hk : 1 ≤ k) (hkn : k ≤ n) :
    matrixEntry μ y q n k =
      ∑ j : Fin n, μ^((n-1)-j.val) * matrixEntry μ y q (n-1) j.val *
        bidiagonalInverseEntry y q j.val (k-1) := by
  let a : Fin n := ⟨n-1, by omega⟩
  let b : Fin n := ⟨k-1, by omega⟩
  have ha : a.succ = (⟨n, by omega⟩ : Fin (n+1)) := by apply Fin.ext; simp [a]; omega
  have hb : b.succ = (⟨k, by omega⟩ : Fin (n+1)) := by apply Fin.ext; simp [b]; omega
  unfold matrixEntry
  rw [dite_eq_left hkn, ← ha, ← hb, blockProduct_row_formula_scaled]
  apply Finset.sum_congr rfl
  intro j hj
  have hjle : j.val ≤ n-1 := by have := j.isLt; omega
  rw [dite_eq_left hjle, blockProduct_scale]
  cases n with
  | zero => omega
  | succ n => simp [a, b]

theorem matrixEntry_row_formula (μ y : S) (q : ℕ → S) (n k : ℕ)
    (hn : 2 ≤ n) (hk : 1 ≤ k) (hkn : k ≤ n) :
    matrixEntry μ y q n k = rowSum μ y q (matrixEntry μ y q (n-1)) n k := by
  rw [matrixEntry_row_fin μ y q n k (by omega) hk hkn]
  let f : ℕ → S := fun j => μ^((n-1)-j) * matrixEntry μ y q (n-1) j *
    bidiagonalInverseEntry y q j (k-1)
  change (∑ j : Fin n, f j.val) = rowSum μ y q (matrixEntry μ y q (n-1)) n k
  rw [Fin.sum_univ_eq_sum_range]
  have hsub : Finset.Icc (k-1) (n-1) ⊆ Finset.range n := by
    intro j hj
    have h := Finset.mem_Icc.mp hj
    simp only [Finset.mem_range]
    omega
  have hrestrict : (∑ j ∈ Finset.Icc (k-1) (n-1), f j) = ∑ j ∈ Finset.range n, f j := by
    apply Finset.sum_subset hsub
    intro j hj hjnot
    have hjn := Finset.mem_range.mp hj
    have hjk : j < k-1 := by
      simp only [Finset.mem_Icc, not_and_or] at hjnot
      omega
    simp [f, inverseEntry_above y q j (k-1) hjk]
  rw [← hrestrict]
  unfold rowSum
  apply Finset.sum_bij (fun j _ => j+1)
  · intro j hj
    simp only [Finset.mem_Icc] at hj ⊢
    omega
  · intro a ha b hb h
    omega
  · intro j hj
    have hj' := Finset.mem_Icc.mp hj
    refine ⟨j-1, ?_, by omega⟩
    simp only [Finset.mem_Icc]
    omega
  · intro j hj
    have hj' := Finset.mem_Icc.mp hj
    have hjk : k-1 ≤ j := hj'.1
    have he1 : n-(j+1) = n-1-j := by omega
    have he2 : j+1-k = j-(k-1) := by omega
    have he3 : k-1+1 = k := by omega
    have he4 : (j+1)-1 = j := by omega
    simp only [f, rowTerm, bidiagonalInverseEntry, hjk, ite_true, he1, he2, he3, he4]
    ring

theorem matrixEntry_eq_pathEntry (μ y : S) (q : ℕ → S) (n k : ℕ)
    (hn : 1 ≤ n) (hk : 1 ≤ k) (hkn : k ≤ n) :
    matrixEntry μ y q n k = pathEntry μ y q n k := by
  apply row_formula_implies_paths μ y q (matrixEntry μ y q)
  · intro n hn
    exact matrixEntry_diagonal μ y q n
  · exact matrixEntry_zero μ y q
  · exact matrixEntry_row_formula μ y q
  · exact hn
  · exact hk
  · exact hkn

theorem matrixEntry_eq_labelledPathSum (r s μ y : S) (n k : ℕ)
    (hn : 1 ≤ n) (hk : 1 ≤ k) (hkn : k ≤ n) :
    matrixEntry μ y (quantum r s) n k = labelledPathSum r s μ y (n-1) (n-k) := by
  rw [matrixEntry_eq_pathEntry μ y (quantum r s) n k hn hk hkn,
    labelledPathSum_eq_pathSum]
  rfl

end Ring

end GilmoreCrossingNesting
