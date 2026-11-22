module

public import Mathlib.Analysis.InnerProductSpace.Positive
import Mathlib.Algebra.Field.GeomSum
import Mathlib.Tactic

@[expose] public section

/-! Quadratic-form estimates for multiscale averages of orthogonal projections. -/

namespace AgnosticVC

open scoped BigOperators InnerProductSpace
open Finset

variable {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]

/-- Cauchy–Schwarz for a positive operator, including operators with a kernel. -/
theorem positiveForm_cauchySchwarz {T : E →L[ℝ] E} (hT : T.IsPositive) (x y : E) :
    ⟪T x, y⟫_ℝ ^ 2 ≤ ⟪T x, x⟫_ℝ * ⟪T y, y⟫_ℝ := by
  have hs : ⟪T y, x⟫_ℝ = ⟪T x, y⟫_ℝ :=
    (hT.inner_left_eq_inner_right y x).trans (real_inner_comm _ _)
  have h (r : ℝ) : 0 ≤ ⟪T y, y⟫_ℝ * (r * r) + (2 * ⟪T x, y⟫_ℝ) * r + ⟪T x, x⟫_ℝ := by
    have hp := hT.inner_nonneg_left (x + r • y)
    simp only [map_add, map_smul, inner_add_left, inner_add_right, real_inner_smul_left,
      real_inner_smul_right, hs] at hp
    linarith only [hp]
  have hd := discrim_le_zero h
  unfold discrim at hd
  nlinarith only [hd]

/-- Loewner order controls the associated quadratic forms. -/
theorem projectionForm_mono {S T : E →L[ℝ] E} (h : S ≤ T) (x : E) :
    ⟪S x, x⟫_ℝ ≤ ⟪T x, x⟫_ℝ := by
  have hd := (ContinuousLinearMap.le_def.mp h).inner_nonneg_left x
  simpa [sub_apply, inner_sub_left, sub_nonneg] using hd

/-- Sandwiching an overlap estimate by positive bands. The input is the quadratic-form
version of the overlap estimate. The conclusion is the squared bilinear band bound. -/
theorem projectionBand_pair {K L P Q : E →L[ℝ] E} {c : ℝ}
    (hP : P.IsPositive) (hQ : Q.IsPositive) (hK : K.IsPositive)
    (hPK : P ≤ K) (hQL : Q ≤ L)
    (hOverlap : ∀ z, ⟪L (K z), K z⟫_ℝ ≤ c ^ 2 * ⟪K z, z⟫_ℝ)
    (x y : E) :
    ⟪P x, Q y⟫_ℝ ^ 2 ≤ c ^ 2 * (⟪P x, x⟫_ℝ * ⟪Q y, y⟫_ℝ) := by
  have h0 : 0 ≤ ⟪K (Q y), Q y⟫_ℝ := hK.inner_nonneg_left _
  have h1 : ⟪K (Q y), Q y⟫_ℝ ^ 2 ≤
      ⟪Q y, y⟫_ℝ * (c ^ 2 * ⟪K (Q y), Q y⟫_ℝ) := calc
    _ = ⟪Q y, K (Q y)⟫_ℝ ^ 2 := by rw [real_inner_comm]
    _ ≤ ⟪Q y, y⟫_ℝ * ⟪Q (K (Q y)), K (Q y)⟫_ℝ :=
      positiveForm_cauchySchwarz hQ _ _
    _ ≤ _ := mul_le_mul_of_nonneg_left
      ((projectionForm_mono hQL _).trans (hOverlap (Q y))) (hQ.inner_nonneg_left y)
  have h2 : ⟪K (Q y), Q y⟫_ℝ ≤ c ^ 2 * ⟪Q y, y⟫_ℝ := by
    by_cases hz : ⟪K (Q y), Q y⟫_ℝ = 0
    · rw [hz]
      exact mul_nonneg (sq_nonneg c) (hQ.inner_nonneg_left y)
    · apply le_of_mul_le_mul_right _ (lt_of_le_of_ne h0 (Ne.symm hz))
      convert h1 using 1 <;> ring
  exact (positiveForm_cauchySchwarz hP x (Q y)).trans <| calc
    _ ≤ ⟪P x, x⟫_ℝ * ⟪K (Q y), Q y⟫_ℝ :=
      mul_le_mul_of_nonneg_left (projectionForm_mono hPK _) (hP.inner_nonneg_left x)
    _ ≤ ⟪P x, x⟫_ℝ * (c ^ 2 * ⟪Q y, y⟫_ℝ) :=
      mul_le_mul_of_nonneg_left h2 (hP.inner_nonneg_left x)
    _ = _ := by ring

variable {ι : Type*} [Fintype ι]

/-- Finite Schur bound. The row and column bounds are uniform. -/
theorem projection_schur {w : ι → ι → ℝ} {r : ℝ}
    (hw : ∀ i j, 0 ≤ w i j)
    (hr : ∀ i, ∑ j, w i j ≤ r) (hc : ∀ j, ∑ i, w i j ≤ r)
    {u v : ι → ℝ} (hu : ∑ j, u j ^ 2 = 1) (hv : ∑ i, v i ^ 2 = 1) :
    ∑ i, ∑ j, w i j * (u j * v i) ≤ r := by
  have hle (i j : ι) :
      w i j * (u j * v i) ≤ w i j * ((u j ^ 2 + v i ^ 2) / 2) :=
    mul_le_mul_of_nonneg_left (by nlinarith [sq_nonneg (u j - v i)]) (hw i j)
  have hU : ∑ i, ∑ j, w i j * u j ^ 2 ≤ r := calc
    _ = ∑ j, (∑ i, w i j) * u j ^ 2 := by rw [sum_comm]; simp_rw [sum_mul]
    _ ≤ ∑ j, r * u j ^ 2 := sum_le_sum fun j _ =>
      mul_le_mul_of_nonneg_right (hc j) (sq_nonneg _)
    _ = _ := by rw [← mul_sum, hu, mul_one]
  have hV : ∑ i, ∑ j, w i j * v i ^ 2 ≤ r := calc
    _ = ∑ i, (∑ j, w i j) * v i ^ 2 := by simp_rw [sum_mul]
    _ ≤ ∑ i, r * v i ^ 2 := sum_le_sum fun i _ =>
      mul_le_mul_of_nonneg_right (hr i) (sq_nonneg _)
    _ = _ := by rw [← mul_sum, hv, mul_one]
  calc
    _ ≤ ∑ i, ∑ j, w i j * ((u j ^ 2 + v i ^ 2) / 2) :=
      sum_le_sum fun i _ => sum_le_sum fun j _ => hle i j
    _ = ((∑ i, ∑ j, w i j * u j ^ 2) + (∑ i, ∑ j, w i j * v i ^ 2)) / 2 := by
      simp_rw [← mul_div_assoc, mul_add, ← sum_div, sum_add_distrib]
    _ ≤ _ := by linarith

/-- The coefficient-weighted compression error for a positive resolution of the identity. -/
theorem projection_residual_bound
    (B : ι → E →L[ℝ] E) (b : ι → ℝ) (c : ι → ι → ℝ) (r : ℝ)
    (hB : ∀ i, (B i).IsPositive) (hpart : ∀ x, (∑ i, B i x) = x)
    (hr0 : 0 ≤ r) (hnn : ∀ i j, 0 ≤ c i j)
    (hpair : ∀ i j x y, ⟪B j x, B i y⟫_ℝ ^ 2 ≤
      c i j ^ 2 * (⟪B j x, x⟫_ℝ * ⟪B i y, y⟫_ℝ))
    (hr : ∀ i, ∑ j, |b j / b i - 1| * c i j ≤ r)
    (hc : ∀ j, ∑ i, |b j / b i - 1| * c i j ≤ r)
    (x : E) :
    ‖(∑ i, (b i)⁻¹ • B i (∑ j, b j • B j x)) - x‖ ≤ r * ‖x‖ := by
  let z : E := (∑ i, (b i)⁻¹ • B i (∑ j, b j • B j x)) - x
  change ‖z‖ ≤ _
  have hdecomp (y : E) :
      ⟪z, y⟫_ℝ = ∑ i, ∑ j, (b j / b i - 1) * ⟪B j x, B i y⟫_ℝ := by
    have hs :
        ⟪∑ i, (b i)⁻¹ • B i (∑ j, b j • B j x), y⟫_ℝ =
          ∑ i, ∑ j, (b j / b i) * ⟪B j x, B i y⟫_ℝ := by
      rw [sum_inner]
      refine sum_congr rfl fun i _ => ?_
      rw [real_inner_smul_left, (hB i).inner_left_eq_inner_right, sum_inner, mul_sum]
      refine sum_congr rfl fun j _ => ?_
      rw [real_inner_smul_left, div_eq_inv_mul, mul_assoc]
    have ht : ∑ i, ∑ j, ⟪B j x, B i y⟫_ℝ = ⟪x, y⟫_ℝ := by
      simp_rw [← sum_inner, hpart]
      rw [← inner_sum, hpart]
    simp_rw [z, inner_sub_left, hs, sub_mul, one_mul, sum_sub_distrib, ht]
  by_cases hz : z = 0
  · simpa [hz] using mul_nonneg hr0 (norm_nonneg x)
  have hx : x ≠ 0 := by
    intro heq
    exact hz (by simp [z, heq])
  have hxpos := norm_pos_iff.mpr hx
  have hzpos := norm_pos_iff.mpr hz
  let u (j : ι) : ℝ := Real.sqrt ⟪B j x, x⟫_ℝ / ‖x‖
  let v (i : ι) : ℝ := Real.sqrt ⟪B i z, z⟫_ℝ / ‖z‖
  have hnorm (y : E) (hy : y ≠ 0) :
      ∑ i, (Real.sqrt ⟪B i y, y⟫_ℝ / ‖y‖) ^ 2 = 1 := by
    simp_rw [div_pow, Real.sq_sqrt ((hB _).inner_nonneg_left y)]
    rw [← sum_div, ← sum_inner, hpart, real_inner_self_eq_norm_sq,
      div_self (pow_ne_zero _ (norm_ne_zero_iff.mpr hy))]
  have hschur := projection_schur
    (fun i j => mul_nonneg (abs_nonneg (b j / b i - 1)) (hnn i j)) hr hc
    (hnorm x hx) (hnorm z hz)
  have hterm (i j : ι) : (b j / b i - 1) * ⟪B j x, B i z⟫_ℝ ≤
      (‖x‖ * ‖z‖) * ((|b j / b i - 1| * c i j) * (u j * v i)) := calc
    _ ≤ |b j / b i - 1| * |⟪B j x, B i z⟫_ℝ| := by rw [← abs_mul]; exact le_abs_self _
    _ ≤ |b j / b i - 1| * (c i j * (Real.sqrt ⟪B j x, x⟫_ℝ * Real.sqrt ⟪B i z, z⟫_ℝ)) := by
      gcongr
      apply le_of_sq_le_sq _ (mul_nonneg (hnn i j)
        (mul_nonneg (Real.sqrt_nonneg _) (Real.sqrt_nonneg _)))
      rw [sq_abs, mul_pow, mul_pow, Real.sq_sqrt ((hB j).inner_nonneg_left x),
        Real.sq_sqrt ((hB i).inner_nonneg_left z)]
      exact hpair i j x z
    _ = _ := by dsimp [u, v]; field_simp
  have hzz : ‖z‖ ^ 2 ≤ (‖x‖ * ‖z‖) * r := calc
    _ = ⟪z, z⟫_ℝ := (real_inner_self_eq_norm_sq z).symm
    _ ≤ (‖x‖ * ‖z‖) * (∑ i, ∑ j, (|b j / b i - 1| * c i j) * (u j * v i)) := by
      rw [hdecomp, mul_sum]
      simp_rw [mul_sum]
      exact sum_le_sum fun i _ => sum_le_sum fun j _ => hterm i j
    _ ≤ _ := mul_le_mul_of_nonneg_left hschur (by positivity)
  apply le_of_mul_le_mul_right _ hzpos
  convert hzz using 1 <;> ring


/-- The inverse estimate for an arbitrary positive resolution of the identity whose
coefficient-weighted band interactions have Schur bound at most one half. -/
theorem projection_inverse_bound
    (B : ι → E →L[ℝ] E) (b : ι → ℝ) (c : ι → ι → ℝ)
    (hB : ∀ i, (B i).IsPositive) (hpart : ∀ x, (∑ i, B i x) = x)
    (hnn : ∀ i j, 0 ≤ c i j)
    (hpair : ∀ i j x y, ⟪B j x, B i y⟫_ℝ ^ 2 ≤
      c i j ^ 2 * (⟪B j x, x⟫_ℝ * ⟪B i y, y⟫_ℝ))
    (hr : ∀ i, ∑ j, |b j / b i - 1| * c i j ≤ 1 / 2)
    (hc : ∀ j, ∑ i, |b j / b i - 1| * c i j ≤ 1 / 2)
    {x z : E} (hz : (∑ j, b j • B j z) = x) :
    ‖z‖ ^ 2 ≤ 4 * ∑ j, (b j)⁻¹ ^ 2 * ⟪B j x, x⟫_ℝ := by
  let w : E := ∑ i, (b i)⁻¹ • B i x
  let M : ℝ := ∑ i, (b i)⁻¹ ^ 2 * ⟪B i x, x⟫_ℝ
  have hM : 0 ≤ M := sum_nonneg fun i _ => mul_nonneg (sq_nonneg _)
    ((hB i).inner_nonneg_left x)
  have hw : ‖w‖ ≤ Real.sqrt M := by
    by_cases h0 : w = 0
    · simp [h0, Real.sqrt_nonneg]
    have h1 : ‖w‖ ^ 2 ≤ Real.sqrt M * ‖w‖ := calc
      _ = ∑ i, (b i)⁻¹ * ⟪B i x, w⟫_ℝ := by
        rw [← real_inner_self_eq_norm_sq]
        conv_lhs => rw [show w = ∑ i, (b i)⁻¹ • B i x from rfl]
        simp only [sum_inner, real_inner_smul_left]
        rfl
      _ ≤ ∑ i, (|(b i)⁻¹| * Real.sqrt ⟪B i x, x⟫_ℝ) * Real.sqrt ⟪B i w, w⟫_ℝ := by
        refine sum_le_sum fun i _ => ?_
        have hcs : |⟪B i x, w⟫_ℝ| ≤
            Real.sqrt ⟪B i x, x⟫_ℝ * Real.sqrt ⟪B i w, w⟫_ℝ := by
          apply le_of_sq_le_sq _ (by positivity)
          rw [sq_abs, mul_pow, Real.sq_sqrt ((hB i).inner_nonneg_left x),
            Real.sq_sqrt ((hB i).inner_nonneg_left w)]
          exact positiveForm_cauchySchwarz (hB i) x w
        rw [mul_assoc]
        exact (by rw [← abs_mul]; exact le_abs_self _ : _ ≤ |(b i)⁻¹| * |⟪B i x, w⟫_ℝ|).trans
          (mul_le_mul_of_nonneg_left hcs (abs_nonneg _))
      _ ≤ _ := by
        have hcs := Real.sum_mul_le_sqrt_mul_sqrt univ
          (fun i => |(b i)⁻¹| * Real.sqrt ⟪B i x, x⟫_ℝ) (fun i => Real.sqrt ⟪B i w, w⟫_ℝ)
        simp only [mul_pow, sq_abs, Real.sq_sqrt ((hB _).inner_nonneg_left x),
          Real.sq_sqrt ((hB _).inner_nonneg_left w)] at hcs
        rw [← sum_inner, hpart, real_inner_self_eq_norm_sq, Real.sqrt_sq (norm_nonneg _)] at hcs
        exact hcs
    apply le_of_mul_le_mul_right _ (norm_pos_iff.mpr h0)
    simpa only [pow_two] using h1
  have he := projection_residual_bound B b c (1 / 2) hB hpart (by norm_num) hnn hpair hr hc z
  rw [hz] at he
  change ‖w - z‖ ≤ _ at he
  have htriangle : ‖z‖ ≤ ‖w‖ + ‖w - z‖ := by
    calc
      ‖z‖ = ‖w + (z - w)‖ := by congr 1; abel
      _ ≤ ‖w‖ + ‖z - w‖ := norm_add_le _ _
      _ = _ := by rw [norm_sub_rev]
  have hfinal : ‖z‖ ≤ 2 * Real.sqrt M := by linarith
  calc
    _ ≤ (2 * Real.sqrt M) ^ 2 := by gcongr
    _ = 4 * M := by rw [mul_pow, Real.sq_sqrt hM]; norm_num


/-- The weights of the geometric bands. -/
noncomputable def projectionScaleWeight (base : ℝ) (i : ℕ) : ℝ :=
  base / (21 / 20 : ℝ) ^ i

/-- Decay estimate for the interaction between two bands. -/
noncomputable def projectionScaleDecay (i j : ℕ) : ℝ :=
  (1 / 2 : ℝ) ^ (max i j - min i j - 1)

private noncomputable def scaleKernel (h : ℕ) : ℝ :=
  ((21 / 20 : ℝ) ^ h - 1) * (1 / 2 : ℝ) ^ (h - 1)

private theorem scaleKernel_nonnegative (h : ℕ) : 0 ≤ scaleKernel h := by
  unfold scaleKernel
  have hρ : 1 ≤ (21 / 20 : ℝ) ^ h := one_le_pow₀ (by norm_num)
  positivity

private theorem scaleKernel_sum (n : ℕ) : ∑ h ∈ range n, scaleKernel h ≤ 4 / 19 := by
  have heq (h : ℕ) : scaleKernel h = 2 * ((21 / 40 : ℝ) ^ h - (1 / 2 : ℝ) ^ h) := by
    cases h with
    | zero => simp [scaleKernel]
    | succ h =>
      simp only [scaleKernel, Nat.succ_sub_one, pow_succ, show (21 / 40 : ℝ) = (21 / 20 : ℝ) *
        (1 / 2 : ℝ) by norm_num, mul_pow]
      ring
  simp_rw [heq, ← mul_sum, sum_sub_distrib, geom_sum_eq (show (21 / 40 : ℝ) ≠ 1 by norm_num),
    geom_sum_eq (show (1 / 2 : ℝ) ≠ 1 by norm_num)]
  have h := pow_le_pow_left₀ (show 0 ≤ (1 / 2 : ℝ) by norm_num)
    (show (1 / 2 : ℝ) ≤ 21 / 40 by norm_num) n
  have hn : 0 ≤ (21 / 40 : ℝ) ^ n := by positivity
  calc
    _ = 4 / 19 - ((80 / 19 : ℝ) * (21 / 40 : ℝ) ^ n - 4 * (1 / 2 : ℝ) ^ n) := by ring
    _ ≤ _ := by linarith only [h, hn]

private theorem scaleKernel_total {n : ℕ} (i : Fin n) :
    ∑ j : Fin n, scaleKernel (max (i : ℕ) (j : ℕ) - min (i : ℕ) (j : ℕ)) ≤ 8 / 19 := by
  classical
  let left : Finset (Fin n) := univ.filter fun j => j < i
  let right : Finset (Fin n) := univ.filter fun j => ¬j < i
  have hsplit : (∑ j : Fin n, scaleKernel (max (i : ℕ) (j : ℕ) - min (i : ℕ) (j : ℕ))) =
      (∑ j ∈ left, scaleKernel (max (i : ℕ) (j : ℕ) - min (i : ℕ) (j : ℕ))) +
      ∑ j ∈ right, scaleKernel (max (i : ℕ) (j : ℕ) - min (i : ℕ) (j : ℕ)) :=
    (sum_filter_add_sum_filter_not univ (fun j : Fin n => j < i) _).symm
  have hleft : ∑ j ∈ left, scaleKernel (max (i : ℕ) (j : ℕ) - min (i : ℕ) (j : ℕ)) ≤ 4 / 19 := by
    have hl (j : Fin n) (hj : j ∈ left) : (j : ℕ) ≤ i := (mem_filter.mp hj).2.le
    let f (j : Fin n) := (i : ℕ) - (j : ℕ)
    have him : left.image f ⊆ range n := by
      intro k hk
      obtain ⟨j, hj, rfl⟩ := mem_image.mp hk
      simp only [mem_range, f]
      exact lt_of_le_of_lt (Nat.sub_le _ _) i.isLt
    have hi : Set.InjOn f left := by
      intro j hj l hl' e
      apply Fin.ext
      have hj' := hl j hj
      have hl'' := hl l hl'
      dsimp [f] at e
      omega
    calc
      _ = ∑ j ∈ left, scaleKernel (f j) := sum_congr rfl fun j hj => by
        rw [max_eq_left (hl j hj), min_eq_right (hl j hj)]
      _ = ∑ h ∈ left.image f, scaleKernel h := (sum_image hi).symm
      _ ≤ ∑ h ∈ range n, scaleKernel h :=
        sum_le_sum_of_subset_of_nonneg him fun h _ _ => scaleKernel_nonnegative h
      _ ≤ _ := scaleKernel_sum n
  have hright : ∑ j ∈ right, scaleKernel (max (i : ℕ) (j : ℕ) - min (i : ℕ) (j : ℕ)) ≤ 4 / 19 := by
    have hl (j : Fin n) (hj : j ∈ right) : (i : ℕ) ≤ j := Nat.le_of_not_gt (mem_filter.mp hj).2
    let f (j : Fin n) := (j : ℕ) - (i : ℕ)
    have him : right.image f ⊆ range n := by
      intro k hk
      obtain ⟨j, hj, rfl⟩ := mem_image.mp hk
      simp only [mem_range, f]
      exact lt_of_le_of_lt (Nat.sub_le _ _) j.isLt
    have hi : Set.InjOn f right := by
      intro j hj l hl' e
      apply Fin.ext
      have hj' := hl j hj
      have hl'' := hl l hl'
      dsimp [f] at e
      omega
    calc
      _ = ∑ j ∈ right, scaleKernel (f j) := sum_congr rfl fun j hj => by
        rw [max_eq_right (hl j hj), min_eq_left (hl j hj)]
      _ = ∑ h ∈ right.image f, scaleKernel h := (sum_image hi).symm
      _ ≤ ∑ h ∈ range n, scaleKernel h :=
        sum_le_sum_of_subset_of_nonneg him fun h _ _ => scaleKernel_nonnegative h
      _ ≤ _ := scaleKernel_sum n
  rw [hsplit]
  linarith

private theorem scaleKernel_dominates {base : ℝ} (hb : 0 < base) (i j : ℕ) :
    |projectionScaleWeight base j / projectionScaleWeight base i - 1| * projectionScaleDecay i j ≤
      scaleKernel (max i j - min i j) := by
  let ρ : ℝ := 21 / 20
  have hρ : 1 ≤ ρ := by norm_num [ρ]
  have hρ' : ρ ≠ 0 := by positivity
  have hratio :
      projectionScaleWeight base j / projectionScaleWeight base i = ρ ^ i / ρ ^ j := by
    unfold projectionScaleWeight
    change (base / ρ ^ j) / (base / ρ ^ i) = ρ ^ i / ρ ^ j
    field_simp [hb.ne', hρ']
  rw [hratio]
  apply mul_le_mul_of_nonneg_right _ (by unfold projectionScaleDecay; positivity)
  change |ρ ^ i / ρ ^ j - 1| ≤ ρ ^ (max i j - min i j) - 1
  rcases le_total i j with hij | hji
  · rw [max_eq_right hij, min_eq_left hij]
    have he : ρ ^ j = ρ ^ i * ρ ^ (j - i) := by rw [← pow_add, Nat.add_sub_of_le hij]
    have hdiv : ρ ^ i / (ρ ^ i * ρ ^ (j - i)) = (ρ ^ (j - i))⁻¹ := by
      field_simp [hρ']
    rw [he, hdiv]
    have h : 1 ≤ ρ ^ (j - i) := one_le_pow₀ hρ
    have hpos : 0 < ρ ^ (j - i) := zero_lt_one.trans_le h
    rw [abs_of_nonpos (sub_nonpos.mpr ((inv_le_one₀ hpos).mpr h)), neg_sub]
    calc
      _ = (ρ ^ (j - i) - 1) / ρ ^ (j - i) := by field_simp
      _ ≤ _ := div_le_self (sub_nonneg.mpr h) h
  · rw [max_eq_left hji, min_eq_right hji]
    have he : ρ ^ i = ρ ^ j * ρ ^ (i - j) := by rw [← pow_add, Nat.add_sub_of_le hji]
    rw [he, mul_comm, mul_div_cancel_right₀ _ (pow_ne_zero _ hρ')]
    exact le_of_eq (abs_of_nonneg (sub_nonneg.mpr (one_le_pow₀ hρ)))

/-- The exact row and column bound for the geometric band weights. -/
theorem projectionScale_schur {n : ℕ} {base : ℝ} (hb : 0 < base) :
    (∀ i : Fin n, ∑ j : Fin n, |projectionScaleWeight base j / projectionScaleWeight base i - 1| *
      projectionScaleDecay i j ≤ 8 / 19) ∧
    (∀ j : Fin n, ∑ i : Fin n, |projectionScaleWeight base j / projectionScaleWeight base i - 1| *
      projectionScaleDecay i j ≤ 8 / 19) := by
  constructor
  · intro i
    exact (sum_le_sum fun (j : Fin n) _ => scaleKernel_dominates hb (i : ℕ) (j : ℕ)).trans (scaleKernel_total i)
  · intro j
    apply LE.le.trans (sum_le_sum fun (i : Fin n) _ => scaleKernel_dominates hb (i : ℕ) (j : ℕ))
    simpa only [max_comm, min_comm] using scaleKernel_total j

end AgnosticVC
