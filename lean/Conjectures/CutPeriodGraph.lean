import Conjectures.BinaryArithmetic

/-! Arithmetic semantics of the candidate CUT graph automaton. -/
namespace CutPeriod
open BinaryAutomata

def prefixValues : List Nat := [0,1,2,3,1,4]
def block : List Nat := [3,2,4,5,6,7,8,9,7,11,9,8]

def value (n : Nat) : Nat :=
  if n=0 then 0 else if n≤6 then prefixValues[n-1]! else 8*((n-7)/12)+block[(n-7)%12]!

abbrev Track := ℤ × Fin 12 × Fin 8
abbrev State := Option Track

def classify (n g : Nat) : State :=
  let u : ℤ := 2*(n:ℤ)-3*(g:ℤ)
  if -15≤u ∧ u≤15 then some (u,Fin.ofNat 12 n,Fin.ofNat 8 (min 7 n)) else none

def rawStep (s : State) (d : Digit) : State :=
  match s with
  | none => none
  | some (u,r,c) =>
    let v := 2*u+2*(sizeBit d:ℤ)-3*(valueBit d:ℤ)
    if -15≤v ∧ v≤15 then
      some (v,Fin.ofNat 12 (2*r.val+sizeBit d),Fin.ofNat 8 (min 7 (2*c.val+sizeBit d)))
    else none

def representative (r : Fin 12) (c : Fin 8) : Nat :=
  if c.val<7 then c.val else 7+(r.val+5)%12

def rawFinal : State → Bool
  | none => false
  | some (u,r,c) => decide (0<c.val ∧ u=2*(representative r c:ℤ)-3*(value (representative r c):ℤ))

def graph : DFA State := ⟨rawStep,classify 0 0,rawFinal⟩

/-- Once the discrepancy leaves [-15,15], binary extension cannot return. -/
theorem outside_stays_outside (u : ℤ) (a b : Nat) (ha : a<2) (hb : b<2)
    (h : ¬(-15≤u ∧ u≤15)) : ¬(-15≤2*u+2*a-3*b ∧ 2*u+2*a-3*b≤15) := by omega

/-- The finite counter state is exactly the numerical binary-prefix state. -/
theorem classify_step (n g : Nat) (d : Digit) :
    rawStep (classify n g) d=classify (2*n+sizeBit d) (2*g+valueBit d) := by
  have ha := sizeBit_bound d
  have hb := valueBit_bound d
  have hu : (2:ℤ)*(2*n+sizeBit d)-3*(2*g+valueBit d)=
      2*(2*(n:ℤ)-3*(g:ℤ))+2*(sizeBit d:ℤ)-3*(valueBit d:ℤ) := by ring
  dsimp only [classify]
  push_cast
  rw [hu]
  by_cases hn : -15≤2*(n:ℤ)-3*(g:ℤ) ∧ 2*(n:ℤ)-3*(g:ℤ)≤15
  · rw [ite_eq_left hn]
    simp only [rawStep]
    split_ifs with hv
    · simp only [Option.some.injEq,Prod.mk.injEq,true_and]
      constructor
      · apply Fin.ext
        simp only [Fin.val_ofNat]
        omega
      · apply Fin.ext
        simp only [Fin.val_ofNat]
        have hmin : (min 7 n)%8=min 7 n := Nat.mod_eq_of_lt (by omega)
        rw [hmin]
        have hcap : min 7 (2*min 7 n+sizeBit d)=min 7 (2*n+sizeBit d) := by
          by_cases hn7 : n≤7
          · rw [Nat.min_eq_right hn7]
          · rw [Nat.min_eq_left (by omega : 7≤n)]
            rw [Nat.min_eq_left (by omega : 7≤2*7+sizeBit d)]
            rw [Nat.min_eq_left (by omega : 7≤2*n+sizeBit d)]
        rw [hcap]
    · rfl
  · rw [ite_eq_right hn]
    simp only [rawStep]
    have hbad := outside_stays_outside (2*(n:ℤ)-3*(g:ℤ)) (sizeBit d) (valueBit d) ha hb hn
    rw [ite_eq_right hbad]

theorem value_tail (n : Nat) (hn : 7≤n) :
    value n=8*((n-7)/12)+block[(n-7)%12]! := by
  simp only [value,ite_eq_right (by omega : n≠0),ite_eq_right (by omega : ¬n≤6)]

theorem value_rep (r : Nat) (hr : r<12) : value (7+r)=block[r]! := by
  have hlarge : ¬7+r≤6 := by omega
  simp [value,hlarge,Nat.div_eq_of_lt hr,Nat.mod_eq_of_lt hr]

/-- The discrepancy is bounded uniformly over the entire proposed sequence. -/
theorem value_discrepancy (n : Nat) :
    -15≤2*(n:ℤ)-3*(value n:ℤ) ∧ 2*(n:ℤ)-3*(value n:ℤ)≤15 := by
  by_cases hn : n≤6
  · have hsmall : ∀ i : Fin 7, -15≤2*(i.val:ℤ)-3*(value i.val:ℤ) ∧
        2*(i.val:ℤ)-3*(value i.val:ℤ)≤15 := by decide
    exact hsmall ⟨n,by omega⟩
  · have hdiv := Nat.mod_add_div (n-7) 12
    have hr := Nat.mod_lt (n-7) (by decide : 0<12)
    have hfinite : ∀ r : Fin 12, -15≤2*(7+(r.val:ℤ))-3*(block[r.val]!:ℤ) ∧
        2*(7+(r.val:ℤ))-3*(block[r.val]!:ℤ)≤15 := by decide
    have hb := hfinite ⟨(n-7)%12,hr⟩
    dsimp only at hb
    rw [value_tail n (by omega)]
    omega

/-- Acceptance of the exact numerical state, before clipping its discrepancy. -/
theorem tracked_final (n g : Nat) :
    rawFinal (some (2*(n:ℤ)-3*(g:ℤ),Fin.ofNat 12 n,Fin.ofNat 8 (min 7 n)))=
      decide (0<n ∧ g=value n) := by
  have hmod : (min 7 n)%8=min 7 n := Nat.mod_eq_of_lt (by omega)
  by_cases hn : n≤6
  · have hm : min 7 n=n := Nat.min_eq_right (by omega)
    have hn8 : n%8=n := Nat.mod_eq_of_lt (by omega)
    have hrep : representative (Fin.ofNat 12 n) (Fin.ofNat 8 (min 7 n))=n := by
      simp only [representative,Fin.val_ofNat,hm,hn8,ite_eq_left (by omega : n<7)]
    change decide (0<(Fin.ofNat 8 (min 7 n)).val ∧
      2*(n:ℤ)-3*(g:ℤ)=2*(representative (Fin.ofNat 12 n) (Fin.ofNat 8 (min 7 n)):ℤ)-
        3*(value (representative (Fin.ofNat 12 n) (Fin.ofNat 8 (min 7 n))):ℤ))=_
    rw [hrep]
    simp only [Fin.val_ofNat,hm,hn8]
    apply Bool.eq_iff_iff.mpr
    simp only [decide_eq_true_eq]
    omega
  · have hcap : min 7 n=7 := Nat.min_eq_left (by omega)
    have hr := Nat.mod_lt (n-7) (by decide : 0<12)
    have hdiv := Nat.mod_add_div (n-7) 12
    have hrep : representative (Fin.ofNat 12 n) (Fin.ofNat 8 (min 7 n))=7+(n-7)%12 := by
      simp only [representative,Fin.val_ofNat,hcap]
      norm_num
      omega
    change decide (0<(Fin.ofNat 8 (min 7 n)).val ∧
      2*(n:ℤ)-3*(g:ℤ)=2*(representative (Fin.ofNat 12 n) (Fin.ofNat 8 (min 7 n)):ℤ)-
        3*(value (representative (Fin.ofNat 12 n) (Fin.ofNat 8 (min 7 n))):ℤ))=_
    rw [hrep]
    simp only [Fin.val_ofNat,hcap,show 7%8=7 by decide]
    rw [value_rep _ hr,value_tail n (by omega)]
    apply Bool.eq_iff_iff.mpr
    simp only [decide_eq_true_eq]
    omega

/-- The accepting clipped states represent precisely the proposed graph. -/
theorem classify_final (n g : Nat) :
    rawFinal (classify n g)=decide (0<n ∧ g=value n) := by
  dsimp only [classify]
  split_ifs with h
  · exact tracked_final n g
  · have hne : g≠value n := by intro heq; subst g; exact h (value_discrepancy n)
    simp [rawFinal,hne]

theorem foldl_decodeHigh (bit : Digit → Nat) (w : List Digit) (n : Nat) :
    w.foldl (fun a d => 2*a+bit d) n=n*2^w.length+decodeHigh bit w := by
  induction w generalizing n with
  | nil => simp [decodeHigh,decode]
  | cons d ds ih =>
    simp only [List.foldl_cons,ih,List.length_cons,pow_succ,decodeHigh_cons]
    ring

theorem graph_run (n g : Nat) (w : List Digit) :
    graph.runFrom (classify n g) w=
      classify (w.foldl (fun a d => 2*a+sizeBit d) n) (w.foldl (fun a d => 2*a+valueBit d) g) := by
  induction w generalizing n g with
  | nil => rfl
  | cons d ds ih =>
    change graph.runFrom (rawStep (classify n g) d) ds=_
    rw [classify_step,ih]
    rfl

/-- The infinite-state arithmetic interpretation, for every finite binary word. -/
theorem graph_correct (w : List Digit) : graph.accepts w=true ↔
    0<decodeHigh sizeBit w ∧ decodeHigh valueBit w=value (decodeHigh sizeBit w) := by
  change rawFinal (graph.runFrom (classify 0 0) w)=true ↔ _
  rw [graph_run,foldl_decodeHigh,foldl_decodeHigh]
  simp only [Nat.zero_mul,Nat.zero_add,classify_final,decide_eq_true_eq]

#print axioms graph_correct
end CutPeriod
