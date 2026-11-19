import Conjectures.MotzkinBoxTransfer
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.Data.Int.ModEq
import Mathlib.Data.Fintype.EquivFin

/-! An explicit normal form for the integer quotient with relation basis
(m,0),(s,k). This establishes its order mk, including the noncyclic case. -/
namespace Motzkin.Hermite

def latticeMap (m k s : ℕ) : (ℤ × ℤ) →+ (ℤ × ℤ) where
  toFun z := (z.1*(m:ℤ)+z.2*(s:ℤ),z.2*(k:ℤ))
  map_zero' := by ext <;> simp
  map_add' x y := by ext <;> dsimp <;> ring

def lattice (m k s : ℕ) : AddSubgroup (ℤ × ℤ) := (latticeMap m k s).range

abbrev Group (m k s : ℕ) := (ℤ × ℤ) ⧸ lattice m k s

def quotient (m k s : ℕ) : (ℤ × ℤ) →+ Group m k s :=
  QuotientAddGroup.mk' (lattice m k s)

def first (m k s : ℕ) : Group m k s := quotient m k s (1,0)

def second (m k s : ℕ) : Group m k s := quotient m k s (0,1)

theorem mem_lattice (m k s : ℕ) (r t : ℤ) :
    (r,t) ∈ lattice m k s ↔
      ∃ u v : ℤ, r=u*(m:ℤ)+v*(s:ℤ) ∧ t=v*(k:ℤ) := by
  constructor
  · rintro ⟨⟨u,v⟩,h⟩
    exact ⟨u,v,(congrArg Prod.fst h).symm,(congrArg Prod.snd h).symm⟩
  · rintro ⟨u,v,hu,hv⟩
    exact ⟨(u,v),Prod.ext hu.symm hv.symm⟩

theorem pair_sum (m k s : ℕ) (r t : ℤ) :
    r • first m k s+t • second m k s=quotient m k s (r,t) := by
  rw [first,second,← map_zsmul,← map_zsmul,← map_add]
  congr 1
  ext <;> simp [zsmul_eq_mul]

theorem relation_iff (m k s : ℕ) (r t : ℤ) :
    r • first m k s+t • second m k s=0 ↔
      ∃ u v : ℤ, r=u*(m:ℤ)+v*(s:ℤ) ∧ t=v*(k:ℤ) := by
  rw [pair_sum]
  exact (QuotientAddGroup.eq_zero_iff (r,t)).trans (mem_lattice m k s r t)

theorem first_relation (m k s : ℕ) : m • first m k s=0 := by
  have h := (relation_iff m k s (m:ℤ) 0).mpr ⟨1,0,by ring,by ring⟩
  simpa only [natCast_zsmul,zero_zsmul,add_zero] using h

theorem second_relation (m k s : ℕ) : s • first m k s+k • second m k s=0 := by
  have h := (relation_iff m k s (s:ℤ) (k:ℤ)).mpr ⟨0,1,by ring,by ring⟩
  simpa only [natCast_zsmul] using h

theorem generated (m k s : ℕ) :
    AddSubgroup.closure ({first m k s,second m k s} : Set (Group m k s))=⊤ := by
  have hz : AddSubgroup.closure ({(1,0),(0,1)} : Set (ℤ × ℤ))=⊤ := by
    let K := AddSubgroup.closure ({(1,0),(0,1)} : Set (ℤ × ℤ))
    have h₁ : (1,0) ∈ K := AddSubgroup.subset_closure (by simp)
    have h₂ : (0,1) ∈ K := AddSubgroup.subset_closure (by simp)
    apply top_unique
    intro z _
    have he : z=z.1 • (1,0)+z.2 • (0,1) := by ext <;> simp [zsmul_eq_mul]
    rw [he]
    exact K.add_mem (K.zsmul_mem h₁ z.1) (K.zsmul_mem h₂ z.2)
  exact closure_pair_image (quotient m k s) (QuotientAddGroup.mk'_surjective _)
    (1,0) (0,1) hz

def representative (m k s : ℕ) (z : Fin m × Fin k) : Group m k s :=
  quotient m k s ((z.1:ℕ),(z.2:ℕ))

theorem representative_injective (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) :
    Function.Injective (representative m k s) := by
  intro x y hxy
  have hmem : (((x.1:ℕ):ℤ)-((y.1:ℕ):ℤ),((x.2:ℕ):ℤ)-((y.2:ℕ):ℤ)) ∈
      lattice m k s := QuotientAddGroup.eq_iff_sub_mem.mp hxy
  obtain ⟨u,v,hu,hv⟩ := (mem_lattice m k s _ _).mp hmem
  have hkmod : (((y.2:ℕ):ℤ)) ≡ (((x.2:ℕ):ℤ)) [ZMOD (k:ℤ)] :=
    Int.modEq_of_dvd ⟨v,by simpa only [mul_comm] using hv⟩
  change (((y.2:ℕ):ℤ))%(k:ℤ)=(((x.2:ℕ):ℤ))%(k:ℤ) at hkmod
  rw [Int.emod_eq_of_lt (by omega) (by exact_mod_cast y.2.isLt),
    Int.emod_eq_of_lt (by omega) (by exact_mod_cast x.2.isLt)] at hkmod
  have hv0 : v=0 := by
    have hk0 : (k:ℤ) ≠ 0 := by exact_mod_cast hk.ne'
    have hvk : v*(k:ℤ)=0 := by omega
    exact (mul_eq_zero.mp hvk).resolve_right hk0
  rw [hv0,zero_mul,add_zero] at hu
  have hmmod : (((y.1:ℕ):ℤ)) ≡ (((x.1:ℕ):ℤ)) [ZMOD (m:ℤ)] :=
    Int.modEq_of_dvd ⟨u,by simpa only [mul_comm] using hu⟩
  change (((y.1:ℕ):ℤ))%(m:ℤ)=(((x.1:ℕ):ℤ))%(m:ℤ) at hmmod
  rw [Int.emod_eq_of_lt (by omega) (by exact_mod_cast y.1.isLt),
    Int.emod_eq_of_lt (by omega) (by exact_mod_cast x.1.isLt)] at hmmod
  exact Prod.ext (Fin.ext (by exact_mod_cast hmmod.symm))
    (Fin.ext (by exact_mod_cast hkmod.symm))

theorem representative_surjective (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) :
    Function.Surjective (representative m k s) := by
  intro z
  obtain ⟨⟨x,y⟩,rfl⟩ := QuotientAddGroup.mk'_surjective (lattice m k s) z
  have hmZ : (0:ℤ) < m := by exact_mod_cast hm
  have hkZ : (0:ℤ) < k := by exact_mod_cast hk
  let q : ℤ := y/(k:ℤ)
  let r : ℤ := x-q*(s:ℤ)
  let p : ℤ := r/(m:ℤ)
  let i : Fin m := ⟨(r%(m:ℤ)).toNat,by
    exact_mod_cast (Int.toNat_lt (Int.emod_nonneg _ hmZ.ne')).mpr
      (Int.emod_lt_of_pos _ hmZ)⟩
  let j : Fin k := ⟨(y%(k:ℤ)).toNat,by
    exact_mod_cast (Int.toNat_lt (Int.emod_nonneg _ hkZ.ne')).mpr
      (Int.emod_lt_of_pos _ hkZ)⟩
  have hi : ((i:ℕ):ℤ)=r%(m:ℤ) := Int.toNat_of_nonneg (Int.emod_nonneg _ hmZ.ne')
  have hj : ((j:ℕ):ℤ)=y%(k:ℤ) := Int.toNat_of_nonneg (Int.emod_nonneg _ hkZ.ne')
  refine ⟨(i,j),?_⟩
  apply QuotientAddGroup.eq_iff_sub_mem.mpr
  apply (mem_lattice m k s _ _).mpr
  refine ⟨-p,-q,?_,?_⟩
  · have he := Int.emod_add_ediv_mul r (m:ℤ)
    rw [hi]
    dsimp only [r,p,q] at *
    nlinarith
  · have he := Int.emod_add_ediv_mul y (k:ℤ)
    rw [hj]
    dsimp only [q]
    nlinarith

noncomputable def representativeEquiv (m k s : ℕ) (hm : 0 < m) (hk : 0 < k) :
    (Fin m × Fin k) ≃ Group m k s :=
  Equiv.ofBijective (representative m k s)
    ⟨representative_injective m k s hm hk,representative_surjective m k s hm hk⟩

noncomputable instance (m k s : ℕ) [NeZero m] [NeZero k] : Fintype (Group m k s) :=
  Fintype.ofEquiv (Fin m × Fin k) (representativeEquiv m k s (NeZero.pos m) (NeZero.pos k))

theorem card (m k s : ℕ) [NeZero m] [NeZero k] :
    Fintype.card (Group m k s)=m*k := by
  rw [← Fintype.card_congr (representativeEquiv m k s (NeZero.pos m) (NeZero.pos k))]
  simp only [Fintype.card_prod,Fintype.card_fin]

end Motzkin.Hermite
