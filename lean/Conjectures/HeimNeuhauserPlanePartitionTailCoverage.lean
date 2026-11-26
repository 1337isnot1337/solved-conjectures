import Conjectures.HeimNeuhauserPlanePartitionTailCellsOne
import Conjectures.HeimNeuhauserPlanePartitionTailCellsTwo
import Conjectures.HeimNeuhauserPlanePartitionTailCellsThree
import Conjectures.HeimNeuhauserPlanePartitionTailInterval

/-! Coverage of the full continuous saddle domain by the rational tail bounds. -/

namespace PlanePartition

private def RadiusCover (a : ℕ) : List ℕ → Prop
  | [] => 900 ≤ a
  | b :: rest => b ≤ 900 ∧ TailCell a b ∧ RadiusCover b rest

private theorem tailParameters_covered {x r : ℝ} (hx : 1 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (hr' : r < 9/10) (hn : 251 ≤ x*moment 0 r) {a : ℕ} {bs : List ℕ} (h : RadiusCover a bs)
    (ha : (gridPoint a : ℝ) ≤ r) : TailParameters x r := by
  induction bs generalizing a with
  | nil =>
    have hh : (900 : ℝ) ≤ a := by exact_mod_cast (show 900 ≤ a from h)
    rw [gridPoint_cast] at ha
    linarith
  | cons b rest ih =>
    by_cases hb : r ≤ (gridPoint b : ℝ)
    · exact tailParameters_of_cell hx hr hr'.le hn ha hb h.1 h.2.1
    · exact ih h.2.2 (le_of_lt (not_le.mp hb))

theorem tailParameters_at_saddle {x r : ℝ} (hx : 1 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (hn : 251 ≤ x*moment 0 r) : TailParameters x r := by
  by_cases h : (9/10 : ℝ) ≤ r
  · exact large_radius_tail hx hr h
  · have hc : RadiusCover 0 [228, 250, 261, 273, 285, 298, 312, 327, 342, 358, 374, 391, 408, 425, 442, 459, 476, 493, 510, 526, 542, 558, 573, 588, 603, 617, 631, 644, 657, 670, 682, 694, 705, 716, 727, 737, 747, 756, 765, 774, 782, 790, 797, 803, 807, 813, 820, 827, 833, 839, 845, 851, 857, 862, 867, 872, 877, 882, 886, 890, 894, 898, 900] :=
      ⟨by decide, tailCell000To228,
       by decide, tailCell228To250,
       by decide, tailCell250To261,
       by decide, tailCell261To273,
       by decide, tailCell273To285,
       by decide, tailCell285To298,
       by decide, tailCell298To312,
       by decide, tailCell312To327,
       by decide, tailCell327To342,
       by decide, tailCell342To358,
       by decide, tailCell358To374,
       by decide, tailCell374To391,
       by decide, tailCell391To408,
       by decide, tailCell408To425,
       by decide, tailCell425To442,
       by decide, tailCell442To459,
       by decide, tailCell459To476,
       by decide, tailCell476To493,
       by decide, tailCell493To510,
       by decide, tailCell510To526,
       by decide, tailCell526To542,
       by decide, tailCell542To558,
       by decide, tailCell558To573,
       by decide, tailCell573To588,
       by decide, tailCell588To603,
       by decide, tailCell603To617,
       by decide, tailCell617To631,
       by decide, tailCell631To644,
       by decide, tailCell644To657,
       by decide, tailCell657To670,
       by decide, tailCell670To682,
       by decide, tailCell682To694,
       by decide, tailCell694To705,
       by decide, tailCell705To716,
       by decide, tailCell716To727,
       by decide, tailCell727To737,
       by decide, tailCell737To747,
       by decide, tailCell747To756,
       by decide, tailCell756To765,
       by decide, tailCell765To774,
       by decide, tailCell774To782,
       by decide, tailCell782To790,
       by decide, tailCell790To797,
       by decide, tailCell797To803,
       by decide, tailCell803To807,
       by decide, tailCell807To813,
       by decide, tailCell813To820,
       by decide, tailCell820To827,
       by decide, tailCell827To833,
       by decide, tailCell833To839,
       by decide, tailCell839To845,
       by decide, tailCell845To851,
       by decide, tailCell851To857,
       by decide, tailCell857To862,
       by decide, tailCell862To867,
       by decide, tailCell867To872,
       by decide, tailCell872To877,
       by decide, tailCell877To882,
       by decide, tailCell882To886,
       by decide, tailCell886To890,
       by decide, tailCell890To894,
       by decide, tailCell894To898,
       by decide, tailCell898To900, Nat.le_refl 900⟩
    apply tailParameters_covered hx hr (not_le.mp h) hn hc
    simpa only [gridPoint_cast, Nat.cast_zero, zero_div] using hr.1.le

end PlanePartition
