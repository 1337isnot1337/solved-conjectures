import Mathlib.Analysis.Real.Pi.Bounds
import Mathlib.Analysis.SpecialFunctions.Pow.Real
import Mathlib.Algebra.Order.BigOperators.GroupWithZero.Finset
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring
import Lean.Elab.Tactic.Omega
import Lean.Elab.Tactic.NormCast

/-! A uniform finite trigonometric estimate for the Fourier part of the
line-size asymptotic. The sum uses the first `N` positive frequencies. -/
noncomputable section

namespace LineSize.Fourier

open Real Finset
open scoped BigOperators

def energy (N : ℕ) (theta : ℝ) : ℝ :=
  ∑ j ∈ Finset.range N, Real.sin (((j:ℝ)+1)*theta/2)^2

def cosineSum (N : ℕ) (theta : ℝ) : ℝ :=
  ∑ j ∈ Finset.range N, Real.cos (((j:ℝ)+1)*theta)

def energyConstant : ℝ := 1/1572864

theorem energyConstant_pos : 0<energyConstant := by norm_num [energyConstant]

theorem energy_nonneg (N : ℕ) (theta : ℝ) : 0≤energy N theta := by
  unfold energy
  exact Finset.sum_nonneg (fun _ _ => sq_nonneg _)

theorem energy_mono {m N : ℕ} (hm : m≤N) (theta : ℝ) :
    energy m theta≤energy N theta := by
  unfold energy
  apply Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono hm)
  intro j hj hjm
  exact sq_nonneg _

theorem half_le_sin {x : ℝ} (hx : 0≤x) (hpi : x≤Real.pi/2) : x/2≤Real.sin x := by
  have hc : (1/2:ℝ)≤2/Real.pi := by
    apply (le_div_iff₀ Real.pi_pos).2
    have hp := Real.pi_lt_four
    linarith
  calc
    x/2=(1/2)*x := by ring
    _≤(2/Real.pi)*x := mul_le_mul_of_nonneg_right hc hx
    _≤Real.sin x := Real.mul_le_sin hx hpi

theorem sum_sq_lower (m : ℕ) :
    (m:ℝ)^3≤3*(∑ j ∈ Finset.range m, ((j:ℝ)+1)^2) := by
  induction m with
  | zero => simp
  | succ m ih =>
      rw [Finset.sum_range_succ]
      simp only [Nat.cast_add,Nat.cast_one]
      have hm : (0:ℝ)≤m := Nat.cast_nonneg m
      nlinarith

theorem energy_small {N : ℕ} (hN : 32≤N) {theta : ℝ} (htheta : 0≤theta)
    (hsmall : (N:ℝ)*theta≤16) :
    energyConstant*((N:ℝ)^3*theta^2)≤energy N theta := by
  let m : ℕ := N/16
  have hmN : m≤N := Nat.div_le_self N 16
  have hm16 : (m:ℝ)*16≤(N:ℝ) := by
    exact_mod_cast (Nat.div_mul_le_self N 16)
  have hNm : (N:ℝ)≤32*(m:ℝ) := by
    have hn : N≤32*m := by dsimp [m]; omega
    exact_mod_cast hn
  have hmtheta : (m:ℝ)*theta≤1 := by
    have hp := mul_le_mul_of_nonneg_right hm16 htheta
    nlinarith
  have hterm : ∀ j ∈ Finset.range m,
      ((j:ℝ)+1)^2*theta^2/16≤Real.sin (((j:ℝ)+1)*theta/2)^2 := by
    intro j hj
    have hjm : (j:ℝ)+1≤(m:ℝ) := by
      exact_mod_cast (Nat.succ_le_iff.mpr (Finset.mem_range.mp hj))
    have hx0 : 0≤((j:ℝ)+1)*theta/2 := by positivity
    have hxhalf : ((j:ℝ)+1)*theta/2≤1/2 := by
      have hp := mul_le_mul_of_nonneg_right hjm htheta
      linarith
    have hxpi : ((j:ℝ)+1)*theta/2≤Real.pi/2 := by
      have hp := Real.pi_gt_three
      linarith
    have hs := pow_le_pow_left₀ (by positivity : 0≤(((j:ℝ)+1)*theta/2)/2)
      (half_le_sin hx0 hxpi) 2
    convert hs using 1
    ring
  have hsum := Finset.sum_le_sum hterm
  have hprefix : (∑ j ∈ Finset.range m, ((j:ℝ)+1)^2)*theta^2≤16*energy m theta := by
    have hs : (∑ j ∈ Finset.range m, ((j:ℝ)+1)^2)*theta^2/16≤energy m theta := by
      simpa only [div_eq_mul_inv,← Finset.sum_mul,energy] using hsum
    linarith
  have hsumSq := mul_le_mul_of_nonneg_right (sum_sq_lower m) (sq_nonneg theta)
  have hmono := energy_mono hmN theta
  have hpow := pow_le_pow_left₀ (Nat.cast_nonneg N) hNm 3
  have hpowTheta := mul_le_mul_of_nonneg_right hpow (sq_nonneg theta)
  norm_num [mul_pow] at hpowTheta
  unfold energyConstant
  nlinarith

theorem sine_step (j : ℕ) (theta : ℝ) :
    Real.sin (((j:ℝ)+1+1/2)*theta)-Real.sin (((j:ℝ)+1/2)*theta)=
      2*Real.sin (theta/2)*Real.cos (((j:ℝ)+1)*theta) := by
  have ha : ((j:ℝ)+1+1/2)*theta=((j:ℝ)+1)*theta+theta/2 := by ring
  have hb : ((j:ℝ)+1/2)*theta=((j:ℝ)+1)*theta-theta/2 := by ring
  rw [ha,hb,Real.sin_add,Real.sin_sub]
  ring

theorem cosine_telescope (N : ℕ) (theta : ℝ) :
    2*Real.sin (theta/2)*cosineSum N theta=
      Real.sin (((N:ℝ)+1/2)*theta)-Real.sin (theta/2) := by
  induction N with
  | zero =>
      simp only [cosineSum,Finset.range_zero,Finset.sum_empty,Nat.cast_zero,mul_zero,zero_add]
      have harg : (1/2:ℝ)*theta=theta/2 := by ring
      rw [harg]
      ring
  | succ N ih =>
      unfold cosineSum at *
      rw [Finset.sum_range_succ]
      simp only [Nat.cast_add,Nat.cast_one]
      have hs := sine_step N theta
      nlinarith

theorem energy_cosine (N : ℕ) (theta : ℝ) :
    2*energy N theta=(N:ℝ)-cosineSum N theta := by
  have hterm : ∀ j : ℕ,
      2*Real.sin (((j:ℝ)+1)*theta/2)^2=1-Real.cos (((j:ℝ)+1)*theta) := by
    intro j
    rw [Real.sin_sq_eq_half_sub]
    have harg : 2*(((j:ℝ)+1)*theta/2)=((j:ℝ)+1)*theta := by ring
    rw [harg]
    ring
  unfold energy cosineSum
  rw [Finset.mul_sum]
  simp_rw [hterm]
  simp [Finset.sum_sub_distrib]

theorem energy_large {N : ℕ} (_hN : 32≤N) {theta : ℝ} (_htheta : 0≤theta)
    (hpi : theta≤Real.pi) (hlarge : 16≤(N:ℝ)*theta) :
    (N:ℝ)/4≤energy N theta := by
  have hN0 : (0:ℝ)≤N := Nat.cast_nonneg N
  have htheta0 : 0<theta := by
    by_contra h
    have hp := mul_nonpos_of_nonneg_of_nonpos hN0 (le_of_not_gt h)
    linarith
  have hsin : theta/4≤Real.sin (theta/2) := by
    have hh := half_le_sin (by linarith : 0≤theta/2)
      (by linarith : theta/2≤Real.pi/2)
    convert hh using 1
    ring
  have hspos : 0<Real.sin (theta/2) := by linarith
  have hNs : 4≤(N:ℝ)*Real.sin (theta/2) := by
    have hp := mul_le_mul_of_nonneg_left hsin hN0
    nlinarith
  have htelescope := cosine_telescope N theta
  have hsinUpper := Real.sin_le_one (((N:ℝ)+1/2)*theta)
  have hC : cosineSum N theta≤(N:ℝ)/2 := by
    apply le_of_mul_le_mul_left (a:=Real.sin (theta/2)) ?_ hspos
    nlinarith
  have henergy := energy_cosine N theta
  linarith

theorem energy_bound_nonneg {N : ℕ} (hN : 32≤N) {theta : ℝ}
    (htheta : 0≤theta) (hpi : theta≤Real.pi) :
    energyConstant*min (N:ℝ) ((N:ℝ)^3*theta^2)≤energy N theta := by
  by_cases hs : (N:ℝ)*theta≤16
  · exact (mul_le_mul_of_nonneg_left (min_le_right _ _) energyConstant_pos.le).trans
      (energy_small hN htheta hs)
  · have he := energy_large hN htheta hpi (le_of_lt (lt_of_not_ge hs))
    calc
      energyConstant*min (N:ℝ) ((N:ℝ)^3*theta^2)≤energyConstant*(N:ℝ) :=
        mul_le_mul_of_nonneg_left (min_le_left _ _) energyConstant_pos.le
      _≤(1/4:ℝ)*(N:ℝ) := mul_le_mul_of_nonneg_right
        (by norm_num [energyConstant]) (Nat.cast_nonneg N)
      _=(N:ℝ)/4 := by ring
      _≤energy N theta := he

@[simp] theorem energy_neg (N : ℕ) (theta : ℝ) : energy N (-theta)=energy N theta := by
  unfold energy
  simp only [mul_neg,neg_div,Real.sin_neg,neg_sq]

@[simp] theorem energy_abs (N : ℕ) (theta : ℝ) : energy N |theta|=energy N theta := by
  rcases le_total 0 theta with ht | ht
  · rw [abs_of_nonneg ht]
  · rw [abs_of_nonpos ht,energy_neg]

/-- A single constant controls both the quadratic window and all larger
frequencies up to pi. The value is deliberately independent of `N`. -/
theorem energy_bound {N : ℕ} (hN : 32≤N) {theta : ℝ} (htheta : |theta|≤Real.pi) :
    energyConstant*min (N:ℝ) ((N:ℝ)^3*theta^2)≤energy N theta := by
  simpa only [energy_abs,sq_abs] using energy_bound_nonneg hN (abs_nonneg theta) htheta

theorem exists_energy_constant : ∃ c : ℝ, 0<c ∧
    ∀ (N : ℕ) (theta : ℝ), 32≤N → |theta|≤Real.pi →
      c*min (N:ℝ) ((N:ℝ)^3*theta^2)≤
        ∑ j ∈ Finset.range N, Real.sin (((j:ℝ)+1)*theta/2)^2 := by
  exact ⟨energyConstant,energyConstant_pos,fun _ _ hN ht => energy_bound hN ht⟩

/-! The corresponding real majorant for geometric characteristic factors.
The complex norm identity is kept in the separate characteristic-function
module. This section proves the real inequalities for its exact expression. -/

def geometricMajorant (q x : ℝ) : ℝ :=
  (1+4*q/(1-q)^2*Real.sin (x/2)^2)^(-(1/2):ℝ)

def damping (K : ℝ) : ℝ := K/(1+K)/2

def productConstant (a : ℝ) : ℝ := damping (4*Real.exp (-a))*energyConstant

theorem damping_pos {K : ℝ} (hK : 0<K) : 0<damping K := by
  unfold damping
  positivity

theorem productConstant_pos (a : ℝ) : 0<productConstant a := by
  exact mul_pos (damping_pos (by positivity)) energyConstant_pos

theorem geometricMajorant_pos {q x : ℝ} (hq : 0≤q) : 0<geometricMajorant q x := by
  unfold geometricMajorant
  apply Real.rpow_pos_of_pos
  positivity

theorem geometricMajorant_le_one {q x : ℝ} (hq : 0≤q) : geometricMajorant q x≤1 := by
  have hnonneg : 0≤4*q/(1-q)^2*Real.sin (x/2)^2 := by positivity
  have hb : 1≤1+4*q/(1-q)^2*Real.sin (x/2)^2 := by linarith
  unfold geometricMajorant
  rw [Real.rpow_def_of_pos (lt_of_lt_of_le zero_lt_one hb)]
  apply Real.exp_le_one_iff.mpr
  exact mul_nonpos_of_nonneg_of_nonpos (Real.log_nonneg hb) (by norm_num)

theorem log_majorant_lower {K B s : ℝ} (hK : 0≤K) (hKB : K≤B)
    (hs : 0≤s) (hsone : s≤1) : K/(1+K)*s≤Real.log (1+B*s) := by
  have hy : 0≤K*s := mul_nonneg hK hs
  have hyp : 0<1+K*s := by linarith
  have hKp : 0<1+K := by linarith
  have hden : 1+K*s≤1+K := by
    have hh := mul_le_mul_of_nonneg_left hsone hK
    linarith
  have hfrac : K*s/(1+K)≤K*s/(1+K*s) := by
    apply (div_le_div_iff₀ hKp hyp).2
    exact mul_le_mul_of_nonneg_left hden hy
  have hlog : K*s/(1+K*s)≤Real.log (1+K*s) := by
    convert Real.one_sub_inv_le_log_of_pos hyp using 1
    field_simp [ne_of_gt hyp]
    ring
  have hlogMono : Real.log (1+K*s)≤Real.log (1+B*s) := by
    apply Real.log_le_log hyp
    have hh := mul_le_mul_of_nonneg_right hKB hs
    linarith
  calc
    K/(1+K)*s=K*s/(1+K) := by ring
    _≤K*s/(1+K*s) := hfrac
    _≤Real.log (1+K*s) := hlog
    _≤Real.log (1+B*s) := hlogMono

theorem geometricMajorant_le_exp {q K x : ℝ} (hq : 0≤q) (hK : 0<K)
    (hKq : K≤4*q/(1-q)^2) :
    geometricMajorant q x≤Real.exp (-damping K*Real.sin (x/2)^2) := by
  have hs := log_majorant_lower hK.le hKq
    (sq_nonneg (Real.sin (x/2))) (Real.sin_sq_le_one (x/2))
  have hb : 0<1+4*q/(1-q)^2*Real.sin (x/2)^2 := by positivity
  unfold geometricMajorant
  rw [Real.rpow_def_of_pos hb]
  apply Real.exp_le_exp.mpr
  unfold damping
  nlinarith

theorem rate_strength_lower {a q : ℝ} (hq : Real.exp (-a)≤q) (hqone : q<1) :
    4*Real.exp (-a)≤4*q/(1-q)^2 := by
  have hqpos : 0<q := (Real.exp_pos _).trans_le hq
  have hden : 0<(1-q)^2 := sq_pos_of_pos (by linarith)
  have hdenone : (1-q)^2≤1 := by
    have hh := pow_le_pow_left₀ (by linarith : 0≤1-q) (by linarith : 1-q≤1) 2
    simpa only [one_pow] using hh
  have hfrac : 4*q≤4*q/(1-q)^2 := by
    apply (le_div_iff₀ hden).2
    simpa only [mul_one] using
      mul_le_mul_of_nonneg_left hdenone (by positivity : 0≤4*q)
  exact (mul_le_mul_of_nonneg_left hq (by norm_num : (0:ℝ)≤4)).trans hfrac

/-- The real product bound is uniform in the scale and in the number of
factors. Only the fixed upper bound `a` enters its positive constant. -/
theorem geometric_product_bound {N : ℕ} (hN : 32≤N) {a t theta : ℝ}
    (ht : 0<t) (hNa : (N:ℝ)*t≤a) (htheta : |theta|≤Real.pi) :
    (∏ j ∈ Finset.range N,
      geometricMajorant (Real.exp (-t*((j:ℝ)+1))) (((j:ℝ)+1)*theta))≤
      Real.exp (-productConstant a*min (N:ℝ) ((N:ℝ)^3*theta^2)) := by
  have hK : 0<4*Real.exp (-a) := by positivity
  have hrate : ∀ j ∈ Finset.range N,
      Real.exp (-a)≤Real.exp (-t*((j:ℝ)+1)) := by
    intro j hj
    have hjN : (j:ℝ)+1≤(N:ℝ) := by
      exact_mod_cast (Nat.succ_le_iff.mpr (Finset.mem_range.mp hj))
    have hp := mul_le_mul_of_nonneg_left hjN ht.le
    apply Real.exp_le_exp.mpr
    nlinarith
  have hrateOne : ∀ j : ℕ, Real.exp (-t*((j:ℝ)+1))<1 := by
    intro j
    apply Real.exp_lt_one_iff.mpr
    have hp : 0<t*((j:ℝ)+1) := mul_pos ht (by positivity)
    nlinarith
  have hfactor : ∀ j ∈ Finset.range N,
      geometricMajorant (Real.exp (-t*((j:ℝ)+1))) (((j:ℝ)+1)*theta)≤
        Real.exp (-damping (4*Real.exp (-a))*Real.sin (((j:ℝ)+1)*theta/2)^2) := by
    intro j hj
    exact geometricMajorant_le_exp (Real.exp_pos _).le hK
      (rate_strength_lower (hrate j hj) (hrateOne j))
  have hprod := Finset.prod_le_prod₀
    (fun j (_ : j ∈ Finset.range N) =>
      (geometricMajorant_pos (q:=Real.exp (-t*((j:ℝ)+1)))
        (x:=((j:ℝ)+1)*theta) (Real.exp_pos _).le).le) hfactor
  rw [← Real.exp_sum,← Finset.mul_sum] at hprod
  change (∏ j ∈ Finset.range N,
      geometricMajorant (Real.exp (-t*((j:ℝ)+1))) (((j:ℝ)+1)*theta))≤
    Real.exp (-damping (4*Real.exp (-a))*energy N theta) at hprod
  apply hprod.trans
  apply Real.exp_le_exp.mpr
  have hscale := mul_le_mul_of_nonneg_left (energy_bound hN htheta) (damping_pos hK).le
  unfold productConstant
  nlinarith

theorem geometric_product_bound_of_le_div {N : ℕ} (hN : 32≤N) {a t theta : ℝ}
    (ht : 0<t) (hNa : (N:ℝ)≤a/t) (htheta : |theta|≤Real.pi) :
    (∏ j ∈ Finset.range N,
      geometricMajorant (Real.exp (-t*((j:ℝ)+1))) (((j:ℝ)+1)*theta))≤
      Real.exp (-productConstant a*min (N:ℝ) ((N:ℝ)^3*theta^2)) :=
  geometric_product_bound hN ht ((le_div_iff₀ ht).mp hNa) htheta

end LineSize.Fourier
