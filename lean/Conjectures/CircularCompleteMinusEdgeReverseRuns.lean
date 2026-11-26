import Conjectures.CircularCompleteMinusEdgeRunArithmetic
import Mathlib.Data.Fin.Rev

/-! Chronological data for the reflected table index. This is
the arithmetic used to apply the same run argument at both ends. -/

namespace CircularCompleteMinusEdge

def reversePositions {m N : ℕ} (p : Fin (m+1)→Fin N) : Fin (m+1)→Fin N :=
  fun i => (p i.rev).rev

theorem reversePositions_strictMono {m N : ℕ} {p : Fin (m+1)→Fin N} (hp : StrictMono p) :
    StrictMono (reversePositions p) := by
  intro i j h
  exact Fin.rev_lt_rev.mpr (hp (Fin.rev_lt_rev.mpr h))

theorem reversePositions_first {m N : ℕ} (p : Fin (m+1)→Fin N) :
    reversePositions p 0=(p (Fin.last m)).rev := by
  have he : (0:Fin (m+1)).rev=Fin.last m := Fin.ext (by
    change (m+1)-(0+1)=m
    omega)
  exact congrArg (fun j => (p j).rev) he

theorem reversePositions_gap {m N : ℕ} (p : Fin (m+1)→Fin N) (hp : StrictMono p) (i : Fin m) :
    runStep (fun j => (reversePositions p j).val) i = runStep (fun j => (p j).val) i.rev := by
  have h₁ : i.succ.rev=i.rev.castSucc := by
    apply Fin.ext
    have hi := i.isLt
    change (m+1)-(i.val+1+1)=m-(i.val+1)
    omega
  have h₂ : i.castSucc.rev=i.rev.succ := by
    apply Fin.ext
    have hi := i.isLt
    change (m+1)-(i.val+1)=(m-(i.val+1))+1
    omega
  change (p i.succ.rev).rev.val - (p i.castSucc.rev).rev.val =
    (p i.rev.succ).val - (p i.rev.castSucc).val
  rw [h₁,h₂]
  let a := (p i.rev.castSucc).val
  let b := (p i.rev.succ).val
  have ha : a<N := (p i.rev.castSucc).isLt
  have hb : b<N := (p i.rev.succ).isLt
  have hab : a<b := hp (show i.rev.castSucc<i.rev.succ from Nat.lt_succ_self _)
  change (N-(a+1))-(N-(b+1))=b-a
  omega

end CircularCompleteMinusEdge
