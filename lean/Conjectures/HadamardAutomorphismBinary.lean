import Mathlib.Data.ZMod.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Data.Nat.ModEq

/-! A nonconstant binary cyclic block has unequal autocorrelation coefficients.
This is the integral coefficient step in the nonvanishing argument modulo 599.
-/

open scoped BigOperators

namespace HadamardAutomorphism

variable {q : ℕ} [NeZero q]

/-- The actual number of simultaneous support positions at a given shift. -/
def binaryAutocorrelation (D : Finset (ZMod q)) (g : ZMod q) : ℕ :=
  (D.filter fun x => x + g ∈ D).card

omit [NeZero q] in
@[simp] theorem binaryAutocorrelation_zero (D : Finset (ZMod q)) :
    binaryAutocorrelation D 0 = D.card := by
  simp [binaryAutocorrelation]

omit [NeZero q] in
theorem binaryAutocorrelation_le_card (D : Finset (ZMod q)) (g : ZMod q) :
    binaryAutocorrelation D g ≤ D.card := Finset.card_filter_le _ _

theorem binaryAutocorrelation_le_modulus (D : Finset (ZMod q)) (g : ZMod q) :
    binaryAutocorrelation D g ≤ q := by
  have h : D.card ≤ Fintype.card (ZMod q) := Finset.card_le_univ _
  simpa using (binaryAutocorrelation_le_card D g).trans h

theorem add_one_closed_support (D : Finset (ZMod q))
    (hne : D.Nonempty) (hstep : ∀ x ∈ D, x + 1 ∈ D) :
    D = Finset.univ := by
  obtain ⟨x, hx⟩ := hne
  have hall : ∀ n : ℕ, x + (n : ZMod q) ∈ D := by
    intro n
    induction n with
    | zero => simpa using hx
    | succ n ih => simpa [Nat.cast_add, add_assoc] using hstep _ ih
  apply Finset.eq_univ_of_forall
  intro y
  have hy := hall (y - x).val
  simpa using hy

theorem binaryAutocorrelation_one_lt (D : Finset (ZMod q))
    (hne : D.Nonempty) (hproper : D ≠ Finset.univ) :
    binaryAutocorrelation D 1 < binaryAutocorrelation D 0 := by
  rw [binaryAutocorrelation_zero]
  have hle := binaryAutocorrelation_le_card D 1
  apply lt_of_le_of_ne hle
  intro heq
  have hall : ∀ x ∈ D, x + (1 : ZMod q) ∈ D :=
    (Finset.card_filter_eq_iff (p := fun x => x + (1 : ZMod q) ∈ D)).mp heq
  exact hproper (add_one_closed_support D hne hall)

/-- If the coefficients are all congruent modulo a prime larger than the
cyclic group, the support is empty or full. Primality is not needed for this
coefficient argument. -/
theorem binaryAutocorrelation_modEq_forces_constant (D : Finset (ZMod q))
    (p : ℕ) (hp : q < p)
    (hcoeff : ∀ g, Nat.ModEq p (binaryAutocorrelation D g)
      (binaryAutocorrelation D 0)) :
    D = ∅ ∨ D = Finset.univ := by
  by_cases hne : D.Nonempty
  · right
    by_contra hproper
    have heq : binaryAutocorrelation D 1 = binaryAutocorrelation D 0 :=
      (hcoeff 1).eq_of_lt_of_lt
        ((binaryAutocorrelation_le_modulus D 1).trans_lt hp)
        ((binaryAutocorrelation_le_modulus D 0).trans_lt hp)
    exact (ne_of_lt (binaryAutocorrelation_one_lt D hne hproper)) heq
  · exact Or.inl (Finset.not_nonempty_iff_eq_empty.mp hne)

end HadamardAutomorphism
