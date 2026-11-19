import Mathlib.Analysis.InnerProductSpace.GramSchmidtOrtho
import Mathlib.Algebra.Order.Round
import Mathlib.Order.Interval.Finset.Nat
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Module
import Mathlib.Tactic.NormNum
import Lean.Elab.Tactic.Omega

/-!
# Reverse rounding along a Gram–Schmidt family

Every vector in the real span of an initial segment is close to an integer
combination of the original vectors. The squared error is at most one quarter
of the sum of squared Gram–Schmidt lengths. The induction rounds the last
coefficient first, so it does not assume that Gram–Schmidt vectors generate the
same integer module as the original vectors.

The family need not be linearly independent. This file does not assert the
existence of a Korkine–Zolotarev basis or a lattice covolume formula.
-/

namespace Loneliness.NearestPlane

open scoped BigOperators

noncomputable section

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

def prefixSpan (b : ℕ → E) (r : ℕ) : Submodule ℝ E :=
  Submodule.span ℝ (b '' Set.Iio r)

def integerCombination (b : ℕ → E) (r : ℕ) (z : ℕ → ℤ) : E :=
  ∑ i ∈ Finset.range r, (z i : ℝ) • b i

theorem integerCombination_mem (b : ℕ → E) (r : ℕ) (z : ℕ → ℤ) :
    integerCombination b r z ∈ prefixSpan b r := by
  apply Submodule.sum_mem
  intro i hi
  apply Submodule.smul_mem
  exact Submodule.subset_span ⟨i, Finset.mem_range.mp hi, rfl⟩

theorem integerCombination_mem_integer_span (b : ℕ → E) (r : ℕ) (z : ℕ → ℤ) :
    integerCombination b r z ∈ Submodule.span ℤ (b '' Set.Iio r) := by
  apply Submodule.sum_mem
  intro i hi
  rw [Int.cast_smul_eq_zsmul ℝ]
  apply Submodule.smul_mem
  exact Submodule.subset_span ⟨i, Finset.mem_range.mp hi, rfl⟩

/-- The triangular correction at index `r` lies in the earlier real span. -/
theorem gramSchmidt_remainder_mem (b : ℕ → E) (r : ℕ) :
    b r - InnerProductSpace.gramSchmidt ℝ b r ∈ prefixSpan b r := by
  unfold prefixSpan
  rw [← InnerProductSpace.span_gramSchmidt_Iio ℝ b r]
  rw [InnerProductSpace.gramSchmidt_def'' ℝ b r, add_sub_cancel_left]
  apply Submodule.sum_mem
  intro i hi
  apply Submodule.smul_mem
  exact Submodule.subset_span ⟨i, Finset.mem_Iio.mp hi, rfl⟩

/-- The `r`th Gram–Schmidt vector is orthogonal to the earlier real span. -/
theorem inner_gramSchmidt_prefix (b : ℕ → E) (r : ℕ) {x : E}
    (hx : x ∈ prefixSpan b r) :
    inner ℝ (InnerProductSpace.gramSchmidt ℝ b r) x = 0 := by
  refine Submodule.span_induction
    (p := fun y _ => inner ℝ (InnerProductSpace.gramSchmidt ℝ b r) y = 0)
    ?_ ?_ ?_ ?_ hx
  · rintro y ⟨i, hi, rfl⟩
    exact InnerProductSpace.gramSchmidt_inv_triangular ℝ b hi
  · simp
  · intro y z hy hz ihy ihz
    simp only [inner_add_right, ihy, ihz, add_zero]
  · intro a y hy ih
    simp only [inner_smul_right, ih, mul_zero]

/-- Reverse nearest-plane rounding, with an actual integer combination of the
original vectors and a squared Euclidean error bound. -/
theorem exists_integer_rounding (b : ℕ → E) (r : ℕ) {x : E}
    (hx : x ∈ prefixSpan b r) :
    ∃ z : ℕ → ℤ, ‖x - integerCombination b r z‖ ^ 2 ≤
      (1 / 4 : ℝ) * ∑ i ∈ Finset.range r,
        ‖InnerProductSpace.gramSchmidt ℝ b i‖ ^ 2 := by
  classical
  induction r generalizing x with
  | zero =>
      have hIio : Set.Iio (0 : ℕ) = ∅ := by ext i; simp
      have hx0 : x = 0 := by simpa [prefixSpan, hIio] using hx
      exact ⟨fun _ => 0, by simp [hx0, integerCombination]⟩
  | succ r ih =>
      have hIio : Set.Iio (r + 1) = insert r (Set.Iio r) := by
        ext i
        simp only [Set.mem_Iio, Set.mem_insert_iff]
        omega
      have hx' : x ∈ Submodule.span ℝ (insert (b r) (b '' Set.Iio r)) := by
        simpa only [prefixSpan, hIio, Set.image_insert_eq] using hx
      obtain ⟨a, y, hy, hxy⟩ := Submodule.mem_span_insert.mp hx'
      let g := InnerProductSpace.gramSchmidt ℝ b r
      let p := b r - g
      let θ := a - (round a : ℝ)
      let u := y + θ • p
      have hp : p ∈ prefixSpan b r := gramSchmidt_remainder_mem b r
      have hu : u ∈ prefixSpan b r :=
        (prefixSpan b r).add_mem hy ((prefixSpan b r).smul_mem θ hp)
      obtain ⟨z, hz⟩ := ih hu
      let z' := Function.update z r (round a)
      have hcomb : integerCombination b (r + 1) z' =
          integerCombination b r z + (round a : ℝ) • b r := by
        unfold integerCombination
        rw [Finset.sum_range_succ]
        have hlast : z' r = round a := Function.update_self r (round a) z
        rw [hlast]
        congr 1
        apply Finset.sum_congr rfl
        intro i hi
        have hir : i ≠ r := (Finset.mem_range.mp hi).ne
        rw [show z' i = z i from Function.update_of_ne hir (round a) z]
      have he : u - integerCombination b r z ∈ prefixSpan b r :=
        (prefixSpan b r).sub_mem hu (integerCombination_mem b r z)
      have horth : inner ℝ (u - integerCombination b r z) (θ • g) = 0 := by
        have horth' : inner ℝ (u - integerCombination b r z) g = 0 :=
          (inner_eq_zero_symm (𝕜 := ℝ)).mp (inner_gramSchmidt_prefix b r he)
        simp only [inner_smul_right, horth', mul_zero]
      have hresidual : x - integerCombination b (r + 1) z' =
          (u - integerCombination b r z) + θ • g := by
        rw [hxy, hcomb]
        dsimp only [u, p, θ]
        module
      have hθ : |θ| ≤ (1 / 2 : ℝ) := abs_sub_round a
      have hθsq : |θ| ^ 2 ≤ (1 / 4 : ℝ) := by
        have hmul : |θ| * |θ| ≤ (1 / 2 : ℝ) * (1 / 2) :=
          mul_le_mul hθ hθ (abs_nonneg θ) (by norm_num)
        nlinarith only [hmul]
      have hlast : ‖θ • g‖ ^ 2 ≤ (1 / 4 : ℝ) * ‖g‖ ^ 2 := by
        calc
          ‖θ • g‖ ^ 2 = |θ| ^ 2 * ‖g‖ ^ 2 := by
            rw [norm_smul, Real.norm_eq_abs, mul_pow]
          _ ≤ (1 / 4 : ℝ) * ‖g‖ ^ 2 :=
            mul_le_mul_of_nonneg_right hθsq (sq_nonneg _)
      refine ⟨z', ?_⟩
      calc
        ‖x - integerCombination b (r + 1) z'‖ ^ 2 =
            ‖u - integerCombination b r z‖ ^ 2 + ‖θ • g‖ ^ 2 := by
          rw [hresidual, norm_add_sq_real, horth]
          ring
        _ ≤ (1 / 4 : ℝ) * (∑ i ∈ Finset.range r,
              ‖InnerProductSpace.gramSchmidt ℝ b i‖ ^ 2) +
            (1 / 4 : ℝ) * ‖g‖ ^ 2 := add_le_add hz hlast
        _ = (1 / 4 : ℝ) * ∑ i ∈ Finset.range (r + 1),
              ‖InnerProductSpace.gramSchmidt ℝ b i‖ ^ 2 := by
          rw [Finset.sum_range_succ]
          dsimp only [g]
          ring

/-- The rounded point belongs to the integer span, without a lattice-basis
or linear-independence hypothesis. -/
theorem exists_integer_span_point (b : ℕ → E) (r : ℕ) {x : E}
    (hx : x ∈ prefixSpan b r) :
    ∃ y ∈ Submodule.span ℤ (b '' Set.Iio r), ‖x - y‖ ^ 2 ≤
      (1 / 4 : ℝ) * ∑ i ∈ Finset.range r,
        ‖InnerProductSpace.gramSchmidt ℝ b i‖ ^ 2 := by
  obtain ⟨z, hz⟩ := exists_integer_rounding b r hx
  exact ⟨integerCombination b r z, integerCombination_mem_integer_span b r z, hz⟩

end

end Loneliness.NearestPlane
