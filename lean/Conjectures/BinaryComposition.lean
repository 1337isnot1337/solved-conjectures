import Conjectures.BinaryArithmetic

/-! Exact addition/XOR composition of two deterministic graph automata. -/
namespace BinaryAutomata

/-- An explicitly checked encoding of the two component states and the carry. -/
structure ProductEncoding (L R N : Nat) where
  left : Fin N → Fin L
  right : Fin N → Fin R
  carry : Fin N → Fin 2
  pack : Fin L → Fin R → Fin 2 → Fin N
  left_pack : ∀ a b c, left (pack a b c)=a
  right_pack : ∀ a b c, right (pack a b c)=b
  carry_pack : ∀ a b c, carry (pack a b c)=c
  pack_parts : ∀ s, pack (left s) (right s) (carry s)=s

variable {L R N : Nat}

def SumConstraints (E : ProductEncoding L R N) (A : DFA (Fin L)) (B : DFA (Fin R))
    (blockedA : Fin L → Bool) (blockedB : Fin R → Bool)
    (s : Fin N) (d dl dr : Digit) (mid : Fin 2) : Prop :=
  sizeBit dl+sizeBit dr+mid.val=sizeBit d+2*(E.carry s).val ∧
  valueBit dl ^^^ valueBit dr=valueBit d ∧
  blockedA (A.step (E.left s) dl)=false ∧ blockedB (B.step (E.right s) dr)=false

instance (E : ProductEncoding L R N) (A : DFA (Fin L)) (B : DFA (Fin R))
    (blockedA : Fin L → Bool) (blockedB : Fin R → Bool)
    (s : Fin N) (d dl dr : Digit) (mid : Fin 2) :
    Decidable (SumConstraints E A B blockedA blockedB s d dl dr mid) := by
  unfold SumConstraints
  infer_instance

def sumMachine (E : ProductEncoding L R N) (A : DFA (Fin L)) (B : DFA (Fin R))
    (blockedA : Fin L → Bool) (blockedB : Fin R → Bool) : NFA N := {
  successors := fun s d =>
    (List.finRange 4).flatMap (fun dl => (List.finRange 4).flatMap (fun dr =>
      (List.finRange 2).flatMap (fun mid =>
        if SumConstraints E A B blockedA blockedB s d dl dr mid then
          [E.pack (A.step (E.left s) dl) (B.step (E.right s) dr) mid] else [])))
  startMask := maskOfList [(E.pack A.start B.start 0).val]
  final := fun s => decide (E.carry s=0) && A.final (E.left s) && B.final (E.right s)
}

theorem sum_successor_iff (E : ProductEncoding L R N) (A : DFA (Fin L)) (B : DFA (Fin R))
    (blockedA : Fin L → Bool) (blockedB : Fin R → Bool) (s t : Fin N) (d : Digit) :
    t∈(sumMachine E A B blockedA blockedB).successors s d ↔
      ∃ dl dr mid, SumConstraints E A B blockedA blockedB s d dl dr mid ∧
        t=E.pack (A.step (E.left s) dl) (B.step (E.right s) dr) mid := by
  simp only [sumMachine,List.mem_flatMap,List.mem_finRange,true_and]
  constructor
  · rintro ⟨dl,dr,mid,ht⟩
    split at ht
    · rename_i hc
      exact ⟨dl,dr,mid,hc,List.mem_singleton.mp ht⟩
    · simp at ht
  · rintro ⟨dl,dr,mid,hc,rfl⟩
    exact ⟨dl,dr,mid,by simp only [ite_eq_left hc,List.mem_singleton]⟩

/-- Every composed path supplies actual binary columns with exactly the
component DFA runs and the addition/XOR constraints. -/
theorem sum_path_to_columns (E : ProductEncoding L R N) (A : DFA (Fin L)) (B : DFA (Fin R))
    (blockedA : Fin L → Bool) (blockedB : Fin R → Bool)
    (s t : Fin N) (w : List Digit)
    (hp : (sumMachine E A B blockedA blockedB).Path s w t) :
    ∃ cols : List Column, cols.map Column.out=w ∧
      A.runFrom (E.left s) (cols.map Column.left)=E.left t ∧
      B.runFrom (E.right s) (cols.map Column.right)=E.right t ∧
      Adds cols (E.carry s) (E.carry t) ∧ XorColumns cols := by
  induction w generalizing s with
  | nil =>
    have heq : s=t := hp
    subst s
    exact ⟨[],rfl,rfl,rfl,rfl,by simp [XorColumns]⟩
  | cons d ds ih =>
    obtain ⟨u,hsu,hpath⟩ := hp
    obtain ⟨dl,dr,mid,hc,heq⟩ := (sum_successor_iff E A B blockedA blockedB s u d).mp hsu
    obtain ⟨cols,hout,hleft,hright,hadd,hxor⟩ := ih u hpath
    obtain ⟨hcarry,hvalue,hba,hbb⟩ := hc
    have hlu : E.left u=A.step (E.left s) dl := by rw [heq,E.left_pack]
    have hru : E.right u=B.step (E.right s) dr := by rw [heq,E.right_pack]
    have hcu : E.carry u=mid := by rw [heq,E.carry_pack]
    refine ⟨⟨dl,dr,d⟩::cols,by simp only [List.map_cons,hout],?_,?_,?_,?_⟩
    · simpa only [List.map_cons,DFA.runFrom,←hlu] using hleft
    · simpa only [List.map_cons,DFA.runFrom,←hru] using hright
    · exact ⟨mid,hcarry,by simpa only [hcu] using hadd⟩
    · simpa only [XorColumns,List.mem_cons,forall_eq_or_imp] using And.intro hvalue hxor

/-- Conversely, accepted component words and valid arithmetic columns give a
composed path. Only states proved to reject every continuation may be pruned. -/
theorem columns_to_sum_path (E : ProductEncoding L R N) (A : DFA (Fin L)) (B : DFA (Fin R))
    (blockedA : Fin L → Bool) (blockedB : Fin R → Bool)
    (hblockedA : ∀ q, blockedA q=true → ∀ w, A.final (A.runFrom q w)=false)
    (hblockedB : ∀ q, blockedB q=true → ∀ w, B.final (B.runFrom q w)=false)
    (cols : List Column) (s : Fin N) (lo : Fin 2)
    (hA : A.final (A.runFrom (E.left s) (cols.map Column.left))=true)
    (hB : B.final (B.runFrom (E.right s) (cols.map Column.right))=true)
    (hadd : Adds cols (E.carry s) lo) (hxor : XorColumns cols) :
    ∃ t, (sumMachine E A B blockedA blockedB).Path s (cols.map Column.out) t ∧
      E.left t=A.runFrom (E.left s) (cols.map Column.left) ∧
      E.right t=B.runFrom (E.right s) (cols.map Column.right) ∧ E.carry t=lo := by
  induction cols generalizing s with
  | nil => exact ⟨s,rfl,rfl,rfl,hadd⟩
  | cons c cs ih =>
    obtain ⟨mid,hcarry,htail⟩ := hadd
    have hvalue := hxor c (by simp)
    have hxort : XorColumns cs := fun col hcol => hxor col (by simp [hcol])
    have hA' : A.final (A.runFrom (A.step (E.left s) c.left) (cs.map Column.left))=true := hA
    have hB' : B.final (B.runFrom (B.step (E.right s) c.right) (cs.map Column.right))=true := hB
    have hba : blockedA (A.step (E.left s) c.left)=false := by
      cases hb : blockedA (A.step (E.left s) c.left) with
      | false => rfl
      | true => have hh := hblockedA _ hb (cs.map Column.left); rw [hA'] at hh; cases hh
    have hbb : blockedB (B.step (E.right s) c.right)=false := by
      cases hb : blockedB (B.step (E.right s) c.right) with
      | false => rfl
      | true => have hh := hblockedB _ hb (cs.map Column.right); rw [hB'] at hh; cases hh
    let u := E.pack (A.step (E.left s) c.left) (B.step (E.right s) c.right) mid
    have hAu : A.final (A.runFrom (E.left u) (cs.map Column.left))=true := by simpa only [u,E.left_pack] using hA'
    have hBu : B.final (B.runFrom (E.right u) (cs.map Column.right))=true := by simpa only [u,E.right_pack] using hB'
    have haddu : Adds cs (E.carry u) lo := by simpa only [u,E.carry_pack] using htail
    obtain ⟨t,hpath,hleft,hright,hend⟩ := ih u hAu hBu haddu hxort
    have hsucc : u∈(sumMachine E A B blockedA blockedB).successors s c.out :=
      (sum_successor_iff E A B blockedA blockedB s u c.out).mpr
        ⟨c.left,c.right,mid,⟨hcarry,hvalue,hba,hbb⟩,rfl⟩
    refine ⟨t,⟨u,hsucc,hpath⟩,?_,?_,hend⟩
    · simpa only [u,E.left_pack,List.map_cons,DFA.runFrom] using hleft
    · simpa only [u,E.right_pack,List.map_cons,DFA.runFrom] using hright

#print axioms columns_to_sum_path
/-- Exact language semantics of addition/XOR composition. The statement is
about actual integers decoded from every possible binary word. -/
theorem sum_accepts_iff (E : ProductEncoding L R N) (A : DFA (Fin L)) (B : DFA (Fin R))
    (blockedA : Fin L → Bool) (blockedB : Fin R → Bool)
    (hblockedA : ∀ q, blockedA q=true → ∀ w, A.final (A.runFrom q w)=false)
    (hblockedB : ∀ q, blockedB q=true → ∀ w, B.final (B.runFrom q w)=false)
    (w : List Digit) :
    (sumMachine E A B blockedA blockedB).accepts w=true ↔
      ∃ cols : List Column, cols.map Column.out=w ∧
        A.accepts (cols.map Column.left)=true ∧ B.accepts (cols.map Column.right)=true ∧
        leftSize cols+rightSize cols=outSize cols ∧ leftValue cols ^^^ rightValue cols=outValue cols := by
  rw [NFA.accepts_iff]
  constructor
  · rintro ⟨s,t,hs,hpath,hf⟩
    have hs0 : s=E.pack A.start B.start 0 := by
      have hm := (maskOfList_mem [(E.pack A.start B.start 0).val] s.val).mp hs
      exact Fin.ext (List.mem_singleton.mp hm)
    subst s
    have hfinal : E.carry t=0 ∧ A.final (E.left t)=true ∧ B.final (E.right t)=true := by
      simpa only [sumMachine,Bool.and_eq_true,decide_eq_true_eq,and_assoc] using hf
    obtain ⟨cols,hout,hleft,hright,hadd,hxor⟩ := sum_path_to_columns E A B blockedA blockedB _ t w hpath
    simp only [E.left_pack] at hleft
    simp only [E.right_pack] at hright
    have hA : A.accepts (cols.map Column.left)=true := by
      unfold DFA.accepts
      rw [hleft]
      exact hfinal.2.1
    have hB : B.accepts (cols.map Column.right)=true := by
      unfold DFA.accepts
      rw [hright]
      exact hfinal.2.2
    have hadd0 : Adds cols 0 0 := by simpa only [E.carry_pack,hfinal.1] using hadd
    exact ⟨cols,hout,hA,hB,(adds_zero_iff cols).mp hadd0,(high_xor_iff cols).mpr hxor⟩
  · rintro ⟨cols,hout,hA,hB,hadd,hxor⟩
    let s := E.pack A.start B.start 0
    have hA' : A.final (A.runFrom (E.left s) (cols.map Column.left))=true := by
      simpa only [s,E.left_pack,DFA.accepts] using hA
    have hB' : B.final (B.runFrom (E.right s) (cols.map Column.right))=true := by
      simpa only [s,E.right_pack,DFA.accepts] using hB
    have hadd' : Adds cols (E.carry s) 0 := by
      simpa only [s,E.carry_pack] using (adds_zero_iff cols).mpr hadd
    obtain ⟨t,hpath,hleft,hright,hend⟩ := columns_to_sum_path E A B blockedA blockedB
      hblockedA hblockedB cols s 0 hA' hB' hadd' ((high_xor_iff cols).mp hxor)
    refine ⟨s,t,?_,by simpa only [hout] using hpath,?_⟩
    · apply (maskOfList_mem _ _).mpr
      exact List.mem_singleton.mpr rfl
    · have hfa : A.final (E.left t)=true := by rw [hleft]; exact hA'
      have hfb : B.final (E.right t)=true := by rw [hright]; exact hB'
      simpa only [sumMachine,Bool.and_eq_true,decide_eq_true_eq,and_assoc] using
        And.intro hend (And.intro hfa hfb)

#print axioms sum_accepts_iff

/-- Computable pruning criterion used by the certificate producer. -/
def DFA.rejectingSink {Q : Type} [DecidableEq Q] (A : DFA Q) (q : Q) : Bool :=
  !A.final q && (List.finRange 4).all (fun d => decide (A.step q d=q))

theorem DFA.rejectingSink_sound {Q : Type} [DecidableEq Q] (A : DFA Q) (q : Q)
    (h : A.rejectingSink q=true) : ∀ w, A.final (A.runFrom q w)=false := by
  simp only [DFA.rejectingSink,Bool.and_eq_true] at h
  have hf : A.final q=false := by cases hq : A.final q <;> simp_all
  apply A.rejecting_sink q hf
  intro d
  exact of_decide_eq_true ((List.all_eq_true.mp h.2) d (by simp))

end BinaryAutomata
