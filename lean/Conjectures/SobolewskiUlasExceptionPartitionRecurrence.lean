module

public import Conjectures.SobolewskiUlasExceptionOriginalReduction

@[expose] public section
namespace SobolewskiUlasException

abbrev BinaryPartition (n : ℕ) :=
  {p : Nat.Partition n // ∀ x ∈ p.parts, ∃ e : ℕ, x = 2^e}

private theorem eq_empty_partition (p : BinaryPartition 0) :
    p = ⟨Nat.Partition.ofMultiset (0 : Multiset ℕ), by simp⟩ := by
  apply Subtype.ext
  apply Nat.Partition.ext
  change p.val.parts = 0
  exact Multiset.eq_zero_of_forall_notMem fun x hx => by
    have hp := p.val.parts_pos hx
    have hu := Nat.Partition.le_of_mem_parts hx
    omega

theorem binaryPartitionCount_zero : binaryPartitionCount 0 = 1 := by
  change Nat.card (BinaryPartition 0) = 1
  let z : BinaryPartition 0 := ⟨Nat.Partition.ofMultiset (0 : Multiset ℕ), by simp⟩
  let e : BinaryPartition 0 ≃ Unit :=
    { toFun := fun _ => ()
      invFun := fun _ => z
      left_inv := fun p => (eq_empty_partition p).symm
      right_inv := fun u => by cases u; rfl }
  exact (Nat.card_congr e).trans (by simp)

private theorem power_two_even_of_ne_one {x : ℕ}
    (hx : ∃ e : ℕ, x=2^e) (h1 : x≠1) : x%2=0 := by
  obtain ⟨e,rfl⟩ := hx
  cases e with
  | zero => exact (h1 rfl).elim
  | succ e => rw [pow_succ]; omega

private theorem even_sum_of_not_mem_one (s : Multiset ℕ) (h1 : (1:ℕ)∉s)
    (hp : ∀ x∈s, ∃ e : ℕ, x=2^e) : s.sum%2=0 := by
  induction s using Multiset.induction_on with
  | empty => decide
  | cons a s ih =>
    have ha : a%2=0 := power_two_even_of_ne_one (hp a (by simp)) (by
      rintro rfl
      exact h1 (by simp))
    have hs : s.sum%2=0 := ih (fun h => h1 (Multiset.mem_cons_of_mem h))
      (fun x h => hp x (Multiset.mem_cons_of_mem h))
    rw [Multiset.sum_cons]
    omega

theorem odd_partition_has_one (n : ℕ) (p : BinaryPartition (2*n+1)) :
    (1:ℕ)∈p.val.parts := by
  by_contra h
  have he := even_sum_of_not_mem_one p.val.parts h p.property
  rw [p.val.parts_sum] at he
  omega

/-- Inserting a part of size one. -/
def binaryInsOne (n : ℕ) (p : BinaryPartition n) : BinaryPartition (n+1) := by
  refine ⟨⟨1 ::ₘ p.val.parts,?_,?_⟩,?_⟩
  · intro i hi
    rcases Multiset.mem_cons.mp hi with hi|hi
    · subst i; decide
    · exact p.val.parts_pos hi
  · rw [Multiset.sum_cons,p.val.parts_sum,Nat.add_comm]
  · intro i hi
    rcases Multiset.mem_cons.mp hi with hi|hi
    · subst i; exact ⟨0,rfl⟩
    · exact p.property i hi

/-- Erasing a part of size one when present. -/
def binaryEraseOne (n : ℕ) (p : BinaryPartition (n+1)) (h : (1:ℕ)∈p.val.parts) :
    BinaryPartition n := by
  refine ⟨⟨p.val.parts.erase 1, ?_, ?_⟩, ?_⟩
  · intro i hi
    exact p.val.parts_pos (Multiset.mem_of_mem_erase hi)
  · have he := congrArg Multiset.sum (Multiset.cons_erase h)
    rw [Multiset.sum_cons,p.val.parts_sum] at he
    omega
  · intro i hi
    exact p.property i (Multiset.mem_of_mem_erase hi)

def oddBinaryPartitionEquiv (n : ℕ) : BinaryPartition (2*n) ≃ BinaryPartition (2*n+1) where
  toFun := binaryInsOne (2*n)
  invFun p := binaryEraseOne (2*n) p (odd_partition_has_one n p)
  left_inv p := by
    apply Subtype.ext
    apply Nat.Partition.ext
    exact Multiset.erase_cons_head 1 _
  right_inv p := by
    apply Subtype.ext
    apply Nat.Partition.ext
    exact Multiset.cons_erase (odd_partition_has_one n p)

theorem binaryPartitionCount_odd (n : ℕ) :
    binaryPartitionCount (2*n+1) = binaryPartitionCount (2*n) :=
  (Nat.card_congr (oddBinaryPartitionEquiv n)).symm

end SobolewskiUlasException
