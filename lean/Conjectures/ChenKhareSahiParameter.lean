import Conjectures.ChenKhareSahiHall

namespace ChenKhareSahi

noncomputable def cA (q t : ℝ) : ℝ := (q+1)*(t-1)/(q*t-1)
noncomputable def cC (q t : ℝ) : ℝ :=
  (q+1)*(t-1)*(2*q^3*t^2-q^3*t+q^2*t^2-q^2*t-q^2+q*t^2+q*t-q+t-2)/((q*t-1)*(q^3*t^2-1))
noncomputable def cD (q t : ℝ) : ℝ :=
  (t-1)*(3*q^6*t^4-q^6*t^3+q^6*t^2+4*q^5*t^4-6*q^5*t^3-2*q^5*t^2+q^5*t+
    5*q^4*t^4-7*q^4*t^2+4*q^4*t+q^4+2*q^3*t^4+2*q^3*t^3-14*q^3*t^2+2*q^3*t+2*q^3+
    q^2*t^4+4*q^2*t^3-7*q^2*t^2+5*q^2+q*t^3-2*q*t^2-6*q*t+4*q+t^2-t+3)/
    ((q*t-1)^2*(q*t+1)*(q^3*t^2-1))
noncomputable def cE (q t : ℝ) : ℝ := (t-1)*(q^2+q+1)/(q^2*t-1)
noncomputable def cF (q t : ℝ) : ℝ := (q+1)*(t-1)^2*(q^2+q+1)/((q*t-1)*(q^2*t-1))

noncomputable def paramP420 (q t : ℝ) : SymFun := candidate420 (cA q t) (cA q t) (cC q t) (cD q t)
noncomputable def paramP411 (q t : ℝ) : SymFun := candidate411 (cE q t) (cF q t)

theorem paramP420_zero (t : ℝ) : paramP420 0 t = HL420 t := by
  funext x y z
  norm_num [paramP420, candidate420, cA, cC, cD, HL420]
  ring

theorem paramP411_zero (t : ℝ) : paramP411 0 t = HL411 t := by
  funext x y z
  norm_num [paramP411, candidate411, cE, cF, HL411]
  ring

theorem param_diff_homogeneous (q t u x y z : ℝ) :
    (paramP420 q t (u*x) (u*y) (u*z) / paramP420 q t 1 1 1 -
      paramP411 q t (u*x) (u*y) (u*z) / paramP411 q t 1 1 1) =
    u^6 * (paramP420 q t x y z / paramP420 q t 1 1 1 - paramP411 q t x y z / paramP411 q t 1 1 1) := by
  simp only [paramP420, paramP411, candidate420, candidate411, realMonomial_homogeneous]
  norm_num
  ring


@[fun_prop] theorem cA_cont (t : ℝ) : ContinuousAt (fun q => cA q t) 0 := by
  unfold cA
  fun_prop (disch := norm_num)

@[fun_prop] theorem cC_cont (t : ℝ) : ContinuousAt (fun q => cC q t) 0 := by
  unfold cC
  fun_prop (disch := norm_num)

@[fun_prop] theorem cD_cont (t : ℝ) : ContinuousAt (fun q => cD q t) 0 := by
  unfold cD
  fun_prop (disch := norm_num)

@[fun_prop] theorem cE_cont (t : ℝ) : ContinuousAt (fun q => cE q t) 0 := by
  unfold cE
  fun_prop (disch := norm_num)

@[fun_prop] theorem cF_cont (t : ℝ) : ContinuousAt (fun q => cF q t) 0 := by
  unfold cF
  fun_prop (disch := norm_num)

theorem paramP420_cont (t x y z : ℝ) : ContinuousAt (fun q => paramP420 q t x y z) 0 := by
  unfold paramP420 candidate420
  fun_prop (disch := first | exact cA_cont t | exact cC_cont t | exact cD_cont t)

theorem paramP411_cont (t x y z : ℝ) : ContinuousAt (fun q => paramP411 q t x y z) 0 := by
  unfold paramP411 candidate411
  fun_prop (disch := first | exact cE_cont t | exact cF_cont t)


noncomputable def paramDiff (q t : ℝ) : SymFun := fun x y z =>
    paramP420 q t x y z / paramP420 q t 1 1 1 - paramP411 q t x y z / paramP411 q t 1 1 1

theorem paramDiff_cont (t : ℝ) (ht : t < 1) (x y z : ℝ) :
    ContinuousAt (fun q => paramDiff q t x y z) 0 := by
  have ha : paramP420 0 t 1 1 1 ≠ 0 := by
    rw [paramP420_zero, (HL_values t).1]
    exact ne_of_gt (HL_A_pos t ht)
  have hb : paramP411 0 t 1 1 1 ≠ 0 := by
    rw [paramP411_zero, (HL_values t).2]
    exact ne_of_gt (HL_B_pos t ht)
  unfold paramDiff
  exact ((paramP420_cont t x y z).div (paramP420_cont t 1 1 1) ha).sub
    ((paramP411_cont t x y z).div (paramP411_cont t 1 1 1) hb)

theorem paramSep_cont (t : ℝ) (ht : t < 1) : ContinuousAt (fun q => realSep (paramDiff q t)) 0 := by
  have hc (x y z : ℝ) := paramDiff_cont t ht x y z
  unfold realSep
  fun_prop

theorem param_nonmembership (t : ℝ) (ht0 : 3/4 ≤ t) (ht1 : t < 1) :
    ∃ ε > 0, ∀ q, 0 < q → q < ε → ¬ FullSemiring (paramDiff q t) := by
  apply HL_continuous_transfer t ht0 ht1 (fun q => paramDiff q t)
  · funext x y z
    simp only [paramDiff, paramP420_zero, paramP411_zero]
  · exact paramSep_cont t ht1
  · intro q u x y z
    exact param_diff_homogeneous q t u x y z


noncomputable def paramOperator (q t : ℝ) (f : SymFun) (x y z : ℝ) : ℝ :=
  (y-z)*(t*x-y)*(t*x-z)*f (q*x) y z -
  (x-z)*(t*y-x)*(t*y-z)*f x (q*y) z +
  (x-y)*(t*z-x)*(t*z-y)*f x y (q*z)

set_option maxRecDepth 4096 in
set_option maxHeartbeats 3000000 in
theorem paramP411_eigen (q t x y z : ℝ) (h1 : q*t-1 ≠ 0) (h2 : q^2*t-1 ≠ 0) :
    paramOperator q t (paramP411 q t) x y z = (q^4*t^2+q*t+q) * realDelta x y z * paramP411 q t x y z := by
  have h1' : t*q-1 ≠ 0 := by simpa [mul_comm] using h1
  have h2' : t*q^2-1 ≠ 0 := by simpa [mul_comm] using h2
  unfold paramOperator paramP411 candidate411 cE cF realDelta
  field_simp [h1', h2']
  norm_num [realMonomial, realM_average, orbit]
  all_goals ring


set_option maxRecDepth 8192 in
set_option maxHeartbeats 6000000 in
theorem paramP420_eigen (q t x y z : ℝ) (h1 : q*t-1 ≠ 0) (h2 : q*t+1 ≠ 0) (h3 : q^3*t^2-1 ≠ 0) :
    paramOperator q t (paramP420 q t) x y z = (q^4*t^2+q^2*t+1) * realDelta x y z * paramP420 q t x y z := by
  have h1' : t*q-1 ≠ 0 := by simpa [mul_comm] using h1
  have h2' : t*q+1 ≠ 0 := by simpa [mul_comm] using h2
  have h3' : t^2*q^3-1 ≠ 0 := by simpa [mul_comm] using h3
  unfold paramOperator paramP420 candidate420 cA cC cD realDelta
  field_simp [h1',h2',h3']
  norm_num [realMonomial, realM_average, orbit]
  all_goals ring

end ChenKhareSahi
