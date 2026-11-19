import Mathlib.Data.Fintype.BigOperators
import Mathlib.Tactic.FinCases
import Lean.Elab.Tactic.Omega

namespace Haralambis

def nextAxis (i : Fin 3) : Fin 3 := i+1
def prevAxis (i : Fin 3) : Fin 3 := i+2

@[simp] theorem next_zero : nextAxis 0=1 := rfl
@[simp] theorem next_one : nextAxis 1=2 := rfl
@[simp] theorem next_two : nextAxis 2=0 := rfl
@[simp] theorem prev_zero : prevAxis 0=2 := rfl
@[simp] theorem prev_one : prevAxis 1=0 := rfl
@[simp] theorem prev_two : prevAxis 2=1 := rfl
@[simp] theorem next_prev (i : Fin 3) : nextAxis (prevAxis i)=i := by fin_cases i <;> rfl
@[simp] theorem prev_next (i : Fin 3) : prevAxis (nextAxis i)=i := by fin_cases i <;> rfl
@[simp] theorem next_next (i : Fin 3) : nextAxis (nextAxis i)=prevAxis i := by fin_cases i <;> rfl
@[simp] theorem prev_prev (i : Fin 3) : prevAxis (prevAxis i)=nextAxis i := by fin_cases i <;> rfl
theorem next_ne_prev (i : Fin 3) : nextAxis i ≠ prevAxis i := by fin_cases i <;> decide
@[simp] theorem fin_three_mk_two (h : 2 < 3) : (⟨2,h⟩ : Fin 3) = 2 := rfl

def windowLength (d : Fin 3 → ℕ) : ℕ := d 0+d 1+d 2
def edgeLength (d : Fin 3 → ℕ) (i : Fin 3) : ℕ := d (nextAxis i)+d (prevAxis i)
abbrev SurfaceEdge (d : Fin 3 → ℕ) := Σ i : Fin 3, Fin (edgeLength d i)
abbrev SurfaceFace (d : Fin 3 → ℕ) := Σ k : Fin 3, Fin (d k)

instance (d : Fin 3 → ℕ) : Fintype (SurfaceEdge d) := inferInstanceAs (Fintype (Σ i, Fin (edgeLength d i)))
instance (d : Fin 3 → ℕ) : Fintype (SurfaceFace d) := inferInstanceAs (Fintype (Σ k, Fin (d k)))
instance (d : Fin 3 → ℕ) : DecidableEq (SurfaceEdge d) := inferInstanceAs (DecidableEq (Σ i, Fin (edgeLength d i)))
instance (d : Fin 3 → ℕ) : DecidableEq (SurfaceFace d) := inferInstanceAs (DecidableEq (Σ k, Fin (d k)))

theorem edge_window (d : Fin 3 → ℕ) (i : Fin 3) (t : ℕ) :
    t < edgeLength d i ↔ t+d i < windowLength d := by
  fin_cases i <;> simp only [Fin.mk_zero,Fin.mk_one,fin_three_mk_two,edgeLength,windowLength,next_zero,next_one,next_two,
    prev_zero,prev_one,prev_two] <;> omega

def positiveFace (d : Fin 3 → ℕ) (e : SurfaceEdge d) : SurfaceFace d :=
  if h : e.2.val < d (prevAxis e.1) then ⟨prevAxis e.1,⟨e.2.val,h⟩⟩
  else ⟨nextAxis e.1,⟨e.2.val-d (prevAxis e.1),by
    have hh := e.2.isLt
    dsimp [edgeLength] at hh
    omega⟩⟩

def negativeFace (d : Fin 3 → ℕ) (e : SurfaceEdge d) : SurfaceFace d :=
  if h : e.2.val < d (nextAxis e.1) then ⟨nextAxis e.1,⟨e.2.val,h⟩⟩
  else ⟨prevAxis e.1,⟨e.2.val-d (nextAxis e.1),by
    have hh := e.2.isLt
    dsimp [edgeLength] at hh
    omega⟩⟩

def facePositiveLower (d : Fin 3 → ℕ) (v : SurfaceFace d) : SurfaceEdge d :=
  ⟨nextAxis v.1,⟨v.2.val,by
    have hh := v.2.isLt
    simp only [edgeLength,next_next,prev_next]
    omega⟩⟩

def facePositiveUpper (d : Fin 3 → ℕ) (v : SurfaceFace d) : SurfaceEdge d :=
  ⟨prevAxis v.1,⟨v.2.val+d (nextAxis v.1),by
    have hh := v.2.isLt
    simp only [edgeLength,next_prev,prev_prev]
    omega⟩⟩

def faceNegativeUpper (d : Fin 3 → ℕ) (v : SurfaceFace d) : SurfaceEdge d :=
  ⟨nextAxis v.1,⟨v.2.val+d (prevAxis v.1),by
    have hh := v.2.isLt
    simp only [edgeLength,next_next,prev_next]
    omega⟩⟩

def faceNegativeLower (d : Fin 3 → ℕ) (v : SurfaceFace d) : SurfaceEdge d :=
  ⟨prevAxis v.1,⟨v.2.val,by
    have hh := v.2.isLt
    simp only [edgeLength,next_prev,prev_prev]
    omega⟩⟩

theorem face_positive_ne (d : Fin 3 → ℕ) (v : SurfaceFace d) :
    facePositiveLower d v ≠ facePositiveUpper d v := by
  intro hh
  have hx := congrArg Sigma.fst hh
  exact next_ne_prev v.1 hx

theorem face_negative_ne (d : Fin 3 → ℕ) (v : SurfaceFace d) :
    faceNegativeUpper d v ≠ faceNegativeLower d v := by
  intro hh
  have hx := congrArg Sigma.fst hh
  exact next_ne_prev v.1 hx

theorem sigma_fin_eq_iff {α : Type*} {n : α → ℕ} (x y : Σ i, Fin (n i)) :
    x=y ↔ x.1=y.1 ∧ x.2.val=y.2.val := by
  constructor
  · rintro rfl
    exact ⟨rfl,rfl⟩
  · rcases x with ⟨i,x⟩
    rcases y with ⟨j,y⟩
    rintro ⟨rfl,h⟩
    exact congrArg (fun z => Sigma.mk i z) (Fin.ext h)

@[simp] theorem positiveFace_facePositiveLower (d : Fin 3 → ℕ) (v : SurfaceFace d) :
    positiveFace d (facePositiveLower d v)=v := by
  rcases v with ⟨k,⟨t,ht⟩⟩
  unfold facePositiveLower positiveFace
  simp only [prev_next]
  rw [dif_pos ht]
  apply (sigma_fin_eq_iff _ _).mpr
  simp

@[simp] theorem positiveFace_facePositiveUpper (d : Fin 3 → ℕ) (v : SurfaceFace d) :
    positiveFace d (facePositiveUpper d v)=v := by
  rcases v with ⟨k,⟨t,ht⟩⟩
  unfold facePositiveUpper positiveFace
  simp only [prev_prev,next_prev]
  rw [dif_neg (show ¬ t+d (nextAxis k) < d (nextAxis k) by omega)]
  apply (sigma_fin_eq_iff _ _).mpr
  simp

@[simp] theorem negativeFace_faceNegativeUpper (d : Fin 3 → ℕ) (v : SurfaceFace d) :
    negativeFace d (faceNegativeUpper d v)=v := by
  rcases v with ⟨k,⟨t,ht⟩⟩
  unfold faceNegativeUpper negativeFace
  simp only [next_next,prev_next]
  rw [dif_neg (show ¬ t+d (prevAxis k) < d (prevAxis k) by omega)]
  apply (sigma_fin_eq_iff _ _).mpr
  simp

@[simp] theorem negativeFace_faceNegativeLower (d : Fin 3 → ℕ) (v : SurfaceFace d) :
    negativeFace d (faceNegativeLower d v)=v := by
  rcases v with ⟨k,⟨t,ht⟩⟩
  unfold faceNegativeLower negativeFace
  simp only [next_prev]
  rw [dif_pos ht]
  apply (sigma_fin_eq_iff _ _).mpr
  simp

theorem positiveFace_fiber (d : Fin 3 → ℕ) (v : SurfaceFace d) (e : SurfaceEdge d) :
    positiveFace d e=v ↔ e=facePositiveLower d v ∨ e=facePositiveUpper d v := by
  constructor
  · intro he
    rw [←he]
    unfold positiveFace
    split_ifs with h
    · left
      apply (sigma_fin_eq_iff _ _).mpr
      simp [facePositiveLower]
    · right
      apply (sigma_fin_eq_iff _ _).mpr
      simp only [facePositiveUpper,prev_next,next_next]
      exact ⟨True.intro,by omega⟩
  · rintro (rfl | rfl) <;> simp

theorem negativeFace_fiber (d : Fin 3 → ℕ) (v : SurfaceFace d) (e : SurfaceEdge d) :
    negativeFace d e=v ↔ e=faceNegativeUpper d v ∨ e=faceNegativeLower d v := by
  constructor
  · intro he
    rw [←he]
    unfold negativeFace
    split_ifs with h
    · right
      apply (sigma_fin_eq_iff _ _).mpr
      simp [faceNegativeLower]
    · left
      apply (sigma_fin_eq_iff _ _).mpr
      simp only [faceNegativeUpper,next_prev,prev_prev]
      exact ⟨True.intro,by omega⟩
  · rintro (rfl | rfl) <;> simp

theorem sum_positive_fiber (d : Fin 3 → ℕ) (v : SurfaceFace d) (f : SurfaceEdge d → ℤ) :
    (∑ e, if positiveFace d e=v then f e else 0) =
      f (facePositiveLower d v)+f (facePositiveUpper d v) := by
  classical
  have hset : Finset.univ.filter (fun e => positiveFace d e=v) =
      {facePositiveLower d v,facePositiveUpper d v} := by
    ext e
    simp only [Finset.mem_filter,Finset.mem_univ,true_and,Finset.mem_insert,
      Finset.mem_singleton,positiveFace_fiber]
  rw [←Finset.sum_filter,hset,Finset.sum_pair (face_positive_ne d v)]

theorem sum_negative_fiber (d : Fin 3 → ℕ) (v : SurfaceFace d) (f : SurfaceEdge d → ℤ) :
    (∑ e, if negativeFace d e=v then f e else 0) =
      f (faceNegativeUpper d v)+f (faceNegativeLower d v) := by
  classical
  have hset : Finset.univ.filter (fun e => negativeFace d e=v) =
      {faceNegativeUpper d v,faceNegativeLower d v} := by
    ext e
    simp only [Finset.mem_filter,Finset.mem_univ,true_and,Finset.mem_insert,
      Finset.mem_singleton,negativeFace_fiber]
  rw [←Finset.sum_filter,hset,Finset.sum_pair (face_negative_ne d v)]

end Haralambis
