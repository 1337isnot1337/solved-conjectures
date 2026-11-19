import Conjectures.BinaryDecision
import Mathlib.Data.Int.Interval
import Mathlib.Data.Fintype.Option
import Mathlib.Data.Fintype.Prod

/-! A finite binary automaton for one affine arithmetic ray.
All coefficients, including the period and the saltus, are parameters. -/
namespace BinaryAutomata.AffineGraph
open BinaryAutomata

structure Ray where
  sizeOffset : Nat
  valueOffset : Nat
  period : Nat
  saltus : Nat
  period_pos : 0<period

def Ray.Relation (R : Ray) (n g : Nat) : Prop :=
  ∃ q, n=R.sizeOffset+R.period*q ∧ g=R.valueOffset+R.saltus*q

def Ray.bound (R : Ray) : Nat :=
  R.saltus*R.sizeOffset+R.period*R.valueOffset+R.saltus+R.period

def Ray.discrepancy (R : Ray) (n g : Nat) : Int :=
  ((R.saltus*n:Nat):Int)-((R.period*g:Nat):Int)

def Ray.target (R : Ray) : Int :=
  ((R.saltus*R.sizeOffset:Nat):Int)-((R.period*R.valueOffset:Nat):Int)

abbrev Ray.Counter (R : Ray) := {u : Int // -(R.bound:Int)≤u ∧ u≤R.bound}
abbrev Ray.State (R : Ray) := Option (R.Counter × Fin R.period × Fin (R.sizeOffset+1))

instance (R : Ray) : Fintype R.Counter :=
  Fintype.ofFinset (Finset.Icc (-(R.bound:Int)) R.bound) (by
    intro u
    change u∈Finset.Icc (-(R.bound:Int)) R.bound ↔ -(R.bound:Int)≤u ∧ u≤R.bound
    exact Finset.mem_Icc)

def Ray.classify (R : Ray) (n g : Nat) : R.State :=
  let u := R.discrepancy n g
  if hu : -(R.bound:Int)≤u ∧ u≤R.bound then
    some (⟨u,hu⟩,⟨n%R.period,Nat.mod_lt _ R.period_pos⟩,
      ⟨min R.sizeOffset n,by omega⟩)
  else none

def Ray.step (R : Ray) (state : R.State) (d : Digit) : R.State :=
  match state with
  | none => none
  | some (u,r,c) =>
    let v := 2*u.val+(R.saltus*sizeBit d:Nat)-(R.period*valueBit d:Nat)
    if hv : -(R.bound:Int)≤v ∧ v≤R.bound then
      some (⟨v,hv⟩,⟨(2*r.val+sizeBit d)%R.period,Nat.mod_lt _ R.period_pos⟩,
        ⟨min R.sizeOffset (2*c.val+sizeBit d),by omega⟩)
    else none

def Ray.final (R : Ray) : R.State → Bool
  | none => false
  | some (u,r,c) => decide (c.val=R.sizeOffset ∧
      r.val=R.sizeOffset%R.period ∧ u.val=R.target)

def Ray.graph (R : Ray) : DFA R.State :=
  ⟨R.step,R.classify 0 0,R.final⟩

theorem Ray.target_bound (R : Ray) :
    -(R.bound:Int)≤R.target ∧ R.target≤R.bound := by
  dsimp only [Ray.bound,Ray.target]
  push_cast
  have hsa : (0:Int)≤(R.saltus:Nat)*R.sizeOffset := by positivity
  have hpb : (0:Int)≤(R.period:Nat)*R.valueOffset := by positivity
  omega

theorem Ray.relation_iff (R : Ray) (n g : Nat) : R.Relation n g ↔
    R.sizeOffset≤n ∧ n%R.period=R.sizeOffset%R.period ∧
      R.discrepancy n g=R.target := by
  constructor
  · rintro ⟨q,rfl,rfl⟩
    refine ⟨by omega,by simp,?_⟩
    dsimp only [Ray.discrepancy,Ray.target]
    push_cast
    ring
  · rintro ⟨hna,hmod,hd⟩
    let q := n/R.period-R.sizeOffset/R.period
    have hn : n=R.sizeOffset+R.period*q := by
      have hn' := Nat.mod_add_div n R.period
      have ha' := Nat.mod_add_div R.sizeOffset R.period
      have hquot := Nat.div_le_div_right hna (c:=R.period)
      dsimp only [q]
      rw [Nat.mul_sub_left_distrib]
      omega
    refine ⟨q,hn,?_⟩
    have hp : (R.period:Int)≠0 := by exact_mod_cast Nat.ne_of_gt R.period_pos
    have heq : (R.period:Int)*(g:Int)=
        (R.period:Int)*((R.valueOffset+R.saltus*q:Nat):Int) := by
      dsimp only [Ray.discrepancy,Ray.target] at hd
      rw [hn] at hd
      push_cast at hd ⊢
      nlinarith [hd]
    exact_mod_cast (mul_left_cancel₀ hp heq)

theorem Ray.outside_stays_outside (R : Ray) (u : Int) (a b : Nat)
    (ha : a<2) (hb : b<2) (hu : ¬(-(R.bound:Int)≤u ∧ u≤R.bound)) :
    ¬(-(R.bound:Int)≤2*u+(R.saltus*a:Nat)-(R.period*b:Nat) ∧
      2*u+(R.saltus*a:Nat)-(R.period*b:Nat)≤R.bound) := by
  have hs : (R.saltus:Int)≤R.bound := by exact_mod_cast (show R.saltus≤R.bound by dsimp [Ray.bound]; omega)
  have hp : (R.period:Int)≤R.bound := by exact_mod_cast (show R.period≤R.bound by dsimp [Ray.bound]; omega)
  have ha' : a=0 ∨ a=1 := by omega
  have hb' : b=0 ∨ b=1 := by omega
  rcases ha' with rfl | rfl <;> rcases hb' with rfl | rfl <;>
    simp only [Nat.mul_zero,Nat.mul_one,Nat.cast_zero,add_zero,sub_zero] <;> omega

theorem Ray.classify_step (R : Ray) (n g : Nat) (d : Digit) :
    R.step (R.classify n g) d=R.classify (2*n+sizeBit d) (2*g+valueBit d) := by
  have hu : R.discrepancy (2*n+sizeBit d) (2*g+valueBit d)=
      2*R.discrepancy n g+(R.saltus*sizeBit d:Nat)-(R.period*valueBit d:Nat) := by
    dsimp only [Ray.discrepancy]
    push_cast
    ring
  dsimp only [Ray.classify]
  rw [hu]
  by_cases hn : -(R.bound:Int)≤R.discrepancy n g ∧ R.discrepancy n g≤R.bound
  · rw [dite_eq_left hn]
    simp only [Ray.step]
    split_ifs with hv
    · simp only [Option.some.injEq,Prod.mk.injEq,true_and]
      constructor
      · apply Fin.ext
        simp only [Nat.add_mod,Nat.mul_mod,Nat.mod_mod]
      · apply Fin.ext
        change min R.sizeOffset (2*min R.sizeOffset n+sizeBit d)=
          min R.sizeOffset (2*n+sizeBit d)
        by_cases hna : n≤R.sizeOffset
        · rw [Nat.min_eq_right hna]
        · rw [Nat.min_eq_left (by omega : R.sizeOffset≤n)]
          rw [Nat.min_eq_left (by omega : R.sizeOffset≤2*R.sizeOffset+sizeBit d)]
          rw [Nat.min_eq_left (by omega : R.sizeOffset≤2*n+sizeBit d)]
    · rfl
  · rw [dite_eq_right hn]
    simp only [Ray.step]
    rw [dite_eq_right (R.outside_stays_outside _ _ _ (sizeBit_bound d) (valueBit_bound d) hn)]

theorem Ray.classify_final (R : Ray) (n g : Nat) :
    R.final (R.classify n g)=true ↔ R.Relation n g := by
  by_cases h : -(R.bound:Int)≤R.discrepancy n g ∧ R.discrepancy n g≤R.bound
  · simp only [Ray.classify,dite_eq_left h,Ray.final]
    simp only [decide_eq_true_eq,min_eq_left_iff]
    exact (R.relation_iff n g).symm
  · have hnot : ¬R.Relation n g := by
      intro hr
      have hd := (R.relation_iff n g).mp hr
      exact h (hd.2.2 ▸ R.target_bound)
    simp only [Ray.classify,dite_eq_right h,Ray.final,Bool.false_eq_true,false_iff]
    exact hnot

theorem fold_decode (bit : Digit → Nat) (w : List Digit) (n : Nat) :
    w.foldl (fun a d => 2*a+bit d) n=n*2^w.length+decodeHigh bit w := by
  induction w generalizing n with
  | nil => simp [decodeHigh,decode]
  | cons d ds ih =>
    simp only [List.foldl_cons,ih,List.length_cons,pow_succ,decodeHigh_cons]
    ring

theorem Ray.graph_run (R : Ray) (n g : Nat) (w : List Digit) :
    R.graph.runFrom (R.classify n g) w=
      R.classify (w.foldl (fun a d => 2*a+sizeBit d) n)
        (w.foldl (fun a d => 2*a+valueBit d) g) := by
  induction w generalizing n g with
  | nil => rfl
  | cons d ds ih =>
    change R.graph.runFrom (R.step (R.classify n g) d) ds=_
    rw [R.classify_step,ih]
    rfl

theorem Ray.graph_correct (R : Ray) (w : List Digit) : R.graph.accepts w=true ↔
    R.Relation (decodeHigh sizeBit w) (decodeHigh valueBit w) := by
  change R.final (R.graph.runFrom (R.classify 0 0) w)=true ↔ _
  rw [R.graph_run,fold_decode,fold_decode]
  simp only [Nat.zero_mul,Nat.zero_add,R.classify_final]

#print axioms Ray.graph_correct
end BinaryAutomata.AffineGraph
