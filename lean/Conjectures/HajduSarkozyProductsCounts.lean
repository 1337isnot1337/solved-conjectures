import Conjectures.HajduSarkozyProductsArithmetic
import Conjectures.HajduSarkozyCounts

/-!
# Hajdu–Sárközy's shifted-product total primitivity conjecture

Actual finite-prefix counts for a scaled shifted-power sequence. The root
injection has no additive constant depending on the coefficient; this is
needed to sum the bound over the infinite coefficient tail in the recorded
summable-family argument.
-/

open Classical Finset Filter Asymptotics

namespace Conjectures.HajduSarkozy.Products

noncomputable section

def coefficientWeight (k q : ℕ) : ℝ :=
  if q = 0 then 0 else (q : ℝ)^(-(1/(k : ℝ)))

@[simp] theorem coefficientWeight_zero (k : ℕ) : coefficientWeight k 0 = 0 := by
  simp [coefficientWeight]

theorem coefficientWeight_nonneg (k q : ℕ) : 0 ≤ coefficientWeight k q := by
  unfold coefficientWeight
  split_ifs <;> positivity

theorem coefficientWeight_eq {k q : ℕ} (hq : 0 < q) :
    coefficientWeight k q = ((q : ℝ)^(1/(k : ℝ)))⁻¹ := by
  rw [coefficientWeight, ite_eq_right (Nat.ne_of_gt hq),
    Real.rpow_neg (Nat.cast_nonneg q)]

@[simp] theorem count_empty (X : ℝ) : count (∅ : Set ℕ) X = 0 := by
  simp [count, realPrefix, positivePrefix]

theorem scaled_root_le {k q n u : ℕ} {c : ℤ} {X : ℝ}
    (hk : 0 < k) (hq : 0 < q) (_hX : 0 ≤ X) (hnX : (n : ℝ) ≤ X)
    (heq : (n : ℤ) = (q : ℤ)*(u : ℤ)^k+c) :
    (u : ℝ) ≤ ((X+(c.natAbs : ℝ))/(q : ℝ))^(1/(k : ℝ)) := by
  have hqR : (0 : ℝ) < q := by exact_mod_cast hq
  have heqR : (n : ℝ) = (q : ℝ)*(u : ℝ)^k+(c : ℝ) := by exact_mod_cast heq
  have hcabs : -(c.natAbs : ℝ) ≤ (c : ℝ) := by
    have hh : -(c.natAbs : ℤ) ≤ c := by simpa using neg_abs_le c
    exact_mod_cast hh
  have hpow : (u : ℝ)^k ≤ (X+(c.natAbs : ℝ))/(q : ℝ) := by
    apply (le_div_iff₀ hqR).mpr
    nlinarith
  have hh := Real.rpow_le_rpow (by positivity : (0 : ℝ) ≤ (u : ℝ)^k)
    hpow (by positivity : (0 : ℝ) ≤ 1/(k : ℝ))
  simpa only [one_div, Real.pow_rpow_inv_natCast (Nat.cast_nonneg u) hk.ne'] using hh

/-- The coefficient-weighted root bound counts distinct actual values and has no additive loss. -/
theorem scaled_count_le {k : ℕ} (hk : 0 < k) (c : ℤ) (q : ℕ)
    {X : ℝ} (hX : 0 ≤ X) :
    count (scaledPowers k c q) X ≤ (X+(c.natAbs : ℝ))^(1/(k : ℝ))*coefficientWeight k q := by
  by_cases hq : q = 0
  · simp [hq]
  have hq0 : 0 < q := Nat.pos_of_ne_zero hq
  let S := realPrefix (scaledPowers k c q) X
  let R : ℝ := ((X+(c.natAbs : ℝ))/(q : ℝ))^(1/(k : ℝ))
  have hR : 0 ≤ R := Real.rpow_nonneg (by positivity) _
  have hex (n : ℕ) (hn : n ∈ S) :
      ∃ u : ℕ, 0 < u ∧ (n : ℤ) = (q : ℤ)*(u : ℤ)^k+c :=
    ((mem_realPrefix.mp hn).2.2 : ScaledShiftedPower k c q n).2.2
  let f : ℕ → ℕ := fun n => if hn : n ∈ S then Classical.choose (hex n hn) else 0
  have hf (n : ℕ) (hn : n ∈ S) :
      0 < f n ∧ (n : ℤ) = (q : ℤ)*(f n : ℤ)^k+c := by
    simp only [f, dite_eq_left hn]
    exact Classical.choose_spec (hex n hn)
  have hcard : S.card ≤ (Icc 1 ⌊R⌋₊).card := by
    apply card_le_card_of_injOn f
    · intro n hn
      have hu := hf n hn
      apply mem_Icc.mpr
      refine ⟨hu.1, (Nat.le_floor_iff' (Nat.ne_of_gt hu.1)).mpr ?_⟩
      exact scaled_root_le hk hq0 hX (mem_realPrefix.mp hn).2.1 hu.2
    · intro n hn m hm he
      have heq : (n : ℤ) = (m : ℤ) := by rw [(hf n hn).2, (hf m hm).2, he]
      exact_mod_cast heq
  have hcard' : S.card ≤ ⌊R⌋₊ := by simpa only [Nat.card_Icc, Nat.add_sub_cancel] using hcard
  calc
    count (scaledPowers k c q) X = (S.card : ℝ) := rfl
    _ ≤ (⌊R⌋₊ : ℝ) := by exact_mod_cast hcard'
    _ ≤ R := Nat.floor_le hR
    _ = (X+(c.natAbs : ℝ))^(1/(k : ℝ))*coefficientWeight k q := by
      dsimp only [R]
      rw [Real.div_rpow (by positivity) (Nat.cast_nonneg q), coefficientWeight_eq hq0]
      rfl

end

end Conjectures.HajduSarkozy.Products
