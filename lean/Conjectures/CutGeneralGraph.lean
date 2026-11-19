import Conjectures.CutGeneralDecision

/-! Uniform recognizers for arbitrary finite prefixes and arithmetic tails. -/
namespace CutGeneral
open BinaryAutomata CutFamily

/-- A singleton, or an arithmetic ray with positive size increment. -/
structure Piece where
  a : Nat
  b : Nat
  period : Nat
  saltus : Nat
  single : Bool
  a_pos : 0<a
  period_pos : 0<period

def Piece.Relation (R : Piece) (n g : Nat) : Prop :=
  ∃ q, n=R.a+R.period*q ∧ g=R.b+R.saltus*q ∧ (R.single=true → q=0)

def Piece.bound (R : Piece) : Nat :=
  R.saltus+R.period+R.saltus*R.a+R.period*R.b

abbrev Piece.Track (R : Piece) :=
  (Fin (2*R.bound+1) × Fin R.period) × Fin (R.a+2)

abbrev Piece.State (R : Piece) := Option R.Track

def Piece.counter (R : Piece) (u : Fin (2*R.bound+1)) : Int := (u.val:Int)-R.bound

def Piece.mkState (R : Piece) (u : Int) (r : Fin R.period) (c : Fin (R.a+2)) : R.State :=
  if h : -(R.bound:Int)≤u ∧ u≤R.bound then
    some ((⟨(u+R.bound).toNat,by omega⟩,r),c)
  else none

def Piece.classify (R : Piece) (n g : Nat) : R.State :=
  R.mkState ((R.saltus:Int)*n-(R.period:Int)*g)
    ⟨n%R.period,Nat.mod_lt _ R.period_pos⟩ ⟨min (R.a+1) n,by omega⟩

def Piece.rawStep (R : Piece) : R.State → Digit → R.State
  | none,_ => none
  | some ((u,r),c),d =>
    R.mkState (2*R.counter u+(R.saltus:Int)*sizeBit d-(R.period:Int)*valueBit d)
      ⟨(2*r.val+sizeBit d)%R.period,Nat.mod_lt _ R.period_pos⟩
      ⟨min (R.a+1) (2*c.val+sizeBit d),by omega⟩

def Piece.rawFinal (R : Piece) : R.State → Bool
  | none => false
  | some ((u,r),c) => decide (R.a≤c.val ∧
      r.val=R.a%R.period ∧
      R.counter u=(R.saltus:Int)*R.a-(R.period:Int)*R.b ∧
      (R.single=true → c.val=R.a))

def Piece.raw (R : Piece) : BinaryAutomata.DFA R.State :=
  ⟨R.rawStep,R.classify 0 0,R.rawFinal⟩

def Piece.trackEquiv (R : Piece) : R.Track ≃ Fin ((2*R.bound+1)*R.period*(R.a+2)) :=
  (Equiv.prodCongr finProdFinEquiv (Equiv.refl _)).trans finProdFinEquiv

def Piece.stateEquiv (R : Piece) : R.State ≃ Fin ((2*R.bound+1)*R.period*(R.a+2)+1) :=
  (Equiv.optionCongr R.trackEquiv).trans (finSuccEquiv _).symm

def Piece.machine (R : Piece) : Machine := ⟨_,relabel R.stateEquiv R.raw⟩

theorem Piece.outside_stays_outside (R : Piece) (u : Int) (x y : Nat)
    (hx : x<2) (hy : y<2)
    (h : ¬ (-(R.bound:Int)≤u ∧ u≤R.bound)) :
    ¬ (-(R.bound:Int)≤2*u+(R.saltus:Int)*x-(R.period:Int)*y ∧
      2*u+(R.saltus:Int)*x-(R.period:Int)*y≤R.bound) := by
  have hs : (R.saltus:Int)≤R.bound := by unfold Piece.bound; omega
  have hp : (R.period:Int)≤R.bound := by unfold Piece.bound; omega
  have hx0 : 0≤(R.saltus:Int)*x := by positivity
  have hx1 : (R.saltus:Int)*x≤R.saltus := by
    have h := mul_nonneg (show (0:Int)≤R.saltus by positivity) (show 0≤1-(x:Int) by omega)
    nlinarith
  have hy0 : 0≤(R.period:Int)*y := by positivity
  have hy1 : (R.period:Int)*y≤R.period := by
    have h := mul_nonneg (show (0:Int)≤R.period by positivity) (show 0≤1-(y:Int) by omega)
    nlinarith
  omega

theorem Piece.classify_step (R : Piece) (n g : Nat) (d : Digit) :
    R.rawStep (R.classify n g) d=R.classify (2*n+sizeBit d) (2*g+valueBit d) := by
  let u : Int := (R.saltus:Int)*n-(R.period:Int)*g
  have hu : (R.saltus:Int)*(↑(2*n+sizeBit d):Int)-(R.period:Int)*(↑(2*g+valueBit d):Int)=
      2*u+(R.saltus:Int)*sizeBit d-(R.period:Int)*valueBit d := by dsimp [u]; ring
  have hmod : (2*(n%R.period)+sizeBit d)%R.period=(2*n+sizeBit d)%R.period := by
    simp [Nat.add_mod,Nat.mul_mod]
  have hcap : min (R.a+1) (2*min (R.a+1) n+sizeBit d)=
      min (R.a+1) (2*n+sizeBit d) := by omega
  by_cases h : -(R.bound:Int)≤u ∧ u≤R.bound
  · have hread : ((((R.saltus:Int)*n-(R.period:Int)*g+R.bound).toNat:Int)-R.bound)=u := by
      dsimp [u] at *
      omega
    rw [Piece.classify,Piece.mkState,dite_eq_left h,Piece.rawStep]
    simp only [Piece.counter]
    rw [hread,Piece.classify,hu]
    congr 1
    · exact Fin.ext hmod
    · exact Fin.ext hcap
  · have hbad := R.outside_stays_outside u (sizeBit d) (valueBit d)
      (sizeBit_bound d) (valueBit_bound d) h
    rw [Piece.classify,Piece.mkState,dite_eq_right h,Piece.rawStep]
    rw [Piece.classify,hu,Piece.mkState,dite_eq_right hbad]

theorem Piece.relation_arithmetic (R : Piece) (n g : Nat) :
    R.Relation n g ↔ R.a≤n ∧ n%R.period=R.a%R.period ∧
      (R.saltus:Int)*n-(R.period:Int)*g=(R.saltus:Int)*R.a-(R.period:Int)*R.b ∧
      (R.single=true → n=R.a) := by
  constructor
  · rintro ⟨q,rfl,rfl,hq⟩
    refine ⟨by omega,by simp,by push_cast; ring,?_⟩
    intro hs
    rw [hq hs]
    simp
  · rintro ⟨hna,hmod,hu,hsingle⟩
    have hm : (n-R.a)%R.period=0 := by
      have hh : Nat.ModEq R.period n R.a := hmod
      have hh' := Nat.ModEq.sub_right hna (Nat.le_refl R.a) hh
      simpa [Nat.ModEq] using hh'
    have hdiv := Nat.mod_add_div (n-R.a) R.period
    have hn : n=R.a+R.period*((n-R.a)/R.period) := by omega
    refine ⟨(n-R.a)/R.period,hn,?_,?_⟩
    · have hp : (0:Int)<R.period := by exact_mod_cast R.period_pos
      have hnZ : (n:Int)=R.a+(R.period:Int)*((n-R.a)/R.period) := by exact_mod_cast hn
      have hgZ : (g:Int)=R.b+(R.saltus:Int)*((n-R.a)/R.period) := by
        rw [hnZ] at hu
        nlinarith
      exact_mod_cast hgZ
    · intro hs
      rw [hsingle hs]
      simp

theorem Piece.relation_bound (R : Piece) (n g : Nat) (h : R.Relation n g) :
    -(R.bound:Int)≤(R.saltus:Int)*n-(R.period:Int)*g ∧
      (R.saltus:Int)*n-(R.period:Int)*g≤R.bound := by
  rw [(R.relation_arithmetic n g).mp h |>.2.2.1]
  unfold Piece.bound
  push_cast
  have hs : (0:Int)≤(R.saltus:Int)*R.a := by positivity
  have hp : (0:Int)≤(R.period:Int)*R.b := by positivity
  constructor <;> nlinarith

theorem Piece.classify_final (R : Piece) (n g : Nat) :
    R.rawFinal (R.classify n g)=true ↔ R.Relation n g := by
  by_cases h : -(R.bound:Int)≤(R.saltus:Int)*n-(R.period:Int)*g ∧
      (R.saltus:Int)*n-(R.period:Int)*g≤R.bound
  · have hread : ((((R.saltus:Int)*n-(R.period:Int)*g+R.bound).toNat:Int)-R.bound)=
        (R.saltus:Int)*n-(R.period:Int)*g := by omega
    simp only [Piece.classify,Piece.mkState,dite_eq_left h,Piece.rawFinal,Piece.counter,hread,decide_eq_true_eq]
    rw [R.relation_arithmetic]
    constructor
    · rintro ⟨ha,hr,hu,hs⟩
      exact ⟨by omega,hr,hu,fun hh => by have := hs hh; omega⟩
    · rintro ⟨ha,hr,hu,hs⟩
      exact ⟨by omega,hr,hu,fun hh => by rw [hs hh]; omega⟩
  · simp only [Piece.classify,Piece.mkState,dite_eq_right h,Piece.rawFinal,Bool.false_eq_true,false_iff]
    intro hr
    exact h (R.relation_bound n g hr)

theorem foldl_decodeHigh (bit : Digit → Nat) (w : List Digit) (n : Nat) :
    w.foldl (fun a d => 2*a+bit d) n=n*2^w.length+decodeHigh bit w := by
  induction w generalizing n with
  | nil => simp [decodeHigh,decode]
  | cons d ds ih =>
    simp only [List.foldl_cons,ih,List.length_cons,pow_succ,decodeHigh_cons]
    ring

theorem Piece.raw_run (R : Piece) (n g : Nat) (w : List Digit) :
    R.raw.runFrom (R.classify n g) w=
      R.classify (w.foldl (fun a d => 2*a+sizeBit d) n)
        (w.foldl (fun a d => 2*a+valueBit d) g) := by
  induction w generalizing n g with
  | nil => rfl
  | cons d ds ih =>
    change R.raw.runFrom (R.rawStep (R.classify n g) d) ds=_
    rw [R.classify_step,ih]
    rfl

theorem Piece.machine_correct (R : Piece) (w : List Digit) :
    R.machine.accepts w=true ↔ R.Relation (decodeHigh sizeBit w) (decodeHigh valueBit w) := by
  change (relabel R.stateEquiv R.raw).accepts w=true ↔ _
  rw [relabel_accepts]
  change R.rawFinal (R.raw.runFrom (R.classify 0 0) w)=true ↔ _
  rw [R.raw_run,foldl_decodeHigh,foldl_decodeHigh]
  simp only [Nat.zero_mul,Nat.zero_add,R.classify_final]

theorem Piece.positive_size (R : Piece) (n g : Nat) (h : R.Relation n g) : 0<n := by
  have hn := ((R.relation_arithmetic n g).mp h).1
  exact lt_of_lt_of_le R.a_pos hn

theorem Piece.linear_bound (R : Piece) (n g : Nat) (h : R.Relation n g) :
    g≤(R.b+R.saltus)*n := by
  obtain ⟨q,hn,hg,_⟩ := h
  have hp : 1≤R.period := R.period_pos
  have hq : q≤n := by
    have hmul : q≤R.period*q := by simpa using Nat.mul_le_mul_right q hp
    omega
  have hnpos : 1≤n := by have := R.a_pos; omega
  have hb : R.b≤R.b*n := by simpa using Nat.mul_le_mul_left R.b hnpos
  have hs : R.saltus*q≤R.saltus*n := Nat.mul_le_mul_left R.saltus hq
  rw [hg,Nat.add_mul]
  omega

#print axioms Piece.machine_correct

/-- The input to the general test: a finite positive-size prefix, a positive
period, one value for each tail residue, and a nonnegative additive increase. -/
structure Candidate where
  prefixLength : Nat
  prefixValues : Fin prefixLength → Nat
  period : Nat
  period_pos : 0<period
  tail : Fin period → Nat
  saltus : Nat

def Candidate.value (c : Candidate) (n : Nat) : Nat :=
  if hn : n=0 then 0
  else if hs : n≤c.prefixLength then c.prefixValues ⟨n-1,by omega⟩
  else c.saltus*((n-c.prefixLength-1)/c.period)+
    c.tail ⟨(n-c.prefixLength-1)%c.period,Nat.mod_lt _ c.period_pos⟩

def Candidate.prefixPiece (c : Candidate) (i : Fin c.prefixLength) : Piece :=
  ⟨i.val+1,c.prefixValues i,1,0,true,by omega,by decide⟩

def Candidate.tailPiece (c : Candidate) (i : Fin c.period) : Piece :=
  ⟨c.prefixLength+1+i.val,c.tail i,c.period,c.saltus,false,by omega,c.period_pos⟩

def Candidate.pieces (c : Candidate) : List Piece :=
  (List.finRange c.prefixLength).map c.prefixPiece ++
    (List.finRange c.period).map c.tailPiece

theorem Candidate.prefixPiece_mem (c : Candidate) (i : Fin c.prefixLength) :
    c.prefixPiece i∈c.pieces := by
  apply List.mem_append_left
  exact List.mem_map.mpr ⟨i,by simp,rfl⟩

theorem Candidate.tailPiece_mem (c : Candidate) (i : Fin c.period) :
    c.tailPiece i∈c.pieces := by
  apply List.mem_append_right
  exact List.mem_map.mpr ⟨i,by simp,rfl⟩

theorem Candidate.prefixPiece_relation (c : Candidate) (i : Fin c.prefixLength) (n g : Nat) :
    (c.prefixPiece i).Relation n g ↔ n=i.val+1 ∧ g=c.prefixValues i := by
  constructor
  · rintro ⟨q,hn,hg,hq⟩
    have hzero : q=0 := hq rfl
    subst q
    simpa [Candidate.prefixPiece] using And.intro hn hg
  · rintro ⟨hn,hg⟩
    exact ⟨0,by simpa [Candidate.prefixPiece] using hn,
      by simpa [Candidate.prefixPiece] using hg,fun _ => rfl⟩

theorem Candidate.value_prefix (c : Candidate) (i : Fin c.prefixLength) :
    c.value (i.val+1)=c.prefixValues i := by
  have hs : i.val+1≤c.prefixLength := i.isLt
  simp only [Candidate.value,dite_eq_right (by omega : i.val+1≠0),dite_eq_left hs,Nat.add_sub_cancel]

theorem Candidate.value_tail (c : Candidate) (i : Fin c.period) (q : Nat) :
    c.value (c.prefixLength+1+i.val+c.period*q)=c.tail i+c.saltus*q := by
  have hn : c.prefixLength+1+i.val+c.period*q≠0 := by omega
  have hs : ¬c.prefixLength+1+i.val+c.period*q≤c.prefixLength := by omega
  have hsub : c.prefixLength+1+i.val+c.period*q-c.prefixLength-1=i.val+c.period*q := by omega
  have hd : (i.val+c.period*q)/c.period=q := by
    simpa only [Nat.div_eq_of_lt i.isLt,Nat.zero_add] using
      Nat.add_mul_div_left i.val q c.period_pos
  have hm : (i.val+c.period*q)%c.period=i.val := by
    simp only [Nat.add_mul_mod_self_left,Nat.mod_eq_of_lt i.isLt]
  simp only [Candidate.value,dite_eq_right hn,dite_eq_right hs,hsub,hd,hm]
  change c.saltus*q+c.tail i=c.tail i+c.saltus*q
  omega

/-- The list of arithmetic pieces is exactly the proposed function graph. -/
theorem Candidate.pieces_correct (c : Candidate) (n g : Nat) :
    (∃ R∈c.pieces, R.Relation n g) ↔ 0<n ∧ g=c.value n := by
  constructor
  · rintro ⟨R,hR,hng⟩
    have hn := R.positive_size n g hng
    refine ⟨hn,?_⟩
    rcases List.mem_append.mp hR with hR | hR
    · obtain ⟨i,_,rfl⟩ := List.mem_map.mp hR
      obtain ⟨rfl,rfl⟩ := (c.prefixPiece_relation i n g).mp hng
      exact (c.value_prefix i).symm
    · obtain ⟨i,_,rfl⟩ := List.mem_map.mp hR
      obtain ⟨q,hn,hg,_⟩ := hng
      change n=c.prefixLength+1+i.val+c.period*q at hn
      change g=c.tail i+c.saltus*q at hg
      rw [hn,c.value_tail,hg]
  · rintro ⟨hn,rfl⟩
    by_cases hs : n≤c.prefixLength
    · let i : Fin c.prefixLength := ⟨n-1,by omega⟩
      have hi : n=i.val+1 := by dsimp [i]; omega
      refine ⟨c.prefixPiece i,c.prefixPiece_mem i,?_⟩
      apply (c.prefixPiece_relation i n (c.value n)).mpr
      exact ⟨hi,by rw [hi,c.value_prefix]⟩
    · let i : Fin c.period := ⟨(n-c.prefixLength-1)%c.period,Nat.mod_lt _ c.period_pos⟩
      let q := (n-c.prefixLength-1)/c.period
      have hdiv := Nat.mod_add_div (n-c.prefixLength-1) c.period
      have hi : n=c.prefixLength+1+i.val+c.period*q := by dsimp [i,q]; omega
      refine ⟨c.tailPiece i,c.tailPiece_mem i,q,hi,?_,by simp [Candidate.tailPiece]⟩
      change c.value n=c.tail i+c.saltus*q
      rw [hi,c.value_tail]

def Candidate.graph (c : Candidate) : Machine := Machine.unions (c.pieces.map Piece.machine)

theorem Candidate.graph_correct (c : Candidate) : Graph c.value c.graph := by
  intro w
  rw [Candidate.graph,Machine.unions_accepts,←c.pieces_correct]
  constructor
  · rintro ⟨A,hA,ha⟩
    obtain ⟨R,hR,rfl⟩ := List.mem_map.mp hA
    exact ⟨R,hR,(R.machine_correct w).mp ha⟩
  · rintro ⟨R,hR,hr⟩
    exact ⟨R.machine,List.mem_map.mpr ⟨R,hR,rfl⟩,(R.machine_correct w).mpr hr⟩

theorem member_le_sum (l : List Nat) (a : Nat) (ha : a∈l) : a≤l.sum := by
  induction l with
  | nil => simp at ha
  | cons b l ih =>
    rcases List.mem_cons.mp ha with rfl | ha
    · simp
    · have h := ih ha
      simp only [List.sum_cons]
      omega

def Candidate.linearBound (c : Candidate) : Nat :=
  1+(c.pieces.map (fun R => R.b+R.saltus)).sum

theorem Candidate.linearBound_pos (c : Candidate) : 1≤c.linearBound := by
  unfold Candidate.linearBound
  omega

theorem Candidate.value_bound (c : Candidate) (n : Nat) (hn : 0<n) :
    c.value n≤c.linearBound*n := by
  obtain ⟨R,hR,hr⟩ := (c.pieces_correct n (c.value n)).mpr ⟨hn,rfl⟩
  have hw := member_le_sum (c.pieces.map (fun R => R.b+R.saltus)) (R.b+R.saltus)
    (List.mem_map.mpr ⟨R,hR,rfl⟩)
  have hle : R.b+R.saltus≤c.linearBound := by unfold Candidate.linearBound; omega
  exact (R.linear_bound n (c.value n) hr).trans (Nat.mul_le_mul_right n hle)

/-- The complete terminating general test. Its input contains no guessed
automata, semantic certificates, or unformalized mathematical hypotheses. -/
def Candidate.test (c : Candidate) (cuts : List Nat) : Bool :=
  graphTest c.graph (c.linearBound+1) cuts

theorem Candidate.test_correct (c : Candidate) (cuts : List Nat) :
    c.test cuts=true ↔ SatisfiesMex {d | d∈cuts} c.value := by
  apply graphTest_correct c.value c.graph c.linearBound (c.linearBound+1)
    c.linearBound_pos _ c.value_bound c.graph_correct cuts
  have h : c.linearBound+1<2^(c.linearBound+1) := Nat.lt_two_pow_self
  omega

theorem Candidate.test_identifies_grundy (c : Candidate) (cuts : List Nat)
    (htest : c.test cuts=true) (G : Nat → Nat) (hG : SatisfiesMex {d | d∈cuts} G) :
    ∀ n, 0<n → G n=c.value n :=
  grundy_unique _ _ _ hG ((c.test_correct cuts).mp htest)

#print axioms Candidate.test_correct
#print axioms Candidate.test_identifies_grundy

end CutGeneral
