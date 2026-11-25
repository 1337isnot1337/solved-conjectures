module

public import Conjectures.SobolewskiUlasExceptionSourceLayer

@[expose] public section
namespace SobolewskiUlasException

/-- A literal finite binary scanner, consuming the least significant
digit first. The initial two states record parity of trailing zeros;
the final two record the remaining digit-sum parity. -/
inductive Phase
  | skipEven | skipOdd | middle | offset | parity (needOdd : Bool) | dead
  deriving DecidableEq, Fintype

def scanStep : Phase→ℕ→Phase
  | .skipEven,0 => .skipOdd
  | .skipEven,1 => .middle
  | .skipOdd,0 => .skipEven
  | .middle,0 => .offset
  | .offset,0 => .parity true
  | .offset,1 => .parity false
  | .parity b,0 => .parity b
  | .parity b,1 => .parity (!b)
  | _,_ => .dead

def scan : Phase→List ℕ→Phase
  | p,[] => p
  | p,x::xs => scan (scanStep p x) xs

def accepted (p : Phase) : Prop := p=Phase.parity false

theorem scan_dead (xs : List ℕ) : scan .dead xs=.dead := by
  induction xs with
  | nil => rfl
  | cons x xs ih =>
    change scan (scanStep .dead x) xs=.dead
    simpa [scanStep] using ih

theorem accepted_step_zero (p : Phase) : accepted (scanStep p 0) ↔ accepted p := by
  cases p <;> simp [scanStep,accepted]

theorem scan_parity (p : Bool) (xs : List ℕ) (hb : ∀ d∈xs,d=0 ∨ d=1) :
    accepted (scan (.parity p) xs) ↔ xs.sum%2=(if p then 1 else 0) := by
  induction xs generalizing p with
  | nil => cases p <;> simp [scan,accepted]
  | cons x xs ih =>
    have ht (d : ℕ) (hd : d∈xs) : d=0 ∨ d=1 := hb d (List.mem_cons_of_mem _ hd)
    rcases hb x List.mem_cons_self with rfl|rfl
    · simpa [scan,scanStep] using ih p ht
    · change accepted (scan (.parity (!p)) xs) ↔ (1+xs.sum)%2=_
      rw [ih (!p) ht]
      cases p <;> simp <;> omega

theorem scan_digits_step (p : Phase) (x : ℕ) :
    accepted (scan p (Nat.digits 2 x)) ↔
    accepted (scan (scanStep p (x%2)) (Nat.digits 2 (x/2))) := by
  by_cases hx : x=0
  · subst x
    simpa only [Nat.digits_zero,Nat.zero_mod,Nat.zero_div,scan] using (accepted_step_zero p).symm
  · rw [Nat.digits_eq_cons_digits_div (by decide) hx,scan]

theorem inBase_iff_mod_eight (x : ℕ) :
    inBase x ↔ x%8=layerOffset (x/8) := by
  constructor
  · rintro ⟨s,rfl⟩
    have hs := offset_bounds s
    unfold baseValue
    rw [show (8*s+layerOffset s)/8=s by omega,show (8*s+layerOffset s)%8=layerOffset s by omega]
  · intro h
    refine ⟨x/8,?_⟩
    unfold baseValue
    omega

theorem scan_odd_recognizes_base {x : ℕ} (hx : x%2=1) :
    accepted (scan .skipEven (Nat.digits 2 x)) ↔ inBase x := by
  rw [scan_digits_step .skipEven x,hx,inBase_iff_mod_eight]
  change accepted (scan .middle (Nat.digits 2 (x/2))) ↔ _
  rw [scan_digits_step .middle (x/2)]
  by_cases hm : (x/2)%2=0
  · rw [hm]
    change accepted (scan .offset (Nat.digits 2 (x/2/2))) ↔ _
    rw [scan_digits_step .offset (x/2/2)]
    rw [show x/2/2=x/4 by omega,show x/4/2=x/8 by omega]
    have hbits (d : ℕ) (hd : d∈Nat.digits 2 (x/8)) : d=0 ∨ d=1 := by
      have hu := Nat.digits_lt_base (by decide : 1<(2:ℕ)) hd
      omega
    by_cases h2 : (x/4)%2=0
    · rw [h2]
      change accepted (scan (.parity true) (Nat.digits 2 (x/8))) ↔ _
      rw [scan_parity true _ hbits]
      change digitSum (x/8)%2=1 ↔ x%8=layerOffset (x/8)
      rw [show x%8=1 by omega]
      unfold layerOffset
      split_ifs <;> omega
    · have h3 : (x/4)%2=1 := by omega
      rw [h3]
      change accepted (scan (.parity false) (Nat.digits 2 (x/8))) ↔ _
      rw [scan_parity false _ hbits]
      change digitSum (x/8)%2=0 ↔ x%8=layerOffset (x/8)
      rw [show x%8=5 by omega]
      unfold layerOffset
      split_ifs <;> omega
  · rw [show (x/2)%2=1 by omega]
    change accepted (scan .dead (Nat.digits 2 (x/2/2))) ↔ _
    rw [scan_dead]
    have ho := offset_bounds (x/8)
    unfold accepted layerOffset at *
    split_ifs <;> simp <;> omega

theorem inScaled_odd_iff {x : ℕ} (hx : x%2=1) : inScaled x ↔ inBase x := by
  rw [inScaled_unfold]
  apply or_iff_left
  rintro ⟨z,_,h⟩
  omega

theorem inScaled_multiple_four_iff {x : ℕ} (hx : x%4=0) :
    inScaled x ↔ inScaled (x/4) := by
  constructor
  · rw [inScaled_unfold]
    rintro (⟨s,hs⟩|⟨z,hz,h⟩)
    · have hu := baseValue_odd s
      omega
    · have he : x/4=z := by omega
      rwa [he]
  · intro h
    exact (inScaled_unfold x).mpr (Or.inr ⟨x/4,h,by omega⟩)

theorem inScaled_not_remainder_two {x : ℕ} (hx : x%4=2) : ¬inScaled x := by
  rw [inScaled_unfold]
  rintro (⟨s,hs⟩|⟨z,_,h⟩)
  · have hu := baseValue_odd s
    omega
  · omega

theorem inScaled_zero_false : ¬inScaled 0 := by
  rintro ⟨j,s,h⟩
  have hs := (offset_bounds s).1
  have hu : 0<baseValue s := by unfold baseValue; omega
  exact (Nat.mul_pos (show 0<4^j by positivity) hu).ne' h

/-- The 2-automatic language asserted in the written proof accepts
exactly the literal normalized exception set. -/
theorem binary_scanner_correct (x : ℕ) :
    accepted (scan .skipEven (Nat.digits 2 x)) ↔ inScaled x := by
  induction x using Nat.strong_induction_on with
  | h x ih =>
    by_cases h0 : x=0
    · subst x
      simp [Nat.digits_zero,scan,accepted,inScaled_zero_false]
    · by_cases hx : x%2=1
      · exact (scan_odd_recognizes_base hx).trans (inScaled_odd_iff hx).symm
      · rw [scan_digits_step .skipEven x,show x%2=0 by omega]
        change accepted (scan .skipOdd (Nat.digits 2 (x/2))) ↔ _
        rw [scan_digits_step .skipOdd (x/2)]
        by_cases hm : (x/2)%2=0
        · rw [hm]
          change accepted (scan .skipEven (Nat.digits 2 (x/2/2))) ↔ _
          rw [show x/2/2=x/4 by omega,ih (x/4) (Nat.div_lt_self (Nat.pos_of_ne_zero h0) (by decide))]
          exact (inScaled_multiple_four_iff (by omega : x%4=0)).symm
        · rw [show (x/2)%2=1 by omega]
          change accepted (scan .dead (Nat.digits 2 (x/2/2))) ↔ _
          simp [scan_dead,accepted,inScaled_not_remainder_two (by omega : x%4=2)]

end SobolewskiUlasException
