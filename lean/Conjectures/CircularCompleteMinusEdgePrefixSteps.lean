import Conjectures.CircularCompleteMinusEdgeRunArithmetic

/-! Track the two types of step in the literal chronological
enumeration. The prefix endpoint identity is the arithmetic
part of the row-interval representation in Step 5(3). -/

namespace CircularCompleteMinusEdge
open scoped BigOperators

def edgeStepPrefix {m : ℕ} (p : Fin (m+1)→ℕ) (long : Bool) (a : Fin (m+1)) : ℕ :=
  ∑ k ∈ Finset.range a.val, if hk : k<m then
    if decide (runStep p ⟨k,hk⟩≠1)=long then 1 else 0 else 0

theorem edgeStepPrefix_zero {m : ℕ} (p : Fin (m+1)→ℕ) (long : Bool) :
    edgeStepPrefix p long 0=0 := by simp [edgeStepPrefix]

theorem edgeStepPrefix_succ {m : ℕ} (p : Fin (m+1)→ℕ) (long : Bool) (i : Fin m) :
    edgeStepPrefix p long i.succ = edgeStepPrefix p long i.castSucc +
      (if decide (runStep p i≠1)=long then 1 else 0) := by
  unfold edgeStepPrefix
  change (∑ k ∈ Finset.range (i.val+1), if hk : k<m then
    if decide (runStep p ⟨k,hk⟩≠1)=long then 1 else 0 else 0)=_
  rw [Finset.sum_range_succ]
  simp [i.isLt]

/-- Position after a prefix equals the first position plus the
number of unit steps plus the period times the number of jumps. -/
theorem exact_two_gap_prefix_position {m P : ℕ} (p : Fin (m+1)→ℕ) (hp : StrictMono p)
    (hG : ∀ j,runStep p j=1 ∨ runStep p j=P) (hP : 2≤P) (a : Fin (m+1)) :
    (edgeStepPrefix p false a+edgeStepPrefix p true a)=a.val ∧
      p a=p 0+edgeStepPrefix p false a+P*edgeStepPrefix p true a := by
  induction a using Fin.induction with
  | zero => simp [edgeStepPrefix_zero]
  | succ i ih =>
    have hs : p i.castSucc + runStep p i=p i.succ := by
      have hh : p i.castSucc≤p i.succ := (hp (show i.castSucc < i.succ from Nat.lt_succ_self _)).le
      unfold runStep
      omega
    rw [edgeStepPrefix_succ,edgeStepPrefix_succ]
    rcases hG i with e|e
    · simp [e]
      constructor
      · have hI := ih.1
        change edgeStepPrefix p false i.castSucc+edgeStepPrefix p true i.castSucc=i.val at hI
        change edgeStepPrefix p false i.castSucc+1+edgeStepPrefix p true i.castSucc=i.val+1
        omega
      · have hh := ih.2
        omega
    · have he : runStep p i≠1 := by omega
      simp [he,Nat.mul_add]
      constructor
      · have hI := ih.1
        change edgeStepPrefix p false i.castSucc+edgeStepPrefix p true i.castSucc=i.val at hI
        change edgeStepPrefix p false i.castSucc+(edgeStepPrefix p true i.castSucc+1)=i.val+1
        omega
      · have hh := ih.2
        omega

end CircularCompleteMinusEdge
