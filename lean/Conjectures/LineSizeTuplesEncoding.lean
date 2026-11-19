import Conjectures.LineSizeTuplesBuild

/-! Disjoint core codes. The bit records whether the boundary size occurs
in the tail; its unit is removed from the last gap. -/
noncomputable section
namespace LineSize.TupleEncoding

open Finset

def codeTail (r b : ℕ) (T : Finset ℕ) : Finset ℕ := if b=1 then insert r T else T

def decode (r b : ℕ) (T : Finset ℕ) (z : Fin r → ℕ) : Finset ℕ :=
  TupleBuild.assemble r (CoreGaps.bumpLast r b (CoreGaps.extend r z)) (codeTail r b T)

theorem boundary_not_mem (r : ℕ) (T : Finset ℕ) (hT : T ⊆ Ico 3 r) : r ∉ T := by
  intro hr
  have hlt := (mem_Ico.mp (hT hr)).2
  omega

theorem codeTail_le (r b : ℕ) (T : Finset ℕ) (hT : T ⊆ Ico 3 r)
    (s : ℕ) (hs : s ∈ codeTail r b T) : s ≤ r := by
  by_cases hb : b=1
  · rw [codeTail,ite_eq_left hb] at hs
    rcases mem_insert.mp hs with heq | hs
    · subst s
      exact le_rfl
    · exact (mem_Ico.mp (hT hs)).2.le
  · rw [codeTail,ite_eq_right hb] at hs
    exact (mem_Ico.mp (hT hs)).2.le

theorem codeTail_ge_three (r b : ℕ) (T : Finset ℕ) (hr : 3 ≤ r) (hT : T ⊆ Ico 3 r)
    (s : ℕ) (hs : s ∈ codeTail r b T) : 3 ≤ s := by
  by_cases hb : b=1
  · rw [codeTail,ite_eq_left hb] at hs
    rcases mem_insert.mp hs with heq | hs
    · subst s
      exact hr
    · exact (mem_Ico.mp (hT hs)).1
  · rw [codeTail,ite_eq_right hb] at hs
    exact (mem_Ico.mp (hT hs)).1

theorem erase_codeTail (r b : ℕ) (T : Finset ℕ) (hT : T ⊆ Ico 3 r) :
    (codeTail r b T).erase r=T := by
  by_cases hb : b=1 <;> simp [codeTail,hb,boundary_not_mem r T hT]

theorem code_separated (r b : ℕ) (T : Finset ℕ) (z : Fin r → ℕ) (hT : T ⊆ Ico 3 r) :
    TupleBuild.Separated r (CoreGaps.bumpLast r b (CoreGaps.extend r z)) (codeTail r b T) := by
  intro i hi s hs
  have hcore := TupleBuild.coreAt_bump_lower r b (CoreGaps.extend r z) i hi
  by_cases hb : b=1
  · have htail := codeTail_le r b T hT s hs
    omega
  · rw [codeTail,ite_eq_right hb] at hs
    have htail := (mem_Ico.mp (hT hs)).2
    omega

theorem coreLength_decode (r b : ℕ) (T : Finset ℕ) (z : Fin r → ℕ) (hT : T ⊆ Ico 3 r) :
    tupleCoreLength (decode r b T z)=r :=
  TupleBuild.tupleCoreLength_assemble _ _ _ (code_separated r b T z hT) (codeTail_le r b T hT)

theorem tail_decode (r b : ℕ) (T : Finset ℕ) (z : Fin r → ℕ) (hT : T ⊆ Ico 3 r) :
    tupleTail (decode r b T z)=codeTail r b T :=
  TupleBuild.tupleTail_assemble _ _ _ (code_separated r b T z hT) (codeTail_le r b T hT)

theorem bit_decode (r b : ℕ) (T : Finset ℕ) (z : Fin r → ℕ)
    (hb : b ≤ 1) (hT : T ⊆ Ico 3 r) : tupleTailBit (decode r b T z)=b := by
  rw [tupleTailBit,coreLength_decode r b T z hT,tail_decode r b T z hT]
  by_cases hb1 : b=1
  · rw [codeTail,ite_eq_left hb1,ite_eq_left (mem_insert_self r T)]
    exact hb1.symm
  · rw [codeTail,ite_eq_right hb1,ite_eq_right (boundary_not_mem r T hT)]
    omega

theorem smallTail_decode (r b : ℕ) (T : Finset ℕ) (z : Fin r → ℕ) (hT : T ⊆ Ico 3 r) :
    tupleSmallTail (decode r b T z)=T := by
  rw [tupleSmallTail,coreLength_decode r b T z hT,tail_decode r b T z hT,erase_codeTail r b T hT]

theorem cost_decode (r b : ℕ) (T : Finset ℕ) (z : Fin r → ℕ) (hT : T ⊆ Ico 3 r) :
    tupleCost (decode r b T z)=r^2+r*b+∑ j : Fin r, (j.val+1)*z j := by
  have hcost := TupleBuild.tupleCost_assemble r (CoreGaps.bumpLast r b (CoreGaps.extend r z))
    (codeTail r b T) (code_separated r b T z hT) (codeTail_le r b T hT)
  rw [CoreGaps.weighted_bump,weighted_extend] at hcost
  change tupleCost (TupleBuild.assemble r (CoreGaps.bumpLast r b (CoreGaps.extend r z))
    (codeTail r b T))=r^2+r*b+∑ j : Fin r, (j.val+1)*z j
  omega

theorem large_decode (r b : ℕ) (T : Finset ℕ) (z : Fin r → ℕ)
    (hr : 3 ≤ r) (hT : T ⊆ Ico 3 r) : ∀ s ∈ decode r b T z, 3 ≤ s := by
  intro s hs
  change s ∈ (TupleBuild.coreList r (CoreGaps.bumpLast r b (CoreGaps.extend r z))++
    tupleValues (codeTail r b T)).toFinset at hs
  rcases List.mem_append.mp (List.mem_toFinset.mp hs) with hcore | htail
  · obtain ⟨i,hi,rfl⟩ := (TupleBuild.mem_coreList _ _ s).mp hcore
    have hbound := TupleBuild.coreAt_bump_lower r b (CoreGaps.extend r z) i hi
    omega
  · exact codeTail_ge_three r b T hr hT s ((mem_tupleValues _ _).mp htail)

theorem prefix_decode (r b : ℕ) (T : Finset ℕ) (z : Fin r → ℕ)
    (hT : T ⊆ Ico 3 r) (i : ℕ) (hi : i < r) :
    tupleAt (decode r b T z) i=TupleBuild.coreAt r (CoreGaps.bumpLast r b (CoreGaps.extend r z)) i :=
  TupleBuild.tupleAt_assemble_prefix _ _ _ (code_separated r b T z hT) i hi

theorem gaps_congr (r : ℕ) (y v : ℕ → ℕ) (h : ∀ i < r, y i=v i)
    (i : ℕ) (hi : i < r) : CoreGaps.gaps r y i=CoreGaps.gaps r v i := by
  by_cases hn : i+1 < r
  · simp only [CoreGaps.gaps,ite_eq_left hn,h i hi,h (i+1) hn]
  · simp only [CoreGaps.gaps,ite_eq_right hn,ite_eq_left hi,h i hi]

theorem gapAt_decode (r b : ℕ) (T : Finset ℕ) (z : Fin r → ℕ)
    (hT : T ⊆ Ico 3 r) (i : ℕ) (hi : i < r) :
    tupleGapAt (decode r b T z) i=CoreGaps.bumpLast r b (CoreGaps.extend r z) i := by
  rw [tupleGapAt,coreLength_decode r b T z hT]
  have hpref : ∀ j < r, tupleAt (decode r b T z) j-j=
      CoreGaps.fromGaps r (CoreGaps.bumpLast r b (CoreGaps.extend r z)) j := by
    intro j hj
    rw [prefix_decode r b T z hT j hj,TupleBuild.coreAt,Nat.add_sub_cancel]
  exact (gaps_congr r _ _ hpref i hi).trans (CoreGaps.gaps_fromGaps r _ i hi)

theorem gapFun_decode (r b : ℕ) (T : Finset ℕ) (z : Fin r → ℕ) (hT : T ⊆ Ico 3 r) :
    tupleGapAt (decode r b T z)=CoreGaps.bumpLast r b (CoreGaps.extend r z) := by
  funext i
  by_cases hi : i < r
  · exact gapAt_decode r b T z hT i hi
  · have hge : tupleCoreLength (decode r b T z) ≤ i := by
      rw [coreLength_decode r b T z hT]
      omega
    rw [tupleGapAt_eq_zero_of_ge _ i hge,CoreGaps.bumpLast,
      ite_eq_right (show ¬i+1=r by omega),CoreGaps.extend_ge r z i (by omega)]

theorem reducedExtension_decode (r b : ℕ) (T : Finset ℕ) (z : Fin r → ℕ)
    (hb : b ≤ 1) (hT : T ⊆ Ico 3 r) :
    CoreGaps.extend (tupleCoreLength (decode r b T z)) (tupleReducedGaps (decode r b T z))=
      CoreGaps.extend r z := by
  rw [tupleReducedGaps_extend,coreLength_decode r b T z hT,bit_decode r b T z hb hT,
    gapFun_decode r b T z hT,CoreGaps.lower_bump]

theorem decode_injective_fixed (r b c : ℕ) (T U : Finset ℕ) (z w : Fin r → ℕ)
    (hb : b ≤ 1) (hc : c ≤ 1) (hT : T ⊆ Ico 3 r) (hU : U ⊆ Ico 3 r)
    (heq : decode r b T z=decode r c U w) : b=c ∧ T=U ∧ z=w := by
  have hbit := congrArg tupleTailBit heq
  rw [bit_decode r b T z hb hT,bit_decode r c U w hc hU] at hbit
  have htail := congrArg tupleSmallTail heq
  rw [smallTail_decode r b T z hT,smallTail_decode r c U w hU] at htail
  have hgap := congrArg (fun S => CoreGaps.extend (tupleCoreLength S) (tupleReducedGaps S)) heq
  rw [reducedExtension_decode r b T z hb hT,reducedExtension_decode r c U w hc hU] at hgap
  have hz := congrArg (CoreGaps.restrict r) hgap
  simp only [CoreGaps.restrict_extend] at hz
  exact ⟨hbit,htail,hz⟩

theorem decode_actual (S : Finset ℕ) (hr : 0 < tupleCoreLength S) :
    decode (tupleCoreLength S) (tupleTailBit S) (tupleSmallTail S) (tupleReducedGaps S)=S :=
  TupleBuild.assemble_reduced_actual S hr

def TailChoice (r : ℕ) := {T : Finset ℕ // T ⊆ Ico 3 r}

def Code (r : ℕ) := Fin 2 × TailChoice r × (Fin r → ℕ)

def CoreTuple (r : ℕ) := {S : Finset ℕ // (∀ s ∈ S, 3 ≤ s) ∧ tupleCoreLength S=r}

def decodeCode (r : ℕ) (hr : 3 ≤ r) (c : Code r) : CoreTuple r :=
  ⟨decode r c.1.val c.2.1.val c.2.2,
    large_decode r c.1.val c.2.1.val c.2.2 hr c.2.1.property,
    coreLength_decode r c.1.val c.2.1.val c.2.2 c.2.1.property⟩

theorem decodeCode_injective (r : ℕ) (hr : 3 ≤ r) : Function.Injective (decodeCode r hr) := by
  rintro ⟨b,T,z⟩ ⟨c,U,w⟩ heq
  have hsets : decode r b.val T.val z=decode r c.val U.val w := congrArg Subtype.val heq
  obtain ⟨hbit,htail,hgap⟩ := decode_injective_fixed r b.val c.val T.val U.val z w
    (by have := b.isLt; omega) (by have := c.isLt; omega) T.property U.property hsets
  exact Prod.ext (Fin.ext hbit) (Prod.ext (Subtype.ext htail) hgap)

theorem decodeCode_surjective (r : ℕ) (hr : 3 ≤ r) : Function.Surjective (decodeCode r hr) := by
  rintro ⟨S,hlarge,hcore⟩
  subst r
  let b : Fin 2 := ⟨tupleTailBit S,by have := tupleTailBit_le_one S; omega⟩
  let T : TailChoice (tupleCoreLength S) := ⟨tupleSmallTail S,tupleSmallTail_subset S hlarge⟩
  refine ⟨(b,T,tupleReducedGaps S),?_⟩
  apply Subtype.ext
  exact decode_actual S (by omega)

/-- Every fixed core length at least three has a unique boundary bit,
small-tail subset, and unrestricted nonnegative gap vector. -/
def coreCodeEquiv (r : ℕ) (hr : 3 ≤ r) : Code r ≃ CoreTuple r :=
  Equiv.ofBijective (decodeCode r hr) ⟨decodeCode_injective r hr,decodeCode_surjective r hr⟩

theorem coreCodeEquiv_cost (r : ℕ) (hr : 3 ≤ r) (c : Code r) :
    tupleCost (coreCodeEquiv r hr c).val=
      r^2+r*c.1.val+∑ j : Fin r, (j.val+1)*c.2.2 j :=
  cost_decode r c.1.val c.2.1.val c.2.2 c.2.1.property

end LineSize.TupleEncoding
