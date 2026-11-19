import Conjectures.LineSizeGeneric

/-! Finite real-plane carrier arrangements in general position, with no
unintended three-point line among their pair intersections. -/
noncomputable section
namespace LineSize

structure Arrangement where
  carriers : Finset Carrier
  points : Finset Point
  slopes : ∀ c ∈ carriers, ∀ d ∈ carriers, c ≠ d → c.slope ≠ d.slope
  intersection_mem : ∀ c ∈ carriers, ∀ d ∈ carriers, c ≠ d → meet c d ∈ points
  point_source : ∀ p ∈ points, ∃ c ∈ carriers, ∃ d ∈ carriers, c ≠ d ∧ p = meet c d
  no_triple : ∀ c ∈ carriers, ∀ d ∈ carriers, ∀ e ∈ carriers,
    c ≠ d → c ≠ e → d ≠ e →
    ∀ p : Point, OnCarrier c p → OnCarrier d p → ¬OnCarrier e p
  no_extra : NoExtraLine carriers points

def Arrangement.empty : Arrangement where
  carriers := ∅
  points := ∅
  slopes := by simp
  intersection_mem := by simp
  point_source := by simp
  no_triple := by simp
  no_extra := by simp [NoExtraLine]

def Arrangement.add (A : Arrangement) (D : Carrier)
    (hslope : ∀ c ∈ A.carriers, D.slope ≠ c.slope)
    (havoid : ∀ p ∈ A.points, ¬OnCarrier D p)
    (hsafe : ∀ c ∈ A.carriers, ∀ p ∈ A.points, ∀ q ∈ A.points,
      carrierLine c ≠ line[ℝ, p, q] → meet D c ∉ line[ℝ, p, q]) : Arrangement := by
  classical
  have hD : D ∉ A.carriers := by
    intro hmem
    exact hslope D hmem rfl
  have hbad : ∀ c ∈ A.carriers, ∀ d ∈ A.carriers, c ≠ d →
      ∀ p : Point, OnCarrier D p → OnCarrier c p → OnCarrier d p → False := by
    intro c hc d hd hcd p hpD hpc hpd
    have hp := meet_unique c d (A.slopes c hc d hd hcd) p hpc hpd
    rw [hp] at hpD
    exact havoid _ (A.intersection_mem c hc d hd hcd) hpD
  refine {
    carriers := insert D A.carriers
    points := A.points ∪ A.carriers.image (meet D)
    slopes := ?_
    intersection_mem := ?_
    point_source := ?_
    no_triple := ?_
    no_extra := noExtraLine_insert A.carriers A.points D A.no_extra havoid hsafe }
  · intro c hc d hd hcd
    rcases Finset.mem_insert.mp hc with hcD | hcOld
    · subst c
      have hdOld := (Finset.mem_insert.mp hd).resolve_left hcd.symm
      exact hslope d hdOld
    · rcases Finset.mem_insert.mp hd with hdD | hdOld
      · subst d
        exact (hslope c hcOld).symm
      · exact A.slopes c hcOld d hdOld hcd
  · intro c hc d hd hcd
    rcases Finset.mem_insert.mp hc with hcD | hcOld
    · subst c
      have hdOld := (Finset.mem_insert.mp hd).resolve_left hcd.symm
      exact Finset.mem_union_right _ (Finset.mem_image.mpr ⟨d,hdOld,rfl⟩)
    · rcases Finset.mem_insert.mp hd with hdD | hdOld
      · subst d
        rw [meet_comm c D (hslope c hcOld).symm]
        exact Finset.mem_union_right _ (Finset.mem_image.mpr ⟨c,hcOld,rfl⟩)
      · exact Finset.mem_union_left _ (A.intersection_mem c hcOld d hdOld hcd)
  · intro p hp
    rcases Finset.mem_union.mp hp with hp | hp
    · obtain ⟨c,hc,d,hd,hcd,he⟩ := A.point_source p hp
      exact ⟨c,Finset.mem_insert_of_mem hc,d,Finset.mem_insert_of_mem hd,hcd,he⟩
    · obtain ⟨c,hc,rfl⟩ := Finset.mem_image.mp hp
      refine ⟨D,Finset.mem_insert_self _ _,c,Finset.mem_insert_of_mem hc,?_,rfl⟩
      intro he
      exact hD (he.symm ▸ hc)
  · intro c hc d hd e he hcd hce hde p hpc hpd hpe
    rcases Finset.mem_insert.mp hc with hcD | hcOld
    · subst c
      have hdOld := (Finset.mem_insert.mp hd).resolve_left hcd.symm
      have heOld := (Finset.mem_insert.mp he).resolve_left hce.symm
      exact hbad d hdOld e heOld hde p hpc hpd hpe
    · rcases Finset.mem_insert.mp hd with hdD | hdOld
      · subst d
        have heOld := (Finset.mem_insert.mp he).resolve_left hde.symm
        exact hbad c hcOld e heOld hce p hpd hpc hpe
      · rcases Finset.mem_insert.mp he with heD | heOld
        · subst e
          exact hbad c hcOld d hdOld hcd p hpe hpc hpd
        · exact A.no_triple c hcOld d hdOld e heOld hcd hce hde p hpc hpd hpe

@[simp] theorem Arrangement.add_carriers (A : Arrangement) (D : Carrier)
    (hslope : ∀ c ∈ A.carriers, D.slope ≠ c.slope)
    (havoid : ∀ p ∈ A.points, ¬OnCarrier D p)
    (hsafe : ∀ c ∈ A.carriers, ∀ p ∈ A.points, ∀ q ∈ A.points,
      carrierLine c ≠ line[ℝ, p, q] → meet D c ∉ line[ℝ, p, q]) :
    (A.add D hslope havoid hsafe).carriers = insert D A.carriers := rfl

theorem exists_arrangement (n : ℕ) : ∃ A : Arrangement, A.carriers.card = n := by
  induction n with
  | zero => exact ⟨Arrangement.empty,rfl⟩
  | succ n ih =>
    obtain ⟨A,hA⟩ := ih
    obtain ⟨D,hslope,havoid,hsafe⟩ :=
      exists_carrier_with_safe_crossings A.carriers A.points
    have hD : D ∉ A.carriers := by
      intro hd
      exact hslope D hd rfl
    refine ⟨A.add D hslope havoid hsafe,?_⟩
    rw [Arrangement.add_carriers,Finset.card_insert_of_notMem hD,hA]

end LineSize
