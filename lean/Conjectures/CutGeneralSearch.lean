import Conjectures.CutGeneralGraph

/-! A computable exhaustive search for finite-prefix arithmetic candidates. -/
namespace CutGeneral
open CutFamily

/-- All length-n tables with entries between zero and B, inclusive. -/
def tables (B : Nat) : (n : Nat) → List (Fin n → Nat)
  | 0 => [fun i => Fin.elim0 i]
  | n+1 => (List.range (B+1)).flatMap (fun a =>
      (tables B n).map (fun f => Fin.cases a f))

theorem tables_correct (B n : Nat) (f : Fin n → Nat) :
    f∈tables B n ↔ ∀ i, f i≤B := by
  induction n with
  | zero =>
    constructor
    · intro _ i
      exact Fin.elim0 i
    · intro _
      apply List.mem_singleton.mpr
      funext i
      exact Fin.elim0 i
  | succ n ih =>
    constructor
    · intro h
      obtain ⟨a,ha,hf⟩ := List.mem_flatMap.mp h
      obtain ⟨g,hg,rfl⟩ := List.mem_map.mp hf
      have hab : a≤B := by have := List.mem_range.mp ha; omega
      have hgb := (ih g).mp hg
      intro i
      cases i using Fin.cases with
      | zero => exact hab
      | succ j => exact hgb j
    · intro h
      apply List.mem_flatMap.mpr
      refine ⟨f 0,List.mem_range.mpr (Nat.lt_succ_of_le (h 0)),?_⟩
      apply List.mem_map.mpr
      refine ⟨fun i => f i.succ,(ih _).mpr (fun i => h i.succ),?_⟩
      funext i
      cases i using Fin.cases <;> rfl

/-- All candidates whose prefix length, positive period, saltus, and entries
are at most B. The list is finite for every B. -/
def enumerateCandidates (B : Nat) : List Candidate :=
  (List.range (B+1)).flatMap (fun N =>
    (List.range (B+1)).flatMap (fun P =>
      if hp : 0<P then
        (tables B N).flatMap (fun initial =>
          (tables B P).flatMap (fun tail =>
            (List.range (B+1)).map (fun s =>
              ⟨N,initial,P,hp,tail,s⟩)))
      else []))

theorem enumerateCandidates_contains (B : Nat) (c : Candidate)
    (hN : c.prefixLength≤B) (hP : c.period≤B) (hs : c.saltus≤B)
    (hinitial : ∀ i, c.prefixValues i≤B) (htail : ∀ i, c.tail i≤B) :
    c∈enumerateCandidates B := by
  apply List.mem_flatMap.mpr
  refine ⟨c.prefixLength,List.mem_range.mpr (Nat.lt_succ_of_le hN),?_⟩
  apply List.mem_flatMap.mpr
  refine ⟨c.period,List.mem_range.mpr (Nat.lt_succ_of_le hP),?_⟩
  rw [dite_eq_left c.period_pos]
  apply List.mem_flatMap.mpr
  refine ⟨c.prefixValues,(tables_correct B _ _).mpr hinitial,?_⟩
  apply List.mem_flatMap.mpr
  refine ⟨c.tail,(tables_correct B _ _).mpr htail,?_⟩
  apply List.mem_map.mpr
  exact ⟨c.saltus,List.mem_range.mpr (Nat.lt_succ_of_le hs),rfl⟩

def Candidate.searchBound (c : Candidate) : Nat :=
  1+c.prefixLength+c.period+c.saltus+
    ((List.finRange c.prefixLength).map c.prefixValues).sum+
    ((List.finRange c.period).map c.tail).sum

theorem Candidate.enumeration_complete (c : Candidate) (B : Nat) (hB : c.searchBound≤B) :
    c∈enumerateCandidates B := by
  apply enumerateCandidates_contains
  · unfold Candidate.searchBound at hB
    omega
  · unfold Candidate.searchBound at hB
    omega
  · unfold Candidate.searchBound at hB
    omega
  · intro i
    have hi := member_le_sum ((List.finRange c.prefixLength).map c.prefixValues)
      (c.prefixValues i) (List.mem_map.mpr ⟨i,by simp,rfl⟩)
    unfold Candidate.searchBound at hB
    omega
  · intro i
    have hi := member_le_sum ((List.finRange c.period).map c.tail)
      (c.tail i) (List.mem_map.mpr ⟨i,by simp,rfl⟩)
    unfold Candidate.searchBound at hB
    omega

/-- A finite search stage returns only candidates satisfying the exact mex rule. -/
def verifiedCandidates (cuts : List Nat) (B : Nat) : List Candidate :=
  (enumerateCandidates B).filter (fun c => c.test cuts)

theorem verifiedCandidates_sound (cuts : List Nat) (B : Nat) (c : Candidate)
    (h : c∈verifiedCandidates cuts B) : SatisfiesMex {d | d∈cuts} c.value :=
  (c.test_correct cuts).mp (List.mem_filter.mp h).2

/-- Every valid finite-prefix arithmetic representation appears after a finite,
explicit stage. No assumption that all CUT games have such a representation is used. -/
theorem verifiedCandidates_complete (cuts : List Nat) (c : Candidate)
    (hc : SatisfiesMex {d | d∈cuts} c.value) :
    ∀ B, c.searchBound≤B → c∈verifiedCandidates cuts B := by
  intro B hB
  apply List.mem_filter.mpr
  exact ⟨c.enumeration_complete B hB,(c.test_correct cuts).mpr hc⟩

#print axioms verifiedCandidates_sound
#print axioms verifiedCandidates_complete

end CutGeneral
