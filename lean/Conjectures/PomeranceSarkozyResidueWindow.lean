module
public import Conjectures.PomeranceSarkozyTailProbability
public import Mathlib.Data.ZMod.Basic

@[expose] public section
namespace PomeranceSarkozy

open Finset

def residueWindow (L N d : ℕ) (r : ZMod d) : Finset ℕ :=
  (range N).filter fun j => ((L+j:ℕ):ZMod d)=r

def residueOffset (L d : ℕ) (r : ZMod d) : ℕ :=
  (r-(L:ZMod d)).val

theorem residue_shift_eq_mod {L j d : ℕ} [NeZero d] (r : ZMod d) :
    ((L+j:ℕ):ZMod d)=r ↔ j%d=residueOffset L d r := by
  let k := residueOffset L d r
  have hk : k < d := ZMod.val_lt _
  have he : (k:ZMod d)=r-(L:ZMod d) := ZMod.natCast_zmod_val _
  calc
    _ ↔ (j:ZMod d)=r-(L:ZMod d) := by rw [Nat.cast_add,eq_sub_iff_add_eq,add_comm (L:ZMod d)]
    _ ↔ (j:ZMod d)=(k:ZMod d) := by rw [he]
    _ ↔ _ := by rw [ZMod.natCast_eq_natCast_iff',Nat.mod_eq_of_lt hk]

theorem block_index_lt_iff (d N k b : ℕ) (hd : 0 < d) (hk : k < d) :
    b*d+k < N ↔ b < N/d+(if k < N%d then 1 else 0) := by
  have hN : N=N/d*d+N%d := by
    simpa only [Nat.mul_comm, Nat.add_comm] using (Nat.mod_add_div N d).symm
  have hr := Nat.mod_lt N hd
  rcases lt_trichotomy b (N/d) with h|h|h
  · have hh : (b+1)*d≤(N/d)*d := Nat.mul_le_mul_right _ (by omega)
    rw [Nat.add_mul,one_mul] at hh
    constructor
    · intro _
      omega
    · intro _
      omega
  · subst b
    by_cases hkt : k < N%d <;> simp [hkt] <;> omega
  · have hh : (N/d+1)*d≤b*d := Nat.mul_le_mul_right _ (by omega)
    rw [Nat.add_mul,one_mul] at hh
    constructor
    · intro hh'
      omega
    · intro hh'
      by_cases hkt : k < N%d <;> simp [hkt] at hh' <;> omega

theorem residueWindow_card {L N d : ℕ} [NeZero d] (r : ZMod d) :
    (residueWindow L N d r).card =
      N/d + if residueOffset L d r < N%d then 1 else 0 := by
  let k := residueOffset L d r
  have hk : k < d := ZMod.val_lt _
  have hd : 0 < d := NeZero.pos d
  let q := N/d + if k < N%d then 1 else 0
  have he : residueWindow L N d r =
      (Finset.range q).image (fun b => b*d+k) := by
    ext j
    simp only [residueWindow,Finset.mem_filter,Finset.mem_range,Finset.mem_image,residue_shift_eq_mod]
    constructor
    · rintro ⟨hj,hm⟩
      have hm' : j%d=k := hm
      have hj' : j=j/d*d+k := by
        simpa only [hm',Nat.mul_comm,Nat.add_comm] using (Nat.mod_add_div j d).symm
      refine ⟨j/d,?_,hj'.symm⟩
      exact (block_index_lt_iff d N k (j/d) hd hk).mp (lt_of_eq_of_lt hj'.symm hj)
    · rintro ⟨b,hb,rfl⟩
      refine ⟨(block_index_lt_iff d N k b hd hk).mpr hb,?_⟩
      change (b*d+k)%d=k
      simp [Nat.add_mod,Nat.mod_eq_of_lt hk]
  rw [he,Finset.card_image_of_injective,Finset.card_range]
  intro a b hab
  exact Nat.eq_of_mul_eq_mul_right hd (Nat.add_right_cancel hab)

/-- A consecutive interval's actual residue frequency differs by at
most one sample from the uniform frequency. -/
theorem residueWindow_count_error {L N d : ℕ} [NeZero d] (r : ZMod d) :
    |((residueWindow L N d r).card:ℚ)-(N:ℚ)/d| ≤ 1 := by
  have hp : (0:ℚ) < d := by exact_mod_cast (NeZero.pos d)
  have hsplit : (N:ℚ)=(N/d:ℕ)*(d:ℚ)+(N%d:ℕ) := by
    have hh : N=N/d*d+N%d := by
      simpa only [Nat.mul_comm,Nat.add_comm] using (Nat.mod_add_div N d).symm
    exact_mod_cast hh
  have he : (N:ℚ)/(d:ℚ)=(N/d:ℕ)+((N%d:ℕ):ℚ)/(d:ℚ) := by
    rw [hsplit]
    field_simp
  have hlow : (0:ℚ)≤((N%d:ℕ):ℚ)/(d:ℚ) := by positivity
  have hhigh : ((N%d:ℕ):ℚ)/(d:ℚ)≤1 :=
    (div_le_iff₀ hp).mpr (by simp only [one_mul]; exact_mod_cast (Nat.mod_lt N (NeZero.pos d)).le)
  rw [residueWindow_card,he,Nat.cast_add]
  split <;> push_cast <;> rw [abs_le] <;> constructor <;> linarith

end PomeranceSarkozy
