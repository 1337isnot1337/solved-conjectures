module
public import Mathlib.Data.Fin.Tuple.Sort
public import Mathlib.Order.Fin.Basic

@[expose] public section
namespace NovelliThibon

variable {n : ℕ} {α : Type*} [LinearOrder α]

/-- Standardization labels each position by its order after stable
ascending sorting, so ties are labeled left to right. -/
def standardizeWord (w : Fin n → α) : Equiv.Perm (Fin n) := (Tuple.sort w).symm

theorem standardizeWord_lt_iff (w : Fin n → α) (i j : Fin n) :
    standardizeWord w i < standardizeWord w j ↔ w i < w j ∨ w i = w j ∧ i < j := by
  have h (x : Fin n) : Tuple.graphEquiv₂ w (standardizeWord w x) = Tuple.graphEquiv₁ w x := by
    rw [Tuple.graphEquiv₂_apply,standardizeWord,Equiv.apply_symm_apply]
  calc
    _ ↔ Tuple.graphEquiv₂ w (standardizeWord w i) <
        Tuple.graphEquiv₂ w (standardizeWord w j) :=
      ((Tuple.graphEquiv₂ w).lt_iff_lt).symm
    _ ↔ _ := by
      rw [h i,h j]
      exact Prod.Lex.toLex_lt_toLex

/-- For distinct positions in reading order, the original word has
a strict comparison exactly when its standardized word does. -/
theorem standardizeWord_inversion_iff (w : Fin n → α) {i j : Fin n} (h : i < j) :
    standardizeWord w j < standardizeWord w i ↔ w j < w i := by
  rw [standardizeWord_lt_iff]
  exact ⟨fun e => e.elim id (fun x => (h.asymm x.2).elim),Or.inl⟩

def FundamentalWord (σ : Equiv.Perm (Fin n)) (w : Fin n → α) : Prop :=
  Monotone (w ∘ σ.symm) ∧
    ∀ i j, i < j → σ.symm j < σ.symm i → w (σ.symm i) < w (σ.symm j)

theorem fundamentalWord_iff_standardize (σ : Equiv.Perm (Fin n)) (w : Fin n → α) :
    FundamentalWord σ w ↔ standardizeWord w = σ := by
  constructor
  · rintro ⟨hm,hs⟩
    have hσ : σ.symm = Tuple.sort w := Tuple.eq_sort_iff.mpr ⟨hm,fun i j hij he => by
      apply lt_of_le_of_ne
      · exact le_of_not_gt (fun hn => (hs i j hij hn).ne he)
      · exact fun heq => hij.ne (σ.symm.injective heq)⟩
    exact (congrArg Equiv.symm hσ).symm
  · intro hs
    have hh : σ.symm = Tuple.sort w := by rw [← hs,standardizeWord,Equiv.symm_symm]
    obtain ⟨hm,hstable⟩ := Tuple.eq_sort_iff.mp hh
    refine ⟨hm,fun i j hi hj => ?_⟩
    exact lt_of_le_of_ne (hm hi.le) (fun he => (hstable i j hi he).asymm hj)

end NovelliThibon
