module

public import Conjectures.NuttallTailDominance
public import Conjectures.NuttallBadIntegral
import all Conjectures.NuttallVandermonde
import all Conjectures.NuttallMovingBoxIntegral
import all Conjectures.NuttallBadIntegral

public section
namespace NuttallCumulants
open Filter
open scoped Topology

theorem moving_box_comparison_base (n : ℕ) (hn : 1 ≤ n) {L : ℝ} (hL : 0 < L) (U : ℝ) :
    U*(2*L)^(n-1)/(L/8)^n = U*2^(n-1)*8^n/L := by
  rw [mul_pow, div_pow]
  have hp : L^n = L^(n-1)*L := by conv_lhs => rw [show n = n-1+1 by omega, pow_succ]
  rw [hp]
  field_simp [hL.ne']

theorem moving_box_exact_ratio (n m : ℕ) (hn : 1 ≤ n) (hm : n ≤ m)
    {L c : ℝ} (hL : 0 < L) (hc : 0 < c) (A U K : ℝ) :
    (A*U^m*(2*L)^(m*(n-1))) /
      (c*(L/8)^(n*(m-n))*Real.exp (-K*Real.sqrt (m:ℝ))) =
    (A/(c*8^(n*n)))*(L^(n*n)*Real.exp (K*Real.sqrt (m:ℝ))*
      ((U*2^(n-1)*8^n)/L)^m) := by
  let w : ℝ := L/8
  have hw : 0 < w := by dsimp [w]; positivity
  have hshift : w^(n*(m-n))*w^(n*n) = (w^n)^m := by
    rw [← pow_add, ← pow_mul, ← Nat.mul_add, Nat.sub_add_cancel hm]
  have hshift' : w^(n*(m-n)) = (w^n)^m / w^(n*n) :=
    (eq_div_iff (pow_ne_zero _ hw.ne')).2 hshift
  have hbad : U^m*(2*L)^(m*(n-1)) = (U*(2*L)^(n-1))^m := by
    rw [mul_comm m (n-1), pow_mul, ← mul_pow]
  have hneg : -K*Real.sqrt (m:ℝ) = -(K*Real.sqrt (m:ℝ)) := by ring
  change _ / (c*w^(n*(m-n))*_) = _
  rw [mul_assoc A, hbad, hshift', hneg, Real.exp_neg, ← moving_box_comparison_base n hn hL U]
  change A*(U*(2*L)^(n-1))^m / (c*((w^n)^m/w^(n*n))*(Real.exp (K*Real.sqrt (m:ℝ)))⁻¹) =
    (A/(c*8^(n*n)))*(L^(n*n)*Real.exp (K*Real.sqrt (m:ℝ))*((U*(2*L)^(n-1))/w^n)^m)
  rw [div_pow]
  have hw' : w^(n*n) = L^(n*n)/8^(n*n) := by unfold w; rw [div_pow]
  rw [hw']
  field_simp [(Real.exp_pos (K*Real.sqrt (m:ℝ))).ne', hc.ne', hw.ne', hL.ne']
  have hbase : (L^n/8^n) * (U*(2*L)^(n-1)*8^n/L^n) = U*(2*L)^(n-1) := by
    field_simp [hL.ne']
  rw [mul_assoc A, ← mul_pow, hbase]

theorem moving_box_eventually_dominates (n : ℕ) (hn : 1 ≤ n)
    {A U c K : ℝ} (hU : 1 ≤ U) (hc : 0 < c) (hK : 0 ≤ K) :
    ∀ᶠ m : ℕ in atTop, A*U^m*(2*Real.log (m:ℝ))^(m*(n-1)) <
      c*(Real.log (m:ℝ)/8)^(n*(m-n))*Real.exp (-K*Real.sqrt (m:ℝ)) := by
  have hU0 := zero_le_one.trans hU
  have hD : 0 ≤ U*2^(n-1)*8^n := by positivity
  have hr := tail_dominance_eventually_lt_one (n*n) (A/(c*8^(n*n))) K (U*2^(n-1)*8^n) hK hD
  have hlog := (Real.tendsto_log_atTop.comp
    (tendsto_natCast_atTop_atTop (R := ℝ))).eventually_ge_atTop (1:ℝ)
  filter_upwards [hr, hlog, eventually_ge_atTop n] with m hratio hmL hm
  change 1 ≤ Real.log (m:ℝ) at hmL
  have hLp : 0 < Real.log (m:ℝ) := zero_lt_one.trans_le hmL
  have hpos : 0 < c*(Real.log (m:ℝ)/8)^(n*(m-n))*Real.exp (-K*Real.sqrt (m:ℝ)) := by positivity
  have h : (A*U^m*(2*Real.log (m:ℝ))^(m*(n-1))) /
      (c*(Real.log (m:ℝ)/8)^(n*(m-n))*Real.exp (-K*Real.sqrt (m:ℝ))) < 1 := by
    rw [moving_box_exact_ratio n m hn hm hLp hc]
    exact hratio
  simpa only [one_mul] using (div_lt_iff₀ hpos).1 h


open Set MeasureTheory

theorem positiveBox_coordinate_range {n m : ℕ} {x : Fin n → ℝ} (hx : x ∈ positiveBox n m)
    (i : Fin n) :
    positiveBoxShift m+2*((i.val:ℝ)+1) ≤ x i ∧ x i ≤ positiveBoxShift m+2*((i.val:ℝ)+1)+1/2 :=
  hx i (Set.mem_univ i)

theorem positiveBox_strictMono {n m : ℕ} {x : Fin n → ℝ} (hx : x ∈ positiveBox n m) :
    StrictMono x := by
  intro i j hij
  have h : (i.val:ℝ)+1 ≤ (j.val:ℝ) := by exact_mod_cast Nat.succ_le_of_lt hij
  linarith [(positiveBox_coordinate_range hx i).2, (positiveBox_coordinate_range hx j).1]

theorem positiveBox_pos {n m : ℕ} (hm : 1 ≤ m) {x : Fin n → ℝ} (hx : x ∈ positiveBox n m)
    (i : Fin n) : 0 < x i := by
  have hm' : (1:ℝ) ≤ m := by exact_mod_cast hm
  have hw : 0 ≤ positiveBoxShift m := div_nonneg (Real.log_nonneg hm') (by norm_num)
  have hi : 0 < 2*((i.val:ℝ)+1) := by positivity
  linarith [(positiveBox_coordinate_range hx i).1]

theorem positiveBox_eventually_subset_good (n : ℕ) (U : ℝ) :
    ∀ᶠ m : ℕ in atTop, positiveBox n m ⊆ (badBoxRegion n U)ᶜ := by
  have hlog := (Real.tendsto_log_atTop.comp
    (tendsto_natCast_atTop_atTop (R := ℝ))).eventually_ge_atTop (8*U)
  filter_upwards [hlog] with m hm
  change 8*U ≤ Real.log (m:ℝ) at hm
  have hw : U ≤ positiveBoxShift m := by unfold positiveBoxShift; linarith
  intro x hx hb
  obtain ⟨i,hi⟩ := hb
  have h2 : 0 ≤ 2*((i.val:ℝ)+1) := by positivity
  linarith [(positiveBox_coordinate_range hx i).1]

/-- The finite-size tail hypothesis that remains to be verified using the
extended-Chebyshev theorem. It concerns only tuples with every shifted node
in the theta kernel's tail, not the signs of any integrated cumulants. -/
def ThetaTailIntegrandSign (n : ℕ) (U : ℝ) : Prop :=
  ∀ m : ℕ, n ≤ m → ∀ u : ℝ, 0 ≤ u → ∀ x : Fin n → ℝ, (∀ i, 0 < x i) →
    (∀ i, U ≤ u+x i) →
      0 ≤ signedCumulantIntegrand n m u x ∧
        (Function.Injective x → 0 < signedCumulantIntegrand n m u x)

theorem signedCumulantIntegral_large_argument (n m : ℕ) (hn : 1 ≤ n) (hm : n ≤ m)
    {U u : ℝ} (hu : 0 ≤ u) (hUu : U ≤ u) (htail : ThetaTailIntegrandSign n U) :
    0 < ∫ x, signedCumulantIntegrand n m u x ∂cumulantProductMeasure n := by
  let f := signedCumulantIntegrand n m u
  let μ := cumulantProductMeasure n
  have hi : Integrable f μ := signedCumulantIntegrand_integrable n m hn hm u hu
  have hge : ∀ᵐ x ∂μ, 0 ≤ f x := by
    filter_upwards [cumulantProductMeasure_ae_pos n] with x hx
    exact (htail m hm u hu x hx (fun i => by linarith [hx i])).1
  apply (integral_pos_iff_support_of_nonneg_ae hge hi).2
  have hB : positiveBox n m ⊆ Function.support f := by
    intro x hx
    have hxpos := positiveBox_pos (hn.trans hm) hx
    exact ((htail m hm u hu x hxpos (fun i => by linarith [hxpos i])).2
      (positiveBox_strictMono hx).injective).ne'
  have hμ : 0 < μ (positiveBox n m) := by
    rw [positiveBox_measure n m (hn.trans hm), ENNReal.ofReal_pos]
    positivity
  exact hμ.trans_le (measure_mono hB)

theorem signedCumulantIntegral_eventually_pos_of_tail (n : ℕ) (hn : 1 ≤ n)
    {U : ℝ} (hU : 1 ≤ U) (htail : ThetaTailIntegrandSign n U) :
    ∀ᶠ m : ℕ in atTop, ∀ u : ℝ, 0 ≤ u →
      0 < ∫ x, signedCumulantIntegrand n m u x ∂cumulantProductMeasure n := by
  obtain ⟨A,_,ha⟩ := signedCumulantIntegrand_bad_box_bound n hn hU
  obtain ⟨c,K,hc,hK,hbox⟩ := signedCumulantIntegrand_moving_box_integral_lower n U
  have hdom := moving_box_eventually_dominates n hn (A := A) hU hc hK
  have hlog := (Real.tendsto_log_atTop.comp
    (tendsto_natCast_atTop_atTop (R := ℝ))).eventually_ge_atTop (1:ℝ)
  filter_upwards [hbox,hdom,hlog,eventually_ge_atTop n,positiveBox_eventually_subset_good n U]
    with m hbox hdom hlog hm hsub
  change 1 ≤ Real.log (m:ℝ) at hlog
  intro u hu
  by_cases huU : U ≤ u
  · exact signedCumulantIntegral_large_argument n m hn hm hu huU htail
  · have huI : u ∈ Icc 0 U := ⟨hu,le_of_lt (lt_of_not_ge huU)⟩
    let μ := cumulantProductMeasure n
    let f := signedCumulantIntegrand n m u
    let B := badBoxRegion n U
    have hB : MeasurableSet B := badBoxRegion_measurable n U
    have hf : Integrable f μ := signedCumulantIntegrand_integrable n m hn hm u hu
    have hnonneg : 0 ≤ᵐ[μ.restrict Bᶜ] f := by
      have hp : ∀ᵐ x ∂(μ.restrict Bᶜ), ∀ i : Fin n, 0 < x i :=
        ae_mono Measure.restrict_le_self (cumulantProductMeasure_ae_pos n)
      filter_upwards [hp,ae_restrict_mem hB.compl] with x hx hxc
      exact (htail m hm u hu x hx (fun i => by
        have hi : U ≤ x i := le_of_not_gt (fun h => hxc ⟨i,h⟩)
        linarith)).1
    have hgood := setIntegral_mono_set hf.integrableOn hnonneg
      (Filter.Eventually.of_forall hsub)
    have hbad := (abs_integral_le_integral_abs (μ := μ.restrict B) (f := f)).trans
      (ha m hm hlog u hu)
    have hb := hbox u huI
    rw [← integral_add_compl hB hf]
    change 0 < (∫ x in B, f x ∂μ) + (∫ x in Bᶜ, f x ∂μ)
    have hgood' := hb.trans hgood
    have hbad' := (neg_abs_le (∫ x in B, f x ∂μ))
    change _ < c*positiveBoxShift m^(n*(m-n))*Real.exp (-K*Real.sqrt (m:ℝ)) at hdom
    linarith


theorem signedCumulantHankel_pos_of_integral_pos (n m : ℕ) (hm : n ≤ m) {u : ℝ}
    (hu : 0 ≤ u)
    (h : 0 < ∫ x, signedCumulantIntegrand n m u x ∂cumulantProductMeasure n) :
    0 < (-1:ℝ)^(n.choose 2)*(cumulantHankel m n u).det := by
  let f : (Fin n → ℝ) → ℝ := fun x => cumulantVandermonde n x*(∏ i, x i^(m-n))*
    (thetaDerivativeMatrix n u x).det
  let μ := cumulantProductMeasure n
  let e : ℝ := (-1:ℝ)^(n.choose 2)
  let a : ℝ := ∏ i : Fin n, ((rowMomentPower m i).factorial : ℝ)⁻¹
  have ha : 0 < a := by
    unfold a
    exact Finset.prod_pos (fun i _ => inv_pos.mpr (by exact_mod_cast Nat.factorial_pos _))
  have hN : 0 < (n.factorial:ℝ) := by exact_mod_cast Nat.factorial_pos n
  have hI : (n.factorial:ℝ)*(cumulantHankel m n u).det = a*(∫ x, f x ∂μ) :=
    cumulantHankel_vandermonde_integral m n hm hu
  have he : (n.factorial:ℝ)*(e*(cumulantHankel m n u).det) =
      a*(∫ x, signedCumulantIntegrand n m u x ∂μ) := by
    have hf (x : Fin n → ℝ) : signedCumulantIntegrand n m u x = e*f x := by
      unfold signedCumulantIntegrand e f
      ring
    simp_rw [hf]
    rw [MeasureTheory.integral_const_mul]
    calc
      _ = e *((n.factorial:ℝ)*(cumulantHankel m n u).det) := by ring
      _ = _ := by rw [hI]; ring
  exact pos_of_mul_pos_right (he.symm ▸ mul_pos ha h) hN.le

theorem signedCumulantHankel_eventually_pos_of_tail (n : ℕ) (hn : 1 ≤ n) {U : ℝ}
    (hU : 1 ≤ U) (htail : ThetaTailIntegrandSign n U) :
    ∀ᶠ m : ℕ in atTop, ∀ u : ℝ, 0 ≤ u →
      0 < (-1:ℝ)^(n.choose 2)*(cumulantHankel m n u).det := by
  filter_upwards [signedCumulantIntegral_eventually_pos_of_tail n hn hU htail, eventually_ge_atTop n]
    with m hm hnm
  exact fun u hu => signedCumulantHankel_pos_of_integral_pos n m hnm hu (hm u hu)

end NuttallCumulants
