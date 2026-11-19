import Conjectures.LineSizeImported.SylvesterGallai
import Conjectures.LineSizeGeometry
import Mathlib.LinearAlgebra.AffineSpace.FiniteDimensional

/-! The coordinate Sylvester–Gallai theorem gives an actual affine line
containing exactly two points of any finite noncollinear real-plane set. -/
namespace LineSize

theorem lineMap_coordinates (a b : Point) (t : ℝ) :
    AffineMap.lineMap a b t =
      (a.1+t*(b.1-a.1),a.2+t*(b.2-a.2)) := by
  rw [AffineMap.lineMap_apply_module']
  apply Prod.ext
  · change t*(b.1-a.1)+a.1=a.1+t*(b.1-a.1)
    ring
  · change t*(b.2-a.2)+a.2=a.2+t*(b.2-a.2)
    ring

theorem coordinate_collinear_iff_mem_line (a b r : Point) (hab : a ≠ b) :
    SylvesterGallai.Collinear a b r ↔ r ∈ line[ℝ,a,b] := by
  rw [mem_affineSpan_pair_iff_exists_lineMap_eq]
  constructor
  · intro h
    obtain ⟨t,ht⟩ := (SylvesterGallai.collinear_iff_param a b r hab).mp h
    exact ⟨t,(lineMap_coordinates a b t).trans ht.symm⟩
  · rintro ⟨t,rfl⟩
    rw [lineMap_coordinates]
    exact SylvesterGallai.collinear_of_param a b t

theorem coordinate_setCollinear_iff (P : Finset Point) :
    SylvesterGallai.SetCollinear P ↔ Collinear ℝ (P : Set Point) := by
  classical
  constructor
  · intro h
    by_cases hP : P.Nonempty
    · obtain ⟨a,ha⟩ := hP
      apply (collinear_iff_of_mem (k := ℝ) (show a ∈ (P : Set Point) from ha)).mpr
      by_cases hsingle : ∀ q ∈ P, q=a
      · refine ⟨(0 : Point),?_⟩
        intro q hq
        refine ⟨0,?_⟩
        rw [zero_smul,zero_vadd]
        exact hsingle q hq
      · push Not at hsingle
        obtain ⟨b,hb,hba⟩ := hsingle
        refine ⟨(b -ᵥ a : Point),?_⟩
        intro q hq
        have hline : q ∈ line[ℝ,a,b] :=
          (coordinate_collinear_iff_mem_line a b q hba.symm).mp (h a ha b hb q hq)
        obtain ⟨t,ht⟩ := mem_affineSpan_pair_iff_exists_lineMap_eq.mp hline
        exact ⟨t,by simpa only [AffineMap.lineMap_apply] using ht.symm⟩
    · have hP0 : P=∅ := Finset.not_nonempty_iff_eq_empty.mp hP
      subst P
      simpa only [Finset.coe_empty] using (collinear_empty ℝ Point)
  · intro h a ha b hb r hr
    by_cases hab : a=b
    · subst b
      exact SylvesterGallai.collinear_self_left a r
    · exact (coordinate_collinear_iff_mem_line a b r hab).mpr
        (h.mem_affineSpan_of_mem_of_ne ha hb hr hab)

theorem linePoints_eq_self_of_collinear (P : Finset Point)
    (hP : Collinear ℝ (P : Set Point)) (a b : Point)
    (ha : a ∈ P) (hb : b ∈ P) (hab : a ≠ b) :
    linePoints P a b=P := by
  ext r
  constructor
  · intro hr
    exact ((mem_linePoints P a b r).mp hr).1
  · intro hr
    exact (mem_linePoints P a b r).mpr
      ⟨hr,hP.mem_affineSpan_of_mem_of_ne ha hb hr hab⟩

theorem hasLineSize_eq_card_of_collinear (P : Finset Point)
    (hP : Collinear ℝ (P : Set Point)) {d : ℕ} (hd : HasLineSize P d) :
    d=P.card := by
  obtain ⟨a,ha,b,hb,hab,hsize⟩ := hd
  rw [linePoints_eq_self_of_collinear P hP a b ha hb hab] at hsize
  exact hsize.symm

theorem not_collinear_of_distinct_sizes (P : Finset Point) {d e : ℕ}
    (hd : HasLineSize P d) (he : HasLineSize P e) (hne : d ≠ e) :
    ¬Collinear ℝ (P : Set Point) := by
  intro hP
  exact hne ((hasLineSize_eq_card_of_collinear P hP hd).trans
    (hasLineSize_eq_card_of_collinear P hP he).symm)

theorem linePoints_eq_pair_of_ordinary (P : Finset Point) (a b : Point)
    (h : SylvesterGallai.IsOrdinaryLine P a b) :
    linePoints P a b={a,b} := by
  classical
  obtain ⟨ha,hb,hab,hordinary⟩ := h
  ext r
  constructor
  · intro hr
    obtain ⟨hrP,hrline⟩ := (mem_linePoints P a b r).mp hr
    have hcol := (coordinate_collinear_iff_mem_line a b r hab).mpr hrline
    rcases hordinary r hrP hcol with rfl | rfl <;> simp
  · intro hr
    simp only [Finset.mem_insert,Finset.mem_singleton] at hr
    rcases hr with hr | hr
    · subst r
      exact (mem_linePoints P a b a).mpr ⟨ha,left_mem_affineSpan_pair ℝ a b⟩
    · subst r
      exact (mem_linePoints P a b b).mpr ⟨hb,right_mem_affineSpan_pair ℝ a b⟩

theorem hasLineSize_two_of_coordinate_noncollinear (P : Finset Point)
    (hP : ¬SylvesterGallai.SetCollinear P) : HasLineSize P 2 := by
  classical
  obtain ⟨a,ha,b,hb,hab,hordinary⟩ := SylvesterGallai.sylvester_gallai P hP
  refine ⟨a,ha,b,hb,hab,?_⟩
  rw [linePoints_eq_pair_of_ordinary P a b hordinary]
  simp [hab]

/-- Every finite noncollinear set of actual real-plane points has a
determined affine line containing exactly two of its points. -/
theorem ordinary_line_exists (P : Finset Point)
    (hP : ¬Collinear ℝ (P : Set Point)) : HasLineSize P 2 :=
  hasLineSize_two_of_coordinate_noncollinear P
    (fun h => hP ((coordinate_setCollinear_iff P).mp h))

theorem ordinary_line_exists_of_distinct_sizes (P : Finset Point) {d e : ℕ}
    (hd : HasLineSize P d) (he : HasLineSize P e) (hne : d ≠ e) :
    HasLineSize P 2 :=
  ordinary_line_exists P (not_collinear_of_distinct_sizes P hd he hne)

theorem ordinary_line_exists_of_triangle (P : Finset Point) (a b c : Point)
    (ha : a ∈ P) (hb : b ∈ P) (hc : c ∈ P) (hab : a ≠ b)
    (hnot : c ∉ line[ℝ,a,b]) : HasLineSize P 2 := by
  apply hasLineSize_two_of_coordinate_noncollinear P
  intro h
  exact hnot ((coordinate_collinear_iff_mem_line a b c hab).mp (h a ha b hb c hc))

end LineSize
