import Conjectures.BinaryOrder

/-! Projection of a hidden graph value while comparing it to a visible value. -/
namespace BinaryAutomata
variable {M N : Nat}

def projectionMachine (E : PairEncoding M 3 N) (A : DFA (Fin M)) : NFA N := {
  successors := fun s d => (List.finRange 4).flatMap (fun h =>
    if sizeBit h=sizeBit d then
      [E.pack (A.step (E.left s) h) (compareStep (E.right s) (valueBit h) (valueBit d))] else [])
  startMask := maskOfList [(E.pack A.start 1).val]
  final := fun s => decide (E.right s=2) && A.final (E.left s)
}

theorem projection_successor_iff (E : PairEncoding M 3 N) (A : DFA (Fin M))
    (s t : Fin N) (d : Digit) : t∈(projectionMachine E A).successors s d ↔
    ∃ h : Digit, sizeBit h=sizeBit d ∧
      t=E.pack (A.step (E.left s) h) (compareStep (E.right s) (valueBit h) (valueBit d)) := by
  simp only [projectionMachine,List.mem_flatMap,List.mem_finRange,true_and]
  constructor
  · rintro ⟨h,ht⟩
    split at ht
    · rename_i hh
      exact ⟨h,hh,List.mem_singleton.mp ht⟩
    · simp at ht
  · rintro ⟨h,hh,rfl⟩
    exact ⟨h,by simp only [ite_eq_left hh,List.mem_singleton]⟩

theorem projection_path_to_columns (E : PairEncoding M 3 N) (A : DFA (Fin M))
    (s t : Fin N) (w : List Digit) (hp : (projectionMachine E A).Path s w t) :
    ∃ cols : List Column, cols.map Column.out=w ∧
      A.runFrom (E.left s) (cols.map Column.left)=E.left t ∧
      SameSizeColumns cols ∧ compareColumns (E.right s) cols=E.right t := by
  induction w generalizing s with
  | nil =>
    have heq : s=t := hp
    subst s
    exact ⟨[],rfl,rfl,by simp [SameSizeColumns],rfl⟩
  | cons d ds ih =>
    obtain ⟨u,hsu,hpath⟩ := hp
    obtain ⟨h,hsize,heq⟩ := (projection_successor_iff E A s u d).mp hsu
    obtain ⟨cols,hout,hleft,hsizes,hcmp⟩ := ih u hpath
    have hlu : E.left u=A.step (E.left s) h := by rw [heq,E.left_pack]
    have hru : E.right u=compareStep (E.right s) (valueBit h) (valueBit d) := by rw [heq,E.right_pack]
    refine ⟨⟨h,d,d⟩::cols,by simp only [List.map_cons,hout],?_,?_,?_⟩
    · simpa only [List.map_cons,DFA.runFrom,←hlu] using hleft
    · simpa only [SameSizeColumns,List.mem_cons,forall_eq_or_imp] using And.intro hsize hsizes
    · simpa only [compareColumns,←hru] using hcmp

theorem columns_to_projection_path (E : PairEncoding M 3 N) (A : DFA (Fin M))
    (cols : List Column) (s : Fin N) (hsizes : SameSizeColumns cols) :
    ∃ t, (projectionMachine E A).Path s (cols.map Column.out) t ∧
      E.left t=A.runFrom (E.left s) (cols.map Column.left) ∧
      E.right t=compareColumns (E.right s) cols := by
  induction cols generalizing s with
  | nil => exact ⟨s,rfl,rfl,rfl⟩
  | cons c cs ih =>
    let u := E.pack (A.step (E.left s) c.left)
      (compareStep (E.right s) (valueBit c.left) (valueBit c.out))
    have ht : SameSizeColumns cs := fun d hd => hsizes d (by simp [hd])
    obtain ⟨t,hpath,hleft,hright⟩ := ih u ht
    have hsucc : u∈(projectionMachine E A).successors s c.out :=
      (projection_successor_iff E A s u c.out).mpr ⟨c.left,hsizes c (by simp),rfl⟩
    refine ⟨t,⟨u,hsucc,hpath⟩,?_,?_⟩
    · simpa only [u,E.left_pack,List.map_cons,DFA.runFrom] using hleft
    · simpa only [u,E.right_pack,compareColumns] using hright

/-- The hidden graph value is larger exactly when the projected comparison
machine accepts. Widths are explicit through the shared column list. -/
theorem projection_accepts_iff (E : PairEncoding M 3 N) (A : DFA (Fin M)) (w : List Digit) :
    (projectionMachine E A).accepts w=true ↔
      ∃ cols : List Column, cols.map Column.out=w ∧ A.accepts (cols.map Column.left)=true ∧
        leftSize cols=outSize cols ∧ outValue cols<leftValue cols := by
  rw [NFA.accepts_iff]
  constructor
  · rintro ⟨s,t,hs,hpath,hf⟩
    have hs0 : s=E.pack A.start 1 := by
      have hm := (maskOfList_mem [(E.pack A.start 1).val] s.val).mp hs
      exact Fin.ext (List.mem_singleton.mp hm)
    subst s
    have hfinal : E.right t=2 ∧ A.final (E.left t)=true := by
      simpa only [projectionMachine,Bool.and_eq_true,decide_eq_true_eq] using hf
    obtain ⟨cols,hout,hleft,hsizes,hcmp⟩ := projection_path_to_columns E A _ t w hpath
    simp only [E.left_pack] at hleft
    have hA : A.accepts (cols.map Column.left)=true := by
      unfold DFA.accepts
      rw [hleft]
      exact hfinal.2
    have hgt : outValue cols<leftValue cols := (compareColumns_gt_iff cols).mp
      (by simpa only [E.right_pack,hfinal.1] using hcmp)
    exact ⟨cols,hout,hA,sameSizeColumns_numeric cols hsizes,hgt⟩
  · rintro ⟨cols,hout,hA,hsizes,hgt⟩
    let s := E.pack A.start 1
    obtain ⟨t,hpath,hleft,hright⟩ := columns_to_projection_path E A cols s
      (sameSizeColumns_of_numeric cols hsizes)
    refine ⟨s,t,?_,by simpa only [hout] using hpath,?_⟩
    · exact (maskOfList_mem _ _).mpr (List.mem_singleton.mpr rfl)
    · have hfa : A.final (E.left t)=true := by
        rw [hleft]
        simpa only [s,E.left_pack,DFA.accepts] using hA
      have hstatus : E.right t=2 := by
        rw [hright]
        simpa only [s,E.right_pack] using (compareColumns_gt_iff cols).mpr hgt
      simpa only [projectionMachine,Bool.and_eq_true,decide_eq_true_eq] using And.intro hstatus hfa

#print axioms projection_accepts_iff
end BinaryAutomata
