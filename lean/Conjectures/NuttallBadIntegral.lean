module

public import Conjectures.NuttallMovingBoxIntegral
import all Conjectures.NuttallVandermonde
import all Conjectures.NuttallAndreief
import all Conjectures.NuttallTailDominance
import all Conjectures.NuttallMovingBoxIntegral

public section
namespace NuttallCumulants
open Filter Set MeasureTheory Finset
open scoped Topology BigOperators

theorem abs_cumulantVandermonde_le_prod (n : ℕ) (x : Fin n → ℝ) (hx : ∀ i, 0 ≤ x i) :
    |cumulantVandermonde n x| ≤ ∏ i, (1+x i)^(n-1) := by
  classical
  let a : Fin n → ℝ := fun i => 1+x i
  have hpair (i j : Fin n) : |x j-x i| ≤ a i*a j := by
    calc
      _ ≤ |x j|+|x i| := abs_sub _ _
      _ ≤ _ := by
        rw [abs_of_nonneg (hx i), abs_of_nonneg (hx j)]
        dsimp [a]
        nlinarith only [mul_nonneg (hx i) (hx j)]
  unfold cumulantVandermonde
  simp only [Finset.abs_prod]
  calc
    _ ≤ ∏ i : Fin n, ∏ j ∈ Finset.Ioi i, a i*a j := by
      apply Finset.prod_le_prod₀ (fun _ _ => Finset.prod_nonneg fun _ _ => abs_nonneg _)
      intro i _
      exact Finset.prod_le_prod₀ (fun _ _ => abs_nonneg _) (fun j _ => hpair i j)
    _ = _ := by
      simp only [Finset.prod_mul_distrib, Finset.prod_const]
      have he (i : Fin n) : Finset.Ioi i = Finset.univ.filter (fun j => i < j) := by ext j; simp
      have hf (j : Fin n) : Finset.Iio j = Finset.univ.filter (fun i => i < j) := by ext i; simp
      have hs : (∏ i : Fin n, ∏ j ∈ Finset.Ioi i, a j) = ∏ j : Fin n, ∏ i ∈ Finset.Iio j, a j := by
        simp_rw [he, hf, Finset.prod_filter]
        rw [Finset.prod_comm]
      rw [hs]
      simp only [Finset.prod_const, ← Finset.prod_mul_distrib, ← pow_add, Fin.card_Iio, Fin.card_Ioi]
      apply Finset.prod_congr rfl
      intro i _
      congr 1
      have := i.isLt
      omega

theorem thetaDerivative_global_decay_finite (n : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ t : ℝ, 0 ≤ t → ∀ j : Fin n,
      |iteratedDeriv j.val thetaKernel t| ≤ C*Real.exp (-Real.exp (2*t)) := by
  classical
  choose C hC hd using fun j : Fin n => thetaKernel_iteratedDeriv_le_double_exp j.val
  refine ⟨∑ j, C j, Finset.sum_nonneg fun j _ => hC j, fun t ht j => ?_⟩
  exact (hd j t ht).trans (mul_le_mul_of_nonneg_right
    (Finset.single_le_sum (fun i _ => hC i) (Finset.mem_univ j)) (Real.exp_pos _).le)

theorem abs_det_le_col_product {ι : Type*} [Fintype ι] [DecidableEq ι]
    (A : Matrix ι ι ℝ) (b : ι → ℝ) (h : ∀ i j, |A i j| ≤ b j) :
    |A.det| ≤ ((Fintype.card ι).factorial:ℝ)*∏ j, b j := by
  classical
  rw [Matrix.det_apply']
  refine (Finset.abs_sum_le_sum_abs _ _).trans ?_
  calc
    _ ≤ ∑ σ : Equiv.Perm ι, ∏ j, b j := by
      apply Finset.sum_le_sum
      intro σ _
      have hsign : |(↑(Equiv.Perm.sign σ) : ℝ)| = 1 := by
        rcases Int.units_eq_one_or (Equiv.Perm.sign σ) with hh | hh <;> norm_num [hh]
      rw [abs_mul, hsign, one_mul, Finset.abs_prod]
      exact Finset.prod_le_prod₀ (fun _ _ => abs_nonneg _) (fun j _ => h (σ j) j)
    _ = _ := by simp [Finset.sum_const, Fintype.card_perm, nsmul_eq_mul]

theorem signedCumulantIntegrand_abs_le_majorant (n : ℕ) :
    ∃ C : ℝ, 0 ≤ C ∧ ∀ (m : ℕ) (u : ℝ) (x : Fin n → ℝ),
      0 ≤ u → (∀ i, 0 ≤ x i) →
      |signedCumulantIntegrand n m u x| ≤ C * ∏ i, momentMajorant m n (x i) := by
  obtain ⟨C,hC,h⟩ := thetaDerivative_global_decay_finite n
  refine ⟨(n.factorial:ℝ)*C^n, by positivity, fun m u x hu hx => ?_⟩
  let g : Fin n → ℝ := fun i => Real.exp (-Real.exp (2*x i))
  have hd0 (i j : Fin n) : |thetaDerivativeMatrix n u x i j| ≤ C*g j := by
    change |iteratedDeriv i.val thetaKernel (u+x j)| ≤ _
    apply (h _ (add_nonneg hu (hx j)) i).trans
    apply mul_le_mul_of_nonneg_left _ hC
    unfold g
    gcongr
    linarith
  have hd := abs_det_le_col_product (thetaDerivativeMatrix n u x) (fun j => C*g j) hd0
  rw [Fintype.card_fin, Finset.prod_mul_distrib, Finset.prod_const, Finset.card_univ, Fintype.card_fin] at hd
  let W : ℝ := ∏ i, (x i)^(m-n)
  let V : ℝ := ∏ i, (1+x i)^(n-1)
  let K : ℝ := (n.factorial:ℝ)*C^n
  have hW : 0 ≤ W := Finset.prod_nonneg fun i _ => pow_nonneg (hx i) _
  have hV : 0 ≤ V := Finset.prod_nonneg fun i _ => pow_nonneg (by linarith [hx i]) _
  have hs : |(-1:ℝ)^(n.choose 2)| = 1 := by simp [abs_pow]
  unfold signedCumulantIntegrand
  rw [abs_mul, abs_mul, abs_mul, hs, one_mul]
  change |cumulantVandermonde n x| * |W| * |(thetaDerivativeMatrix n u x).det| ≤ _
  rw [abs_of_nonneg hW]
  calc
    _ ≤ V*W*(K*(∏ i, g i)) :=
      mul_le_mul (mul_le_mul_of_nonneg_right (abs_cumulantVandermonde_le_prod n x hx) hW)
        (hd.trans_eq (by unfold K; ring)) (abs_nonneg _) (mul_nonneg hV hW)
    _ = _ := by
      unfold V W g K
      simp only [momentMajorant, Finset.prod_mul_distrib]
      ring

theorem cumulantProductMeasure_ae_pos (n : ℕ) :
    ∀ᵐ x ∂cumulantProductMeasure n, ∀ i : Fin n, 0 < x i := by
  unfold cumulantProductMeasure
  apply Filter.eventually_all.mpr
  intro i
  exact Measure.tendsto_eval_ae_ae.eventually (ae_restrict_mem (μ := volume) measurableSet_Ioi)

theorem signedCumulantIntegrand_integrable (n m : ℕ) (hn : 1 ≤ n) (hm : n ≤ m)
    (u : ℝ) (hu : 0 ≤ u) :
    Integrable (signedCumulantIntegrand n m u) (cumulantProductMeasure n) := by
  obtain ⟨C,_,h⟩ := signedCumulantIntegrand_abs_le_majorant n
  have hMajor : Integrable (fun x : Fin n → ℝ => ∏ i, momentMajorant m n (x i))
      (cumulantProductMeasure n) := by
    unfold cumulantProductMeasure
    exact Integrable.fintype_prod fun _ => momentMajorant_integrable m n hn hm
  refine Integrable.mono' (hMajor.const_mul C)
    (signedCumulantIntegrand_continuous n m u).aestronglyMeasurable ?_
  filter_upwards [cumulantProductMeasure_ae_pos n] with x hx
  rw [Real.norm_eq_abs]
  exact h m u x hu (fun i => (hx i).le)

theorem momentMajorant_left_interval_bound (n m : ℕ) (hn : 1 ≤ n) (hm : n ≤ m)
    {U : ℝ} (hU : 1 ≤ U) :
    (∫ v in Iio U, momentMajorant m n v ∂(volume.restrict (Ioi (0:ℝ)))) ≤
      U*(1+U)^(n-1)*U^m := by
  have hU0 := zero_le_one.trans hU
  have hr : Iio U ∩ Ioi (0:ℝ) = Ioo 0 U := by ext x; exact and_comm
  rw [Measure.restrict_restrict measurableSet_Iio, hr]
  let A : ℝ := U^m*(1+U)^(n-1)
  have hM : IntegrableOn (momentMajorant m n) (Ioo 0 U) :=
    (momentMajorant_integrable m n hn hm).mono_set Ioo_subset_Ioi_self
  have hC : IntegrableOn (fun _ : ℝ => A) (Ioo 0 U) :=
    integrableOn_const (by rw [Real.volume_Ioo]; exact ENNReal.ofReal_ne_top)
  have h (v : ℝ) (hv : v ∈ Ioo 0 U) : momentMajorant m n v ≤ A := by
    unfold momentMajorant A
    have hv0 : 0 ≤ v := hv.1.le
    have hvU : v ≤ U := hv.2.le
    have h1 : v^(m-n) ≤ U^m :=
      (pow_le_pow_left₀ hv0 hvU _).trans (pow_le_pow_right₀ hU (Nat.sub_le _ _))
    have h2 : (1+v)^(n-1) ≤ (1+U)^(n-1) :=
      pow_le_pow_left₀ (by linarith) (by linarith) _
    have h3 : Real.exp (-Real.exp (2*v)) ≤ 1 :=
      Real.exp_le_one_iff.mpr (neg_nonpos.mpr (Real.exp_pos _).le)
    calc
      _ ≤ U^m*(1+U)^(n-1)*1 :=
        mul_le_mul (mul_le_mul h1 h2 (pow_nonneg (by linarith) _) (pow_nonneg hU0 _))
          h3 (Real.exp_pos _).le (by positivity)
      _ = _ := mul_one _
  have hI := MeasureTheory.setIntegral_mono_on hM hC measurableSet_Ioo h
  rw [MeasureTheory.setIntegral_const, MeasureTheory.measureReal_def, Real.volume_Ioo, sub_zero,
    ENNReal.toReal_ofReal hU0, smul_eq_mul] at hI
  convert hI using 1
  unfold A
  ring

def badBoxRegion (n : ℕ) (U : ℝ) : Set (Fin n → ℝ) :=
  {x | ∃ i : Fin n, x i < U}

theorem badBoxRegion_measurable (n : ℕ) (U : ℝ) : MeasurableSet (badBoxRegion n U) := by
  have h : badBoxRegion n U = ⋃ i : Fin n, {x | x i < U} := by ext x; simp [badBoxRegion]
  rw [h]
  exact MeasurableSet.iUnion fun i => (measurable_pi_apply i) measurableSet_Iio

theorem integral_product_coordinate_cut (n m : ℕ) (j : Fin n) (U : ℝ) :
    (∫ x in {x : Fin n → ℝ | x j < U}, ∏ i, momentMajorant m n (x i) ∂cumulantProductMeasure n) =
        (∫ v in Iio U, momentMajorant m n v ∂(volume.restrict (Ioi (0:ℝ)))) *
          (∫ v in Ioi (0:ℝ), momentMajorant m n v)^(n-1) := by
  classical
  let S : Fin n → Set ℝ := fun i => if i = j then Iio U else Set.univ
  have he : {x : Fin n → ℝ | x j < U} = Set.univ.pi S := by
    ext x
    change (x j < U) ↔ ∀ i ∈ Set.univ, x i ∈ S i
    constructor
    · intro h i _
      by_cases hi : i = j
      · subst i; simpa [S] using h
      · simp [S,hi]
    · intro h
      simpa [S] using h j (Set.mem_univ j)
  rw [he, cumulantProductMeasure, Measure.restrict_pi_pi, integral_fintype_prod_eq_prod]
  rw [← Finset.prod_erase_mul _ _ (Finset.mem_univ j)]
  simp only [eq_self, ite_true]
  have hrest :
      (∏ i ∈ (Finset.univ : Finset (Fin n)).erase j,
        ∫ v, momentMajorant m n v ∂((volume.restrict (Ioi (0:ℝ))).restrict (S i))) =
      (∫ v in Ioi (0:ℝ), momentMajorant m n v)^(n-1) := by
    conv_rhs => rw [← Fintype.card_fin n,
      ← Finset.card_univ, ← Finset.card_erase_of_mem (Finset.mem_univ j), ← Finset.prod_const]
    apply Finset.prod_congr rfl
    intro i hi
    rw [show S i = Set.univ by simp [S,(Finset.mem_erase.mp hi).1], Measure.restrict_univ]
    simp only [Finset.card_univ, Fintype.card_fin]
  rw [hrest, mul_comm]

theorem integral_badBox_majorant_le (n m : ℕ) (hn : 1 ≤ n) (hm : n ≤ m) (U : ℝ) :
    (∫ x in badBoxRegion n U, ∏ i, momentMajorant m n (x i) ∂cumulantProductMeasure n) ≤
      (n:ℝ) * (∫ v in Iio U, momentMajorant m n v ∂(volume.restrict (Ioi (0:ℝ)))) *
        (∫ v in Ioi (0:ℝ), momentMajorant m n v)^(n-1) := by
  classical
  let μ := cumulantProductMeasure n
  let F := fun x : Fin n → ℝ => ∏ i, momentMajorant m n (x i)
  let S := fun i : Fin n => {x : Fin n → ℝ | x i < U}
  let B := badBoxRegion n U
  have hF : Integrable F μ := by
    unfold F μ cumulantProductMeasure
    exact Integrable.fintype_prod fun _ => momentMajorant_integrable m n hn hm
  have hS (i : Fin n) : MeasurableSet (S i) := (measurable_pi_apply i) measurableSet_Iio
  have hI (i : Fin n) : Integrable ((S i).indicator F) μ := hF.indicator (hS i)
  have hB : MeasurableSet B := badBoxRegion_measurable n U
  have hsum : Integrable (fun x => ∑ i, (S i).indicator F x) μ :=
    integrable_finsetSum _ fun i _ => hI i
  have hbig : (∫ x, B.indicator F x ∂μ) ≤ ∫ x, ∑ i, (S i).indicator F x ∂μ := by
    apply integral_mono_ae (hF.indicator hB) hsum
    filter_upwards [cumulantProductMeasure_ae_pos n] with x hx
    have hF0 : 0 ≤ F x := Finset.prod_nonneg (fun i _ => momentMajorant_nonneg m n (hx i).le)
    have hS0 (i : Fin n) : 0 ≤ (S i).indicator F x := by
      by_cases hi : x ∈ S i <;> simp [hi,hF0]
    by_cases hmem : x ∈ B
    · rw [Set.indicator_of_mem hmem]
      obtain ⟨i, hi⟩ := hmem
      have hle := Finset.single_le_sum (fun j _ => hS0 j) (Finset.mem_univ i)
      rw [Set.indicator_of_mem (show x ∈ S i from hi)] at hle
      exact hle
    · rw [Set.indicator_of_notMem hmem]
      exact Finset.sum_nonneg (fun j _ => hS0 j)
  rw [integral_indicator hB, integral_finsetSum _ (fun i _ => hI i)] at hbig
  have he (i : Fin n) :
      (∫ x, (S i).indicator F x ∂μ) =
        (∫ v in Iio U, momentMajorant m n v ∂(volume.restrict (Ioi (0:ℝ)))) *
          (∫ v in Ioi (0:ℝ), momentMajorant m n v)^(n-1) := by
    rw [integral_indicator (hS i)]
    exact integral_product_coordinate_cut n m i U
  simp_rw [he] at hbig
  simp only [Finset.sum_const, Finset.card_univ, Fintype.card_fin, nsmul_eq_mul] at hbig
  simpa only [mul_assoc] using hbig

theorem signedCumulantIntegrand_bad_box_bound (n : ℕ) (hn : 1 ≤ n) {U : ℝ} (hU : 1 ≤ U) :
    ∃ A : ℝ, 0 ≤ A ∧ ∀ (m : ℕ), n ≤ m → 1 ≤ Real.log (m:ℝ) →
      ∀ u : ℝ, 0 ≤ u →
      (∫ x in badBoxRegion n U, |signedCumulantIntegrand n m u x| ∂cumulantProductMeasure n) ≤
        A*U^m*(2*Real.log (m:ℝ))^(m*(n-1)) := by
  obtain ⟨C,hC,hmajor⟩ := signedCumulantIntegrand_abs_le_majorant n
  let A : ℝ := C*(n:ℝ)*U*(1+U)^(n-1)*(2:ℝ)^(n-1)
  have hU0 := zero_le_one.trans hU
  have hA : 0 ≤ A := by unfold A; positivity
  refine ⟨A,hA,fun m hm hlog u hu => ?_⟩
  let μ := cumulantProductMeasure n
  let B := badBoxRegion n U
  let f := fun x => signedCumulantIntegrand n m u x
  let F := fun x : Fin n → ℝ => ∏ i, momentMajorant m n (x i)
  let M := ∫ v in Ioi (0:ℝ), momentMajorant m n v
  let L := ∫ v in Iio U, momentMajorant m n v ∂(volume.restrict (Ioi (0:ℝ)))
  have hb : MeasurableSet B := badBoxRegion_measurable n U
  have hf : Integrable f μ := signedCumulantIntegrand_integrable n m hn hm u hu
  have hF : Integrable F μ := by
    unfold F μ cumulantProductMeasure
    exact Integrable.fintype_prod fun _ => momentMajorant_integrable m n hn hm
  have hfirst : (∫ x in B, |f x| ∂μ) ≤ C*(∫ x in B, F x ∂μ) := by
    rw [← MeasureTheory.integral_const_mul]
    apply setIntegral_mono_on_ae hf.abs.integrableOn (hF.const_mul C).integrableOn hb
    filter_upwards [cumulantProductMeasure_ae_pos n] with x hx _
    exact hmajor m u x hu (fun i => (hx i).le)
  have hM : M ≤ 2*(2*Real.log (m:ℝ))^m := momentMajorant_integral_bound m n hn hm hlog
  have hM0 : 0 ≤ M := setIntegral_nonneg measurableSet_Ioi
    (fun _ hx => momentMajorant_nonneg m n hx.le)
  have hL : L ≤ U*(1+U)^(n-1)*U^m := momentMajorant_left_interval_bound n m hn hm hU
  have hW := integral_badBox_majorant_le n m hn hm U
  calc
    _ ≤ C*(∫ x in B, F x ∂μ) := hfirst
    _ ≤ C*((n:ℝ)*L*M^(n-1)) := mul_le_mul_of_nonneg_left hW hC
    _ ≤ C*((n:ℝ)*(U*(1+U)^(n-1)*U^m)*M^(n-1)) :=
      mul_le_mul_of_nonneg_left
        (mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hL (Nat.cast_nonneg _))
          (pow_nonneg hM0 _)) hC
    _ ≤ C*((n:ℝ)*(U*(1+U)^(n-1)*U^m)*(2*(2*Real.log (m:ℝ))^m)^(n-1)) :=
      mul_le_mul_of_nonneg_left
        (mul_le_mul_of_nonneg_left (pow_le_pow_left₀ hM0 hM _) (by positivity)) hC
    _ = _ := by unfold A; rw [mul_pow, ← pow_mul]; ring

end NuttallCumulants
