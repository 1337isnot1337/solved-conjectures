module

public import Conjectures.SteinkeZakynthinou.Learner
public import Conjectures.SteinkeZakynthinou.Alignment

/-! Position and orientation of canonical cuts in the folded cycle. -/

@[expose] public section

namespace SteinkeZakynthinou

def orientation (n : ℕ) (p : Fin (cycleSize n)) : Bool := decide (n + 1 ≤ p.val)

def unfoldRank (n : ℕ) (r : Fin (n + 1)) (b : Bool) : Fin (cycleSize n) :=
  if b then ⟨cycleSize n - 1 - r.val, by
    have h := cycleSize_pos n
    omega⟩ else ⟨r.val, by
    have h := r.isLt
    change r.val < 2 * n + 1 + 1
    omega⟩

theorem foldRank_unfoldRank (n : ℕ) (r : Fin (n + 1)) (b : Bool) :
    foldRank n (unfoldRank n r b) = r := by
  have hr := r.isLt
  apply Fin.ext
  cases b
  · simp [unfoldRank, foldRank, hr]
  · have h : ¬ cycleSize n - 1 - r.val < n + 1 := by simp only [cycleSize]; omega
    simp only [unfoldRank, ite_true, foldRank, dite_eq_right h]
    simp only [cycleSize]
    omega

theorem orientation_unfoldRank (n : ℕ) (r : Fin (n + 1)) (b : Bool) :
    orientation n (unfoldRank n r b) = b := by
  have hr := r.isLt
  cases b
  · simp [orientation, unfoldRank, not_le.mpr hr]
  · have h : n + 1 ≤ cycleSize n - 1 - r.val := by simp only [cycleSize]; omega
    change decide (n + 1 ≤ cycleSize n - 1 - r.val) = true
    exact decide_eq_true h

theorem unfoldRank_foldRank (n : ℕ) (p : Fin (cycleSize n)) :
    unfoldRank n (foldRank n p) (orientation n p) = p := by
  have hp := p.isLt
  apply Fin.ext
  unfold unfoldRank orientation foldRank
  by_cases h : p.val < n + 1
  · simp [h, not_le.mpr h]
  · have hp' : n + 1 ≤ p.val := Nat.le_of_not_lt h
    simp only [dite_eq_right h, hp', decide_true, ite_true, Fin.val_mk, cycleSize] at *
    omega

/-- An ordered inclusion of the original cuts induces an ordered
inclusion of the folded lists, preserving the orientation. -/
def foldedEmbedding {n m : ℕ} (f : Fin (n + 1) ↪o Fin (m + 1)) :
    Fin (cycleSize n) ↪o Fin (cycleSize m) :=
  OrderEmbedding.ofStrictMono (fun p => unfoldRank m (f (foldRank n p)) (orientation n p)) (by
    intro a b hab
    have ha := a.isLt
    have hb := b.isLt
    change a.val < b.val at hab
    by_cases hb' : b.val < n + 1
    · have ha' : a.val < n + 1 := hab.trans hb'
      have h := f.strictMono (show (⟨a.val, ha'⟩ : Fin (n + 1)) < ⟨b.val, hb'⟩ from hab)
      simpa [unfoldRank, foldRank, orientation, ha', hb', not_le.mpr ha', not_le.mpr hb'] using h
    · by_cases ha' : a.val < n + 1
      · have haM := (f (foldRank n a)).isLt
        have hbM := (f (foldRank n b)).isLt
        change (unfoldRank m (f (foldRank n a)) (orientation n a)).val <
          (unfoldRank m (f (foldRank n b)) (orientation n b)).val
        simp only [orientation, not_le.mpr ha', not_lt.mp hb', decide_false, decide_true,
          unfoldRank, Bool.false_eq_true, ite_false, ite_true, Fin.val_mk, cycleSize]
        omega
      · have hrev : (foldRank n b).val < (foldRank n a).val := by
          simp only [foldRank, dite_eq_right hb', dite_eq_right ha', Fin.val_mk]
          omega
        have h := f.strictMono hrev
        change (f (foldRank n b)).val < (f (foldRank n a)).val at h
        have haM := (f (foldRank n a)).isLt
        have hbM := (f (foldRank n b)).isLt
        change (unfoldRank m (f (foldRank n a)) (orientation n a)).val <
          (unfoldRank m (f (foldRank n b)) (orientation n b)).val
        simp only [orientation, not_lt.mp ha', not_lt.mp hb', decide_true, unfoldRank,
          ite_true, Fin.val_mk, cycleSize]
        omega)

theorem foldRank_foldedEmbedding {n m : ℕ} (f : Fin (n + 1) ↪o Fin (m + 1))
    (a : Fin (cycleSize n)) :
    foldRank m (foldedEmbedding f a) = f (foldRank n a) :=
  foldRank_unfoldRank _ _ _

theorem orientation_foldedEmbedding {n m : ℕ} (f : Fin (n + 1) ↪o Fin (m + 1))
    (a : Fin (cycleSize n)) :
    orientation m (foldedEmbedding f a) = orientation n a :=
  orientation_unfoldRank _ _ _

theorem mem_range_foldedEmbedding {n m : ℕ} (f : Fin (n + 1) ↪o Fin (m + 1))
    (a : Fin (cycleSize m)) :
    a ∈ Set.range (foldedEmbedding f) ↔ foldRank m a ∈ Set.range f := by
  constructor
  · rintro ⟨b, rfl⟩
    exact ⟨foldRank n b, foldRank_foldedEmbedding f b |>.symm⟩
  · rintro ⟨r, hr⟩
    use unfoldRank n r (orientation m a)
    unfold foldedEmbedding
    change unfoldRank m (f (foldRank n (unfoldRank n r (orientation m a))))
        (orientation n (unfoldRank n r (orientation m a))) = a
    rw [foldRank_unfoldRank, orientation_unfoldRank, hr, unfoldRank_foldRank]

end SteinkeZakynthinou
