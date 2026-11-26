module
public import Conjectures.PomeranceSarkozyOffsets
public import Mathlib.Data.Finset.Powerset
public import Mathlib.Data.Rat.Cast.Order
public import Mathlib.Tactic

@[expose] public section
namespace PomeranceSarkozy

open Finset
open Classical

def primeTailSamples (P : Finset ℕ) (L X h a : ℕ) : Finset ℕ :=
  (Icc L X).filter fun n => h < n ∧ a ≤ restrictedPrimeCount P (n-h)

def multipleSamples (L X h d : ℕ) : Finset ℕ :=
  (Icc L X).filter fun n => h < n ∧ d∣n-h

theorem selectedPrimeProduct_dvd {S : Finset ℕ} {m : ℕ} (h : S⊆m.primeFactors) :
    (∏ p ∈ S,p) ∣ m :=
  (Finset.prod_dvd_prod_of_subset S m.primeFactors id h).trans (Nat.prod_primeFactors_dvd m)

theorem primeTail_witness {P : Finset ℕ} {L X h a n : ℕ}
    (hn : n∈primeTailSamples P L X h a) :
    ∃ S ∈ P.powersetCard a,n∈multipleSamples L X h (∏ p ∈ S,p) := by
  obtain ⟨hnI,hnH,hnω⟩ := Finset.mem_filter.mp hn
  obtain ⟨S,hSub,hCard⟩ := Finset.exists_subset_card_eq hnω
  exact ⟨S,Finset.mem_powersetCard.mpr ⟨hSub.trans Finset.inter_subset_left,hCard⟩,
    Finset.mem_filter.mpr ⟨hnI,hnH,selectedPrimeProduct_dvd (hSub.trans Finset.inter_subset_right)⟩⟩

theorem multipleSamples_card_le (L X h d : ℕ) (hd : 0 < d) :
    (multipleSamples L X h d).card ≤ X/d := by
  have he : (Icc 1 (X/d)).card = X/d := by simp
  rw [← he]
  apply Finset.card_le_card_of_injOn (fun n : ℕ => (n-h)/d)
  · intro n hn
    obtain ⟨hnI,hnH,hnD⟩ := Finset.mem_filter.mp hn
    have hN : n ≤ X := (Finset.mem_Icc.mp hnI).2
    have hdiv : d≤n-h := Nat.le_of_dvd (Nat.sub_pos_of_lt hnH) hnD
    have hlo : 1≤(n-h)/d := (Nat.le_div_iff_mul_le hd).mpr (by simpa using hdiv)
    have hup := Nat.div_le_div_right ((Nat.sub_le n h).trans hN) (c:=d)
    exact Finset.mem_Icc.mpr ⟨hlo,hup⟩
  · intro n hn n' hn' heq
    obtain ⟨_,hN,hD⟩ := Finset.mem_filter.mp hn
    obtain ⟨_,hN',hD'⟩ := Finset.mem_filter.mp hn'
    have hmul := congrArg (fun y : ℕ => y*d) heq
    rw [Nat.div_mul_cancel hD,Nat.div_mul_cancel hD'] at hmul
    omega

/-- Finite witness-union bound for an arbitrary shifted sample interval.
The endpoint uses actual prime factors and exact quotient floors. -/
theorem shifted_prime_tail_count (P : Finset ℕ) (hP : ∀ p∈P,p.Prime) (L X h a : ℕ) :
    (primeTailSamples P L X h a).card ≤ ∑ S ∈ P.powersetCard a,X/(∏ p ∈ S,p) := by
  let f (S : Finset ℕ) := multipleSamples L X h (∏ p ∈ S,p)
  have hsub : primeTailSamples P L X h a ⊆ (P.powersetCard a).biUnion f := by
    intro n hn
    exact Finset.mem_biUnion.mpr (primeTail_witness hn)
  calc
    _ ≤ ((P.powersetCard a).biUnion f).card := Finset.card_le_card hsub
    _ ≤ ∑ S ∈ P.powersetCard a,(f S).card := Finset.card_biUnion_le
    _ ≤ _ := Finset.sum_le_sum (fun S hS => by
      apply multipleSamples_card_le
      apply Finset.prod_pos
      intro p hp
      exact (hP p ((Finset.mem_powersetCard.mp hS).1 hp)).pos)

/-- The same arithmetic bound in rational form before the factorial
symmetric-sum estimate. -/
theorem shifted_prime_tail_reciprocal (P : Finset ℕ) (hP : ∀ p∈P,p.Prime) (L X h a : ℕ) :
    ((primeTailSamples P L X h a).card:ℚ) ≤
      (X:ℚ)*∑ S ∈ P.powersetCard a,∏ p ∈ S,(p:ℚ)⁻¹ := by
  have hn := shifted_prime_tail_count P hP L X h a
  calc
    _ ≤ ((∑ S ∈ P.powersetCard a,X/(∏ p ∈ S,p):ℕ):ℚ) := by exact_mod_cast hn
    _ = ∑ S ∈ P.powersetCard a,((X/(∏ p ∈ S,p):ℕ):ℚ) := Nat.cast_sum _ _
    _ ≤ _ := by
      rw [Finset.mul_sum]
      apply Finset.sum_le_sum
      intro S hS
      let d := ∏ p∈S,p
      have hd : 0 < d := Finset.prod_pos (fun p hp => (hP p ((Finset.mem_powersetCard.mp hS).1 hp)).pos)
      have hrd : 0 < (d:ℚ) := by exact_mod_cast hd
      have he : (d:ℚ) = ∏ p ∈ S,(p:ℚ) := by dsimp [d]; exact Nat.cast_prod _ _
      change ((X/d:ℕ):ℚ)≤(X:ℚ)*(∏ p ∈ S,(p:ℚ)⁻¹)
      rw [Finset.prod_inv_distrib,← he,← div_eq_mul_inv]
      apply (le_div_iff₀ hrd).mpr
      exact_mod_cast Nat.div_mul_le_self X d

end PomeranceSarkozy
