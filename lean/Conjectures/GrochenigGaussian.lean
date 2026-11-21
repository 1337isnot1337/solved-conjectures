module

public import Conjectures.GrochenigGaussianBasic
public import Conjectures.KVZGammaDensity

/-!
# The Gaussian satisfies the literal Pólya-frequency definition

Definition 2.5 in Gröchenig's source requires an integrable real function
whose convolution kernel has nonnegative determinants on every pair of
strictly increasing real grids. Gaussian row and column factors reduce these
determinants to the exponential determinant already proved on the whole
real line. Thus no classification theorem or assumed Gaussian certificate
is used.
-/

@[expose] public section

namespace Grochenig

open MeasureTheory Matrix
open scoped BigOperators

noncomputable section

def IsPolyaFrequency (g : ℝ → ℝ) : Prop :=
  Integrable g ∧ ∀ n : ℕ, ∀ x y : Fin n → ℝ,
    StrictMono x → StrictMono y →
      0 ≤ Matrix.det (Matrix.of fun i j => g (x i - y j))

theorem isPolyaFrequency_iff (g : ℝ → ℝ) :
    IsPolyaFrequency g ↔ Integrable g ∧ ∀ n : ℕ, ∀ x y : Fin n → ℝ,
      StrictMono x → StrictMono y →
        0 ≤ Matrix.det (Matrix.of fun i j => g (x i - y j)) := by
  simp only [IsPolyaFrequency]

theorem gaussian_difference_factorization (x y : ℝ) :
    gaussian (x - y) = gaussian x * (gaussian y * Real.exp ((2 * Real.pi * x) * y)) := by
  simp only [gaussian, ← Real.exp_add]
  congr 1
  ring

theorem gaussian_det_factorization {n : ℕ} (x y : Fin n → ℝ) :
    Matrix.det (Matrix.of fun i j => gaussian (x i - y j)) =
      (∏ i : Fin n, gaussian (x i)) *
        ((∏ j : Fin n, gaussian (y j)) *
          Matrix.det (Matrix.of fun i j => Real.exp ((2 * Real.pi * x i) * y j))) := by
  have hmatrix : (Matrix.of fun i j => gaussian (x i - y j)) =
      Matrix.of (fun i j => gaussian (x i) *
        (gaussian (y j) * Real.exp ((2 * Real.pi * x i) * y j))) := by
    ext i j
    exact gaussian_difference_factorization (x i) (y j)
  rw [hmatrix]
  calc
    _ = (∏ i : Fin n, gaussian (x i)) *
        Matrix.det (Matrix.of fun i j : Fin n =>
          gaussian (y j) * Real.exp ((2 * Real.pi * x i) * y j)) :=
      Matrix.det_mul_column (fun i : Fin n => gaussian (x i))
        (Matrix.of fun i j : Fin n => gaussian (y j) *
          Real.exp ((2 * Real.pi * x i) * y j))
    _ = _ := congrArg ((∏ i : Fin n, gaussian (x i)) * ·)
      (Matrix.det_mul_row (fun j : Fin n => gaussian (y j))
        (Matrix.of fun i j : Fin n => Real.exp ((2 * Real.pi * x i) * y j)))

/-- In fact every ordered Gaussian convolution minor is strictly positive,
including the empty determinant. -/
theorem gaussian_det_pos {n : ℕ} (x y : Fin n → ℝ)
    (hx : StrictMono x) (hy : StrictMono y) :
    0 < Matrix.det (Matrix.of fun i j => gaussian (x i - y j)) := by
  have ha : StrictMono (fun i => 2 * Real.pi * x i) := by
    intro i j hij
    exact mul_lt_mul_of_pos_left (hx hij) (mul_pos (by norm_num) Real.pi_pos)
  rw [gaussian_det_factorization]
  exact mul_pos (Finset.prod_pos fun i _ => gaussian_pos (x i))
    (mul_pos (Finset.prod_pos fun j _ => gaussian_pos (y j))
      (KVZGamma.exponential_det_pos (fun i => 2 * Real.pi * x i) y ha hy))

theorem gaussian_isPolyaFrequency : IsPolyaFrequency gaussian :=
  ⟨gaussian_integrable, fun _ x y hx hy => (gaussian_det_pos x y hx hy).le⟩

end

end Grochenig
