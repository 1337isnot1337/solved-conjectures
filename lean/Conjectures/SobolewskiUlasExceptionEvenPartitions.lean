module

public import Conjectures.SobolewskiUlasExceptionPartitionRecurrence
public import Mathlib.Algebra.BigOperators.Ring.Multiset
public import Mathlib.Logic.Equiv.Sum

@[expose] public section
namespace SobolewskiUlasException

abbrev HasOne {n : ℕ} (p : BinaryPartition n) : Prop := (1:ℕ)∈p.val.parts

def containsOneEquiv (n : ℕ) :
    BinaryPartition n ≃ {p : BinaryPartition (n+1) // HasOne p} where
  toFun p := ⟨binaryInsOne n p, by change 1∈1 ::ₘ p.val.parts; simp⟩
  invFun p := binaryEraseOne n p.val p.property
  left_inv p := by
    apply Subtype.ext
    apply Nat.Partition.ext
    exact Multiset.erase_cons_head 1 _
  right_inv p := by
    apply Subtype.ext
    apply Subtype.ext
    apply Nat.Partition.ext
    exact Multiset.cons_erase p.property

theorem double_half_binary_part {x : ℕ} (hx : ∃ e : ℕ, x=2^e) (h1 : x≠1) :
    2*(x/2)=x ∧ ∃ e : ℕ, x/2=2^e := by
  obtain ⟨e,rfl⟩ := hx
  cases e with
  | zero => exact (h1 rfl).elim
  | succ e =>
    rw [pow_succ]
    have h : (2^e*2)/2=2^e := by omega
    exact ⟨by rw [h,Nat.mul_comm], ⟨e,h⟩⟩

theorem binary_partition_sum_double (S : Multiset ℕ) :
    (S.map (fun x => 2*x)).sum=2*S.sum := by
  have h := Multiset.sum_map_mul_left (s:=S) (f:=id) (a:=2)
  rw [Multiset.map_id] at h
  exact h

def binaryDouble (n : ℕ) (p : BinaryPartition n) : {q : BinaryPartition (2*n) // ¬HasOne q} := by
  refine ⟨⟨⟨p.val.parts.map (fun x => 2*x),?_,?_⟩,?_⟩,?_⟩
  · intro i hi
    obtain ⟨x,hx,rfl⟩ := Multiset.mem_map.mp hi
    have hp := p.val.parts_pos hx
    omega
  · rw [binary_partition_sum_double,p.val.parts_sum]
  · intro i hi
    obtain ⟨x,hx,rfl⟩ := Multiset.mem_map.mp hi
    obtain ⟨e,rfl⟩ := p.property _ hx
    exact ⟨e+1,by rw [pow_succ',Nat.mul_comm]⟩
  · intro hi
    obtain ⟨x,_,hx⟩ := Multiset.mem_map.mp hi
    omega

theorem binaryHalves_double_multiset {n : ℕ} (p : {q : BinaryPartition (2*n) // ¬HasOne q}) :
    (p.val.val.parts.map (· / 2)).map (fun x => 2*x) = p.val.val.parts := by
  rw [Multiset.map_map]
  conv_rhs => rw [← Multiset.map_id (s := p.val.val.parts)]
  apply Multiset.map_congr rfl
  intro x hx
  exact (double_half_binary_part (p.val.property x hx) (fun h => p.property (by change 1 ∈ p.val.val.parts; simpa only [h] using hx))).1

def binaryHalve (n : ℕ) (p : {q : BinaryPartition (2*n) // ¬HasOne q}) : BinaryPartition n := by
  refine ⟨⟨p.val.val.parts.map (· / 2),?_ ,?_⟩,?_⟩
  · intro i hi
    obtain ⟨x,hx,rfl⟩ := Multiset.mem_map.mp hi
    have hp := p.val.val.parts_pos hx
    have he := (double_half_binary_part (p.val.property x hx) (fun h => p.property (by change 1 ∈ p.val.val.parts; simpa only [h] using hx))).1
    omega
  · have he := congrArg Multiset.sum (binaryHalves_double_multiset p)
    rw [binary_partition_sum_double,p.val.val.parts_sum] at he
    omega
  · intro i hi
    obtain ⟨x,hx,rfl⟩ := Multiset.mem_map.mp hi
    exact (double_half_binary_part (p.val.property x hx) (fun h => p.property (by change 1 ∈ p.val.val.parts; simpa only [h] using hx))).2

def binaryDoublingEquiv (n : ℕ) : BinaryPartition n ≃ {q : BinaryPartition (2*n) // ¬HasOne q} where
  toFun := binaryDouble n
  invFun := binaryHalve n
  left_inv p := by
    apply Subtype.ext
    apply Nat.Partition.ext
    change (p.val.parts.map (fun x => 2*x)).map (· / 2) = p.val.parts
    rw [Multiset.map_map]
    conv_rhs => rw [← Multiset.map_id (s := p.val.parts)]
    apply Multiset.map_congr rfl
    intro x _
    change (2*x)/2=x
    omega
  right_inv p := by
    apply Subtype.ext
    apply Subtype.ext
    apply Nat.Partition.ext
    exact binaryHalves_double_multiset p

/-- Removing a one, or halving every part, exhausts all even binary partitions. -/
noncomputable def evenBinaryPartitionEquiv (n : ℕ) :
    BinaryPartition (2*n) ⊕ BinaryPartition (n+1) ≃ BinaryPartition (2*(n+1)) := by
  classical
  have he : 2*n+1+1 = 2*(n+1) := by omega
  have e₁ : BinaryPartition (2*n) ≃ {p : BinaryPartition (2*(n+1)) // HasOne p} := by
    rw [←he]
    exact (oddBinaryPartitionEquiv n).trans (containsOneEquiv (2*n+1))
  exact (Equiv.sumCongr e₁ (binaryDoublingEquiv _)).trans (Equiv.sumCompl HasOne)

theorem binaryPartitionCount_even_succ (n : ℕ) :
    binaryPartitionCount (2*(n+1)) = binaryPartitionCount (2*n) + binaryPartitionCount (n+1) := by
  have h := (Nat.card_congr (evenBinaryPartitionEquiv n)).symm
  rw [Nat.card_sum] at h
  exact h

end SobolewskiUlasException
