module
public import Conjectures.WachsCompleteGraphStrictRank
public import Mathlib.Data.Finsupp.Multiset

@[expose] public section
namespace WachsCompleteGraph

abbrev WeightCompositions (r m : ℕ) := {v : Fin r → ℕ // (∑ i,v i)=m}

abbrev WeightCompletions {r : ℕ} (v : Fin r→ℕ) (m : ℕ) :=
  {w : Fin r→ℕ // (∀ i,v i≤w i) ∧ (∑ i,w i)=m}

/-- Subtracting the prescribed lower vector identifies extensions with
all weak compositions of the remaining total. -/
def weightCompletions_equiv {r : ℕ} (v : Fin r→ℕ) (m : ℕ)
    (hm : (∑ i,v i)≤m) : WeightCompletions v m ≃ WeightCompositions r (m-(∑ i,v i)) where
  toFun w := ⟨fun i => w.val i-v i, by
    have he : (∑ i,(w.val i-v i))+(∑ i,v i)=m := calc
      _ = ∑ i, (w.val i-v i + v i) := (Finset.sum_add_distrib).symm
      _ = ∑ i, w.val i := Finset.sum_congr rfl (fun i _ => Nat.sub_add_cancel (w.property.1 i))
      _ = m := w.property.2
    change (∑ i,(w.val i-v i))=m-(∑ i,v i)
    omega⟩
  invFun b := ⟨fun i => b.val i+v i, fun i => Nat.le_add_left .., by
    rw [Finset.sum_add_distrib,b.property,Nat.sub_add_cancel hm]⟩
  left_inv w := by
    apply Subtype.ext
    funext i
    exact Nat.sub_add_cancel (w.property.1 i)
  right_inv b := by
    apply Subtype.ext
    funext i
    exact Nat.add_sub_cancel _ _

theorem weight_compositions_card (r m : ℕ) :
    Nat.card (WeightCompositions r m)=(r+m-1).choose m := by
  let e : Sym (Fin r) m ≃ WeightCompositions r m := Sym.equivNatSumOfFintype (Fin r) m
  rw [←Nat.card_congr e,Nat.card_eq_fintype_card,Sym.card_sym_eq_choose,Fintype.card_fin]

theorem weight_completions_card {r : ℕ} (v : Fin r→ℕ) (m : ℕ)
    (hm : (∑ i,v i)≤m) :
    Nat.card (WeightCompletions v m)=(r+(m-(∑ i,v i))-1).choose (m-(∑ i,v i)) := by
  rw [Nat.card_congr (weightCompletions_equiv v m hm),weight_compositions_card]

end WachsCompleteGraph
