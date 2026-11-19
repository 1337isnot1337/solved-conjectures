import Conjectures.LonelinessFourSpeedCertificate

/-! The mandatory member `1` is inserted after enumerating the remaining
coordinates. This has exactly the same support coverage as `boundedSupports`
and avoids constructing subsets that would immediately be discarded. -/

namespace Loneliness.Modular.FourSpeed

def shiftTwo : ℕ ↪ ℕ := ⟨(·+2),fun _ _ h => Nat.add_right_cancel h⟩

theorem one_not_mem_shiftTwo (s : Finset ℕ) : 1∉s.map shiftTwo := by
  intro h
  obtain ⟨a,_ha,he⟩ := Finset.mem_map.mp h
  change a+2=1 at he
  omega

def insertShiftEmbedding : Finset ℕ ↪ Finset ℕ := by
  refine ⟨fun s => insert 1 (s.map shiftTwo),?_⟩
  intro a b h
  apply Finset.map_injective shiftTwo
  have he := congrArg (fun s : Finset ℕ => s.erase 1) h
  simpa only [Finset.erase_insert (one_not_mem_shiftTwo a),
    Finset.erase_insert (one_not_mem_shiftTwo b)] using he

theorem range_shiftTwo (h : ℕ) :
    (Finset.range (h-1)).map shiftTwo=Finset.Icc 2 h := by
  ext a
  simp only [Finset.mem_map,Finset.mem_range,Finset.mem_Icc]
  constructor
  · rintro ⟨b,hb,rfl⟩
    change 2≤b+2 ∧ b+2≤h
    constructor <;> omega
  · rintro ⟨ha,hb⟩
    refine ⟨a-2,by omega,?_⟩
    change a-2+2=a
    omega

def fastBoundedSupports (m r : ℕ) : Finset (Finset ℕ) :=
  ((Finset.range (m/2-1)).powersetCard (r-1)).map insertShiftEmbedding

theorem fastBoundedSupports_eq_image (m r : ℕ) :
    fastBoundedSupports m r=((Finset.Icc 2 (m/2)).powersetCard (r-1)).image (insert 1) := by
  unfold fastBoundedSupports
  rw [←range_shiftTwo (m/2),Finset.powersetCard_map]
  simp only [Finset.map_eq_image,Finset.image_image]
  rfl

theorem fastBoundedSupports_eq {m r : ℕ} (hm : 2≤m) (hr : 0<r) :
    fastBoundedSupports m r=boundedSupports m r := by
  ext s
  rw [fastBoundedSupports_eq_image,mem_boundedSupports_iff]
  constructor
  · intro h
    obtain ⟨t,ht,rfl⟩ := Finset.mem_image.mp h
    obtain ⟨hsub,hcard⟩ := Finset.mem_powersetCard.mp ht
    have hone : 1∉t := by
      intro h
      have := (Finset.mem_Icc.mp (hsub h)).1
      omega
    refine ⟨?_,?_,Finset.mem_insert_self 1 t⟩
    · intro a ha
      rcases Finset.mem_insert.mp ha with rfl | ha
      · constructor <;> omega
      · have hh := Finset.mem_Icc.mp (hsub ha)
        constructor <;> omega
    · rw [Finset.card_insert_of_notMem hone,hcard]
      omega
  · rintro ⟨hs,hcard,hone⟩
    apply Finset.mem_image.mpr
    refine ⟨s.erase 1,Finset.mem_powersetCard.mpr ⟨?_,?_⟩,Finset.insert_erase hone⟩
    · intro a ha
      obtain ⟨hne,ha⟩ := Finset.mem_erase.mp ha
      obtain ⟨hpos,hbound⟩ := hs a ha
      apply Finset.mem_Icc.mpr
      constructor <;> omega
    · rw [Finset.card_erase_of_mem hone,hcard]

def fastCoveredSupports (m r : ℕ) (inv : ℕ → ℕ) : Finset (Finset ℕ) :=
  if r=1 then fastBoundedSupports m r
  else (fastBoundedSupports m r).filter (PairNormalized m inv)

theorem fastCoveredSupports_eq {m r : ℕ} (hm : 2≤m) (hr : 0<r) (inv : ℕ → ℕ) :
    fastCoveredSupports m r inv=coveredSupports m r inv := by
  simp only [fastCoveredSupports,coveredSupports,normalizedSupports,
    fastBoundedSupports_eq hm hr]

def fastResidueCheck (num den m r : ℕ) (inv : ℕ → ℕ)
    (retained : Finset (Finset ℕ)) : Bool :=
  decide (∀ s∈fastCoveredSupports m r inv, rowCheck num den m retained s=true)

theorem fastResidueCheck_sound {num den m r : ℕ} (hm : 2≤m) (hr : 0<r)
    (inv : ℕ → ℕ) (retained : Finset (Finset ℕ))
    (hcheck : fastResidueCheck num den m r inv retained=true) :
    residueCheck num den m r inv retained=true := by
  simpa only [fastResidueCheck,residueCheck,fastCoveredSupports_eq hm hr inv] using hcheck

end Loneliness.Modular.FourSpeed
