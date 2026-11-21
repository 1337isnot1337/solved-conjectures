module

public import Conjectures.VishnyakovaTotalPositivity
public import Conjectures.VishnyakovaTotalPositivityExtremal

/-!
# Vishnyakova's original sampled-sequence radius

The class here is defined by all finite ordered minors of the infinite
Toeplitz matrix of the actual values `P(0), P(1), ...`. The necessity theorem
connects that class to the source transform. The binomial extremizer supplies
the sharp lower bound within the sampled-sequence class itself.
-/

@[expose] public section

namespace VishnyakovaRootRadius

open Polynomial

/-- Nonzero real polynomials of degree `n` whose nonnegative-integer samples
form a totally positive sequence, in the source's nonnegative-minor sense. -/
def SampledClass (n : ℕ) (P : ℝ[X]) : Prop :=
  P ≠ 0 ∧ P.natDegree = n ∧ Matrix.IsTotallyNonneg (fun i j : ℕ =>
    if i ≤ j then P.eval ((j - i : ℕ) : ℝ) else 0)

theorem SampledClass.weighted {n : ℕ} {P : ℝ[X]} (hP : SampledClass n P) :
    WeightedClass 1 (by norm_num) n P :=
  ⟨hP.2.1, VishnyakovaTotalPositivity.sampled_totallyNonneg_rootsInUnitInterval
    P hP.1 hP.2.2⟩

/-- The stronger centered-disk bound for the original sampled-sequence class. -/
theorem original_root_disk (n : ℕ) (hn : 0 < n) (P : ℝ[X])
    (hP : SampledClass n P) (z : ℂ) (hz : (P.map Complex.ofRealHom).eval z = 0) :
    ‖z + ((1 / 2 : ℝ) : ℂ)‖ ≤ (n : ℝ) - 1 / 2 := by
  have h := weighted_root_disk 1 (by norm_num) n hn P hP.weighted z hz
  norm_num at h ⊢
  linarith

theorem original_root_modulus (n : ℕ) (hn : 0 < n) (P : ℝ[X])
    (hP : SampledClass n P) (z : ℂ) (hz : (P.map Complex.ofRealHom).eval z = 0) :
    ‖z‖ ≤ (n : ℝ) := by
  simpa using weighted_root_modulus 1 (by norm_num) n hn P hP.weighted z hz

/-- Root moduli over the literal polynomial class in the original problem. -/
def sampledRootModuli (n : ℕ) : Set ℝ :=
  {r | ∃ P : ℝ[X], SampledClass n P ∧
    ∃ z : ℂ, (P.map Complex.ofRealHom).eval z = 0 ∧ r = ‖z‖}

/-- The radius `n` is attained by a polynomial whose samples are exactly
`choose (k+n) n`, with every finite Toeplitz minor proved nonnegative. -/
theorem original_extremal_polynomial (n : ℕ) (hn : 0 < n) :
    ∃ P : ℝ[X], SampledClass n P ∧
      ∃ z : ℂ, (P.map Complex.ofRealHom).eval z = 0 ∧ ‖z‖ = (n : ℝ) := by
  refine ⟨unitExtremal n, ?_, -(n : ℂ), unitExtremal_root_neg n hn, ?_⟩
  · refine ⟨?_, unitExtremal_natDegree n,
      VishnyakovaTotalPositivity.unitExtremal_sampled_totallyNonneg n⟩
    apply Polynomial.ne_zero_of_natDegree_gt
    rw [unitExtremal_natDegree]
    exact hn
  · simp

/-- The exact original radius, including attainment in the original class. -/
theorem original_radius_isGreatest (n : ℕ) (hn : 0 < n) :
    IsGreatest (sampledRootModuli n) (n : ℝ) := by
  constructor
  · obtain ⟨P, hP, z, hz, hnorm⟩ := original_extremal_polynomial n hn
    exact ⟨P, hP, z, hz, hnorm.symm⟩
  · intro r hr
    obtain ⟨P, hP, z, hz, rfl⟩ := hr
    exact original_root_modulus n hn P hP z hz

theorem original_radius_sup (n : ℕ) (hn : 0 < n) :
    sSup (sampledRootModuli n) = (n : ℝ) :=
  (original_radius_isGreatest n hn).csSup_eq

end VishnyakovaRootRadius
