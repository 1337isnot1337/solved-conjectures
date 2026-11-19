import Conjectures.HadamardLegendreInvolutions
import Conjectures.HadamardLegendreKernel
import Conjectures.HadamardLegendreTransfer

/-!
# The original length-1197 multiplier group has order dividing 27

The hypotheses are the original actual sign rows and their off-zero
correlations. Row sums, centering, product coordinates, absence of
involutions and injectivity away from the order-nine factor are all
derived. The final finite quotient packet must still exclude order 27
to sharpen this component bound to nine.
-/

namespace HadamardLegendre

variable {G : Type*} [AddCommGroup G] [Fintype G]

theorem common_multiplier_card_dvd_twenty_seven
    (f : Rows2 G) (hf : IsLegendrePair f) (hcard : Fintype.card G = 1197) :
    Nat.card (commonMultiplierGroup f) ∣ 27 := by
  classical
  have hG : Nat.card G = 1197 := by
    simpa only [Nat.card_eq_fintype_card] using hcard
  obtain ⟨S, _, hR, ⟨e⟩⟩ := exists_domain_equiv1197 hG
  let : Fintype (G ⧸ S) := Fintype.ofFinite _
  let g := reindexRows e (centeredRows f)
  have hg : IsLegendrePair g :=
    reindexRows_isLegendrePair e (centeredRows f) (centeredRows_isLegendrePair f hf)
  have hcards : Nat.card (commonMultiplierGroup f) = Nat.card (fixedMultiplierGroup g) := by
    rw [commonMultiplierGroup_eq_fixed_centeredRows f hf]
    exact card_fixedMultiplierGroup_reindex e (centeredRows f)
  have hodd : Odd (Nat.card (fixedMultiplierGroup g)) := by
    rw [← hcards]
    exact commonMultiplierGroup_odd_card f hf hcard
  rw [hcards]
  exact odd_fixed_multiplier_card_dvd_twenty_seven hR g hg
    (fixedMultiplierGroup g) le_rfl hodd

theorem common_multiplier_card_le_twenty_seven
    (f : Rows2 G) (hf : IsLegendrePair f) (hcard : Fintype.card G = 1197) :
    Nat.card (commonMultiplierGroup f) ≤ 27 :=
  Nat.le_of_dvd (by decide) (common_multiplier_card_dvd_twenty_seven f hf hcard)

theorem multiplier_subgroup_card_dvd_twenty_seven
    (f : Rows2 G) (hf : IsLegendrePair f) (hcard : Fintype.card G = 1197)
    (U : Subgroup (Multiplicative (AddAut G))) (hU : U ≤ commonMultiplierGroup f) :
    Nat.card U ∣ 27 :=
  (Subgroup.card_dvd_of_le hU).trans (common_multiplier_card_dvd_twenty_seven f hf hcard)

theorem common_multiplier_card_le_nine_of_ne_twenty_seven
    (f : Rows2 G) (hf : IsLegendrePair f) (hcard : Fintype.card G = 1197)
    (hnot : Nat.card (commonMultiplierGroup f) ≠ 27) :
    Nat.card (commonMultiplierGroup f) ≤ 9 :=
  (divisor_twenty_seven_le_nine_or_eq _ (common_multiplier_card_dvd_twenty_seven f hf hcard))
    .resolve_right hnot

end HadamardLegendre
