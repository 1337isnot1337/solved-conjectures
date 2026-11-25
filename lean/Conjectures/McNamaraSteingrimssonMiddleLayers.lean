module

public import Conjectures.McNamaraSteingrimssonContainment

@[expose] public section
namespace McNamaraSteingrimsson

open Polynomial BigOperators

/-- Every layer is retained; precisely the size-one layers may grow. -/
def layerChoices : List Bool → Finset (List Bool)
  | [] => {[]}
  | true::a => (layerChoices a).map (prefixEmbed true)
  | false::a => (layerChoices a).map (prefixEmbed false) ∪ (layerChoices a).map (prefixEmbed true)

@[simp] private theorem prefixEmbed_apply (b : Bool) (w : List Bool) : prefixEmbed b w=b::w := rfl

theorem mem_layerChoices {a w : List Bool} :
    w∈layerChoices a ↔ List.Forall₂ (fun x y => layerSize x≤layerSize y) a w := by
  induction a generalizing w with
  | nil =>
    cases w with
    | nil => exact iff_of_true (by simp [layerChoices]) .nil
    | cons i w =>
      simp only [layerChoices,Finset.mem_singleton,List.cons_ne_nil,false_iff]
      intro h
      cases h
  | cons b a ih =>
    cases b <;> cases w with
    | nil =>
      simp [layerChoices]
    | cons c w =>
      cases c <;> simp [layerChoices,ih,layerSize, List.forall₂_cons]

theorem forall₂_layerWeight {a w : List Bool}
    (h : List.Forall₂ (fun x y => layerSize x≤layerSize y) a w) :
    layerWeight a≤layerWeight w := by
  induction h with
  | nil => exact le_rfl
  | cons h _ ih => exact Nat.add_le_add h ih

theorem layerChoices_length {a w : List Bool} (hw : w∈layerChoices a) :
    w.length=a.length :=
  (List.Forall₂.length_eq (mem_layerChoices.mp hw)).symm

theorem forall₂_subword {a w : List Bool}
    (h : List.Forall₂ (fun x y => layerSize x≤layerSize y) a w) : LayerSubword a w := by
  induction h with
  | nil => exact .nil
  | cons h _ ih => exact .cons h ih

theorem subword_all_twos (w : List Bool) : LayerSubword w (List.replicate w.length true) := by
  induction w with
  | nil => exact .nil
  | cons a w ih =>
    change LayerSubword (a::w) (true::List.replicate w.length true)
    apply List.SublistForall₂.cons _ ih
    cases a <;> decide

theorem layerChoices_iff_layered_interval {a w : List Bool} :
    w∈layerChoices a ↔
      ClassicalPattern (layerPermutation a) (layerPermutation w) ∧
        ClassicalPattern (layerPermutation w) (layerPermutation (List.replicate a.length true)) := by
  simp only [layerPermutation_pattern_iff_subword]
  constructor
  · intro hw
    have hlen := layerChoices_length hw
    exact ⟨forall₂_subword (mem_layerChoices.mp hw), hlen ▸ subword_all_twos w⟩
  · rintro ⟨h₁,h₂⟩
    have hc := layerSubword_length_le h₂
    rw [List.length_replicate] at hc
    exact mem_layerChoices.mpr (layerSubword_same_length h₁ (le_antisymm (layerSubword_length_le h₁) hc))

noncomputable def layerChoicePolynomial (a : List Bool) : ℤ[X] :=
  ∑ w∈layerChoices a, X^(layerWeight w-layerWeight a)

theorem layerChoicePolynomial_cons_true (a : List Bool) :
    layerChoicePolynomial (true::a)=layerChoicePolynomial a := by
  simp only [layerChoicePolynomial,layerChoices,Finset.sum_map]
  apply Finset.sum_congr rfl
  intro w _
  change X^(2+layerWeight w-(2+layerWeight a))=_
  rw [Nat.add_sub_add_left]

theorem layerChoicePolynomial_cons_false (a : List Bool) :
    layerChoicePolynomial (false::a)=(1+X)*layerChoicePolynomial a := by
  have hdis : Disjoint ((layerChoices a).map (prefixEmbed false)) ((layerChoices a).map (prefixEmbed true)) := by
    apply Finset.disjoint_left.mpr
    intro w h₁ h₂
    obtain ⟨p,_,hp⟩ := Finset.mem_map.mp h₁
    obtain ⟨q,_,hq⟩ := Finset.mem_map.mp h₂
    have he : false::p=true::q := hp.trans hq.symm
    cases he
  simp only [layerChoicePolynomial,layerChoices,Finset.sum_union hdis,Finset.sum_map,add_mul,
    one_mul,Finset.mul_sum]
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro w hw
  have hle := forall₂_layerWeight (mem_layerChoices.mp hw)
  change X^(1+layerWeight w-(1+layerWeight a)) +
      X^(2+layerWeight w-(1+layerWeight a)) =
    X^(layerWeight w-layerWeight a)+X*X^(layerWeight w-layerWeight a)
  rw [Nat.add_sub_add_left,
    show 2+layerWeight w-(1+layerWeight a)=1+(layerWeight w-layerWeight a) by omega,
    pow_add,pow_one]

theorem layerChoicePolynomial_is_binomial (a : List Bool) :
    layerChoicePolynomial a=(1+X)^(a.count false) := by
  induction a with
  | nil => simp [layerChoicePolynomial,layerChoices,layerWeight]
  | cons b a ih =>
    cases b
    · rw [layerChoicePolynomial_cons_false,ih]
      simp [pow_succ']
    · rw [layerChoicePolynomial_cons_true,ih]
      simp

end McNamaraSteingrimsson
