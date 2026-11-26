import Mathlib.Analysis.Normed.Ring.InfiniteSum
import Mathlib.Analysis.SpecialFunctions.Complex.LogBounds
import Mathlib.Analysis.SpecialFunctions.Log.Summable
import Mathlib.Data.DFinsupp.Defs
import Mathlib.Logic.Equiv.Fin.Basic

/-!
# The signed partition series for parts `1 mod 3`

A partition is specified by the multiplicity of each allowed part. We group the
absolutely convergent sum over these partitions by total weight, and identify
it with the exponential of a Lambert series.
-/

open scoped BigOperators
open Finset

namespace GawronUlasPartitionSigns

/-- Multiplicities of the parts `3 * j + 1`, with only finitely many nonzero. -/
abbrev Multiplicities := Π₀ _ : ℕ, ℕ

def weight (p : Multiplicities) : ℕ := ∑ j ∈ p.support, (3 * j + 1) * p j

def length (p : Multiplicities) : ℕ := ∑ j ∈ p.support, p j

/-- Unordered partitions of `n` into parts congruent to `1` modulo `3`. -/
abbrev RestrictedPartition (n : ℕ) := {p : Multiplicities // weight p = n}

private theorem le_weight {p : Multiplicities} {j : ℕ} (hj : j ∈ p.support) :
    (3 * j + 1) * p j ≤ weight p := by
  unfold weight
  exact Finset.single_le_sum (f := fun i ↦ (3 * i + 1) * p i) (fun _ _ ↦ Nat.zero_le _) hj

private theorem multiplicity_le_weight (p : Multiplicities) (j : ℕ) : p j ≤ weight p := by
  by_cases hj : j ∈ p.support
  · exact (Nat.le_mul_of_pos_left _ (by omega)).trans (le_weight hj)
  · simp [DFinsupp.notMem_support_iff.mp hj]

private theorem index_lt_weight {p : Multiplicities} {j : ℕ} (hj : j ∈ p.support) :
    j < weight p := by
  have hp : 0 < p j := Nat.pos_of_ne_zero (DFinsupp.mem_support_iff.mp hj)
  have h := (Nat.le_mul_of_pos_right (3 * j + 1) hp).trans (le_weight hj)
  omega

noncomputable instance (n : ℕ) : Fintype (RestrictedPartition n) := by
  let f (p : RestrictedPartition n) (j : Fin n) : Fin (n + 1) :=
    ⟨p.val j.val, by
      have h := multiplicity_le_weight p.val j.val
      rw [p.property] at h
      exact Nat.lt_succ_of_le h⟩
  refine Fintype.ofInjective f ?_
  intro p q hpq
  apply Subtype.ext
  ext j
  by_cases hj : j < n
  · exact congrArg Fin.val (congrFun hpq ⟨j, hj⟩)
  · have hp : j ∉ p.val.support := fun h ↦ hj (p.property ▸ index_lt_weight h)
    have hq : j ∉ q.val.support := fun h ↦ hj (q.property ▸ index_lt_weight h)
    rw [DFinsupp.notMem_support_iff.mp hp, DFinsupp.notMem_support_iff.mp hq]

/-- The number with even length minus the number with odd length. -/
noncomputable def signedCount (n : ℕ) : ℤ :=
  ∑ p : RestrictedPartition n, (-1) ^ length p.val

/-- Generating function of the signed counts. -/
noncomputable def series (z : ℂ) : ℂ := ∑' n : ℕ, (signedCount n : ℂ) * z ^ n

private theorem summable_fin_prod {K A : Type*} [NormedField K] [CompleteSpace K] {n : ℕ}
    (f : Fin n → A → K) (h : ∀ i, Summable (fun a ↦ ‖f i a‖)) :
    Summable (fun a : Fin n → A ↦ ‖∏ i, f i (a i)‖) ∧
      (∑' a : Fin n → A, ∏ i, f i (a i)) = ∏ i, ∑' a, f i a := by
  classical
  induction n with
  | zero =>
    have : Unique (Fin 0 → A) := ⟨⟨Fin.elim0⟩, fun _ ↦ funext fun i ↦ i.elim0⟩
    have : Fintype (Fin 0 → A) := Fintype.ofFinite _
    refine ⟨?_, by simp⟩
    simpa using (hasSum_fintype (fun _ : Fin 0 → A ↦ (1 : ℝ))).summable
  | succ n ih =>
    let e := Fin.consEquiv (fun _ : Fin (n + 1) ↦ A)
    have htail := ih (fun i ↦ f i.succ) (fun i ↦ h i.succ)
    constructor
    · rw [← e.summable_iff]
      simpa [e, Function.comp_def, Fin.prod_univ_succ] using (h 0).mul_norm htail.1
    · rw [← e.tsum_eq, Fin.prod_univ_succ, ← htail.2,
        tsum_mul_tsum_of_summable_norm (h 0) htail.1]
      exact tsum_congr fun a ↦ by simp [e, Fin.prod_univ_succ]

private theorem summable_fintype_prod {K A ι : Type*} [NormedField K] [CompleteSpace K] [Fintype ι]
    (f : ι → A → K) (h : ∀ i, Summable (fun a ↦ ‖f i a‖)) :
    Summable (fun a : ι → A ↦ ‖∏ i, f i (a i)‖) ∧
      (∑' a : ι → A, ∏ i, f i (a i)) = ∏ i, ∑' a, f i a := by
  classical
  let e := Fintype.equivFin ι
  let E : (Fin (Fintype.card ι) → A) ≃ (ι → A) := Equiv.arrowCongr e.symm (Equiv.refl A)
  have P (a : Fin (Fintype.card ι) → A) :
      (∏ i, f i (E a i)) = ∏ i, f (e.symm i) (a i) :=
    Fintype.prod_equiv e _ _ fun i ↦ by simp [E]
  have hs := summable_fin_prod (fun i ↦ f (e.symm i)) (fun i ↦ h (e.symm i))
  refine ⟨?_, ?_⟩
  · rw [← E.summable_iff]
    simpa only [Function.comp_def, P] using hs.1
  · rw [← E.tsum_eq]
    simp only [P, hs.2]
    exact Fintype.prod_equiv e.symm _ _ fun _ ↦ rfl

private def succEquiv : ℕ ≃ {m : ℕ // m ≠ 0} where
  toFun n := ⟨n + 1, by omega⟩
  invFun m := m.val - 1
  left_inv n := by simp
  right_inv m := Subtype.ext (by have := m.property; dsimp; omega)

private theorem summable_norm_pow_pos {K : Type*} [NormedField K] {x : K} (hx : ‖x‖ < 1) :
    Summable (fun m : {m : ℕ // m ≠ 0} ↦ ‖x ^ m.val‖) := by
  rw [← succEquiv.summable_iff]
  simpa [Function.comp_def, succEquiv, pow_succ, norm_mul, norm_pow] using
    (summable_geometric_of_lt_one (norm_nonneg x) hx).mul_right ‖x‖

private theorem pow_pos_sum {K : Type*} [NormedField K] [CompleteSpace K]
    {x : K} (hx : ‖x‖ < 1) :
    (∑' m : {m : ℕ // m ≠ 0}, x ^ m.val) = x / (1 - x) := by
  rw [← succEquiv.tsum_eq]
  simp only [succEquiv, Equiv.coe_fn_mk, pow_succ]
  rw [tsum_mul_right, tsum_geometric_of_norm_lt_one hx, mul_comm, div_eq_mul_inv]

private abbrev SupportData := Σ s : Finset ℕ, ∀ _ : s, {m : ℕ // m ≠ 0}

private noncomputable abbrev partitionEquiv : Multiplicities ≃ SupportData :=
  DFinsupp.sigmaFinsetFunEquiv

private theorem term_eq_prod (z : ℂ) (p : Multiplicities) :
    (-1 : ℂ) ^ length p * z ^ weight p =
      ∏ j : (partitionEquiv p).1, (-z ^ (3 * j.val + 1)) ^ ((partitionEquiv p).2 j).val := by
  change _ = ∏ j : p.support, (-z ^ (3 * j.val + 1)) ^ p j.val
  simp only [length, weight, ← Finset.prod_pow_eq_pow_sum, ← Finset.prod_mul_distrib]
  rw [Finset.prod_coe_sort p.support (fun j : ℕ ↦ (-z ^ (3 * j + 1)) ^ p j)]
  exact Finset.prod_congr rfl fun j _ ↦ by rw [pow_mul, ← mul_pow, neg_one_mul]

private theorem norm_part_lt_one {z : ℂ} (hz : ‖z‖ < 1) (j : ℕ) :
    ‖-z ^ (3 * j + 1)‖ < 1 := by
  rw [norm_neg, norm_pow]
  exact pow_lt_one₀ (norm_nonneg _) hz (by omega)

private theorem geomPart_summable {r : ℝ} (hr : 0 ≤ r) (hr' : r < 1) :
    Summable (fun j : ℕ ↦ r ^ (3 * j + 1) / (1 - r ^ (3 * j + 1))) := by
  refine ((summable_geometric_of_lt_one hr hr').div_const (1 - r)).of_nonneg_of_le
    (fun j ↦ div_nonneg (pow_nonneg hr _) (sub_nonneg.mpr (pow_le_one₀ hr hr'.le)))
    (fun j ↦ ?_)
  have h₁ : r ^ (3 * j + 1) ≤ r := by
    simpa only [pow_one] using pow_le_pow_of_le_one hr hr'.le (show 1 ≤ 3 * j + 1 by omega)
  exact div_le_div₀ (pow_nonneg hr _) (pow_le_pow_of_le_one hr hr'.le (by omega))
    (sub_pos.mpr hr') (by linarith)

private theorem partitionTerms (z : ℂ) (hz : ‖z‖ < 1) :
    Summable (fun p : Multiplicities ↦ ‖(-1 : ℂ) ^ length p * z ^ weight p‖) ∧
      (∑' p : Multiplicities, (-1 : ℂ) ^ length p * z ^ weight p) =
        ∏' j : ℕ, (1 + z ^ (3 * j + 1))⁻¹ := by
  let x (j : ℕ) := -z ^ (3 * j + 1)
  let f (s : Finset ℕ) (a : ∀ _ : s, {m : ℕ // m ≠ 0}) := ∏ j : s, x j.val ^ (a j).val
  have hpart (j : ℕ) : ‖x j‖ < 1 := norm_part_lt_one hz j
  have hs (s : Finset ℕ) := summable_fintype_prod
    (fun (j : s) (m : {m : ℕ // m ≠ 0}) ↦ x j.val ^ m.val)
    (fun j ↦ summable_norm_pow_pos (hpart j.val))
  have hn : Summable (fun a : SupportData ↦ ‖f a.1 a.2‖) := by
    rw [summable_sigma_of_nonneg (fun _ ↦ norm_nonneg _)]
    refine ⟨fun s ↦ (hs s).1, ?_⟩
    let g (j : ℕ) := ‖z‖ ^ (3 * j + 1) / (1 - ‖z‖ ^ (3 * j + 1))
    have hg (j : ℕ) : 0 ≤ g j := div_nonneg (pow_nonneg (norm_nonneg _) _)
      (sub_nonneg.mpr (pow_le_one₀ (norm_nonneg _) hz.le))
    have hsum (s : Finset ℕ) : (∑' a, ‖f s a‖) = ∏ j ∈ s, g j := by
      have hnr (j : ℕ) : ‖(‖x j‖ : ℝ)‖ < 1 := by simpa using hpart j
      have H := summable_fintype_prod (fun (j : s) (m : {m : ℕ // m ≠ 0}) ↦
        (‖x j.val‖ : ℝ) ^ m.val) (fun j ↦ summable_norm_pow_pos (hnr j.val))
      simp only [f, norm_prod, norm_pow]
      rw [H.2]
      simp_rw [fun j : s ↦ pow_pos_sum (hnr j.val)]
      simp only [x, norm_neg, norm_pow]
      exact Finset.prod_coe_sort s g
    simp_rw [hsum]
    exact summable_finsetProd_of_summable_nonneg hg (geomPart_summable (norm_nonneg _) hz)
  constructor
  · rw [← partitionEquiv.summable_iff] at hn
    simpa only [Function.comp_def, term_eq_prod, f, x] using hn
  · have H := partitionEquiv.tsum_eq (fun a : SupportData ↦ f a.1 a.2)
    simp only [f, x, ← term_eq_prod] at H
    rw [H]
    change (∑' a : SupportData, f a.1 a.2) = _
    rw [hn.of_norm.tsum_sigma]
    simp_rw [show ∀ s, (∑' a, f s a) = ∏ j ∈ s, x j / (1 - x j) from fun s ↦ by
      unfold f
      rw [(hs s).2]
      simp_rw [fun j : s ↦ pow_pos_sum (hpart j.val)]
      exact Finset.prod_coe_sort s (fun j ↦ x j / (1 - x j))]
    have hfun (j : ℕ) : (1 + z ^ (3 * j + 1))⁻¹ = 1 + x j / (1 - x j) := by
      have hne : 1 - x j ≠ 0 := sub_ne_zero.mpr (fun h ↦ by simpa [← h] using hpart j)
      rw [show 1 + z ^ (3 * j + 1) = 1 - x j by simp [x]]
      field_simp [hne]
      ring
    simp_rw [hfun]
    exact (tprod_one_add (by
      apply summable_finsetProd_of_summable_norm
      refine (geomPart_summable (norm_nonneg _) hz).of_nonneg_of_le (fun _ ↦ norm_nonneg _) ?_
      intro j
      rw [norm_div]
      refine div_le_div₀ (pow_nonneg (norm_nonneg z) _) (by simp [x, norm_pow]) ?_ ?_
      · simpa [x, norm_pow] using sub_pos.mpr (hpart j)
      · have hb := norm_sub_norm_le (1 : ℂ) (x j)
        simpa [x, norm_pow] using hb)).symm

theorem series_hasSum (z : ℂ) (hz : ‖z‖ < 1) :
    HasSum (fun n : ℕ ↦ (signedCount n : ℂ) * z ^ n)
      (∏' j : ℕ, (1 + z ^ (3 * j + 1))⁻¹) := by
  let f (p : Multiplicities) := (-1 : ℂ) ^ length p * z ^ weight p
  have hs := (partitionTerms z hz).1.of_norm.hasSum
  rw [(partitionTerms z hz).2] at hs
  have h := (Equiv.sigmaFiberEquiv weight).hasSum_iff.mpr hs
  refine (h.sigma (fun n ↦ hasSum_fintype (fun p : RestrictedPartition n ↦ f p.val))).congr_fun ?_
  intro n
  simp [f, signedCount, Finset.sum_mul, show ∀ p : RestrictedPartition n, weight p.val = n from
    fun p ↦ p.property]

/-- The logarithmic Lambert series, indexed by positive integers `j + 1`. -/
noncomputable def lambert (z : ℂ) : ℂ := ∑' j : ℕ,
  ((-z) ^ (j + 1) / (j + 1)) / (1 - z ^ (3 * (j + 1)))

theorem series_eq_exp_lambert (z : ℂ) (hz : ‖z‖ < 1) : series z = Complex.exp (lambert z) := by
  let f (p : ℕ × ℕ) := (-1 : ℂ) ^ (p.2 + 1) * z ^ ((3 * p.1 + 1) * (p.2 + 1)) /
    (p.2 + 1)
  have hf : Summable f := by
    apply Summable.of_norm
    have hg := summable_geometric_of_lt_one (norm_nonneg z) hz
    refine (hg.mul_of_nonneg hg (fun _ ↦ by positivity) (fun _ ↦ by positivity)).of_nonneg_of_le
      (fun _ ↦ norm_nonneg _) ?_
    intro p
    have h₁ : (1 : ℝ) ≤ p.2 + 1 := le_add_of_nonneg_left (Nat.cast_nonneg _)
    simpa only [f, norm_div, norm_mul, norm_pow, norm_neg, norm_one, one_pow, one_mul,
      ← Complex.ofReal_natCast, ← Complex.ofReal_one, ← Complex.ofReal_add, Complex.norm_real,
      Real.norm_eq_abs, abs_of_nonneg (by positivity : 0 ≤ (p.2 : ℝ) + 1), ← pow_add, div_one] using
      (div_le_div₀ (pow_nonneg (norm_nonneg z) _)
        (pow_le_pow_of_le_one (norm_nonneg z) hz.le
          (show p.1 + p.2 ≤ (3 * p.1 + 1) * (p.2 + 1) by nlinarith))
        (by norm_num : (0 : ℝ) < 1) h₁ : ‖z‖ ^ _ / _ ≤ ‖z‖ ^ _ / 1)
  have hrow (i : ℕ) : (∑' j : ℕ, f (i, j)) = -Complex.log (1 + z ^ (3 * i + 1)) := by
    convert (Complex.hasSum_taylorSeries_neg_log' (norm_part_lt_one hz i)).tsum_eq using 1
    · refine tsum_congr fun j ↦ ?_
      simp only [f, neg_eq_neg_one_mul (z ^ (3 * i + 1)), mul_pow, pow_mul]
    · simp [sub_neg_eq_add]
  have hcol (j : ℕ) : (∑' i : ℕ, f (i, j)) =
      ((-z) ^ (j + 1) / (j + 1)) / (1 - z ^ (3 * (j + 1))) := by
    have hh : ‖z ^ (3 * (j + 1))‖ < 1 := by
      rw [norm_pow]
      exact pow_lt_one₀ (norm_nonneg _) hz (by omega)
    rw [div_eq_mul_inv, ← tsum_geometric_of_norm_lt_one hh, ← tsum_mul_left]
    refine tsum_congr fun i ↦ ?_
    simp only [f, neg_eq_neg_one_mul z, mul_pow, ← pow_mul]
    rw [show (3 * i + 1) * (j + 1) = (j + 1) + (3 * (j + 1)) * i by ring, pow_add]
    ring
  have H := hf.hasSum.prod_fiberwise (fun i ↦ (hf.prod_factor i).hasSum)
  have hlog : HasSum (fun i : ℕ ↦ -Complex.log (1 + z ^ (3 * i + 1))) (lambert z) := by
    have heq : (∑' p, f p) = lambert z := by
      rw [← (Equiv.prodComm ℕ ℕ).tsum_eq]
      change (∑' p : ℕ × ℕ, f p.swap) = _
      rw [hf.prod_symm.tsum_prod]
      exact tsum_congr hcol
    rw [← heq]
    exact H.congr_fun fun i ↦ (hrow i).symm
  have hprod := hlog.cexp
  have hp : HasProd (fun i : ℕ ↦ (1 + z ^ (3 * i + 1))⁻¹) (Complex.exp (lambert z)) := by
    refine hprod.congr_fun fun i ↦ ?_
    have hne : 1 + z ^ (3 * i + 1) ≠ 0 := by
      rw [← sub_neg_eq_add]
      exact sub_ne_zero.mpr fun h ↦ by simpa [← h] using norm_part_lt_one hz i
    simp [Complex.exp_neg, Complex.exp_log hne]
  exact (series_hasSum z hz).tsum_eq.trans hp.tprod_eq

end GawronUlasPartitionSigns
