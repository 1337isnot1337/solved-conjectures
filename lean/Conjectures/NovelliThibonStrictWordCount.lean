module
public import Conjectures.NovelliThibonWeakWordCount
public import Conjectures.NovelliThibonVirtualBinomial

@[expose] public section
namespace NovelliThibon

noncomputable instance (r m : ℕ) : Fintype (StrictAlphabetWord r m) := by
  classical
  exact Subtype.fintype _

noncomputable instance {k : ℕ} (W : Finset (Fin k)) (m : ℕ) :
    Fintype (WeakBoundaryWord W m) := by
  classical
  exact Subtype.fintype _

/-- A strictly increasing word is precisely the canonically ordered
version of an ordinary subset of letters. -/
noncomputable def strictWordEquivPowerset (r m : ℕ) :
    StrictAlphabetWord r m ≃ ↥((Finset.univ : Finset (Fin m)).powersetCard r) where
  toFun f := ⟨Finset.univ.image f.val,Finset.mem_powersetCard_univ.mpr (by
    rw [Finset.card_image_of_injective _ f.property.injective,Finset.card_univ,Fintype.card_fin])⟩
  invFun s := ⟨s.val.orderEmbOfFin (Finset.mem_powersetCard_univ.mp s.property),
    (s.val.orderEmbOfFin (Finset.mem_powersetCard_univ.mp s.property)).strictMono⟩
  left_inv f := by
    apply Subtype.ext
    apply StrictMono.eq_of_range_eq
    · exact (Finset.orderEmbOfFin _ _).strictMono
    · exact f.property
    · rw [Finset.range_orderEmbOfFin]
      ext x
      simp
  right_inv s := by
    apply Subtype.ext
    exact Finset.image_orderEmbOfFin_univ _ _

theorem strictWord_card (r m : ℕ) :
    Fintype.card (StrictAlphabetWord r m) = m.choose r := by
  rw [Fintype.card_congr (strictWordEquivPowerset r m),Fintype.card_coe,
    Finset.card_powersetCard,Finset.card_univ,Fintype.card_fin]

theorem weakBoundaryWord_card {k : ℕ} (W : Finset (Fin k)) (m : ℕ) :
    Fintype.card (WeakBoundaryWord W m) = (m+W.card).choose (k+1) := by
  rw [Fintype.card_congr (shiftWeakWord W m),strictWord_card]

theorem weakBoundaryWord_countingPolynomial {k : ℕ} (W : Finset (Fin k)) (m : ℕ) :
    (shiftedBinomial (k+1) W.card).eval (m:ℚ) = Fintype.card (WeakBoundaryWord W m) := by
  rw [shiftedBinomial_eval_nat,weakBoundaryWord_card]

end NovelliThibon
