module

public import Mathlib.Combinatorics.SetFamily.HarrisKleitman
public import Mathlib.Algebra.BigOperators.Group.Finset.Sigma
public import Mathlib.Data.Finset.Prod

/-! Opposite-monotonicity on finite coordinate slices. The first coordinate
records arbitrary fixed exterior bits, the Boolean coordinate is the omitted
generator, and the finset coordinate records its neighboring generators. -/

public section

namespace Frankl.Lopsided

open Finset

private theorem nat_mul_sum {τ : Type*} (c : ℕ) (s : Finset τ) (f : τ → ℕ) :
    c * ∑ i ∈ s, f i = ∑ i ∈ s, c * f i := by
  classical
  induction s using Finset.induction_on with
  | empty => simp
  | @insert i s hi ih => simp [hi, Nat.mul_add, ih]

private theorem nat_sum_le_sum {τ : Type*} (s : Finset τ) (f g : τ → ℕ)
    (h : ∀ i ∈ s, f i ≤ g i) : (∑ i ∈ s, f i) ≤ ∑ i ∈ s, g i := by
  classical
  revert h
  induction s using Finset.induction_on with
  | empty => simp
  | @insert i s hi ih =>
    intro h
    simp only [sum_insert hi]
    exact Nat.add_le_add (h i (mem_insert_self i s))
      (ih (fun j hj => h j (mem_insert_of_mem hj)))

variable {α β : Type*} [Fintype β]

abbrev SlicedConfiguration (α β : Type*) := Σ _ : β, Bool × Finset α

/-- A family independent of the distinguished Boolean bit. -/
def sliceAvoid (lower : β → Finset (Finset α)) : Finset (SlicedConfiguration α β) :=
  univ.sigma fun b => univ.product (lower b)

/-- The distinguished generator is omitted, while the neighboring bits
satisfy the upward-closed covering event. -/
def sliceBad (upper : Finset (Finset α)) : Finset (SlicedConfiguration α β) :=
  univ.sigma fun _ => ({false} : Finset Bool).product upper

theorem card_sliceAvoid (lower : β → Finset (Finset α)) :
    (sliceAvoid lower).card = 2 * ∑ b, (lower b).card := by
  simp [sliceAvoid, card_sigma, card_product, ← nat_mul_sum]

theorem card_sliceBad (upper : Finset (Finset α)) :
    (sliceBad (β := β) upper).card = Fintype.card β * upper.card := by
  simp [sliceBad, card_sigma]

variable [DecidableEq α] [DecidableEq β]

theorem sliceBad_inter_sliceAvoid (upper : Finset (Finset α))
    (lower : β → Finset (Finset α)) :
    sliceBad upper ∩ sliceAvoid lower =
      univ.sigma (fun b => ({false} : Finset Bool).product (upper ∩ lower b)) := by
  ext z
  rcases z with ⟨b, c, u⟩
  simp [sliceBad, sliceAvoid, and_assoc, and_comm]

theorem card_sliceBad_inter (upper : Finset (Finset α))
    (lower : β → Finset (Finset α)) :
    (sliceBad upper ∩ sliceAvoid lower).card = ∑ b, (upper ∩ lower b).card := by
  rw [sliceBad_inter_sliceAvoid, card_sigma]
  simp

variable [Fintype α]

/-- Harris-Kleitman, after arbitrary exterior conditioning and with one
independent omitted-generator bit. This is precisely the local lopsided
estimate needed by canonical generator selections. -/
theorem sliced_harris_lopsided (upper : Finset (Finset α))
    (lower : β → Finset (Finset α))
    (hupper : IsUpperSet (upper : Set (Finset α)))
    (hlower : ∀ b, IsLowerSet (lower b : Set (Finset α))) :
    (2 * 2 ^ Fintype.card α) * (sliceBad upper ∩ sliceAvoid lower).card ≤
      upper.card * (sliceAvoid lower).card := by
  rw [card_sliceBad_inter, card_sliceAvoid]
  have h : ∑ b, 2 ^ Fintype.card α * (upper ∩ lower b).card ≤
      ∑ b, upper.card * (lower b).card :=
    nat_sum_le_sum _ _ _ (fun b _ => hupper.card_inter_le_finset (hlower b))
  rw [← nat_mul_sum, ← nat_mul_sum] at h
  have h2 := Nat.mul_le_mul_left 2 h
  simpa only [← mul_assoc, mul_comm 2 upper.card] using h2

end Frankl.Lopsided
