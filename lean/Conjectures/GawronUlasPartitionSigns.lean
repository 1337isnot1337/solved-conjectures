import Conjectures.GawronUlasPartitionBounds
import Mathlib.Analysis.Fourier.ZMod

/-!
# Gawron–Ulas, Conjecture 4.3

Eventual periodicity of the signs would express the absolute-coefficient
series as a finite linear combination of radial evaluations, up to a bounded
polynomial. This contradicts the strictly larger oblique growth rate.
-/

open Filter Complex Finset
open scoped Topology

namespace GawronUlasPartitionSigns

private theorem periodic_eq_of_mod_eq {f : ℕ → ℤ} {q N : ℕ}
    (h : ∀ n ≥ N, f (n + q) = f n) {i j : ℕ} (hi : N ≤ i) (hj : N ≤ j)
    (hmod : i % q = j % q) : f i = f j := by
  have hr (m : ℕ) (hm : N ≤ m) (k : ℕ) : f (m + q * k) = f m := by
    induction k with
    | zero => simp
    | succ k ih =>
      rw [Nat.mul_succ, ← Nat.add_assoc, h _ (le_trans hm (Nat.le_add_right _ _)), ih]
  have hh : i + q * (j / q) = j + q * (i / q) := by
    have h₁ := Nat.mod_add_div i q
    have h₂ := Nat.mod_add_div j q
    omega
  rw [← hr i hi (j / q), hh, hr j hj]

private noncomputable def root {q : ℕ} [NeZero q] (j : ZMod q) : ℂ := ZMod.stdAddChar j

private theorem norm_root {q : ℕ} [NeZero q] (j : ZMod q) : ‖root j‖ = 1 := by
  simp [root, ZMod.stdAddChar_apply]

private noncomputable def mode {q : ℕ} [NeZero q] (s : ZMod q → ℂ) (j : ZMod q) : ℂ :=
  (q : ℂ)⁻¹ * ZMod.dft s j

private theorem expand_modes {q : ℕ} [NeZero q] (s : ZMod q → ℂ) (n : ℕ) :
    s (n : ZMod q) = ∑ j : ZMod q, mode s j * root j ^ n := by
  have h := congrFun (ZMod.dft.symm_apply_apply s) (n : ZMod q)
  rw [ZMod.invDFT_apply] at h
  rw [← h, smul_eq_mul, mul_sum]
  refine sum_congr rfl fun j _ ↦ ?_
  have H := (ZMod.stdAddChar (N := q)).map_nsmul_eq_pow n j
  rw [nsmul_eq_mul, mul_comm] at H
  rw [root, ← H]
  simp only [mode, smul_eq_mul]
  ring

private theorem hasSum_weighted {q : ℕ} [NeZero q] (s : ZMod q → ℂ) {r : ℝ}
    (hr : 0 ≤ r) (hr' : r < 1) :
    HasSum (fun n : ℕ ↦ s n * (signedCount n : ℂ) * (r : ℂ) ^ n)
      (∑ j : ZMod q, mode s j * series (root j * r)) := by
  have h (j : ZMod q) : ‖root j * (r : ℂ)‖ < 1 := by
    simpa [norm_mul, norm_root, Real.norm_eq_abs, abs_of_nonneg hr] using hr'
  have hs (j : ZMod q) : HasSum (fun n : ℕ ↦ mode s j *
       ((signedCount n : ℂ) * (root j * r) ^ n)) (mode s j * series (root j * r)) := by
    have H := series_hasSum _ (h j)
    rw [← H.tsum_eq] at H
    exact H.mul_left _
  refine (hasSum_sum (s := Finset.univ) fun j _ ↦ hs j).congr_fun ?_
  intro n
  rw [expand_modes s n, sum_mul, sum_mul]
  refine sum_congr rfl fun j _ ↦ ?_
  rw [mul_pow]
  ring

private noncomputable def correction {q : ℕ} [NeZero q] (s : ZMod q → ℂ) (n : ℕ) : ℂ :=
  ((signedCount n).natAbs : ℂ) - s n * (signedCount n : ℂ)

private theorem bound_by_radial {q : ℕ} [NeZero q] {N : ℕ} (s : ZMod q → ℂ)
    (h : ∀ n ≥ N, s n = ((signedCount n).sign : ℂ)) {z : ℂ} (hz : ‖z‖ < 1) :
    ‖series z‖ ≤ (∑ n ∈ range N, ‖correction s n‖) +
      ∑ j : ZMod q, ‖mode s j‖ * ‖series (root j * (‖z‖ : ℂ))‖ := by
  let r := ‖z‖
  have hr : 0 ≤ r := norm_nonneg z
  have hzero (n : ℕ) (hn : N ≤ n) : correction s n = 0 := by
    rw [correction, h n hn, ← Int.cast_mul, Int.sign_mul_self_eq_natAbs, Int.cast_natCast, sub_self]
  have hc : HasSum (fun n : ℕ ↦ correction s n * (r : ℂ) ^ n)
      (∑ n ∈ range N, correction s n * (r : ℂ) ^ n) := by
    refine hasSum_sum_of_ne_finset_zero ?_
    intro n hn
    rw [hzero n (Nat.le_of_not_gt (fun hl ↦ hn (mem_range.mpr hl))), zero_mul]
  have H := ((hasSum_weighted s hr hz).add hc).congr_fun (g := fun n : ℕ ↦
    ((signedCount n).natAbs : ℂ) * (r : ℂ) ^ n) fun n ↦ by unfold correction; ring
  have H' := (Complex.hasSum_re H).congr_fun (g := fun n : ℕ ↦
      ‖(signedCount n : ℂ) * z ^ n‖) fun n ↦ by
    rw [norm_mul, norm_pow, Complex.norm_intCast, ← Int.cast_abs, ← Int.natCast_natAbs,
      Int.cast_natCast, ← Complex.ofReal_natCast, ← Complex.ofReal_pow, ← Complex.ofReal_mul,
      Complex.ofReal_re]
  calc
    ‖series z‖ ≤ ∑' n : ℕ, ‖(signedCount n : ℂ) * z ^ n‖ := norm_tsum_le_tsum_norm H'.summable
    _ = _ := H'.tsum_eq
    _ ≤ _ := Complex.re_le_norm _
    _ ≤ ‖∑ j : ZMod q, mode s j * series (root j * (r : ℂ))‖ +
        ‖∑ n ∈ range N, correction s n * (r : ℂ) ^ n‖ := norm_add_le _ _
    _ ≤ _ := by
      rw [add_comm]
      apply add_le_add
      · refine (norm_sum_le _ _).trans (sum_le_sum fun n _ ↦ ?_)
        rw [norm_mul, norm_pow, Complex.norm_real, Real.norm_eq_abs, abs_of_nonneg hr]
        exact mul_le_of_le_one_right (norm_nonneg _) (pow_le_one₀ hr hz.le)
      · simpa only [norm_mul] using norm_sum_le (Finset.univ : Finset (ZMod q))
          (fun j ↦ mode s j * series (root j * (r : ℂ)))

private theorem approach_mem_disk {η v : ℂ} (hη : ‖η‖ = 1) (hv : v.re = 1) {t : ℝ}
    (ht : 0 < t) : ‖approach η v t‖ < 1 := by
  rw [norm_approach hη hv]
  exact Real.exp_lt_one_iff.mpr (neg_lt_zero.mpr ht)

private theorem norm_series_approach_pos {η v : ℂ} (hη : ‖η‖ = 1) (hv : v.re = 1)
    {t : ℝ} (ht : 0 < t) : 0 < ‖series (approach η v t)‖ := by
  rw [series_eq_exp_lambert _ (approach_mem_disk hη hv ht), Complex.norm_exp]
  exact Real.exp_pos _

private theorem radial_eventually {η : ℂ} (hη : ‖η‖ = 1) {u : ℝ} (hu : 1 / 6 < u) :
    ∀ᶠ t : ℝ in 𝓝[>] 0, ‖series (η * (Real.exp (-t) : ℂ))‖ ≤ Real.exp (u / t) := by
  have H := (tendsto_order.1 (tendsto_cuspRate hη Complex.one_re)).2 _
    ((radial_rate_le hη).trans_lt hu)
  filter_upwards [H, self_mem_nhdsWithin] with t h (ht : 0 < t)
  have hp := norm_series_approach_pos hη Complex.one_re ht
  have he : approach η 1 t = η * (Real.exp (-t) : ℂ) := by simp [approach, Complex.ofReal_exp]
  rw [← he]
  exact (Real.log_le_iff_le_exp hp).mp ((le_div_iff₀ ht).2 (by simpa only [mul_comm] using h.le))

/-- Gawron–Ulas, Conjecture 4.3: the signed restricted partition counts do not even
have eventually periodic signs. -/
theorem gawron_ulas_partition_signs :
    ¬ ∃ q : ℕ, 0 < q ∧ ∃ N : ℕ, ∀ n ≥ N,
      (signedCount (n + q)).sign = (signedCount n).sign := by
  rintro ⟨q, hq, N, h⟩
  have : NeZero q := ⟨hq.ne'⟩
  let s (j : ZMod q) : ℂ := ((signedCount (j.val + N * q)).sign : ℂ)
  have hs (n : ℕ) (hn : N ≤ n) : s n = ((signedCount n).sign : ℂ) := by
    have hNq : N ≤ N * q := Nat.le_mul_of_pos_right _ hq
    have hm : (n : ZMod q).val + N * q ≥ N := hNq.trans (Nat.le_add_left _ _)
    have hmod : ((n : ZMod q).val + N * q) % q = n % q := by
      rw [ZMod.val_natCast, Nat.add_mul_mod_self_right, Nat.mod_mod]
    simp only [s]
    rw [periodic_eq_of_mod_eq (f := fun m ↦ (signedCount m).sign) h hm hn hmod]
  obtain ⟨u, hu, hu'⟩ := exists_between oblique_rate_gt
  have hu0 : 0 < u := lt_trans (by norm_num) hu
  let C := ∑ n ∈ range N, ‖correction s n‖
  let W := ∑ j : ZMod q, ‖mode s j‖
  let K := 1 + C + W
  have hC : 0 ≤ C := Finset.sum_nonneg fun _ _ ↦ norm_nonneg _
  have hW : 0 ≤ W := Finset.sum_nonneg fun _ _ ↦ norm_nonneg _
  have hK : 0 < K := by dsimp [K]; linarith
  have H : ∀ᶠ t : ℝ in 𝓝[>] 0, ∀ j : ZMod q,
      ‖series (root j * (Real.exp (-t) : ℂ))‖ ≤ Real.exp (u / t) := by
    rw [Filter.eventually_all]
    exact fun j ↦ radial_eventually (norm_root j) hu
  have hv : (1 + I : ℂ).re = 1 := by simp
  have HB : ∀ᶠ t : ℝ in 𝓝[>] 0, t * Real.log ‖series (approach obliqueRoot (1 + I) t)‖ ≤
      t * Real.log K + u := by
    filter_upwards [H, self_mem_nhdsWithin] with t ht (ht' : 0 < t)
    let z := approach obliqueRoot (1 + I) t
    have hz : ‖z‖ < 1 := approach_mem_disk norm_obliqueRoot hv ht'
    have hp : 0 < ‖series z‖ := norm_series_approach_pos norm_obliqueRoot hv ht'
    have hB := bound_by_radial s hs hz
    have hz' : ‖z‖ = Real.exp (-t) := norm_approach norm_obliqueRoot hv t
    rw [hz'] at hB
    have hE : 1 ≤ Real.exp (u / t) := Real.one_le_exp_iff.mpr (div_nonneg hu0.le ht'.le)
    have hB' : ‖series z‖ ≤ K * Real.exp (u / t) := by
      calc
        _ ≤ C + ∑ j : ZMod q, ‖mode s j‖ * ‖series (root j * (Real.exp (-t) : ℂ))‖ := hB
        _ ≤ C + W * Real.exp (u / t) := by
          unfold W
          rw [sum_mul]
          exact add_le_add le_rfl (sum_le_sum fun j _ ↦
            mul_le_mul_of_nonneg_left (ht j) (norm_nonneg _))
        _ ≤ K * Real.exp (u / t) := by
          dsimp [K]
          nlinarith [mul_le_mul_of_nonneg_left hE hC, Real.exp_pos (u / t)]
    have hl := Real.log_le_log hp hB'
    rw [Real.log_mul hK.ne' (Real.exp_ne_zero _), Real.log_exp] at hl
    have hl' := mul_le_mul_of_nonneg_left hl ht'.le
    rwa [mul_add, mul_div_cancel₀ _ ht'.ne'] at hl'
  have hlim : Tendsto (fun t : ℝ ↦ t * Real.log K + u) (𝓝[>] 0) (𝓝 u) := by
    have hh : Tendsto (fun t : ℝ ↦ t) (𝓝[>] 0) (𝓝 0) := nhdsWithin_le_nhds
    simpa using (hh.mul_const (Real.log K)).add_const u
  exact (not_le_of_gt hu') (le_of_tendsto_of_tendsto
    (tendsto_cuspRate norm_obliqueRoot hv) hlim HB)

end GawronUlasPartitionSigns
