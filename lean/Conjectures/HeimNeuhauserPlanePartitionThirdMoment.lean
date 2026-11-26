import Conjectures.HeimNeuhauserPlanePartitionMomentCellsOne
import Conjectures.HeimNeuhauserPlanePartitionMomentCellsTwo
import Conjectures.HeimNeuhauserPlanePartitionMomentCellsThree
import Conjectures.HeimNeuhauserPlanePartitionLargeRadius
import Conjectures.HeimNeuhauserPlanePartitionInversion

/-! The third-moment inequality for the entire saddle domain. -/

namespace PlanePartition

open Real
open scoped Interval

private def Covers (a : ℕ) : List ℕ → Prop
  | [] => 900 ≤ a
  | b :: rest => MomentCell a b ∧ Covers b rest

private theorem cover_bound {x r : ℝ} (hx : 1 ≤ x) (hr : 0 < r) (hr' : r < 9/10)
    (hn : 251 ≤ x * moment 0 r) {a : ℕ} {bs : List ℕ} (h : Covers a bs)
    (ha : (a : ℝ)/1000 ≤ r) : 9 * (x * moment 2 r)^2 ≤ (x * moment 1 r)^3 := by
  induction bs generalizing a with
  | nil =>
    have hb : (900 : ℝ) ≤ a := by exact_mod_cast (show 900 ≤ a from h)
    linarith
  | cons b rest ih =>
    by_cases hb : r ≤ (b : ℝ)/1000
    · exact thirdMoment_of_cell hx hr hr'.le hn ha hb h.1
    · exact ih h.2 (le_of_lt (not_le.mp hb))

/-- The centered third-moment bound holds for every allowed radius and parameter. -/
theorem thirdMoment_at_saddle {x r : ℝ} (hx : 1 ≤ x) (hr : r ∈ Set.Ioo (0 : ℝ) 1)
    (hn : 251 ≤ x * moment 0 r) : 9 * (x * moment 2 r)^2 ≤ (x * moment 1 r)^3 := by
  by_cases h : (9/10 : ℝ) ≤ r
  · exact largeRadius_thirdMoment hx h hr.2
  · have hcover : Covers 0 [56, 124, 197, 268, 333, 392, 443, 488, 527, 561, 590, 616, 638, 658, 675, 690, 703, 715, 725, 734, 742, 749, 756, 762, 767, 772, 776, 780, 784, 787, 790, 793, 795, 797, 799, 801, 803, 804, 805, 806, 807, 808, 809, 810, 812, 814, 816, 819, 822, 826, 831, 836, 842, 849, 857, 866, 876, 887, 899, 900] :=
      ⟨gammaCell000To056,
       gammaCell056To124,
       gammaCell124To197,
       gammaCell197To268,
       gammaCell268To333,
       gammaCell333To392,
       gammaCell392To443,
       gammaCell443To488,
       gammaCell488To527,
       gammaCell527To561,
       gammaCell561To590,
       gammaCell590To616,
       gammaCell616To638,
       gammaCell638To658,
       gammaCell658To675,
       gammaCell675To690,
       gammaCell690To703,
       gammaCell703To715,
       gammaCell715To725,
       gammaCell725To734,
       gammaCell734To742,
       gammaCell742To749,
       gammaCell749To756,
       gammaCell756To762,
       gammaCell762To767,
       gammaCell767To772,
       gammaCell772To776,
       gammaCell776To780,
       gammaCell780To784,
       gammaCell784To787,
       gammaCell787To790,
       gammaCell790To793,
       gammaCell793To795,
       gammaCell795To797,
       gammaCell797To799,
       gammaCell799To801,
       gammaCell801To803,
       gammaCell803To804,
       gammaCell804To805,
       gammaCell805To806,
       gammaCell806To807,
       gammaCell807To808,
       gammaCell808To809,
       gammaCell809To810,
       gammaCell810To812,
       gammaCell812To814,
       gammaCell814To816,
       gammaCell816To819,
       gammaCell819To822,
       gammaCell822To826,
       gammaCell826To831,
       gammaCell831To836,
       gammaCell836To842,
       gammaCell842To849,
       gammaCell849To857,
       gammaCell857To866,
       gammaCell866To876,
       gammaCell876To887,
       gammaCell887To899,
       gammaCell899To900, Nat.le_refl 900⟩
    exact cover_bound hx hr.1 (not_le.mp h) hn hcover (by simpa using hr.1.le)

/-- The unbounded Turán claim reduces to one explicit bound on the outer integral. -/
theorem strictTuran_of_outer_integral {x : ℝ} {n : ℕ} (hx : 1 ≤ x) (hn : 251 ≤ n)
    (htail : ∀ r ∈ Set.Ioo (0 : ℝ) 1, x * moment 0 r = n →
      -(2 / 5 : ℝ) ≤ ∫ u in (3 : ℝ)..(π * sqrt (x * moment 1 r)),
        OrdinaryDarcais.normalizedIntegrand (x * moment 1 r) (damping x r) (phase x r) u) :
    planePartition x (n - 1) * planePartition x (n + 1) < planePartition x n ^ 2 := by
  apply strictTuran_of_two_saddle_bounds hx hn _ htail
  intro r hr hs
  apply thirdMoment_at_saddle hx hr
  rw [hs]
  exact_mod_cast hn

end PlanePartition
