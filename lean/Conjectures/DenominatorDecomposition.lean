import Conjectures.DenominatorSplice
import Conjectures.DenominatorPrefixPolynomials
import Mathlib.Tactic.Ring

namespace DenominatorForest

open Polynomial

theorem deadPoly_shift (a : List Nat) (s : Int) (c : Nat) :
    deadPoly (shiftHead a c) (s+c)=deadPoly a s := by
  have aux : ∀ N (a : List Nat), a.length=N → ∀ s c,
      deadPoly (shiftHead a c) (s+c)=deadPoly a s := by
    intro N
    induction N using Nat.strong_induction_on with
    | h N ih =>
      intro a ha s c
      rw [deadPoly_eq (shiftHead a c) (s+c),deadPoly_eq a s,headChoices_shift]
      apply congrArg (fun P : ℚ[X] => 1+X*P)
      apply Finset.sum_congr rfl
      intro j hj
      have hj' := ((mem_headChoices a s j).mp hj).1
      have hoff : headOffset (shiftHead a c) j=headOffset a j+c := headOffset_shift a c j hj'
      rw [headStep_shift,hoff]
      exact ih (headStep a j).length (by rw [headStep_length]; omega)
        (headStep a j) rfl (headOffset a j) c
  exact aux a.length a rfl s c

theorem freePoly_shift (a : List Nat) (c : Nat) : freePoly (shiftHead a c)=freePoly a := by
  rw [freePoly_eq (shiftHead a c),freePoly_eq a,freeChoices_shift]
  apply congrArg (fun P : ℚ[X] => 1+X*P)
  apply Finset.sum_congr rfl
  intro j hj
  have hj' := ((mem_freeChoices a j).mp hj).1
  have hoff : headOffset (shiftHead a c) j=headOffset a j+c := headOffset_shift a c j hj'
  rw [headStep_shift,hoff,deadPoly_shift]

@[simp] theorem polynomial_sum_coe {I : Type*} (S : Finset I) (f : I → ℚ[X]) :
    ((∑ i ∈ S, f i : ℚ[X]) : PowerSeries ℚ)=∑ i ∈ S, (f i : PowerSeries ℚ) :=
  map_sum (Polynomial.coeToPowerSeries.ringHom (R := ℚ)) f S

theorem deadPoly_coe_eq (a : List Nat) (s : Int) :
    (deadPoly a s : PowerSeries ℚ)=1+PowerSeries.X*
      ∑ j ∈ headChoices a s, (deadPoly (headStep a j) (headOffset a j):PowerSeries ℚ) := by
  rw [deadPoly_eq]
  simp

theorem freePoly_coe_eq (a : List Nat) :
    (freePoly a : PowerSeries ℚ)=1+PowerSeries.X*
      ∑ j ∈ freeChoices a, (deadPoly (headStep a j) (headOffset a j):PowerSeries ℚ) := by
  rw [freePoly_eq]
  simp

/-- Once the tail lies below the reverse-move threshold, the whole subtree
is the finite terminal-head polynomial. -/
theorem blocked_series (a : List Nat) (t : State) (s : Int)
    (ht : t.Sorted) (hs : (State.splice a t s).Sorted) (hsep : State.Separated a t)
    (hblock : (t.value 0:Int) < a.length+s) :
    series (State.splice a t s)=(deadPoly a s:PowerSeries ℚ) := by
  have aux : ∀ N (a : List Nat), a.length=N → ∀ t s,
      t.Sorted → (State.splice a t s).Sorted → State.Separated a t →
      (t.value 0:Int) < a.length+s →
      series (State.splice a t s)=(deadPoly a s:PowerSeries ℚ) := by
    intro N
    induction N using Nat.strong_induction_on with
    | h N ih =>
      intro a ha t s ht hs hsep hb
      rw [series_rec,State.splice_moves_blocked a t s ht hb,deadPoly_coe_eq]
      apply congrArg (fun P : PowerSeries ℚ => 1+PowerSeries.X*P)
      apply Finset.sum_congr rfl
      intro j hj
      have hj' := ((mem_headChoices a s j).mp hj).1
      have he := State.splice_step_head a t s j hj'
      rw [series_congr he]
      exact ih (headStep a j).length (by rw [headStep_length]; omega)
        (headStep a j) rfl t (headOffset a j) ht
        (State.sorted_dataEq he ((State.splice a t s).step_sorted hs j))
        (State.headStep_separated a t s hs hsep j hj')
        (State.splice_step_blocks_tail a t s hs hsep j hj')
  exact aux a.length a rfl t s ht hs hsep hblock

/-- A protected prefix supplies a fixed finite contribution at every tail
vertex. All infinite continuation comes from moves made in the tail. -/
theorem protected_series_rec (a : List Nat) (t : State) (h : State.Protected a t) :
    series (State.liftHead a t)=(freePoly a:PowerSeries ℚ)+PowerSeries.X*
      ∑ j ∈ t.moves, series (State.liftHead (shiftHead a 1) (t.step j)) := by
  rw [series_rec,State.liftHead_moves a t h.full_sorted h.separated h.high,
    Finset.sum_union (State.liftHead_moves_disjoint a t)]
  rw [Finset.sum_image (fun j _ k _ he => Nat.add_left_cancel he)]
  have hhead : (∑ j ∈ freeChoices a, series ((State.liftHead a t).step j))=
      ∑ j ∈ freeChoices a, (deadPoly (headStep a j) (headOffset a j):PowerSeries ℚ) := by
    apply Finset.sum_congr rfl
    intro j hj
    have hj' := ((mem_freeChoices a j).mp hj).1
    have he := State.splice_step_head a t (t.offset-a.length) j hj'
    change series ((State.splice a t (t.offset-a.length)).step j)=_
    rw [series_congr he]
    exact blocked_series (headStep a j) t (headOffset a j) h.tail_sorted
      (State.sorted_dataEq he ((State.liftHead a t).step_sorted h.full_sorted j))
      (State.headStep_separated a t _ h.full_sorted h.separated j hj')
      (State.splice_step_blocks_tail a t _ h.full_sorted h.separated j hj')
  have htail : (∑ j ∈ t.moves, series ((State.liftHead a t).step (a.length+j)))=
      ∑ j ∈ t.moves, series (State.liftHead (shiftHead a 1) (t.step j)) := by
    apply Finset.sum_congr rfl
    intro j _
    exact series_congr (State.liftHead_step_tail a t j)
  rw [hhead,htail,freePoly_coe_eq]
  ring

/-- The exact product decomposition. It applies to the actual infinite
reverse-state path series, without a rationality assumption. -/
theorem protected_series (a : List Nat) (t : State) (h : State.Protected a t) :
    series (State.liftHead a t)=(freePoly a:PowerSeries ℚ)*series t := by
  let I := {q : List Nat × State // State.Protected q.1 q.2}
  let F : I → PowerSeries ℚ := fun q =>
    series (State.liftHead q.val.1 q.val.2)-(freePoly q.val.1:PowerSeries ℚ)*series q.val.2
  have hF : ∀ q : I, ∃ (S : Finset Nat) (child : Nat → I),
      F q=PowerSeries.X*(∑ j ∈ S, F (child j)) := by
    intro q
    let child : Nat → I := fun j => ⟨(shiftHead q.val.1 1,q.val.2.step j),
      State.protected_after_tail q.val.1 q.val.2 q.property j⟩
    refine ⟨q.val.2.moves,child,?_⟩
    dsimp [F,child]
    rw [protected_series_rec q.val.1 q.val.2 q.property,series_rec q.val.2]
    simp only [freePoly_shift]
    rw [Finset.sum_sub_distrib,← Finset.mul_sum]
    ring
  have hz := guarded_zero F hF (⟨(a,t),h⟩:I)
  exact sub_eq_zero.mp hz

end DenominatorForest
