import Conjectures.NonmixedGapCircle

namespace NonmixedGap

def tile (a b k m : ℤ) : Finset ℤ :=
  (Finset.Icc 0 k).image (fun i => i*a) ∪
    (Finset.Icc 0 m).image (fun j => k*a+j*b)

theorem mem_tile {a b k m x : ℤ} :
    x ∈ tile a b k m ↔
      (∃ i : ℤ, 0 ≤ i ∧ i ≤ k ∧ x=i*a) ∨
      (∃ j : ℤ, 0 ≤ j ∧ j ≤ m ∧ x=k*a+j*b) := by
  simp only [tile,Finset.mem_union,Finset.mem_image,Finset.mem_Icc]
  aesop

/-- The bounded nonnegative combinations are exactly the positive differences
of the actual tile, including both of its gap segments. -/
theorem difference_iff_tile_difference {a b k m w : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 ≤ k) (hm : 0 ≤ m) :
    w ∈ differences a b k m ↔ ∃ x ∈ tile a b k m, ∃ y ∈ tile a b k m,
      x < y ∧ w=y-x := by
  constructor
  · intro hw
    obtain ⟨i,j,hi,hik,hj,hjm,hij,rfl⟩ := mem_differences.mp hw
    refine ⟨(k-i)*a,?_,k*a+j*b,?_,?_,?_⟩
    · exact mem_tile.mpr (Or.inl ⟨k-i,by omega,by omega,rfl⟩)
    · exact mem_tile.mpr (Or.inr ⟨j,hj,hjm,rfl⟩)
    · have hp := difference_pos ha hb hi hj hij
      nlinarith only [hp]
    · ring
  · rintro ⟨x,hx,y,hy,hxy,rfl⟩
    rcases mem_tile.mp hx with ⟨i,hi,hik,rfl⟩ | ⟨j,hj,hjm,rfl⟩
    · rcases mem_tile.mp hy with ⟨i',hi',hi'k,rfl⟩ | ⟨j,hj,hjm,rfl⟩
      · have hii : i < i' := by nlinarith only [hxy,ha]
        apply mem_differences.mpr
        exact ⟨i'-i,0,by omega,by omega,by omega,by omega,by omega,by ring⟩
      · have hpos : 0 < k-i+j := by
          by_contra hn
          have hki : k-i=0 := by omega
          have hj0 : j=0 := by omega
          have hik' : i=k := by omega
          subst j
          subst i
          simp at hxy
        apply mem_differences.mpr
        exact ⟨k-i,j,by omega,by omega,hj,hjm,hpos,by ring⟩
    · rcases mem_tile.mp hy with ⟨i,hi,hik,rfl⟩ | ⟨j',hj',hj'm,rfl⟩
      · have hm1 := mul_le_mul_of_nonneg_right hik (le_of_lt ha)
        have hm2 := mul_nonneg hj (le_of_lt hb)
        nlinarith only [hm1,hm2,hxy]
      · have hjj : j < j' := by nlinarith only [hxy,hb]
        apply mem_differences.mpr
        exact ⟨0,j'-j,by omega,by omega,by omega,by omega,by omega,by ring⟩

def Packs (A : Set ℤ) (S : Finset ℤ) : Prop :=
  ∀ x ∈ A, ∀ y ∈ A, ∀ s ∈ S, ∀ t ∈ S, x+s=y+t → x=y

/-- Packing disjoint tile translates is equivalent to the avoiding-set
definition used in the extremal density theorem. -/
theorem packs_iff_avoids {A : Set ℤ} {a b k m : ℤ}
    (ha : 0 < a) (hb : 0 < b) (hk : 0 ≤ k) (hm : 0 ≤ m) :
    Packs A (tile a b k m) ↔ Avoids A a b k m := by
  constructor
  · intro hpack x hx i j hi hik hj hjm hij hy
    have hw : i*a+j*b ∈ differences a b k m :=
      mem_differences.mpr ⟨i,j,hi,hik,hj,hjm,hij,rfl⟩
    obtain ⟨s,hs,t,ht,hst,hwt⟩ := (difference_iff_tile_difference ha hb hk hm).mp hw
    have he : x+t=(x+(i*a+j*b))+s := by omega
    have hc := hpack x hx (x+(i*a+j*b)) hy t ht s hs he
    omega
  · intro hA x hx y hy s hs t ht he
    by_contra hne
    rcases lt_or_gt_of_ne hne with hxy | hyx
    · have hts : t < s := by omega
      have hw : y-x ∈ differences a b k m :=
        (difference_iff_tile_difference ha hb hk hm).mpr ⟨t,ht,s,hs,hts,by omega⟩
      obtain ⟨i,j,hi,hik,hj,hjm,hij,hw⟩ := mem_differences.mp hw
      have hy' : x+(i*a+j*b) ∈ A := by
        have hxy' : x+(i*a+j*b)=y := by omega
        rwa [hxy']
      exact hA x hx i j hi hik hj hjm hij hy'
    · have hst : s < t := by omega
      have hw : x-y ∈ differences a b k m :=
        (difference_iff_tile_difference ha hb hk hm).mpr ⟨s,hs,t,ht,hst,by omega⟩
      obtain ⟨i,j,hi,hik,hj,hjm,hij,hw⟩ := mem_differences.mp hw
      have hx' : y+(i*a+j*b) ∈ A := by
        have hyx' : y+(i*a+j*b)=x := by omega
        rwa [hyx']
      exact hA y hy i j hi hik hj hjm hij hx'

end NonmixedGap
