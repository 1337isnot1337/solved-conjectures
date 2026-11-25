module
public import Conjectures.NovelliThibonCutEvaluation

@[expose] public section
namespace NovelliThibon

open Classical Polynomial
variable {n : ℕ}

abbrev FullOrdinaryWord (D : Finset (Fin n)) (m : ℕ) :=
  {w : Fin (n+1) → Fin (m+1) // OrdinaryRepeatedWord D m w}

noncomputable instance (D : Finset (Fin n)) (m : ℕ) : Fintype (FullOrdinaryWord D m) := by
  classical
  exact Subtype.fintype _

def repeatedMarks {m : ℕ} (w : Fin (n+1) → Fin (m+1)) : Finset (Fin (n+1)) :=
  Finset.univ.filter fun i => (w i).val < m

theorem mem_repeatedMarks {m : ℕ} (w : Fin (n+1) → Fin (m+1)) (i : Fin (n+1)) :
    i∈repeatedMarks w ↔ (w i).val < m := by simp [repeatedMarks]

theorem repeatedMarks_initial {m : ℕ} (w : Fin (n+1) → Fin (m+1)) (hw : Monotone w) :
    repeatedMarks w = initialRanks (n+1) (repeatedMarks w).card := by
  apply eq_initialRanks_of_downclosed
  intro i j hij hj
  exact (mem_repeatedMarks w i).mpr
    (lt_of_le_of_lt (hw hij) ((mem_repeatedMarks w j).mp hj))

/-- Partition all the ordinary fundamental words by the length of
their repeated-letter prefix. This is a bijection, including both
empty blocks and empty alphabets. -/
noncomputable def ordinaryCutEquiv (D : Finset (Fin n)) (m : ℕ) :
    FullOrdinaryWord D m ≃ (Σ a : Fin (n+2),OrdinaryCutWord D m a.val) where
  toFun w :=
    ⟨⟨(repeatedMarks w.val).card,by
      have hh := Finset.card_le_univ (repeatedMarks w.val)
      rw [Fintype.card_fin] at hh
      exact Nat.lt_succ_of_le hh⟩,
      ⟨w.val,w.property,fun i => by
        change (w.val i).val < m ↔ i.val < (repeatedMarks w.val).card
        calc
          _ ↔ i ∈ repeatedMarks w.val := (mem_repeatedMarks w.val i).symm
          _ ↔ i ∈ initialRanks (n+1) (repeatedMarks w.val).card :=
            (congrArg (fun S : Finset (Fin (n+1)) => i ∈ S) (repeatedMarks_initial w.val w.property.1)).to_iff
          _ ↔ _ := mem_initialRanks i⟩⟩
  invFun w := ⟨w.2.val,w.2.property.1⟩
  left_inv _ := rfl
  right_inv w := by
    rcases w with ⟨a,w⟩
    have he : repeatedMarks w.val=initialRanks (n+1) a.val := by
      ext i
      rw [mem_repeatedMarks,mem_initialRanks]
      exact w.property.2 i
    have hcard : (repeatedMarks w.val).card = a.val := by rw [he,card_initialRanks (Nat.le_of_lt_succ a.isLt)]
    apply Sigma.ext (Fin.ext hcard)
    apply (Subtype.heq_iff_coe_eq (p:=fun f => OrdinaryRepeatedWord D m f ∧
      ∀ i : Fin (n+1), (f i).val < m ↔ i.val < (repeatedMarks w.val).card)
      (q:=fun f => OrdinaryRepeatedWord D m f ∧
        ∀ i : Fin (n+1), (f i).val < m ↔ i.val < a.val) (by intro f; rw [hcard])).mpr
    rfl

/-- The exact fundamental evaluation as a polynomial in the number of
copies of the letter of weight (z), followed by one weight-1 letter. -/
noncomputable def fundamentalRepeatedPolynomial (D : Finset (Fin n)) (z : ℚ) : ℚ[X] :=
  ∑ a : Fin (n+2),cutContribution D a.val z

theorem fundamentalRepeatedPolynomial_eval_nat (D : Finset (Fin n)) (z : ℚ) (m : ℕ) :
    (fundamentalRepeatedPolynomial D z).eval (m:ℚ) =
      fundamentalAt D (repeatedLetterWeight m z) := by
  unfold fundamentalRepeatedPolynomial fundamentalAt
  rw [eval_finsetSum]
  simp_rw [cutContribution_eval_nat D (Nat.le_of_lt_succ (Fin.isLt _)) m z]
  have hsub : (∑ w : Fin (n+1)→Fin (m+1) with
        Monotone w ∧ ∀ i∈D,w i.castSucc < w i.succ,wordWeight (repeatedLetterWeight m z) w) =
      ∑ w : FullOrdinaryWord D m, wordWeight (repeatedLetterWeight m z) w.val :=
    Finset.sum_subtype _ (fun w => by simp [OrdinaryRepeatedWord]) _
  rw [hsub]
  have h := Fintype.sum_equiv (ordinaryCutEquiv D m)
    (fun w => wordWeight (repeatedLetterWeight m z) w.val)
    (fun w => wordWeight (repeatedLetterWeight m z) w.2.val) (fun _ => rfl)
  rw [Fintype.sum_sigma] at h
  exact h.symm

/-- The genuine polynomial continuation of each fundamental function
at (m=-1) is the signed two-letter evaluation used in the hook proof. -/
theorem fundamentalRepeatedPolynomial_eval_neg_one (D : Finset (Fin n)) (z : ℚ) :
    (fundamentalRepeatedPolynomial D z).eval (-1) = signedFundamentalAt D z := by
  unfold fundamentalRepeatedPolynomial signedFundamentalAt
  rw [eval_finsetSum]
  simp_rw [cutContribution_eval_neg_one D (Nat.le_of_lt_succ (Fin.isLt _)) z]
  rw [← Finset.sum_filter]
  have hs :
      (∑ S : Finset (Fin (n+1)) with SignedAdmissible D S,(-z)^S.card) =
      ∑ S : {S : Finset (Fin (n+1)) // SignedAdmissible D S},(-z)^S.val.card :=
    Finset.sum_subtype _ (fun S => by simp) _
  have ha :
      (∑ a : Fin (n+2) with SignedCutAdmissible D a.val,(-z)^a.val) =
      ∑ a : {a : Fin (n+2) // SignedCutAdmissible D a.val},(-z)^a.val.val :=
    Finset.sum_subtype _ (fun a => by simp) _
  rw [hs,ha]
  exact (Fintype.sum_equiv (signedCutsEquiv D) _ _ (fun _ => rfl)).symm

end NovelliThibon
