import Mathlib.Analysis.RCLike.Sqrt
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

/-!
# Kovalev's square-root Taylor-section zero-free conjecture

The diameter-disk comparison in Section 2 of the recorded proof, specialized
to the original square-root conjecture. The proof here is algebraic: it uses
the squared equation and real part of the principal square root. It does not
assume a complex fractional-power integral representation.

Recorded argument: `results/kovalev-zero-free/PROOF.md`, commit
`6432592c03b24aed190ed7b3204ed942a40a8da4` (Cinna Davis).
Original proposer: Leonid V. Kovalev, arXiv:2507.04544v1, Conjecture 1.2.
-/

namespace Conjectures.KovalevZeroFree

noncomputable section

/-- The closed disk with real diameter `[v,1]`, in its squared algebraic form. -/
def InDiameter (v : ℝ) (u : ℂ) : Prop :=
  ‖u‖ ^ 2 - (1 + v) * u.re + v ≤ 0

theorem norm_sub_real_sq (u : ℂ) (c : ℝ) :
    ‖u - (c : ℂ)‖ ^ 2 = ‖u‖ ^ 2 - 2 * c * u.re + c ^ 2 := by
  simp only [Complex.sq_norm, Complex.normSq_apply, Complex.sub_re,
    Complex.ofReal_re, Complex.sub_im, Complex.ofReal_im, sub_zero]
  ring

theorem inDiameter_iff_norm {v : ℝ} (hv : v ≤ 1) (u : ℂ) :
    InDiameter v u ↔ ‖u - (((1 + v) / 2 : ℝ) : ℂ)‖ ≤ (1 - v) / 2 := by
  have hrad : 0 ≤ (1 - v) / 2 := by linarith
  rw [← sq_le_sq₀ (norm_nonneg _) hrad, norm_sub_real_sq]
  dsimp [InDiameter]
  constructor <;> intro h <;> nlinarith

theorem inDiameter_norm_bounds {v : ℝ} {u : ℂ}
    (hv0 : 0 ≤ v) (hv1 : v ≤ 1) (hu : InDiameter v u) :
    v ≤ ‖u‖ ∧ ‖u‖ ≤ 1 := by
  have hr := norm_nonneg u
  have hre : u.re ≤ ‖u‖ := Complex.re_le_norm u
  have hmul := mul_le_mul_of_nonneg_left hre (show 0 ≤ 1 + v by linarith)
  have hpoly : (‖u‖ - 1) * (‖u‖ - v) ≤ 0 := by
    dsimp [InDiameter] at hu
    nlinarith
  constructor
  · by_contra! h
    have hp : 0 < (1 - ‖u‖) * (v - ‖u‖) :=
      mul_pos (by linarith) (by linarith)
    nlinarith
  · by_contra! h
    have hp : 0 < (‖u‖ - 1) * (‖u‖ - v) :=
      mul_pos (by linarith) (by linarith)
    linarith

theorem sqrt_sq (u : ℂ) : Complex.sqrt u ^ 2 = u := by
  simp [Complex.sqrt]

theorem sqrt_re_nonneg (u : ℂ) : 0 ≤ (Complex.sqrt u).re := by
  simp only [Complex.sqrt, Complex.cpow_inv_two_re]
  positivity

theorem norm_sqrt_sq (u : ℂ) : ‖Complex.sqrt u‖ ^ 2 = ‖u‖ := by
  simpa only [norm_pow] using congrArg norm (sqrt_sq u)

theorem sqrt_re_equation (u : ℂ) :
    2 * (Complex.sqrt u).re ^ 2 - ‖u‖ = u.re := by
  have hr := congrArg Complex.re (sqrt_sq u)
  have hn := norm_sqrt_sq u
  rw [Complex.sq_norm, Complex.normSq_apply] at hn
  simp only [pow_two, Complex.mul_re] at hr
  nlinarith

/-- The real inequality underlying the square-root disk map. -/
theorem sqrt_diameter_algebra {s r x : ℝ}
    (hs : 0 ≤ s) (hr0 : 0 ≤ r) (hrlo : s ^ 2 ≤ r) (hrhi : r ≤ 1)
    (hx : 0 ≤ x)
    (h : r ^ 2 - (1 + s ^ 2) * (2 * x ^ 2 - r) + s ^ 2 ≤ 0) :
    r + s ≤ (1 + s) * x := by
  have hp : 0 ≤ (1 - s) ^ 2 * (1 - r) * (r - s ^ 2) := by
    apply mul_nonneg
    · exact mul_nonneg (sq_nonneg _) (by linarith)
    · linarith
  have hi : (1 + s) ^ 2 * ((r + 1) * (r + s ^ 2)) -
      2 * (1 + s ^ 2) * (r + s) ^ 2 =
      (1 - s) ^ 2 * (1 - r) * (r - s ^ 2) := by ring
  have hd : (r + 1) * (r + s ^ 2) ≤ 2 * (1 + s ^ 2) * x ^ 2 := by
    nlinarith only [h]
  have hm := mul_le_mul_of_nonneg_left hd (sq_nonneg (1 + s))
  have hsq : (r + s) ^ 2 ≤ ((1 + s) * x) ^ 2 := by
    apply (mul_le_mul_iff_of_pos_left (show 0 < 2 * (1 + s ^ 2) by positivity)).mp
    nlinarith only [hi, hp, hm]
  exact (sq_le_sq₀ (by linarith) (mul_nonneg (by linarith) hx)).mp hsq

/-- The principal square root maps the disk with diameter `[v,1]` into the
disk with diameter `[sqrt v,1]`, including the degenerate endpoint disks. -/
theorem sqrt_inDiameter {v : ℝ} {u : ℂ}
    (hv0 : 0 ≤ v) (hv1 : v ≤ 1) (hu : InDiameter v u) :
    InDiameter (Real.sqrt v) (Complex.sqrt u) := by
  obtain ⟨hlo, hhi⟩ := inDiameter_norm_bounds hv0 hv1 hu
  have hs := Real.sq_sqrt hv0
  have hx := sqrt_re_nonneg u
  have he := sqrt_re_equation u
  have hreal : ‖u‖ + Real.sqrt v ≤ (1 + Real.sqrt v) * (Complex.sqrt u).re := by
    apply sqrt_diameter_algebra (Real.sqrt_nonneg v) (norm_nonneg u)
      (by simpa only [hs] using hlo) hhi hx
    dsimp [InDiameter] at hu
    rw [hs, he]
    exact hu
  dsimp [InDiameter]
  rw [norm_sqrt_sq]
  linarith

end

end Conjectures.KovalevZeroFree
