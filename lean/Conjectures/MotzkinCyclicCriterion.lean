import Conjectures.MotzkinCyclic

/-! The congruence criterion for attaining any certified independence-number
upper bound in a connected two-jump cyclic graph. -/
namespace Motzkin.Cyclic

theorem coefficients_of_generate {R : Type*} [CommRing R] (a b : R)
    (hgen : AddSubgroup.closure ({a,b} : Set R)=⊤) :
    ∃ x y : R, x*a+y*b=1 := by
  let f : (R × R) →+ R :=
    {toFun := fun p => p.1*a+p.2*b,
     map_zero' := by simp,
     map_add' := by intro p q; simp only [Prod.fst_add,Prod.snd_add,add_mul]; ring}
  have hle : AddSubgroup.closure ({a,b} : Set R) ≤ f.range := by
    apply (AddSubgroup.closure_le f.range).mpr
    intro z hz
    rcases Set.mem_insert_iff.mp hz with rfl | hz
    · exact ⟨(1,0),by simp [f]⟩
    · have hz' : z=b := Set.mem_singleton_iff.mp hz
      subst z
      exact ⟨(0,1),by simp [f]⟩
  rw [hgen] at hle
  obtain ⟨p,hp⟩ := hle (show (1:R) ∈ (⊤ : AddSubgroup R) from trivial)
  exact ⟨p.1,p.2,hp⟩

theorem pair_eq_multiplier_iff {R : Type*} [CommRing R] (a b r s : R)
    (hgen : AddSubgroup.closure ({a,b} : Set R)=⊤) :
    (∃ t : R, t*a=r ∧ t*b=s) ↔ b*r=a*s := by
  constructor
  · rintro ⟨t,rfl,rfl⟩
    ring
  · intro hrs
    obtain ⟨x,y,hxy⟩ := coefficients_of_generate a b hgen
    refine ⟨x*r+y*s,?_,?_⟩
    · calc
        (x*r+y*s)*a = (x*a)*r+y*(a*s) := by ring
        _ = (x*a)*r+y*(b*r) := by rw [← hrs]
        _ = (x*a+y*b)*r := by ring
        _ = r := by rw [hxy,one_mul]
    · calc
        (x*r+y*s)*b = x*(b*r)+(y*b)*s := by ring
        _ = x*(a*s)+(y*b)*s := by rw [hrs]
        _ = (x*a+y*b)*s := by ring
        _ = s := by rw [hxy,one_mul]

variable {N : ℕ} [NeZero N]

theorem folded_ge_iff (z : ZMod N) (h : ℕ) :
    h ≤ folded z ↔ h ≤ z.val ∧ z.val ≤ N-h := by
  rw [folded,le_min_iff]
  have hz := z.val_lt
  omega

theorem folded_natCast_ge {r h : ℕ} (hl : h ≤ r) (hu : r ≤ N-h) :
    h ≤ folded (r:ZMod N) := by
  by_cases hh : h=0
  · subst h
    exact Nat.zero_le _
  have hr : r < N := by omega
  rw [folded_ge_iff,ZMod.val_natCast_of_lt hr]
  exact ⟨hl,hu⟩

theorem exists_score_ge_iff (a b : ZMod N)
    (hgen : AddSubgroup.closure ({a,b} : Set (ZMod N))=⊤) (h : ℕ) :
    (∃ t : ZMod N, h ≤ score t a b) ↔
      ∃ r s : ℕ, h ≤ r ∧ r ≤ N-h ∧ h ≤ s ∧ s ≤ N-h ∧
        b*(r:ZMod N)=a*(s:ZMod N) := by
  constructor
  · rintro ⟨t,ht⟩
    obtain ⟨ha,hb⟩ := le_min_iff.mp ht
    obtain ⟨hra,hrb⟩ := (folded_ge_iff (t*a) h).mp ha
    obtain ⟨hsa,hsb⟩ := (folded_ge_iff (t*b) h).mp hb
    refine ⟨(t*a).val,(t*b).val,hra,hrb,hsa,hsb,?_⟩
    rw [ZMod.natCast_zmod_val,ZMod.natCast_zmod_val]
    ring
  · rintro ⟨r,s,hrl,hru,hsl,hsu,hrs⟩
    obtain ⟨t,hta,htb⟩ := (pair_eq_multiplier_iff a b (r:ZMod N) (s:ZMod N) hgen).mpr hrs
    refine ⟨t,?_⟩
    rw [score,hta,htb]
    exact le_min (folded_natCast_ge hrl hru) (folded_natCast_ge hsl hsu)

theorem attains_upper_bound_iff (a b : ZMod N)
    (hgen : AddSubgroup.closure ({a,b} : Set (ZMod N))=⊤) (U : ℕ)
    (hupper : ∀ A : Finset (ZMod N),
      (∀ x ∈ A, x+a ∉ A ∧ x+b ∉ A) → A.card ≤ U) :
    (∃ A : Finset (ZMod N), (∀ x ∈ A, x+a ∉ A ∧ x+b ∉ A) ∧ A.card=U) ↔
      ∃ r s : ℕ, U ≤ r ∧ r ≤ N-U ∧ U ≤ s ∧ s ≤ N-U ∧
        b*(r:ZMod N)=a*(s:ZMod N) := by
  rw [← exists_score_ge_iff a b hgen U]
  obtain ⟨B,t,hB,hcard,hmax,hchar⟩ := finite_cyclic_theorem a b hgen
  constructor
  · rintro ⟨A,hA,hAU⟩
    refine ⟨t,?_⟩
    rw [← hcard,← hAU]
    exact hmax A hA
  · rintro ⟨u,hu⟩
    refine ⟨B,hB,le_antisymm (hupper B hB) (hu.trans (hchar u))⟩

end Motzkin.Cyclic
