import Conjectures.HadamardLegendreReduction
import Conjectures.HadamardLegendreQuotientData
import Conjectures.HadamardQuotient133Main

/-!
# The common multiplier group of a length-1197 Legendre pair has order at most nine

The hypotheses are the original sign rows and their Legendre-pair correlation
equation on an arbitrary abelian group of order 1197. Each automorphism may
translate the two rows separately; row interchange is excluded by the
definition of commonMultiplierGroup. Centering and a proved coordinate
equivalence supply the actual fixed rows used by the finite no-lift theorem.
No finite certificate, quotient-data object, or common-multiplier-order premise is assumed.
-/

namespace HadamardLegendre

open HadamardQuotient133

theorem quotientData133_false (data : QuotientData133) : False := by
  have hsmall (i : Fin 2) (k j l : Fin 3) :
      data.layers i k j l ∈ smallDigits := by
    obtain ⟨habs, hodd⟩ := data.layer_bound i k j l
    exact (mem_smallDigits_iff _).mpr
      ⟨(abs_le.mp habs).1, (abs_le.mp habs).2, hodd⟩
  exact quotient133_no_lift (data.rows 0) (data.rows 1)
    (data.bounded 0) (data.bounded 1) (data.row_sum 0) (data.row_sum 1)
    data.correlation133 (data.layers 0) (data.layers 1)
    (hsmall 0) (hsmall 1) (data.layer_sum 0) (data.layer_sum 1)
    data.correlation21

variable {G : Type*} [AddCommGroup G] [Fintype G]

theorem common_multiplier_card_ne_twenty_seven
    (f : Rows2 G) (hf : IsLegendrePair f) (hcard : Fintype.card G = 1197) :
    Nat.card (commonMultiplierGroup f) ≠ 27 := by
  classical
  intro h27
  have hG : Nat.card G = 1197 := by
    simpa only [Nat.card_eq_fintype_card] using hcard
  obtain ⟨S, _, hR, ⟨e⟩⟩ := exists_domain_equiv1197 hG
  let : Fintype (G ⧸ S) := Fintype.ofFinite _
  let g := reindexRows e (centeredRows f)
  have hg : IsLegendrePair g :=
    reindexRows_isLegendrePair e (centeredRows f) (centeredRows_isLegendrePair f hf)
  have hsum (i : Fin 2) : rowSum (g i) = 1 :=
    (reindexRows_rowSum e (centeredRows f) i).trans (centeredRows_rowSum f hf i)
  have hcards : Nat.card (commonMultiplierGroup f) = Nat.card (fixedMultiplierGroup g) := by
    rw [commonMultiplierGroup_eq_fixed_centeredRows f hf]
    exact card_fixedMultiplierGroup_reindex e (centeredRows f)
  obtain ⟨data⟩ := quotientData133_of_fixed_card27 hR g hg hsum
    (fixedMultiplierGroup g) le_rfl (hcards.symm.trans h27)
  exact quotientData133_false data

theorem common_multiplier_card_le_nine
    (f : Rows2 G) (hf : IsLegendrePair f) (hcard : Fintype.card G = 1197) :
    Nat.card (commonMultiplierGroup f) ≤ 9 :=
  common_multiplier_card_le_nine_of_ne_twenty_seven f hf hcard
    (common_multiplier_card_ne_twenty_seven f hf hcard)

end HadamardLegendre
