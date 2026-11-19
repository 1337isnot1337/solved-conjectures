import Conjectures.LineSizeArrangement

/-! Adding all new carrier intersections preserves the absence of unintended
three-point lines. All lines here are actual affine lines in the real plane. -/
namespace LineSize

def NoExtraLine (C : Finset Carrier) (P : Finset Point) : Prop :=
  ∀ a b p q r : Point, p ∈ P → q ∈ P → r ∈ P →
    p ≠ q → p ≠ r → q ≠ r →
    p ∈ line[ℝ, a, b] → q ∈ line[ℝ, a, b] → r ∈ line[ℝ, a, b] →
    ∃ c ∈ C, line[ℝ, a, b] = carrierLine c

theorem line_eq_carrier_of_two (C : Carrier) (a b p q : Point)
    (hpC : OnCarrier C p) (hqC : OnCarrier C q) (hpq : p ≠ q)
    (hpL : p ∈ line[ℝ, a, b]) (hqL : q ∈ line[ℝ, a, b]) :
    line[ℝ, a, b] = carrierLine C := by
  have he := affineSpan_pair_eq_of_mem_of_mem_of_ne hpL hqL hpq
  exact he.symm.trans (carrierLine_pair C p q hpC hqC hpq)

theorem noExtraLine_insert (C : Finset Carrier) (P : Finset Point) (D : Carrier)
    (hP : NoExtraLine C P)
    (havoid : ∀ p ∈ P, ¬OnCarrier D p)
    (hsafe : ∀ c ∈ C, ∀ p ∈ P, ∀ q ∈ P,
      carrierLine c ≠ line[ℝ, p, q] → meet D c ∉ line[ℝ, p, q]) :
    NoExtraLine (insert D C) (P ∪ C.image (meet D)) := by
  classical
  let Q := C.image (meet D)
  have hQ : ∀ x ∈ Q, OnCarrier D x := by
    intro x hx
    obtain ⟨c,_,rfl⟩ := Finset.mem_image.mp hx
    exact meet_on_left D c
  have oneNew : ∀ a b p q x : Point, p ∈ P → q ∈ P → x ∈ Q → p ≠ q →
      p ∈ line[ℝ, a, b] → q ∈ line[ℝ, a, b] → x ∈ line[ℝ, a, b] →
      ∃ c ∈ insert D C, line[ℝ, a, b] = carrierLine c := by
    intro a b p q x hp hq hx hpq hpL hqL hxL
    have hL : line[ℝ, a, b] = line[ℝ, p, q] :=
      (affineSpan_pair_eq_of_mem_of_mem_of_ne hpL hqL hpq).symm
    obtain ⟨c,hc,rfl⟩ := Finset.mem_image.mp hx
    by_cases he : carrierLine c = line[ℝ, p, q]
    · exact ⟨c,Finset.mem_insert_of_mem hc,hL.trans he.symm⟩
    · apply False.elim
      apply hsafe c hc p hp q hq he
      rwa [← hL]
  have twoNew : ∀ a b p q x : Point, p ∈ Q → q ∈ Q → x ∈ P → p ≠ q →
      p ∈ line[ℝ, a, b] → q ∈ line[ℝ, a, b] → x ∈ line[ℝ, a, b] → False := by
    intro a b p q x hp hq hx hpq hpL hqL hxL
    have hL := line_eq_carrier_of_two D a b p q (hQ p hp) (hQ q hq) hpq hpL hqL
    rw [hL] at hxL
    exact havoid x hx ((mem_carrierLine D x).mp hxL)
  intro a b p q r hp hq hr hpq hpr hqr hpL hqL hrL
  rcases Finset.mem_union.mp hp with hp | hp
  · rcases Finset.mem_union.mp hq with hq | hq
    · rcases Finset.mem_union.mp hr with hr | hr
      · obtain ⟨c,hc,he⟩ := hP a b p q r hp hq hr hpq hpr hqr hpL hqL hrL
        exact ⟨c,Finset.mem_insert_of_mem hc,he⟩
      · exact oneNew a b p q r hp hq hr hpq hpL hqL hrL
    · rcases Finset.mem_union.mp hr with hr | hr
      · exact oneNew a b p r q hp hr hq hpr hpL hrL hqL
      · exact (twoNew a b q r p hq hr hp hqr hqL hrL hpL).elim
  · rcases Finset.mem_union.mp hq with hq | hq
    · rcases Finset.mem_union.mp hr with hr | hr
      · exact oneNew a b q r p hq hr hp hqr hqL hrL hpL
      · exact (twoNew a b p r q hp hr hq hpr hpL hrL hqL).elim
    · rcases Finset.mem_union.mp hr with hr | hr
      · exact (twoNew a b p q r hp hq hr hpq hpL hqL hrL).elim
      · exact ⟨D,Finset.mem_insert_self _ _,
          line_eq_carrier_of_two D a b p q (hQ p hp) (hQ q hq) hpq hpL hqL⟩

end LineSize
