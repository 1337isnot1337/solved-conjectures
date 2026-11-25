module

public import Conjectures.SobolewskiUlasExceptionDigits
public import Mathlib.Data.Finset.Card

@[expose] public section
namespace SobolewskiUlasException

def inBase (x : ℕ) : Prop := ∃ s,baseValue s=x

def inScaled (x : ℕ) : Prop := ∃ j s,4^j*baseValue s=x

def baseIndices (y : ℕ) : Finset ℕ :=
  (Finset.range (y/8+1)).filter (fun i => baseValue i≤y)

def baseUpTo (y : ℕ) : Finset ℕ := (baseIndices y).image baseValue

theorem mem_baseIndices {y i : ℕ} : i∈baseIndices y ↔ baseValue i≤y := by
  rw [baseIndices,Finset.mem_filter,Finset.mem_range,and_iff_right_iff_imp]
  intro h
  have h1 := (offset_bounds i).1
  unfold baseValue at h
  omega

theorem mem_baseUpTo {x y : ℕ} : x∈baseUpTo y ↔ x≤y ∧ inBase x := by
  rw [baseUpTo,Finset.mem_image]
  constructor
  · rintro ⟨i,hi,rfl⟩
    exact ⟨mem_baseIndices.mp hi,i,rfl⟩
  · rintro ⟨hi,i,rfl⟩
    exact ⟨i,mem_baseIndices.mpr hi,rfl⟩

/-- Exact number of level-zero exceptions up to an arbitrary endpoint. -/
theorem baseUpTo_card (y : ℕ) :
    (baseUpTo y).card=y/8+(if layerOffset (y/8)≤y%8 then 1 else 0) := by
  let k := y/8
  have small (i : ℕ) (hi : i<k) : baseValue i≤y := by
    have h := (offset_bounds i).2
    unfold baseValue
    dsimp only [k] at hi
    omega
  have equal : baseValue k≤y ↔ layerOffset k≤y%8 := by
    unfold baseValue
    dsimp [k]
    omega
  rw [baseUpTo,Finset.card_image_of_injective _ baseValue_strictMono.injective]
  change (baseIndices y).card=k+(if layerOffset k≤y%8 then 1 else 0)
  by_cases hk : layerOffset k≤y%8
  · rw [ite_eq_left hk]
    have he : baseIndices y=Finset.range (k+1) := by
      ext i
      constructor
      · intro hi
        exact (Finset.mem_filter.mp hi).1
      · intro hi
        have hi' := Finset.mem_range.mp hi
        rcases (Nat.lt_succ_iff.mp hi').eq_or_lt with e|h
        · subst i
          exact mem_baseIndices.mpr (equal.mpr hk)
        · exact mem_baseIndices.mpr (small i h)
    rw [he,Finset.card_range]
  · rw [ite_eq_right hk,Nat.add_zero]
    have he : baseIndices y=Finset.range k := by
      ext i
      constructor
      · intro hi
        have hi' := Finset.mem_range.mp (Finset.mem_filter.mp hi).1
        apply Finset.mem_range.mpr
        apply (Nat.lt_succ_iff.mp hi').lt_of_ne
        intro e
        change i=k at e
        have hz := mem_baseIndices.mp hi
        rw [e] at hz
        exact hk (equal.mp hz)
      · intro hi
        exact mem_baseIndices.mpr (small i (Finset.mem_range.mp hi))
    rw [he,Finset.card_range]

theorem inScaled_unfold (x : ℕ) :
    inScaled x ↔ inBase x ∨ ∃ z, inScaled z ∧ x=4*z := by
  constructor
  · rintro ⟨j,s,rfl⟩
    cases j with
    | zero => exact Or.inl ⟨s,by simp⟩
    | succ j =>
      exact Or.inr ⟨4^j*baseValue s,⟨j,s,rfl⟩,by rw [pow_succ']; ring⟩
  · rintro (⟨s,rfl⟩|⟨z,⟨j,s,rfl⟩,rfl⟩)
    · exact ⟨0,s,by simp⟩
    · exact ⟨j+1,s,by rw [pow_succ']; ring⟩

noncomputable def scaledUpTo (y : ℕ) : Finset ℕ := by
  classical
  exact (Finset.range (y+1)).filter inScaled

theorem mem_scaledUpTo {x y : ℕ} : x∈scaledUpTo y ↔ x≤y ∧ inScaled x := by
  classical
  simp only [scaledUpTo,Finset.mem_filter,Finset.mem_range,Nat.lt_succ_iff]

def timesFour : ℕ ↪ ℕ := ⟨fun x => 4*x,by
  intro x y h
  change 4*x=4*y at h
  omega⟩

theorem scaledUpTo_split (y : ℕ) :
    scaledUpTo y=baseUpTo y∪(scaledUpTo (y/4)).map timesFour := by
  ext x
  rw [mem_scaledUpTo,inScaled_unfold,Finset.mem_union,mem_baseUpTo,Finset.mem_map]
  constructor
  · rintro ⟨h,hs|⟨z,hz,rfl⟩⟩
    · exact Or.inl ⟨h,hs⟩
    · exact Or.inr ⟨z,mem_scaledUpTo.mpr ⟨by omega,hz⟩,rfl⟩
  · rintro (⟨h,hs⟩|⟨z,hz,rfl⟩)
    · exact ⟨h,Or.inl hs⟩
    · obtain ⟨hb,hs⟩ := mem_scaledUpTo.mp hz
      exact ⟨by change 4*z≤y; omega,Or.inr ⟨z,hs,rfl⟩⟩

theorem base_scaled_four_disjoint (y : ℕ) :
    Disjoint (baseUpTo y) ((scaledUpTo (y/4)).map timesFour) := by
  apply Finset.disjoint_left.mpr
  intro x hx hz
  obtain ⟨s,rfl⟩ := (mem_baseUpTo.mp hx).2
  obtain ⟨z,_,he⟩ := Finset.mem_map.mp hz
  change 4*z=baseValue s at he
  have hp := baseValue_odd s
  omega

noncomputable def countExceptions (y : ℕ) : ℕ := (scaledUpTo y).card

/-- Exact recurrence for the actual finite count of scaled exceptions. -/
theorem countExceptions_recurrence (y : ℕ) :
    countExceptions y=(baseUpTo y).card+countExceptions (y/4) := by
  unfold countExceptions
  rw [scaledUpTo_split y,Finset.card_union_of_disjoint (base_scaled_four_disjoint y),Finset.card_map]

end SobolewskiUlasException
