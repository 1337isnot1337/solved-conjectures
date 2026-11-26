module
public import Mathlib.Data.Finsupp.Multiset
public import Mathlib.Data.Sym.NatCard
public import Mathlib.Data.Sym.Card
public import Mathlib.Algebra.BigOperators.Finsupp.Basic
public import Mathlib.Data.Fintype.BigOperators

@[expose] public section
namespace CyrusianKaplan

open scoped BigOperators

def weakRayCompositions (d n : ℕ) :=
  {q : Fin d → ℕ // (∑ i,q i)=n}

/-- Exact stars-and-bars equivalence for the unrestricted common
period quotients, preserving the entire height sum. -/
noncomputable def weakRayCompositionsEquiv (d n : ℕ) :
    weakRayCompositions d n ≃ Sym (Fin d) n := by
  classical
  let E : (Fin d → ℕ) ≃ Multiset (Fin d) :=
    Finsupp.equivFunOnFinite.symm.trans (Multiset.toFinsupp.symm.toEquiv)
  apply E.subtypeEquiv
  intro q
  have h : (E q).card = ∑ i,q i := by
    change (Finsupp.toMultiset (Finsupp.equivFunOnFinite.symm q)).card = _
    rw [Finsupp.card_toMultiset,Finsupp.sum_fintype]
    · rfl
    · intro i
      rfl
  rw [h]

theorem weakRayCompositions_card (k n : ℕ) :
    Nat.card (weakRayCompositions (k+1) n)=(n+k).choose k := by
  rw [Nat.card_congr (weakRayCompositionsEquiv (k+1) n),Sym.natCard_sym_eq_choose,Nat.card_fin,
    show k+1+n-1=n+k by omega]
  exact Nat.choose_symm_add

theorem weakRayCompositions_finite (d n : ℕ) : Finite (weakRayCompositions d n) :=
  Finite.of_equiv (Sym (Fin d) n) (weakRayCompositionsEquiv d n).symm

end CyrusianKaplan
