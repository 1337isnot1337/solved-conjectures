module

public import Conjectures.SobolewskiUlasExceptionRegularTail
public import Conjectures.SobolewskiUlasExceptionCountingScope

@[expose] public section
namespace SobolewskiUlasException

/-- The explicit layer formula from the source, before normalizing by
a factor of two. This definition does not assume the original theorem
identifying the layer formula with binary-partition exceptions. -/
def inSourceLayer (x : ℕ) : Prop := ∃ j s,2^(2*j+1)*baseValue s=x

theorem inSourceLayer_iff_digit_formula (x : ℕ) :
    inSourceLayer x ↔ ∃ j s : ℕ,
      (x : ℤ)=2^(2*j+1)*(8*(s : ℤ)+3+2*tmSign s) := by
  constructor
  · rintro ⟨j,s,h⟩
    have h' : ((2^(2*j+1)*baseValue s : ℕ) : ℤ)=(x : ℤ) := by exact_mod_cast h
    push_cast at h'
    rw [cast_baseValue] at h'
    exact ⟨j,s,h'.symm⟩
  · rintro ⟨j,s,h⟩
    refine ⟨j,s,?_⟩
    rw [← cast_baseValue] at h
    exact_mod_cast h.symm

theorem inSourceLayer_iff_doubled (x : ℕ) :
    inSourceLayer x ↔ ∃ y,inScaled y ∧ x=2*y := by
  constructor
  · rintro ⟨j,s,rfl⟩
    refine ⟨4^j*baseValue s,⟨j,s,rfl⟩,?_⟩
    rw [pow_succ',← fourPower_eq_twoPower,mul_assoc]
  · rintro ⟨y,⟨j,s,rfl⟩,rfl⟩
    refine ⟨j,s,?_⟩
    rw [pow_succ',← fourPower_eq_twoPower,mul_assoc]

noncomputable def sourceLayerEnumeration (k : ℕ) : ℕ := 2*nthException (k+1)

theorem sourceLayerEnumeration_strictMono : StrictMono sourceLayerEnumeration := by
  intro a b h
  unfold sourceLayerEnumeration
  exact Nat.mul_lt_mul_of_pos_left (nthException_strictMono (Nat.add_lt_add_right h 1)) (by decide)

theorem inSourceLayer_eq_enumeration (x : ℕ) :
    inSourceLayer x ↔ ∃ k,sourceLayerEnumeration k=x := by
  rw [inSourceLayer_iff_doubled]
  constructor
  · rintro ⟨y,hy,rfl⟩
    obtain ⟨n,hn,rfl⟩ := (inScaled_eq_enumeration y).mp hy
    refine ⟨n-1,?_⟩
    unfold sourceLayerEnumeration
    rw [Nat.sub_add_cancel (Nat.succ_le_of_lt hn)]
  · rintro ⟨k,rfl⟩
    exact ⟨nthException (k+1),nthException_mem (Nat.succ_pos _),rfl⟩

theorem sourceLayerEnumeration_not_regular_power_two (a : ℕ) (ha : 0<a) :
    ¬IsRegular (2^a) (fun k => (sourceLayerEnumeration k : ℤ)) := by
  unfold sourceLayerEnumeration
  push_cast
  exact scaled_positive_enumeration_not_regular_power_two a ha

end SobolewskiUlasException
