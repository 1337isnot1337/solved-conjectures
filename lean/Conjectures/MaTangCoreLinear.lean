import Conjectures.MaTangCoreQuotient

/-!
# Ma–Tang's random subset-sum threshold conjecture

Literal matrix representation and uniqueness for binary linear maps.
-/
namespace MaTangCoreLinear
open MaTangCoreMatrix MaTangCoreIndexed MaTangCoreOccupancy MaTangCoreSubspace
open MaTangCoreRank MaTangCoreGenerator MaTangCoreQuotient

def LinearOn (n m : Nat) (f : List Bool → List Bool) : Prop :=
  (∀ u, u.length = n → (f u).length = m) ∧
  (∀ u v, u.length = n → v.length = n →
    f (xorVec u v) = xorVec (f u) (f v))

theorem xorVec_comm (u v : List Bool) : xorVec u v = xorVec v u := by
  induction u generalizing v with
  | nil => cases v <;> rfl
  | cons a u ih =>
    cases v with
    | nil => rfl
    | cons b v =>
      cases a <;> cases b <;> simp [xorVec,ih]

theorem xorVec_zero_left (v : List Bool) :
    xorVec (List.replicate v.length false) v = v := by
  rw [xorVec_comm,xorVec_zero_right]

theorem linear_zero {n m : Nat} {f : List Bool → List Bool} (h : LinearOn n m f) :
    f (List.replicate n false) = List.replicate m false := by
  have e := h.2 (List.replicate n false) (List.replicate n false) (by simp) (by simp)
  rw [xorVec_self,xorVec_self] at e
  simpa [h.1] using e

theorem matrix_linear (rows : List (List Bool)) (n : Nat) :
    LinearOn n rows.length (applyMatrix rows) := by
  refine ⟨fun u _ => applyMatrix_length rows u,?_⟩
  intro u v hu hv
  exact applyMatrix_xor rows u v (hu.trans hv.symm)

theorem linear_comp {n m l : Nat} {f g : List Bool → List Bool}
    (hf : LinearOn n m f) (hg : LinearOn m l g) :
    LinearOn n l (fun u => g (f u)) := by
  constructor
  · intro u hu
    exact hg.1 _ (hf.1 _ hu)
  · intro u v hu hv
    change g (f (xorVec u v)) = xorVec (g (f u)) (g (f v))
    rw [hf.2 u v hu hv,hg.2 _ _ (hf.1 _ hu) (hf.1 _ hv)]

def prependColumn : List Bool → List (List Bool) → List (List Bool)
  | a :: as, r :: rs => (a :: r) :: prependColumn as rs
  | _, _ => []

theorem prependColumn_length (a : List Bool) (rows : List (List Bool))
    (h : a.length = rows.length) : (prependColumn a rows).length = rows.length := by
  induction a generalizing rows with
  | nil => cases rows with
    | nil => rfl
    | cons r rs => simp at h
  | cons b bs ih =>
    cases rows with
    | nil => simp at h
    | cons r rs =>
      have he : bs.length = rs.length := by simpa using h
      simp [prependColumn,ih rs he]

theorem prependColumn_size (a : List Bool) (rows : List (List Bool)) (n : Nat)
    (h : RowsOfSize rows n) : RowsOfSize (prependColumn a rows) (n+1) := by
  induction a generalizing rows with
  | nil => simp [RowsOfSize,prependColumn]
  | cons b bs ih =>
    cases rows with
    | nil => simp [RowsOfSize,prependColumn]
    | cons r rs =>
      have hr : r.length = n := h r (by simp)
      have hrs : RowsOfSize rs n := fun t ht => h t (by simp [ht])
      intro t ht
      simp [prependColumn] at ht
      rcases ht with e | e
      · simp [e,hr]
      · exact ih rs hrs t e

theorem prependColumn_apply (a : List Bool) (rows : List (List Bool))
    (b : Bool) (u : List Bool) (h : a.length = rows.length) :
    applyMatrix (prependColumn a rows) (b::u) =
      if b then xorVec a (applyMatrix rows u) else applyMatrix rows u := by
  induction a generalizing rows with
  | nil =>
    cases rows with
    | nil => cases b <;> rfl
    | cons r rs => simp at h
  | cons c cs ih =>
    cases rows with
    | nil => simp at h
    | cons r rs =>
      have he : cs.length = rs.length := by simpa using h
      change rowDot (c::r) (b::u) :: applyMatrix (prependColumn cs rs) (b::u) =
        if b then xorVec (c::cs) (rowDot r u :: applyMatrix rs u)
        else rowDot r u :: applyMatrix rs u
      rw [ih rs he]
      cases b <;> simp [rowDot,xorVec]

/-- Every length-respecting binary linear map has a literal rectangular
matrix representation. -/
theorem linear_matrix_exists (n m : Nat) (f : List Bool → List Bool)
    (h : LinearOn n m f) :
    ∃ rows, rows.length = m ∧ RowsOfSize rows n ∧
      ∀ u, u.length = n → applyMatrix rows u = f u := by
  induction n generalizing f with
  | zero =>
    refine ⟨List.replicate m [],by simp,?_,?_⟩
    · intro r hr
      simp at hr
      simp [hr]
    · intro u hu
      have e : u = [] := List.length_eq_zero_iff.mp hu
      subst u
      simpa using (applyMatrix_zero_right (List.replicate m ([] : List Bool)) 0).trans
        (by simpa using (linear_zero h).symm)
  | succ n ih =>
    let g := fun u : List Bool => f (false :: u)
    have hg : LinearOn n m g := by
      constructor
      · intro u hu
        exact h.1 _ (by simp [hu])
      · intro u v hu hv
        exact h.2 (false::u) (false::v) (by simp [hu]) (by simp [hv])
    obtain ⟨rows,hlen,hsize,happ⟩ := ih g hg
    let a := f (true :: List.replicate n false)
    have ha : a.length = rows.length := by
      rw [hlen]; exact h.1 _ (by simp)
    refine ⟨prependColumn a rows,(prependColumn_length a rows ha).trans hlen,
      prependColumn_size a rows n hsize,?_⟩
    intro v hv
    cases v with
    | nil => simp at hv
    | cons b u =>
      have hu : u.length = n := by simpa using hv
      rw [prependColumn_apply a rows b u ha,happ u hu]
      cases b with
      | false => rfl
      | true =>
        have e := h.2 (true :: List.replicate n false) (false :: u)
          (by simp) (by simp [hu])
        have ex : xorVec (true :: List.replicate n false) (false :: u) = true :: u := by
          change true :: xorVec (List.replicate n false) u = true :: u
          rw [← hu,xorVec_zero_left]
        rw [ex] at e
        exact e.symm

theorem row_ext (n : Nat) (r s : List Bool) (hr : r.length = n) (hs : s.length = n)
    (h : ∀ u, u.length = n → rowDot r u = rowDot s u) : r = s := by
  induction n generalizing r s with
  | zero =>
    rw [List.length_eq_zero_iff.mp hr,List.length_eq_zero_iff.mp hs]
  | succ n ih =>
    cases r with
    | nil => simp at hr
    | cons a r =>
      cases s with
      | nil => simp at hs
      | cons b s =>
        have hr' : r.length = n := by simpa using hr
        have hs' : s.length = n := by simpa using hs
        have e := h (true :: List.replicate n false) (by simp)
        simp [rowDot,rowDot_zero_right] at e
        subst b
        congr 1
        apply ih r s hr' hs'
        intro u hu
        have e := h (false::u) (by simp [hu])
        simpa [rowDot] using e

/-- Equality on every input in the domain forces literal equality of
rectangular matrix rows. -/
theorem matrix_ext (n : Nat) (a b : List (List Bool))
    (ha : RowsOfSize a n) (hb : RowsOfSize b n)
    (h : ∀ u, u.length = n → applyMatrix a u = applyMatrix b u) : a = b := by
  induction a generalizing b with
  | nil =>
    cases b with
    | nil => rfl
    | cons r rs =>
      have e := h (List.replicate n false) (by simp)
      simp [applyMatrix] at e
  | cons r rs ih =>
    cases b with
    | nil =>
      have e := h (List.replicate n false) (by simp)
      simp [applyMatrix] at e
    | cons s ss =>
      have hr := ha r (by simp)
      have hs := hb s (by simp)
      have ht : r = s := by
        apply row_ext n r s hr hs
        intro u hu
        have e := h u hu
        exact (List.cons.inj e).1
      subst s
      congr 1
      apply ih ss (fun t ht => ha t (by simp [ht])) (fun t ht => hb t (by simp [ht]))
      intro u hu
      exact (List.cons.inj (h u hu)).2

end MaTangCoreLinear
