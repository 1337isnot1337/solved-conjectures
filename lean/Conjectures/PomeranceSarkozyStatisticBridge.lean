module

public import Conjectures.PomeranceSarkozyActualCountMeasure

@[expose] public section
namespace PomeranceSarkozy

open Finset

/-- At a positive shifted integer, the literal divisibility count is the
restricted count of distinct prime factors. -/
theorem literalOffsetCount_eq_restrictedPrimeCount (I P : Finset ℕ)
    (hP : ∀ p ∈ P, p.Prime) (L N : ℕ) (j : Fin N) (h : ↥I)
    (hh : h.val < L + j.val) :
    literalOffsetCount I P L N j h = restrictedPrimeCount P (L + j.val - h.val) := by
  unfold literalOffsetCount restrictedPrimeCount
  congr 1
  ext p
  simp only [Finset.mem_filter, Finset.mem_inter]
  constructor
  · rintro ⟨hp, hdvd⟩
    exact ⟨hp, Nat.mem_primeFactors.mpr ⟨hP p hp, hdvd, (Nat.sub_pos_of_lt hh).ne'⟩⟩
  · rintro ⟨hp, hdvd⟩
    exact ⟨hp, (Nat.mem_primeFactors.mp hdvd).2.1⟩

private theorem card_filter_subtype (I : Finset ℕ)
    (p : ↥I → Prop) [DecidablePred p] (q : ℕ → Prop) [DecidablePred q]
    (heq : ∀ h : ↥I, p h ↔ q h.val) :
    ((Finset.univ : Finset ↥I).filter p).card = (I.filter q).card := by
  refine Finset.card_bij (fun h _ => h.val) ?_ ?_ ?_
  · intro h hh
    exact Finset.mem_filter.mpr ⟨h.property, (heq h).mp (Finset.mem_filter.mp hh).2⟩
  · intro h _ i _ hi
    exact Subtype.ext hi
  · intro h hh
    obtain ⟨hI, hq⟩ := Finset.mem_filter.mp hh
    exact ⟨⟨h, hI⟩, Finset.mem_filter.mpr ⟨Finset.mem_univ _, (heq ⟨h, hI⟩).mpr hq⟩, rfl⟩

/-- Bounds the source statistic by the number of exceeding coordinates and
the size of their threshold band, assuming the two arithmetic tails are absent. -/
theorem sourceG_literal_offset_count_bounds (P : Finset ℕ) (hP : ∀ p ∈ P, p.Prime)
    (L N H B : ℕ) (j : Fin N) (hn : 1 < L + j.val)
    (hvalid : ∀ h ∈ Icc 1 H, h < L + j.val)
    (hTail : ∀ h ∈ (sourceOffsetEvents (L + j.val)).erase 0, h ≤ H)
    (hSmall : ∀ h ∈ Icc 1 H, h < L + j.val →
      distinctPrimeCount (L + j.val - h) ≤ restrictedPrimeCount P (L + j.val - h) + B) :
    let I := Icc 1 H
    let v := literalOffsetCount I P L N j
    let e := ((univ : Finset ↥I).filter fun h => h.val < v h).card
    let b := ((univ : Finset ↥I).filter fun h => v h ≤ h.val ∧ h.val < v h + B).card
    1 + e ≤ sourceG (L + j.val) ∧ sourceG (L + j.val) ≤ 1 + e + b := by
  dsimp only
  have hv (h : ↥(Icc 1 H)) := literalOffsetCount_eq_restrictedPrimeCount
    (Icc 1 H) P hP L N j h (hvalid h.val h.property)
  have he : ((univ : Finset ↥(Icc 1 H)).filter fun h =>
      h.val < literalOffsetCount (Icc 1 H) P L N j h).card =
      (truncatedOffsets P (L + j.val) H).card := by
    unfold truncatedOffsets
    apply card_filter_subtype
    intro h
    rw [hv h]
    simp only [hvalid h.val h.property, true_and]
  have hb : ((univ : Finset ↥(Icc 1 H)).filter fun h =>
      literalOffsetCount (Icc 1 H) P L N j h ≤ h.val ∧
        h.val < literalOffsetCount (Icc 1 H) P L N j h + B).card =
      (thresholdBand P (L + j.val) H B).card := by
    unfold thresholdBand
    apply card_filter_subtype
    intro h
    rw [hv h]
    simp only [hvalid h.val h.property, true_and]
  rw [he, hb]
  exact sourceG_truncation_bounds P hn H B hTail hSmall

end PomeranceSarkozy
