module

public import Conjectures.SobolewskiUlasExceptionBinaryAutomaton
public import Mathlib.Data.ZMod.Basic

@[expose] public section
namespace SobolewskiUlasException

theorem regular_tail {b : ℕ} {f : ℕ→ℤ} (h : IsRegular b f) :
    IsRegular b (fun n => f (n+1)) := by
  let K := kernelSpan b f
  have hK : K.FG := h
  let P := K ⊔ K.map recurrenceShift
  have hP : P.FG := hK.sup (hK.map recurrenceShift)
  apply Submodule.FG.of_le hP
  apply Submodule.span_le.mpr
  rintro u ⟨e,r,hr,rfl⟩
  let q := b^e
  by_cases hlt : r+1<q
  · have he : sectionMap q r (fun n => f (n+1))=sectionMap q (r+1) f := by
      funext n
      change f (q*n+r+1)=f (q*n+(r+1))
      rw [Nat.add_assoc]
    change sectionMap q r (fun n => f (n+1))∈P
    rw [he]
    exact (show K≤P from le_sup_left) (Submodule.subset_span ⟨e,r+1,hlt,rfl⟩)
  · have hq : r+1=q := by change r<q at hr; omega
    have hqpos : 0<q := by omega
    have hk : sectionMap q 0 f∈K := Submodule.subset_span ⟨e,0,hqpos,rfl⟩
    have h' : recurrenceShift (sectionMap q 0 f)∈K.map recurrenceShift := ⟨_,hk,rfl⟩
    have he : sectionMap q r (fun n => f (n+1))=recurrenceShift (sectionMap q 0 f) := by
      funext n
      change f (q*n+r+1)=f (q*(n+1)+0)
      rw [Nat.add_assoc,hq,Nat.mul_succ,Nat.add_zero]
    change sectionMap q r (fun n => f (n+1))∈P
    rw [he]
    exact (show K.map recurrenceShift≤P from le_sup_right) h'

theorem regular_sub {b : ℕ} {f g : ℕ→ℤ} (hf : IsRegular b f) (hg : IsRegular b g) :
    IsRegular b (f-g) := by
  let P := kernelSpan b f ⊔ kernelSpan b g
  have hP : P.FG := Submodule.FG.sup hf hg
  apply Submodule.FG.of_le hP
  apply Submodule.span_le.mpr
  rintro u ⟨e,r,hr,rfl⟩
  rw [map_sub]
  have h₁ : sectionMap (b^e) r f∈kernelSpan b f := Submodule.subset_span ⟨e,r,hr,rfl⟩
  have h₂ : sectionMap (b^e) r g∈kernelSpan b g := Submodule.subset_span ⟨e,r,hr,rfl⟩
  exact P.sub_mem ((show kernelSpan b f≤P from le_sup_left) h₁)
    ((show kernelSpan b g≤P from le_sup_right) h₂)

noncomputable def gapWord (k : ℕ) : ℤ :=
  (nthException (k+2) : ℤ)-(nthException (k+1) : ℤ)

theorem gapWord_values (k : ℕ) : 1≤gapWord k ∧ gapWord k≤12 := by
  have hb := nthException_gap_bounds (k+1)
  have hMono : nthException (k+1)≤nthException (k+2) :=
    nthException_strictMono.monotone (Nat.le_succ _)
  unfold gapWord
  rw [← Nat.cast_sub hMono]
  exact ⟨by exact_mod_cast hb.1,by exact_mod_cast hb.2⟩

theorem source_regular_implies_gap_regular {b : ℕ}
    (h : IsRegular b (fun k => (sourceLayerEnumeration k : ℤ))) :
    IsRegular b gapWord := by
  let f : ℕ→ℤ := fun k => (nthException (k+1) : ℤ)
  have he : scaleSequence 2 f=(fun k => (sourceLayerEnumeration k : ℤ)) := by
    funext k
    change 2*(nthException (k+1) : ℤ)=((2*nthException (k+1):ℕ):ℤ)
    rw [Nat.cast_mul]
    rfl
  have hs : IsRegular b (scaleSequence 2 f) := (congrArg (IsRegular b) he).mpr h
  have hf := (regular_scale_iff (b := b) (f := f) (c := 2) (by decide)).mp hs
  let g : ℕ→ℤ := fun k => f (k+1)
  have hg : IsRegular b g := regular_tail (b := b) (f := f) hf
  change IsRegular b (g-f)
  exact regular_sub (b := b) (f := g) (g := f) hg hf

end SobolewskiUlasException
