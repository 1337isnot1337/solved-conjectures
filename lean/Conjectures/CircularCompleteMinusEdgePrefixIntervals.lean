import Conjectures.CircularCompleteMinusEdgePrefixSteps
import Mathlib.Data.Finset.Max

/-! Prefix counts have no holes. With the number of short steps
fixed, the possible jump counts form a closed integer interval;
this explains the row intervals in the actual table. -/

namespace CircularCompleteMinusEdge

theorem edgeStepPrefix_monotone {m : ℕ} (p : Fin (m+1)→ℕ) (long : Bool) :
    Monotone (edgeStepPrefix p long) := by
  apply Fin.monotone_iff_le_succ.mpr
  intro i
  rw [edgeStepPrefix_succ]
  exact Nat.le_add_right _ _

theorem edgeStepPrefix_attains_below {m : ℕ} (p : Fin (m+1)→ℕ) (long : Bool)
    (a : Fin (m+1)) (g : ℕ) (hg : g≤edgeStepPrefix p long a) :
    ∃ i : Fin (m+1),i≤a ∧ edgeStepPrefix p long i=g := by
  induction a using Fin.induction with
  | zero =>
    rw [edgeStepPrefix_zero] at hg
    exact ⟨0,le_rfl,(edgeStepPrefix_zero p long).trans (Nat.eq_zero_of_le_zero hg).symm⟩
  | succ i ih =>
    by_cases hPrev : g≤edgeStepPrefix p long i.castSucc
    · obtain ⟨j,hj,he⟩ := ih hPrev
      exact ⟨j,hj.trans (show i.castSucc ≤ i.succ from Nat.le_succ _),he⟩
    · refine ⟨i.succ,le_rfl,?_⟩
      rw [edgeStepPrefix_succ] at hg ⊢
      split_ifs at hg ⊢ <;> omega

/-- For each feasible short-step count, the jump coordinate
runs through every integer between the first and last occurrence
of that count. This identifies the closed row interval exactly. -/
theorem exact_jump_interval_at_short_count {m P : ℕ} (p : Fin (m+1)→ℕ)
    (hp : StrictMono p) (hG : ∀ j,runStep p j=1 ∨ runStep p j=P) (hP : 2≤P)
    (g : ℕ) (hg : g≤edgeStepPrefix p false (Fin.last m)) :
    ∃ lo hi : ℕ, lo≤hi ∧ ∀ k : ℕ,
      (∃ i : Fin (m+1),edgeStepPrefix p false i=g ∧ edgeStepPrefix p true i=k) ↔
        lo≤k ∧ k≤hi := by
  classical
  let s := Finset.univ.filter fun i : Fin (m+1) => edgeStepPrefix p false i=g
  obtain ⟨a,_,ha⟩ := edgeStepPrefix_attains_below p false (Fin.last m) g hg
  have hNe : s.Nonempty := ⟨a,Finset.mem_filter.mpr ⟨Finset.mem_univ _,ha⟩⟩
  let fst := s.min' hNe
  let lst := s.max' hNe
  have hf : fst∈s := Finset.min'_mem _ _
  have hl : lst∈s := Finset.max'_mem _ _
  have hF := (Finset.mem_filter.mp hf).2
  have hL := (Finset.mem_filter.mp hl).2
  let lo := edgeStepPrefix p true fst
  let hi := edgeStepPrefix p true lst
  have hSpan : fst≤lst := Finset.min'_le _ _ hl
  have hM := edgeStepPrefix_monotone p false
  have hM' := edgeStepPrefix_monotone p true
  have hSum (i : Fin (m+1)) :
      edgeStepPrefix p false i+edgeStepPrefix p true i=i.val :=
    (exact_two_gap_prefix_position p hp hG hP i).1
  refine ⟨lo,hi,hM' hSpan,fun k => ?_⟩
  constructor
  · rintro ⟨i,hiG,rfl⟩
    have hiS : i∈s := Finset.mem_filter.mpr ⟨Finset.mem_univ _,hiG⟩
    exact ⟨hM' (Finset.min'_le _ _ hiS),hM' (Finset.le_max' _ _ hiS)⟩
  · rintro ⟨hk₁,hk₂⟩
    have eF : g+lo=fst.val := by simpa [hF,lo] using hSum fst
    have eL : g+hi=lst.val := by simpa [hL,hi] using hSum lst
    let i : Fin (m+1) := ⟨g+k,by have := lst.isLt; omega⟩
    have hFi : fst≤i := by change fst.val≤g+k; omega
    have hLi : i≤lst := by change g+k≤lst.val; omega
    have hgI : edgeStepPrefix p false i=g := by
      have h₁ := hM hFi
      have h₂ := hM hLi
      omega
    have hEq := hSum i
    change edgeStepPrefix p false i+edgeStepPrefix p true i=g+k at hEq
    exact ⟨i,hgI,by omega⟩

end CircularCompleteMinusEdge
