import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Fintype.Prod
import Mathlib.Data.List.Perm.Basic
import Mathlib.Data.List.Sort
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


def openEndpoints : {u d : ℕ} → (p : Path u d) → Labels p → List ℕ
  | _, _, .empty, _ => []
  | _, _, @Path.up u d p, l => openEndpoints p l ++ [u+d]
  | _, _, @Path.down u d p _, l => (openEndpoints p l.1).eraseIdx l.2.val

theorem openEndpoints_length {u d : ℕ} (p : Path u d) (l : Labels p) :
    (openEndpoints p l).length = u-d := by
  induction p with
  | empty => simp [openEndpoints]
  | @up u d p ih =>
    change Labels p at l
    have hp := p.valid
    simp only [openEndpoints, List.length_append, List.length_singleton]
    rw [ih]
    omega
  | @down u d p h ih =>
    change Labels p × Fin (u-d) at l
    simp only [openEndpoints]
    have hl : l.2.val < (openEndpoints p l.1).length := by rw [ih]; exact l.2.isLt
    rw [List.length_eraseIdx_of_lt hl, ih]
    omega


def closedArcs : {u d : ℕ} → (p : Path u d) → Labels p → List (ℕ × ℕ)
  | _, _, .empty, _ => []
  | _, _, .up p, l => closedArcs p l
  | _, _, @Path.down u d p _, l =>
      ((openEndpoints p l.1).getD l.2.val 0, u+d) :: closedArcs p l.1

theorem closedArcs_length {u d : ℕ} (p : Path u d) (l : Labels p) :
    (closedArcs p l).length = d := by
  induction p with
  | empty => simp [closedArcs]
  | @up u d p ih =>
    change Labels p at l
    simp only [closedArcs]
    exact ih l
  | @down u d p h ih =>
    change Labels p × Fin (u-d) at l
    simp only [closedArcs, List.length_cons, ih]


def arcEndpoints (arcs : List (ℕ × ℕ)) : List ℕ := arcs.flatMap (fun e => [e.1, e.2])

theorem endpoints_partition {u d : ℕ} (p : Path u d) (l : Labels p) :
    ((openEndpoints p l) ++ arcEndpoints (closedArcs p l)).Perm (List.range (u+d)) := by
  induction p with
  | empty => simp [openEndpoints, closedArcs, arcEndpoints]
  | @up u d p ih =>
    change Labels p at l
    have hi := ih l
    simp only [openEndpoints, closedArcs]
    rw [show u+1+d = (u+d)+1 by omega, List.range_succ]
    have hp : ((openEndpoints p l ++ [u+d]) ++ arcEndpoints (closedArcs p l)).Perm
        ((openEndpoints p l ++ arcEndpoints (closedArcs p l)) ++ [u+d]) := by
      simp only [List.append_assoc]
      apply List.Perm.append_left
      exact List.perm_append_comm
    exact hp.trans (List.Perm.append_right _ hi)
  | @down u d p h ih =>
    change Labels p × Fin (u-d) at l
    have hi := ih l.1
    have hl : l.2.val < (openEndpoints p l.1).length := by
      rw [openEndpoints_length]
      exact l.2.isLt
    have he : (openEndpoints p l.1).getD l.2.val 0 = (openEndpoints p l.1)[l.2.val] := by
      rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hl]
      rfl
    simp only [openEndpoints, closedArcs, arcEndpoints, List.flatMap_cons]
    rw [show u+(d+1) = (u+d)+1 by omega, List.range_succ, he]
    let L := (openEndpoints p l.1).eraseIdx l.2.val
    let x := (openEndpoints p l.1)[l.2.val]
    let A := (closedArcs p l.1).flatMap (fun e => [e.1, e.2])
    let t := u+d
    change (L ++ ([x,t] ++ A)).Perm (List.range (u+d) ++ [t])
    have h1 : (L ++ ([x,t] ++ A)).Perm (x :: (L ++ (t :: A))) := by
      simp
    have h2 : (L ++ (t :: A)).Perm ((L ++ A) ++ [t]) := by
      simpa only [List.append_assoc, List.singleton_append] using
        (List.Perm.append_left L (List.perm_append_comm (l₁ := [t]) (l₂ := A)))
    have h3 : (x :: (L ++ A)).Perm (openEndpoints p l.1 ++ A) := by
      have hp := List.getElem_cons_eraseIdx_perm hl
      exact List.Perm.append_right A hp
    have h4 : ((openEndpoints p l.1 ++ A) ++ [t]).Perm (List.range (u+d) ++ [t]) := by
      exact List.Perm.append_right [t] hi
    exact h1.trans ((h2.cons x).trans ((List.Perm.append_right [t] h3).trans h4))


theorem openEndpoints_before {u d : ℕ} (p : Path u d) (l : Labels p) :
    ∀ x ∈ openEndpoints p l, x < u+d := by
  induction p with
  | empty => simp [openEndpoints]
  | @up u d p ih =>
    change Labels p at l
    intro x hx
    simp only [openEndpoints, List.mem_append, List.mem_singleton] at hx
    rcases hx with hx | rfl
    · have hh := ih l x hx
      omega
    · omega
  | @down u d p h ih =>
    change Labels p × Fin (u-d) at l
    intro x hx
    simp only [openEndpoints] at hx
    have hh := ih l.1 x (List.mem_of_mem_eraseIdx hx)
    omega

theorem closedArcs_ordered {u d : ℕ} (p : Path u d) (l : Labels p) :
    ∀ e ∈ closedArcs p l, e.1 < e.2 := by
  induction p with
  | empty => simp [closedArcs]
  | @up u d p ih =>
    change Labels p at l
    exact ih l
  | @down u d p h ih =>
    change Labels p × Fin (u-d) at l
    intro e he
    simp only [closedArcs, List.mem_cons] at he
    rcases he with he | he
    · subst e
      have hl : l.2.val < (openEndpoints p l.1).length := by
        rw [openEndpoints_length]
        exact l.2.isLt
      have hm : (openEndpoints p l.1).getD l.2.val 0 ∈ openEndpoints p l.1 := by
        rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hl]
        exact List.getElem_mem hl
      exact openEndpoints_before p l.1 _ hm
    · exact ih l.1 e he

theorem completePath_matching {u : ℕ} (p : Path u u) (l : Labels p) :
    (closedArcs p l).length = u ∧
      (arcEndpoints (closedArcs p l)).Perm (List.range (2*u)) ∧
      ∀ e ∈ closedArcs p l, e.1 < e.2 := by
  have hlen := openEndpoints_length p l
  have hempty : openEndpoints p l = [] := by
    apply List.eq_nil_of_length_eq_zero
    omega
  have hperm := endpoints_partition p l
  rw [hempty] at hperm
  simp only [List.nil_append] at hperm
  constructor
  · exact closedArcs_length p l
  · constructor
    · simpa [two_mul] using hperm
    · exact closedArcs_ordered p l


theorem openEndpoints_sorted {u d : ℕ} (p : Path u d) (l : Labels p) :
    (openEndpoints p l).Pairwise (· < ·) := by
  induction p with
  | empty => simp [openEndpoints]
  | @up u d p ih =>
    change Labels p at l
    simp only [openEndpoints, List.pairwise_append]
    refine ⟨ih l, by simp, ?_⟩
    intro x hx z hz
    simp only [List.mem_singleton] at hz
    subst z
    exact openEndpoints_before p l x hx
  | @down u d p h ih =>
    change Labels p × Fin (u-d) at l
    simp only [openEndpoints]
    exact (ih l.1).eraseIdx l.2.val


theorem closing_rank_order {u d : ℕ} (p : Path u d) (l : Labels p)
    (i j : Fin (u-d)) (hij : i < j) :
    (openEndpoints p l).getD i.val 0 < (openEndpoints p l).getD j.val 0 := by
  have hi : i.val < (openEndpoints p l).length := by rw [openEndpoints_length]; exact i.isLt
  have hj : j.val < (openEndpoints p l).length := by rw [openEndpoints_length]; exact j.isLt
  rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hi,
    List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hj]
  simp only [Option.getD_some]
  exact (List.pairwise_iff_getElem.mp (openEndpoints_sorted p l)) i.val j.val hi hj hij



private theorem filter_lt_getElem_length (xs : List ℕ) (i : ℕ) (hi : i < xs.length)
    (hs : xs.Pairwise (· < ·)) : (xs.filter (· < xs[i])).length = i := by
  induction xs generalizing i with
  | nil => simp at hi
  | cons x xs ih =>
    cases i with
    | zero =>
      simp only [List.getElem_cons_zero, List.filter_cons, lt_self_iff_false]
      have hx : ∀ y ∈ xs, x < y := (List.pairwise_cons.mp hs).1
      have hf : xs.filter (· < x) = [] := by
        apply List.filter_eq_nil_iff.mpr
        intro y hy
        simpa using Nat.not_lt_of_ge (Nat.le_of_lt (hx y hy))
      simp [hf]
    | succ i =>
      have hi' : i < xs.length := by simpa using hi
      have hs' := (List.pairwise_cons.mp hs).2
      have hx : x < xs[i] := (List.pairwise_cons.mp hs).1 _ (List.getElem_mem hi')
      simp only [List.getElem_cons_succ, List.filter_cons]
      simp [hx, ih i hi' hs']

private theorem filter_gt_getElem_length (xs : List ℕ) (i : ℕ) (hi : i < xs.length)
    (hs : xs.Pairwise (· < ·)) : (xs.filter (xs[i] < ·)).length = xs.length - i - 1 := by
  induction xs generalizing i with
  | nil => simp at hi
  | cons x xs ih =>
    cases i with
    | zero =>
      simp only [List.getElem_cons_zero, List.filter_cons, lt_self_iff_false]
      have hx : ∀ y ∈ xs, x < y := (List.pairwise_cons.mp hs).1
      have hf : xs.filter (x < ·) = xs := by
        apply List.filter_eq_self.mpr
        intro y hy
        simpa using hx y hy
      simp [hf]
    | succ i =>
      have hi' : i < xs.length := by simpa using hi
      have hs' := (List.pairwise_cons.mp hs).2
      have hx : ¬ xs[i] < x := Nat.not_lt_of_ge (Nat.le_of_lt ((List.pairwise_cons.mp hs).1 _ (List.getElem_mem hi')))
      simp only [List.getElem_cons_succ, List.filter_cons]
      simp [hx, ih i hi' hs']


theorem closing_rank_counts {u d : ℕ} (p : Path u d) (l : Labels p) (i : Fin (u-d)) :
    let xs := openEndpoints p l
    let x := xs.getD i.val 0
    (xs.filter (· < x)).length = i.val ∧
      (xs.filter (x < ·)).length = u-d-1-i.val := by
  have hi : i.val < (openEndpoints p l).length := by
    rw [openEndpoints_length]
    exact i.isLt
  simp only [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hi, Option.getD_some]
  constructor
  · exact filter_lt_getElem_length _ _ hi (openEndpoints_sorted p l)
  · rw [filter_gt_getElem_length _ _ hi (openEndpoints_sorted p l), openEndpoints_length]
    omega



-- Inserting a new opener gives a sorted predecessor state, with a valid
-- closing index whose removal recovers the original open endpoints.
theorem predecessor_insert (xs : List ℕ) (x : ℕ) (hx : x ∉ xs)
    (hs : xs.Pairwise (· ≤ ·)) (hnodup : xs.Nodup) :
    ∃ (ys : List ℕ) (i : ℕ) (hi : i < ys.length),
      ys.Pairwise (· ≤ ·) ∧ ys.Perm (x :: xs) ∧ ys[i] = x ∧ ys.eraseIdx i = xs := by
  let ys := xs.orderedInsert (· ≤ ·) x
  have hperm : ys.Perm (x :: xs) := List.perm_orderedInsert _ _ _
  have hsorted : ys.Pairwise (· ≤ ·) := hs.orderedInsert x xs
  have hmem : x ∈ ys := hperm.mem_iff.mpr (by simp)
  obtain ⟨i, hi, he⟩ := List.getElem_of_mem hmem
  have herase : ys.erase x = xs := by
    dsimp [ys]
    exact List.erase_orderedInsert (r := (· ≤ ·)) x xs
  have hn : ys.Nodup := by
    rw [hperm.nodup_iff]
    exact List.nodup_cons.mpr ⟨hx, hnodup⟩
  refine ⟨ys, i, hi, hsorted, hperm, he, ?_⟩
  rw [← hn.erase_getElem i hi, he, herase]


theorem decode_down_of_reachable {u d : ℕ} (p : Path u d) (l : Labels p) (h : d < u)
    (xs : List ℕ) (x : ℕ) (hx : x ∉ xs)
    (hs : xs.Pairwise (· ≤ ·)) (hnodup : xs.Nodup)
    (hp : (openEndpoints p l).Perm (x :: xs)) :
    ∃ labels : Labels (Path.down p h),
      openEndpoints (Path.down p h) labels = xs ∧
      closedArcs (Path.down p h) labels = (x, u+d) :: closedArcs p l := by
  obtain ⟨ys, i, hi, hys, hysp, hyse, hyserase⟩ := predecessor_insert xs x hx hs hnodup
  have hopen : openEndpoints p l = ys := by
    have hsopen : (openEndpoints p l).Pairwise (· ≤ ·) :=
      List.Pairwise.imp (fun h => Nat.le_of_lt h) (openEndpoints_sorted p l)
    exact List.Perm.eq_of_pairwise' hsopen hys (hp.trans hysp.symm)
  have hi' : i < u-d := by
    rw [← openEndpoints_length p l, hopen]
    exact hi
  refine ⟨(l, ⟨i, hi'⟩), ?_, ?_⟩
  · simpa [openEndpoints, hopen] using hyserase
  · simp only [closedArcs]
    rw [hopen, List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hi]
    simp [hyse]


theorem labels_injective_for_path {u d : ℕ} (p : Path u d) :
    Function.Injective (fun l : Labels p => (openEndpoints p l, closedArcs p l)) := by
  induction p with
  | empty =>
    intro a b h
    cases a
    cases b
    rfl
  | @up u d p ih =>
    intro a b h
    change Labels p at a b
    apply ih
    have h1 := congrArg Prod.fst h
    have h2 := congrArg Prod.snd h
    simp only [openEndpoints, closedArcs] at h1 h2
    have hopen : openEndpoints p a = openEndpoints p b := by simpa using h1
    exact Prod.ext hopen h2
  | @down u d p hvalid ih =>
    intro a b h
    change Labels p × Fin (u-d) at a b
    have ho := congrArg Prod.fst h
    have hc := congrArg Prod.snd h
    simp only [openEndpoints, closedArcs] at ho hc
    have hhead := (List.cons.inj hc).1
    have htail := (List.cons.inj hc).2
    have hselected := congrArg Prod.fst hhead
    have ha : a.2.val < (openEndpoints p a.1).length := by rw [openEndpoints_length]; exact a.2.isLt
    have hb : b.2.val < (openEndpoints p b.1).length := by rw [openEndpoints_length]; exact b.2.isLt
    have hgeta : (openEndpoints p a.1).getD a.2.val 0 = (openEndpoints p a.1)[a.2.val] := by
      rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem ha]
      rfl
    have hgetb : (openEndpoints p b.1).getD b.2.val 0 = (openEndpoints p b.1)[b.2.val] := by
      rw [List.getD_eq_getElem?_getD, List.getElem?_eq_getElem hb]
      rfl
    change (openEndpoints p a.1).getD a.2.val 0 = (openEndpoints p b.1).getD b.2.val 0 at hselected
    rw [hgeta, hgetb] at hselected
    have hperm : (openEndpoints p a.1).Perm (openEndpoints p b.1) := by
      have hpa := List.getElem_cons_eraseIdx_perm ha
      have hpb := List.getElem_cons_eraseIdx_perm hb
      apply hpa.symm.trans
      rw [hselected, ho]
      exact hpb
    have hopen : openEndpoints p a.1 = openEndpoints p b.1 := by
      apply List.Perm.eq_of_pairwise (fun x y _ _ hxy hyx => Nat.le_antisymm hxy hyx)
        ((openEndpoints_sorted p a.1).imp (fun h => Nat.le_of_lt h))
        ((openEndpoints_sorted p b.1).imp (fun h => Nat.le_of_lt h)) hperm
    have hnodup : (openEndpoints p a.1).Nodup :=
      List.nodup_iff_pairwise_ne.mpr ((openEndpoints_sorted p a.1).imp (fun h => Nat.ne_of_lt h))
    have hidx : a.2 = b.2 := by
      apply Fin.ext
      have hb' : b.2.val < (openEndpoints p a.1).length := by rw [hopen]; exact hb
      have hsel' : (openEndpoints p a.1)[a.2.val] = (openEndpoints p a.1)[b.2.val] := by
        simpa only [hopen] using hselected
      exact (hnodup.getElem_inj (hi := ha) (hj := hb')).mp hsel'
    have hprev : a.1 = b.1 := ih (Prod.ext hopen htail)
    exact Prod.ext hprev hidx


theorem closedArcs_before {u d : ℕ} (p : Path u d) (l : Labels p) :
    ∀ e ∈ closedArcs p l, e.2 < u+d := by
  induction p with
  | empty => simp [closedArcs]
  | @up u d p ih =>
    change Labels p at l
    intro e he
    have hh := ih l e he
    omega
  | @down u d p h ih =>
    change Labels p × Fin (u-d) at l
    intro e he
    simp only [closedArcs, List.mem_cons] at he
    rcases he with rfl | he
    · simp
    · have hh := ih l.1 e he
      omega


def closingPositions : {u d : ℕ} → Path u d → List ℕ
  | _, _, .empty => []
  | _, _, .up p => closingPositions p
  | _, _, @Path.down u d p _ => (u+d) :: closingPositions p

theorem closingPositions_eq {u d : ℕ} (p : Path u d) (l : Labels p) :
    (closedArcs p l).map Prod.snd = closingPositions p := by
  induction p with
  | empty => rfl
  | @up u d p ih =>
    change Labels p at l
    exact ih l
  | @down u d p h ih =>
    change Labels p × Fin (u-d) at l
    simp only [closedArcs, List.map_cons, closingPositions]
    rw [ih]

theorem closingPositions_before {u d : ℕ} (p : Path u d) :
    ∀ t ∈ closingPositions p, t < u+d := by
  induction p with
  | empty => simp [closingPositions]
  | @up u d p ih =>
    intro t ht
    have hh := ih t ht
    omega
  | @down u d p h ih =>
    intro t ht
    simp only [closingPositions, List.mem_cons] at ht
    rcases ht with rfl | ht
    · omega
    · have hh := ih t ht
      omega


theorem closingPositions_injective {u d : ℕ} : Function.Injective (@closingPositions u d) := by
  intro p
  induction p with
  | empty =>
    intro p' h
    cases p'
    rfl
  | @up u d p ih =>
    intro p' h
    cases p' with
    | up p' =>
      simp only [closingPositions] at h
      have hp := ih h
      subst p'
      rfl
    | @down v e p' hd =>
      simp only [closingPositions] at h
      have hm : (u+1+e) ∈ closingPositions p := by
        rw [h]
        simp
      have hb := closingPositions_before p (u+1+e) hm
      omega
  | @down u d p hv ih =>
    intro p' h
    cases p' with
    | @up v e p' =>
      simp only [closingPositions] at h
      have hm : (v+1+d) ∈ closingPositions p' := by
        rw [← h]
        simp
      have hb := closingPositions_before p' (v+1+d) hm
      omega
    | down p' hd =>
      simp only [closingPositions, List.cons.injEq] at h
      have hp := ih h.2
      subst p'
      rfl


def DecoratedPath (u d : ℕ) := Σ p : Path u d, Labels p

def decodeState {u d : ℕ} (p : DecoratedPath u d) : List ℕ × List (ℕ × ℕ) :=
  (openEndpoints p.1 p.2, closedArcs p.1 p.2)

theorem decodeState_injective {u d : ℕ} : Function.Injective (@decodeState u d) := by
  rintro ⟨p, l⟩ ⟨p', l'⟩ h
  have hc := congrArg Prod.snd h
  change closedArcs p l = closedArcs p' l' at hc
  have hp : p = p' := by
    apply closingPositions_injective
    rw [← closingPositions_eq p l, ← closingPositions_eq p' l', hc]
  subst p'
  have hl : l = l' := labels_injective_for_path p h
  subst l'
  rfl


def decodeMatching {u : ℕ} (p : DecoratedPath u u) : List (ℕ × ℕ) := closedArcs p.1 p.2

theorem decodeMatching_injective {u : ℕ} : Function.Injective (@decodeMatching u) := by
  intro p q h
  apply decodeState_injective
  apply Prod.ext
  · have hp : openEndpoints p.1 p.2 = [] := by
      apply List.eq_nil_of_length_eq_zero
      rw [openEndpoints_length]
      omega
    have hq : openEndpoints q.1 q.2 = [] := by
      apply List.eq_nil_of_length_eq_zero
      rw [openEndpoints_length]
      omega
    change openEndpoints p.1 p.2 = openEndpoints q.1 q.2
    rw [hp, hq]
  · exact h


theorem closedArcs_sorted {u d : ℕ} (p : Path u d) (l : Labels p) :
    (closedArcs p l).Pairwise (fun a b => b.2 < a.2) := by
  induction p with
  | empty => simp [closedArcs]
  | @up u d p ih =>
    change Labels p at l
    exact ih l
  | @down u d p h ih =>
    change Labels p × Fin (u-d) at l
    simp only [closedArcs, List.pairwise_cons]
    constructor
    · intro e he
      exact closedArcs_before p l.1 e he
    · exact ih l.1


theorem decodeMatching_injective_up_to_perm {u : ℕ} (p q : DecoratedPath u u)
    (h : (decodeMatching p).Perm (decodeMatching q)) : p = q := by
  apply decodeMatching_injective
  apply List.Perm.eq_of_pairwise (le := fun a b : ℕ × ℕ => b.2 < a.2 ∨ (a.2 = b.2 ∧ a.1 ≤ b.1))
    (fun a b _ _ hab hba => by
      rcases hab with hab | ⟨h2, h1⟩ <;> rcases hba with hba | ⟨h2', h1'⟩
      · omega
      · omega
      · omega
      · apply Prod.ext <;> omega)
    ((closedArcs_sorted p.1 p.2).imp (fun h => Or.inl h))
    ((closedArcs_sorted q.1 q.2).imp (fun h => Or.inl h)) h


section Ring
variable {S : Type*} [CommRing S]


theorem remove_last_closed (t : ℕ) (opens : List ℕ) (arcs : List (ℕ × ℕ))
    (hpart : (opens ++ arcEndpoints arcs).Perm (List.range (t+1)))
    (hord : ∀ e ∈ arcs, e.1 < e.2) (hnot : t ∉ opens) :
    ∃ (x : ℕ) (rest : List (ℕ × ℕ)),
      arcs.Perm ((x,t)::rest) ∧ x < t ∧
      ((x::opens) ++ arcEndpoints rest).Perm (List.range t) := by
  have ht : t ∈ arcEndpoints arcs := by
    have hm : t ∈ opens ++ arcEndpoints arcs := hpart.mem_iff.mpr (by simp)
    exact (List.mem_append.mp hm).resolve_left hnot
  obtain ⟨e, he, het⟩ := List.mem_flatMap.mp ht
  have heord := hord e he
  have hebound : e.2 < t+1 := by
    have hem : e.2 ∈ opens ++ arcEndpoints arcs := by
      apply List.mem_append.mpr
      right
      apply List.mem_flatMap.mpr
      exact ⟨e, he, by simp⟩
    simpa using hpart.mem_iff.mp hem
  have he2 : e.2 = t := by
    simp only [List.mem_cons, List.not_mem_nil, or_false] at het
    rcases het with h | h
    · omega
    · exact h.symm
  have he1 : e.1 < t := by omega
  refine ⟨e.1, arcs.erase e, ?_, he1, ?_⟩
  · simpa [← he2, Prod.eta] using List.perm_cons_erase he
  · have hp := (List.perm_cons_erase he).flatMap (f := fun e : ℕ × ℕ => [e.1,e.2]) (fun _ _ => List.Perm.refl _)
    change (arcEndpoints arcs).Perm ([e.1,e.2] ++ arcEndpoints (arcs.erase e)) at hp
    have hfull := (hp.append_left opens).symm.trans hpart
    rw [List.range_succ] at hfull
    have hrearr : (e.2 :: ((e.1::opens) ++ arcEndpoints (arcs.erase e))).Perm
        (opens ++ ([e.1,e.2] ++ arcEndpoints (arcs.erase e))) := by
      have h₁ : (opens ++ e.1 :: e.2 :: arcEndpoints (arcs.erase e)).Perm
          (e.1 :: opens ++ e.2 :: arcEndpoints (arcs.erase e)) := List.perm_middle
      have h₂ : (e.1 :: opens ++ e.2 :: arcEndpoints (arcs.erase e)).Perm
          (e.1 :: e.2 :: opens ++ arcEndpoints (arcs.erase e)) :=
        (List.perm_middle (a := e.2)).cons e.1
      exact (h₁.trans (h₂.trans (List.Perm.swap e.2 e.1 _))).symm
    have hrange : (List.range t ++ [t]).Perm (e.2 :: List.range t) := by
      simpa only [he2, List.append_nil] using
        (List.perm_middle (a := t) (l₁ := List.range t) (l₂ := []))
    have h := (hrearr.trans (hfull.trans hrange)).cons_inv
    exact h


theorem remove_last_open (t : ℕ) (opens : List ℕ) (arcs : List (ℕ × ℕ))
    (hpart : (opens ++ arcEndpoints arcs).Perm (List.range (t+1)))
    (hs : opens.Pairwise (· < ·)) (ht : t ∈ opens) :
    ∃ rest, opens = rest ++ [t] ∧
      (rest ++ arcEndpoints arcs).Perm (List.range t) := by
  obtain ⟨pre, post, heq⟩ := List.append_of_mem ht
  have hpost : post = [] := by
    cases post with
    | nil => rfl
    | cons y ys =>
      have hsort : t < y := by
        have hp : (t :: y :: ys).Pairwise (· < ·) := by
          rw [heq, List.pairwise_append] at hs
          exact hs.2.1
        exact (List.pairwise_cons.mp hp).1 y (by simp)
      have hy : y ∈ opens ++ arcEndpoints arcs := by
        apply List.mem_append.mpr
        left
        rw [heq]
        simp
      have hybound : y < t+1 := by simpa using hpart.mem_iff.mp hy
      omega
  refine ⟨pre, ?_, ?_⟩
  · simpa [hpost] using heq
  · rw [heq, hpost] at hpart
    simp only [List.range_succ] at hpart
    have hleft : (t :: (pre ++ arcEndpoints arcs)).Perm
        ((pre ++ [t]) ++ arcEndpoints arcs) := by
      simpa [List.append_assoc] using
        (List.perm_middle (a := t) (l₁ := pre) (l₂ := arcEndpoints arcs)).symm
    have hright : (List.range t ++ [t]).Perm (t :: List.range t) := by
      simpa only [List.append_nil] using
        (List.perm_middle (a := t) (l₁ := List.range t) (l₂ := []))
    exact (hleft.trans (hpart.trans hright)).cons_inv


theorem sorted_nodup_lt (xs : List ℕ) (hs : xs.Pairwise (· ≤ ·)) (hn : xs.Nodup) :
    xs.Pairwise (· < ·) := by
  rw [List.pairwise_iff_getElem] at hs ⊢
  intro i j hi hj hij
  have hne : xs[i] ≠ xs[j] := by
    intro he
    have := hn.getElem_inj.mp he
    omega
  have hle := hs i j hi hj hij
  omega

theorem state_surjective (u d : ℕ) (opens : List ℕ) (arcs : List (ℕ × ℕ))
    (hdu : d ≤ u) (hlen : opens.length = u-d) (hal : arcs.length = d)
    (hs : opens.Pairwise (· < ·))
    (hpart : (opens ++ arcEndpoints arcs).Perm (List.range (u+d)))
    (hord : ∀ e ∈ arcs, e.1 < e.2) :
    ∃ p : Path u d, ∃ l : Labels p,
      openEndpoints p l = opens ∧ (closedArcs p l).Perm arcs := by
  have hmain : ∀ n : ℕ, ∀ u d : ℕ, u+d=n → ∀ (opens : List ℕ) (arcs : List (ℕ × ℕ)),
      d ≤ u → opens.length = u-d → arcs.length = d → opens.Pairwise (· < ·) →
      (opens ++ arcEndpoints arcs).Perm (List.range (u+d)) →
      (∀ e ∈ arcs, e.1 < e.2) →
      ∃ p : Path u d, ∃ l : Labels p, openEndpoints p l = opens ∧ (closedArcs p l).Perm arcs := by
    intro n
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro u d hun opens arcs hdu hlen hal hs hpart hord
      cases n with
      | zero =>
        have hu : u = 0 := by omega
        have hd : d = 0 := by omega
        have ho : opens = [] := List.eq_nil_of_length_eq_zero (by omega)
        have ha : arcs = [] := List.eq_nil_of_length_eq_zero (by omega)
        cases u with
        | succ u => omega
        | zero =>
          cases d with
          | succ d => omega
          | zero =>
            subst opens
            subst arcs
            exact ⟨Path.empty, PUnit.unit, rfl, List.Perm.refl _⟩
      | succ t =>
        have htime : u+d=t+1 := by omega
        have hpart' : (opens ++ arcEndpoints arcs).Perm (List.range (t+1)) := by simpa [htime] using hpart
        by_cases ht : t ∈ opens
        · obtain ⟨pre, hopen, hprev⟩ := remove_last_open t opens arcs hpart' hs ht
          cases u with
          | zero => omega
          | succ u =>
            have hdprev : d ≤ u := by rw [hopen] at hlen; simp at hlen; omega
            have hlenprev : pre.length = u-d := by rw [hopen] at hlen; simp at hlen; omega
            have hspre : pre.Pairwise (· < ·) := by
              rw [hopen, List.pairwise_append] at hs
              exact hs.1
            have hsum : u+d=t := by omega
            have hprev' : (pre ++ arcEndpoints arcs).Perm (List.range (u+d)) := by simpa [hsum] using hprev
            obtain ⟨p, l, hl, ha⟩ := ih t (by omega) u d hsum pre arcs hdprev hlenprev hal hspre hprev' hord
            refine ⟨Path.up p, l, ?_, ?_⟩
            · simp only [openEndpoints, hl, hopen, hsum]
            · simpa [closedArcs] using ha
        · obtain ⟨x, rest, harcs, hxlt, hprev⟩ := remove_last_closed t opens arcs hpart' hord ht
          cases d with
          | zero => have := harcs.length_eq; simp [hal] at this
          | succ d =>
            have hduprev : d < u := by omega
            have hsum : u+d=t := by omega
            have hnodupall : ((x::opens) ++ arcEndpoints rest).Nodup :=
              hprev.nodup_iff.mpr List.nodup_range
            have hncons : (x::opens).Nodup := hnodupall.of_append_left
            have hxnot : x ∉ opens := (List.nodup_cons.mp hncons).1
            have hnopen : opens.Nodup := (List.nodup_cons.mp hncons).2
            have hsle : opens.Pairwise (· ≤ ·) := List.Pairwise.imp (fun h => Nat.le_of_lt h) hs
            obtain ⟨ys, i, hi, hys, hysp, hyse, hyserase⟩ := predecessor_insert opens x hxnot hsle hnopen
            have hnys : ys.Nodup := hysp.nodup_iff.mpr hncons
            have hslt : ys.Pairwise (· < ·) := sorted_nodup_lt ys hys hnys
            have hlenprev : ys.length = u-d := by
              have hh := hysp.length_eq
              simp only [List.length_cons] at hh
              omega
            have halprev : rest.length = d := by
              have hh := harcs.length_eq
              simp only [List.length_cons] at hh
              omega
            have hprev' : (ys ++ arcEndpoints rest).Perm (List.range (u+d)) := by
              have hp := (hysp.append_right (arcEndpoints rest)).trans hprev
              simpa [hsum] using hp
            have hordprev : ∀ e ∈ rest, e.1 < e.2 := by
              intro e he
              apply hord e
              exact harcs.mem_iff.mpr (by simp [he])
            obtain ⟨p, l, hl, ha⟩ := ih t (by omega) u d hsum ys rest (by omega)
              hlenprev halprev hslt hprev' hordprev
            have hp : (openEndpoints p l).Perm (x::opens) := by rw [hl]; exact hysp
            obtain ⟨labels, hopen, hclosed⟩ := decode_down_of_reachable p l hduprev opens x
              hxnot hsle hnopen hp
            refine ⟨Path.down p hduprev, labels, hopen, ?_⟩
            rw [hclosed]
            exact (ha.cons (x,u+d)).trans (by simpa [hsum] using harcs.symm)
  exact hmain (u+d) u d rfl opens arcs hdu hlen hal hs hpart hord


theorem arcEndpoints_length (arcs : List (ℕ × ℕ)) :
    (arcEndpoints arcs).length = 2 * arcs.length := by
  induction arcs with
  | nil => rfl
  | cons e arcs ih => simp [arcEndpoints, List.flatMap_cons] at ih ⊢; omega

theorem decodeMatching_surjective {u : ℕ} (arcs : List (ℕ × ℕ))
    (hpart : (arcEndpoints arcs).Perm (List.range (2*u)))
    (hord : ∀ e ∈ arcs, e.1 < e.2) :
    ∃ p : DecoratedPath u u, (decodeMatching p).Perm arcs := by
  have hal : arcs.length = u := by
    have hh := hpart.length_eq
    rw [arcEndpoints_length, List.length_range] at hh
    omega
  have hp : ([] ++ arcEndpoints arcs).Perm (List.range (u+u)) := by simpa [two_mul] using hpart
  obtain ⟨p, l, ho, ha⟩ := state_surjective u u [] arcs (by omega) (by simp) hal (by simp) hp hord
  exact ⟨⟨p,l⟩, ha⟩


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
