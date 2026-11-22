module

public import Conjectures.AgnosticVC.OptimizerGradient
public import Mathlib.Analysis.Calculus.Deriv.Prod
public import Mathlib.Analysis.Calculus.InverseFunctionTheorem.ContDiff
public import Mathlib.Analysis.Normed.Module.FiniteDimension

@[expose] public section

open scoped BigOperators Topology
open Filter

namespace AgnosticVC

variable {α β κ : Type*} [Fintype α] [Fintype κ]
variable {γ : κ → Type*} [∀ j, Fintype (γ j)]

/-- The Hessian of the full and restricted negative entropy in mass coordinates. -/
noncomputable def entropyHessian (τ : ℝ) (coeff : κ → ℝ) (restriction : ∀ j, α → γ j)
    (p v : α → ℝ) (a : α) : ℝ :=
  τ * (v a / p a) + ∑ j, coeff j *
    (marginal (restriction j) v (restriction j a) / marginal (restriction j) p (restriction j a))

/-- The Hessian quadratic form is the sum of nonnegative full and restricted forms. -/
theorem entropyHessian_quadratic (τ : ℝ) (coeff : κ → ℝ)
    (restriction : ∀ j, α → γ j) (p v : α → ℝ) :
    expected v (entropyHessian τ coeff restriction p v) =
      τ * (∑ a, (v a)^2 / p a) + ∑ j, coeff j *
        (∑ b, (marginal (restriction j) v b)^2 / marginal (restriction j) p b) := by
  unfold expected entropyHessian
  simp only [mul_add, Finset.sum_add_distrib, Finset.mul_sum]
  rw [Finset.sum_comm (f := fun a j => v a * (coeff j *
    (marginal (restriction j) v (restriction j a) / marginal (restriction j) p (restriction j a))))]
  congr 1
  · exact Finset.sum_congr rfl fun a _ => by ring
  · refine Finset.sum_congr rfl fun j _ => ?_
    have h := marginal_weighted_sum (restriction j) v
      (fun b => marginal (restriction j) v b / marginal (restriction j) p b)
    have he (b : γ j) : marginal (restriction j) v b *
        (marginal (restriction j) v b / marginal (restriction j) p b) =
        (marginal (restriction j) v b)^2 / marginal (restriction j) p b := by ring
    simp only [he] at h
    calc
      _ = coeff j * (∑ a, v a * (marginal (restriction j) v (restriction j a) /
            marginal (restriction j) p (restriction j a))) := by
        rw [Finset.mul_sum]
        exact Finset.sum_congr rfl fun a _ => by ring
      _ = _ := by rw [← h, Finset.mul_sum]

theorem entropyHessian_lower {τ : ℝ} {coeff : κ → ℝ} (restriction : ∀ j, α → γ j)
    {p : α → ℝ} (hp : ∀ a, 0 ≤ p a) (hc : ∀ j, 0 ≤ coeff j) (v : α → ℝ) :
    τ * (∑ a, (v a)^2 / p a) ≤ expected v (entropyHessian τ coeff restriction p v) := by
  rw [entropyHessian_quadratic]
  exact le_add_of_nonneg_right (Finset.sum_nonneg fun j _ => mul_nonneg (hc j)
    (Finset.sum_nonneg fun b _ => div_nonneg (sq_nonneg _) (marginal_nonneg _ hp b)))

/-- The part of the derivative of a gradient supplied by changes in the objective. -/
noncomputable def gradientForcing (lossRate : α → ℝ) (coeffRate : κ → ℝ)
    (restriction : ∀ j, α → γ j) (p : α → ℝ) (a : α) : ℝ :=
  lossRate a + ∑ j, coeffRate j * (Real.log (marginal (restriction j) p (restriction j a)) + 1)

variable (loss lossRate : α → ℝ) (τ : ℝ) (coeff coeffRate : κ → ℝ)
variable (restriction : ∀ j, α → γ j)

/-- The stationarity map varies the parameter, multiplier and law simultaneously. -/
private noncomputable def stationarityMap (x : ℝ × ℝ × (α → ℝ)) : ℝ × ℝ × (α → ℝ) :=
  (x.1, ∑ a, x.2.2 a,
    fun a => objectiveGradient (fun a => loss a + x.1 * lossRate a) τ
      (fun j => coeff j + x.1 * coeffRate j) restriction x.2.2 a - x.2.1)

omit [∀ j, Fintype (γ j)] in
private theorem stationarityMap_contDiffAt (x : ℝ × ℝ × (α → ℝ))
    (hp : ∀ a, 0 < x.2.2 a) :
    ContDiffAt ℝ 1 (stationarityMap loss lossRate τ coeff coeffRate restriction) x := by
  classical
  apply ContDiffAt.prodMk (by fun_prop)
  apply ContDiffAt.prodMk (by fun_prop)
  rw [contDiffAt_pi]
  intro a
  unfold objectiveGradient
  have hlog : ContDiffAt ℝ 1 (fun y : ℝ × ℝ × (α → ℝ) => Real.log (y.2.2 a)) x :=
    (show ContDiffAt ℝ 1 (fun y : ℝ × ℝ × (α → ℝ) => y.2.2 a) x by fun_prop).log (hp a).ne'
  have hpart (j : κ) : ContDiffAt ℝ 1
      (fun y : ℝ × ℝ × (α → ℝ) =>
        Real.log (marginal (restriction j) y.2.2 (restriction j a))) x := by
    have hm : ContDiffAt ℝ 1 (fun y : ℝ × ℝ × (α → ℝ) =>
        marginal (restriction j) y.2.2 (restriction j a)) x := by
      unfold marginal
      fun_prop
    exact hm.log (marginal_pos (restriction j) hp a).ne'
  fun_prop

private theorem affineLine_deriv {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E] (x v : E) :
    HasDerivAt (fun t : ℝ => x + t • v) v 0 := by
  simpa using ((hasDerivAt_id (0 : ℝ)).smul_const v).const_add x

private theorem affineReal_deriv (x v : ℝ) : HasDerivAt (fun t : ℝ => x + t * v) v 0 :=
  affineLine_deriv x v

omit [∀ j, Fintype (γ j)] in
private theorem stationarityMap_line (x v : ℝ × ℝ × (α → ℝ)) (hp : ∀ a, 0 < x.2.2 a) :
    HasDerivAt (fun t : ℝ => stationarityMap loss lossRate τ coeff coeffRate restriction (x + t • v))
      (v.1, ∑ a, v.2.2 a,
        fun a => v.1 * gradientForcing lossRate coeffRate restriction x.2.2 a +
          entropyHessian τ (fun j => coeff j + x.1 * coeffRate j) restriction x.2.2 v.2.2 a - v.2.1) 0 := by
  apply HasDerivAt.prodMk (affineReal_deriv _ _)
  apply HasDerivAt.prodMk (HasDerivAt.fun_sum fun a _ => affineReal_deriv _ _)
  apply hasDerivAt_pi.mpr
  intro a
  simp only [objectiveGradient, Prod.fst_add, Prod.snd_add, Prod.smul_fst,
    Prod.smul_snd, smul_eq_mul, Pi.add_apply, Pi.smul_apply]
  have hl : HasDerivAt (fun t : ℝ => loss a + (x.1 + t * v.1) * lossRate a)
      (v.1 * lossRate a) 0 := ((affineReal_deriv _ _).mul_const _).const_add _
  have hf : HasDerivAt (fun t : ℝ => τ * (Real.log (x.2.2 a + t * v.2.2 a) + 1))
      (τ * (v.2.2 a / x.2.2 a)) 0 := by
    simpa only [zero_mul, add_zero] using
      (((affineReal_deriv (x.2.2 a) (v.2.2 a)).log (by simpa using (hp a).ne')).add_const 1).const_mul τ
  have hr (j : κ) : HasDerivAt (fun t : ℝ => (coeff j + (x.1 + t * v.1) * coeffRate j) *
      (Real.log (marginal (restriction j) (fun b => x.2.2 b + t * v.2.2 b) (restriction j a)) + 1))
      ((v.1 * coeffRate j) * (Real.log (marginal (restriction j) x.2.2 (restriction j a)) + 1) +
        (coeff j + x.1 * coeffRate j) * (marginal (restriction j) v.2.2 (restriction j a) /
          marginal (restriction j) x.2.2 (restriction j a))) 0 := by
    simp only [marginal_line]
    have hleft := ((affineReal_deriv x.1 v.1).mul_const (coeffRate j)).const_add (coeff j)
    have hright := ((affineReal_deriv (marginal (restriction j) x.2.2 (restriction j a))
      (marginal (restriction j) v.2.2 (restriction j a))).log
      (by simpa using (marginal_pos (restriction j) hp a).ne')).add_const 1
    convert hleft.mul hright using 1
    simp only [zero_mul, add_zero]
  refine (((hl.add hf).add (HasDerivAt.fun_sum fun j (_ : j ∈ Finset.univ) => hr j)).sub
    (affineReal_deriv x.2.1 v.2.1)).congr_deriv ?_
  unfold entropyHessian gradientForcing
  rw [mul_add, Finset.mul_sum, Finset.sum_add_distrib]
  have he : (∑ j, v.1 * (coeffRate j *
        (Real.log (marginal (restriction j) x.2.2 (restriction j a)) + 1))) =
      ∑ j, v.1 * coeffRate j * (Real.log (marginal (restriction j) x.2.2 (restriction j a)) + 1) :=
    Finset.sum_congr rfl fun j _ => (mul_assoc _ _ _).symm
  rw [he]
  ring

omit [∀ j, Fintype (γ j)] in
private theorem stationarityMap_fderiv (x v : ℝ × ℝ × (α → ℝ)) (hp : ∀ a, 0 < x.2.2 a) :
    fderiv ℝ (stationarityMap loss lossRate τ coeff coeffRate restriction) x v =
      (v.1, ∑ a, v.2.2 a,
        fun a => v.1 * gradientForcing lossRate coeffRate restriction x.2.2 a +
          entropyHessian τ (fun j => coeff j + x.1 * coeffRate j) restriction x.2.2 v.2.2 a - v.2.1) := by
  have hf := (stationarityMap_contDiffAt loss lossRate τ coeff coeffRate restriction x hp).differentiableAt
    (by norm_num)
  have hg : HasFDerivAt (stationarityMap loss lossRate τ coeff coeffRate restriction)
      (fderiv ℝ (stationarityMap loss lossRate τ coeff coeffRate restriction) x) (x + (0 : ℝ) • v) := by
    simpa only [zero_smul, add_zero] using hf.hasFDerivAt
  have hd := hg.comp_hasDerivAt 0 (affineLine_deriv x v)
  exact hd.unique (stationarityMap_line loss lossRate τ coeff coeffRate restriction x v hp)

private theorem stationarityMap_fderiv_injective [Nonempty α] (x : ℝ × ℝ × (α → ℝ))
    (hp : ∀ a, 0 < x.2.2 a) (hτ : 0 < τ) (hc : ∀ j, 0 ≤ coeff j + x.1 * coeffRate j) :
    Function.Injective (fderiv ℝ (stationarityMap loss lossRate τ coeff coeffRate restriction) x) := by
  let D := fderiv ℝ (stationarityMap loss lossRate τ coeff coeffRate restriction) x
  have hk (v : ℝ × ℝ × (α → ℝ)) (hv : D v = 0) : v = 0 := by
    rw [show D v = _ from stationarityMap_fderiv loss lossRate τ coeff coeffRate restriction x v hp] at hv
    have hparam : v.1 = 0 := congrArg Prod.fst hv
    have hsum : ∑ a, v.2.2 a = 0 := congrArg (fun y : ℝ × ℝ × (α → ℝ) => y.2.1) hv
    have hgrad (a : α) : entropyHessian τ (fun j => coeff j + x.1 * coeffRate j)
        restriction x.2.2 v.2.2 a = v.2.1 := by
      have h := congrArg (fun y : ℝ × ℝ × (α → ℝ) => y.2.2 a) hv
      simpa [hparam, sub_eq_zero] using h
    have hdot : expected v.2.2 (entropyHessian τ (fun j => coeff j + x.1 * coeffRate j)
        restriction x.2.2 v.2.2) = 0 := by
      simp [expected, hgrad, ← Finset.sum_mul, hsum]
    have hlow := entropyHessian_lower (τ := τ) restriction (fun a => (hp a).le) hc v.2.2
    rw [hdot] at hlow
    have hmass (a : α) : v.2.2 a = 0 := by
      have ha : (v.2.2 a)^2 / x.2.2 a ≤ ∑ b, (v.2.2 b)^2 / x.2.2 b :=
        Finset.single_le_sum (fun b _ => div_nonneg (sq_nonneg _) (hp b).le) (Finset.mem_univ a)
      have hz := ha.trans (nonpos_of_mul_nonpos_right hlow hτ)
      have hs : (v.2.2 a)^2 ≤ 0 := by
        rwa [div_le_iff₀ (hp a), zero_mul] at hz
      nlinarith
    have hmul : v.2.1 = 0 := by
      let a : α := Classical.choice inferInstance
      have hz := hgrad a
      rw [show v.2.2 = 0 from funext hmass] at hz
      simpa [entropyHessian, marginal] using hz.symm
    exact Prod.ext hparam (Prod.ext hmul (funext hmass))
  intro y z hyz
  apply sub_eq_zero.mp
  exact hk (y - z) (by rw [map_sub, hyz, sub_self])

private theorem optimizer_regularWithinAt [Nonempty α] {s : Set ℝ} {w : ℝ} (hw : w ∈ s)
    (hτ : 0 < τ) (hc : ∀ u ∈ s, ∀ j, 0 ≤ coeff j + u * coeffRate j) :
    let p := fun u => optimizer (fun a => loss a + u * lossRate a) τ
      (fun j => coeff j + u * coeffRate j) restriction
    ContDiffWithinAt ℝ 1 p s w ∧
    ∃ v : α → ℝ, ∃ c : ℝ, HasDerivWithinAt p v s w ∧ (∑ a, v a = 0) ∧
      ∀ a, entropyHessian τ (fun j => coeff j + w * coeffRate j) restriction (p w) v a +
        gradientForcing lossRate coeffRate restriction (p w) a = c := by
  intro p
  let lw := fun a => loss a + w * lossRate a
  let cw := fun j => coeff j + w * coeffRate j
  let a₀ : α := Classical.choice inferInstance
  let c := objectiveGradient lw τ cw restriction (p w) a₀
  let x : ℝ × ℝ × (α → ℝ) := (w, c, p w)
  let F := stationarityMap loss lossRate τ coeff coeffRate restriction
  let y := fun u : ℝ => (u, (1 : ℝ), (0 : α → ℝ))
  have hp : ∀ a, 0 < p w a := optimizer_pos lw restriction hτ (hc w hw)
  have hsum : ∑ a, p w a = 1 := (optimizer_isLaw lw τ cw restriction).2
  have hs (a : α) : objectiveGradient lw τ cw restriction (p w) a = c :=
    minimizer_gradient_constant (optimizer_isLaw lw τ cw restriction) hp
      (optimizer_min lw τ cw restriction) a a₀
  have hFx : F x = y w := by
    exact Prod.ext rfl (Prod.ext hsum (funext fun a => sub_eq_zero.mpr (hs a)))
  let D := fderiv ℝ F x
  have hDinj : Function.Injective D :=
    stationarityMap_fderiv_injective loss lossRate τ coeff coeffRate restriction x hp hτ (hc w hw)
  have hDsurj : Function.Surjective D :=
    LinearMap.surjective_of_injective (f := D.toLinearMap) hDinj
  let e := (LinearEquiv.ofBijective D.toLinearMap ⟨hDinj, hDsurj⟩).toContinuousLinearEquiv
  have hcd : ContDiffAt ℝ 1 F x :=
    stationarityMap_contDiffAt loss lossRate τ coeff coeffRate restriction x hp
  have hstrict : HasStrictFDerivAt F (e : (ℝ × ℝ × (α → ℝ)) →L[ℝ] _) x :=
    hcd.hasStrictFDerivAt' (hcd.differentiableAt (by norm_num)).hasFDerivAt (by norm_num)
  have hFd : HasFDerivAt F (e : (ℝ × ℝ × (α → ℝ)) →L[ℝ] _) x := hstrict.hasFDerivAt
  have hcdInv : ContDiffAt ℝ 1 (hstrict.localInverse F e x) (y w) := by
    rw [← hFx]
    exact hcd.to_localInverse hFd (by norm_num)
  let z := fun u => hstrict.localInverse F e x (y u)
  have hzw : z w = x := by
    dsimp [z]
    rw [← hFx]
    exact hstrict.localInverse_apply_image
  have hyD : HasDerivAt y (1, 0, 0) w :=
    (hasDerivAt_id w).prodMk ((hasDerivAt_const w (1 : ℝ)).prodMk (hasDerivAt_const w (0 : α → ℝ)))
  have hzD : HasDerivAt z (e.symm (1, 0, 0)) w :=
    (hFx ▸ hstrict.to_localInverse.hasFDerivAt).comp_hasDerivAt w hyD
  have heq : (fun u => (z u).2.2) =ᶠ[𝓝[s] w] p := by
    have hFz : ∀ᶠ u in 𝓝 w, F (z u) = y u := hyD.continuousAt.tendsto.eventually (hFx ▸ hstrict.eventually_right_inverse)
    have hpos : ∀ᶠ u in 𝓝 w, ∀ a, 0 < (z u).2.2 a := by
      rw [Filter.eventually_all]
      intro a
      have hcont : ContinuousAt (fun u => (z u).2.2 a) w := by
        exact (continuous_apply a).continuousAt.comp (hzD.continuousAt.snd.snd)
      apply hcont.eventually_const_lt
      change 0 < (z w).2.2 a
      rw [hzw]
      exact hp a
    filter_upwards [hFz.filter_mono nhdsWithin_le_nhds, hpos.filter_mono nhdsWithin_le_nhds,
      self_mem_nhdsWithin] with u hu hpu hus
    have hparam : (z u).1 = u := congrArg Prod.fst hu
    have htotal : ∑ a, (z u).2.2 a = 1 := congrArg (fun y : ℝ × ℝ × (α → ℝ) => y.2.1) hu
    have hgrad (a : α) : objectiveGradient (fun a => loss a + u * lossRate a) τ
        (fun j => coeff j + u * coeffRate j) restriction (z u).2.2 a = (z u).2.1 := by
      have h := congrArg (fun y : ℝ × ℝ × (α → ℝ) => y.2.2 a) hu
      change objectiveGradient (fun a => loss a + (z u).1 * lossRate a) τ
        (fun j => coeff j + (z u).1 * coeffRate j) restriction (z u).2.2 a - (z u).2.1 = 0 at h
      rw [hparam, sub_eq_zero] at h
      exact h
    have hzu : IsLaw (z u).2.2 := ⟨fun a => (hpu a).le, htotal⟩
    have hcu := hc u hus
    exact minimizer_unique hτ hcu hzu (optimizer_isLaw _ _ _ _)
      (minimizes_of_gradient_constant hτ.le hcu hzu hpu hgrad) (optimizer_min _ _ _ _)
  let u' := e.symm (1, 0, 0)
  let π := (ContinuousLinearMap.snd ℝ ℝ (α → ℝ)).comp
    (ContinuousLinearMap.snd ℝ ℝ (ℝ × (α → ℝ)))
  have hd : HasDerivAt (fun u => (z u).2.2) u'.2.2 w :=
    π.hasFDerivAt.comp_hasDerivAt w hzD
  have hlin : D u' = (1, 0, 0) := e.apply_symm_apply _
  rw [show D u' = _ from stationarityMap_fderiv loss lossRate τ coeff coeffRate restriction x u' hp] at hlin
  have hdir : u'.1 = 1 := congrArg Prod.fst hlin
  have hcy : ContDiffAt ℝ 1 y w := by dsimp [y]; fun_prop
  have hcz : ContDiffAt ℝ 1 z w := hcdInv.comp w hcy
  have hcp : ContDiffAt ℝ 1 (fun u => (z u).2.2) w := hcz.snd.snd
  refine ⟨hcp.contDiffWithinAt.congr_of_eventuallyEq_of_mem heq.symm hw,
    u'.2.2, u'.2.1, hd.hasDerivWithinAt.congr_of_eventuallyEq_of_mem heq.symm hw,
    congrArg (fun y : ℝ × ℝ × (α → ℝ) => y.2.1) hlin, ?_⟩
  intro a
  have h := congrArg (fun y : ℝ × ℝ × (α → ℝ) => y.2.2 a) hlin
  simpa [x, hdir, add_comm, sub_eq_zero] using h

/-- An affine path of losses and restriction weights has a differentiable interior optimizer.
The derivative satisfies the differentiated optimality equation. The set `s` can be a closed
interpolation interval, so coefficients may become zero at its endpoints. -/
theorem optimizer_hasDerivWithinAt [Nonempty α] {s : Set ℝ} {w : ℝ} (hw : w ∈ s)
    (hτ : 0 < τ) (hc : ∀ u ∈ s, ∀ j, 0 ≤ coeff j + u * coeffRate j) :
    let p := fun u => optimizer (fun a => loss a + u * lossRate a) τ
      (fun j => coeff j + u * coeffRate j) restriction
    ∃ v : α → ℝ, ∃ c : ℝ, HasDerivWithinAt p v s w ∧ (∑ a, v a = 0) ∧
      ∀ a, entropyHessian τ (fun j => coeff j + w * coeffRate j) restriction (p w) v a +
        gradientForcing lossRate coeffRate restriction (p w) a = c :=
  (optimizer_regularWithinAt loss lossRate τ coeff coeffRate restriction hw hτ hc).2

/-- The optimizer varies continuously differentiably along every admissible affine path. -/
theorem optimizer_contDiffOn [Nonempty α] {s : Set ℝ} (hτ : 0 < τ)
    (hc : ∀ u ∈ s, ∀ j, 0 ≤ coeff j + u * coeffRate j) :
    ContDiffOn ℝ 1 (fun u => optimizer (fun a => loss a + u * lossRate a) τ
      (fun j => coeff j + u * coeffRate j) restriction) s :=
  fun _ hw => (optimizer_regularWithinAt loss lossRate τ coeff coeffRate restriction hw hτ hc).1

end AgnosticVC
