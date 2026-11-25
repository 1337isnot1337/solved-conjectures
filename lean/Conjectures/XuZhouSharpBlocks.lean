module

public import Conjectures.XuZhouSharpFamily
public import Conjectures.XuZhouScaledQuotient

@[expose] public section
namespace XuZhou
open Finset
open scoped BigOperators

def blockOffset (j : Fin 4) : ℕ := ![1,2,2,3] j
def blockSlot (j : Fin 4) : ℕ := ![0,0,1,0] j

theorem blockOffset_bounds (j : Fin 4) : 1≤blockOffset j ∧ blockOffset j≤3 := by
  fin_cases j <;> decide

theorem blockLabel_unique {i j : Fin 4}
    (h : blockOffset i=blockOffset j) (hs : blockSlot i=blockSlot j) : i=j := by
  fin_cases i <;> fin_cases j <;> simp_all [blockOffset,blockSlot]

def blockIndex {t : ℕ} (i : Fin t) (j : Fin 4) : SharpIndex t :=
  ⟨4*i.val+blockOffset j,by
    have h := i.isLt
    have hb := blockOffset_bounds j
    omega⟩

theorem blockIndex_mod {t : ℕ} (i : Fin t) (j : Fin 4) :
    (blockIndex i j).val%4=blockOffset j := by
  have h := blockOffset_bounds j
  change (4*i.val+blockOffset j)%4=blockOffset j
  omega

theorem blockSlot_in_range {t : ℕ} (i : Fin t) (j : Fin 4) :
    blockSlot j < sharpSize (blockIndex i j) := by
  have hd : doubled (blockIndex i j) ↔ blockOffset j=2 := by
    unfold doubled
    rw [blockIndex_mod]
  unfold sharpSize
  simp only [hd]
  fin_cases j <;> decide

def sharpBlockVertex {t : ℕ} (p : Fin t × Fin 4) : SharpVertex t :=
  ⟨blockIndex p.1 p.2,⟨blockSlot p.2,blockSlot_in_range p.1 p.2⟩⟩

theorem sharpBlockVertex_injective (t : ℕ) : Function.Injective (@sharpBlockVertex t) := by
  rintro ⟨i,c⟩ ⟨j,d⟩ h
  have hc := blockOffset_bounds c
  have hd := blockOffset_bounds d
  have hv := congrArg (fun v : SharpVertex t => v.1.val) h
  have hn := congrArg (fun v : SharpVertex t => v.2.val) h
  change 4*i.val+blockOffset c=4*j.val+blockOffset d at hv
  change blockSlot c=blockSlot d at hn
  have hij : i=j := Fin.ext (by omega)
  have hcd : c=d := blockLabel_unique (by have he := congrArg Fin.val hij; omega) hn
  exact Prod.ext hij hcd

def sharpBlockEmbedding (t : ℕ) : Fin t × Fin 4 ↪ SharpVertex t :=
  ⟨sharpBlockVertex,sharpBlockVertex_injective t⟩

theorem sharpBlock_no_cross_adj {t : ℕ} {i j : Fin t} (h : i≠j) (c d : Fin 4) :
    ¬(sharpGraph t).Adj (sharpBlockVertex (i,c)) (sharpBlockVertex (j,d)) := by
  intro he
  obtain ⟨_,h1,h2⟩ := he
  have hc := blockOffset_bounds c
  have hd := blockOffset_bounds d
  have hn : i.val≠j.val := fun hh => h (Fin.ext hh)
  change 4*i.val+blockOffset c ≤ 4*j.val+blockOffset d+1 at h1
  change 4*j.val+blockOffset d ≤ 4*i.val+blockOffset c+1 at h2
  omega

theorem sharpBlock_same_adj_iff {t : ℕ} (i : Fin t) (c d : Fin 4) :
    (sharpGraph t).Adj (sharpBlockVertex (i,c)) (sharpBlockVertex (i,d)) ↔
      c≠d ∧ blockOffset c≤blockOffset d+1 ∧ blockOffset d≤blockOffset c+1 := by
  have hne : sharpBlockVertex (i,c)≠sharpBlockVertex (i,d) ↔ c≠d := by
    constructor
    · exact fun h he => h (by rw [he])
    · exact fun h he => h (congrArg Prod.snd (sharpBlockVertex_injective t he))
  constructor
  · rintro ⟨hn,h1,h2⟩
    change 4*i.val+blockOffset c ≤ 4*i.val+blockOffset d+1 at h1
    change 4*i.val+blockOffset d ≤ 4*i.val+blockOffset c+1 at h2
    exact ⟨hne.mp hn,by omega,by omega⟩
  · rintro ⟨hn,h1,h2⟩
    refine ⟨hne.mpr hn,?_,?_⟩
    · change 4*i.val+blockOffset c ≤ 4*i.val+blockOffset d+1
      omega
    · change 4*i.val+blockOffset d ≤ 4*i.val+blockOffset c+1
      omega

end XuZhou
