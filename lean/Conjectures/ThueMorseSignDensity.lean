module

public import Conjectures.ThueMorseSignDensityProduct
public import Conjectures.ThueMorseSignDensityCore

@[expose] public section

/-!
# Gawron–Miska–Ulas's Thue–Morse sign-density conjecture

Source: arXiv:1703.01955, Conjecture 5.8. The finite product is constructed
by its exact integer polynomial coefficient operations, and the recurrence
hypotheses are proved for its stable coefficients. The sign-exception
count uses the source's input variable n, not the coefficient index 3*n+j.
The density-zero predicate uses positive rational epsilons, expressed by
integer cross multiplication, rather than assuming a real limit exists.
-/

namespace ThueMorseSignDensity

open ThueMorseSignDensityProduct
open ThueMorseSignDensityCore

theorem recurrence : Recurrence (t 2) prev :=
  ⟨t_zero 2, rfl, t_even, t_odd, prev_even, prev_odd⟩

theorem t_nonzero (n : Nat) : t 2 n ≠ 0 :=
  nonzero recurrence n

theorem signed_identity0 (n : Nat) :
    t 2 (512*n) + 13*t 2 (512*n+30) + 48*t 2 (512*n+324) = 0 := by
  simpa using identity0 recurrence n

theorem signed_identity1 (n : Nat) :
    t 2 (256*n+1) + 34*t 2 (256*n+16) + 80*t 2 (256*n+166) = 0 :=
  identity1 recurrence n

def sign (z : Int) : Int := if z<0 then -1 else if z=0 then 0 else 1

abbrev exception (m j n : Nat) : Prop := sign (t m (3*n+j)) ≠ (-1 : Int)^j

def exceptionBit (m j n : Nat) : Bool := decide (exception m j n)

def exceptions (m j X : Nat) : List Nat :=
  (List.range X).filter (exceptionBit m j)

theorem exceptions_nodup (m j X : Nat) : (exceptions m j X).Nodup := by
  exact List.Nodup.sublist List.filter_sublist List.nodup_range

theorem exceptions_mem (m j X n : Nat) :
    n ∈ exceptions m j X ↔ n<X ∧ exception m j n := by
  simp [exceptions, List.mem_filter, List.mem_range, exceptionBit]

theorem count_filter_range (b : Nat → Bool) (X : Nat) :
    ((List.range X).filter b).length = countPrefix b X := by
  induction X with
  | zero => rfl
  | succ X ih =>
    rw [List.range_succ,List.filter_append,List.length_append,ih]
    cases h : b X <;> simp [countPrefix,h]

theorem count_eq (m j X : Nat) :
    (exceptions m j X).length = countPrefix (exceptionBit m j) X :=
  count_filter_range _ X

theorem exception0_iff (n : Nat) : exception 2 0 n ↔ t 2 (3*n) < 0 := by
  have hne := t_nonzero (3*n)
  change (sign (t 2 (3*n)) ≠ 1) ↔ t 2 (3*n)<0
  by_cases hn : t 2 (3*n)<0 <;> simp [sign,hn,hne]

theorem exception1_iff (n : Nat) : exception 2 1 n ↔ 0 < t 2 (3*n+1) := by
  have hne := t_nonzero (3*n+1)
  change (sign (t 2 (3*n+1)) ≠ -1) ↔ 0<t 2 (3*n+1)
  by_cases hn : t 2 (3*n+1)<0
  · have hp : ¬ 0<t 2 (3*n+1) := by omega
    simp [sign,hn,hp]
  · have hp : 0<t 2 (3*n+1) := by omega
    simp [sign,hn,hne,hp]

theorem bit0 : exceptionBit 2 0 = (fun n => decide (t 2 (3*n)<0)) := by
  funext n
  change decide (exception 2 0 n) = decide (t 2 (3*n)<0)
  by_cases h : exception 2 0 n
  · have h' := (exception0_iff n).mp h
    simp [h,h']
  · have h' : ¬ t 2 (3*n)<0 := fun hn => h ((exception0_iff n).mpr hn)
    simp [h,h']

theorem bit1 : exceptionBit 2 1 = (fun n => decide (0<t 2 (3*n+1))) := by
  funext n
  change decide (exception 2 1 n) = decide (0<t 2 (3*n+1))
  by_cases h : exception 2 1 n
  · have h' := (exception1_iff n).mp h
    simp [h,h']
  · have h' : ¬ 0<t 2 (3*n+1) := fun hn => h ((exception1_iff n).mpr hn)
    simp [h,h']

theorem exception_block0 (h : Nat) : ∃ s : Nat, s<512 ∧ exception 2 0 (512*h+s) := by
  obtain ⟨s,hs,ht⟩ := block0 recurrence h
  exact ⟨s,hs,(exception0_iff _).mpr ht⟩

theorem exception_block1 (h : Nat) : ∃ s : Nat, s<256 ∧ exception 2 1 (256*h+s) := by
  obtain ⟨s,hs,ht⟩ := block1 recurrence h
  exact ⟨s,hs,(exception1_iff _).mpr ht⟩

/-- Each block also has a coefficient of the proposed usual sign. -/
theorem usual_block0 (h : Nat) : ∃ s : Nat, s<512 ∧ ¬ exception 2 0 (512*h+s) := by
  by_cases hex : ∃ s : Nat, s<512 ∧ ¬ exception 2 0 (512*h+s)
  · exact hex
  · have hn (s : Nat) (hs : s<512) : t 2 (3*(512*h+s))<0 := by
      by_cases h : exception 2 0 (512*h+s)
      · exact (exception0_iff _).mp h
      · exact False.elim (hex ⟨s,hs,h⟩)
    have h0 := hn 0 (by decide)
    have h1 := hn 10 (by decide)
    have h2 := hn 108 (by decide)
    rw [show 3*(512*h+0)=512*(3*h) by omega] at h0
    rw [show 3*(512*h+10)=512*(3*h)+30 by omega] at h1
    rw [show 3*(512*h+108)=512*(3*h)+324 by omega] at h2
    have hid := signed_identity0 (3*h)
    omega

theorem usual_block1 (h : Nat) : ∃ s : Nat, s<256 ∧ ¬ exception 2 1 (256*h+s) := by
  by_cases hex : ∃ s : Nat, s<256 ∧ ¬ exception 2 1 (256*h+s)
  · exact hex
  · have hn (s : Nat) (hs : s<256) : 0<t 2 (3*(256*h+s)+1) := by
      by_cases h : exception 2 1 (256*h+s)
      · exact (exception1_iff _).mp h
      · exact False.elim (hex ⟨s,hs,h⟩)
    have h0 := hn 0 (by decide)
    have h1 := hn 5 (by decide)
    have h2 := hn 55 (by decide)
    rw [show 3*(256*h+0)+1=256*(3*h)+1 by omega] at h0
    rw [show 3*(256*h+5)+1=256*(3*h)+16 by omega] at h1
    rw [show 3*(256*h+55)+1=256*(3*h)+166 by omega] at h2
    have hid := signed_identity1 (3*h)
    omega

theorem lower_bound0 (X : Nat) : X/512 ≤ (exceptions 2 0 X).length := by
  rw [count_eq,bit0]
  exact ThueMorseSignDensityCore.lower_bound0 recurrence X

theorem lower_bound1 (X : Nat) : X/256 ≤ (exceptions 2 1 X).length := by
  rw [count_eq,bit1]
  exact ThueMorseSignDensityCore.lower_bound1 recurrence X

theorem complement_count (b : Nat → Bool) (X : Nat) :
    countPrefix b X + countPrefix (fun n => !(b n)) X = X := by
  induction X with
  | zero => rfl
  | succ X ih =>
    rw [countPrefix,countPrefix]
    cases b X <;> simp <;> omega

theorem upper_bound0 (X : Nat) : (exceptions 2 0 X).length + X/512 ≤ X := by
  have h := count_from_blocks (fun n => !(exceptionBit 2 0 n)) 512 X (by
    intro k
    obtain ⟨s,hs,hnot⟩ := usual_block0 k
    exact ⟨s,hs,by simp [exceptionBit,hnot]⟩)
  rw [count_eq]
  have hc := complement_count (exceptionBit 2 0) X
  omega

theorem upper_bound1 (X : Nat) : (exceptions 2 1 X).length + X/256 ≤ X := by
  have h := count_from_blocks (fun n => !(exceptionBit 2 1 n)) 256 X (by
    intro k
    obtain ⟨s,hs,hnot⟩ := usual_block1 k
    exact ⟨s,hs,by simp [exceptionBit,hnot]⟩)
  rw [count_eq]
  have hc := complement_count (exceptionBit 2 1) X
  omega

/-- Infinite subsets of the naturals are precisely the unbounded ones. -/
def InfinitelyMany (m j : Nat) : Prop :=
  ∀ N : Nat, ∃ n : Nat, N≤n ∧ exception m j n

theorem infinitely_many0 : InfinitelyMany 2 0 := by
  intro N
  obtain ⟨s,hs,h⟩ := exception_block0 N
  exact ⟨512*N+s,by omega,h⟩

theorem infinitely_many1 : InfinitelyMany 2 1 := by
  intro N
  obtain ⟨s,hs,h⟩ := exception_block1 N
  exact ⟨256*N+s,by omega,h⟩

/-- Natural density zero, with the positive rational epsilon a/b:
for sufficiently large positive X, count/X < a/b.
Integer cross multiplication expresses the exact rational comparison. -/
def DensityZero (m j : Nat) : Prop :=
  ∀ a b : Nat, 0<a → 0<b → ∃ N : Nat, ∀ X : Nat, N≤X → 0<X →
    b*(exceptions m j X).length < a*X

theorem densityZero_reciprocal (m j : Nat) :
    DensityZero m j ↔ ThueMorseSignDensityCore.ZeroDensity (exceptionBit m j) := by
  constructor
  · intro hd k hk
    obtain ⟨N,hN⟩ := hd 1 k (by decide) hk
    refine ⟨N+1,?_⟩
    intro X hX
    have h := hN X (by omega) (by omega)
    rw [count_eq] at h
    simpa using h
  · intro hd a b ha hb
    obtain ⟨N,hN⟩ := hd b hb
    refine ⟨N,?_⟩
    intro X hX _
    rw [count_eq]
    have h := hN X hX
    have hmul := Nat.mul_le_mul_right X (show 1≤a by omega)
    rw [Nat.one_mul] at hmul
    omega

theorem not_zero_density0 : ¬ DensityZero 2 0 := by
  intro h
  have h' := (densityZero_reciprocal 2 0).mp h
  rw [bit0] at h'
  exact ThueMorseSignDensityCore.not_zero_density0 recurrence h'

theorem not_zero_density1 : ¬ DensityZero 2 1 := by
  intro h
  have h' := (densityZero_reciprocal 2 1).mp h
  rw [bit1] at h'
  exact ThueMorseSignDensityCore.not_zero_density1 recurrence h'

def Conjecture5_8 : Prop :=
  ∀ m : Nat, 2≤m → ∀ j : Nat, j<2 → InfinitelyMany m j ∧ DensityZero m j

/-- Exact disproof of the universally quantified original conjecture. -/
theorem conjecture_false : ¬ Conjecture5_8 := by
  intro h
  exact not_zero_density0 (h 2 (by decide) 0 (by decide)).2

/-- Both of the source's exception sets for m=2 are infinite and fail
density zero. The finite-prefix estimates give the positive lower-density
and complementary upper-density bounds of the written proof. -/
theorem both_counterexamples :
    InfinitelyMany 2 0 ∧ InfinitelyMany 2 1 ∧
    ¬ DensityZero 2 0 ∧ ¬ DensityZero 2 1 ∧
    (∀ X, X/512 ≤ (exceptions 2 0 X).length ∧ (exceptions 2 0 X).length+X/512≤X) ∧
    (∀ X, X/256 ≤ (exceptions 2 1 X).length ∧ (exceptions 2 1 X).length+X/256≤X) :=
  ⟨infinitely_many0,infinitely_many1,not_zero_density0,not_zero_density1,
    fun X => ⟨lower_bound0 X,upper_bound0 X⟩,
    fun X => ⟨lower_bound1 X,upper_bound1 X⟩⟩

end ThueMorseSignDensity
