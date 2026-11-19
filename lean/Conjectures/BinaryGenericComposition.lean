import Conjectures.BinaryFiniteNFA
import Conjectures.BinaryEncoding
import Conjectures.BinaryComposition

/-! Addition/XOR composition for arbitrary finite state types, with complete
hidden-witness padding. No growth bound on the recognized relations is needed. -/
namespace BinaryAutomata

def Recognizes {Q : Type} (A : DFA Q) (R : Nat → Nat → Prop) : Prop :=
  ∀ w, A.accepts w=true ↔ R (decodeHigh sizeBit w) (decodeHigh valueBit w)

def SumRelation (R S : Nat → Nat → Prop) (n g : Nat) : Prop :=
  ∃ a x b y, R a x ∧ S b y ∧ a+b=n ∧ x^^^y=g

variable {Q R : Type} [DecidableEq Q] [DecidableEq R]

def genericSum (A : DFA Q) (B : DFA R) : FiniteNFA (Q × R × Fin 2) := {
  successors := fun s d =>
    ((List.finRange 4).flatMap (fun dl => (List.finRange 4).flatMap (fun dr =>
      (List.finRange 2).flatMap (fun mid =>
        if sizeBit dl+sizeBit dr+mid.val=sizeBit d+2*s.2.2.val ∧
            valueBit dl^^^valueBit dr=valueBit d then
          [(A.step s.1 dl,B.step s.2.1 dr,mid)] else [])))).toFinset
  starts := {(A.start,B.start,0)}
  final := fun s => decide (s.2.2=0) && A.final s.1 && B.final s.2.1
}

theorem genericSum_successor (A : DFA Q) (B : DFA R)
    (s t : Q × R × Fin 2) (d : Digit) :
    t∈(genericSum A B).successors s d ↔ ∃ dl dr mid,
      (sizeBit dl+sizeBit dr+mid.val=sizeBit d+2*s.2.2.val ∧
        valueBit dl^^^valueBit dr=valueBit d) ∧
      t=(A.step s.1 dl,B.step s.2.1 dr,mid) := by
  simp only [genericSum,List.mem_toFinset,List.mem_flatMap,List.mem_finRange,true_and]
  constructor
  · rintro ⟨dl,dr,mid,ht⟩
    split at ht
    · rename_i hc
      exact ⟨dl,dr,mid,hc,List.mem_singleton.mp ht⟩
    · simp at ht
  · rintro ⟨dl,dr,mid,hc,rfl⟩
    exact ⟨dl,dr,mid,by simp only [ite_eq_left hc,List.mem_singleton]⟩

theorem genericSum_path_columns (A : DFA Q) (B : DFA R)
    (s t : Q × R × Fin 2) (w : List Digit) (hp : (genericSum A B).Path s w t) :
    ∃ cols : List Column, cols.map Column.out=w ∧
      A.runFrom s.1 (cols.map Column.left)=t.1 ∧
      B.runFrom s.2.1 (cols.map Column.right)=t.2.1 ∧
      Adds cols s.2.2 t.2.2 ∧ XorColumns cols := by
  induction w generalizing s with
  | nil =>
    have heq : s=t := hp
    subst s
    exact ⟨[],rfl,rfl,rfl,rfl,by simp [XorColumns]⟩
  | cons d ds ih =>
    obtain ⟨u,hsu,hpath⟩ := hp
    obtain ⟨dl,dr,mid,⟨hcarry,hvalue⟩,heq⟩ := (genericSum_successor A B s u d).mp hsu
    subst u
    obtain ⟨cols,hout,hleft,hright,hadd,hxor⟩ := ih _ hpath
    refine ⟨⟨dl,dr,d⟩::cols,by simp only [List.map_cons,hout],?_,?_,?_,?_⟩
    · exact hleft
    · exact hright
    · exact ⟨mid,hcarry,hadd⟩
    · simpa only [XorColumns,List.mem_cons,forall_eq_or_imp] using And.intro hvalue hxor

theorem genericSum_columns_path (A : DFA Q) (B : DFA R)
    (cols : List Column) (s : Q × R × Fin 2) (lo : Fin 2)
    (hadd : Adds cols s.2.2 lo) (hxor : XorColumns cols) :
    ∃ t, (genericSum A B).Path s (cols.map Column.out) t ∧
      t.1=A.runFrom s.1 (cols.map Column.left) ∧
      t.2.1=B.runFrom s.2.1 (cols.map Column.right) ∧ t.2.2=lo := by
  induction cols generalizing s with
  | nil => exact ⟨s,rfl,rfl,rfl,hadd⟩
  | cons c cs ih =>
    obtain ⟨mid,hcarry,htail⟩ := hadd
    have hvalue := hxor c (by simp)
    have hxort : XorColumns cs := fun col hcol => hxor col (by simp [hcol])
    let u := (A.step s.1 c.left,B.step s.2.1 c.right,mid)
    obtain ⟨t,hpath,hleft,hright,hend⟩ := ih u htail hxort
    have hsucc : u∈(genericSum A B).successors s c.out :=
      (genericSum_successor A B s u c.out).mpr ⟨c.left,c.right,mid,⟨hcarry,hvalue⟩,rfl⟩
    exact ⟨t,⟨u,hsucc,hpath⟩,hleft,hright,hend⟩

theorem genericSum_accepts (A : DFA Q) (B : DFA R) (w : List Digit) :
    (genericSum A B).deterministic.accepts w=true ↔
      ∃ cols : List Column, cols.map Column.out=w ∧
        A.accepts (cols.map Column.left)=true ∧ B.accepts (cols.map Column.right)=true ∧
        leftSize cols+rightSize cols=outSize cols ∧ leftValue cols^^^rightValue cols=outValue cols := by
  rw [FiniteNFA.accepts_iff]
  constructor
  · rintro ⟨s,t,hs,hpath,hf⟩
    have hs0 : s=(A.start,B.start,0) := Finset.mem_singleton.mp hs
    subst s
    have hfinal : t.2.2=0 ∧ A.final t.1=true ∧ B.final t.2.1=true := by
      simpa only [genericSum,Bool.and_eq_true,decide_eq_true_eq,and_assoc] using hf
    obtain ⟨cols,hout,hleft,hright,hadd,hxor⟩ := genericSum_path_columns A B _ t w hpath
    have hA : A.accepts (cols.map Column.left)=true := by
      unfold DFA.accepts
      rw [hleft]
      exact hfinal.2.1
    have hB : B.accepts (cols.map Column.right)=true := by
      unfold DFA.accepts
      rw [hright]
      exact hfinal.2.2
    have hadd0 : Adds cols 0 0 := by simpa only [hfinal.1] using hadd
    exact ⟨cols,hout,hA,hB,(adds_zero_iff cols).mp hadd0,(high_xor_iff cols).mpr hxor⟩
  · rintro ⟨cols,hout,hA,hB,hadd,hxor⟩
    let s := (A.start,B.start,(0:Fin 2))
    obtain ⟨t,hpath,hleft,hright,hend⟩ := genericSum_columns_path A B cols s 0
      ((adds_zero_iff cols).mpr hadd) ((high_xor_iff cols).mp hxor)
    refine ⟨s,t,by simp only [genericSum,Finset.mem_singleton,s],
      by simpa only [hout] using hpath,?_⟩
    have hfa : A.final t.1=true := by rw [hleft]; exact hA
    have hfb : B.final t.2.1=true := by rw [hright]; exact hB
    simpa only [genericSum,Bool.and_eq_true,decide_eq_true_eq,and_assoc] using
      And.intro hend (And.intro hfa hfb)

def DFA.sumRelation [Fintype Q] [Fintype R] (A : DFA Q) (B : DFA R) :=
  (genericSum A B).deterministic.dropZeroPrefixes

theorem DFA.sumRelation_correct [Fintype Q] [Fintype R]
    (A : DFA Q) (B : DFA R) (P S : Nat → Nat → Prop)
    (hA : Recognizes A P) (hB : Recognizes B S) :
    Recognizes (A.sumRelation B) (SumRelation P S) := by
  intro w
  rw [DFA.sumRelation,DFA.dropZeroPrefixes_accepts]
  constructor
  · rintro ⟨k,hk⟩
    obtain ⟨cols,hout,ha,hb,hsum,hxor⟩ := (genericSum_accepts A B _).mp hk
    have hsize : outSize cols=decodeHigh sizeBit w := by
      change decodeHigh sizeBit (cols.map Column.out)=_
      rw [hout,decodeHigh_zero_prefix sizeBit (by rfl)]
    have hvalue : outValue cols=decodeHigh valueBit w := by
      change decodeHigh valueBit (cols.map Column.out)=_
      rw [hout,decodeHigh_zero_prefix valueBit (by rfl)]
    refine ⟨leftSize cols,leftValue cols,rightSize cols,rightValue cols,
      (hA _).mp ha,(hB _).mp hb,hsum.trans hsize,hxor.trans hvalue⟩
  · rintro ⟨a,x,b,y,ha,hb,hsum,hxor⟩
    let k := a+x+b+y+1
    let v := List.replicate k (0:Digit)++w
    have hpower : k<2^v.length := (Nat.lt_two_pow_self (n:=k)).trans_le
      (Nat.pow_le_pow_right (by decide) (by simp [v]))
    have haN : a<2^v.length := by dsimp [k] at hpower; omega
    have haG : x<2^v.length := by dsimp [k] at hpower; omega
    have hbN : b<2^v.length := by dsimp [k] at hpower; omega
    have hbG : y<2^v.length := by dsimp [k] at hpower; omega
    let wa := encodeHigh v.length a x
    let wb := encodeHigh v.length b y
    obtain ⟨haN',haG'⟩ := encodeHigh_correct v.length a x haN haG
    obtain ⟨hbN',hbG'⟩ := encodeHigh_correct v.length b y hbN hbG
    have hwa : A.accepts wa=true := (hA wa).mpr (by change P (decodeHigh sizeBit (encodeHigh v.length a x)) _; rw [haN',haG']; exact ha)
    have hwb : B.accepts wb=true := (hB wb).mpr (by change S (decodeHigh sizeBit (encodeHigh v.length b y)) _; rw [hbN',hbG']; exact hb)
    obtain ⟨cols,hl,hr,ho⟩ := columns_of_words wa wb v (encodeHigh_length _ _ _) (encodeHigh_length _ _ _)
    refine ⟨k,(genericSum_accepts A B v).mpr ⟨cols,ho,?_,?_,?_,?_⟩⟩
    · rw [hl]
      exact hwa
    · rw [hr]
      exact hwb
    · change decodeHigh sizeBit (cols.map Column.left)+decodeHigh sizeBit (cols.map Column.right)=
        decodeHigh sizeBit (cols.map Column.out)
      rw [hl,hr,ho]
      change decodeHigh sizeBit (encodeHigh v.length a x)+decodeHigh sizeBit (encodeHigh v.length b y)=_
      rw [haN',hbN']
      simpa only [v,decodeHigh_zero_prefix sizeBit (by rfl)] using hsum
    · change decodeHigh valueBit (cols.map Column.left)^^^decodeHigh valueBit (cols.map Column.right)=
        decodeHigh valueBit (cols.map Column.out)
      rw [hl,hr,ho]
      change decodeHigh valueBit (encodeHigh v.length a x)^^^decodeHigh valueBit (encodeHigh v.length b y)=_
      rw [haG',hbG']
      simpa only [v,decodeHigh_zero_prefix valueBit (by rfl)] using hxor

#print axioms DFA.sumRelation_correct
end BinaryAutomata
