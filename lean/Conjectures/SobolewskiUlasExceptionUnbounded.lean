module

public import Conjectures.SobolewskiUlasExceptionEnumeration

@[expose] public section
namespace SobolewskiUlasException

theorem repeatedNine_mod_six (k : ℕ) : repeatedNine (k+1)%6=3 := by
  induction k with
  | zero => decide
  | succ k ih =>
    rw [repeatedNine]
    omega

def repeatedIndex (k : ℕ) : ℕ := (repeatedNine k+3)/6

theorem repeatedIndex_exact {k : ℕ} (hk : 0<k) :
    repeatedNine k+3=6*repeatedIndex k := by
  obtain ⟨z,rfl⟩ : ∃ z,k=z+1 := ⟨k-1,by omega⟩
  have hm := repeatedNine_mod_six z
  unfold repeatedIndex
  omega

theorem repeatedNine_add (k j : ℕ) :
    repeatedNine (k+j)=16^j*repeatedNine k+repeatedNine j := by
  induction j with
  | zero => simp [repeatedNine]
  | succ j ih =>
    rw [Nat.add_succ,repeatedNine,ih,repeatedNine,pow_succ']
    ring

theorem repeatedNine_large (j : ℕ) : 6*(j+2)+6≤repeatedNine (j+2) := by
  induction j with
  | zero => decide
  | succ j ih =>
    change 6*(j+2+1)+6≤repeatedNine (j+2+1)
    rw [repeatedNine]
    omega

theorem repeatedIndex_gt {j : ℕ} (hj : 2≤j) : j<repeatedIndex j := by
  obtain ⟨z,rfl⟩ : ∃ z,j=z+2 := ⟨j-2,by omega⟩
  have hl := repeatedNine_large z
  unfold repeatedIndex
  omega

noncomputable def remainder (k : ℕ) : ℤ :=
  (nthException (repeatedIndex k) : ℤ)-(repeatedNine k : ℤ)+6*(k : ℤ)

/-- The written subsequence gives a genuinely unbounded remainder
for the increasing enumeration of the literal normalized set. -/
theorem remainder_at_repeatedIndex_lower {J : ℕ} (hJ : 2≤J) :
    (J : ℤ)+3≤remainder (repeatedIndex J) := by
  let k := repeatedIndex J
  have hjk : J<k := repeatedIndex_gt hJ
  have hJpos : 0<J := by omega
  have hkpos : 0<k := by omega
  let x := 16^J*repeatedNine (k-J)
  have hjoin : repeatedNine k=x+repeatedNine J := by
    have e := repeatedNine_add (k-J) J
    rw [Nat.sub_add_cancel hjk.le] at e
    exact e
  have herr : countError x=6*((k-J : ℕ) : ℤ) := by
    obtain ⟨a,ha⟩ : ∃ a,k-J=a+1 := ⟨k-J-1,by omega⟩
    obtain ⟨b,hb⟩ : ∃ b,J=b+1 := ⟨J-1,by omega⟩
    dsimp only [x]
    rw [ha]
    rw [hb,repeatedNine_scaled_countError,repeatedNine_countError]
    push_cast
    ring
  have hix := repeatedIndex_exact hJpos
  have hiy := repeatedIndex_exact hkpos
  have hxNat : countExceptions x+J=repeatedIndex k := by
    unfold countError at herr
    have he : ((k-J : ℕ) : ℤ)=(k : ℤ)-(J : ℤ) := Nat.cast_sub hjk.le
    have hz : (repeatedNine k : ℤ)=(x : ℤ)+(repeatedNine J : ℤ) := by exact_mod_cast hjoin
    have hiZ : (repeatedNine J : ℤ)+3=6*(k : ℤ) := by exact_mod_cast hix
    have hjZ : (repeatedNine k : ℤ)+3=6*(repeatedIndex k : ℤ) := by exact_mod_cast hiy
    rw [he] at herr
    omega
  let g := nthException (repeatedIndex k)
  have hg : countExceptions g=repeatedIndex k := countExceptions_nth _
  have hgx : x≤g := by
    by_contra! H
    have hc := countExceptions_mono H.le
    change countExceptions g≤countExceptions x at hc
    omega
  have hge := countExceptions_add_le x (g-x)
  rw [Nat.add_sub_of_le hgx,hg] at hge
  have hxg : x+J≤g := by omega
  have hxgZ : (x : ℤ)+(J : ℤ)≤(g : ℤ) := by exact_mod_cast hxg
  have hjoinZ : (repeatedNine k : ℤ)=(x : ℤ)+(repeatedNine J : ℤ) := by exact_mod_cast hjoin
  have hiZ : (repeatedNine J : ℤ)+3=6*(k : ℤ) := by exact_mod_cast hix
  change (J : ℤ)+3≤(g : ℤ)-(repeatedNine k : ℤ)+6*(k : ℤ)
  omega

theorem remainder_unbounded_above (b : ℕ) : ∃ k,(b : ℤ)<remainder k := by
  have h := remainder_at_repeatedIndex_lower (J := b+2) (by omega)
  refine ⟨repeatedIndex (b+2),?_⟩
  push_cast at h
  omega

end SobolewskiUlasException
