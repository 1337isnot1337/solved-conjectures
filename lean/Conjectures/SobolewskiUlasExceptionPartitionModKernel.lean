module

public import Conjectures.SobolewskiUlasExceptionEvenPartitions
public import Mathlib.Data.ZMod.Basic

@[expose] public section
namespace SobolewskiUlasException

/-- The even binary-partition counts are the prefix sums of all counts. -/
theorem binaryPartitionCount_even_prefix (n : ℕ) :
    binaryPartitionCount (2*n) = ∑ i ∈ Finset.range (n+1), binaryPartitionCount i := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [binaryPartitionCount_even_succ, ih]
    exact (Finset.sum_range_succ binaryPartitionCount (n+1)).symm

noncomputable def partPrefix : ℕ → ℕ → ZMod 32
  | 0,n => binaryPartitionCount n
  | r+1,n => ∑ i ∈ Finset.range (n+1), partPrefix r i

theorem partPrefix_zero (r : ℕ) : partPrefix r 0=1 := by
  induction r with
  | zero => simp [partPrefix,binaryPartitionCount_zero]
  | succ r ih => simpa [partPrefix] using ih

theorem partPrefix_succ (r n : ℕ) :
    partPrefix (r+1) (n+1)=partPrefix (r+1) n+partPrefix r (n+1) := by
  simp only [partPrefix,Finset.sum_range_succ]

theorem partPrefix_even_zero (n : ℕ) : partPrefix 0 (2*n)=partPrefix 1 n := by
  change (binaryPartitionCount (2*n):ZMod 32) = _
  rw [binaryPartitionCount_even_prefix]
  simp [partPrefix]

theorem partPrefix_odd_zero (n : ℕ) : partPrefix 0 (2*n+1)=partPrefix 1 n := by
  change (binaryPartitionCount (2*n+1):ZMod 32) = _
  rw [binaryPartitionCount_odd]
  exact partPrefix_even_zero n

theorem partPrefix_even_odd_one (n : ℕ) :
    partPrefix 1 (2*n)=2*partPrefix 2 n-partPrefix 1 n ∧
      partPrefix 1 (2*n+1)=2*partPrefix 2 n := by
  induction n with
  | zero =>
    have h := partPrefix_odd_zero 0
    norm_num at h ⊢
    rw [partPrefix_succ 0 0,h]
    norm_num [partPrefix_zero]
  | succ n ih =>
    have he : partPrefix 1 (2*(n+1))=2*partPrefix 2 (n+1)-partPrefix 1 (n+1) := by
      have h := partPrefix_succ 0 (2*n+1)
      rw [show 2*n+1+1=2*(n+1) by omega,ih.2,partPrefix_even_zero] at h
      rw [h,partPrefix_succ 1 n]
      ring
    refine ⟨he,?_⟩
    rw [partPrefix_succ 0 (2*(n+1)),partPrefix_odd_zero,he]
    ring

theorem partPrefix_even_odd_two (n : ℕ) :
    partPrefix 2 (2*n)=4*partPrefix 3 n-3*partPrefix 2 n ∧
      partPrefix 2 (2*n+1)=4*partPrefix 3 n-partPrefix 2 n := by
  induction n with
  | zero =>
    have h := (partPrefix_even_odd_one 0).2
    norm_num at h ⊢
    rw [partPrefix_succ 1 0,h]
    norm_num [partPrefix_zero]
  | succ n ih =>
    have he : partPrefix 2 (2*(n+1))=4*partPrefix 3 (n+1)-3*partPrefix 2 (n+1) := by
      have h := partPrefix_succ 1 (2*n+1)
      rw [show 2*n+1+1=2*(n+1) by omega,ih.2,(partPrefix_even_odd_one _).1] at h
      rw [h,partPrefix_succ 2 n,partPrefix_succ 1 n]
      ring
    refine ⟨he,?_⟩
    rw [partPrefix_succ 1 (2*(n+1)),(partPrefix_even_odd_one _).2,he]
    ring

theorem partPrefix_even_odd_three (n : ℕ) :
    8*partPrefix 3 (2*n)=8*partPrefix 2 n ∧
      8*partPrefix 3 (2*n+1)=0 := by
  have h32 : (32:ZMod 32)=0 := by decide
  have a (x y : ZMod 32) : 8*(4*x-3*y)=8*y := by
    calc
      _ = 32*(x-y)+8*y := by ring
      _ = _ := by rw [h32,zero_mul,zero_add]
  have b (x y : ZMod 32) : 8*y+8*(4*x-y)=0 := by
    calc
      _ = 32*x := by ring
      _ = _ := by rw [h32,zero_mul]
  induction n with
  | zero =>
    have ho := (partPrefix_even_odd_two 0).2
    norm_num at ho ⊢
    rw [partPrefix_succ 2 0,ho,partPrefix_zero 3,partPrefix_zero 2]
    decide
  | succ n ih =>
    have he : 8*partPrefix 3 (2*(n+1))=8*partPrefix 2 (n+1) := by
      have h := partPrefix_succ 2 (2*n+1)
      rw [show 2*n+1+1=2*(n+1) by omega,(partPrefix_even_odd_two _).1] at h
      rw [h,mul_add,ih.2,zero_add]
      exact a _ _
    refine ⟨he,?_⟩
    rw [partPrefix_succ 2 (2*(n+1)),mul_add,he,(partPrefix_even_odd_two _).2]
    exact b _ _

end SobolewskiUlasException
