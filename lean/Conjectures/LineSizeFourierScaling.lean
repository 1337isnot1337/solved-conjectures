import Conjectures.LineSizeFourierBounds
import Conjectures.LineSizeFourierDomination
import Mathlib.Algebra.Order.Floor.Semiring

/-!
# A fixed Fourier prefix at the saddle scale

For `N = floor(a/t)` and `0 < t ≤ a/64`, the prefix contains at least
32 factors.  Its damping after `theta = t sqrt(t) y` has a positive
coefficient depending only on `a`.  Every longer real product satisfies
the same integrable envelope.
-/

noncomputable section

open scoped Topology

namespace LineSize.Fourier

def prefixLength (a t : ℝ) : ℕ := ⌊a/t⌋₊

def prefixScale (a : ℝ) : ℝ := min (a/2) ((a/2)^3)

def prefixDamping (a : ℝ) : ℝ := productConstant a * prefixScale a

theorem prefixScale_pos {a : ℝ} (ha : 0 < a) : 0 < prefixScale a := by
  unfold prefixScale
  apply lt_min
  · positivity
  · positivity

theorem prefixDamping_pos {a : ℝ} (ha : 0 < a) : 0 < prefixDamping a :=
  mul_pos (productConstant_pos a) (prefixScale_pos ha)

theorem prefixLength_lower {a t : ℝ} (ht : 0 < t) (hsmall : t ≤ a/64) :
    32 ≤ prefixLength a t := by
  have hr : (64 : ℝ) ≤ a/t := (le_div_iff₀ ht).2 (by linarith)
  have hf : a/t < (prefixLength a t : ℝ)+1 := Nat.lt_floor_add_one (a/t)
  have hN : (32 : ℝ) ≤ prefixLength a t := by linarith
  exact_mod_cast hN

theorem prefixLength_mul_le {a t : ℝ} (ha : 0 ≤ a) (ht : 0 < t) :
    (prefixLength a t : ℝ)*t ≤ a := by
  apply (le_div_iff₀ ht).1
  exact Nat.floor_le (div_nonneg ha ht.le)

theorem prefixLength_mul_ge_half {a t : ℝ} (ht : 0 < t) (hsmall : t ≤ a/64) :
    a/2 ≤ (prefixLength a t : ℝ)*t := by
  have hf : a/t < (prefixLength a t : ℝ)+1 := Nat.lt_floor_add_one (a/t)
  have hm := (div_lt_iff₀ ht).1 hf
  nlinarith

theorem prefixLength_le_piles {a t : ℝ} {r : ℕ} (ha : 0 ≤ a) (ht : 0 < t)
    (har : a ≤ (r : ℝ)*t) : prefixLength a t ≤ r := by
  have hf : (prefixLength a t : ℝ) ≤ a/t := Nat.floor_le (div_nonneg ha ht.le)
  have hr : a/t ≤ (r : ℝ) := (div_le_iff₀ ht).2 har
  exact_mod_cast hf.trans hr

theorem rescaled_angle_sq {t : ℝ} (ht : 0 ≤ t) (y : ℝ) :
    (t * Real.sqrt t * y)^2 = t^3*y^2 := by
  calc
    (t * Real.sqrt t * y)^2 = t^2 * (Real.sqrt t)^2 * y^2 := by ring
    _ = t^2 * t * y^2 := by rw [Real.sq_sqrt ht]
    _ = t^3*y^2 := by ring

theorem prefix_scaled_min {a t : ℝ} (ha : 0 < a) (ht : 0 < t)
    (hsmall : t ≤ a/64) (y : ℝ) :
    prefixScale a * min t⁻¹ (y^2) ≤
      min (prefixLength a t : ℝ)
        ((prefixLength a t : ℝ)^3 * (t * Real.sqrt t * y)^2) := by
  let N := prefixLength a t
  have hm : a/2 ≤ (N : ℝ)*t := prefixLength_mul_ge_half ht hsmall
  have hfirst : prefixScale a * t⁻¹ ≤ (N : ℝ) := by
    calc
      prefixScale a * t⁻¹ ≤ (a/2)*t⁻¹ :=
        mul_le_mul_of_nonneg_right (min_le_left _ _) (inv_nonneg.mpr ht.le)
      _ ≤ (N : ℝ) := by
        change (a/2)/t ≤ (N : ℝ)
        exact (div_le_iff₀ ht).2 hm
  have hpow : (a/2)^3 ≤ ((N : ℝ)*t)^3 :=
    pow_le_pow_left₀ (by positivity) hm 3
  have hsecond : prefixScale a * y^2 ≤ (N : ℝ)^3 * (t * Real.sqrt t * y)^2 := by
    calc
      prefixScale a * y^2 ≤ (a/2)^3*y^2 :=
        mul_le_mul_of_nonneg_right (min_le_right _ _) (sq_nonneg y)
      _ ≤ ((N : ℝ)*t)^3*y^2 := mul_le_mul_of_nonneg_right hpow (sq_nonneg y)
      _ = (N : ℝ)^3 * (t * Real.sqrt t * y)^2 := by
        rw [rescaled_angle_sq ht.le]
        ring
  apply le_min
  · exact (mul_le_mul_of_nonneg_left (min_le_left _ _) (prefixScale_pos ha).le).trans hfirst
  · exact (mul_le_mul_of_nonneg_left (min_le_right _ _) (prefixScale_pos ha).le).trans hsecond

theorem geometric_product_antitone {m n : ℕ} (hmn : m ≤ n) (t theta : ℝ) :
    (∏ j ∈ Finset.range n,
      geometricMajorant (Real.exp (-t*((j:ℝ)+1))) (((j:ℝ)+1)*theta)) ≤
    (∏ j ∈ Finset.range m,
      geometricMajorant (Real.exp (-t*((j:ℝ)+1))) (((j:ℝ)+1)*theta)) := by
  apply Finset.prod_le_prod_of_subset_of_le_one₀ (Finset.range_mono hmn)
  · intro j _hj
    exact (geometricMajorant_pos (Real.exp_pos _).le).le
  · intro j _hj _hm
    exact geometricMajorant_le_one (Real.exp_pos _).le

theorem prefix_geometric_scaled_bound {a t y : ℝ} (ha : 0 < a) (ht : 0 < t)
    (hsmall : t ≤ a/64) (hsupport : |t * Real.sqrt t * y| ≤ Real.pi) :
    (∏ j ∈ Finset.range (prefixLength a t),
      geometricMajorant (Real.exp (-t*((j:ℝ)+1))) (((j:ℝ)+1)*(t * Real.sqrt t * y))) ≤
      Real.exp (-prefixDamping a * min t⁻¹ (y^2)) := by
  have hb := geometric_product_bound (prefixLength_lower ht hsmall) ht
    (prefixLength_mul_le ha.le ht) hsupport
  apply hb.trans
  apply Real.exp_le_exp.mpr
  have hm := mul_le_mul_of_nonneg_left (prefix_scaled_min ha ht hsmall y)
    (productConstant_pos a).le
  unfold prefixDamping
  nlinarith

theorem prefix_geometric_scaled_envelope {a t y : ℝ} (ha : 0 < a) (ht : 0 < t)
    (hsmall : t ≤ a/64) (hsupport : |t * Real.sqrt t * y| ≤ Real.pi) :
    (∏ j ∈ Finset.range (prefixLength a t),
      geometricMajorant (Real.exp (-t*((j:ℝ)+1))) (((j:ℝ)+1)*(t * Real.sqrt t * y))) ≤
      polynomialEnvelope (prefixDamping a) y :=
  (prefix_geometric_scaled_bound ha ht hsmall hsupport).trans
    (rescaled_fourier_bound (prefixDamping_pos ha) ht hsupport)

theorem geometric_product_scaled_envelope {a t y : ℝ} {r : ℕ}
    (ha : 0 < a) (ht : 0 < t) (hsmall : t ≤ a/64) (har : a ≤ (r : ℝ)*t)
    (hsupport : |t * Real.sqrt t * y| ≤ Real.pi) :
    (∏ j ∈ Finset.range r,
      geometricMajorant (Real.exp (-t*((j:ℝ)+1))) (((j:ℝ)+1)*(t * Real.sqrt t * y))) ≤
      polynomialEnvelope (prefixDamping a) y :=
  (geometric_product_antitone (prefixLength_le_piles ha.le ht har) t
    (t * Real.sqrt t * y)).trans (prefix_geometric_scaled_envelope ha ht hsmall hsupport)

theorem exists_scaled_product_bound {a : ℝ} (ha : 0 < a) :
    ∃ C : ℝ, 0 < C ∧ ∀ (r : ℕ) (t y : ℝ), 0 < t → t ≤ a/64 → a ≤ (r : ℝ)*t →
      |t * Real.sqrt t * y| ≤ Real.pi →
      (∏ j ∈ Finset.range r,
        geometricMajorant (Real.exp (-t*((j:ℝ)+1))) (((j:ℝ)+1)*(t * Real.sqrt t * y))) ≤
        C/(1+y^2) := by
  refine ⟨dominationConstant (prefixDamping a),
    dominationConstant_pos (prefixDamping_pos ha), ?_⟩
  intro r t y ht hsmall har hsupport
  exact geometric_product_scaled_envelope ha ht hsmall har hsupport

end LineSize.Fourier
