import Conjectures.LonelinessModularWitness
import Mathlib.Data.Fintype.Prod
import Mathlib.Data.Fintype.Pi
import Mathlib.Data.Finset.Card

/-! The exact eighty signed triple factors in the six-speed finite-field
argument. The point checker accepts an actual threshold-six modular witness
or two distinct divisible factors. Complete prime coverage is a separate,
explicit finite proposition. -/

namespace Loneliness.SixSpectrumFields

open scoped BigOperators

abbrev Triple := {t : Fin 6 × Fin 6 × Fin 6 // t.1 < t.2.1 ∧ t.2.1 < t.2.2}

abbrev Form := Triple × Bool × Bool

def sign (b : Bool) : ℤ := if b then 1 else -1

def eval (f : Form) (v : Fin 6 → ℤ) : ℤ :=
  v f.1.val.1 + sign f.2.1 * v f.1.val.2.1 + sign f.2.2 * v f.1.val.2.2

theorem triple_card : Fintype.card Triple = 20 := by decide +kernel

theorem form_card : Fintype.card Form = 80 := by
  simp only [Form, Fintype.card_prod, triple_card, Fintype.card_bool]

def TwoRelations (p : ℕ) (v : Fin 6 → ℤ) : Prop :=
  ∃ a b : Form, a ≠ b ∧ (p : ℤ) ∣ eval a v ∧ (p : ℤ) ∣ eval b v

def twoRelationsCheck (p : ℕ) (v : Fin 6 → ℤ) : Bool :=
  decide (2 ≤ ((Finset.univ : Finset Form).filter (fun f => (p : ℤ) ∣ eval f v)).card)

def pointCheck (p : ℕ) (v : Fin 6 → ℕ) : Bool :=
  ((List.range p).any (fun t => decide (Modular.Witness 6 p t (List.ofFn v)))) ||
    twoRelationsCheck p (fun i => (v i : ℤ))

def PrimeTriangleCover (p : ℕ) : Prop :=
  ∀ r : Fin 6 → Fin p, (∀ i, 0 < (r i).val) →
    pointCheck p (fun i => (r i).val) = true

instance (p : ℕ) : Decidable (PrimeTriangleCover p) :=
  inferInstanceAs (Decidable (∀ r : Fin 6 → Fin p,
    (∀ i, 0 < (r i).val) → pointCheck p (fun i => (r i).val) = true))

def primeCheck (p : ℕ) : Bool := decide (PrimeTriangleCover p)

theorem twoRelationsCheck_sound (p : ℕ) (v : Fin 6 → ℤ)
    (hcheck : twoRelationsCheck p v = true) : TwoRelations p v := by
  have hcard : 2 ≤ ((Finset.univ : Finset Form).filter
      (fun f => (p : ℤ) ∣ eval f v)).card := of_decide_eq_true hcheck
  obtain ⟨a, ha, b, hb, hab⟩ := Finset.one_lt_card.mp hcard
  exact ⟨a, b, hab, (Finset.mem_filter.mp ha).2, (Finset.mem_filter.mp hb).2⟩

theorem pointCheck_sound (p : ℕ) (v : Fin 6 → ℕ)
    (hcheck : pointCheck p v = true) :
    (∃ t < p, Modular.Witness 6 p t (List.ofFn v)) ∨
      TwoRelations p (fun i => (v i : ℤ)) := by
  rw [pointCheck, Bool.or_eq_true_eq_eq_true_or_eq_true] at hcheck
  rcases hcheck with hwitness | hrelations
  · obtain ⟨t, ht, hcheck⟩ := List.any_eq_true.mp hwitness
    exact Or.inl ⟨t, List.mem_range.mp ht, of_decide_eq_true hcheck⟩
  · exact Or.inr (twoRelationsCheck_sound p _ hrelations)

theorem primeCheck_sound (p : ℕ) (hcheck : primeCheck p = true) :
    PrimeTriangleCover p := of_decide_eq_true hcheck

theorem eval_mod_decomposition (p : ℕ) (f : Form) (v : Fin 6 → ℕ) :
    eval f (fun i => (v i : ℤ)) =
      eval f (fun i => ((v i % p : ℕ) : ℤ)) +
        (p : ℤ) * eval f (fun i => ((v i / p : ℕ) : ℤ)) := by
  have h (i : Fin 6) : (v i : ℤ) =
      ((v i % p : ℕ) : ℤ) + (p : ℤ) * ((v i / p : ℕ) : ℤ) := by
    exact_mod_cast (Nat.mod_add_div (v i) p).symm
  simp only [eval, h]
  ring

theorem relations_of_mod (p : ℕ) (v : Fin 6 → ℕ)
    (hrelations : TwoRelations p (fun i => ((v i % p : ℕ) : ℤ))) :
    TwoRelations p (fun i => (v i : ℤ)) := by
  obtain ⟨a, b, hab, ha, hb⟩ := hrelations
  refine ⟨a, b, hab, ?_, ?_⟩
  · rw [eval_mod_decomposition]
    exact dvd_add ha (dvd_mul_right _ _)
  · rw [eval_mod_decomposition]
    exact dvd_add hb (dvd_mul_right _ _)

theorem relations_of_cover (p : ℕ) (hp : 0 < p) (hcover : PrimeTriangleCover p)
    (v : Fin 6 → ℕ) (havoid : ∀ i, ¬ p ∣ v i)
    (hvalue : value (List.ofFn v) < (1 / 6 : ℝ)) :
    TwoRelations p (fun i => (v i : ℤ)) := by
  let r : Fin 6 → Fin p := fun i => ⟨v i % p, Nat.mod_lt _ hp⟩
  have hpositive : ∀ i, 0 < (r i).val := by
    intro i
    have hne : v i % p ≠ 0 := fun hzero => havoid i (Nat.dvd_of_mod_eq_zero hzero)
    exact Nat.pos_of_ne_zero hne
  rcases pointCheck_sound p (fun i => (r i).val) (hcover r hpositive) with
    ⟨t, _ht, hw⟩ | hrelations
  · have hw' : Modular.Witness 6 p t (List.ofFn v) := by
      apply (Modular.witness_mod_speeds 6 p t (List.ofFn v)).mp
      simpa only [List.map_ofFn, Function.comp_def] using hw
    exact ((not_le_of_gt hvalue) (Modular.witness_value_lower (by decide) hp hw')).elim
  · exact relations_of_mod p v hrelations

end Loneliness.SixSpectrumFields
