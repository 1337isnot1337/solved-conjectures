import Conjectures.HornakRegularSource

/-! Arithmetic for the subset-sum transformations in the Barth tripod
reduction. These lemmas do not assert the graph reduction itself. -/
namespace Hornak

def InMiddleWindow (middle short largest value : ℕ) : Prop :=
  middle+short+1 ≤ value+largest ∧ value ≤ middle

/-- A subset sum using the raised small part in the balanced partition
can be converted to one using either original part. -/
theorem middle_window_raise_small (middle short largest small large base : ℕ)
    (hsmall : short+1 ≤ small) (horder : small+2 ≤ large)
    (hmax : large ≤ largest)
    (hnew : InMiddleWindow middle short largest (base+small+1)) :
    InMiddleWindow middle short largest (base+small) ∨
      InMiddleWindow middle short largest (base+large) := by
  unfold InMiddleWindow at *
  omega

/-- The symmetric step for a subset using the lowered larger part. -/
theorem middle_window_lower_large (middle short largest small large base : ℕ)
    (hsmall : short+1 ≤ small) (horder : small+2 ≤ large)
    (hmax : large ≤ largest)
    (hnew : InMiddleWindow middle short largest (base+large-1)) :
    InMiddleWindow middle short largest (base+small) ∨
      InMiddleWindow middle short largest (base+large) := by
  unfold InMiddleWindow at *
  omega

def HasMiddleWindowSubset (middle short largest : ℕ) (parts : List ℕ) : Prop :=
  ∃ chosen : List ℕ, chosen.Sublist parts ∧ InMiddleWindow middle short largest chosen.sum

/-- Balancing two noncentral parts cannot create a middle-window subset
unless the original partition already had one. This formalizes the
subset-sum core of Claim 4 in the tripod reduction. -/
theorem middle_window_balance_transfer (middle short largest small large : ℕ)
    (rest : List ℕ) (hsmall : short+1 ≤ small) (horder : small+2 ≤ large)
    (hmax : large ≤ largest)
    (hnew : HasMiddleWindowSubset middle short largest ((small+1)::(large-1)::rest)) :
    HasMiddleWindowSubset middle short largest (small::large::rest) := by
  obtain ⟨chosen,hsub,hwindow⟩ := hnew
  rcases List.sublist_cons_iff.mp hsub with hskip | ⟨chosen',rfl,hkeep⟩
  · rcases List.sublist_cons_iff.mp hskip with hskip | ⟨tail,rfl,hkeep⟩
    · exact ⟨chosen,hskip.cons large |>.cons small,hwindow⟩
    · simp only [List.sum_cons] at hwindow
      rcases middle_window_lower_large middle short largest small large tail.sum hsmall horder hmax
          (by convert hwindow using 1; omega) with hs | hl
      · refine ⟨small::tail, (hkeep.cons large).cons_cons small,?_⟩
        simpa [List.sum_cons, Nat.add_comm] using hs
      · refine ⟨large::tail, (hkeep.cons_cons large).cons small,?_⟩
        simpa [List.sum_cons, Nat.add_comm] using hl
  · rcases List.sublist_cons_iff.mp hkeep with hskip | ⟨tail,rfl,hkeep⟩
    · simp only [List.sum_cons] at hwindow
      rcases middle_window_raise_small middle short largest small large chosen'.sum hsmall horder hmax
          (by simpa [Nat.add_comm, Nat.add_left_comm, Nat.add_assoc] using hwindow) with hs | hl
      · refine ⟨small::chosen', (hskip.cons large).cons_cons small,?_⟩
        simpa [List.sum_cons, Nat.add_comm] using hs
      · refine ⟨large::chosen', (hskip.cons_cons large).cons small,?_⟩
        simpa [List.sum_cons, Nat.add_comm] using hl
    · have ht : tail.Sublist rest := List.cons_sublist_cons.mp hkeep
      refine ⟨small::large::tail, (ht.cons_cons large).cons_cons small,?_⟩
      simp only [List.sum_cons] at hwindow ⊢
      have heq : small+(large+tail.sum) = (small+1)+((large-1)+tail.sum) := by omega
      rw [heq]
      exact hwindow

/-- Decreasing the largest part and raising a smaller one cannot create a
middle-window subset where none existed before. -/
theorem middle_window_largest_transfer (middle short largest small : ℕ)
    (rest : List ℕ) (hlargest : 0 < largest)
    (hnew : HasMiddleWindowSubset middle short (largest-1) ((small+1)::rest)) :
    HasMiddleWindowSubset middle short largest (small::rest) := by
  obtain ⟨chosen,hsub,hwindow⟩ := hnew
  rcases List.sublist_cons_iff.mp hsub with hskip | ⟨tail,rfl,hkeep⟩
  · refine ⟨chosen,hskip.cons small,?_⟩
    unfold InMiddleWindow at *
    omega
  · refine ⟨small::tail,hkeep.cons_cons small,?_⟩
    simp only [List.sum_cons] at hwindow ⊢
    unfold InMiddleWindow at *
    omega

/-- The balancing operation preserves total size and strictly decreases
squared size whenever the two parts differ by at least two. -/
theorem balance_parts_measure (small large : ℕ) (h : small+2 ≤ large) :
    (small+1)+(large-1) = small+large ∧
    (small+1)^2+(large-1)^2 < small^2+large^2 := by
  have hs : large-1+1=large := by omega
  constructor
  · omega
  · nlinarith

/-- Balancing the largest part with a smaller part has the same strict
termination measure. -/
theorem reduce_largest_measure (small largest : ℕ) (h : small+2 ≤ largest) :
    (small+1)+(largest-1) = small+largest ∧
    (small+1)^2+(largest-1)^2 < small^2+largest^2 :=
  balance_parts_measure small largest h

end Hornak
