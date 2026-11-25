module

public import Conjectures.NuttallMovingBoxDeterminant
public import Conjectures.NuttallTailDominance
public import Conjectures.NuttallVandermonde
public import Mathlib.Topology.Instances.Matrix
import all Conjectures.NuttallAndreief
import all Conjectures.NuttallVandermonde
import all Conjectures.NuttallHankelTransfer

public section
namespace NuttallCumulants
open Filter Set MeasureTheory
open scoped Topology BigOperators

noncomputable def positiveBoxShift (m : ℕ) : ℝ := Real.log (m:ℝ)/8

theorem exp_boxShift_eq_sqrt {m : ℕ} (hm : 1 ≤ m) :
    Real.exp (4*positiveBoxShift m) = Real.sqrt (m:ℝ) := by
  have hm0 : (0:ℝ) < (m:ℝ) := by exact_mod_cast zero_lt_one.trans_le hm
  rw [positiveBoxShift, Real.sqrt_eq_rpow, Real.rpow_def_of_pos hm0]
  congr 1
  ring

theorem firstHankelScale_ge_three {t : ℝ} (ht : 0 ≤ t) : 3 ≤ firstHankelScale t := by
  unfold firstHankelScale
  have he : 1 ≤ Real.exp (4*t) := Real.one_le_exp (by positivity)
  exact Real.pi_gt_three.le.trans (le_mul_of_one_le_right Real.pi_pos.le he)

theorem thetaKernel_leading_lower {t : ℝ} (ht : 0 ≤ t) :
    firstHankelEnvelope t * (firstHankelScale t)^2 ≤ thetaKernel t := by
  have h := normalizedThetaDerivative_zero_lower ht (firstHankelScale_ge_three ht)
  change (firstHankelScale t)^2 ≤ thetaKernel t / firstHankelEnvelope t at h
  rw [mul_comm]
  exact (le_div_iff₀ (firstHankelEnvelope_pos t)).1 h

theorem thetaKernel_point_moving_box_lower (n : ℕ) (H : ℝ) {m : ℕ} (hm : 1 ≤ m)
    {u : ℝ} (hu : u ∈ Set.Icc 0 H) {d : ℝ} (hd : d ∈ Set.Icc 0 (2*(n:ℝ)+1/2)) :
    Real.exp (-((Real.pi*Real.exp (4*(H+2*(n:ℝ)+1/2))) * Real.sqrt (m:ℝ))) ≤
      thetaKernel (u+positiveBoxShift m+d) := by
  let t := u+positiveBoxShift m+d
  let L := Real.pi*Real.exp (4*(H+2*(n:ℝ)+1/2))
  have hM : (1:ℝ) ≤ m := by exact_mod_cast hm
  have hw : 0 ≤ positiveBoxShift m := div_nonneg (Real.log_nonneg hM) (by norm_num)
  have ht : 0 ≤ t := add_nonneg (add_nonneg hu.1 hw) hd.1
  have hy : firstHankelScale t ≤ L*Real.sqrt (m:ℝ) := by
    have h := firstHankelScale_translate_div u (positiveBoxShift m) d
    rw [exp_boxShift_eq_sqrt hm] at h
    change firstHankelScale t / Real.sqrt (m:ℝ) = _ at h
    apply (div_le_iff₀ (Real.sqrt_pos_of_pos (zero_lt_one.trans_le hM))).1
    rw [h]
    apply mul_le_mul_of_nonneg_left _ Real.pi_pos.le
    apply Real.exp_le_exp.mpr
    linarith [hu.2, hd.2]
  have h1 : 1 ≤ firstHankelScale t := by linarith [firstHankelScale_ge_three ht]
  calc
    _ ≤ firstHankelEnvelope t := by
      apply Real.exp_le_exp.mpr
      change -(L*Real.sqrt (m:ℝ)) ≤ t-firstHankelScale t
      linarith
    _ ≤ firstHankelEnvelope t * (firstHankelScale t)^2 :=
      le_mul_of_one_le_right (firstHankelEnvelope_pos t).le (one_le_pow₀ h1)
    _ ≤ _ := thetaKernel_leading_lower ht

theorem thetaKernel_product_moving_box_lower (n : ℕ) (H : ℝ) {m : ℕ} (hm : 1 ≤ m)
    {u : ℝ} (hu : u ∈ Set.Icc 0 H) (d : Fin n → ℝ)
    (hd : ∀ i, d i ∈ Set.Icc (2*((i.val:ℝ)+1)) (2*((i.val:ℝ)+1)+1/2)) :
    Real.exp (-(n:ℝ)*(Real.pi*Real.exp (4*(H+2*(n:ℝ)+1/2)))*Real.sqrt (m:ℝ)) ≤
      ∏ i, thetaKernel (u+positiveBoxShift m+d i) := by
  let L := Real.pi*Real.exp (4*(H+2*(n:ℝ)+1/2))
  have h (i : Fin n) : d i ∈ Set.Icc 0 (2*(n:ℝ)+1/2) := by
    have hi : (i.val:ℝ)+1 ≤ n := by exact_mod_cast Nat.succ_le_of_lt i.isLt
    exact ⟨(by positivity : 0 ≤ 2*((i.val:ℝ)+1)).trans (hd i).1, by linarith [(hd i).2]⟩
  have hProd := Finset.prod_le_prod₀ (s := (Finset.univ : Finset (Fin n)))
    (fun _ _ => (Real.exp_pos (-(L*Real.sqrt (m:ℝ)))).le)
    (fun i _ => thetaKernel_point_moving_box_lower n H hm hu (h i))
  rw [Finset.prod_const, Finset.card_univ, Fintype.card_fin, ← exp_real_nat_mul] at hProd
  convert hProd using 2
  ring

noncomputable def positiveBox (n m : ℕ) : Set (Fin n → ℝ) :=
  Set.pi Set.univ fun i => Set.Icc (positiveBoxShift m+2*((i.val:ℝ)+1))
    (positiveBoxShift m+2*((i.val:ℝ)+1)+1/2)

noncomputable def cumulantProductMeasure (n : ℕ) : Measure (Fin n → ℝ) :=
  Measure.pi fun _ => volume.restrict (Set.Ioi (0:ℝ))

noncomputable def signedCumulantIntegrand (n m : ℕ) (u : ℝ) (x : Fin n → ℝ) : ℝ :=
  cumulantVandermonde n x * (∏ i, x i^(m-n)) *
    ((-1:ℝ)^(n.choose 2)*(thetaDerivativeMatrix n u x).det)

theorem positiveBox_measurable (n m : ℕ) : MeasurableSet (positiveBox n m) := by
  unfold positiveBox
  exact MeasurableSet.pi Set.finite_univ.countable (fun i _ => measurableSet_Icc)

theorem positiveBox_measure (n m : ℕ) (hm : 1 ≤ m) :
    cumulantProductMeasure n (positiveBox n m) = ENNReal.ofReal ((1/2:ℝ)^n) := by
  unfold cumulantProductMeasure positiveBox
  rw [Measure.pi_pi]
  have hm' : (1:ℝ) ≤ m := by exact_mod_cast hm
  have hw : 0 ≤ positiveBoxShift m := div_nonneg (Real.log_nonneg hm') (by norm_num)
  have h (i : Fin n) :
      volume.restrict (Set.Ioi (0:ℝ)) (Set.Icc (positiveBoxShift m+2*((i.val:ℝ)+1))
        (positiveBoxShift m+2*((i.val:ℝ)+1)+1/2)) = ENNReal.ofReal (1/2) := by
    rw [Measure.restrict_apply measurableSet_Icc, Set.inter_eq_left.mpr]
    · rw [Real.volume_Icc]
      congr 1
      ring
    · intro z hz
      have hh : 0 < 2*((i.val:ℝ)+1) := by positivity
      have h₁ := hz.1
      exact Set.mem_Ioi.mpr (by linarith)
  simp_rw [h]
  rw [Finset.prod_const, Finset.card_univ, Fintype.card_fin, ENNReal.ofReal_pow (by norm_num)]

theorem cumulantVandermonde_separated_lower (n : ℕ) (x : Fin n → ℝ) {a : ℝ} (ha : 0 ≤ a)
    (h : ∀ i j : Fin n, i < j → a ≤ x j-x i) :
    a^(n.choose 2) ≤ cumulantVandermonde n x := by
  unfold cumulantVandermonde
  rw [← sum_card_Ioi_fin n, ← Finset.prod_pow_eq_pow_sum]
  apply Finset.prod_le_prod₀ (fun i _ => pow_nonneg ha _)
  intro i _
  rw [← Finset.prod_const]
  exact Finset.prod_le_prod₀ (fun _ _ => ha)
    (fun j hj => h i j (Finset.mem_Ioi.mp hj))

theorem signedCumulantIntegrand_moving_box_lower (n : ℕ) (H : ℝ) :
    ∃ c K : ℝ, 0 < c ∧ 0 ≤ K ∧ ∀ᶠ m : ℕ in atTop, ∀ u ∈ Set.Icc 0 H,
      ∀ x ∈ positiveBox n m,
        c * (positiveBoxShift m)^(n*(m-n)) * Real.exp (-K*Real.sqrt (m:ℝ)) ≤
          signedCumulantIntegrand n m u x := by
  let L := Real.pi*Real.exp (4*(H+2*(n:ℝ)+1/2))
  let K : ℝ := (n:ℝ)*L
  obtain ⟨b,hb,h⟩ := thetaDerivative_integrand_moving_box_lower n H
  let c := (3/2:ℝ)^(n.choose 2)*b
  have hc : 0 < c := mul_pos (pow_pos (by norm_num) _) hb
  have hK : 0 ≤ K := by unfold K L; positivity
  refine ⟨c,K,hc,hK,?_⟩
  filter_upwards [h, eventually_ge_atTop (1:ℕ)] with m hm hm1
  intro u hu x hx
  let w := positiveBoxShift m
  let d := fun i => x i-w
  have hm' : (1:ℝ) ≤ m := by exact_mod_cast hm1
  have hw : 0 ≤ w := div_nonneg (Real.log_nonneg hm') (by norm_num)
  have hd (i : Fin n) :
      d i ∈ Set.Icc (2*((i.val:ℝ)+1)) (2*((i.val:ℝ)+1)+1/2) := by
    have hx' := hx i (Set.mem_univ i)
    change w+2*((i.val:ℝ)+1) ≤ x i ∧ x i ≤ w+2*((i.val:ℝ)+1)+1/2 at hx'
    change 2*((i.val:ℝ)+1) ≤ x i-w ∧ x i-w ≤ 2*((i.val:ℝ)+1)+1/2
    constructor <;> linarith [hx'.1,hx'.2]
  have hxw (i : Fin n) : w ≤ x i := by
    have h := (hd i).1
    change 2*((i.val:ℝ)+1) ≤ x i-w at h
    have hb0 : 0 ≤ 2*((i.val:ℝ)+1) := by positivity
    linarith
  have he : (fun i => w+d i) = x := by
    funext i
    change w+(x i-w)=x i
    ring
  have hProd := thetaKernel_product_moving_box_lower n H hm1 hu d hd
  have hProd' : Real.exp (-K*Real.sqrt (m:ℝ)) ≤ ∏ i, thetaKernel (u+x i) := by
    convert hProd using 2
    · unfold K
      ring
    · rename_i i _
      rw [add_assoc]
      exact congrArg (fun z => thetaKernel (u+z)) (congrFun he i).symm
  have hD := hm u hu d hd
  change b*((∏ i, thetaKernel (u+(w+d i)))* (Real.sqrt (m:ℝ))^(n.choose 2)) ≤
    (-1:ℝ)^(n.choose 2)*(thetaDerivativeMatrix n u (fun i => w+d i)).det at hD
  have hD' : b*((∏ i, thetaKernel (u+x i)))*1 ≤ (-1:ℝ)^(n.choose 2)*(thetaDerivativeMatrix n u x).det := by
    have hP : 0 ≤ ∏ i, thetaKernel (u+x i) := Finset.prod_nonneg fun i _ =>
      (thetaKernel_pos (add_nonneg hu.1 (hw.trans (hxw i)))).le
    have hR : 1 ≤ (Real.sqrt (m:ℝ))^(n.choose 2) := one_le_pow₀ (Real.one_le_sqrt.mpr hm')
    have hh := mul_le_mul_of_nonneg_left hR (mul_nonneg hb.le hP)
    rw [← mul_assoc] at hD
    have he' (i : Fin n) : w+d i = x i := congrFun he i
    simp_rw [he'] at hD
    exact hh.trans hD
  have hDd : b*Real.exp (-K*Real.sqrt (m:ℝ)) ≤ (-1:ℝ)^(n.choose 2)*(thetaDerivativeMatrix n u x).det :=
    (mul_le_mul_of_nonneg_left hProd' hb.le).trans (by simpa only [mul_one] using hD')
  have hV : (3/2:ℝ)^(n.choose 2) ≤ cumulantVandermonde n x := by
    apply cumulantVandermonde_separated_lower n x (by norm_num)
    intro i j hij
    have hij' : (i.val:ℝ)+1 ≤ (j.val:ℝ) := by exact_mod_cast Nat.succ_le_of_lt hij
    have hi := (hd i).2
    have hj := (hd j).1
    change x i-w ≤ _ at hi
    change _ ≤ x j-w at hj
    linarith
  have hP : w^(n*(m-n)) ≤ ∏ i, x i^(m-n) := by
    have hh := Finset.prod_le_prod₀ (s := (Finset.univ : Finset (Fin n)))
      (fun _ _ => pow_nonneg hw (m-n))
      (fun i _ => pow_le_pow_left₀ hw (hxw i) (m-n))
    simpa only [Finset.prod_const, Finset.card_univ, Fintype.card_fin, ← pow_mul, mul_comm (m-n) n]
      using hh
  have hl : 0 ≤ (3/2:ℝ)^(n.choose 2)*w^(n*(m-n)) := by positivity
  have hr : 0 ≤ (-1:ℝ)^(n.choose 2)*(thetaDerivativeMatrix n u x).det :=
    (mul_nonneg hb.le (Real.exp_pos _).le).trans hDd
  have hfinal := mul_le_mul (mul_le_mul hV hP (pow_nonneg hw _) ((pow_nonneg (by norm_num) _).trans hV))
    hDd (mul_nonneg hb.le (Real.exp_pos _).le) (mul_nonneg ((pow_nonneg (by norm_num) _).trans hV)
      ((pow_nonneg hw _).trans hP))
  convert hfinal using 1
  · unfold c
    ring
  · rfl

theorem positiveBox_isCompact (n m : ℕ) : IsCompact (positiveBox n m) := by
  let S : Fin n → Set ℝ := fun i => Set.Icc (positiveBoxShift m+2*((i.val:ℝ)+1))
    (positiveBoxShift m+2*((i.val:ℝ)+1)+1/2)
  have he : positiveBox n m = {x : Fin n → ℝ | ∀ i, x i ∈ S i} := by
    ext x
    change (∀ i ∈ Set.univ, x i ∈ S i) ↔ ∀ i, x i ∈ S i
    exact ⟨fun h i => h i (Set.mem_univ i), fun h i _ => h i⟩
  rw [he]
  exact isCompact_pi_infinite (s := S) fun _ => isCompact_Icc

theorem signedCumulantIntegrand_continuous (n m : ℕ) (u : ℝ) :
    Continuous (signedCumulantIntegrand n m u) := by
  have hv : Continuous (cumulantVandermonde n) := by
    unfold cumulantVandermonde
    exact continuous_finsetProd _ (fun i _ =>
      continuous_finsetProd _ (fun j _ => (continuous_apply j).sub (continuous_apply i)))
  have hweight : Continuous (fun x : Fin n → ℝ => ∏ i, x i^(m-n)) :=
    continuous_finsetProd _ (fun i _ => (continuous_apply i).pow _)
  have hmat : Continuous (fun x : Fin n → ℝ => thetaDerivativeMatrix n u x) := by
    refine continuous_matrix ?_
    intro i j
    change Continuous (fun x : Fin n → ℝ => iteratedDeriv i.val thetaKernel (u+x j))
    exact (continuous_iff_continuousAt.mpr fun v =>
      (hasDerivAt_iteratedDeriv_thetaKernel i.val v).continuousAt).comp
        (continuous_const.add (continuous_apply j))
  exact (hv.mul hweight).mul (continuous_const.mul hmat.matrix_det)

/-- The signed integral over the actual positive box has the lower bound
in §6. This does not assert the sign of the integral on the complement. -/
theorem signedCumulantIntegrand_moving_box_integral_lower (n : ℕ) (H : ℝ) :
    ∃ c K : ℝ, 0 < c ∧ 0 ≤ K ∧ ∀ᶠ m : ℕ in atTop, ∀ u ∈ Set.Icc 0 H,
      c * (positiveBoxShift m)^(n*(m-n)) * Real.exp (-K*Real.sqrt (m:ℝ)) ≤
        ∫ x in positiveBox n m, signedCumulantIntegrand n m u x ∂cumulantProductMeasure n := by
  obtain ⟨b,K,hb,hK,h⟩ := signedCumulantIntegrand_moving_box_lower n H
  refine ⟨(1/2:ℝ)^n*b,K,mul_pos (pow_pos (by norm_num) _) hb,hK,?_⟩
  filter_upwards [h, eventually_ge_atTop (1:ℕ)] with m hm hm1
  intro u hu
  let μ := cumulantProductMeasure n
  let B := positiveBox n m
  let c := b*positiveBoxShift m^(n*(m-n))*Real.exp (-K*Real.sqrt (m:ℝ))
  have hB : MeasurableSet B := positiveBox_measurable _ _
  let : IsLocallyFiniteMeasure μ := by unfold μ cumulantProductMeasure; infer_instance
  have hI : IntegrableOn (signedCumulantIntegrand n m u) B μ :=
    (signedCumulantIntegrand_continuous n m u).continuousOn.integrableOn_compact
      (positiveBox_isCompact n m)
  have Hμ : μ B = ENNReal.ofReal ((1/2:ℝ)^n) := positiveBox_measure n m hm1
  have hC : IntegrableOn (fun _ : Fin n → ℝ => c) B μ :=
    integrableOn_const (by rw [Hμ]; exact ENNReal.ofReal_lt_top.ne)
  have hi := MeasureTheory.setIntegral_mono_on hC hI hB (fun x hx => hm u hu x hx)
  rw [MeasureTheory.setIntegral_const, MeasureTheory.measureReal_def, Hμ,
    ENNReal.toReal_ofReal (by positivity), smul_eq_mul] at hi
  convert hi using 1
  unfold c
  ring
end NuttallCumulants
