import Conjectures.LineSizeTuplesEncoding

/-! The empty tuple and the two exceptional core lengths have independent
codes. Their base costs are zero, three, and six. -/
noncomputable section
namespace LineSize.TupleEncoding

open Finset

def zeroCode (_u : Unit) : CoreTuple 0 :=
  ⟨∅,by simp,(tupleCoreLength_zero_iff ∅ (by simp)).mpr rfl⟩

theorem zeroCode_injective : Function.Injective zeroCode := by
  intro a b _
  exact Subsingleton.elim a b

theorem zeroCode_surjective : Function.Surjective zeroCode := by
  rintro ⟨S,hlarge,hcore⟩
  refine ⟨(),?_⟩
  apply Subtype.ext
  exact ((tupleCoreLength_zero_iff S hlarge).mp hcore).symm

def zeroCodeEquiv : Unit ≃ CoreTuple 0 :=
  Equiv.ofBijective zeroCode ⟨zeroCode_injective,zeroCode_surjective⟩

theorem zeroCodeEquiv_cost (u : Unit) : tupleCost (zeroCodeEquiv u).val=0 :=
  tupleCost_empty

theorem singleton_coreLength (s : ℕ) (hs : 0 < s) : tupleCoreLength {s}=1 := by
  apply tupleCoreLength_eq
  refine ⟨by simp,?_,?_⟩
  · intro i hi
    have hi0 : i=0 := by omega
    subst i
    simpa [tupleAt,tupleValues] using hs
  · intro i hi hik
    simp only [card_singleton] at hik
    omega

def oneCode (z : ℕ) : CoreTuple 1 :=
  ⟨{3+z},by simp,singleton_coreLength (3+z) (by omega)⟩

theorem oneCode_cost (z : ℕ) : tupleCost (oneCode z).val=3+z :=
  tupleCost_singleton (3+z)

theorem oneCode_injective : Function.Injective oneCode := by
  intro z w heq
  have hcost := congrArg (fun S : CoreTuple 1 => tupleCost S.val) heq
  rw [oneCode_cost,oneCode_cost] at hcost
  omega

theorem oneCode_surjective : Function.Surjective oneCode := by
  rintro ⟨S,hlarge,hcore⟩
  have hcard : S.card=1 := by
    rw [tuple_card_eq_small_core S hlarge (by omega),hcore]
  obtain ⟨s,rfl⟩ := card_eq_one.mp hcard
  have hs := hlarge s (mem_singleton_self s)
  refine ⟨s-3,?_⟩
  apply Subtype.ext
  change {3+(s-3)}={s}
  congr 1
  omega

def oneCodeEquiv : ℕ ≃ CoreTuple 1 :=
  Equiv.ofBijective oneCode ⟨oneCode_injective,oneCode_surjective⟩

theorem oneCodeEquiv_cost (z : ℕ) : tupleCost (oneCodeEquiv z).val=3+z :=
  oneCode_cost z

theorem twoList_sorted (u v : ℕ) : ([4+u+v,3+v] : List ℕ).SortedGT := by
  apply List.sortedGT_cons.mpr
  constructor
  · intro s hs
    have heq : s=3+v := by simpa only [List.mem_singleton] using hs
    omega
  · apply List.sortedGT_cons.mpr
    exact ⟨by simp,List.sortedGT_nil⟩

def twoSet (u v : ℕ) : Finset ℕ := ([4+u+v,3+v] : List ℕ).toFinset

theorem twoSet_card (u v : ℕ) : (twoSet u v).card=2 := by
  rw [twoSet,List.toFinset_card_of_nodup (twoList_sorted u v).nodup]
  rfl

theorem twoSet_at_zero (u v : ℕ) : tupleAt (twoSet u v) 0=4+u+v := by
  rw [twoSet,tupleAt_eq_getD_of_sortedGT _ (twoList_sorted u v)]
  rfl

theorem twoSet_at_one (u v : ℕ) : tupleAt (twoSet u v) 1=3+v := by
  rw [twoSet,tupleAt_eq_getD_of_sortedGT _ (twoList_sorted u v)]
  rfl

theorem twoSet_large (u v : ℕ) : ∀ s ∈ twoSet u v, 3 ≤ s := by
  intro s hs
  simp only [twoSet,List.mem_toFinset,List.mem_cons,List.mem_nil_iff,or_false] at hs
  omega

theorem twoSet_coreLength (u v : ℕ) : tupleCoreLength (twoSet u v)=2 := by
  apply tupleCoreLength_eq
  refine ⟨by rw [twoSet_card],?_,?_⟩
  · intro i hi
    have hi01 : i=0 ∨ i=1 := by omega
    rcases hi01 with rfl | rfl
    · rw [twoSet_at_zero]
      omega
    · rw [twoSet_at_one]
      omega
  · intro i hi hik
    rw [twoSet_card] at hik
    omega

theorem twoSet_cost (u v : ℕ) : tupleCost (twoSet u v)=6+u+2*v := by
  unfold tupleCost
  rw [twoSet_card]
  simp only [pointCost,sum_range_succ,sum_range_zero,Nat.zero_add,Nat.sub_zero,
    twoSet_at_zero,twoSet_at_one]
  omega

def twoCode (p : ℕ × ℕ) : CoreTuple 2 :=
  ⟨twoSet p.1 p.2,twoSet_large p.1 p.2,twoSet_coreLength p.1 p.2⟩

theorem twoCode_cost (p : ℕ × ℕ) : tupleCost (twoCode p).val=6+p.1+2*p.2 :=
  twoSet_cost p.1 p.2

theorem twoCode_injective : Function.Injective twoCode := by
  intro p q heq
  have hzero := congrArg (fun S : CoreTuple 2 => tupleAt S.val 0) heq
  have hone := congrArg (fun S : CoreTuple 2 => tupleAt S.val 1) heq
  change tupleAt (twoSet p.1 p.2) 0=tupleAt (twoSet q.1 q.2) 0 at hzero
  change tupleAt (twoSet p.1 p.2) 1=tupleAt (twoSet q.1 q.2) 1 at hone
  rw [twoSet_at_zero,twoSet_at_zero] at hzero
  rw [twoSet_at_one,twoSet_at_one] at hone
  exact Prod.ext (by omega) (by omega)

theorem twoCode_surjective : Function.Surjective twoCode := by
  rintro ⟨S,hlarge,hcore⟩
  have hcard : S.card=2 := by
    rw [tuple_card_eq_small_core S hlarge (by omega),hcore]
  have hdrop := tupleAt_decreasing S 0 1 (by omega) (by omega)
  have hlast := tupleAt_ge_three S hlarge 1 (by omega)
  have hfirst : 4+(tupleAt S 0-tupleAt S 1-1)+(tupleAt S 1-3)=tupleAt S 0 := by
    omega
  have hsecond : 3+(tupleAt S 1-3)=tupleAt S 1 := by omega
  refine ⟨(tupleAt S 0-tupleAt S 1-1,tupleAt S 1-3),?_⟩
  apply Subtype.ext
  change ([4+(tupleAt S 0-tupleAt S 1-1)+(tupleAt S 1-3),
    3+(tupleAt S 1-3)] : List ℕ).toFinset=S
  rw [hfirst,hsecond]
  ext s
  simp only [List.mem_toFinset,List.mem_cons,List.mem_nil_iff,or_false]
  constructor
  · rintro (rfl | rfl)
    · exact tupleAt_mem S 0 (by omega)
    · exact tupleAt_mem S 1 (by omega)
  · intro hs
    obtain ⟨i,hi,heq⟩ := (mem_iff_tupleAt S s).mp hs
    have hi01 : i=0 ∨ i=1 := by omega
    rcases hi01 with rfl | rfl
    · exact Or.inl heq.symm
    · exact Or.inr heq.symm

def twoCodeEquiv : (ℕ × ℕ) ≃ CoreTuple 2 :=
  Equiv.ofBijective twoCode ⟨twoCode_injective,twoCode_surjective⟩

theorem twoCodeEquiv_cost (p : ℕ × ℕ) : tupleCost (twoCodeEquiv p).val=6+p.1+2*p.2 :=
  twoCode_cost p

end LineSize.TupleEncoding
