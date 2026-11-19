import Conjectures.LineSizeAnalyticProfileIntegral

/-! Exact evaluation at the saddle, using the self-inverse graph identity.
The total integral and both endpoint limits are proved in the import closure. -/
namespace LineSize.Profile

open Real Set Filter MeasureTheory
open scoped Topology

noncomputable def symmetricArea (u : ℝ) : ℝ := I u+I (f u)-u*f u

theorem hasDerivAt_symmetricArea {u : ℝ} (hu : 0<u) :
    HasDerivAt symmetricArea 0 u := by
  have hf := hasDerivAt_f hu
  have hi := hasDerivAt_I hu
  have hif := (hasDerivAt_I (f_pos hu)).comp u hf
  have hp := (hasDerivAt_id u).mul hf
  convert (hi.add hif).sub hp using 1
  · rfl
  · rw [f_involution hu]
    simp only [id_eq]
    ring

theorem symmetricArea_const {u v : ℝ} (hu : 0<u) (hv : 0<v) :
    symmetricArea u=symmetricArea v := by
  apply isOpen_Ioi.is_const_of_deriv_eq_zero (convex_Ioi (0:ℝ)).isPreconnected
    ?_ ?_ hu hv
  · intro x hx
    exact (hasDerivAt_symmetricArea hx).differentiableAt.differentiableWithinAt
  · intro x hx
    exact (hasDerivAt_symmetricArea hx).deriv

theorem tendsto_symmetricArea_atTop :
    Tendsto symmetricArea atTop (𝓝 (Real.pi^2/6)) := by
  have hf : Tendsto f atTop (𝓝[Ici 0] 0) := by
    apply tendsto_nhdsWithin_iff.mpr
    refine ⟨tendsto_f_atTop,?_⟩
    filter_upwards [eventually_gt_atTop 0] with x hx
    exact (f_pos hx).le
  have hzero : Tendsto I (𝓝[Ici 0] 0) (𝓝 0) := by
    have h := continuousWithinAt_I_zero
    change Tendsto I (𝓝[Ici 0] 0) (𝓝 (I 0)) at h
    simpa only [I_zero] using h
  have hif : Tendsto (fun x : ℝ => I (f x)) atTop (𝓝 0) := hzero.comp hf
  change Tendsto (fun x : ℝ => I x+I (f x)-x*f x) atTop (𝓝 (Real.pi^2/6))
  simpa only [add_zero,sub_zero] using
    (tendsto_I_atTop.add hif).sub tendsto_mul_f_atTop

theorem symmetricArea_eq_total {u : ℝ} (hu : 0<u) :
    symmetricArea u=Real.pi^2/6 := by
  have he : symmetricArea =ᶠ[atTop] (fun _ : ℝ => symmetricArea u) := by
    filter_upwards [eventually_gt_atTop 0] with x hx
    exact symmetricArea_const hx hu
  have hc : Tendsto symmetricArea atTop (𝓝 (symmetricArea u)) :=
    tendsto_const_nhds.congr' he.symm
  exact tendsto_nhds_unique hc tendsto_symmetricArea_atTop

theorem I_u0 : I u0=A := by
  have h := symmetricArea_eq_total u0_pos
  simp only [symmetricArea,f_u0] at h
  unfold A u0 at *
  nlinarith

theorem Phi_u0 : Phi u0=A := by
  rw [Phi,I_u0]
  unfold u0
  ring

theorem A_pos : 0<A := by
  unfold A
  positivity

end LineSize.Profile

/-! Derivatives, the unique critical point, and the global Gaussian phase
bound. The latter follows from the tangent bound for the integral of the
decreasing function `f`, including the endpoint zero. -/
namespace LineSize.Profile

open Real Set Filter MeasureTheory
open scoped Topology

theorem hasDerivAt_Phi {u : ℝ} (hu : 0<u) : HasDerivAt Phi (PhiPrime u) u := by
  have hl := (hasDerivAt_id u).mul_const (Real.log 2)
  have hq := (hasDerivAt_id u).pow 2
  convert (hl.sub hq).add (hasDerivAt_I hu) using 1
  · rfl
  · simp only [PhiPrime,Nat.cast_ofNat,pow_one,mul_one,id_eq]
    ring

theorem deriv_Phi {u : ℝ} (hu : 0<u) : deriv Phi u=PhiPrime u :=
  (hasDerivAt_Phi hu).deriv

theorem hasDerivAt_PhiPrime {u : ℝ} (hu : 0<u) :
    HasDerivAt PhiPrime (-2-1/(Real.exp u-1)) u := by
  have h := ((hasDerivAt_const u (Real.log 2)).sub
    ((hasDerivAt_id u).const_mul 2)).add (hasDerivAt_f hu)
  convert h using 1
  · rfl
  · ring

theorem hasDerivAt_deriv_Phi {u : ℝ} (hu : 0<u) :
    HasDerivAt (deriv Phi) (-2-1/(Real.exp u-1)) u := by
  apply (hasDerivAt_PhiPrime hu).congr_of_eventuallyEq
  filter_upwards [isOpen_Ioi.mem_nhds hu] with x hx
  exact deriv_Phi hx

theorem deriv2_Phi {u : ℝ} (hu : 0<u) :
    deriv (deriv Phi) u = -2-1/(Real.exp u-1) :=
  (hasDerivAt_deriv_Phi hu).deriv

theorem deriv2_Phi_le {u : ℝ} (hu : 0<u) : deriv (deriv Phi) u≤-2 := by
  rw [deriv2_Phi hu]
  have hp : 0≤1/(Real.exp u-1) := div_nonneg (by norm_num) (exp_sub_one_pos hu).le
  linarith

theorem strictConcaveOn_Phi : StrictConcaveOn ℝ (Ioi 0) Phi := by
  apply strictConcaveOn_of_deriv2_neg' (convex_Ioi 0)
    (fun x hx => (hasDerivAt_Phi hx).continuousAt.continuousWithinAt)
  intro x hx
  change deriv (deriv Phi) x<0
  have h := deriv2_Phi_le hx
  linarith

theorem PhiPrime_u0 : PhiPrime u0=0 := by
  rw [PhiPrime,f_u0]
  unfold u0
  ring

theorem PhiPrime_strictAntiOn : StrictAntiOn PhiPrime (Ioi 0) := by
  intro x hx y hy hxy
  have h := f_strictAntiOn hx hy hxy
  unfold PhiPrime
  linarith

theorem critical_iff {u : ℝ} (hu : 0<u) : deriv Phi u=0 ↔ u=u0 := by
  rw [deriv_Phi hu]
  constructor
  · intro h
    rcases lt_trichotomy u u0 with hlt | heq | hgt
    · have hi := PhiPrime_strictAntiOn hu u0_pos hlt
      rw [PhiPrime_u0,h] at hi
      exact False.elim (lt_irrefl 0 hi)
    · exact heq
    · have hi := PhiPrime_strictAntiOn u0_pos hu hgt
      rw [PhiPrime_u0,h] at hi
      exact False.elim (lt_irrefl 0 hi)
  · rintro rfl
    exact PhiPrime_u0

noncomputable def h : ℝ := -deriv (deriv Phi) u0

theorem h_eq_three : h=3 := by
  rw [h,deriv2_Phi u0_pos,exp_u0]
  norm_num

theorem h_pos : 0<h := by rw [h_eq_three]; norm_num

theorem I_le_tangent {u : ℝ} (hu : 0≤u) :
    I u≤I u0+(u-u0)*u0 := by
  rcases le_total u0 u with hleft | hright
  · have hseg : IntervalIntegrable f volume u0 u :=
      (intervalIntegrable_f u0_pos.le).symm.trans (intervalIntegrable_f hu)
    have hadd := intervalIntegral.integral_add_adjacent_intervals
      (intervalIntegrable_f u0_pos.le) hseg
    have hle := intervalIntegral.integral_mono_on_of_le_Ioo hleft hseg
      (intervalIntegrable_const (c:=u0)) (fun x hx => by
        have hi := (f_strictAntiOn u0_pos (u0_pos.trans hx.1) hx.1).le
        simpa only [f_u0] using hi)
    change I u0+(∫ x in u0..u, f x)=I u at hadd
    simp only [intervalIntegral.integral_const,smul_eq_mul] at hle
    linarith
  · have hseg : IntervalIntegrable f volume u u0 :=
      (intervalIntegrable_f hu).symm.trans (intervalIntegrable_f u0_pos.le)
    have hadd := intervalIntegral.integral_add_adjacent_intervals
      (intervalIntegrable_f hu) hseg
    have hle := intervalIntegral.integral_mono_on_of_le_Ioo hright
      (intervalIntegrable_const (c:=u0)) hseg (fun x hx => by
        have hi := (f_strictAntiOn (hu.trans_lt hx.1) u0_pos hx.2).le
        simpa only [f_u0] using hi)
    change I u+(∫ x in u..u0, f x)=I u0 at hadd
    simp only [intervalIntegral.integral_const,smul_eq_mul] at hle
    nlinarith

theorem Phi_le_gaussian {u : ℝ} (hu : 0≤u) : Phi u≤A-(u-u0)^2 := by
  have hi := I_le_tangent hu
  rw [I_u0] at hi
  unfold Phi u0 at *
  nlinarith

theorem Phi_lt_A {u : ℝ} (hu : 0≤u) (hne : u≠u0) : Phi u<A := by
  have hb := Phi_le_gaussian hu
  have hp : 0<(u-u0)^2 := sq_pos_of_ne_zero (sub_ne_zero.mpr hne)
  linarith

end LineSize.Profile

/-! Mean and variance identities from integration by parts with proved
endpoint limits. All identities concern the literal integral definitions. -/
namespace LineSize.Profile

open Real Set Filter MeasureTheory
open scoped Topology

noncomputable def meanIntegral (u : ℝ) : ℝ := ∫ x in 0..u, meanKernel x

@[simp] theorem meanIntegral_zero : meanIntegral 0=0 := by simp [meanIntegral]

theorem hasDerivAt_meanIntegral {u : ℝ} (hu : 0<u) :
    HasDerivAt meanIntegral (meanKernel u) u := by
  exact intervalIntegral.integral_hasDerivAt_right (intervalIntegrable_meanKernel hu.le)
    measurable_meanKernel.stronglyMeasurable.stronglyMeasurableAtFilter
    (continuousAt_meanKernel hu)

theorem tendsto_meanIntegral_zero : Tendsto meanIntegral (𝓝[>] 0) (𝓝 0) := by
  have hc := intervalIntegral.continuousWithinAt_primitive
    (f:=meanKernel) (a:=0) (b₁:=0) (b₂:=1) (b₀:=0) (μ:=volume)
    (by simp) (by simpa using intervalIntegrable_meanKernel (u:=1) (by norm_num))
  change Tendsto meanIntegral (𝓝[Icc 0 1] 0) (𝓝 (meanIntegral 0)) at hc
  rw [nhdsWithin_Icc_eq_nhdsGE (by norm_num : (0:ℝ)<1),meanIntegral_zero] at hc
  exact hc.mono_left (nhdsWithin_mono _ Ioi_subset_Ici_self)

theorem hasDerivAt_M {u : ℝ} (hu : 0<u) :
    HasDerivAt M (2*u+meanKernel u) u := by
  convert ((hasDerivAt_id u).pow 2).add (hasDerivAt_meanIntegral hu) using 1
  · rfl
  · simp

theorem deriv_M {u : ℝ} (hu : 0<u) : deriv M u=2*u+meanKernel u :=
  (hasDerivAt_M hu).deriv

theorem hasDerivAt_I_sub_mul_f {u : ℝ} (hu : 0<u) :
    HasDerivAt (fun x : ℝ => I x-x*f x) (meanKernel u) u := by
  convert (hasDerivAt_I hu).sub ((hasDerivAt_id u).mul (hasDerivAt_f hu)) using 1
  · rfl
  · simp only [meanKernel,id_eq]
    ring

theorem meanIntegral_eq_I_sub_mul_f {u : ℝ} (hu : 0<u) :
    meanIntegral u=I u-u*f u := by
  have hzero : Tendsto (fun x : ℝ => I x-x*f x) (𝓝[>] 0) (𝓝 0) := by
    simpa only [sub_zero] using tendsto_I_zero.sub tendsto_mul_f_zero
  have hupper := (hasDerivAt_I_sub_mul_f hu).continuousAt.tendsto.mono_left
    (show 𝓝[<] u≤𝓝 u from nhdsWithin_le_nhds)
  have hi := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_tendsto hu
    (fun x hx => hasDerivAt_I_sub_mul_f hx.1)
    (intervalIntegrable_meanKernel hu.le) hzero hupper
  simpa only [sub_zero,meanIntegral] using hi

theorem M_eq_Phi_sub_mul_deriv {u : ℝ} (hu : 0≤u) : M u=Phi u-u*deriv Phi u := by
  rcases eq_or_lt_of_le hu with rfl | hu
  · simp
  · rw [deriv_Phi hu]
    change u^2+meanIntegral u=Phi u-u*PhiPrime u
    rw [meanIntegral_eq_I_sub_mul_f hu]
    unfold Phi PhiPrime
    ring

theorem M_u0 : M u0=A := by
  rw [M_eq_Phi_sub_mul_deriv u0_pos.le,Phi_u0,deriv_Phi u0_pos,PhiPrime_u0]
  ring

theorem deriv_M_u0 : deriv M u0=3*u0 := by
  rw [deriv_M u0_pos,meanKernel,exp_u0]
  ring

theorem hasDerivAt_mul_meanKernel {u : ℝ} (hu : 0<u) :
    HasDerivAt (fun x : ℝ => x*meanKernel x)
      (2*meanKernel u-varianceKernel u) u := by
  have hd := ne_of_gt (exp_sub_one_pos hu)
  have hh := ((hasDerivAt_id u).pow 2).div
    ((Real.hasDerivAt_exp u).sub_const 1) hd
  convert hh using 1
  · funext x
    change x*(x/(Real.exp x-1))=x^2/(Real.exp x-1)
    ring
  · simp only [Nat.cast_ofNat,pow_one,mul_one,id_eq,Pi.pow_apply]
    unfold meanKernel varianceKernel
    field_simp
    <;> ring

theorem tendsto_mul_meanKernel_zero :
    Tendsto (fun x : ℝ => x*meanKernel x) (𝓝[>] 0) (𝓝 0) := by
  have hid : Tendsto (fun x : ℝ => x) (𝓝[>] 0) (𝓝 0) :=
    continuousWithinAt_id
  apply squeeze_zero' _ _ hid
  · filter_upwards [self_mem_nhdsWithin] with x hx
    exact mul_nonneg hx.le (meanKernel_nonneg hx.le)
  · filter_upwards [self_mem_nhdsWithin] with x hx
    simpa only [mul_one] using mul_le_mul_of_nonneg_left (meanKernel_le_one hx.le) hx.le

theorem hasDerivAt_variancePrimitive {u : ℝ} (hu : 0<u) :
    HasDerivAt (fun x : ℝ => 2*meanIntegral x-x*meanKernel x) (varianceKernel u) u := by
  convert ((hasDerivAt_meanIntegral hu).const_mul 2).sub
    (hasDerivAt_mul_meanKernel hu) using 1
  ring

theorem V_eq_two_meanIntegral_sub {u : ℝ} (hu : 0<u) :
    V u=2*meanIntegral u-u*meanKernel u := by
  have hzero : Tendsto (fun x : ℝ => 2*meanIntegral x-x*meanKernel x)
      (𝓝[>] 0) (𝓝 0) := by
    simpa only [mul_zero,sub_zero] using
      (tendsto_meanIntegral_zero.const_mul 2).sub tendsto_mul_meanKernel_zero
  have hupper := (hasDerivAt_variancePrimitive hu).continuousAt.tendsto.mono_left
    (show 𝓝[<] u≤𝓝 u from nhdsWithin_le_nhds)
  have hi := intervalIntegral.integral_eq_sub_of_hasDerivAt_of_tendsto hu
    (fun x hx => hasDerivAt_variancePrimitive hx.1)
    (intervalIntegrable_varianceKernel hu.le) hzero hupper
  simpa only [sub_zero,V] using hi

theorem V_eq_two_M_sub_mul_deriv {u : ℝ} (hu : 0≤u) : V u=2*M u-u*deriv M u := by
  rcases eq_or_lt_of_le hu with rfl | hu
  · simp
  · rw [V_eq_two_meanIntegral_sub hu,deriv_M hu]
    change 2*meanIntegral u-u*meanKernel u=
      2*(u^2+meanIntegral u)-u*(2*u+meanKernel u)
    ring

theorem V_u0 : V u0=2*A-3*u0^2 := by
  rw [V_eq_two_M_sub_mul_deriv u0_pos.le,M_u0,deriv_M_u0]
  ring

noncomputable def V0 : ℝ := V u0

theorem V0_eq : V0=2*A-3*u0^2 := V_u0

theorem V0_pos : 0<V0 := V_pos u0_pos

theorem variance_constant_pos : 0<2*A-3*u0^2 := by
  rw [← V_u0]
  exact V_pos u0_pos

theorem saddle_variance_identity : h*V u0+(deriv M u0)^2=2*A*h := by
  rw [h_eq_three,V_u0,deriv_M_u0]
  ring

theorem mixed_variance_identity : V u0+(deriv M u0)^2/h=2*A := by
  rw [h_eq_three,V_u0,deriv_M_u0]
  ring

end LineSize.Profile

/-! Fully discharged elementary saddle-profile identities. The subsequent
Euler-product approximation and local coefficient limit are separate claims. -/
namespace LineSize.Profile

/-- Exact saddle value, unique critical point, curvature, and the mean and
variance constants for the literal functions in the line-size argument. -/
theorem saddle_profile_exact :
    Phi u0=A ∧ (∀ u : ℝ, 0<u → (deriv Phi u=0 ↔ u=u0)) ∧ h=3 ∧
      M u0=A ∧ deriv M u0=3*u0 ∧ V u0=2*A-3*u0^2 ∧ 0<V u0 :=
  ⟨Phi_u0,fun _ hu => critical_iff hu,h_eq_three,M_u0,deriv_M_u0,V_u0,V_pos u0_pos⟩

#print axioms saddle_profile_exact
#print axioms Phi_le_gaussian
#print axioms M_eq_Phi_sub_mul_deriv
#print axioms V_eq_two_M_sub_mul_deriv

end LineSize.Profile
