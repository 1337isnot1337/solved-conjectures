import Conjectures.BinaryGenericComposition
import Conjectures.BinaryOrder

/-! Complete hidden-value projection for arbitrary finite graph recognizers. -/
namespace BinaryAutomata
variable {Q : Type} [DecidableEq Q]

def genericProjection (A : DFA Q) : FiniteNFA (Q × Fin 3) := {
  successors := fun s d => ((List.finRange 4).flatMap (fun h =>
    if sizeBit h=sizeBit d then
      [(A.step s.1 h,compareStep s.2 (valueBit h) (valueBit d))] else [])).toFinset
  starts := {(A.start,1)}
  final := fun s => decide (s.2=2) && A.final s.1
}

theorem genericProjection_successor (A : DFA Q) (s t : Q × Fin 3) (d : Digit) :
    t∈(genericProjection A).successors s d ↔ ∃ h,
      sizeBit h=sizeBit d ∧ t=(A.step s.1 h,compareStep s.2 (valueBit h) (valueBit d)) := by
  simp only [genericProjection,List.mem_toFinset,List.mem_flatMap,List.mem_finRange,true_and]
  constructor
  · rintro ⟨h,ht⟩
    split at ht
    · rename_i hh
      exact ⟨h,hh,List.mem_singleton.mp ht⟩
    · simp at ht
  · rintro ⟨h,hh,rfl⟩
    exact ⟨h,by simp only [ite_eq_left hh,List.mem_singleton]⟩

theorem genericProjection_path_columns (A : DFA Q) (s t : Q × Fin 3) (w : List Digit)
    (hp : (genericProjection A).Path s w t) :
    ∃ cols : List Column, cols.map Column.out=w ∧
      A.runFrom s.1 (cols.map Column.left)=t.1 ∧ SameSizeColumns cols ∧
      compareColumns s.2 cols=t.2 := by
  induction w generalizing s with
  | nil =>
    have heq : s=t := hp
    subst s
    exact ⟨[],rfl,rfl,by simp [SameSizeColumns],rfl⟩
  | cons d ds ih =>
    obtain ⟨u,hsu,hpath⟩ := hp
    obtain ⟨h,hsize,heq⟩ := (genericProjection_successor A s u d).mp hsu
    subst u
    obtain ⟨cols,hout,hleft,hsizes,hcmp⟩ := ih _ hpath
    refine ⟨⟨h,d,d⟩::cols,by simp only [List.map_cons,hout],hleft,?_,hcmp⟩
    simpa only [SameSizeColumns,List.mem_cons,forall_eq_or_imp] using And.intro hsize hsizes

theorem genericProjection_columns_path (A : DFA Q) (cols : List Column) (s : Q × Fin 3)
    (hsizes : SameSizeColumns cols) :
    ∃ t, (genericProjection A).Path s (cols.map Column.out) t ∧
      t.1=A.runFrom s.1 (cols.map Column.left) ∧ t.2=compareColumns s.2 cols := by
  induction cols generalizing s with
  | nil => exact ⟨s,rfl,rfl,rfl⟩
  | cons c cs ih =>
    let u := (A.step s.1 c.left,compareStep s.2 (valueBit c.left) (valueBit c.out))
    have ht : SameSizeColumns cs := fun d hd => hsizes d (by simp [hd])
    obtain ⟨t,hpath,hleft,hright⟩ := ih u ht
    have hsucc : u∈(genericProjection A).successors s c.out :=
      (genericProjection_successor A s u c.out).mpr ⟨c.left,hsizes c (by simp),rfl⟩
    exact ⟨t,⟨u,hsucc,hpath⟩,hleft,hright⟩

theorem genericProjection_accepts (A : DFA Q) (w : List Digit) :
    (genericProjection A).deterministic.accepts w=true ↔
      ∃ cols : List Column, cols.map Column.out=w ∧ A.accepts (cols.map Column.left)=true ∧
        leftSize cols=outSize cols ∧ outValue cols<leftValue cols := by
  rw [FiniteNFA.accepts_iff]
  constructor
  · rintro ⟨s,t,hs,hpath,hf⟩
    have hs0 : s=(A.start,1) := Finset.mem_singleton.mp hs
    subst s
    have hfinal : t.2=2 ∧ A.final t.1=true := by
      simpa only [genericProjection,Bool.and_eq_true,decide_eq_true_eq] using hf
    obtain ⟨cols,hout,hleft,hsizes,hcmp⟩ := genericProjection_path_columns A _ t w hpath
    have hA : A.accepts (cols.map Column.left)=true := by
      unfold DFA.accepts
      rw [hleft]
      exact hfinal.2
    have hgt : outValue cols<leftValue cols := (compareColumns_gt_iff cols).mp
      (by simpa only [hfinal.1] using hcmp)
    exact ⟨cols,hout,hA,sameSizeColumns_numeric cols hsizes,hgt⟩
  · rintro ⟨cols,hout,hA,hsizes,hgt⟩
    let s := (A.start,(1:Fin 3))
    obtain ⟨t,hpath,hleft,hright⟩ := genericProjection_columns_path A cols s
      (sameSizeColumns_of_numeric cols hsizes)
    refine ⟨s,t,by simp only [genericProjection,Finset.mem_singleton,s],
      by simpa only [hout] using hpath,?_⟩
    have hfa : A.final t.1=true := by rw [hleft]; exact hA
    have hstatus : t.2=2 := by
      rw [hright]
      exact (compareColumns_gt_iff cols).mpr hgt
    simpa only [genericProjection,Bool.and_eq_true,decide_eq_true_eq] using And.intro hstatus hfa

def DFA.lowerRelation [Fintype Q] (A : DFA Q) :=
  (genericProjection A).deterministic.dropZeroPrefixes

theorem DFA.lowerRelation_correct [Fintype Q] (A : DFA Q) (P : Nat → Nat → Prop)
    (hA : Recognizes A P) :
    Recognizes A.lowerRelation (fun n g => ∃ h, P n h ∧ g<h) := by
  intro w
  rw [DFA.lowerRelation,DFA.dropZeroPrefixes_accepts]
  constructor
  · rintro ⟨k,hk⟩
    obtain ⟨cols,hout,ha,hsize,hlt⟩ := (genericProjection_accepts A _).mp hk
    have hoN : outSize cols=decodeHigh sizeBit w := by
      change decodeHigh sizeBit (cols.map Column.out)=_
      rw [hout,decodeHigh_zero_prefix sizeBit (by rfl)]
    have hoG : outValue cols=decodeHigh valueBit w := by
      change decodeHigh valueBit (cols.map Column.out)=_
      rw [hout,decodeHigh_zero_prefix valueBit (by rfl)]
    have hrel := (hA _).mp ha
    change P (leftSize cols) (leftValue cols) at hrel
    rw [hsize,hoN] at hrel
    exact ⟨leftValue cols,hrel,by simpa only [hoG] using hlt⟩
  · rintro ⟨h,hrel,hlt⟩
    let n := decodeHigh sizeBit w
    let k := n+h+1
    let v := List.replicate k (0:Digit)++w
    have hpower : k<2^v.length := (Nat.lt_two_pow_self (n:=k)).trans_le
      (Nat.pow_le_pow_right (by decide) (by simp [v]))
    have hn : n<2^v.length := by dsimp [k] at hpower; omega
    have hh : h<2^v.length := by dsimp [k] at hpower; omega
    let wa := encodeHigh v.length n h
    obtain ⟨haN,haG⟩ := encodeHigh_correct v.length n h hn hh
    have hwa : A.accepts wa=true := (hA wa).mpr (by
      change P (decodeHigh sizeBit (encodeHigh v.length n h)) _
      rw [haN,haG]
      exact hrel)
    obtain ⟨cols,hl,_,ho⟩ := columns_of_words wa v v (encodeHigh_length _ _ _) rfl
    refine ⟨k,(genericProjection_accepts A v).mpr ⟨cols,ho,?_,?_,?_⟩⟩
    · rw [hl]
      exact hwa
    · change decodeHigh sizeBit (cols.map Column.left)=decodeHigh sizeBit (cols.map Column.out)
      rw [hl,ho]
      change decodeHigh sizeBit (encodeHigh v.length n h)=_
      rw [haN]
      exact (decodeHigh_zero_prefix sizeBit (by rfl) k w).symm
    · change decodeHigh valueBit (cols.map Column.out)<decodeHigh valueBit (cols.map Column.left)
      rw [hl,ho]
      change decodeHigh valueBit v<decodeHigh valueBit (encodeHigh v.length n h)
      rw [haG]
      simpa only [v,decodeHigh_zero_prefix valueBit (by rfl)] using hlt

#print axioms DFA.lowerRelation_correct
end BinaryAutomata
