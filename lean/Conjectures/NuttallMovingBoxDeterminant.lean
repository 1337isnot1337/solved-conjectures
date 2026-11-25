module

public import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
public import Mathlib.Analysis.SpecificLimits.Normed
public import Mathlib.LinearAlgebra.Vandermonde
public import Mathlib.Algebra.BigOperators.Intervals
public import Conjectures.NuttallDerivativeRatio
public import Conjectures.NuttallAndreief
import all Conjectures.NuttallAndreief
import all Conjectures.NuttallHankelTransfer
public import Mathlib.Analysis.Real.Sqrt

public section
namespace NuttallCumulants
open Finset Matrix

theorem abs_prod_sub_prod_le {ι : Type*} (s : Finset ι)
    (a b : ι → ℝ) {M E : ℝ} (hM : 1 ≤ M) (hE : 0 ≤ E)
    (ha : ∀ i ∈ s, |a i| ≤ M) (hb : ∀ i ∈ s, |b i| ≤ M)
    (he : ∀ i ∈ s, |a i - b i| ≤ E) :
    |(∏ i ∈ s, a i) - (∏ i ∈ s, b i)| ≤ (s.card:ℝ) * E * M^s.card := by
  classical
  have hM0 : 0 ≤ M := zero_le_one.trans hM
  induction s using Finset.induction_on with
  | empty => simp
  | insert x s hx ih =>
    have ha' i (hi : i ∈ s) := ha i (mem_insert_of_mem hi)
    have hb' i (hi : i ∈ s) := hb i (mem_insert_of_mem hi)
    have he' i (hi : i ∈ s) := he i (mem_insert_of_mem hi)
    have hprod : |∏ i ∈ s, a i| ≤ M^s.card := by
      rw [Finset.abs_prod, ← Finset.prod_const]
      exact Finset.prod_le_prod₀ (fun _ _ => abs_nonneg _) ha'
    have hrest := ih ha' hb' he'
    simp only [Finset.prod_insert hx, Finset.card_insert_of_notMem hx, Nat.cast_succ, pow_succ]
    let A := ∏ i ∈ s, a i
    let B := ∏ i ∈ s, b i
    change |a x*A-b x*B| ≤ ((s.card:ℝ)+1)*E*(M^s.card*M)
    rw [show a x*A-b x*B = (a x-b x)*A + b x*(A-B) by ring]
    calc
      _ ≤ |a x-b x| *|A| + |b x| *|A-B| := by
        simpa only [abs_mul] using abs_add_le ((a x-b x)*A) (b x*(A-B))
      _ ≤ E*M^s.card + M*((s.card:ℝ)*E*M^s.card) :=
        add_le_add (mul_le_mul (he x (mem_insert_self _ _)) hprod (abs_nonneg _) hE)
          (mul_le_mul (hb x (mem_insert_self _ _)) hrest (abs_nonneg _) hM0)
      _ ≤ _ := by
        have h := mul_le_mul_of_nonneg_left hM (mul_nonneg hE (pow_nonneg hM0 s.card))
        nlinarith only [h]

theorem abs_det_sub_det_le {ι : Type*} [Fintype ι] [DecidableEq ι]
    (A B : Matrix ι ι ℝ) {M E : ℝ} (hM : 1 ≤ M) (hE : 0 ≤ E)
    (hA : ∀ i j, |A i j| ≤ M) (hB : ∀ i j, |B i j| ≤ M)
    (he : ∀ i j, |A i j - B i j| ≤ E) :
    |A.det-B.det| ≤ ((Fintype.card ι).factorial : ℝ) *
      (Fintype.card ι:ℝ) * E * M^(Fintype.card ι) := by
  classical
  simp only [Matrix.det_apply', ← sum_sub_distrib, ← mul_sub]
  refine (Finset.abs_sum_le_sum_abs _ _).trans ?_
  let D : ℝ := (Fintype.card ι:ℝ) * E * M^(Fintype.card ι)
  calc
    _ ≤ ∑ _ : Equiv.Perm ι, D := by
      apply Finset.sum_le_sum
      intro σ _
      have hsign : |(↑(Equiv.Perm.sign σ) : ℝ)| = 1 := by
        rcases Int.units_eq_one_or (Equiv.Perm.sign σ) with h | h <;> norm_num [h]
      rw [abs_mul, hsign, one_mul]
      simpa only [D, card_univ] using abs_prod_sub_prod_le Finset.univ
        (fun i => A (σ i) i) (fun i => B (σ i) i) hM hE
        (fun i _ => hA _ _) (fun i _ => hB _ _) (fun i _ => he _ _)
    _ = _ := by
      simp only [Finset.sum_const, Finset.card_univ, Fintype.card_perm, nsmul_eq_mul, D]
      ring

theorem sum_fin_val_choose_two (n : ℕ) : ∑ i : Fin n, i.val = n.choose 2 := by
  rw [Fin.sum_univ_eq_sum_range (fun m : ℕ => m) n, Finset.sum_range_id, Nat.choose_two_right]

theorem sum_card_Ioi_fin (n : ℕ) : (∑ i : Fin n, (Finset.Ioi i).card) = n.choose 2 := by
  rw [← sum_fin_val_choose_two]
  rw [← Equiv.sum_comp (Fin.revPerm : Equiv.Perm (Fin n))]
  apply Finset.sum_congr rfl
  intro i _
  simp
  have := i.isLt
  omega

/-- Signed Vandermonde lower bound for nodes with fixed separation. -/
theorem signed_det_neg_four_vandermonde_lower (n : ℕ) (x : Fin n → ℝ) {δ : ℝ}
    (hδ : 0 < δ) (hx : ∀ i j : Fin n, i < j → δ ≤ x j - x i) :
    (4*δ)^(n.choose 2) ≤
      (-1 : ℝ)^(n.choose 2) * (Matrix.vandermonde (fun i => -4*x i)).det := by
  rw [Matrix.det_vandermonde]
  simp_rw [show ∀ a b : ℝ, -4*b - -4*a = (-1)* (4*(b-a)) from fun a b => by ring,
    Finset.prod_mul_distrib, Finset.prod_const, Finset.prod_pow_eq_pow_sum, sum_card_Ioi_fin]
  rw [← mul_assoc, ← mul_pow]
  norm_num
  rw [mul_pow]
  apply mul_le_mul_of_nonneg_left _ (pow_nonneg (by norm_num) _)
  rw [← sum_card_Ioi_fin n, ← Finset.prod_pow_eq_pow_sum]
  apply Finset.prod_le_prod₀ (fun _ _ => pow_nonneg hδ.le _)
  intro i _
  rw [← Finset.prod_const]
  exact Finset.prod_le_prod₀ (fun _ _ => hδ.le)
    (fun j hj => hx i j (Finset.mem_Ioi.mp hj))


theorem signed_det_of_close_to_vandermonde (n : ℕ) (x : Fin n → ℝ)
    (A : Matrix (Fin n) (Fin n) ℝ) {δ M E : ℝ}
    (hδ : 0 < δ) (hx : ∀ i j : Fin n, i < j → δ ≤ x j - x i)
    (hM : 1 ≤ M) (hE : 0 ≤ E) (hA : ∀ i j, |A i j| ≤ M)
    (hB : ∀ i j : Fin n, |(-4*x i)^j.val| ≤ M)
    (he : ∀ i j : Fin n, |A i j - (-4*x i)^j.val| ≤ E)
    (hsmall : (n.factorial:ℝ)*(n:ℝ)*E*M^n ≤ (4*δ)^(n.choose 2)/2) :
    (4*δ)^(n.choose 2)/2 ≤ (-1:ℝ)^(n.choose 2)*A.det := by
  let B := Matrix.vandermonde (fun i => -4*x i)
  let c : ℝ := (-1:ℝ)^(n.choose 2)
  have hc : |c| = 1 := by simp [c, abs_pow]
  have hgap : (4*δ)^(n.choose 2) ≤ c*B.det :=
    signed_det_neg_four_vandermonde_lower n x hδ hx
  have hpert := abs_det_sub_det_le A B hM hE hA
    (fun i j => by simpa [B, Matrix.vandermonde_apply] using hB i j)
    (fun i j => by simpa [B, Matrix.vandermonde_apply] using he i j)
  simp only [Fintype.card_fin] at hpert
  have hdiff : |c*B.det - c*A.det| ≤ (4*δ)^(n.choose 2)/2 := by
    rw [← mul_sub, abs_mul, hc, one_mul, abs_sub_comm]
    exact hpert.trans hsmall
  have hle := (le_abs_self (c*B.det-c*A.det)).trans hdiff
  linarith

noncomputable def thetaDerivativeAtNodes (n : ℕ) (t : Fin n → ℝ) : Matrix (Fin n) (Fin n) ℝ :=
  Matrix.of fun i j => iteratedDeriv j.val thetaKernel (t i)

noncomputable def thetaDerivativeNormalizedAtNodes (n : ℕ) (t : Fin n → ℝ) (l : ℝ) :
    Matrix (Fin n) (Fin n) ℝ :=
  Matrix.of fun i j => (iteratedDeriv j.val thetaKernel (t i) / thetaKernel (t i)) / l^j.val

theorem thetaDerivativeAtNodes_det_rescale (n : ℕ) (t : Fin n → ℝ) {l : ℝ}
    (hl : 0 < l) (ht : ∀ i, 0 ≤ t i) :
    (thetaDerivativeAtNodes n t).det =
      (∏ i, thetaKernel (t i)) * l^(n.choose 2) * (thetaDerivativeNormalizedAtNodes n t l).det := by
  have h :
      thetaDerivativeAtNodes n t =
        (Matrix.diagonal fun i => thetaKernel (t i)) *
          thetaDerivativeNormalizedAtNodes n t l * Matrix.diagonal (fun j => l^j.val) := by
    ext i j
    rw [Matrix.mul_diagonal, Matrix.diagonal_mul]
    simp only [thetaDerivativeAtNodes, thetaDerivativeNormalizedAtNodes, Matrix.of_apply]
    have hz := (thetaKernel_pos (ht i)).ne'
    field_simp [hl.ne', hz]
  rw [h, Matrix.det_mul, Matrix.det_mul, Matrix.det_diagonal, Matrix.det_diagonal,
    Finset.prod_pow_eq_pow_sum, sum_fin_val_choose_two]
  ring

theorem thetaDerivative_scaled_det_lower (n : ℕ) {L δ : ℝ} (hL : 0 ≤ L) (hδ : 0 < δ) :
    ∃ U T c : ℝ, 1 ≤ U ∧ 1 ≤ T ∧ 0 < c ∧
      ∀ l ≥ T, ∀ t : Fin n → ℝ, (∀ i, U ≤ t i) →
        (∀ i, firstHankelScale (t i)/l ≤ L) →
        (∀ i j, i < j → δ ≤ firstHankelScale (t j)/l - firstHankelScale (t i)/l) →
        c * ((∏ i, thetaKernel (t i)) * l^(n.choose 2)) ≤
          (-1 : ℝ)^(n.choose 2)*(thetaDerivativeAtNodes n t).det := by
  obtain ⟨C,U,hC,hU,hB⟩ := thetaDerivative_ratio_uniform n
  let K : ℝ := C*(1+L)^n
  let M : ℝ := (1+4*L)^n + K
  let c : ℝ := (4*δ)^(n.choose 2)/2
  let T : ℝ := max 1 ((n.factorial:ℝ)*(n:ℝ)*K*M^n/c)
  have hK : 0 ≤ K := by unfold K; positivity
  have hM : 1 ≤ M := by
    have h : 1 ≤ (1+4*L)^n := one_le_pow₀ (by linarith)
    dsimp [M]; linarith
  have hc : 0 < c := by unfold c; positivity
  refine ⟨U,T,c,hU,le_max_left _ _,hc,?_⟩
  intro l hl t ht hbound hgap
  have hl1 : 1 ≤ l := (le_max_left _ _).trans hl
  have hl0 : 0 < l := zero_lt_one.trans_le hl1
  let x : Fin n → ℝ := fun i => firstHankelScale (t i)/l
  let A := thetaDerivativeNormalizedAtNodes n t l
  have hx (i : Fin n) : 0 < x i := div_pos (firstHankelScale_pos _) hl0
  have hEntryB (i j : Fin n) : |(-4*x i)^j.val| ≤ (1+4*L)^n := by
    rw [abs_pow, abs_mul, abs_of_pos (hx i)]
    norm_num only [abs_neg, abs_of_nonneg (by norm_num : (0:ℝ) ≤ 4)]
    exact (pow_le_pow_left₀ (mul_nonneg (by norm_num) (hx i).le) (by linarith [hbound i]) _).trans
      (pow_le_pow_right₀ (by linarith) (Nat.le_of_lt j.isLt))
  have hEntryE (i j : Fin n) : |A i j-(-4*x i)^j.val| ≤ K/l := by
    by_cases hj : j.val = 0
    · have ht0 : 0 ≤ t i := zero_le_one.trans (hU.trans (ht i))
      simp only [A, thetaDerivativeNormalizedAtNodes, Matrix.of_apply, hj, iteratedDeriv_zero,
        pow_zero, div_one, div_self (thetaKernel_pos ht0).ne', sub_self, abs_zero]
      positivity
    · have hj1 : 1 ≤ j.val := Nat.one_le_iff_ne_zero.mpr hj
      have h := hB (t i) (ht i) j.val hj1 (Nat.le_of_lt j.isLt)
      have hlpow : 0 < l^j.val := pow_pos hl0 _
      have he : (-4*x i)^j.val = (-4*firstHankelScale (t i))^j.val/l^j.val := by
        unfold x
        rw [← mul_div_assoc, div_pow]
      rw [he]
      change |(iteratedDeriv j.val thetaKernel (t i)/thetaKernel (t i))/l^j.val -
        (-4*firstHankelScale (t i))^j.val/l^j.val| ≤ _
      rw [← sub_div, abs_div, abs_of_pos hlpow]
      calc
        _ ≤ C * firstHankelScale (t i)^(j.val-1)/l^j.val :=
          div_le_div_of_nonneg_right h hlpow.le
        _ = C*(x i)^(j.val-1)/l := by
          conv_lhs => rw [show j.val = (j.val-1)+1 by omega, pow_succ]
          rw [show j.val-1+1-1=j.val-1 by omega]
          unfold x
          rw [div_pow]
          field_simp [hl0.ne']
        _ ≤ K/l := by
          apply div_le_div_of_nonneg_right _ hl0.le
          apply mul_le_mul_of_nonneg_left _ hC
          exact (pow_le_pow_left₀ (hx i).le (by linarith [hbound i]) _).trans
            (pow_le_pow_right₀ (by linarith) (by have := j.isLt; omega))
  have hE0 : 0 ≤ K/l := div_nonneg hK hl0.le
  have hEl : K/l ≤ K := (div_le_iff₀ hl0).mpr (le_mul_of_one_le_right hK hl1)
  have hA (i j : Fin n) : |A i j| ≤ M := by
    calc
      _ ≤ |A i j-(-4*x i)^j.val| + |(-4*x i)^j.val| := by
        simpa only [sub_zero] using abs_sub_le (A i j) ((-4*x i)^j.val) 0
      _ ≤ M := by
        rw [add_comm]
        exact add_le_add (hEntryB i j) ((hEntryE i j).trans hEl)
  have hsmall : (n.factorial:ℝ)*(n:ℝ)*(K/l)*M^n ≤ (4*δ)^(n.choose 2)/2 := by
    have h := (le_max_right (1:ℝ) ((n.factorial:ℝ)*(n:ℝ)*K*M^n/c)).trans hl
    have h' := (div_le_iff₀ hc).mp h
    change _ ≤ c
    calc
      _ = ((n.factorial:ℝ)*(n:ℝ)*K*M^n)/l := by ring
      _ ≤ c := (div_le_iff₀ hl0).2 (by linarith)
  have hDm : c ≤ (-1:ℝ)^(n.choose 2)*A.det :=
    signed_det_of_close_to_vandermonde n x A hδ hgap hM hE0 hA
      (fun i j => (hEntryB i j).trans (le_add_of_nonneg_right hK)) hEntryE hsmall
  have ht0 (i : Fin n) : 0 ≤ t i := zero_le_one.trans (hU.trans (ht i))
  have hprod : 0 ≤ (∏ i, thetaKernel (t i))*l^(n.choose 2) :=
    mul_nonneg (Finset.prod_nonneg fun i _ => (thetaKernel_pos (ht0 i)).le) (pow_nonneg hl0.le _)
  rw [thetaDerivativeAtNodes_det_rescale n t hl0 ht0]
  convert mul_le_mul_of_nonneg_right hDm hprod using 1
  simp only [A]
  ring

open Filter Set
open scoped Topology

theorem firstHankelScale_translate_div (u w d : ℝ) :
    firstHankelScale (u+w+d) / Real.exp (4*w) = Real.pi*Real.exp (4*(u+d)) := by
  rw [firstHankelScale, show 4*(u+w+d) = 4*(u+d)+4*w by ring, Real.exp_add]
  rw [← mul_assoc, mul_div_cancel_right₀ _ (Real.exp_pos _).ne']

theorem thetaDerivative_translated_box_lower (n : ℕ) (H : ℝ) :
    ∃ W c : ℝ, 1 ≤ W ∧ 0 < c ∧ ∀ w ≥ W, ∀ u ∈ Set.Icc 0 H, ∀ d : Fin n → ℝ,
      (∀ i, d i ∈ Set.Icc (2*((i.val:ℝ)+1)) (2*((i.val:ℝ)+1)+1/2)) →
      let t := fun i => u+w+d i
      c * ((∏ i, thetaKernel (t i)) * (Real.exp (4*w))^(n.choose 2)) ≤
        (-1 : ℝ)^(n.choose 2)*(thetaDerivativeAtNodes n t).det := by
  let L := Real.pi*Real.exp (4*(H+2*(n:ℝ)+1/2))
  let δ := Real.pi*(Real.exp 6 - 1)
  have hδ : 0 < δ := by
    unfold δ
    exact mul_pos Real.pi_pos (sub_pos.mpr (Real.one_lt_exp_iff.mpr (by norm_num)))
  obtain ⟨U,T,c,hU,_,hc,h⟩ := thetaDerivative_scaled_det_lower n
    (show 0 ≤ L from mul_nonneg Real.pi_pos.le (Real.exp_pos _).le) hδ
  have he : Tendsto (fun w : ℝ => Real.exp (4*w)) atTop atTop :=
    Real.tendsto_exp_atTop.comp (tendsto_id.const_mul_atTop (by norm_num : (0:ℝ) < 4))
  obtain ⟨W,hW⟩ := Filter.eventually_atTop.mp (he.eventually_ge_atTop T)
  refine ⟨max U W,c,hU.trans (le_max_left _ _),hc,?_⟩
  intro w hw u hu d hd
  apply h (Real.exp (4*w)) (hW w ((le_max_right U W).trans hw)) (fun i => u+w+d i)
  · intro i
    have hwU := (le_max_left U W).trans hw
    have hd0 : 0 ≤ d i := le_trans (by positivity) (hd i).1
    linarith [hu.1]
  · intro i
    rw [firstHankelScale_translate_div]
    apply mul_le_mul_of_nonneg_left _ Real.pi_pos.le
    apply Real.exp_le_exp.mpr
    have hi : (i.val:ℝ)+1 ≤ n := by
      exact_mod_cast Nat.succ_le_of_lt i.isLt
    linarith [(hd i).2, hu.2]
  · intro i j hij
    rw [firstHankelScale_translate_div, firstHankelScale_translate_div]
    have hij' : (i.val:ℝ)+1 ≤ (j.val:ℝ) := by
      exact_mod_cast Nat.succ_le_of_lt hij
    have hdif : 6 ≤ 4*(d j-d i) := by linarith [(hd i).2, (hd j).1]
    have hd0 : 0 ≤ d i := le_trans (by positivity) (hd i).1
    have he₁ : 1 ≤ Real.exp (4*(u+d i)) := Real.one_le_exp (by linarith [hu.1])
    have he₂ : Real.exp 6 ≤ Real.exp (4*(d j-d i)) := Real.exp_le_exp.mpr hdif
    have hp := mul_le_mul he₁ (sub_le_sub_right he₂ 1)
      (sub_nonneg.mpr (Real.one_le_exp (by linarith))) (Real.exp_pos _).le
    have hfac : Real.exp (4*(u+d j)) = Real.exp (4*(u+d i))*Real.exp (4*(d j-d i)) := by
      rw [← Real.exp_add]
      congr 1
      ring
    rw [hfac]
    unfold δ
    have hh := mul_le_mul_of_nonneg_left hp Real.pi_pos.le
    linarith only [hh]

theorem thetaDerivative_moving_box_lower (n : ℕ) (H : ℝ) :
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ m : ℕ in atTop, ∀ u ∈ Set.Icc 0 H, ∀ d : Fin n → ℝ,
      (∀ i, d i ∈ Set.Icc (2*((i.val:ℝ)+1)) (2*((i.val:ℝ)+1)+1/2)) →
      let t := fun i => u+(Real.log (m:ℝ)/8)+d i
      c * ((∏ i, thetaKernel (t i)) * (Real.sqrt (m:ℝ))^(n.choose 2)) ≤
        (-1 : ℝ)^(n.choose 2)*(thetaDerivativeAtNodes n t).det := by
  obtain ⟨W,c,_,hc,h⟩ := thetaDerivative_translated_box_lower n H
  refine ⟨c,hc,?_⟩
  have hlog := Real.tendsto_log_atTop.comp (tendsto_natCast_atTop_atTop (R := ℝ))
  have hW := hlog.eventually_ge_atTop (8*W)
  filter_upwards [hW, eventually_ge_atTop (1:ℕ)] with m hm hm1
  intro u hu d hd
  have hm0 : (0:ℝ) < (m:ℝ) := by exact_mod_cast zero_lt_one.trans_le hm1
  have hwm : W ≤ Real.log (m:ℝ)/8 := by
    change 8*W ≤ Real.log (m:ℝ) at hm
    linarith
  have hroot : Real.exp (4*(Real.log (m:ℝ)/8)) = Real.sqrt (m:ℝ) := by
    rw [Real.sqrt_eq_rpow, Real.rpow_def_of_pos hm0]
    congr 1
    ring
  simpa only [hroot] using h (Real.log (m:ℝ)/8) hwm u hu d hd

theorem thetaDerivativeAtNodes_det_eq_integrand_matrix (n : ℕ) (u : ℝ) (x : Fin n → ℝ) :
    (thetaDerivativeAtNodes n (fun i => u+x i)).det = (thetaDerivativeMatrix n u x).det := by
  rw [← Matrix.det_transpose (thetaDerivativeMatrix n u x)]
  rfl

/-- The quantitative determinant lower bound on the literal moving box in §6,
with the matrix orientation used by the Andréief integrand. -/
theorem thetaDerivative_integrand_moving_box_lower (n : ℕ) (H : ℝ) :
    ∃ c : ℝ, 0 < c ∧ ∀ᶠ m : ℕ in atTop, ∀ u ∈ Set.Icc 0 H, ∀ d : Fin n → ℝ,
      (∀ i, d i ∈ Set.Icc (2*((i.val:ℝ)+1)) (2*((i.val:ℝ)+1)+1/2)) →
      let x := fun i => Real.log (m:ℝ)/8 + d i
      c * ((∏ i, thetaKernel (u+x i)) * (Real.sqrt (m:ℝ))^(n.choose 2)) ≤
        (-1 : ℝ)^(n.choose 2)*(thetaDerivativeMatrix n u x).det := by
  obtain ⟨c,hc,h⟩ := thetaDerivative_moving_box_lower n H
  refine ⟨c,hc,?_⟩
  filter_upwards [h] with m hm
  intro u hu d hd
  let x := fun i => Real.log (m:ℝ)/8+d i
  have h := hm u hu d hd
  have ht : (fun i => u+(Real.log (m:ℝ)/8)+d i) = fun i => u+x i := by
    funext i
    exact add_assoc _ _ _
  simp only at h ⊢
  rw [ht, thetaDerivativeAtNodes_det_eq_integrand_matrix] at h
  simpa only [x, add_assoc] using h

end NuttallCumulants
