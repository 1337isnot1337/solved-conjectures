import Conjectures.HadamardBorderAssemblyMain
import Mathlib.GroupTheory.Index
import Mathlib.GroupTheory.QuotientGroup.Defs

/-!
# The fixed-border construction from an index-four subgroup

The quotient map is constructed from the stated subgroup. Surjectivity,
the quotient cardinality, and the kernel identification are supplied by the
quotient-group APIs, so the final hypotheses mention no chosen quotient map.
-/

namespace HadamardBorderConstruction

open Matrix
open HadamardBorderNormalizationTransport
open HadamardFixedBorder

variable {G : Type*} [Fintype G] [AddCommGroup G]

theorem exists_hadamard_fin_of_subgroup_correlation
    (H : AddSubgroup G) (f : Rows G) (hindex : H.index = 4)
    (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if u ∈ H then -12 else 4) :
    ∃ M : Matrix (Fin (4 * Fintype.card G + 12))
        (Fin (4 * Fintype.card G + 12)) ℤ,
      SignMatrix M ∧ M * Mᵀ = (4 * (Fintype.card G : ℤ) + 12) • 1 := by
  classical
  letI : Fintype (G ⧸ H) := Fintype.ofFinite _
  have hQ : Fintype.card (G ⧸ H) = 4 := by
    simpa only [AddSubgroup.index, Nat.card_eq_fintype_card] using hindex
  apply exists_hadamard_fin_of_correlation
    (QuotientAddGroup.mk' H) (QuotientAddGroup.mk'_surjective H) f hQ hf
  intro u hu
  simpa only [QuotientAddGroup.mk'_apply, QuotientAddGroup.eq_zero_iff] using hcorr u hu

theorem exists_hadamard_2396_of_subgroup_correlation
    (H : AddSubgroup G) (f : Rows G) (hindex : H.index = 4)
    (hH : Nat.card H = 149) (hf : ∀ i, SignValued (f i))
    (hcorr : ∀ u : G, u ≠ 0 → combinedCorrelation f u =
      if u ∈ H then -12 else 4) :
    ∃ M : Matrix (Fin 2396) (Fin 2396) ℤ,
      SignMatrix M ∧ M * Mᵀ = (2396 : ℤ) • 1 := by
  classical
  letI : Fintype (G ⧸ H) := Fintype.ofFinite _
  have hQ : Fintype.card (G ⧸ H) = 4 := by
    simpa only [AddSubgroup.index, Nat.card_eq_fintype_card] using hindex
  have hkernel : Nat.card (QuotientAddGroup.mk' H).ker = 149 := by
    simpa only [QuotientAddGroup.ker_mk'] using hH
  apply exists_hadamard_2396_of_correlation
    (QuotientAddGroup.mk' H) (QuotientAddGroup.mk'_surjective H) f hQ hkernel hf
  intro u hu
  simpa only [QuotientAddGroup.mk'_apply, QuotientAddGroup.eq_zero_iff] using hcorr u hu

end HadamardBorderConstruction
