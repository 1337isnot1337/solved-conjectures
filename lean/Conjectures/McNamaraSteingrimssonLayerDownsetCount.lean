module

public import Conjectures.McNamaraSteingrimssonFamilyCounts

@[expose] public section
namespace McNamaraSteingrimsson

open Polynomial

def layerWordsAt (v : List Bool) (r : ℕ) : Finset (List Bool) :=
  (layerWords v).filter fun u => layerWeight u=r

theorem layerWordsAt_mem {v u : List Bool} {r : ℕ} :
    u∈layerWordsAt v r ↔ LayerSubword u v ∧ layerWeight u=r := by
  rw [layerWordsAt,Finset.mem_filter,mem_layerWords]

noncomputable def layerDownsetMap (v : List Bool) (r : ℕ) :
    ↥(layerWordsAt v r) → PatternDownsetAt (layerPermutation v) r := fun u =>
  let hu := layerWordsAt_mem.mp u.property
  let e := (card_layerPosition u.val).trans hu.2
  ⟨castPermutation e (layerPermutation u.val),
    (classicalPattern_cast_left e _ _).mpr (layerPermutation_pattern_iff_subword.mpr hu.1)⟩

/-- Every literal layered subpattern is represented by exactly one
weighted generalized subword, not one choice of embedding. -/
noncomputable def literalLayerDownsetEquiv (v : List Bool) (r : ℕ) :
    ↥(layerWordsAt v r) ≃ PatternDownsetAt (layerPermutation v) r := by
  refine Equiv.ofBijective (layerDownsetMap v r) ⟨?_,?_⟩
  · intro u w he
    apply Subtype.ext
    have hu := layerWordsAt_mem.mp u.property
    have hw := layerWordsAt_mem.mp w.property
    let eu := (card_layerPosition u.val).trans hu.2
    let ew := (card_layerPosition w.val).trans hw.2
    have hf : castPermutation eu (layerPermutation u.val) =
        castPermutation ew (layerPermutation w.val) := congrArg Subtype.val he
    have hf₁ := (classicalPattern_same_size_iff_eq _ _).mpr hf
    have hf₂ := (classicalPattern_same_size_iff_eq _ _).mpr hf.symm
    apply layerPermutation_distinct_of_pattern_both
    · exact (classicalPattern_cast_right ew _ _).mp ((classicalPattern_cast_left eu _ _).mp hf₁)
    · exact (classicalPattern_cast_right eu _ _).mp ((classicalPattern_cast_left ew _ _).mp hf₂)
  · intro p
    obtain ⟨u,hu,h₁,h₂⟩ := subpattern_of_layered_is_layered p.property
    have he : Fintype.card (LayerPosition u)=r :=
      le_antisymm (classicalPattern_size_le h₂) (classicalPattern_size_le h₁)
    let x : ↥(layerWordsAt v r) := ⟨u,layerWordsAt_mem.mpr
      ⟨hu,(card_layerPosition u).symm.trans he⟩⟩
    refine ⟨x,Subtype.ext ?_⟩
    change castPermutation he (layerPermutation u)=p.val
    exact (classicalPattern_same_size_iff_eq _ _).mp ((classicalPattern_cast_left he _ _).mpr h₂)

theorem layerPolynomial_coeff_wordsAt (v : List Bool) (r : ℕ) :
    (layerPolynomial v).coeff r=(layerWordsAt v r).card := by
  rw [layerPolynomial,generatingPolynomial,finsetSum_coeff]
  simp only [coeff_X_pow,layerWordsAt,Finset.sum_boole]
  have h : ((layerWords v).filter fun u => r=layerWeight u)=
      (layerWords v).filter (fun u => layerWeight u=r) := by
    ext u
    simp [eq_comm]
  rw [h]

/-- The generating polynomial coefficient equals the actual cardinality
of distinct length-r permutation patterns of the layered permutation. -/
theorem literalLayerDownset_count (v : List Bool) (r : ℕ) :
    (Nat.card (PatternDownsetAt (layerPermutation v) r) : ℤ) =
      (layerPolynomial v).coeff r := by
  rw [← Nat.card_congr (literalLayerDownsetEquiv v r),Nat.card_eq_fintype_card,Fintype.card_coe,
    layerPolynomial_coeff_wordsAt]

end McNamaraSteingrimsson
