module

public import Conjectures.SobolewskiUlasExceptionIndicatorKernel
public import Conjectures.SobolewskiUlasExceptionFiniteKernel

@[expose] public section
namespace SobolewskiUlasException

theorem finite_predicateKernel_tail {b : ℕ} {P : ℕ→Prop} (h : (predicateKernel b P).Finite) :
    (predicateKernel b (fun n => P (n+1))).Finite := by
  let shift (q : ℕ→Prop) := fun n => q (n+1)
  apply (h.union (h.image shift)).subset
  rintro g ⟨e,r,hr,rfl⟩
  by_cases hlt : r+1<b^e
  · apply Set.mem_union_left
    exact ⟨e,r+1,hlt,by
      funext n
      change P (b^e*n+r+1)=P (b^e*n+(r+1))
      rw [Nat.add_assoc]⟩
  · apply Set.mem_union_right
    have he : r+1=b^e := by omega
    have hp : 0<b^e := by omega
    refine ⟨(fun n => P (b^e*n+0)),⟨e,0,hp,rfl⟩,?_⟩
    funext n
    change P (b^e*(n+1)+0)=P (b^e*n+r+1)
    rw [Nat.mul_succ,Nat.add_zero,Nat.add_assoc,he]

theorem finite_predicateKernel_shift {b : ℕ} {P : ℕ→Prop} (h : (predicateKernel b P).Finite)
    (c : ℕ) : (predicateKernel b (fun n => P (n+c))).Finite := by
  induction c generalizing P with
  | zero => simpa using h
  | succ c ih =>
    have ht := finite_predicateKernel_tail (ih h)
    have he : (fun n => P ((n+1)+c))=(fun n => P (n+(c+1))) := by
      funext n
      rw [show n+1+c=n+(c+1) by omega]
    exact he ▸ ht

theorem ultimatelyPeriodic_of_shift {P : ℕ→Prop} {c : ℕ}
    (h : UltimatelyPeriodic (fun n => P (n+c))) : UltimatelyPeriodic P := by
  obtain ⟨N,p,hp,hN⟩ := h
  refine ⟨N+c,p,hp,?_⟩
  intro n hn
  have he := hN (n-c) (by omega)
  change P ((n-c)+p+c) ↔ P ((n-c)+c) at he
  rw [show (n-c)+p+c=n+p by omega,show (n-c)+c=n by omega] at he
  exact he

theorem gapWord_toNat (n : ℕ) :
    (gapWord n).toNat=nthException (n+2)-nthException (n+1) := by
  have h : nthException (n+1)≤nthException (n+2) :=
    nthException_strictMono.monotone (Nat.le_succ _)
  unfold gapWord
  rw [← Nat.cast_sub h]
  simp

theorem gapWord_prefix_sum (n : ℕ) :
    (∑ i ∈ Finset.range n,(gapWord i).toNat)=nthException (n+1)-nthException 1 := by
  induction n with
  | zero => simp
  | succ n ih =>
    rw [Finset.sum_range_succ,ih,gapWord_toNat]
    have h1 : nthException 1≤nthException (n+1) :=
      nthException_strictMono.monotone (by omega)
    have h2 : nthException (n+1)≤nthException (n+2) :=
      nthException_strictMono.monotone (by omega)
    change (nthException (n+1)-nthException 1)+(nthException (n+2)-nthException (n+1)) =
      nthException (n+2)-nthException 1
    omega

/-- The word obtained by replacing a positive gap d by one 1 followed
by d-1 zeros. The index of every output 1 is a prefix sum of gaps. -/
def IsGapExpansion (g : ℕ→ℤ) (P : ℕ→Prop) : Prop :=
  ∀ n,P n ↔ ∃ k,n=(∑ i ∈ Finset.range k,(g i).toNat)

theorem exception_indicator_is_gap_expansion :
    IsGapExpansion gapWord (fun n => inScaled (n+nthException 1)) := by
  intro n
  change inScaled (n+nthException 1) ↔ ∃ k,n=∑ i ∈ Finset.range k,(gapWord i).toNat
  rw [inScaled_eq_enumeration]
  constructor
  · rintro ⟨j,hj,he⟩
    obtain ⟨k,rfl⟩ : ∃ k,j=k+1 := ⟨j-1,by omega⟩
    refine ⟨k,?_⟩
    rw [gapWord_prefix_sum]
    omega
  · rintro ⟨k,hk⟩
    rw [gapWord_prefix_sum] at hk
    have hv : nthException 1≤nthException (k+1) := nthException_strictMono.monotone (by omega)
    exact ⟨k+1,Nat.succ_pos _,by omega⟩

end SobolewskiUlasException
