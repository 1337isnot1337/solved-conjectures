import Conjectures.LonelinessHyperplaneScaledResidues
import Conjectures.LonelinessHyperplaneSmoothSeries
import Mathlib.Analysis.Normed.Group.Tannery

/-! Summing the fixed-scale residue frequencies. The uniform divisor
bound permits dominated convergence over the integers supported on the
primes of `Q`, including when the relation lattice has dimension one.
Identification of this sum with the endpoint event is a separate step. -/

namespace Loneliness.Hyperplane

open Filter
open scoped BigOperators Topology

noncomputable section

variable {ι : Type*} [Fintype ι] [DecidableEq ι]
variable {Q : ℕ} [NeZero Q]

def smoothResidueFrequency (m : ι → ℤ) (b : ι → ZMod Q) (N : ℕ) : ℝ :=
  ∑' g : Nat.factoredNumbers Q.primeFactors,
    residueSetFrequency m ((g : ℕ) * Q) (scaledUnitResidueLine (g : ℕ) b) N

theorem smoothResidueFrequency_tendsto
    (m : ι → ℤ) (hm : PrimitiveNormal m) (hreal : RealAdmissible m)
    (hdim : 2 ≤ Fintype.card ι)
    (b : ι → ZMod Q) (hb : PrimitiveResidue b)
    (hkernel : residueNormalHom m Q b = 0) :
    Tendsto (smoothResidueFrequency m b) atTop
      (𝓝 ((Nat.totient Q : ℝ) /
        ((Q : ℝ) ^ (Fintype.card ι - 1) *
          ∏ p ∈ Q.primeFactors, (1 - ((p : ℝ) ^ (Fintype.card ι - 1))⁻¹)))) := by
  let d := Fintype.card ι - 1
  have hd : 0 < d := by dsimp only [d]; omega
  obtain ⟨C, K, hC, hbound⟩ := exists_scaledUnitResidue_uniform_bound m hm hreal b
  let f : ℕ → Nat.factoredNumbers Q.primeFactors → ℝ := fun N g =>
    residueSetFrequency m ((g : ℕ) * Q) (scaledUnitResidueLine (g : ℕ) b) N
  let a := (Nat.totient Q : ℝ) / (Q : ℝ) ^ d
  let lim : Nat.factoredNumbers Q.primeFactors → ℝ := fun g =>
    a * (((g : ℕ) : ℝ) ^ d)⁻¹
  let bound : Nat.factoredNumbers Q.primeFactors → ℝ := fun g =>
    (K : ℝ) * (((g : ℕ) : ℝ) ^ d)⁻¹
  have hsum : Summable bound := (summable_smooth_reciprocal_power Q d hd).mul_left _
  have hlim : ∀ g, Tendsto (f · g) atTop (𝓝 (lim g)) := by
    intro g
    have hg : 0 < (g : ℕ) := Nat.pos_of_ne_zero g.property.1
    have ht := scaledUnitResidueLine_frequency_tendsto m hm hreal hdim
      (g : ℕ) hg b hb hkernel
    have he : (Nat.totient Q : ℝ) / (((g : ℕ) * Q : ℕ) : ℝ) ^ d = lim g := by
      dsimp only [lim, a]
      simp only [Nat.cast_mul, mul_pow, div_eq_mul_inv, mul_inv_rev]
      ring
    rw [he] at ht
    exact ht
  have heventual : ∀ᶠ N in atTop, ∀ g, ‖f N g‖ ≤ bound g := by
    filter_upwards [eventually_ge_atTop C] with N hN
    intro g
    have hg : 0 < (g : ℕ) := Nat.pos_of_ne_zero g.property.1
    have hnonneg : 0 ≤ f N g := by
      dsimp only [f, residueSetFrequency]
      positivity
    rw [Real.norm_eq_abs, abs_of_nonneg hnonneg]
    simpa only [f, bound, div_eq_mul_inv] using (hbound N hN (g : ℕ) hg).2
  have ht := tendsto_tsum_of_dominated_convergence hsum hlim heventual
  have htotal : (∑' g, lim g) = (Nat.totient Q : ℝ) /
      ((Q : ℝ) ^ d * ∏ p ∈ Q.primeFactors, (1 - ((p : ℝ) ^ d)⁻¹)) := by
    dsimp only [lim]
    rw [tsum_mul_left, tsum_smooth_reciprocal_power Q d hd]
    dsimp only [a]
    simp only [div_eq_mul_inv, mul_inv_rev]
    ring
  rw [htotal] at ht
  exact ht

end

end Loneliness.Hyperplane
