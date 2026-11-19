import Conjectures.LineSizeSaddleIntegrand
import Conjectures.LineSizeLattice

/-! The actual natural-number floor grid for the saddle integral.
The origin escapes to minus infinity, and every fixed real core coordinate
is eventually inside the grid and approximated by its left endpoint. -/
noncomputable section
namespace LineSize.Geometric

open Real Set Filter
open scoped Topology

def saddleOrigin (t : ℝ) : ℝ := -Profile.u0 / sqrt t

def saddleIndex (t x : ℝ) : ℕ := ⌊(x - saddleOrigin t) / sqrt t⌋₊

theorem saddleOrigin_tendsto_atBot {α : Type*} {l : Filter α} {t : α → ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k) :
    Tendsto (fun k => saddleOrigin (t k)) l atBot := by
  have hsqrt : Tendsto (fun k => sqrt (t k)) l (𝓝 0) := by
    simpa only [Real.sqrt_zero, Function.comp_def] using
      (Real.continuous_sqrt.tendsto 0).comp ht
  refine tendsto_atBot.mpr ?_
  intro b
  have hden : 0 < |b| + 1 := by positivity
  have hδ : 0 < Profile.u0 / (|b| + 1) := div_pos Profile.u0_pos hden
  filter_upwards [htpos, hsqrt.eventually (eventually_lt_nhds hδ)] with k hk hsmall
  have hs : 0 < sqrt (t k) := Real.sqrt_pos.mpr hk
  have hprod : sqrt (t k) * (|b| + 1) < Profile.u0 :=
    (lt_div_iff₀ hden).mp hsmall
  have hdiv : |b| + 1 < Profile.u0 / sqrt (t k) :=
    (lt_div_iff₀ hs).mpr (by nlinarith [hprod])
  dsimp [saddleOrigin]
  rw [neg_div]
  linarith [neg_abs_le b]

theorem saddleOrigin_eventually_le {α : Type*} {l : Filter α} {t : α → ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k) (x : ℝ) :
    ∀ᶠ k in l, saddleOrigin (t k) ≤ x :=
  (tendsto_atBot.1 (saddleOrigin_tendsto_atBot ht htpos)) x

theorem saddleIndex_coreCoordinate_eq {t : ℝ} (ht : 0 < t) (x : ℝ) :
    EulerKernel.coreCoordinate (saddleIndex t x) t =
      Lattice.leftEndpoint (sqrt t) (saddleOrigin t) x := by
  simpa only [saddleIndex, saddleOrigin, Lattice.leftEndpoint] using
    (EulerKernel.coreCoordinate_grid (saddleIndex t x) ht).symm

theorem saddleIndex_coreCoordinate_tendsto {α : Type*} {l : Filter α} {t : α → ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k) (x : ℝ) :
    Tendsto (fun k => EulerKernel.coreCoordinate (saddleIndex (t k) x) (t k))
      l (𝓝 x) := by
  have hsqrt : Tendsto (fun k => sqrt (t k)) l (𝓝 0) := by
    simpa only [Real.sqrt_zero, Function.comp_def] using
      (Real.continuous_sqrt.tendsto 0).comp ht
  have hh : ∀ᶠ k in l, 0 < sqrt (t k) := htpos.mono (fun _ hk => Real.sqrt_pos.mpr hk)
  have hgrid := Lattice.leftEndpoint_tendsto hh hsqrt
    (saddleOrigin_tendsto_atBot ht htpos) x
  apply hgrid.congr'
  filter_upwards [htpos] with k hk
  exact (saddleIndex_coreCoordinate_eq hk x).symm

theorem saddleIndex_eventually_positive {α : Type*} {l : Filter α} {t : α → ℝ}
    (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k) (x : ℝ) :
    ∀ᶠ k in l, 0 < saddleIndex (t k) x :=
  (EulerKernel.core_eventually_compact ht htpos
    (saddleIndex_coreCoordinate_tendsto ht htpos x)).mono (fun _ hk => hk.1)

theorem saddle_fourier_support_eventually {α : Type*} {l : Filter α} {t : α → ℝ}
    (ht : Tendsto t l (𝓝 0)) (y : ℝ) :
    ∀ᶠ k in l, |t k * sqrt (t k) * y| ≤ Real.pi := by
  have hsqrt : Tendsto (fun k => sqrt (t k)) l (𝓝 0) := by
    simpa only [Real.sqrt_zero, Function.comp_def] using
      (Real.continuous_sqrt.tendsto 0).comp ht
  have hy : Tendsto (fun _ : α => y) l (𝓝 y) := tendsto_const_nhds
  have hzero : Tendsto (fun k => t k * sqrt (t k) * y) l (𝓝 0) := by
    simpa only [zero_mul] using (ht.mul hsqrt).mul hy
  have hi : Ioo (-Real.pi) Real.pi ∈ 𝓝 (0 : ℝ) :=
    Ioo_mem_nhds (by linarith [Real.pi_pos]) Real.pi_pos
  filter_upwards [hzero.eventually hi] with k hk
  exact (abs_lt.mpr hk).le

theorem normalizedCoefficient_on_grid_tendsto {α : Type*} {l : Filter α}
    {t : α → ℝ} (β : ℝ) (ht : Tendsto t l (𝓝 0))
    (htpos : ∀ᶠ k in l, 0 < t k) (y x : ℝ) :
    Tendsto (fun k => normalizedCoefficient (saddleIndex (t k) x) β (t k) y)
      l (𝓝 (gaussianCoefficient β (y, x))) :=
  normalizedCoefficient_tendsto β ht htpos
    (saddleIndex_coreCoordinate_tendsto ht htpos x) y

theorem jointStep_tendsto {α : Type*} {l : Filter α} {t : α → ℝ}
    (β : ℝ) (ht : Tendsto t l (𝓝 0)) (htpos : ∀ᶠ k in l, 0 < t k) (p : ℝ × ℝ) :
    Tendsto (fun k => Lattice.jointStep (sqrt (t k)) (saddleOrigin (t k)) (t k)
      (fun r => normalizedCoefficient r β (t k)) p)
      l (𝓝 (gaussianCoefficient β p)) := by
  have hcoeff := normalizedCoefficient_on_grid_tendsto β ht htpos p.1 p.2
  apply hcoeff.congr'
  filter_upwards [saddleOrigin_eventually_le ht htpos p.2,
    saddle_fourier_support_eventually ht p.1] with k hgrid hsupport
  simp only [Lattice.jointStep, hsupport, ite_true, Lattice.step,
    not_lt.mpr hgrid, ite_false, saddleIndex]

end LineSize.Geometric
