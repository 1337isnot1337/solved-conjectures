import Conjectures.MaTangCoreIndexed

/-!
# Ma–Tang's random subset-sum threshold conjecture

The ordered-position obstruction is specialized to ordinary binary
matrices with an explicit spanning representation of their kernels.
This checks the deterministic implication, not the random choice or
dimension of the kernel generator matrix.
-/

namespace MaTangCoreMatrix

open MaTangCoreIndexed

def xorVec : List Bool → List Bool → List Bool
  | b :: bs, c :: cs => (b != c) :: xorVec bs cs
  | _, _ => []

theorem xorVec_length (u v : List Bool) (h : u.length = v.length) :
    (xorVec u v).length = u.length := by
  induction u generalizing v with
  | nil => rfl
  | cons b bs ih =>
    cases v with
    | nil => simp at h
    | cons c cs =>
      have ht : bs.length = cs.length := by simpa using h
      simp [xorVec,ih cs ht]

theorem xorVec_self (u : List Bool) :
    xorVec u u = List.replicate u.length false := by
  induction u with
  | nil => rfl
  | cons b bs ih => simp [xorVec,ih,List.replicate_succ]

theorem xorVec_cancel (u v : List Bool) (h : u.length = v.length) :
    xorVec u (xorVec u v) = v := by
  induction u generalizing v with
  | nil =>
    cases v with
    | nil => rfl
    | cons c cs => simp at h
  | cons b bs ih =>
    cases v with
    | nil => simp at h
    | cons c cs =>
      have ht : bs.length = cs.length := by simpa using h
      cases b <;> cases c <;> simp [xorVec,ih cs ht]

def maskBits (xs : List Raw) (a : Nat → Bool) : List Bool :=
  xs.map fun x => a x.1

theorem xorVec_mask (xs : List Raw) (u : List Bool) (a : Nat → Bool) :
    xorVec u (maskBits xs a) = flipBits xs u a := by
  induction xs generalizing u with
  | nil => cases u <;> rfl
  | cons x xs ih =>
    cases u with
    | nil => rfl
    | cons b bs =>
      change (b != a x.1) :: xorVec bs (maskBits xs a) =
        (b != a x.1) :: flipBits xs bs a
      rw [ih bs]

/-- Dot product over F2, with the first list encoding a matrix row. -/
def rowDot : List Bool → List Bool → Bool
  | b :: bs, c :: cs => (b && c) != rowDot bs cs
  | _, _ => false

theorem rowDot_xor (row u v : List Bool) (h : u.length = v.length) :
    rowDot row (xorVec u v) = (rowDot row u != rowDot row v) := by
  induction row generalizing u v with
  | nil => rfl
  | cons b bs ih =>
    cases u with
    | nil =>
      cases v with
      | nil => rfl
      | cons c cs => simp at h
    | cons c cs =>
      cases v with
      | nil => simp at h
      | cons d ds =>
        have ht : cs.length = ds.length := by simpa using h
        have he := ih cs ds ht
        cases b <;> cases c <;> cases d <;>
          simp [rowDot,xorVec,he] <;>
          cases (rowDot bs cs) <;> cases (rowDot bs ds) <;> rfl

def applyMatrix (rows : List (List Bool)) (u : List Bool) : List Bool :=
  rows.map fun row => rowDot row u

theorem applyMatrix_length (rows : List (List Bool)) (u : List Bool) :
    (applyMatrix rows u).length = rows.length := by simp [applyMatrix]

theorem applyMatrix_xor (rows : List (List Bool)) (u v : List Bool)
    (h : u.length = v.length) :
    applyMatrix rows (xorVec u v) =
      xorVec (applyMatrix rows u) (applyMatrix rows v) := by
  induction rows with
  | nil => rfl
  | cons r rs ih =>
    change rowDot r (xorVec u v) :: applyMatrix rs (xorVec u v) =
      (rowDot r u != rowDot r v) :: xorVec (applyMatrix rs u) (applyMatrix rs v)
    rw [rowDot_xor r u v h, ih]

/-- Column labels encode their binary entries from least significant bit
to most significant bit. Trailing zeros do not affect the dot product. -/
def encodedDot (b : Nat) : List Bool → Bool
  | [] => false
  | t :: ts => ((b % 2 == 1) && t) != encodedDot (b / 2) ts

theorem encodedDot_zero (t : List Bool) : encodedDot 0 t = false := by
  induction t with
  | nil => rfl
  | cons a ts ih => simp [encodedDot,ih]

def kernelVector (xs : List Raw) (t : List Bool) : List Bool :=
  maskBits xs (fun b => encodedDot b t)

/-- Linearity of the actual binary matrix turns equality of two
first-coordinate values into a kernel vector. The given column encoding
of kernel generators then supplies the required fiber mask. -/
theorem matrix_fiber_type_representation (xs : List Raw) (rows : List (List Bool))
    (hker : ∀ w : List Bool, w.length = xs.length →
      applyMatrix rows w = List.replicate rows.length false →
      ∃ t : List Bool, w = kernelVector xs t)
    (u v : List Bool) (hu : u.length = xs.length) (hv : v.length = xs.length)
    (h : applyMatrix rows u = applyMatrix rows v) :
    ∃ a : Nat → Bool, a 0 = false ∧ v = flipBits xs u a := by
  have huv : u.length = v.length := hu.trans hv.symm
  have hw : (xorVec u v).length = xs.length := (xorVec_length u v huv).trans hu
  have hz : applyMatrix rows (xorVec u v) = List.replicate rows.length false := by
    rw [applyMatrix_xor rows u v huv, ← h, xorVec_self, applyMatrix_length]
  obtain ⟨t, ht⟩ := hker (xorVec u v) hw hz
  refine ⟨fun b => encodedDot b t, encodedDot_zero t, ?_⟩
  have he := congrArg (xorVec u) ht
  change xorVec u (xorVec u v) = xorVec u (maskBits xs (fun b => encodedDot b t)) at he
  rw [xorVec_cancel u v huv,xorVec_mask] at he
  exact he


/-- A missing pair in the actual codomain F2^m × F3, not a list of
incorrect length. The missing first coordinate is itself in the image. -/
theorem exists_missing_matrix_pair (xs : List Raw) (rows : List (List Bool))
    (h : ∀ d, d ≠ 0 → countType xs d ≠ 1)
    (hker : ∀ w : List Bool, w.length = xs.length →
      applyMatrix rows w = List.replicate rows.length false →
      ∃ t : List Bool, w = kernelVector xs t) :
    ∃ u : List Bool, u.length = xs.length ∧
      ∃ z : Int, 0 ≤ z ∧ z < 3 ∧
      ∀ v : List Bool, v.length = xs.length →
        applyMatrix rows v = applyMatrix rows u →
        sumBits xs v % 3 ≠ z := by
  obtain ⟨u,hu,hi⟩ := exists_ordered_constant_fiber xs h
  let z := (sumBits xs u + 1) % 3
  have hz0 : 0 ≤ z := by dsimp [z]; omega
  have hz3 : z < 3 := by dsimp [z]; omega
  refine ⟨u,hu,z,hz0,hz3,?_⟩
  intro v hv heq hs
  obtain ⟨a,ha,hva⟩ := matrix_fiber_type_representation xs rows hker u v hu hv heq.symm
  have he := hi a ha
  rw [← hva,hs] at he
  dsimp [z] at he
  omega

/-- Deterministic Ma–Tang obstruction for a literal binary matrix and a
ternary coefficient vector. The spanning hypothesis is the usual kernel
column representation; it is not inferred from occupancy alone. -/
theorem not_covers_of_matrix_kernel (xs : List Raw) (rows : List (List Bool))
    (h : ∀ d, d ≠ 0 → countType xs d ≠ 1)
    (hker : ∀ w : List Bool, w.length = xs.length →
      applyMatrix rows w = List.replicate rows.length false →
      ∃ t : List Bool, w = kernelVector xs t) :
    ¬ (∀ (b : List Bool), b.length = rows.length →
      ∀ (z : Int), 0 ≤ z → z < 3 →
      ∃ v : List Bool, v.length = xs.length ∧ applyMatrix rows v = b ∧ sumBits xs v % 3 = z) := by
  intro hc
  obtain ⟨u,hu,z,hz0,hz3,hm⟩ := exists_missing_matrix_pair xs rows h hker
  obtain ⟨v,hv,hb,hz⟩ := hc (applyMatrix rows u) (applyMatrix_length rows u) z hz0 hz3
  exact hm v hv hb hz

end MaTangCoreMatrix
