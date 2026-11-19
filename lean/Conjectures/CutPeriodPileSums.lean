import Conjectures.CutPeriodPiles

/-! Composition of any two groups of positive piles. The actual split lists
give both the pile counts and complete bounds for the hidden binary tracks. -/
namespace CutPeriod
open BinaryAutomata

theorem xor_append (a b : List Nat) :
    CutFamily.xorList (a++b)=CutFamily.xorList a ^^^ CutFamily.xorList b := by
  induction a with
  | nil => simp [CutFamily.xorList]
  | cons h t ih => simp only [List.cons_append,CutFamily.xorList,ih,Nat.xor_assoc]

theorem piles_add_iff (p q n g : Nat) : Piles (p+q) n g ↔
    ∃ a x b y, Piles p a x ∧ Piles q b y ∧ a+b=n ∧ x ^^^ y=g := by
  constructor
  · rintro ⟨l,hpos,hlen,hsum,hxor⟩
    let a := l.take p
    let b := l.drop p
    have hab : a++b=l := List.take_append_drop p l
    have ha : a.length=p := by simp only [a,List.length_take,hlen]; omega
    have hb : b.length=q := by simp only [b,List.length_drop,hlen]; omega
    refine ⟨a.sum,CutFamily.xorList (a.map value),b.sum,CutFamily.xorList (b.map value),
      ⟨a,?_,ha,rfl,rfl⟩,⟨b,?_,hb,rfl,rfl⟩,?_,?_⟩
    · intro h hh
      exact hpos h (List.mem_of_mem_take hh)
    · intro h hh
      exact hpos h (List.mem_of_mem_drop hh)
    · rw [←List.sum_append,hab]
      exact hsum
    · rw [←xor_append,←List.map_append,hab]
      exact hxor
  · rintro ⟨a,x,b,y,⟨ls,hls,hlenls,hsumls,hxorls⟩,
      ⟨rs,hrs,hlenrs,hsumrs,hxorrs⟩,hsum,hxor⟩
    refine ⟨ls++rs,?_,?_,?_,?_⟩
    · intro h hh
      rcases List.mem_append.mp hh with hh | hh
      · exact hls h hh
      · exact hrs h hh
    · simp only [List.length_append,hlenls,hlenrs]
    · simpa only [List.sum_append,hsumls,hsumrs] using hsum
    · simpa only [List.map_append,xor_append,hxorls,hxorrs] using hxor

theorem piles_value_le {p n g : Nat} (h : Piles p n g) : g≤n := by
  obtain ⟨l,_,_,hsum,hxor⟩ := h
  have hb := values_xor_le l
  simpa only [hsum,hxor] using hb

/-- The same visible width suffices for both groups: their sizes and XOR
values are bounded by the total pile size. No witness-width hypothesis remains. -/
theorem sum_recognizes_piles {L R N : Nat} (E : ProductEncoding L R N)
    (A : DFA (Fin L)) (B : DFA (Fin R)) (p q : Nat)
    (hA : RecognizesPiles A p) (hB : RecognizesPiles B q) :
    ∀ w, (sumMachine E A B A.rejectingSink B.rejectingSink).accepts w=true ↔
      Piles (p+q) (decodeHigh sizeBit w) (decodeHigh valueBit w) := by
  intro w
  rw [sum_accepts_iff E A B A.rejectingSink B.rejectingSink
    A.rejectingSink_sound B.rejectingSink_sound,piles_add_iff]
  constructor
  · rintro ⟨cols,hout,ha,hb,hsum,hxor⟩
    subst w
    exact ⟨leftSize cols,leftValue cols,rightSize cols,rightValue cols,
      (hA _).mp ha,(hB _).mp hb,hsum,hxor⟩
  · rintro ⟨a,x,b,y,ha,hb,hsum,hxor⟩
    have hwidth := decodeHigh_bound sizeBit sizeBit_bound w
    have hx := piles_value_le ha
    have hy := piles_value_le hb
    have haWidth : a<2^w.length := by omega
    have hbWidth : b<2^w.length := by omega
    have hxWidth : x<2^w.length := by omega
    have hyWidth : y<2^w.length := by omega
    let u := encodeHigh w.length a x
    let v := encodeHigh w.length b y
    obtain ⟨huN,huG⟩ := encodeHigh_correct w.length a x haWidth hxWidth
    obtain ⟨hvN,hvG⟩ := encodeHigh_correct w.length b y hbWidth hyWidth
    change decodeHigh sizeBit u=a at huN
    change decodeHigh valueBit u=x at huG
    change decodeHigh sizeBit v=b at hvN
    change decodeHigh valueBit v=y at hvG
    have hu : A.accepts u=true := (hA u).mpr (by rw [huN,huG]; exact ha)
    have hv : B.accepts v=true := (hB v).mpr (by rw [hvN,hvG]; exact hb)
    obtain ⟨cols,hl,hr,ho⟩ := columns_of_words u v w
      (encodeHigh_length _ _ _) (encodeHigh_length _ _ _)
    refine ⟨cols,ho,by rw [hl]; exact hu,by rw [hr]; exact hv,?_,?_⟩
    · change decodeHigh sizeBit (cols.map Column.left)+decodeHigh sizeBit (cols.map Column.right)=
        decodeHigh sizeBit (cols.map Column.out)
      rw [hl,hr,ho,huN,hvN]
      exact hsum
    · change decodeHigh valueBit (cols.map Column.left) ^^^ decodeHigh valueBit (cols.map Column.right)=
        decodeHigh valueBit (cols.map Column.out)
      rw [hl,hr,ho,huG,hvG]
      exact hxor

#print axioms sum_recognizes_piles
end CutPeriod
