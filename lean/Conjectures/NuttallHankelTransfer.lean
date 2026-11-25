module

public import Conjectures.NuttallHankelAdjacent
import all Conjectures.NuttallHankelPolynomial
public import Conjectures.NuttallThetaTermSeries
import all Conjectures.NuttallThetaTermDerivatives
public import Mathlib.Analysis.SpecialFunctions.Exp

public section
namespace NuttallCumulants
open Filter Polynomial
open scoped Topology BigOperators

noncomputable def firstHankelScale (t : ℝ) : ℝ := Real.pi * Real.exp (4*t)

theorem firstHankelScale_pos (t : ℝ) : 0 < firstHankelScale t := by
  unfold firstHankelScale
  exact mul_pos Real.pi_pos (Real.exp_pos _)

theorem firstHankelScale_tendsto : Tendsto firstHankelScale atTop atTop :=
  (Real.tendsto_exp_atTop.comp (tendsto_id.const_mul_atTop
    (by norm_num : (0:ℝ) < 4))).const_mul_atTop Real.pi_pos

/-- A function that vanishes faster than every inverse scale power. -/
def HankelFlat (f : ℝ → ℝ) : Prop :=
  ∀ k : ℕ, Tendsto (fun t => f t * firstHankelScale t ^ k) atTop (𝓝 0)

theorem hankelFlat_zero : HankelFlat (fun _ => 0) := by
  intro k
  simpa only [zero_mul] using (tendsto_const_nhds (x := (0:ℝ)) :
    Tendsto (fun _ : ℝ => (0:ℝ)) atTop (𝓝 0))

theorem HankelFlat.add {f g : ℝ → ℝ} (hf : HankelFlat f) (hg : HankelFlat g) :
    HankelFlat (fun t => f t + g t) := by
  intro k
  simpa only [← add_mul, zero_add] using (hf k).add (hg k)

theorem HankelFlat.mul {f g : ℝ → ℝ} (hf : HankelFlat f) (hg : HankelFlat g) :
    HankelFlat (fun t => f t * g t) := by
  intro k
  have h : Tendsto f atTop (𝓝 (0:ℝ)) := by simpa only [pow_zero, mul_one] using hf 0
  simpa only [mul_assoc, zero_mul] using h.mul (hg k)

theorem HankelFlat.mul_poly {f : ℝ → ℝ} (hf : HankelFlat f) (P : ℝ[X]) :
    HankelFlat (fun t => f t * P.eval (firstHankelScale t)) := by
  induction P using Polynomial.induction_on' with
  | add P Q hP hQ => simpa only [eval_add, mul_add] using hP.add hQ
  | monomial n a =>
    intro k
    convert (hf (n+k)).const_mul a using 1
    · funext t
      simp only [eval_monomial, pow_add]
      ring
    · simp

theorem hankelFlat_of_exp_bound {f : ℝ → ℝ} {C : ℝ}
    (h : ∀ t : ℝ, 0 ≤ t → |f t| ≤ C * Real.exp (-firstHankelScale t)) :
    HankelFlat f := by
  intro k
  have h0 := (Real.tendsto_pow_mul_exp_neg_atTop_nhds_zero k).comp firstHankelScale_tendsto
  have hC0 : Tendsto (fun t => C * (firstHankelScale t ^ k * Real.exp (-firstHankelScale t)))
      atTop (𝓝 0) := by simpa only [Function.comp_apply, mul_zero] using h0.const_mul C
  apply squeeze_zero_norm' _ hC0
  filter_upwards [eventually_ge_atTop (0:ℝ)] with t ht
  rw [Real.norm_eq_abs, abs_mul, abs_of_pos (pow_pos (firstHankelScale_pos _) _)]
  calc
    _ ≤ (C * Real.exp (-firstHankelScale t)) * firstHankelScale t ^ k :=
      mul_le_mul_of_nonneg_right (h t ht) (pow_nonneg (firstHankelScale_pos _).le _)
    _ = _ := by ring

noncomputable def firstHankelEnvelope (t : ℝ) : ℝ :=
  Real.exp (t - firstHankelScale t)

theorem firstHankelEnvelope_pos (t : ℝ) : 0 < firstHankelEnvelope t := Real.exp_pos _

noncomputable def normalizedThetaDerivative (j : ℕ) (t : ℝ) : ℝ :=
  iteratedDeriv j thetaKernel t / firstHankelEnvelope t

theorem thetaTerm_zero_derivative_envelope (j : ℕ) (t : ℝ) :
    iteratedDeriv j (fun x => thetaTerm x 0) t =
      firstHankelEnvelope t * (modePolynomials j).eval (firstHankelScale t) := by
  have hscale : thetaModeScale 0 t = firstHankelScale t := by
    simp [thetaModeScale, firstHankelScale]
  rw [iteratedDeriv_thetaTerm]
  unfold modeCore firstHankelEnvelope
  rw [hscale, sub_eq_add_neg, Real.exp_add]

theorem normalizedThetaDerivative_flat (j : ℕ) :
    HankelFlat (fun t => normalizedThetaDerivative j t -
      (modePolynomials j).eval (firstHankelScale t)) := by
  obtain ⟨C, _, h⟩ := thetaKernel_iteratedDeriv_first_mode_error j
  apply hankelFlat_of_exp_bound (C := C)
  intro t ht
  have he := firstHankelEnvelope_pos t
  have hEq : normalizedThetaDerivative j t - (modePolynomials j).eval (firstHankelScale t) =
      (iteratedDeriv j thetaKernel t - iteratedDeriv j (fun x => thetaTerm x 0) t) /
        firstHankelEnvelope t := by
    rw [normalizedThetaDerivative, thetaTerm_zero_derivative_envelope]
    field_simp
  rw [hEq, abs_div, abs_of_pos he]
  apply (div_le_iff₀ he).2
  convert h t ht using 1
  · unfold firstHankelEnvelope firstHankelScale
    rw [mul_assoc, ← Real.exp_add]
    congr 2
    ring

/-- A real-valued function differs from a polynomial in the scale only by a
term negligible to all polynomial orders. -/
def HankelApprox (f : ℝ → ℝ) (P : ℝ[X]) : Prop :=
  HankelFlat (fun t => f t - P.eval (firstHankelScale t))

theorem HankelApprox.poly (P : ℝ[X]) :
    HankelApprox (fun t => P.eval (firstHankelScale t)) P := by
  simpa only [HankelApprox, sub_self] using hankelFlat_zero

theorem HankelApprox.add {f g : ℝ → ℝ} {P Q : ℝ[X]}
    (hf : HankelApprox f P) (hg : HankelApprox g Q) :
    HankelApprox (fun t => f t + g t) (P+Q) := by
  change HankelFlat (fun t => f t - P.eval (firstHankelScale t)) at hf
  change HankelFlat (fun t => g t - Q.eval (firstHankelScale t)) at hg
  have h := hf.add hg
  unfold HankelApprox
  convert h using 2
  simp only [eval_add]
  ring

theorem HankelApprox.mul {f g : ℝ → ℝ} {P Q : ℝ[X]}
    (hf : HankelApprox f P) (hg : HankelApprox g Q) :
    HankelApprox (fun t => f t * g t) (P*Q) := by
  change HankelFlat (fun t => f t - P.eval (firstHankelScale t)) at hf
  change HankelFlat (fun t => g t - Q.eval (firstHankelScale t)) at hg
  have h := ((hf.mul hg).add (hf.mul_poly Q)).add (hg.mul_poly P)
  unfold HankelApprox
  convert h using 2
  simp only [eval_mul]
  ring

theorem HankelApprox.const (x : ℝ) : HankelApprox (fun _ => x) (C x) := by
  simpa only [eval_C] using HankelApprox.poly (C x)

theorem HankelApprox.sum {ι : Type*} (s : Finset ι) (f : ι → ℝ → ℝ) (p : ι → ℝ[X])
    (h : ∀ i ∈ s, HankelApprox (f i) (p i)) :
    HankelApprox (fun t => ∑ i ∈ s, f i t) (∑ i ∈ s, p i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa only [Finset.sum_empty, map_zero] using HankelApprox.const 0
  | insert a s ha ih =>
    simp only [Finset.sum_insert ha]
    exact (h a (Finset.mem_insert_self _ _)).add
      (ih fun i hi => h i (Finset.mem_insert_of_mem hi))

theorem HankelApprox.prod {ι : Type*} (s : Finset ι) (f : ι → ℝ → ℝ) (p : ι → ℝ[X])
    (h : ∀ i ∈ s, HankelApprox (f i) (p i)) :
    HankelApprox (fun t => ∏ i ∈ s, f i t) (∏ i ∈ s, p i) := by
  classical
  induction s using Finset.induction_on with
  | empty => simpa only [Finset.prod_empty, map_one] using HankelApprox.const 1
  | insert a s ha ih =>
    simp only [Finset.prod_insert ha]
    exact (h a (Finset.mem_insert_self _ _)).mul
      (ih fun i hi => h i (Finset.mem_insert_of_mem hi))

theorem HankelApprox.det {ι : Type*} [Fintype ι] [DecidableEq ι]
    (M : ℝ → Matrix ι ι ℝ) (P : Matrix ι ι ℝ[X])
    (h : ∀ i j, HankelApprox (fun t => M t i j) (P i j)) :
    HankelApprox (fun t => (M t).det) P.det := by
  simp only [Matrix.det_apply']
  apply HankelApprox.sum
  intro σ _
  have hsign :
      HankelApprox (fun _ => (↑(Equiv.Perm.sign σ) : ℝ))
        (↑(Equiv.Perm.sign σ) : ℝ[X]) := by
    simpa only [map_intCast] using HankelApprox.const (↑(Equiv.Perm.sign σ) : ℝ)
  exact hsign.mul (HankelApprox.prod _ _ _ (fun i _ => h (σ i) i))

noncomputable def normalizedThetaHankel (n : ℕ) (t : ℝ) : Matrix (Fin n) (Fin n) ℝ :=
  Matrix.of fun i j => normalizedThetaDerivative (i.val+j.val) t

noncomputable def thetaHankel (n : ℕ) (t : ℝ) : Matrix (Fin n) (Fin n) ℝ :=
  Matrix.of fun i j => iteratedDeriv (i.val+j.val) thetaKernel t

theorem normalizedThetaHankel_det_approx (n : ℕ) :
    HankelApprox (fun t => (normalizedThetaHankel n t).det) (polyHankelA n) := by
  apply HankelApprox.det (P := modeHankelMatrix (Fin.val : Fin n → ℕ) Fin.val)
  intro i j
  exact normalizedThetaDerivative_flat (i.val+j.val)

theorem thetaHankel_det_envelope (n : ℕ) (t : ℝ) :
    (thetaHankel n t).det =
      firstHankelEnvelope t ^ n * (normalizedThetaHankel n t).det := by
  have h : thetaHankel n t = firstHankelEnvelope t • normalizedThetaHankel n t := by
    ext i j
    change iteratedDeriv (i.val+j.val) thetaKernel t =
      firstHankelEnvelope t * (iteratedDeriv (i.val+j.val) thetaKernel t / firstHankelEnvelope t)
    field_simp [(firstHankelEnvelope_pos t).ne']
  rw [h, Matrix.det_smul, Fintype.card_fin]

theorem HankelApprox.normalized_limit {f : ℝ → ℝ} {P : ℝ[X]} (h : HankelApprox f P)
    (hp : Tendsto (fun x : ℝ => P.eval x / x^P.natDegree) atTop (𝓝 P.leadingCoeff)) :
    Tendsto (fun t : ℝ => f t / firstHankelScale t ^ P.natDegree) atTop (𝓝 P.leadingCoeff) := by
  have hzero : Tendsto (fun t => f t - P.eval (firstHankelScale t)) atTop (𝓝 0) := by
    have hflat : HankelFlat (fun t => f t - P.eval (firstHankelScale t)) := h
    simpa only [pow_zero, mul_one] using hflat 0
  have hdiv : Tendsto (fun t => (f t - P.eval (firstHankelScale t)) /
      firstHankelScale t ^ P.natDegree) atTop (𝓝 0) := by
    by_cases hd : P.natDegree = 0
    · simpa only [hd, pow_zero, div_one] using hzero
    · have hi := firstHankelScale_tendsto.inv_tendsto_atTop.pow P.natDegree
      simpa only [Pi.inv_apply, div_eq_mul_inv, inv_pow, zero_mul] using hzero.mul hi
  have ha := hdiv.add (hp.comp firstHankelScale_tendsto)
  simpa only [Function.comp_apply, zero_add, ← add_div, sub_add_cancel] using ha

/-- The full theta Wronskian, not just its first mode, has the predicted
nonzero leading term after dividing by the common envelope and scale power. -/
theorem thetaHankel_det_normalized_limit (n : ℕ) :
    Tendsto (fun t : ℝ => (thetaHankel n t).det /
      (firstHankelEnvelope t ^ n * firstHankelScale t ^ (2*n+n.choose 2))) atTop
      (𝓝 (polyHankelA n).leadingCoeff) := by
  have h := (normalizedThetaHankel_det_approx n).normalized_limit (polyHankelA_eval_normalized n)
  rw [polyHankelA_degree] at h
  convert h using 1
  funext t
  rw [thetaHankel_det_envelope]
  field_simp [(firstHankelEnvelope_pos t).ne', (firstHankelScale_pos t).ne']

/-- Every full theta Wronskian has the sign predicted in §3 eventually. -/
theorem thetaHankel_eventually_signed_pos (n : ℕ) :
    ∀ᶠ t in atTop, 0 < (-1 : ℝ)^n.choose 2 * (thetaHankel n t).det := by
  have h := (thetaHankel_det_normalized_limit n).const_mul ((-1 : ℝ)^n.choose 2)
  have hev := h.eventually (Ioi_mem_nhds (polyHankelA_leading_choose_sign n))
  filter_upwards [hev] with t ht
  have hs : 0 < firstHankelEnvelope t ^ n * firstHankelScale t ^ (2*n+n.choose 2) :=
    mul_pos (pow_pos (firstHankelEnvelope_pos t) _) (pow_pos (firstHankelScale_pos t) _)
  change 0 < (-1 : ℝ)^n.choose 2 * ((thetaHankel n t).det / _) at ht
  rw [← mul_div_assoc] at ht
  exact (div_pos_iff_of_pos_right hs).1 ht

theorem thetaHankel_eventually_signed_pos_all (r : ℕ) :
    ∃ U : ℝ, 1 ≤ U ∧ ∀ t : ℝ, U ≤ t → ∀ n ≤ r,
      0 < (-1 : ℝ)^n.choose 2 * (thetaHankel n t).det := by
  have hev : ∀ᶠ t : ℝ in atTop, ∀ n : Fin (r+1),
      0 < (-1 : ℝ)^n.val.choose 2 * (thetaHankel n.val t).det :=
    Filter.eventually_all.mpr fun n => thetaHankel_eventually_signed_pos n.val
  obtain ⟨U, hU⟩ := Filter.eventually_atTop.mp hev
  refine ⟨max 1 U, le_max_left _ _, fun t ht n hn => ?_⟩
  exact hU t ((le_max_right 1 U).trans ht) ⟨n, Nat.lt_succ_of_le hn⟩
end NuttallCumulants
