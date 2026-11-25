module
public import Conjectures.NovelliThibonCompleteDeletion

@[expose] public section
namespace NovelliThibon

open Classical
variable {A R : Type*} [DecidableEq A] [CommRing R]

noncomputable def completeOn (s : Finset A) (x : A → R) (d : ℤ) : R :=
  if d < 0 then 0 else completeSum (fun i : ↥s => x i.val) d.toNat

theorem completeOn_zero (s : Finset A) (x : A → R) : completeOn s x 0=1 := by
  simp [completeOn,completeSum_zero]

theorem completeOn_neg (s : Finset A) (x : A → R) {d : ℤ} (hd : d < 0) : completeOn s x d=0 := by
  simp [completeOn,hd]

theorem completeOn_insert_nat (s : Finset A) (x : A → R) (d : ℕ)
    {a : A} (ha : a∉s) :
    completeOn (insert a s) x (d+1:ℕ) =
      x a*completeOn (insert a s) x (d:ℤ) + completeOn s x (d+1:ℕ) := by
  let e := Finset.subtypeInsertEquivOption ha
  let y : Option ↥s → R := fun o => x (e.symm o).val
  have hy : (y ∘ e) = (fun i : ↥(insert a s) => x i.val) := by
    funext i
    simp [y]
  have hnone : y none=x a := rfl
  have hsome : y ∘ some = (fun i : ↥s => x i.val) := rfl
  have h1 (n : ℕ) : completeSum (fun i : ↥(insert a s) => x i.val) n = completeSum y n := by
    rw [← hy,completeSum_rename e]
  have hn (j : ℕ) : ¬(j:ℤ) < 0 := by omega
  simp only [completeOn,hn,ite_false,Int.toNat_natCast,h1]
  rw [completeSum_option_succ,hnone,hsome]

/-- Removing a selected variable is one exact first-order recurrence,
valid at integer degree indices including negative degrees. -/
theorem completeOn_remove_factor (s : Finset A) (x : A → R) (d : ℤ)
    {a : A} (ha : a∉s) :
    completeOn (insert a s) x d - x a*completeOn (insert a s) x (d-1) = completeOn s x d := by
  by_cases hd : d < 0
  · simp [completeOn_neg,hd,show d-1 < 0 by omega]
  · by_cases h0 : d=0
    · subst d
      simp [completeOn,completeSum_zero]
    · have hp : 0 < d := lt_of_le_of_ne (le_of_not_gt hd) (Ne.symm h0)
      have he : (((d-1).toNat+1 : ℕ):ℤ) = d := by omega
      have he₂ : ((d-1).toNat:ℤ) = d-1 := by omega
      have h := completeOn_insert_nat s x (d-1).toNat ha
      rw [he,he₂] at h
      rw [h,add_sub_cancel_left]

end NovelliThibon
