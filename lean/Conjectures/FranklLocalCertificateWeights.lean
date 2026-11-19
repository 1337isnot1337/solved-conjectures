module

public import Conjectures.FranklBasic
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Algebra.Order.BigOperators.Group.Finset

@[expose] public section

/-! Nonnegative integer weights and exact partitioning by exterior traces.
The inequalities count distinct members of the family, rather than generator
selections. Integer weights suffice for every local certificate in the note. -/

namespace Frankl.LocalCertificate

open scoped BigOperators

variable {α : Type*} [DecidableEq α]

def totalWeight (W : Finset α) (w : α → ℕ) : ℕ := ∑ x ∈ W, w x

def patternWeight (W : Finset α) (w : α → ℕ) (S : Finset α) : ℕ :=
  ∑ x ∈ W, if x ∈ S then w x else 0

/-- Nonnegative total weighted imbalance, without integer subtraction. -/
def Balanced (F : Finset (Finset α)) (W : Finset α) (w : α → ℕ) : Prop :=
  F.card * totalWeight W w ≤ 2 * ∑ S ∈ F, patternWeight W w S

theorem patternWeight_inter (W S : Finset α) (w : α → ℕ) :
    patternWeight W w (S ∩ W) = patternWeight W w S := by
  apply Finset.sum_congr rfl
  intro x hx
  simp only [Finset.mem_inter, hx, and_true]

theorem sum_patternWeight (F : Finset (Finset α)) (W : Finset α) (w : α → ℕ) :
    ∑ S ∈ F, patternWeight W w S = ∑ x ∈ W, w x * frequency F x := by
  unfold patternWeight
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro x hx
  rw [← Finset.sum_filter]
  simp [frequency, Nat.mul_comm]

/-- A nonzero nonnegative weighting with nonnegative imbalance has an
abundant point of positive weight. No closure hypothesis is needed. -/
theorem abundant_of_balanced (F : Finset (Finset α)) (W : Finset α) (w : α → ℕ)
    (hw : ∃ x ∈ W, 0 < w x) (h : Balanced F W w) :
    ∃ x ∈ W, 0 < w x ∧ Abundant F x := by
  by_contra hn
  have hsmall : ∀ x ∈ W, 0 < w x → 2 * frequency F x < F.card := by
    intro x hx hpos
    have hnot : ¬ F.card ≤ 2 * frequency F x := by
      intro hab
      exact hn ⟨x, hx, hpos, hab⟩
    exact lt_of_not_ge hnot
  have hsum : (∑ x ∈ W, 2 * (w x * frequency F x)) <
      ∑ x ∈ W, w x * F.card := by
    apply Finset.sum_lt_sum
    · intro x hx
      by_cases hz : w x = 0
      · simp only [hz, zero_mul, mul_zero, le_refl]
      · have hle := Nat.mul_le_mul_left (w x) (hsmall x hx (Nat.pos_of_ne_zero hz)).le
        exact (Nat.mul_left_comm 2 (w x) (frequency F x)).le.trans hle
    · obtain ⟨x, hx, hpos⟩ := hw
      refine ⟨x, hx, ?_⟩
      have hlt := Nat.mul_lt_mul_of_pos_left (hsmall x hx hpos) hpos
      exact (Nat.mul_left_comm 2 (w x) (frequency F x)).trans_lt hlt
  have heqleft : (∑ x ∈ W, 2 * (w x * frequency F x)) =
      2 * ∑ S ∈ F, patternWeight W w S := by
    rw [sum_patternWeight, Finset.mul_sum]
  have heqright : (∑ x ∈ W, w x * F.card) = F.card * totalWeight W w := by
    rw [← Finset.sum_mul, totalWeight, Nat.mul_comm]
  rw [heqleft, heqright] at hsum
  exact (Nat.not_lt_of_ge h) hsum

def exteriorTraces (F : Finset (Finset α)) (W : Finset α) : Finset (Finset α) :=
  F.image (fun U => U \ W)

def exteriorFiber (F : Finset (Finset α)) (W X : Finset α) : Finset (Finset α) :=
  F.filter (fun U => U \ W = X)

def insideTraces (F : Finset (Finset α)) (W X : Finset α) : Finset (Finset α) :=
  (exteriorFiber F W X).image (fun U => U ∩ W)

theorem intersection_injective_on_fiber (F : Finset (Finset α)) (W X : Finset α) :
    Set.InjOn (fun U => U ∩ W) (exteriorFiber F W X) := by
  intro U hU V hV huv
  have hdiff : U \ W = V \ W :=
    (Finset.mem_filter.mp hU).2.trans (Finset.mem_filter.mp hV).2.symm
  ext x
  have hi := Finset.ext_iff.mp huv x
  have hd := Finset.ext_iff.mp hdiff x
  by_cases hx : x ∈ W
  · simpa only [Finset.mem_inter, hx, and_true] using hi
  · simpa only [Finset.mem_sdiff, hx, not_false_eq_true, and_true] using hd

theorem insideTraces_card (F : Finset (Finset α)) (W X : Finset α) :
    (insideTraces F W X).card = (exteriorFiber F W X).card :=
  Finset.card_image_of_injOn (intersection_injective_on_fiber F W X)

theorem sum_insideTraces (F : Finset (Finset α)) (W X : Finset α) (w : α → ℕ) :
    (∑ S ∈ insideTraces F W X, patternWeight W w S) =
      ∑ U ∈ exteriorFiber F W X, patternWeight W w U := by
  unfold insideTraces
  rw [Finset.sum_image (intersection_injective_on_fiber F W X)]
  exact Finset.sum_congr rfl (fun U _ => patternWeight_inter W U w)

theorem insideTraces_balanced_iff (F : Finset (Finset α)) (W X : Finset α)
    (w : α → ℕ) :
    Balanced (insideTraces F W X) W w ↔ Balanced (exteriorFiber F W X) W w := by
  unfold Balanced
  rw [insideTraces_card, sum_insideTraces]

theorem balanced_of_exterior_fibers (F : Finset (Finset α)) (W : Finset α)
    (w : α → ℕ)
    (h : ∀ X ∈ exteriorTraces F W, Balanced (exteriorFiber F W X) W w) :
    Balanced F W w := by
  have hsum := Finset.sum_le_sum h
  have hc : (∑ X ∈ exteriorTraces F W, (exteriorFiber F W X).card) = F.card :=
    (Finset.card_eq_sum_card_image (fun U => U \ W) F).symm
  have hs : (∑ X ∈ exteriorTraces F W,
      ∑ U ∈ exteriorFiber F W X, patternWeight W w U) =
      ∑ U ∈ F, patternWeight W w U := by
    exact Finset.sum_fiberwise_of_maps_to
      (fun U hU => Finset.mem_image_of_mem (fun V => V \ W) hU) _
  change (∑ X ∈ exteriorTraces F W,
      (exteriorFiber F W X).card * totalWeight W w) ≤
      ∑ X ∈ exteriorTraces F W, 2 * ∑ U ∈ exteriorFiber F W X,
        patternWeight W w U at hsum
  rw [← Finset.sum_mul, hc, ← Finset.mul_sum, hs] at hsum
  exact hsum

theorem balanced_of_inside_traces (F : Finset (Finset α)) (W : Finset α)
    (w : α → ℕ)
    (h : ∀ X ∈ exteriorTraces F W, Balanced (insideTraces F W X) W w) :
    Balanced F W w :=
  balanced_of_exterior_fibers F W w
    (fun X hX => (insideTraces_balanced_iff F W X w).mp (h X hX))

end Frankl.LocalCertificate
