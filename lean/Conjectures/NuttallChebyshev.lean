module

public import Mathlib.Analysis.Calculus.IteratedDeriv.Lemmas
public import Mathlib.LinearAlgebra.Matrix.Block
public import Mathlib.LinearAlgebra.Matrix.Determinant.Basic
public import Mathlib.Analysis.SpecialFunctions.Log.Deriv
public import Mathlib.MeasureTheory.Integral.Pi
public import Mathlib.Analysis.Calculus.Deriv.MeanValue
public import Mathlib.Analysis.Calculus.ContDiff.Deriv
public import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
public import Mathlib.Algebra.BigOperators.Intervals
public import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus

public section
namespace NuttallCumulants
open Filter Matrix Finset
open scoped Topology ContDiff

noncomputable def wronskianMatrix (n : ℕ) (f : Fin n → ℝ → ℝ) (x : ℝ) : Matrix (Fin n) (Fin n) ℝ :=
  Matrix.of fun i j => iteratedDeriv i.val (f j) x

noncomputable def wronskianLeibnizTriangle (n : ℕ) (a : ℝ → ℝ) (x : ℝ) :
    Matrix (Fin n) (Fin n) ℝ :=
  Matrix.of fun i j => if j ≤ i then
    (i.val.choose j.val : ℝ) * iteratedDeriv (i.val-j.val) a x else 0

theorem wronskian_matrix_mul (n : ℕ) (a : ℝ → ℝ) (f : Fin n → ℝ → ℝ) (x : ℝ)
    (ha : ContDiffAt ℝ ∞ a x) (hf : ∀ j, ContDiffAt ℝ ∞ (f j) x) :
    wronskianMatrix n (fun j t => a t*f j t) x =
      wronskianLeibnizTriangle n a x * wronskianMatrix n f x := by
  ext i j
  change iteratedDeriv i.val (fun t => a t*f j t) x = _
  have he : (fun t => a t*f j t) = fun t => f j t*a t := funext fun t => mul_comm _ _
  rw [he, iteratedDeriv_fun_mul ((hf j).of_le (by simp)) (ha.of_le (by simp)), Matrix.mul_apply]
  let F : ℕ → ℝ := fun k => if k ≤ i.val then
    (i.val.choose k:ℝ)*iteratedDeriv (i.val-k) a x*iteratedDeriv k (f j) x else 0
  have hs :
      (∑ k : Fin n, wronskianLeibnizTriangle n a x i k * wronskianMatrix n f x k j) =
        ∑ k ∈ range n, F k := by
    rw [← Fin.sum_univ_eq_sum_range F n]
    apply Finset.sum_congr rfl
    intro k _
    change (if k.val ≤ i.val then
      (i.val.choose k.val:ℝ)*iteratedDeriv (i.val-k.val) a x else 0) *
        iteratedDeriv k.val (f j) x = F k.val
    by_cases hk : k.val ≤ i.val <;> simp [F,hk]
  rw [hs]
  calc
    _ = ∑ k ∈ range (i.val+1), F k := by
      apply Finset.sum_congr rfl
      intro k hk
      have hk' : k ≤ i.val := Nat.lt_succ_iff.mp (Finset.mem_range.mp hk)
      simp only [F, ite_eq_left hk']
      ring
    _ = _ := Finset.sum_subset (Finset.range_subset_range.mpr i.isLt)
      (fun k _ hk => by simp [F, show ¬ k ≤ i.val from fun hh => hk (Finset.mem_range.mpr (Nat.lt_succ_iff.mpr hh))])

theorem wronskian_det_mul (n : ℕ) (a : ℝ → ℝ) (f : Fin n → ℝ → ℝ) (x : ℝ)
    (ha : ContDiffAt ℝ ∞ a x) (hf : ∀ j, ContDiffAt ℝ ∞ (f j) x) :
    (wronskianMatrix n (fun j t => a t*f j t) x).det =
      a x ^ n * (wronskianMatrix n f x).det := by
  have htri : (wronskianLeibnizTriangle n a x).IsLowerTriangular := by
    intro i j hij
    change i < j at hij
    change (if j ≤ i then _ else 0) = _
    simp [not_le_of_gt hij]
  rw [wronskian_matrix_mul n a f x ha hf, Matrix.det_mul, Matrix.det_of_isLowerTriangular _ htri]
  simp [wronskianLeibnizTriangle]

theorem iteratedDeriv_eventually_eq {f g : ℝ → ℝ} {x : ℝ}
    (hf : f =ᶠ[𝓝 x] g) (n : ℕ) : iteratedDeriv n f =ᶠ[𝓝 x] iteratedDeriv n g := by
  induction n with
  | zero => simpa only [iteratedDeriv_zero] using hf
  | succ n ih =>
    rw [iteratedDeriv_succ, iteratedDeriv_succ]
    exact ih.deriv


noncomputable def wronskianReduced (n : ℕ) (f : Fin (n+1) → ℝ → ℝ) : Fin n → ℝ → ℝ :=
  fun j => deriv (fun t => f j.succ t / f 0 t)

/-- Exact signed Wronskian reduction after dividing by the first function. -/
theorem wronskian_det_reduce (n : ℕ) (f : Fin (n+1) → ℝ → ℝ) (x : ℝ)
    (hf : ∀ j, ContDiffAt ℝ ∞ (f j) x) (h0 : f 0 x ≠ 0) :
    (wronskianMatrix (n+1) f x).det =
      (f 0 x)^(n+1) * (wronskianMatrix n (wronskianReduced n f) x).det := by
  let g := fun (j : Fin (n+1)) (t : ℝ) => f j t / f 0 t
  have hg (j : Fin (n+1)) : ContDiffAt ℝ ∞ (g j) x :=
    (hf j).div (hf 0) h0
  have hlocal : ∀ᶠ t in 𝓝 x, f 0 t ≠ 0 := (hf 0).continuousAt.eventually_ne h0
  have he (j : Fin (n+1)) : f j =ᶠ[𝓝 x] fun t => f 0 t*g j t := by
    filter_upwards [hlocal] with t ht
    unfold g
    exact (mul_div_cancel₀ _ ht).symm
  have hm : wronskianMatrix (n+1) f x =
      wronskianMatrix (n+1) (fun j t => f 0 t*g j t) x := by
    ext i j
    exact (iteratedDeriv_eventually_eq (he j) i.val).eq_of_nhds
  rw [hm, wronskian_det_mul _ (f 0) g x (hf 0) hg]
  congr 1
  have hg0 : g 0 =ᶠ[𝓝 x] fun _ => 1 := by
    filter_upwards [hlocal] with t ht
    exact div_self ht
  have hfirst (i : Fin (n+1)) : wronskianMatrix (n+1) g x i 0 = if i = 0 then 1 else 0 := by
    change iteratedDeriv i.val (g 0) x = _
    rw [(iteratedDeriv_eventually_eq hg0 i.val).eq_of_nhds, iteratedDeriv_const]
    simp
  have hminor : (wronskianMatrix (n+1) g x).submatrix Fin.succ Fin.succ =
      wronskianMatrix n (wronskianReduced n f) x := by
    ext i j
    change iteratedDeriv (i.val+1) (g j.succ) x =
      iteratedDeriv i.val (deriv (g j.succ)) x
    rw [iteratedDeriv_succ']
  rw [Matrix.det_succ_column_zero, Fin.sum_univ_succ]
  have hz : (∑ i : Fin n, (-1:ℝ)^i.succ.val * wronskianMatrix (n+1) g x i.succ 0 *
      ((wronskianMatrix (n+1) g x).submatrix i.succ.succAbove Fin.succ).det) = 0 := by
    apply Finset.sum_eq_zero
    intro i _
    rw [hfirst i.succ]
    simp
  rw [hz, hfirst 0, Fin.succAbove_zero, hminor]
  simp


noncomputable def subtractPrecedingRow (n : ℕ) : Matrix (Fin (n+1)) (Fin (n+1)) ℝ :=
  1 - Matrix.of (fun i j => if i.val = j.val+1 then 1 else 0)

theorem subtractPrecedingRow_det (n : ℕ) : (subtractPrecedingRow n).det = 1 := by
  have h : (subtractPrecedingRow n).IsLowerTriangular := by
    intro i j hij
    change i < j at hij
    have hn : i.val ≠ j.val+1 := by
      have : i.val < j.val := hij
      omega
    simp [subtractPrecedingRow, hij.ne, hn]
  rw [Matrix.det_of_isLowerTriangular _ h]
  simp [subtractPrecedingRow]

theorem subtractPrecedingRow_mul_zero (n : ℕ) (A : Matrix (Fin (n+1)) (Fin (n+1)) ℝ)
    (j : Fin (n+1)) :
    (subtractPrecedingRow n*A) 0 j = A 0 j := by
  rw [subtractPrecedingRow, sub_mul, one_mul, Matrix.sub_apply, Matrix.mul_apply]
  simp [Matrix.of_apply]

theorem subtractPrecedingRow_mul_succ (n : ℕ) (A : Matrix (Fin (n+1)) (Fin (n+1)) ℝ)
    (i : Fin n) (j : Fin (n+1)) :
    (subtractPrecedingRow n*A) i.succ j = A i.succ j - A i.castSucc j := by
  rw [subtractPrecedingRow, sub_mul, one_mul, Matrix.sub_apply, Matrix.mul_apply]
  congr 1
  rw [Finset.sum_eq_single i.castSucc]
  · simp
  · intro k _ hk
    have hn : i.val ≠ k.val := fun he => hk (Fin.ext he.symm)
    simp [hn]
  · simp

noncomputable def adjacentDifferenceMinor (n : ℕ) (A : Matrix (Fin (n+1)) (Fin (n+1)) ℝ) :
    Matrix (Fin n) (Fin n) ℝ :=
  Matrix.of fun i j => A i.succ j.succ - A i.castSucc j.succ

theorem det_eq_adjacentDifferenceMinor (n : ℕ) (A : Matrix (Fin (n+1)) (Fin (n+1)) ℝ)
    (h : ∀ i, A i 0 = 1) : A.det = (adjacentDifferenceMinor n A).det := by
  let B := subtractPrecedingRow n*A
  have hd : B.det = A.det := by unfold B; rw [Matrix.det_mul, subtractPrecedingRow_det, one_mul]
  have h0 : B 0 0 = 1 := by
    change (subtractPrecedingRow n*A) 0 0 = 1
    rw [subtractPrecedingRow_mul_zero, h]
  have hs (i : Fin n) : B i.succ 0 = 0 := by
    change (subtractPrecedingRow n*A) i.succ 0 = 0
    rw [subtractPrecedingRow_mul_succ, h, h]
    ring
  have he : B.submatrix Fin.succ Fin.succ = adjacentDifferenceMinor n A := by
    ext i j
    exact subtractPrecedingRow_mul_succ n A i j.succ
  rw [← hd, Matrix.det_succ_column_zero, Fin.sum_univ_succ, h0, Fin.succAbove_zero, he]
  simp [hs]


open MeasureTheory Set intervalIntegral

noncomputable def evaluationMatrix (n : ℕ) (f : Fin n → ℝ → ℝ) (t : Fin n → ℝ) :
    Matrix (Fin n) (Fin n) ℝ := Matrix.of fun i j => f j (t i)

theorem integral_eval_det (n : ℕ) (f : Fin n → ℝ → ℝ)
    (μ : Fin n → Measure ℝ) [∀ i, SigmaFinite (μ i)]
    (hf : ∀ i j, Integrable (f j) (μ i)) :
    (∫ t : Fin n → ℝ, (evaluationMatrix n f t).det ∂Measure.pi μ) =
      (Matrix.of fun (i j : Fin n) => ∫ x, f j x ∂μ i).det := by
  classical
  let A : Matrix (Fin n) (Fin n) ℝ := Matrix.of fun i j => ∫ x, f j x ∂μ i
  let g : Equiv.Perm (Fin n) → (Fin n → ℝ) → ℝ := fun σ t =>
    (↑(Equiv.Perm.sign σ):ℝ)*∏ i, f (σ i) (t i)
  have hg (σ : Equiv.Perm (Fin n)) : Integrable (g σ) (Measure.pi μ) :=
    (Integrable.fintype_prod (fun i => hf i (σ i))).const_mul _
  have he (t : Fin n → ℝ) : (evaluationMatrix n f t).det = ∑ σ, g σ t := by
    rw [← Matrix.det_transpose, Matrix.det_apply']
    rfl
  simp_rw [he]
  rw [integral_finsetSum _ (fun σ _ => hg σ)]
  change _ = A.det
  rw [← Matrix.det_transpose A, Matrix.det_apply']
  apply Finset.sum_congr rfl
  intro σ _
  unfold g
  rw [MeasureTheory.integral_const_mul, integral_fintype_prod_eq_prod]
  rfl

theorem integrable_eval_det (n : ℕ) (f : Fin n → ℝ → ℝ)
    (μ : Fin n → Measure ℝ) [∀ i, SigmaFinite (μ i)]
    (hf : ∀ i j, Integrable (f j) (μ i)) :
    Integrable (fun t : Fin n → ℝ => (evaluationMatrix n f t).det) (Measure.pi μ) := by
  classical
  simp_rw [← Matrix.det_transpose (evaluationMatrix n f _), Matrix.det_apply']
  exact integrable_finsetSum _ fun σ _ =>
    (Integrable.fintype_prod (fun i => hf i (σ i))).const_mul _

/-- The normalized evaluation determinant reduces to the integral of the
derivative evaluation determinant on consecutive node intervals. -/
theorem evaluation_det_difference_integral (n : ℕ) (f : Fin (n+1) → ℝ → ℝ)
    (t : Fin (n+1) → ℝ) (ht : StrictMono t)
    (h0 : ∀ i, f 0 (t i) = 1)
    (hf : ∀ i j : Fin n, ∀ x ∈ Icc (t i.castSucc) (t i.succ),
      HasDerivAt (f j.succ) (deriv (f j.succ) x) x)
    (hi : ∀ i j : Fin n, IntervalIntegrable (deriv (f j.succ)) volume (t i.castSucc) (t i.succ)) :
    (evaluationMatrix (n+1) f t).det =
      ∫ z : Fin n → ℝ, (evaluationMatrix n (fun j => deriv (f j.succ)) z).det
        ∂(Measure.pi fun i => volume.restrict (Ioc (t i.castSucc) (t i.succ))) := by
  rw [det_eq_adjacentDifferenceMinor _ _ h0, integral_eval_det]
  · congr 1
    ext i j
    change f j.succ (t i.succ) - f j.succ (t i.castSucc) =
      ∫ z in Ioc (t i.castSucc) (t i.succ), deriv (f j.succ) z
    rw [← intervalIntegral.integral_of_le (ht (show i.castSucc < i.succ from Fin.castSucc_lt_succ)).le]
    symm
    refine intervalIntegral.integral_eq_sub_of_hasDerivAt (fun x hx => hf i j x ?_) (hi i j)
    rwa [uIcc_of_le (ht (show i.castSucc < i.succ from Fin.castSucc_lt_succ)).le] at hx
  · intro i j
    exact (hi i j).1


def wronskianPrefix {n k : ℕ} (hk : k ≤ n) (f : Fin n → ℝ → ℝ) : Fin k → ℝ → ℝ :=
  fun j => f (Fin.castLE hk j)

def PositivePrefixWronskians {n : ℕ} (f : Fin n → ℝ → ℝ) (S : Set ℝ) : Prop :=
  ∀ k (hk : k ≤ n) x, x ∈ S → 0 < (wronskianMatrix k (wronskianPrefix hk f) x).det

theorem positivePrefixWronskians_first {n : ℕ} {f : Fin (n+1) → ℝ → ℝ} {S : Set ℝ}
    (h : PositivePrefixWronskians f S) {x : ℝ} (hx : x ∈ S) : 0 < f 0 x := by
  have hh := h 1 (Nat.succ_le_succ (Nat.zero_le n)) x hx
  rw [Matrix.det_fin_one] at hh
  have he : wronskianPrefix (Nat.succ_le_succ (Nat.zero_le n)) f (0:Fin 1) x = f 0 x := rfl
  simpa only [wronskianMatrix, Matrix.of_apply, Fin.val_zero, iteratedDeriv_zero, he] using hh

theorem positivePrefixWronskians_reduced {n : ℕ} {f : Fin (n+1) → ℝ → ℝ} {S : Set ℝ}
    (h : PositivePrefixWronskians f S)
    (hf : ∀ j x, x ∈ S → ContDiffAt ℝ ∞ (f j) x) :
    PositivePrefixWronskians (wronskianReduced n f) S := by
  intro k hk x hx
  have h0 := positivePrefixWronskians_first h hx
  let g := wronskianPrefix (Nat.succ_le_succ hk) f
  have hg : ∀ j, ContDiffAt ℝ ∞ (g j) x := fun j => hf _ x hx
  have hpos : 0 < (wronskianMatrix (k+1) g x).det := h _ _ x hx
  have hg0 : g 0 = f 0 := rfl
  rw [wronskian_det_reduce k g x hg (hg0 ▸ h0.ne'), hg0] at hpos
  have he : wronskianReduced k g = wronskianPrefix hk (wronskianReduced n f) := by rfl
  rw [he] at hpos
  exact pos_of_mul_pos_right hpos (pow_nonneg h0.le _)

theorem adjacentIoc_tuple_ordered {n : ℕ} {t : Fin (n+1) → ℝ} (ht : StrictMono t)
    {z : Fin n → ℝ} (hz : ∀ i, z i ∈ Ioc (t i.castSucc) (t i.succ)) : StrictMono z := by
  intro i j hij
  have h : i.succ ≤ j.castSucc := by
    have he : i.val < j.val := hij
    exact Nat.succ_le_of_lt he
  exact ((hz i).2.trans (ht.monotone h)).trans_lt (hz j).1

theorem integral_eval_det_adjacent_pos (n : ℕ) (f : Fin n → ℝ → ℝ)
    (t : Fin (n+1) → ℝ) (ht : StrictMono t)
    (hf : ∀ i j : Fin n, IntegrableOn (f j) (Ioc (t i.castSucc) (t i.succ)))
    (h : ∀ z : Fin n → ℝ, (∀ i, z i ∈ Ioc (t i.castSucc) (t i.succ)) →
      0 < (evaluationMatrix n f z).det) :
    0 < ∫ z : Fin n → ℝ, (evaluationMatrix n f z).det
      ∂(Measure.pi fun i => volume.restrict (Ioc (t i.castSucc) (t i.succ))) := by
  let S : Fin n → Set ℝ := fun i => Ioc (t i.castSucc) (t i.succ)
  let μ := Measure.pi fun i => volume.restrict (S i)
  let B := Set.univ.pi S
  let F := fun z => (evaluationMatrix n f z).det
  have hI : Integrable F μ := integrable_eval_det _ _ _ hf
  have ha : ∀ᵐ z ∂μ, ∀ i : Fin n, z i ∈ S i := by
    apply Filter.eventually_all.mpr
    intro i
    exact Measure.tendsto_eval_ae_ae.eventually (ae_restrict_mem (μ := volume) measurableSet_Ioc)
  have hnonneg : ∀ᵐ z ∂μ, 0 ≤ F z := ha.mono fun z hz => (h z hz).le
  apply (integral_pos_iff_support_of_nonneg_ae hnonneg hI).2
  have hp : 0 < μ B := by
    unfold μ B
    rw [Measure.pi_pi]
    apply pos_iff_ne_zero.mpr
    apply Finset.prod_ne_zero_iff.mpr
    intro i _
    rw [Measure.restrict_apply measurableSet_Ioc, Set.inter_self, Real.volume_Ioc,
      ENNReal.ofReal_ne_zero_iff]
    exact sub_pos.mpr (ht (show i.castSucc < i.succ from Fin.castSucc_lt_succ))
  have hsub : B ⊆ Function.support F := fun z hz =>
    (h z (fun i => hz i (Set.mem_univ i))).ne'
  exact hp.trans_le (measure_mono hsub)

theorem positivePrefixWronskians_evaluation {n : ℕ} (f : Fin n → ℝ → ℝ) {S : Set ℝ}
    (hS : S.OrdConnected)
    (hf : ∀ j x, x ∈ S → ContDiffAt ℝ ∞ (f j) x)
    (hw : PositivePrefixWronskians f S)
    (t : Fin n → ℝ) (ht : StrictMono t) (htS : ∀ i, t i ∈ S) :
    0 < (evaluationMatrix n f t).det := by
  induction n with
  | zero => simp
  | succ n ih =>
    let g : Fin (n+1) → ℝ → ℝ := fun j x => f j x/f 0 x
    have hfirst (x : ℝ) (hx : x ∈ S) : 0 < f 0 x := positivePrefixWronskians_first hw hx
    have hg (j : Fin (n+1)) (x : ℝ) (hx : x ∈ S) : ContDiffAt ℝ ∞ (g j) x :=
      (hf j x hx).div (hf 0 x hx) (hfirst x hx).ne'
    have hl (j : Fin n) (x : ℝ) (hx : x ∈ S) : ContDiffAt ℝ ∞ (deriv (g j.succ)) x :=
      (hg _ _ hx).derivWithin (by simp)
    have hhint (i j : Fin n) :
        IntervalIntegrable (deriv (g j.succ)) volume (t i.castSucc) (t i.succ) := by
      have hc : ContinuousOn (deriv (g j.succ)) (Icc (t i.castSucc) (t i.succ)) :=
        fun x hx => (hl j x (hS.out (htS _) (htS _) hx)).continuousAt.continuousWithinAt
      exact hc.intervalIntegrable_of_Icc (ht (show i.castSucc < i.succ from Fin.castSucc_lt_succ)).le
    have hd := evaluation_det_difference_integral n g t ht
      (fun i => div_self (hfirst (t i) (htS i)).ne')
      (fun i j x hx => ((hg _ _ (hS.out (htS _) (htS _) hx)).differentiableAt (by simp)).hasDerivAt)
      hhint
    have hb : PositivePrefixWronskians (fun j : Fin n => deriv (g j.succ)) S :=
      positivePrefixWronskians_reduced hw hf
    have hpos : 0 < (evaluationMatrix (n+1) g t).det := by
      rw [hd]
      apply integral_eval_det_adjacent_pos n _ t ht (fun i j => (hhint i j).1)
      intro z hz
      exact ih _ hl hb z (adjacentIoc_tuple_ordered ht hz) (fun i =>
        hS.out (htS _) (htS _) ⟨(hz i).1.le,(hz i).2⟩)
    have hm : evaluationMatrix (n+1) f t =
        Matrix.diagonal (fun i => f 0 (t i))*evaluationMatrix (n+1) g t := by
      ext i j
      rw [Matrix.diagonal_mul]
      change f j (t i) = f 0 (t i)*(f j (t i)/f 0 (t i))
      exact (mul_div_cancel₀ _ (hfirst (t i) (htS i)).ne').symm
    rw [hm, Matrix.det_mul, Matrix.det_diagonal]
    exact mul_pos (Finset.prod_pos fun i _ => hfirst (t i) (htS i)) hpos


private theorem eval_prod_alternating_signs (n : ℕ) :
    ∏ j : Fin n, (-1:ℝ)^j.val = (-1:ℝ)^(n.choose 2) := by
  rw [Finset.prod_pow_eq_pow_sum, Fin.sum_univ_eq_sum_range (fun k : ℕ => k) n,
    Finset.sum_range_id, Nat.choose_two_right]

noncomputable def alternatingFamily (n : ℕ) (f : Fin n → ℝ → ℝ) : Fin n → ℝ → ℝ :=
  fun i x => (-1:ℝ)^i.val * f i x

theorem wronskian_det_alternatingFamily (n : ℕ) (f : Fin n → ℝ → ℝ) (x : ℝ) :
    (wronskianMatrix n (alternatingFamily n f) x).det =
      (-1:ℝ)^(n.choose 2) * (wronskianMatrix n f x).det := by
  have h : wronskianMatrix n (alternatingFamily n f) x =
      wronskianMatrix n f x * diagonal (fun i => (-1:ℝ)^i.val) := by
    ext i j
    rw [Matrix.mul_diagonal]
    change iteratedDeriv i.val (fun t => (-1:ℝ)^j.val*f j t) x =
      iteratedDeriv i.val (f j) x * (-1:ℝ)^j.val
    rw [iteratedDeriv_const_mul_field,mul_comm]
  rw [h, Matrix.det_mul, Matrix.det_diagonal, eval_prod_alternating_signs, mul_comm]

theorem evaluation_det_alternatingFamily (n : ℕ) (f : Fin n → ℝ → ℝ) (t : Fin n → ℝ) :
    (evaluationMatrix n (alternatingFamily n f) t).det =
      (-1:ℝ)^(n.choose 2) * (evaluationMatrix n f t).det := by
  have h : evaluationMatrix n (alternatingFamily n f) t =
      evaluationMatrix n f t * diagonal (fun i => (-1:ℝ)^i.val) := by
    ext i j
    rw [Matrix.mul_diagonal]
    exact mul_comm _ _
  rw [h,Matrix.det_mul,Matrix.det_diagonal,eval_prod_alternating_signs,mul_comm]

def AlternatingPrefixWronskians {n : ℕ} (f : Fin n → ℝ → ℝ) (S : Set ℝ) : Prop :=
  ∀ k (hk : k ≤ n) x, x ∈ S →
    0 < (-1:ℝ)^(k.choose 2)*(wronskianMatrix k (wronskianPrefix hk f) x).det

/-- The signed extended-Chebyshev evaluation criterion, without coalescing
nodes or any limiting divided-difference assumption. -/
theorem alternatingPrefixWronskians_evaluation {n : ℕ} (f : Fin n → ℝ → ℝ) {S : Set ℝ}
    (hS : S.OrdConnected)
    (hf : ∀ j x, x ∈ S → ContDiffAt ℝ ∞ (f j) x)
    (hw : AlternatingPrefixWronskians f S)
    (t : Fin n → ℝ) (ht : StrictMono t) (htS : ∀ i, t i ∈ S) :
    0 < (-1:ℝ)^(n.choose 2)*(evaluationMatrix n f t).det := by
  have hf' (j : Fin n) (x : ℝ) (hx : x ∈ S) :
      ContDiffAt ℝ ∞ (alternatingFamily n f j) x :=
    contDiffAt_const.mul (hf j x hx)
  have hp : PositivePrefixWronskians (alternatingFamily n f) S := by
    intro k hk x hx
    have he : wronskianPrefix hk (alternatingFamily n f) =
        alternatingFamily k (wronskianPrefix hk f) := rfl
    rw [he, wronskian_det_alternatingFamily]
    exact hw k hk x hx
  rw [← evaluation_det_alternatingFamily]
  exact positivePrefixWronskians_evaluation _ hS hf' hp t ht htS

theorem iteratedDeriv_iteratedDeriv_add (f : ℝ → ℝ) (a b : ℕ) :
    iteratedDeriv a (iteratedDeriv b f) = iteratedDeriv (a+b) f := by
  induction a with
  | zero => simp
  | succ a ih =>
    rw [show a+1+b = (a+b)+1 by omega, iteratedDeriv_succ, iteratedDeriv_succ, ih]

theorem iteratedDeriv_contDiff_infty (f : ℝ → ℝ)
    (hf : ∀ j : ℕ, Differentiable ℝ (iteratedDeriv j f)) (n : ℕ) :
    ContDiff ℝ ∞ (iteratedDeriv n f) := by
  apply contDiff_of_differentiable_iteratedDeriv
  intro j _
  rw [iteratedDeriv_iteratedDeriv_add]
  exact hf _

end NuttallCumulants
