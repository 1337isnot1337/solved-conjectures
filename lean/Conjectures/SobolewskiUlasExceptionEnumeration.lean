module

public import Conjectures.SobolewskiUlasExceptionRepeated

@[expose] public section
namespace SobolewskiUlasException

theorem scaledUpTo_mono : Monotone scaledUpTo := by
  intro x y h n hn
  exact mem_scaledUpTo.mpr ⟨(mem_scaledUpTo.mp hn).1.trans h,(mem_scaledUpTo.mp hn).2⟩

theorem countExceptions_mono : Monotone countExceptions :=
  fun _ _ h => Finset.card_le_card (scaledUpTo_mono h)

theorem scaledUpTo_succ (y : ℕ) [Decidable (inScaled (y+1))] :
    scaledUpTo (y+1) = if inScaled (y+1) then insert (y+1) (scaledUpTo y) else scaledUpTo y := by
  classical
  ext x
  by_cases hs : inScaled (y+1)
  · rw [ite_eq_left hs,mem_scaledUpTo,Finset.mem_insert,mem_scaledUpTo]
    constructor
    · rintro ⟨h,hx⟩
      by_cases he : x=y+1
      · exact Or.inl he
      · exact Or.inr ⟨by omega,hx⟩
    · rintro (rfl|⟨h,hx⟩)
      · exact ⟨le_rfl,hs⟩
      · exact ⟨by omega,hx⟩
  · rw [ite_eq_right hs,mem_scaledUpTo,mem_scaledUpTo]
    constructor
    · rintro ⟨h,hx⟩
      have he : x≠y+1 := fun e => hs (e ▸ hx)
      exact ⟨by omega,hx⟩
    · exact fun ⟨h,hx⟩ => ⟨by omega,hx⟩

theorem countExceptions_succ (y : ℕ) [Decidable (inScaled (y+1))] :
    countExceptions (y+1)=countExceptions y+(if inScaled (y+1) then 1 else 0) := by
  unfold countExceptions
  rw [scaledUpTo_succ]
  split_ifs with h
  · rw [Finset.card_insert_of_notMem]
    intro hm
    have h0 := (mem_scaledUpTo.mp hm).1
    omega
  · simp

theorem countExceptions_add_le (x d : ℕ) : countExceptions (x+d)≤countExceptions x+d := by
  classical
  induction d with
  | zero => simp
  | succ d ih =>
    rw [Nat.add_succ,countExceptions_succ]
    split_ifs <;> omega

theorem countExceptions_lower_at_base (n : ℕ) : n+1≤countExceptions (baseValue n) := by
  let S := (Finset.range (n+1)).image baseValue
  have hs : S⊆scaledUpTo (baseValue n) := by
    intro y hy
    obtain ⟨i,hi,rfl⟩ := Finset.mem_image.mp hy
    have hN : i≤n := Nat.lt_succ_iff.mp (Finset.mem_range.mp hi)
    exact mem_scaledUpTo.mpr ⟨baseValue_strictMono.monotone hN,0,i,by simp⟩
  have hcard : S.card=n+1 := by
    dsimp only [S]
    rw [Finset.card_image_of_injective _ baseValue_strictMono.injective,Finset.card_range]
  rw [← hcard]
  exact Finset.card_le_card hs

theorem exists_countExceptions_ge (n : ℕ) : ∃ y,n≤countExceptions y :=
  ⟨baseValue n,(Nat.le_succ n).trans (countExceptions_lower_at_base n)⟩

/-- The 1-indexed increasing enumeration of the literal normalized
exception set; index zero is the auxiliary value zero. -/
noncomputable def nthException (n : ℕ) : ℕ := by
  classical
  exact Nat.find (exists_countExceptions_ge n)

theorem nthException_le_of_count {n y : ℕ} (h : n≤countExceptions y) :
    nthException n≤y := by
  classical
  exact Nat.find_min' (exists_countExceptions_ge n) h

theorem countExceptions_nth_ge (n : ℕ) : n≤countExceptions (nthException n) := by
  classical
  exact Nat.find_spec (exists_countExceptions_ge n)

theorem countExceptions_nth (n : ℕ) : countExceptions (nthException n)=n := by
  classical
  by_cases h : nthException n=0
  · have hn := countExceptions_nth_ge n
    rw [h,countExceptions_zero] at hn
    rw [h,countExceptions_zero]
    exact (Nat.eq_zero_of_le_zero hn).symm
  · have hpos : 0<nthException n := Nat.pos_of_ne_zero h
    obtain ⟨z,hz⟩ : ∃ z,nthException n=z+1 := ⟨nthException n-1,by omega⟩
    have hsmall : countExceptions z<n := by
      by_contra! hh
      have he := nthException_le_of_count hh
      omega
    have hbig := countExceptions_nth_ge n
    rw [hz,countExceptions_succ] at hbig ⊢
    split_ifs at hbig ⊢ <;> omega

theorem nthException_le_linear (n : ℕ) : nthException (n+1)≤8*n+5 := by
  have h := nthException_le_of_count (countExceptions_lower_at_base n)
  have hv := (offset_bounds n).2
  unfold baseValue at h
  omega

theorem nthException_mem {n : ℕ} (hn : 0<n) : inScaled (nthException n) := by
  classical
  have hpos : 0<nthException n := by
    by_contra! H
    have he : nthException n=0 := Nat.eq_zero_of_le_zero H
    have hc := countExceptions_nth n
    rw [he,countExceptions_zero] at hc
    omega
  let z := nthException n-1
  have hz : nthException n=z+1 := by dsimp [z]; omega
  have hsmall : countExceptions z<n := by
    by_contra! hh
    exact (Nat.not_succ_le_self _) (hz ▸ nthException_le_of_count hh)
  rw [hz]
  have hbig := countExceptions_nth n
  rw [hz,countExceptions_succ] at hbig
  split_ifs at hbig with h
  · exact h
  · omega

theorem nthException_strictMono : StrictMono nthException := by
  intro m n h
  by_contra! hd
  have hx := countExceptions_mono hd
  rw [countExceptions_nth,countExceptions_nth] at hx
  exact h.not_ge hx

end SobolewskiUlasException
