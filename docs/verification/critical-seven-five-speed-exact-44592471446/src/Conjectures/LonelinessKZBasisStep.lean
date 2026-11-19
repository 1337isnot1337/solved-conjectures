import Conjectures.LonelinessKZBasisGram
import Conjectures.LonelinessNearestPlaneRelative

/-! The Euclidean calculation for an adjacent integer basis change. Rounding
the shear coefficient gives the factor `1/4`; the basis-minimality argument
that turns this into the `3/4` ratio is separate. -/

namespace Loneliness.KZBasis

open scoped BigOperators

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

def prefixProjection (b : ℕ → E) (r : ℕ) (x : E) : E :=
  ∑ i ∈ Finset.range r,
    (Submodule.span ℝ {InnerProductSpace.gramSchmidt ℝ b i}).starProjection x

theorem prefixProjection_add (b : ℕ → E) (r : ℕ) (x y : E) :
    prefixProjection b r (x + y) = prefixProjection b r x + prefixProjection b r y := by
  simp [prefixProjection, map_add, Finset.sum_add_distrib]

theorem prefixProjection_smul (b : ℕ → E) (r : ℕ) (a : ℝ) (x : E) :
    prefixProjection b r (a • x) = a • prefixProjection b r x := by
  simp [prefixProjection, map_smul, Finset.smul_sum]

theorem prefixProjection_succ (b : ℕ → E) (r : ℕ) (x : E) :
    prefixProjection b (r + 1) x = prefixProjection b r x +
      (Submodule.span ℝ {InnerProductSpace.gramSchmidt ℝ b r}).starProjection x := by
  exact Finset.sum_range_succ _ r

theorem gramSchmidt_sub_prefixProjection (b : ℕ → E) (r : ℕ) :
    InnerProductSpace.gramSchmidt ℝ b r = b r - prefixProjection b r (b r) := by
  simpa only [prefixProjection, Nat.Iio_eq_range] using
    InnerProductSpace.gramSchmidt_def ℝ b r

theorem prefixProjection_congr (b c : ℕ → E) (r : ℕ)
    (h : ∀ i < r, b i = c i) : prefixProjection b r = prefixProjection c r := by
  funext x
  apply Finset.sum_congr rfl
  intro i hi
  have hg : InnerProductSpace.gramSchmidt ℝ b i =
      InnerProductSpace.gramSchmidt ℝ c i :=
    gramSchmidt_congr_prefix b c i
      (fun j hj => h j (lt_of_le_of_lt hj (Finset.mem_range.mp hi)))
  rw [Submodule.starProjection_singleton, Submodule.starProjection_singleton, hg]

def adjacentCoefficient (b : ℕ → E) (i : ℕ) : ℝ :=
  inner ℝ (InnerProductSpace.gramSchmidt ℝ b i) (b (i + 1)) /
    ‖InnerProductSpace.gramSchmidt ℝ b i‖ ^ 2

theorem next_sub_prefixProjection (b : ℕ → E) (i : ℕ) :
    b (i + 1) - prefixProjection b i (b (i + 1)) =
      InnerProductSpace.gramSchmidt ℝ b (i + 1) +
        adjacentCoefficient b i • InnerProductSpace.gramSchmidt ℝ b i := by
  rw [gramSchmidt_sub_prefixProjection, prefixProjection_succ,
    Submodule.starProjection_singleton]
  simp only [RCLike.ofReal_real_eq_id, id_eq]
  dsimp only [adjacentCoefficient]
  module

/-- Only the preceding prefix and the current changed vector affect this
Gram–Schmidt vector; no independence assumption is needed. -/
theorem gramSchmidt_adjacent_change (b c : ℕ → E) (i : ℕ) (a : ℝ)
    (hbefore : ∀ j < i, c j = b j)
    (hcurrent : c i = b (i + 1) + a • b i) :
    InnerProductSpace.gramSchmidt ℝ c i =
      InnerProductSpace.gramSchmidt ℝ b (i + 1) +
        (adjacentCoefficient b i + a) • InnerProductSpace.gramSchmidt ℝ b i := by
  rw [gramSchmidt_sub_prefixProjection, prefixProjection_congr c b i hbefore,
    hcurrent, prefixProjection_add, prefixProjection_smul]
  calc
    b (i + 1) + a • b i -
        (prefixProjection b i (b (i + 1)) + a • prefixProjection b i (b i)) =
      (b (i + 1) - prefixProjection b i (b (i + 1))) +
        a • (b i - prefixProjection b i (b i)) := by module
    _ = InnerProductSpace.gramSchmidt ℝ b (i + 1) +
        (adjacentCoefficient b i + a) • InnerProductSpace.gramSchmidt ℝ b i := by
      rw [next_sub_prefixProjection, ← gramSchmidt_sub_prefixProjection]
      module

theorem gramSchmidt_rounded_adjacent_norm (b c : ℕ → E) (i : ℕ)
    (hbefore : ∀ j < i, c j = b j)
    (hcurrent : c i = b (i + 1) -
      (round (adjacentCoefficient b i) : ℝ) • b i) :
    ‖InnerProductSpace.gramSchmidt ℝ c i‖ ^ 2 ≤
      ‖InnerProductSpace.gramSchmidt ℝ b (i + 1)‖ ^ 2 +
        (1 / 4 : ℝ) * ‖InnerProductSpace.gramSchmidt ℝ b i‖ ^ 2 := by
  have hcurrent' : c i = b (i + 1) +
      (-(round (adjacentCoefficient b i) : ℝ)) • b i := by
    simpa only [neg_smul, sub_eq_add_neg] using hcurrent
  rw [gramSchmidt_adjacent_change b c i _ hbefore hcurrent']
  have horth : inner ℝ (InnerProductSpace.gramSchmidt ℝ b (i + 1))
      ((adjacentCoefficient b i - (round (adjacentCoefficient b i) : ℝ)) •
        InnerProductSpace.gramSchmidt ℝ b i) = 0 := by
    rw [inner_smul_right,
      InnerProductSpace.gramSchmidt_orthogonal ℝ b (by omega : i + 1 ≠ i), mul_zero]
  have hround := NearestPlane.round_error_norm_sq (adjacentCoefficient b i)
    (InnerProductSpace.gramSchmidt ℝ b i)
  simpa only [← sub_eq_add_neg, norm_add_sq_real, horth, mul_zero, add_zero] using
    add_le_add (le_rfl :
      ‖InnerProductSpace.gramSchmidt ℝ b (i + 1)‖ ^ 2 ≤
        ‖InnerProductSpace.gramSchmidt ℝ b (i + 1)‖ ^ 2) hround

end

end Loneliness.KZBasis
