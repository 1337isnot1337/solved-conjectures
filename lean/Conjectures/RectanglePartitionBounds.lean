import Conjectures.RectangleEncoding
import Mathlib.Algebra.Order.BigOperators.Group.Multiset
import Mathlib.Data.Fintype.BigOperators

/-! Finite cumulative partition choices and the exact multiplicity loss
when all parts below a prescribed minimum are deleted. -/

namespace RectanglePartitions

noncomputable def boundedParts (a B T : ℕ) : Finset (Multiset ℕ) := by
  classical
  exact ((Finset.univ : Finset (Σ n : Fin (T+1), Nat.Partition n.val)).image
    (fun p => p.2.parts)).filter (fun parts => ∀ b ∈ parts, a ≤ b ∧ b ≤ B)

theorem mem_boundedParts_iff (a B T : ℕ) (ha : 0 < a) (parts : Multiset ℕ) :
    parts ∈ boundedParts a B T ↔ parts.sum ≤ T ∧ ∀ b ∈ parts, a ≤ b ∧ b ≤ B := by
  classical
  constructor
  · intro h
    obtain ⟨hmem,hparts⟩ := Finset.mem_filter.mp h
    obtain ⟨p,_,hp⟩ := Finset.mem_image.mp hmem
    refine ⟨?_,hparts⟩
    have hh := p.2.parts_sum
    rw [hp] at hh
    have ht := p.1.isLt
    omega
  · rintro ⟨hsum,hparts⟩
    apply Finset.mem_filter.mpr
    refine ⟨Finset.mem_image.mpr ?_,hparts⟩
    let p : Nat.Partition parts.sum := ⟨parts,fun hb => lt_of_lt_of_le ha (hparts _ hb).1,rfl⟩
    exact ⟨⟨⟨parts.sum,by omega⟩,p⟩,Finset.mem_univ _,rfl⟩

theorem empty_mem_boundedParts (a B T : ℕ) (ha : 0 < a) :
    (0 : Multiset ℕ) ∈ boundedParts a B T := by
  rw [mem_boundedParts_iff a B T ha]
  simp

theorem boundedParts_card_pos (a B T : ℕ) (ha : 0 < a) :
    0 < (boundedParts a B T).card :=
  Finset.card_pos.mpr ⟨0,empty_mem_boundedParts a B T ha⟩

def deleteSmall (a : ℕ) (parts : Multiset ℕ) : Multiset ℕ := parts.filter (fun b => a ≤ b)

theorem deleteSmall_sum_le (a : ℕ) (parts : Multiset ℕ) :
    (deleteSmall a parts).sum ≤ parts.sum := by
  have hh := congrArg Multiset.sum (Multiset.filter_add_not (fun b => a ≤ b) parts)
  simp only [Multiset.sum_add] at hh
  dsimp [deleteSmall]
  omega

theorem count_le_budget (parts : Multiset ℕ) (T : ℕ)
    (hpos : ∀ b ∈ parts, 0 < b) (hsum : parts.sum ≤ T) (b : ℕ) :
    parts.count b ≤ T := by
  have hc : parts.card ≤ parts.sum := by
    have hh := Multiset.card_nsmul_le_sum (s:=parts) (a:=1)
      (fun b hb => hpos b hb)
    simpa only [nsmul_eq_mul,Nat.cast_id,mul_one] using hh
  exact (Multiset.count_le_card b parts).trans (hc.trans hsum)

def smallCounts (a T : ℕ) (parts : Multiset ℕ) : Fin (a-1) → Fin (T+1) :=
  fun j => ⟨min (parts.count (j.val+1)) T,by have := min_le_right (parts.count (j.val+1)) T; omega⟩

theorem deleteSmall_injective_with_counts (a T : ℕ) (ha : 0 < a)
    {parts other : Multiset ℕ}
    (hpos : ∀ b ∈ parts, 0 < b) (hpos' : ∀ b ∈ other, 0 < b)
    (hsum : parts.sum ≤ T) (hsum' : other.sum ≤ T)
    (hdelete : deleteSmall a parts=deleteSmall a other)
    (hcounts : smallCounts a T parts=smallCounts a T other) : parts=other := by
  apply Multiset.ext.mpr
  intro b
  by_cases hb0 : b=0
  · subst b
    have hp : 0 ∉ parts := fun hh => Nat.lt_irrefl 0 (hpos 0 hh)
    have hq : 0 ∉ other := fun hh => Nat.lt_irrefl 0 (hpos' 0 hh)
    rw [Multiset.count_eq_zero_of_notMem hp,Multiset.count_eq_zero_of_notMem hq]
  · by_cases hba : a ≤ b
    · have hh := congrArg (Multiset.count b) hdelete
      simpa only [deleteSmall,Multiset.count_filter_of_pos hba] using hh
    · let j : Fin (a-1) := ⟨b-1,by omega⟩
      have hh := congrArg (fun f : Fin (a-1) → Fin (T+1) => (f j).val) hcounts
      have hj : j.val+1=b := by dsimp [j]; omega
      simpa only [smallCounts,hj,min_eq_left (count_le_budget parts T hpos hsum b),
        min_eq_left (count_le_budget other T hpos' hsum' b)] using hh

/-- Deleting the small parts loses at most `(T+1)^(a-1)` choices. This is
an unconditional finite counting bound; it assumes no partition asymptotic. -/
theorem boundedParts_deletion_bound (a B T : ℕ) (ha : 0 < a) :
    (boundedParts 1 B T).card ≤ (boundedParts a B T).card*(T+1)^(a-1) := by
  classical
  let f := fun parts : Multiset ℕ => (deleteSmall a parts,smallCounts a T parts)
  have hmap : Set.MapsTo f (boundedParts 1 B T)
      ((boundedParts a B T).product (Finset.univ : Finset (Fin (a-1) → Fin (T+1)))) := by
    intro parts hp
    obtain ⟨hsum,hparts⟩ := (mem_boundedParts_iff 1 B T (by omega) parts).mp hp
    apply Finset.mem_product.mpr
    refine ⟨?_,Finset.mem_univ _⟩
    apply (mem_boundedParts_iff a B T ha _).mpr
    refine ⟨(deleteSmall_sum_le a parts).trans hsum,?_⟩
    intro b hb
    obtain ⟨hb,hba⟩ := Multiset.mem_filter.mp hb
    exact ⟨hba,(hparts b hb).2⟩
  have hinj : (↑(boundedParts 1 B T) : Set (Multiset ℕ)).InjOn f := by
    intro parts hp other hq he
    obtain ⟨hsum,hparts⟩ := (mem_boundedParts_iff 1 B T (by omega) parts).mp hp
    obtain ⟨hsum',hother⟩ := (mem_boundedParts_iff 1 B T (by omega) other).mp hq
    exact deleteSmall_injective_with_counts a T ha
      (fun b hb => (hparts b hb).1) (fun b hb => (hother b hb).1) hsum hsum'
      (congrArg Prod.fst he) (congrArg Prod.snd he)
  have hh := Finset.card_le_card_of_injOn f hmap hinj
  rw [Finset.product_eq_sprod,Finset.card_product] at hh
  simpa only [Finset.card_univ,Fintype.card_fun,Fintype.card_fin] using hh

end RectanglePartitions
