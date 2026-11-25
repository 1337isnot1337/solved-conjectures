module

public import Conjectures.RossiPermutohedronAnalyticExpansions

@[expose] public section
namespace RossiPermutohedron
open Complex Filter
open scoped Topology

theorem rationalEulerian_inversion_zero {w : ℂ} (h0 : w≠0) (h1 : w≠1) :
    rationalEulerian 0 w⁻¹=-(rationalEulerian 0 w)-1 := by
  have h2 : 1-w≠0 := sub_ne_zero.mpr h1.symm
  have hI : w⁻¹≠1 := fun h => h1 (inv_eq_one.mp h)
  have h3 : 1-w⁻¹≠0 := sub_ne_zero.mpr hI.symm
  simp only [rationalEulerian_zero]
  field_simp
  ring

theorem rationalEulerian_inversion_step (n : ℕ) (c e : ℂ)
    (h : ∀ w : ℂ, w≠0 → w≠1 → rationalEulerian n w⁻¹=c*rationalEulerian n w+e)
    {w : ℂ} (h0 : w≠0) (h1 : w≠1) :
    rationalEulerian (n+1) w⁻¹ = -c*rationalEulerian (n+1) w := by
  have hI : w⁻¹≠1 := fun h => h1 (inv_eq_one.mp h)
  let A : ℂ → ℂ := fun z => (complexEulerian (n+1)).eval z/(1-z)^(n+2)
  have hl : HasDerivAt (fun z => rationalEulerian n z⁻¹) (A w⁻¹ * (-(w^2)⁻¹)) w := by
    exact (hasDerivAt_rationalEulerian n w⁻¹ hI).comp w
      (hasDerivAt_inv h0)
  have hr : HasDerivAt (fun z => c*rationalEulerian n z+e) (c*A w) w :=
    ((hasDerivAt_rationalEulerian n w h1).const_mul c).add_const e
  have H0 : ∀ᶠ z : ℂ in 𝓝 w,z≠0 :=
    (isClosed_singleton (x := (0:ℂ))).isOpen_compl.mem_nhds h0
  have H1 : ∀ᶠ z : ℂ in 𝓝 w,z≠1 :=
    (isClosed_singleton (x := (1:ℂ))).isOpen_compl.mem_nhds h1
  have he : (fun z => c*rationalEulerian n z+e) =ᶠ[𝓝 w]
      (fun z => rationalEulerian n z⁻¹) := by
    filter_upwards [H0,H1] with z hz hz1
    exact (h z hz hz1).symm
  have hd := (hl.congr_of_eventuallyEq he).unique hr
  have hprod := congrArg (fun v : ℂ => (-w)*v) hd
  have hh : (-w)*(A w⁻¹ * (-(w^2)⁻¹))=w⁻¹*A w⁻¹ := by
    field_simp
  rw [hh] at hprod
  change (w⁻¹*(complexEulerian (n+1)).eval w⁻¹/(1-w⁻¹)^(n+2))=
    -c*(w*(complexEulerian (n+1)).eval w/(1-w)^(n+2))
  simp only [mul_div_assoc]
  change w⁻¹*A w⁻¹ = _
  rw [hprod]
  change (-w)*(c*A w)= -c*(w*A w)
  ring

theorem rationalEulerian_inversion_succ (n : ℕ) {w : ℂ} (h0 : w≠0) (h1 : w≠1) :
    rationalEulerian (n+1) w⁻¹=(-1:ℂ)^n*rationalEulerian (n+1) w := by
  induction n generalizing w with
  | zero =>
    have hi := rationalEulerian_inversion_step 0 (-1) (-1) (by
      intro z hz hz1
      rw [rationalEulerian_inversion_zero hz hz1]
      ring) h0 h1
    simpa using hi
  | succ n ih =>
    have hi := rationalEulerian_inversion_step (n+1) ((-1)^n) 0 (by
      intro z hz hz1
      simpa only [add_zero] using ih hz hz1) h0 h1
    rw [pow_succ]
    simpa [mul_neg] using hi

theorem negativeExp_inv (x : ℝ) :
    (-(Real.exp (-x):ℂ))⁻¹=-(Real.exp x:ℂ) := by
  rw [inv_neg,← Complex.ofReal_inv,←Real.exp_neg,neg_neg]

theorem gridValue_reflection (n : ℕ) (x : ℝ) :
    gridValue (n+1) (-x)=(-1:ℝ)^n*(Real.exp x)^(n+1)*gridValue (n+1) x := by
  let q : ℂ := -(Real.exp (-x):ℂ)
  have hzero : q≠0 := by
    dsimp [q]
    exact neg_ne_zero.mpr (Complex.ofReal_ne_zero.mpr (Real.exp_pos _).ne')
  have hone : q≠1 := by
    intro h
    have hr := congrArg Complex.re h
    change -Real.exp (-x) = 1 at hr
    linarith [Real.exp_pos (-x)]
  have hi := rationalEulerian_inversion_succ n hzero hone
  change rationalEulerian (n+1) (-(Real.exp (-x):ℂ))⁻¹ =
    (-1:ℂ)^n*rationalEulerian (n+1) q at hi
  rw [negativeExp_inv] at hi
  have hre := congrArg (fun z : ℂ => (-z).re) hi
  have hr : (-(rationalEulerian (n+1) (-(Real.exp x:ℂ)))).re =
      (-1:ℝ)^n * (-(rationalEulerian (n+1) q)).re := by
    have he (z : ℂ) : -((-1:ℂ)^n*z) = (( (-1:ℝ)^n:ℝ):ℂ)*(-z) := by
      push_cast
      ring
    rw [he,Complex.mul_re] at hre
    simpa only [Complex.ofReal_re,Complex.ofReal_im,zero_mul,sub_zero] using hre
  rw [gridValue_eq_rationalEulerian (n+1) (-x), gridValue_eq_rationalEulerian (n+1) x, neg_neg,hr]
  have hE : Real.exp (-x)*Real.exp x=1 := by rw [←Real.exp_add,neg_add_cancel,Real.exp_zero]
  have hB : 1+Real.exp x = Real.exp x*(1+Real.exp (-x)) := by
    rw [mul_add,mul_one,mul_comm (Real.exp x) (Real.exp (-x)),hE,add_comm]
  have hfactor : Real.exp (-x)*(Real.exp x)^(n+1+2) =
      (Real.exp x)^(n+1)*Real.exp x := by
    rw [show n+1+2=((n+1)+1)+1 by omega, pow_succ (Real.exp x) ((n+1)+1)]
    calc
      _ = (Real.exp (-x)*Real.exp x)*(Real.exp x)^(n+1+1) := by ring
      _ = _ := by rw [hE,one_mul,pow_succ]
  rw [hB,mul_pow]
  simp only [←mul_assoc]
  rw [hfactor]
  dsimp [q]
  ring

end RossiPermutohedron
