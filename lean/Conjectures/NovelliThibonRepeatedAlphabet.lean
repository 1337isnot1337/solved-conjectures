module
public import Conjectures.NovelliThibonStrictWordCount
public import Conjectures.NovelliThibonFiniteFundamental
public import Mathlib.Data.Fin.Tuple.Basic
public import Mathlib.Algebra.BigOperators.Fin

@[expose] public section
namespace NovelliThibon

variable {k : ℕ}

/-- The slice with exactly (k+1) letters from the repeated (z)
alphabet, followed by the single positive letter (1).
The set (W) records the weak boundaries in the prefix. -/
abbrev RepeatedAlphabetSlice (W : Finset (Fin k)) (b m : ℕ) :=
  {f : Fin ((k+1)+b) → Fin (m+1) //
    (∀ i : Fin (k+1), (f (Fin.castAdd b i)).val < m) ∧
    (∀ i : Fin b, f (Fin.natAdd (k+1) i)=Fin.last m) ∧ Monotone f ∧
    (∀ i : Fin k,i∉W → f (Fin.castAdd b i.castSucc) < f (Fin.castAdd b i.succ))}

noncomputable instance (W : Finset (Fin k)) (b m : ℕ) : Fintype (RepeatedAlphabetSlice W b m) := by
  classical
  exact Subtype.fintype _

def toRepeatedWord {m : ℕ} (f : Fin (k+1) → Fin m) (b : ℕ) : Fin ((k+1)+b) → Fin (m+1) :=
  Fin.append (fun i => (f i).castSucc) (fun _ => Fin.last m)

theorem toRepeatedWord_left {m b : ℕ} (f : Fin (k+1) → Fin m) (i : Fin (k+1)) :
    toRepeatedWord f b (Fin.castAdd b i) = (f i).castSucc := by simp [toRepeatedWord]

theorem toRepeatedWord_right {m b : ℕ} (f : Fin (k+1) → Fin m) (i : Fin b) :
    toRepeatedWord f b (Fin.natAdd (k+1) i) = Fin.last m := by simp [toRepeatedWord]

theorem toRepeatedWord_mono {m b : ℕ} {f : Fin (k+1) → Fin m} (hf : Monotone f) :
    Monotone (toRepeatedWord f b) := by
  intro i j
  refine Fin.addCases ?_ ?_ i <;> intro a
  · refine Fin.addCases ?_ ?_ j <;> intro c hc
    · rw [toRepeatedWord_left,toRepeatedWord_left]
      exact hf (show a≤c from hc)
    · rw [toRepeatedWord_right]
      exact Fin.le_last _
  · refine Fin.addCases ?_ ?_ j <;> intro c hc
    · have h : k+1+a.val ≤ c.val := hc
      have := c.isLt
      omega
    · rw [toRepeatedWord_right,toRepeatedWord_right]

/-- The repeated-alphabet slice is exactly the countable weak
boundary word in the shorter alphabet, with the suffix determined. -/
noncomputable def repeatedAlphabetSliceEquiv (W : Finset (Fin k)) (b m : ℕ) :
    RepeatedAlphabetSlice W b m ≃ WeakBoundaryWord W m where
  toFun f := ⟨fun i => ⟨(f.val (Fin.castAdd b i)).val,f.property.1 i⟩,
    (fun _ _ h => f.property.2.2.1 (show Fin.castAdd b _ ≤ Fin.castAdd b _ from h)),
    (fun i hi => f.property.2.2.2 i hi)⟩
  invFun f := ⟨toRepeatedWord f.val b,
    (fun i => by rw [toRepeatedWord_left]; exact (f.val i).isLt),
    toRepeatedWord_right f.val,toRepeatedWord_mono f.property.1,
    (fun i hi => by rw [toRepeatedWord_left,toRepeatedWord_left]; exact f.property.2 i hi)⟩
  left_inv f := by
    apply Subtype.ext
    funext i
    refine Fin.addCases ?_ ?_ i
    · intro a
      change toRepeatedWord (fun j => ⟨(f.val (Fin.castAdd b j)).val,f.property.1 j⟩)
        b (Fin.castAdd b a) = f.val (Fin.castAdd b a)
      rw [toRepeatedWord_left]
      exact Fin.ext rfl
    · intro a
      change toRepeatedWord (fun j => ⟨(f.val (Fin.castAdd b j)).val,f.property.1 j⟩)
        b (Fin.natAdd (k+1) a) = f.val (Fin.natAdd (k+1) a)
      rw [toRepeatedWord_right,f.property.2.1]
  right_inv f := by
    apply Subtype.ext
    funext i
    apply Fin.ext
    change (toRepeatedWord f.val b (Fin.castAdd b i)).val = (f.val i).val
    rw [toRepeatedWord_left]
    rfl

def repeatedLetterWeight (m : ℕ) (z : ℚ) (i : Fin (m+1)) : ℚ :=
  if i.val < m then z else 1

theorem repeatedAlphabetSlice_weight (W : Finset (Fin k)) (b m : ℕ) (z : ℚ)
    (f : RepeatedAlphabetSlice W b m) :
    wordWeight (repeatedLetterWeight m z) f.val = z^(k+1) := by
  unfold wordWeight
  rw [Fin.prod_univ_add]
  simp only [repeatedLetterWeight,f.property.1,ite_true,f.property.2.1,
    Fin.val_last,lt_irrefl,ite_false,Finset.prod_const,Fintype.card_fin,Finset.card_univ,one_pow,mul_one]

theorem repeatedAlphabetSlice_evaluation (W : Finset (Fin k)) (b m : ℕ) (z : ℚ) :
    (∑ f : RepeatedAlphabetSlice W b m,wordWeight (repeatedLetterWeight m z) f.val) =
      (shiftedBinomial (k+1) W.card).eval (m:ℚ) * z^(k+1) := by
  simp_rw [repeatedAlphabetSlice_weight W b m z]
  rw [Finset.sum_const,Finset.card_univ,nsmul_eq_mul,
    Fintype.card_congr (repeatedAlphabetSliceEquiv W b m),weakBoundaryWord_countingPolynomial]

/-- The analytic continuation at multiplicity (-1) yields the exact
signed prefix weight: only an entirely strict negative prefix survives. -/
theorem repeatedAlphabetSlice_at_neg_one (W : Finset (Fin k)) (z : ℚ) :
    (shiftedBinomial (k+1) W.card).eval (-1) * z^(k+1) =
      if W=∅ then (-z)^(k+1) else 0 := by
  have hw : W.card ≤ k+1 :=
    (Finset.card_le_univ W).trans (by simp)
  rw [shiftedBinomial_eval_neg_one _ _ hw]
  by_cases h : W=∅
  · simp only [h,Finset.card_empty,ite_true]
    rw [← mul_pow,neg_one_mul]
  · have hn : W.card≠0 := fun h0 => h (Finset.card_eq_zero.mp h0)
    simp [h,hn]

end NovelliThibon
