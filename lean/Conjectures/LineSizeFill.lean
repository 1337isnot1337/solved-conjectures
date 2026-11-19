import Conjectures.LineSizeGeneric

/-! Generic points fill a selected carrier without changing other carrier
counts or creating an unintended line with three points. -/
noncomputable section
namespace LineSize

def carrierPoints (P : Finset Point) (D : Carrier) : Finset Point := by
  classical
  exact P.filter (OnCarrier D)

@[simp] theorem mem_carrierPoints (P : Finset Point) (D : Carrier) (p : Point) :
    p ∈ carrierPoints P D ↔ p ∈ P ∧ OnCarrier D p := by
  classical
  simp [carrierPoints]

theorem carrierPoints_card_insert_on (P : Finset Point) (D : Carrier) (x : Point)
    (hx : x ∉ P) (hon : OnCarrier D x) :
    (carrierPoints (insert x P) D).card = (carrierPoints P D).card+1 := by
  classical
  have hn : x ∉ carrierPoints P D := fun h => hx ((mem_carrierPoints P D x).mp h).1
  have he : carrierPoints (insert x P) D = insert x (carrierPoints P D) := by
    simp [carrierPoints,Finset.filter_insert,hon]
  rw [he,Finset.card_insert_of_notMem hn]

theorem carrierPoints_insert_off (P : Finset Point) (D : Carrier) (x : Point)
    (hoff : ¬OnCarrier D x) :
    carrierPoints (insert x P) D = carrierPoints P D := by
  classical
  simp [carrierPoints,Finset.filter_insert,hoff]

theorem noExtraLine_insert_point (C : Finset Carrier) (P : Finset Point) (x : Point)
    (hP : NoExtraLine C P)
    (hsafe : ∀ p ∈ P, ∀ q ∈ P, p ≠ q → x ∈ line[ℝ,p,q] →
      ∃ c ∈ C, line[ℝ,p,q] = carrierLine c) :
    NoExtraLine C (insert x P) := by
  classical
  have oneNew : ∀ a b p q : Point, p ∈ P → q ∈ P → p ≠ q →
      p ∈ line[ℝ,a,b] → q ∈ line[ℝ,a,b] → x ∈ line[ℝ,a,b] →
      ∃ c ∈ C, line[ℝ,a,b] = carrierLine c := by
    intro a b p q hp hq hpq hpL hqL hxL
    have hL : line[ℝ,a,b] = line[ℝ,p,q] :=
      (affineSpan_pair_eq_of_mem_of_mem_of_ne hpL hqL hpq).symm
    obtain ⟨c,hc,he⟩ := hsafe p hp q hq hpq (hL ▸ hxL)
    exact ⟨c,hc,hL.trans he⟩
  intro a b p q r hp hq hr hpq hpr hqr hpL hqL hrL
  rcases Finset.mem_insert.mp hp with hpx | hpOld
  · subst p
    rcases Finset.mem_insert.mp hq with hqx | hqOld
    · exact (hpq hqx.symm).elim
    · rcases Finset.mem_insert.mp hr with hrx | hrOld
      · exact (hpr hrx.symm).elim
      · exact oneNew a b q r hqOld hrOld hqr hqL hrL hpL
  · rcases Finset.mem_insert.mp hq with hqx | hqOld
    · subst q
      rcases Finset.mem_insert.mp hr with hrx | hrOld
      · exact (hqr hrx.symm).elim
      · exact oneNew a b p r hpOld hrOld hpr hpL hrL hqL
    · rcases Finset.mem_insert.mp hr with hrx | hrOld
      · subst r
        exact oneNew a b p q hpOld hqOld hpq hpL hqL hrL
      · exact hP a b p q r hpOld hqOld hrOld hpq hpr hqr hpL hqL hrL

theorem exists_fill_point (C : Finset Carrier) (P : Finset Point) (D : Carrier)
    (hD : D ∈ C)
    (hslope : ∀ c ∈ C, ∀ d ∈ C, c ≠ d → c.slope ≠ d.slope)
    (hP : NoExtraLine C P) :
    ∃ x : Point, OnCarrier D x ∧ x ∉ P ∧
      (∀ c ∈ C, c ≠ D → ¬OnCarrier c x) ∧ NoExtraLine C (insert x P) := by
  classical
  let F := P ∪ forbiddenCrossings P (graphPoint D 0) (graphPoint D 1) ∪
    (C.erase D).image (meet D)
  obtain ⟨x,hxD,hxF⟩ := exists_point_avoiding D F
  have hxP : x ∉ P := by
    intro hp
    exact hxF (Finset.mem_union_left _ (Finset.mem_union_left _ hp))
  have hxother : ∀ c ∈ C, c ≠ D → ¬OnCarrier c x := by
    intro c hc hcD hxc
    have he := meet_unique D c (hslope D hD c hc hcD.symm) x hxD hxc
    apply hxF
    exact Finset.mem_union_right _ (Finset.mem_image.mpr
      ⟨c,Finset.mem_erase.mpr ⟨hcD,hc⟩,he.symm⟩)
  refine ⟨x,hxD,hxP,hxother,noExtraLine_insert_point C P x hP ?_⟩
  intro p hp q hq hpq hxL
  by_cases he : carrierLine D = line[ℝ,p,q]
  · exact ⟨D,hD,he.symm⟩
  · apply False.elim
    apply hxF
    apply Finset.mem_union_left
    apply Finset.mem_union_right
    exact secant_forbidden P (graphPoint D 0) (graphPoint D 1) p q x hp hq he
      ((mem_carrierLine D x).mpr hxD) hxL

theorem fill_carrier (C : Finset Carrier) (P : Finset Point) (D : Carrier)
    (hD : D ∈ C)
    (hslope : ∀ c ∈ C, ∀ d ∈ C, c ≠ d → c.slope ≠ d.slope)
    (hP : NoExtraLine C P) (m : ℕ) :
    ∃ Q : Finset Point, P ⊆ Q ∧ Q.card = P.card+m ∧ NoExtraLine C Q ∧
      ∀ c ∈ C, (carrierPoints Q c).card =
        (carrierPoints P c).card + if c=D then m else 0 := by
  classical
  induction m with
  | zero =>
    refine ⟨P,Finset.Subset.refl _,by simp,hP,?_⟩
    intro c hc
    simp
  | succ m ih =>
    obtain ⟨Q,hPQ,hcard,hQ,hcounts⟩ := ih
    obtain ⟨x,hxD,hxQ,hxother,hnew⟩ := exists_fill_point C Q D hD hslope hQ
    refine ⟨insert x Q,?_,?_,hnew,?_⟩
    · exact hPQ.trans (Finset.subset_insert _ _)
    · rw [Finset.card_insert_of_notMem hxQ,hcard]
      omega
    · intro c hc
      by_cases he : c=D
      · subst c
        rw [carrierPoints_card_insert_on Q D x hxQ hxD,hcounts D hD]
        simp only [ite_true]
        omega
      · rw [carrierPoints_insert_off Q c x (hxother c hc he),hcounts c hc]
        simp [he]

end LineSize
