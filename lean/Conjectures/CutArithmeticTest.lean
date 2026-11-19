import Conjectures.BinaryRecognizers
import Conjectures.CutFamilyGame
import Mathlib.Data.Finset.Sort

/-! A uniform terminating test for every finite CUT rule set and every proposed
finite prefix followed by an arithmetic tail. The recognizers are constructed
here; none is an unproved hypothesis of the final theorem. -/
namespace CutPeriod.Decision
open BinaryAutomata CutFamily

def PilesFor (f : Nat → Nat) (p n g : Nat) : Prop :=
  ∃ l : List Nat, (∀ h∈l, 0<h) ∧ l.length=p ∧ l.sum=n ∧ xorList (l.map f)=g

theorem piles_zero_iff (f : Nat → Nat) (n g : Nat) : PilesFor f 0 n g ↔ n=0 ∧ g=0 := by
  constructor
  · rintro ⟨l,_,hlen,hsum,hxor⟩
    have hl : l=[] := List.eq_nil_of_length_eq_zero hlen
    subst l
    exact ⟨hsum.symm,hxor.symm⟩
  · rintro ⟨rfl,rfl⟩
    exact ⟨[],by simp,rfl,rfl,rfl⟩

theorem piles_succ_iff (f : Nat → Nat) (p n g : Nat) : PilesFor f (p+1) n g ↔
    SumRelation (PilesFor f p) (fun b y => 0<b ∧ y=f b) n g := by
  constructor
  · rintro ⟨l,hpos,hlen,hsum,hxor⟩
    cases l with
    | nil => simp at hlen
    | cons b ls =>
      have hb := hpos b (by simp)
      have hls : ∀ h∈ls, 0<h := fun h hh => hpos h (by simp [hh])
      have hlen' : ls.length=p := by simpa using hlen
      refine ⟨ls.sum,xorList (ls.map f),b,f b,⟨ls,hls,hlen',rfl,rfl⟩,⟨hb,rfl⟩,?_,?_⟩
      · simpa only [List.sum_cons,Nat.add_comm] using hsum
      · simpa only [List.map_cons,xorList,Nat.xor_comm] using hxor
  · rintro ⟨a,x,b,y,⟨l,hpos,hlen,hsum,hxor⟩,⟨hb,hy⟩,hadd,hout⟩
    refine ⟨b::l,?_,by simp [hlen],?_,?_⟩
    · intro h hh
      rcases List.mem_cons.mp hh with rfl | hh
      · exact hb
      · exact hpos h hh
    · simp only [List.sum_cons,hsum]
      omega
    · simp only [List.map_cons,xorList,hxor]
      rw [←hy,Nat.xor_comm]
      exact hout

def pileRecognizer (f : Nat → Nat) (graph : Recognizer (fun n g => 0<n ∧ g=f n)) :
    (p : Nat) → Recognizer (PilesFor f p)
  | 0 => (Recognizer.point 0 0).change (fun n g => (piles_zero_iff f n g).symm)
  | p+1 => ((pileRecognizer f graph p).sum graph).change
      (fun n g => (piles_succ_iff f p n g).symm)

def OptionsFor (f : Nat → Nat) (cuts : List Nat) (n g : Nat) : Prop :=
  ∃ d, d∈cuts ∧ 0<d ∧ PilesFor f (d+1) n g

theorem options_nil_iff (f : Nat → Nat) (n g : Nat) : OptionsFor f [] n g ↔ False := by
  simp [OptionsFor]

theorem options_cons_iff (f : Nat → Nat) (d : Nat) (cuts : List Nat) (n g : Nat) :
    OptionsFor f (d::cuts) n g ↔
      (0<d ∧ PilesFor f (d+1) n g) ∨ OptionsFor f cuts n g := by
  constructor
  · rintro ⟨c,hc,hpos,hpiles⟩
    rcases List.mem_cons.mp hc with rfl | hc
    · exact Or.inl ⟨hpos,hpiles⟩
    · exact Or.inr ⟨c,hc,hpos,hpiles⟩
  · rintro (⟨hd,hpiles⟩ | ⟨c,hc,hpos,hpiles⟩)
    · exact ⟨d,by simp,hd,hpiles⟩
    · exact ⟨c,by simp [hc],hpos,hpiles⟩

def optionsRecognizer (f : Nat → Nat) (graph : Recognizer (fun n g => 0<n ∧ g=f n)) :
    (cuts : List Nat) → Recognizer (OptionsFor f cuts)
  | [] => (Recognizer.constant False).change (fun n g => (options_nil_iff f n g).symm)
  | d::cuts =>
      ((Recognizer.guard (0<d) (pileRecognizer f graph (d+1))).union
        (optionsRecognizer f graph cuts)).change
          (fun n g => (options_cons_iff f d cuts n g).symm)

theorem options_iff_actual (f : Nat → Nat) (cuts : List Nat) (n g : Nat) :
    OptionsFor f cuts n g ↔ OptionValue {d | d∈cuts} f n g := by
  constructor
  · rintro ⟨d,hd,hpos,l,hlpos,hlen,hsum,hxor⟩
    refine ⟨l,hlpos,by omega,?_,hsum,hxor⟩
    change l.length-1∈cuts
    simpa only [hlen,Nat.add_sub_cancel] using hd
  · rintro ⟨l,hpos,hlen,hcut,hsum,hxor⟩
    exact ⟨l.length-1,hcut,by omega,l,hpos,by omega,hsum,hxor⟩

def lowerRecognizer (f : Nat → Nat) (graph : Recognizer (fun n g => 0<n ∧ g=f n)) :
    Recognizer (fun n g => 0<n ∧ g<f n) :=
  graph.lower.change (by
    intro n g
    constructor
    · rintro ⟨h,⟨hn,hf⟩,hlt⟩
      exact ⟨hn,by simpa only [hf] using hlt⟩
    · rintro ⟨hn,hg⟩
      exact ⟨f n,⟨hn,rfl⟩,hg⟩)

def actualOptions (T : Tail) (cuts : List Nat) :
    Recognizer (OptionValue {d | d∈cuts} T.value) :=
  (optionsRecognizer T.value T.recognizer cuts).change (options_iff_actual T.value cuts)

/-- Total finite computation. Its nested state spaces can be large, but each
input fixes a finite number of states and a finite complete word search. -/
def finiteTest (T : Tail) (cuts : List Nat) : Bool :=
  let options := actualOptions T cuts
  (T.recognizer.intersect options).emptyCheck &&
    ((lowerRecognizer T.value T.recognizer).difference options).emptyCheck

/-- The complete general arithmetic-periodicity test, with no recognizer or
padding hypothesis. Zero cuts, if present in the input list, cannot make a legal move. -/
theorem finiteTest_correct (T : Tail) (cuts : List Nat) : finiteTest T cuts=true ↔
    SatisfiesMex {d | d∈cuts} T.value := by
  classical
  rw [finiteTest,Bool.and_eq_true,Recognizer.emptyCheck_correct,Recognizer.emptyCheck_correct]
  constructor
  · rintro ⟨hcollision,hmissing⟩ n hn
    constructor
    · intro hop
      exact hcollision n (T.value n) ⟨⟨hn,rfl⟩,hop⟩
    · intro g hg
      by_contra hno
      exact hmissing n g ⟨⟨hn,hg⟩,hno⟩
  · intro hmex
    constructor
    · rintro n g ⟨⟨hn,hg⟩,hop⟩
      rw [hg] at hop
      exact (hmex n hn).1 hop
    · rintro n g ⟨⟨hn,hg⟩,hno⟩
      exact hno ((hmex n hn).2 g hg)

theorem options_congr (cuts : Set Nat) (f g : Nat → Nat)
    (h : ∀ n, 0<n → f n=g n) (n v : Nat) :
    OptionValue cuts f n v ↔ OptionValue cuts g n v := by
  constructor
  all_goals
    rintro ⟨l,hpos,hlen,hcut,hsum,hxor⟩
    have hmap : l.map f=l.map g := List.map_congr_left (fun n hn => h n (hpos n hn))
    refine ⟨l,hpos,hlen,hcut,hsum,?_⟩
  · rw [←hmap]
    exact hxor
  · rw [hmap]
    exact hxor

theorem satisfiesMex_congr (cuts : Set Nat) (f g : Nat → Nat)
    (h : ∀ n, 0<n → f n=g n) : SatisfiesMex cuts f ↔ SatisfiesMex cuts g := by
  unfold SatisfiesMex IsMex
  constructor
  · intro hf n hn
    constructor
    · intro hop
      apply (hf n hn).1
      apply (options_congr cuts f g h n (f n)).mpr
      simpa only [h n hn] using hop
    · intro v hv
      apply (options_congr cuts f g h n v).mp
      apply (hf n hn).2
      simpa only [h n hn] using hv
  · intro hg n hn
    constructor
    · intro hop
      apply (hg n hn).1
      have hop' := (options_congr cuts f g h n (f n)).mp hop
      simpa only [h n hn] using hop'
    · intro v hv
      apply (options_congr cuts f g h n v).mpr
      apply (hg n hn).2
      simpa only [h n hn] using hv

/-- The test accepts exactly the candidate functions that agree on every
positive pile with a function satisfying the game's recursive mex equations. -/
theorem finiteTest_iff_grundy (T : Tail) (cuts : List Nat) (G : Nat → Nat)
    (hG : SatisfiesMex {d | d∈cuts} G) : finiteTest T cuts=true ↔
      ∀ n, 0<n → T.value n=G n := by
  rw [finiteTest_correct]
  constructor
  · intro hT
    exact grundy_unique _ _ _ hT hG
  · intro h
    exact (satisfiesMex_congr _ _ _ h).mpr hG

def finiteSetTest (T : Tail) (cuts : Finset Nat) : Bool :=
  finiteTest T (cuts.sort (·≤·))

theorem finiteSetTest_correct (T : Tail) (cuts : Finset Nat) :
    finiteSetTest T cuts=true ↔ SatisfiesMex (↑cuts : Set Nat) T.value := by
  have hcuts : {d | d∈cuts.sort (·≤·)}=(↑cuts : Set Nat) := by
    ext d
    exact Finset.mem_sort (·≤·)
  simpa only [finiteSetTest,hcuts] using finiteTest_correct T (cuts.sort (·≤·))

theorem finiteSetTest_iff_grundy (T : Tail) (cuts : Finset Nat) (G : Nat → Nat)
    (hG : SatisfiesMex (↑cuts : Set Nat) G) : finiteSetTest T cuts=true ↔
      ∀ n, 0<n → T.value n=G n := by
  rw [finiteSetTest_correct]
  constructor
  · intro hT
    exact grundy_unique _ _ _ hT hG
  · intro h
    exact (satisfiesMex_congr _ _ _ h).mpr hG

theorem finiteSetTest_iff_gameValue (T : Tail) (cuts : Finset Nat) :
    finiteSetTest T cuts=true ↔ ∀ n, 0<n →
      T.value n=gameValue (↑cuts : Set Nat) n :=
  finiteSetTest_iff_grundy T cuts _ (gameValue_mex _)

#print axioms finiteTest_correct
#print axioms finiteSetTest_correct
#print axioms finiteSetTest_iff_grundy
#print axioms finiteSetTest_iff_gameValue
end CutPeriod.Decision
