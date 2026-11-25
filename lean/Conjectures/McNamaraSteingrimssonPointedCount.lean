module

public import Conjectures.McNamaraSteingrimssonPointedInterval
public import Conjectures.McNamaraSteingrimssonPatternSize

@[expose] public section
namespace McNamaraSteingrimsson

def castPermutation {m n : ℕ} (h : m=n) (p : Equiv.Perm (Fin m)) : Equiv.Perm (Fin n) :=
  h ▸ p

theorem classicalPattern_cast_left {m m' n : ℕ} (h : m=m') (p : Equiv.Perm (Fin m))
    (q : Equiv.Perm (Fin n)) : ClassicalPattern (castPermutation h p) q ↔ ClassicalPattern p q := by
  subst m'
  rfl

theorem classicalPattern_cast_right {m n n' : ℕ} (h : n=n') (p : Equiv.Perm (Fin m))
    (q : Equiv.Perm (Fin n)) : ClassicalPattern p (castPermutation h q) ↔ ClassicalPattern p q := by
  subst n'
  rfl

theorem classicalPattern_refl {m : ℕ} (p : Equiv.Perm (Fin m)) : ClassicalPattern p p :=
  ⟨id,strictMono_id,fun _ _ => Iff.rfl⟩

abbrev ChosenLayerWord (a : List Bool) (n : ℕ) :=
  {w : List Bool // w∈layerChoices a ∧ layerWeight w=n}

abbrev PointedLayerInterval (a : List Bool) (n : ℕ) :=
  {p : Equiv.Perm (Fin (n+1)) //
    ClassicalPattern (pointedPermutation (layerPermutation a)) p ∧
    ClassicalPattern p (pointedPermutation (layerPermutation (List.replicate a.length true)))}

theorem layerWord_size_certificate {a : List Bool} {n : ℕ} (w : ChosenLayerWord a n) :
    Fintype.card (LayerPosition w.val)+1=n+1 := by
  rw [card_layerPosition,w.property.2]

noncomputable def chosenWordToPattern {a : List Bool} {n : ℕ} (w : ChosenLayerWord a n) :
    PointedLayerInterval a n := by
  let h := layerWord_size_certificate w
  let p := pointedPermutation (layerPermutation w.val)
  obtain ⟨hl,hr⟩ := layerChoices_iff_layered_interval.mp w.property.1
  exact ⟨castPermutation h p,
    (classicalPattern_cast_right h _ p).mpr (pointedPattern_lift hl),
    (classicalPattern_cast_left h p _).mpr (pointedPattern_lift hr)⟩

theorem chosenWordToPattern_injective {a : List Bool} (ha : 2≤a.length) (n : ℕ) :
    Function.Injective (@chosenWordToPattern a n) := by
  intro p q h
  have he := congrArg (fun x : PointedLayerInterval a n => x.val) h
  have gh : ClassicalPattern (chosenWordToPattern p).val (chosenWordToPattern q).val :=
    he ▸ classicalPattern_refl (chosenWordToPattern p).val
  have gh' : ClassicalPattern (chosenWordToPattern q).val (chosenWordToPattern p).val :=
    he.symm ▸ classicalPattern_refl (chosenWordToPattern q).val
  simp only [chosenWordToPattern,classicalPattern_cast_left,classicalPattern_cast_right] at gh gh'
  have hp : 2≤p.val.length := (layerChoices_length p.property.1).symm ▸ ha
  have hq : 2≤q.val.length := (layerChoices_length q.property.1).symm ▸ ha
  exact Subtype.ext (layerSubword_antisymm ((pointedLayer_pattern_iff_subword hp).mp gh)
    ((pointedLayer_pattern_iff_subword hq).mp gh'))

theorem chosenWordToPattern_surjective {a : List Bool} (ha : 2≤a.length) (n : ℕ) :
    Function.Surjective (@chosenWordToPattern a n) := by
  rintro ⟨p,hp,hq⟩
  obtain ⟨w,hw,hl,hr⟩ := pointedInterval_all_twos_classifies ha hp hq
  have hsize := le_antisymm (classicalPattern_size_le hr) (classicalPattern_size_le hl)
  rw [card_layerPosition] at hsize
  have hn : layerWeight w=n := by omega
  let x : ChosenLayerWord a n := ⟨w,hw,hn⟩
  refine ⟨x,Subtype.ext ?_⟩
  apply (classicalPattern_same_size_iff_eq _ _).mp
  let h := layerWord_size_certificate x
  change ClassicalPattern (castPermutation h (pointedPermutation (layerPermutation w))) p
  exact (classicalPattern_cast_left _ _ _).mpr hr

/-- The exact incidence correspondence for the pointed interval, with each
size class counted once as literal permutations of a finite chain. -/
noncomputable def pointedInterval_word_equiv {a : List Bool} (ha : 2≤a.length) (n : ℕ) :
    ChosenLayerWord a n ≃ PointedLayerInterval a n :=
  Equiv.ofBijective chosenWordToPattern
    ⟨chosenWordToPattern_injective ha n,chosenWordToPattern_surjective ha n⟩

theorem pointedInterval_count_eq_words {a : List Bool} (ha : 2≤a.length) (n : ℕ) :
    Nat.card (PointedLayerInterval a n)=Nat.card (ChosenLayerWord a n) :=
  Nat.card_congr (pointedInterval_word_equiv ha n).symm

open Polynomial BigOperators

noncomputable def relativeLayerWords (a : List Bool) (r : ℕ) : Finset (List Bool) :=
  (layerChoices a).filter (fun w => layerWeight w-layerWeight a=r)

noncomputable def chosenLayerWord_relative_equiv (a : List Bool) (r : ℕ) :
    ChosenLayerWord a (layerWeight a+r) ≃ ↥(relativeLayerWords a r) where
  toFun p := ⟨p.val,Finset.mem_filter.mpr ⟨p.property.1,
    by have h := p.property.2; omega⟩⟩
  invFun p := ⟨p.val,(Finset.mem_filter.mp p.property).1,by
    have h := (Finset.mem_filter.mp p.property).2
    have hle := forall₂_layerWeight (mem_layerChoices.mp (Finset.mem_filter.mp p.property).1)
    omega⟩
  left_inv _ := rfl
  right_inv _ := rfl

theorem layerChoicePolynomial_coeff (a : List Bool) (r : ℕ) :
    (layerChoicePolynomial a).coeff r=(relativeLayerWords a r).card := by
  unfold layerChoicePolynomial relativeLayerWords
  simp only [finsetSum_coeff,Polynomial.coeff_X_pow]
  rw [← Finset.sum_filter]
  simp [eq_comm]

/-- Every rank in the literal pointed pattern interval is binomial. -/
theorem pointedInterval_rank_binomial {a : List Bool} (ha : 2≤a.length) (r : ℕ) :
    Nat.card (PointedLayerInterval a (layerWeight a+r))=(a.count false).choose r := by
  rw [pointedInterval_count_eq_words ha]
  rw [Nat.card_congr (chosenLayerWord_relative_equiv a r),Nat.card_eq_fintype_card,Fintype.card_coe]
  have h := layerChoicePolynomial_coeff a r
  rw [layerChoicePolynomial_is_binomial,coeff_one_add_X_pow] at h
  exact_mod_cast h.symm

/-- The small endpoint's exact tail word from the written counterexample. -/
def alphaCaseWord : List Bool := (List.replicate 8 [false,false,false,true]).flatten++[false]

theorem alpha_weight : layerWeight alphaCaseWord=41 := by decide

theorem pointedWrittenEndpoints_rankCount (r : ℕ) :
    Nat.card (PointedLayerInterval alphaCaseWord (41+r))=(25 : ℕ).choose r := by
  have hh := pointedInterval_rank_binomial (a := alphaCaseWord) (by decide) r
  rw [alpha_weight] at hh
  change Nat.card (PointedLayerInterval alphaCaseWord (41+r))=(25 : ℕ).choose r at hh
  exact hh

end McNamaraSteingrimsson
