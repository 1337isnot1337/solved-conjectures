import Conjectures.LineSizeLatticeHalfGaussian
import Conjectures.LineSizeFourierScaling
import Mathlib.MeasureTheory.Integral.Prod
import Mathlib.Tactic.FunProp

/-!
# Joint domination of core length and Fourier frequency

The short-core hypothesis is an explicit distance from the saddle.  Long
cores use the actual real product bound.  Together they give one integrable
majorant on the product of the Fourier and lattice variables.
-/

noncomputable section

open Set Filter MeasureTheory
open scoped Topology

namespace LineSize.Lattice

theorem gaussian_fourier_trade {b t x y : ℝ} (hb : 0 < b) (ht : 0 < t)
    (hgap : b ≤ t*x^2) (hsupport : t^3*y^2 ≤ Real.pi^2) :
    Real.exp (-x^2) ≤ Real.exp (-x^2/2) * Fourier.polynomialEnvelope (b/2) y := by
  have hhalf : (b/2)*t⁻¹ ≤ x^2/2 := by
    change (b/2)/t ≤ x^2/2
    apply (div_le_iff₀ ht).2
    nlinarith
  have hm : (b/2) * min t⁻¹ (y^2) ≤ x^2/2 :=
    (mul_le_mul_of_nonneg_left (min_le_left _ _) (by positivity)).trans hhalf
  have he : Real.exp (-x^2/2) ≤ Real.exp (-(b/2) * min t⁻¹ (y^2)) :=
    Real.exp_le_exp.mpr (by linarith)
  have hbound := he.trans
    (Fourier.damped_min_le_polynomialEnvelope (by positivity : 0 < b/2) ht hsupport)
  calc
    Real.exp (-x^2) = Real.exp (-x^2/2) * Real.exp (-x^2/2) := by
      rw [← Real.exp_add]
      congr 1
      ring
    _ ≤ Real.exp (-x^2/2) * Fourier.polynomialEnvelope (b/2) y :=
      mul_le_mul_of_nonneg_left hbound (Real.exp_pos _).le

theorem normalized_small_core_gap {u a t : ℝ} (hau : a < u) (ht : 0 < t)
    {r : ℕ} (hr : (r : ℝ)*t < a) :
    (u-a)^2 ≤ t * (-u/Real.sqrt t + Real.sqrt t*(r:ℝ))^2 := by
  have hs : Real.sqrt t ≠ 0 := ne_of_gt (Real.sqrt_pos.2 ht)
  let z := -u/Real.sqrt t + Real.sqrt t*(r:ℝ)
  have hm : Real.sqrt t*z = (r:ℝ)*t-u := by
    calc
      Real.sqrt t*z = -u*(Real.sqrt t/Real.sqrt t) + (Real.sqrt t)^2*(r:ℝ) := by
        dsimp [z]
        ring
      _ = -u+t*(r:ℝ) := by rw [div_self hs, Real.sq_sqrt ht.le]; ring
      _ = (r:ℝ)*t-u := by ring
  have hid : t*z^2 = ((r:ℝ)*t-u)^2 := by
    calc
      t*z^2 = (Real.sqrt t*z)^2 := by rw [mul_pow, Real.sq_sqrt ht.le]
      _ = ((r:ℝ)*t-u)^2 := by rw [hm]
  calc
    (u-a)^2 ≤ (u-(r:ℝ)*t)^2 :=
      pow_le_pow_left₀ (sub_nonneg.mpr hau.le) (by linarith) 2
    _ = ((r:ℝ)*t-u)^2 := by ring
    _ = t*z^2 := hid.symm

def scaledMajorant (r : ℕ) (t y : ℝ) : ℝ :=
  ∏ j ∈ Finset.range r,
    Fourier.geometricMajorant (Real.exp (-t*((j:ℝ)+1)))
      (((j:ℝ)+1)*(t * Real.sqrt t * y))

theorem scaledMajorant_nonneg (r : ℕ) (t y : ℝ) : 0 ≤ scaledMajorant r t y := by
  apply Finset.prod_nonneg
  intro j _hj
  exact (Fourier.geometricMajorant_pos (Real.exp_pos _).le).le

theorem scaledMajorant_le_one (r : ℕ) (t y : ℝ) : scaledMajorant r t y ≤ 1 := by
  apply Finset.prod_le_one₀
  · intro j _hj
    exact (Fourier.geometricMajorant_pos (Real.exp_pos _).le).le
  · intro j _hj
    exact Fourier.geometricMajorant_le_one (Real.exp_pos _).le

def outerEnvelope (a b y : ℝ) : ℝ :=
  Fourier.polynomialEnvelope (Fourier.prefixDamping a) y +
    Fourier.polynomialEnvelope (b/2) y

theorem outerEnvelope_nonneg {a b : ℝ} (ha : 0 < a) (hb : 0 < b) (y : ℝ) :
    0 ≤ outerEnvelope a b y :=
  add_nonneg (Fourier.polynomialEnvelope_nonneg (Fourier.prefixDamping_pos ha) y)
    (Fourier.polynomialEnvelope_nonneg (by positivity : 0 < b/2) y)

theorem integrable_outerEnvelope (a b : ℝ) : Integrable (outerEnvelope a b) := by
  unfold outerEnvelope
  exact (Fourier.integrable_polynomialEnvelope (Fourier.prefixDamping a)).add
    (Fourier.integrable_polynomialEnvelope (b/2))

def jointEnvelope (C a b : ℝ) (p : ℝ × ℝ) : ℝ :=
  outerEnvelope a b p.1 * halfGaussianEnvelope C p.2

theorem jointEnvelope_nonneg {C a b : ℝ} (hC : 0 ≤ C) (ha : 0 < a) (hb : 0 < b)
    (p : ℝ × ℝ) : 0 ≤ jointEnvelope C a b p :=
  mul_nonneg (outerEnvelope_nonneg ha hb p.1) (halfGaussianEnvelope_nonneg hC p.2)

theorem integrable_jointEnvelope (C a b : ℝ) :
    Integrable (jointEnvelope C a b) (volume.prod volume) := by
  unfold jointEnvelope
  exact (integrable_outerEnvelope a b).mul_prod (integrable_halfGaussianEnvelope C)

theorem coefficient_half_gaussian_bound {C a b h c t : ℝ} (hC : 0 ≤ C)
    (ha : 0 < a) (hb : 0 < b) (ht : 0 < t) (hsmall : t ≤ a/64)
    (A : ℕ → ℝ → ℂ)
    (hA : ∀ r y, |t * Real.sqrt t * y| ≤ Real.pi → ‖A r y‖ ≤ C * (1+|c+h*(r:ℝ)|) * Real.exp (-(c+h*(r:ℝ))^2) *
      scaledMajorant r t y)
    (hgap : ∀ r : ℕ, (r:ℝ)*t < a → b ≤ t*(c+h*(r:ℝ))^2)
    {y : ℝ} (hsupport : |t * Real.sqrt t * y| ≤ Real.pi) (r : ℕ) :
    ‖A r y‖ ≤ (C * outerEnvelope a b y) *
      (1+|c+h*(r:ℝ)|) * Real.exp (-(c+h*(r:ℝ))^2/2) := by
  let z := c+h*(r:ℝ)
  have hprod : Real.exp (-z^2) * scaledMajorant r t y ≤
      Real.exp (-z^2/2) * outerEnvelope a b y := by
    by_cases hr : a ≤ (r:ℝ)*t
    · have hp : scaledMajorant r t y ≤ Fourier.polynomialEnvelope (Fourier.prefixDamping a) y :=
        Fourier.geometric_product_scaled_envelope ha ht hsmall hr hsupport
      have hpo : scaledMajorant r t y ≤ outerEnvelope a b y := hp.trans
        (le_add_of_nonneg_right (Fourier.polynomialEnvelope_nonneg (by positivity : 0 < b/2) y))
      have he : Real.exp (-z^2) ≤ Real.exp (-z^2/2) :=
        Real.exp_le_exp.mpr (by nlinarith [sq_nonneg z])
      exact mul_le_mul he hpo (scaledMajorant_nonneg r t y) (Real.exp_pos _).le
    · have hg : b ≤ t*z^2 := hgap r (lt_of_not_ge hr)
      have htrade := gaussian_fourier_trade hb ht hg
        (Fourier.rescaled_fourier_support ht.le hsupport)
      calc
        Real.exp (-z^2) * scaledMajorant r t y ≤ Real.exp (-z^2) :=
          mul_le_of_le_one_right (Real.exp_pos _).le (scaledMajorant_le_one r t y)
        _ ≤ Real.exp (-z^2/2) * Fourier.polynomialEnvelope (b/2) y := htrade
        _ ≤ Real.exp (-z^2/2) * outerEnvelope a b y :=
          mul_le_mul_of_nonneg_left
            (le_add_of_nonneg_left
              (Fourier.polynomialEnvelope_nonneg (Fourier.prefixDamping_pos ha) y))
            (Real.exp_pos _).le
  calc
    ‖A r y‖ ≤ C * (1+|z|) * Real.exp (-z^2) * scaledMajorant r t y := hA r y hsupport
    _ = (C * (1+|z|)) * (Real.exp (-z^2) * scaledMajorant r t y) := by ring
    _ ≤ (C * (1+|z|)) * (Real.exp (-z^2/2) * outerEnvelope a b y) :=
      mul_le_mul_of_nonneg_left hprod (by positivity)
    _ = (C * outerEnvelope a b y) * (1+|z|) * Real.exp (-z^2/2) := by ring

/-- The first coordinate is Fourier frequency; the second is the lattice coordinate. -/
def jointStep (h c t : ℝ) (A : ℕ → ℝ → ℂ) (p : ℝ × ℝ) : ℂ :=
  if |t * Real.sqrt t * p.1| ≤ Real.pi then step h c (fun r => A r p.1) p.2 else 0

theorem measurable_jointStep (h c t : ℝ) (A : ℕ → ℝ → ℂ)
    (hA : ∀ r, Measurable (A r)) : Measurable (jointStep h c t A) := by
  have hmA : Measurable (fun p : ℕ × ℝ => A p.1 p.2) :=
    measurable_from_prod_countable_right hA
  have hmIndex : Measurable (fun p : ℝ × ℝ => (⌊(p.2-c)/h⌋₊, p.1)) := by
    fun_prop
  have hev : Measurable (fun p : ℝ × ℝ => A ⌊(p.2-c)/h⌋₊ p.1) :=
    hmA.comp hmIndex
  have hmStep : Measurable (fun p : ℝ × ℝ => step h c (fun r => A r p.1) p.2) :=
    Measurable.ite (measurableSet_lt measurable_snd measurable_const) measurable_const hev
  have hs : MeasurableSet {p : ℝ × ℝ | |t * Real.sqrt t * p.1| ≤ Real.pi} :=
    measurableSet_le (by fun_prop) measurable_const
  exact Measurable.ite hs hmStep measurable_const

theorem jointStep_norm_bound {C a b h c t : ℝ} (hC : 0 ≤ C) (ha : 0 < a)
    (hb : 0 < b) (hh : 0 < h) (hh1 : h ≤ 1) (ht : 0 < t) (hsmall : t ≤ a/64)
    (A : ℕ → ℝ → ℂ)
    (hA : ∀ r y, |t * Real.sqrt t * y| ≤ Real.pi → ‖A r y‖ ≤ C * (1+|c+h*(r:ℝ)|) * Real.exp (-(c+h*(r:ℝ))^2) *
      scaledMajorant r t y)
    (hgap : ∀ r : ℕ, (r:ℝ)*t < a → b ≤ t*(c+h*(r:ℝ))^2) (p : ℝ × ℝ) :
    ‖jointStep h c t A p‖ ≤ jointEnvelope C a b p := by
  by_cases hs : |t * Real.sqrt t * p.1| ≤ Real.pi
  · rw [jointStep, ite_eq_left hs]
    have hcoef := coefficient_half_gaussian_bound hC ha hb ht hsmall A hA hgap hs
    have hbound := step_norm_le_halfGaussianEnvelope hh hh1
      (mul_nonneg hC (outerEnvelope_nonneg ha hb p.1)) (fun r => A r p.1) hcoef p.2
    apply hbound.trans_eq
    unfold jointEnvelope halfGaussianEnvelope
    ring
  · rw [jointStep, ite_eq_right hs, norm_zero]
    exact jointEnvelope_nonneg hC ha hb p

theorem integrable_jointStep {C a b h c t : ℝ} (hC : 0 ≤ C) (ha : 0 < a)
    (hb : 0 < b) (hh : 0 < h) (hh1 : h ≤ 1) (ht : 0 < t) (hsmall : t ≤ a/64)
    (A : ℕ → ℝ → ℂ) (hAm : ∀ r, Measurable (A r))
    (hA : ∀ r y, |t * Real.sqrt t * y| ≤ Real.pi → ‖A r y‖ ≤ C * (1+|c+h*(r:ℝ)|) * Real.exp (-(c+h*(r:ℝ))^2) *
      scaledMajorant r t y)
    (hgap : ∀ r : ℕ, (r:ℝ)*t < a → b ≤ t*(c+h*(r:ℝ))^2) :
    Integrable (jointStep h c t A) (volume.prod volume) := by
  apply (integrable_jointEnvelope C a b).mono' (measurable_jointStep h c t A hAm).aestronglyMeasurable
  exact ae_of_all _ (jointStep_norm_bound hC ha hb hh hh1 ht hsmall A hA hgap)

theorem integral_jointStep {C a b h c t : ℝ} (hC : 0 ≤ C) (ha : 0 < a)
    (hb : 0 < b) (hh : 0 < h) (hh1 : h ≤ 1) (ht : 0 < t) (hsmall : t ≤ a/64)
    (A : ℕ → ℝ → ℂ) (hAm : ∀ r, Measurable (A r))
    (hA : ∀ r y, |t * Real.sqrt t * y| ≤ Real.pi → ‖A r y‖ ≤ C * (1+|c+h*(r:ℝ)|) * Real.exp (-(c+h*(r:ℝ))^2) *
      scaledMajorant r t y)
    (hgap : ∀ r : ℕ, (r:ℝ)*t < a → b ≤ t*(c+h*(r:ℝ))^2) :
    (∫ p : ℝ × ℝ, jointStep h c t A p ∂(volume.prod volume)) =
      ∫ y : ℝ, if |t * Real.sqrt t * y| ≤ Real.pi then
        (h : ℂ) * ∑' r : ℕ, A r y else 0 := by
  rw [integral_prod _ (integrable_jointStep hC ha hb hh hh1 ht hsmall A hAm hA hgap)]
  apply integral_congr_ae
  apply ae_of_all
  intro y
  by_cases hs : |t * Real.sqrt t * y| ≤ Real.pi
  · have hcoef := coefficient_half_gaussian_bound hC ha hb ht hsmall A hA hgap hs
    have hsum := summable_norm_of_half_gaussian_bound hh hh1
      (mul_nonneg hC (outerEnvelope_nonneg ha hb y)) (fun r => A r y) hcoef
    simp only [jointStep, hs, ite_true]
    exact integral_step hh (fun r => A r y) hsum
  · simp only [jointStep, ite_eq_right hs, integral_zero]

theorem jointStep_dominated_convergence {ι : Type*} {l : Filter ι} [l.IsCountablyGenerated]
    {C a b : ℝ} (hC : 0 ≤ C) (ha : 0 < a) (hb : 0 < b)
    {h c t : ι → ℝ} {A : ι → ℕ → ℝ → ℂ} {f : ℝ × ℝ → ℂ}
    (hdata : ∀ᶠ i in l, 0 < h i ∧ h i ≤ 1 ∧ 0 < t i ∧ t i ≤ a/64)
    (hAm : ∀ᶠ i in l, ∀ r, Measurable (A i r))
    (hA : ∀ᶠ i in l, ∀ r y, |t i * Real.sqrt (t i) * y| ≤ Real.pi → ‖A i r y‖ ≤
      C * (1+|c i+h i*(r:ℝ)|) * Real.exp (-(c i+h i*(r:ℝ))^2) * scaledMajorant r (t i) y)
    (hgap : ∀ᶠ i in l, ∀ r : ℕ, (r:ℝ)*t i < a → b ≤ t i*(c i+h i*(r:ℝ))^2)
    (hlim : ∀ᵐ p : ℝ × ℝ ∂(volume.prod volume),
      Tendsto (fun i => jointStep (h i) (c i) (t i) (A i) p) l (𝓝 (f p))) :
    Tendsto (fun i => ∫ p : ℝ × ℝ, jointStep (h i) (c i) (t i) (A i) p ∂(volume.prod volume))
      l (𝓝 (∫ p : ℝ × ℝ, f p ∂(volume.prod volume))) := by
  apply tendsto_integral_filter_of_dominated_convergence (jointEnvelope C a b)
  · filter_upwards [hAm] with i hmi
    exact (measurable_jointStep (h i) (c i) (t i) (A i) hmi).aestronglyMeasurable
  · filter_upwards [hdata, hA, hgap] with i hi hAi hgi
    rcases hi with ⟨hhi, hh1i, hti, hsmalli⟩
    exact ae_of_all _ (jointStep_norm_bound hC ha hb hhi hh1i hti hsmalli (A i) hAi hgi)
  · exact integrable_jointEnvelope C a b
  · exact hlim

theorem scaled_sum_integral_tendsto {ι : Type*} {l : Filter ι} [l.IsCountablyGenerated]
    {C a b : ℝ} (hC : 0 ≤ C) (ha : 0 < a) (hb : 0 < b)
    {h c t : ι → ℝ} {A : ι → ℕ → ℝ → ℂ} {f : ℝ × ℝ → ℂ}
    (hdata : ∀ᶠ i in l, 0 < h i ∧ h i ≤ 1 ∧ 0 < t i ∧ t i ≤ a/64)
    (hAm : ∀ᶠ i in l, ∀ r, Measurable (A i r))
    (hA : ∀ᶠ i in l, ∀ r y, |t i * Real.sqrt (t i) * y| ≤ Real.pi → ‖A i r y‖ ≤
      C * (1+|c i+h i*(r:ℝ)|) * Real.exp (-(c i+h i*(r:ℝ))^2) * scaledMajorant r (t i) y)
    (hgap : ∀ᶠ i in l, ∀ r : ℕ, (r:ℝ)*t i < a → b ≤ t i*(c i+h i*(r:ℝ))^2)
    (hlim : ∀ᵐ p : ℝ × ℝ ∂(volume.prod volume),
      Tendsto (fun i => jointStep (h i) (c i) (t i) (A i) p) l (𝓝 (f p))) :
    Tendsto (fun i => ∫ y : ℝ, if |t i * Real.sqrt (t i) * y| ≤ Real.pi then
        (h i : ℂ) * ∑' r : ℕ, A i r y else 0)
      l (𝓝 (∫ p : ℝ × ℝ, f p ∂(volume.prod volume))) := by
  have ht := jointStep_dominated_convergence hC ha hb hdata hAm hA hgap hlim
  apply Tendsto.congr' ?_ ht
  filter_upwards [hdata, hAm, hA, hgap] with i hi hmi hAi hgi
  rcases hi with ⟨hhi, hh1i, hti, hsmalli⟩
  exact integral_jointStep hC ha hb hhi hh1i hti hsmalli (A i) hmi hAi hgi

end LineSize.Lattice
