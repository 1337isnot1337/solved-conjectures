import Mathlib.Data.Finsupp.Multiset
import Mathlib.Data.Sym.Card
import Mathlib.Data.Fintype.Powerset
import Mathlib.Data.Fintype.BigOperators
import Mathlib.Tactic.NormNum

/-! Stars-and-bars counts needed for the north-run block enumeration. -/
namespace FussCounting
open scoped BigOperators

noncomputable def weakCompositions (i q : ℕ) := {f : Fin i → ℕ // ∑ x, f x = q}

noncomputable instance (i q : ℕ) : Fintype (weakCompositions i q) :=
  Fintype.ofEquiv (Sym (Fin i) q) (Sym.equivNatSumOfFintype (Fin i) q)

theorem weakCompositions_card (i q : ℕ) :
    Fintype.card (weakCompositions i q) = (i+q-1).choose q := by
  let e : Sym (Fin i) q ≃ weakCompositions i q := Sym.equivNatSumOfFintype (Fin i) q
  rw [← Fintype.card_congr e]
  simpa using (Sym.card_sym_eq_choose (α := Fin i) q)

noncomputable def positiveCompositions (i q : ℕ) :=
  {f : Fin i → ℕ // (∀ x, 0 < f x) ∧ ∑ x, f x = q+i}

noncomputable def positiveEquivWeak (i q : ℕ) : positiveCompositions i q ≃ weakCompositions i q where
  toFun f := ⟨fun x => f.val x - 1, by
    have hsum : ∑ x : Fin i, ((f.val x - 1) + 1) = q+i := by
      calc
        _ = ∑ x : Fin i, f.val x := by
          apply Finset.sum_congr rfl
          intro x hx
          exact Nat.sub_add_cancel (f.property.1 x)
        _ = q+i := f.property.2
    simp only [Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ,
      Fintype.card_fin, nsmul_eq_mul, mul_one, Nat.cast_id] at hsum
    exact Nat.add_right_cancel hsum⟩
  invFun f := ⟨fun x => f.val x + 1, by
    constructor
    · intro x; exact Nat.zero_lt_succ _
    · simp only [Finset.sum_add_distrib, Finset.sum_const, Finset.card_univ,
        Fintype.card_fin, nsmul_eq_mul, mul_one, f.property, Nat.cast_id]⟩
  left_inv f := by
    apply Subtype.ext
    funext x
    exact Nat.sub_add_cancel (f.property.1 x)
  right_inv f := by
    apply Subtype.ext
    funext x
    simp

noncomputable instance (i q : ℕ) : Fintype (positiveCompositions i q) :=
  Fintype.ofEquiv (weakCompositions i q) (positiveEquivWeak i q).symm

theorem positiveCompositions_card (i q : ℕ) :
    Fintype.card (positiveCompositions i q) = (i+q-1).choose q := by
  rw [Fintype.card_congr (positiveEquivWeak i q), weakCompositions_card]

/-- Choose the positive slots, then choose the slots with additional mass. -/
def blockShapes (L k i : ℕ) :=
  Σ A : {s : Finset (Fin L) // s.card = k}, {B : Finset A.val // B.card = i}

noncomputable instance (L k i : ℕ) : Fintype (blockShapes L k i) := by
  classical
  unfold blockShapes
  infer_instance

theorem blockShapes_card (L k i : ℕ) :
    Fintype.card (blockShapes L k i) = L.choose k * k.choose i := by
  classical
  unfold blockShapes
  rw [Fintype.card_sigma]
  simp only [Fintype.card_finset_len, Fintype.card_coe]
  simp_rw [show ∀ x : {s : Finset (Fin L) // s.card = k}, x.val.card = k from fun x => x.property]
  simp

/-- Choice of slots and positive allocations of the excess. -/
def blockData (L k i q : ℕ) := blockShapes L k i × positiveCompositions i q

noncomputable instance (L k i q : ℕ) : Fintype (blockData L k i q) := by
  unfold blockData
  infer_instance

theorem blockData_card (L k i q : ℕ) :
    Fintype.card (blockData L k i q) = L.choose k * k.choose i * (i+q-1).choose q := by
  unfold blockData
  rw [Fintype.card_prod, blockShapes_card, positiveCompositions_card]

theorem blockData_card_for_excess (L k i n : ℕ) (hi : 0 < i) (hbound : i ≤ n-k) :
    Fintype.card (blockData L k i (n-k-i)) =
      L.choose k * k.choose i * (n-k-1).choose (i-1) := by
  rw [blockData_card]
  have htotal : i+(n-k-i)-1 = n-k-1 := by omega
  rw [htotal]
  have hsym : (n-k-1).choose (n-k-i) = (n-k-1).choose (i-1) := by
    rw [← Nat.choose_symm (by omega : n-k-i ≤ n-k-1)]
    congr 1
    omega
  rw [hsym]

end FussCounting
