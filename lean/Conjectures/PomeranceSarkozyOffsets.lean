module
public import Mathlib.Data.Nat.Squarefree
public import Mathlib.Order.Interval.Finset.Nat
public import Mathlib.Data.Finset.Card

@[expose] public section
namespace PomeranceSarkozy

open Finset

/-- The number of distinct prime divisors, with Mathlib's convention at zero. -/
def distinctPrimeCount (m : ℕ) : ℕ := m.primeFactors.card

/-- The exact counting function in Erdős–Pomerance–Sárközy, §3. -/
def sourceG (n : ℕ) : ℕ :=
  ((Icc 1 n).filter fun m => n < m + distinctPrimeCount m).card

def sourceOffsetEvents (n : ℕ) : Finset ℕ :=
  (range n).filter fun h => h < distinctPrimeCount (n-h)

theorem mem_sourceOffsetEvents {n h : ℕ} :
    h ∈ sourceOffsetEvents n ↔ h < n ∧ h < distinctPrimeCount (n-h) := by
  simp [sourceOffsetEvents]

theorem sourceG_eq_offset_card (n : ℕ) : sourceG n = (sourceOffsetEvents n).card := by
  unfold sourceG
  refine Finset.card_bij (fun m _ => n-m) ?_ ?_ ?_
  · intro m hm
    obtain ⟨⟨hm₁,hm₂⟩,hm₃⟩ := Finset.mem_filter.mp hm |>.imp_left Finset.mem_Icc.mp
    rw [mem_sourceOffsetEvents]
    have he : n-(n-m)=m := by omega
    rw [he]
    omega
  · intro m hm m' hm' he
    have h₁ := (Finset.mem_Icc.mp (Finset.mem_filter.mp hm).1).2
    have h₂ := (Finset.mem_Icc.mp (Finset.mem_filter.mp hm').1).2
    omega
  · intro h hh
    obtain ⟨hh₁,hh₂⟩ := mem_sourceOffsetEvents.mp hh
    refine ⟨n-h,Finset.mem_filter.mpr ⟨Finset.mem_Icc.mpr ⟨by omega,by omega⟩,by omega⟩,?_⟩
    omega

theorem distinctPrimeCount_pos {n : ℕ} (hn : 1 < n) : 0 < distinctPrimeCount n := by
  apply Finset.card_pos.mpr
  refine ⟨n.minFac,Nat.mem_primeFactors.mpr ⟨Nat.minFac_prime (by omega),Nat.minFac_dvd _,?_⟩⟩
  omega

theorem sourceG_eq_one_add_positive_offsets {n : ℕ} (hn : 1 < n) :
    sourceG n = 1 + ((sourceOffsetEvents n).erase 0).card := by
  have hzero : 0∈sourceOffsetEvents n := mem_sourceOffsetEvents.mpr
    ⟨by omega,by simpa using distinctPrimeCount_pos hn⟩
  have hp := Finset.card_pos.mpr ⟨0,hzero⟩
  rw [sourceG_eq_offset_card,Finset.card_erase_of_mem hzero]
  omega

def restrictedPrimeCount (P : Finset ℕ) (m : ℕ) : ℕ :=
  (P∩m.primeFactors).card

theorem restrictedPrimeCount_le (P : Finset ℕ) (m : ℕ) :
    restrictedPrimeCount P m ≤ distinctPrimeCount m :=
  Finset.card_le_card Finset.inter_subset_right

def truncatedOffsets (P : Finset ℕ) (n H : ℕ) : Finset ℕ :=
  (Icc 1 H).filter fun h => h < n ∧ h < restrictedPrimeCount P (n-h)

def thresholdBand (P : Finset ℕ) (n H B : ℕ) : Finset ℕ :=
  (Icc 1 H).filter fun h =>
    h < n ∧ restrictedPrimeCount P (n-h) ≤ h ∧ h < restrictedPrimeCount P (n-h)+B

theorem truncatedOffsets_subset (P : Finset ℕ) (n H : ℕ) :
    truncatedOffsets P n H ⊆ (sourceOffsetEvents n).erase 0 := by
  intro h hh
  obtain ⟨hi,hN,hW⟩ := Finset.mem_filter.mp hh
  exact Finset.mem_erase.mpr ⟨by have := (Finset.mem_Icc.mp hi).1; omega,
    mem_sourceOffsetEvents.mpr ⟨hN,hW.trans_le (restrictedPrimeCount_le P _)⟩⟩

/-- Exact finite form of the near-threshold comparison in written §3.
The only omissions on a good sample are in the explicit threshold band. -/
theorem positiveOffset_difference_subset_band (P : Finset ℕ) (n H B : ℕ)
    (hTail : ∀ h ∈ (sourceOffsetEvents n).erase 0,h≤H)
    (hSmall : ∀ h ∈ Icc 1 H, h < n →
      distinctPrimeCount (n-h) ≤ restrictedPrimeCount P (n-h)+B) :
    ((sourceOffsetEvents n).erase 0 \ truncatedOffsets P n H) ⊆ thresholdBand P n H B := by
  intro h hm
  obtain ⟨he,hn⟩ := Finset.mem_sdiff.mp hm
  obtain ⟨hN,hω⟩ := mem_sourceOffsetEvents.mp (Finset.mem_erase.mp he).2
  have hI : h∈Icc 1 H := Finset.mem_Icc.mpr
    ⟨by have := (Finset.mem_erase.mp he).1; omega,hTail h he⟩
  have hle : restrictedPrimeCount P (n-h) ≤ h := by
    by_contra! hlt
    exact hn (Finset.mem_filter.mpr ⟨hI,hN,hlt⟩)
  exact Finset.mem_filter.mpr ⟨hI,hN,hle,hω.trans_le (hSmall h hI hN)⟩

theorem sourceG_truncation_bounds (P : Finset ℕ) {n : ℕ} (hn : 1 < n) (H B : ℕ)
    (hTail : ∀ h ∈ (sourceOffsetEvents n).erase 0,h≤H)
    (hSmall : ∀ h ∈ Icc 1 H,h < n →
      distinctPrimeCount (n-h) ≤ restrictedPrimeCount P (n-h)+B) :
    1+(truncatedOffsets P n H).card ≤ sourceG n ∧
      sourceG n ≤ 1+(truncatedOffsets P n H).card+(thresholdBand P n H B).card := by
  rw [sourceG_eq_one_add_positive_offsets hn]
  have hs := truncatedOffsets_subset P n H
  have hc := Finset.card_le_card hs
  have he := Finset.card_le_card (positiveOffset_difference_subset_band P n H B hTail hSmall)
  rw [Finset.card_sdiff_of_subset hs] at he
  omega

end PomeranceSarkozy
