module
public import Mathlib.Data.Finset.Sort
public import Mathlib.Order.Fin.Basic
public import Mathlib.Data.Fintype.Powerset
public import Mathlib.Order.Hom.Set
public import Mathlib.Tactic

@[expose] public section
namespace NovelliThibon

open Classical
variable {k : ℕ}

/-- The cumulative number of boundaries at which a repeated letter is allowed. -/
def weakShift (W : Finset (Fin k)) (i : Fin (k+1)) : ℕ :=
  (W.filter fun j => j.val < i.val).card

theorem weakShift_zero (W : Finset (Fin k)) : weakShift W 0 = 0 := by simp [weakShift]

theorem weakShift_last (W : Finset (Fin k)) : weakShift W (Fin.last k) = W.card := by
  unfold weakShift
  rw [Finset.filter_true_of_mem (fun i _ => i.isLt)]

theorem weakShift_le_card (W : Finset (Fin k)) (i : Fin (k+1)) : weakShift W i ≤ W.card :=
  Finset.card_filter_le _ _

theorem weakShift_step (W : Finset (Fin k)) (i : Fin k) :
    weakShift W i.succ = weakShift W i.castSucc + if i∈W then 1 else 0 := by
  unfold weakShift
  by_cases hi : i∈W
  · have he : (W.filter fun j => j.val < i.succ.val) =
        insert i (W.filter fun j => j.val < i.castSucc.val) := by
      ext j
      simp only [Finset.mem_filter,Finset.mem_insert]
      constructor
      · rintro ⟨hm,hlt⟩
        have hh : j.val < i.val+1 := hlt
        by_cases hj : j.val=i.val
        · exact Or.inl (Fin.ext hj)
        · exact Or.inr ⟨hm,by change j.val < i.val; omega⟩
      · rintro (rfl|⟨hm,hlt⟩)
        · exact ⟨hi,Nat.lt_succ_self _⟩
        · exact ⟨hm,Nat.lt_succ_of_lt hlt⟩
    rw [he,Finset.card_insert_of_notMem,ite_eq_left hi]
    simp
  · have he : (W.filter fun j => j.val < i.succ.val) =
        W.filter fun j => j.val < i.castSucc.val := by
      apply Finset.filter_congr
      intro j hj
      have hne : j.val≠i.val := fun h => hi (Fin.ext h ▸ hj)
      change j.val < i.val+1 ↔ j.val < i.val
      omega
    rw [he,ite_eq_right hi,add_zero]

abbrev WeakBoundaryWord (W : Finset (Fin k)) (m : ℕ) :=
  {f : Fin (k+1) → Fin m // Monotone f ∧
    ∀ i : Fin k,i∉W → f i.castSucc < f i.succ}

abbrev StrictAlphabetWord (r m : ℕ) := {f : Fin r → Fin m // StrictMono f}

noncomputable def shiftWeakWord (W : Finset (Fin k)) (m : ℕ) :
    WeakBoundaryWord W m ≃ StrictAlphabetWord (k+1) (m+W.card) where
  toFun f := ⟨fun i => ⟨(f.val i).val+weakShift W i,
    Nat.add_lt_add_of_lt_of_le (f.val i).isLt (weakShift_le_card W i)⟩,by
      apply Fin.strictMono_iff_lt_succ.mpr
      intro i
      change (f.val i.castSucc).val+weakShift W i.castSucc <
        (f.val i.succ).val+weakShift W i.succ
      rw [weakShift_step]
      by_cases h : i∈W
      · have hle : (f.val i.castSucc).val≤(f.val i.succ).val := f.property.1 Fin.castSucc_lt_succ.le
        simp only [h,ite_true]
        omega
      · have hlt : (f.val i.castSucc).val < (f.val i.succ).val := f.property.2 i h
        simp only [h,ite_false]
        omega⟩
  invFun g := by
    let u (i : Fin (k+1)) := (g.val i).val-weakShift W i
    have hincr (i : Fin k) : (g.val i.castSucc).val < (g.val i.succ).val :=
      g.property Fin.castSucc_lt_succ
    have hl (i : Fin (k+1)) : weakShift W i≤(g.val i).val := by
      induction i using Fin.induction with
      | zero => simp [weakShift_zero]
      | succ i ih =>
        rw [weakShift_step]
        have h := hincr i
        split <;> omega
    have hm : Monotone u := by
      apply Fin.monotone_iff_le_succ.mpr
      intro i
      have h := hincr i
      simp only [u,weakShift_step]
      split <;> omega
    have hb (i : Fin (k+1)) : u i < m := by
      have hu := hm (Fin.le_last i)
      have hlst := (g.val (Fin.last k)).isLt
      have hlast : u (Fin.last k) = (g.val (Fin.last k)).val-W.card := by simp [u,weakShift_last]
      have hf := hl (Fin.last k)
      rw [weakShift_last] at hf
      omega
    refine ⟨fun i => ⟨u i,hb i⟩,hm,?_⟩
    intro i hi
    change u i.castSucc < u i.succ
    have h := hincr i
    have h₀ := hl i.castSucc
    simp only [u,weakShift_step,hi,ite_false,add_zero]
    omega
  left_inv f := by
    apply Subtype.ext
    funext i
    apply Fin.ext
    change (f.val i).val+weakShift W i-weakShift W i=(f.val i).val
    omega
  right_inv g := by
    apply Subtype.ext
    funext i
    apply Fin.ext
    change (g.val i).val-weakShift W i+weakShift W i=(g.val i).val
    have hl (i : Fin (k+1)) : weakShift W i≤(g.val i).val := by
      induction i using Fin.induction with
      | zero => simp [weakShift_zero]
      | succ i ih =>
        have h : (g.val i.castSucc).val < (g.val i.succ).val :=
          g.property Fin.castSucc_lt_succ
        rw [weakShift_step]
        split <;> omega
    have hlo := hl i
    omega

end NovelliThibon
