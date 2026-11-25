import Mathlib.Topology.MetricSpace.HausdorffDimension
import Mathlib.Analysis.SpecificLimits.Basic
import Mathlib.Algebra.Order.Floor.Semiring

/-!
# A Hölder decoding argument for nested families of intervals

At each level all intervals have the same length, and each parent has the
same number of ordered children. A point of the unit interval chooses one
child at every level by subdividing its source interval into equal parts.
The inverse of this coding is Hölder on the resulting compact subset.
-/

open Set Filter Metric
open scoped Topology ENNReal NNReal

namespace RevisedTanZhou

noncomputable section

structure Level where
  count : ℕ
  count_pos : 0 < count
  len : ℝ
  len_pos : 0 < len
  start : ℕ → ℝ

def Level.box (p : Level) (i : ℕ) := Icc (p.start i) (p.start i + p.len)

structure Refinement (p q : Level) where
  branchCount : ℕ
  two_le : 2 ≤ branchCount
  count_eq : q.count = p.count * branchCount
  gap : ℝ
  gap_pos : 0 < gap
  contract : q.len ≤ p.len / 2
  narrow : q.len ≤ gap / 2
  coverage : p.len ≤ 128 * gap * branchCount
  nested : ∀ i < q.count, q.box i ⊆ p.box (i / branchCount)
  spacing : ∀ i j, j < q.count → i / branchCount = j / branchCount → i < j →
    gap * ((j : ℝ) - i) ≤ q.start j - q.start i

variable (L : ℕ → Level) (next : ∀ n, Refinement (L n) (L (n + 1)))

private def address (x : ℝ) (n : ℕ) : ℕ := ⌊x * ((L n).count : ℝ)⌋₊

private theorem address_bounds {x : ℝ} (hx : x ∈ Ico 0 1) (n : ℕ) :
    ((address L x n : ℕ) : ℝ) ≤ x * (L n).count ∧
      x * (L n).count < (address L x n : ℝ) + 1 := by
  exact ⟨Nat.floor_le (mul_nonneg hx.1 (by positivity)), Nat.lt_floor_add_one _⟩

private theorem address_lt {x : ℝ} (hx : x ∈ Ico 0 1) (n : ℕ) :
    address L x n < (L n).count := by
  exact_mod_cast (address_bounds L hx n).1.trans_lt
    (mul_lt_of_lt_one_left (by exact_mod_cast (L n).count_pos) hx.2)

private theorem address_parent {x : ℝ} (hx : x ∈ Ico 0 1) (n : ℕ) :
    address L x (n + 1) / (next n).branchCount = address L x n := by
  let p := address L x n
  let q := address L x (n + 1)
  let b := (next n).branchCount
  have hb : 0 < b := by have := (next n).two_le; omega
  have hbR : (0 : ℝ) < b := by exact_mod_cast hb
  have hc : ((L (n + 1)).count : ℝ) = (L n).count * (b : ℝ) := by
    exact_mod_cast (next n).count_eq
  have hp := address_bounds L hx n
  have hq := address_bounds L hx (n + 1)
  have hlow : p * b ≤ q := by
    by_contra! hn
    have hh : (q : ℝ) + 1 ≤ (p : ℝ) * b := by exact_mod_cast (show q + 1 ≤ p * b by omega)
    have hm := mul_le_mul_of_nonneg_right hp.1 hbR.le
    rw [hc] at hq
    have hq' : x * ((L n).count * (b : ℝ)) < (q : ℝ) + 1 := hq.2
    dsimp [p] at hh
    nlinarith
  have hhigh : q < (p + 1) * b := by
    have hh := mul_lt_mul_of_pos_right hp.2 hbR
    rw [hc] at hq
    exact_mod_cast (show (q : ℝ) < ((p : ℝ) + 1) * b by
      dsimp [p, q]
      nlinarith [hq.1])
  exact Nat.le_antisymm (Nat.lt_succ_iff.mp ((Nat.div_lt_iff_lt_mul hb).mpr hhigh))
    ((Nat.le_div_iff_mul_le hb).mpr hlow)

private def lo (x : ℝ) (n : ℕ) : ℝ := (L n).start (address L x n)

private def hi (x : ℝ) (n : ℕ) : ℝ := lo L x n + (L n).len

include next

private theorem nested_boxes {x : ℝ} (hx : x ∈ Ico 0 1) (n : ℕ) :
    Icc (lo L x (n + 1)) (hi L x (n + 1)) ⊆ Icc (lo L x n) (hi L x n) := by
  have h := (next n).nested _ (address_lt L hx (n + 1))
  rw [address_parent L next hx n] at h
  exact h

private theorem mono_lo {x : ℝ} (hx : x ∈ Ico 0 1) : Monotone (lo L x) := by
  apply monotone_nat_of_le_succ
  intro n
  exact (nested_boxes L next hx n ⟨le_rfl, le_add_of_nonneg_right (L (n + 1)).len_pos.le⟩).1

private theorem anti_hi {x : ℝ} (hx : x ∈ Ico 0 1) : Antitone (hi L x) := by
  apply antitone_nat_of_succ_le
  intro n
  exact (nested_boxes L next hx n ⟨le_add_of_nonneg_right (L (n + 1)).len_pos.le, le_rfl⟩).2

private def encode (x : ℝ) : ℝ := sSup (Set.range (lo L x))

private theorem encode_mem {x : ℝ} (hx : x ∈ Ico 0 1) (n : ℕ) :
    encode L x ∈ (L n).box (address L x n) := by
  have hbound (n : ℕ) : hi L x n ∈ upperBounds (Set.range (lo L x)) := by
    rintro _ ⟨m, rfl⟩
    by_cases h : m ≤ n
    · exact (mono_lo L next hx h).trans (le_add_of_nonneg_right (L n).len_pos.le)
    · exact (le_add_of_nonneg_right (L m).len_pos.le).trans (anti_hi L next hx (by omega))
  exact ⟨le_csSup ⟨_, hbound 0⟩ (mem_range_self n),
    csSup_le (Set.range_nonempty _) (hbound n)⟩

private theorem pow_le_count (n : ℕ) : 2 ^ n ≤ (L n).count := by
  induction n with
  | zero => exact (L 0).count_pos
  | succ n ih => rw [(next n).count_eq, pow_succ]; exact Nat.mul_le_mul ih (next n).two_le

private theorem exists_address_ne {x y : ℝ} (hx : x ∈ Ico 0 1) (hy : y ∈ Ico 0 1)
    (hxy : x < y) : ∃ n, address L x n ≠ address L y n := by
  obtain ⟨n, hn⟩ := ((tendsto_order.mp (tendsto_pow_atTop_nhds_zero_of_lt_one
    (by norm_num : (0 : ℝ) ≤ 1 / 2) (by norm_num : (1 : ℝ) / 2 < 1))).2 (y - x)
      (sub_pos.mpr hxy)).exists
  refine ⟨n, fun h => ?_⟩
  have hx' := (address_bounds L hx n).1
  have hy' := (address_bounds L hy n).2
  rw [h] at hx'
  have hc : (0 : ℝ) < (L n).count := by exact_mod_cast (L n).count_pos
  have hlt : y - x < 1 / ((L n).count : ℝ) := (lt_div_iff₀ hc).mpr (by linarith)
  have hh : 1 / ((L n).count : ℝ) ≤ (1 / 2 : ℝ) ^ n := by
    rw [div_pow, one_pow]
    exact one_div_le_one_div_of_le (by positivity) (by exact_mod_cast pow_le_count L next n)
  linarith

private theorem holder_ordered {u : ℝ} (hu : 0 < u) (hu1 : u ≤ 1) (hroot : (L 0).count = 1)
    (hmass : ∀ n, 1 / ((L n).count : ℝ) ≤ (L n).len ^ u)
    {x y : ℝ} (hx : x ∈ Ico 0 1) (hy : y ∈ Ico 0 1) (hxy : x < y) :
    encode L x < encode L y ∧ y - x ≤ 512 * (encode L y - encode L x) ^ u := by
  classical
  have hex := exists_address_ne L next hx hy hxy
  have h0 (z : ℝ) (hz : z ∈ Ico 0 1) : address L z 0 = 0 := by
    have h := address_lt L hz 0
    omega
  let m := Nat.find hex
  have hm : 0 < m := by
    by_contra! h
    have he : m = 0 := by omega
    have hh : address L x m ≠ address L y m := Nat.find_spec hex
    rw [he, h0 x hx, h0 y hy] at hh
    exact hh rfl
  obtain ⟨n, hn⟩ := Nat.exists_eq_succ_of_ne_zero hm.ne'
  have hsame : address L x n = address L y n := by
    by_contra h
    exact Nat.find_min hex (show n < m by omega) h
  let i := address L x (n + 1)
  let j := address L y (n + 1)
  have hij : i < j := by
    have hj : i ≠ j := by
      have hh : address L x m ≠ address L y m := Nat.find_spec hex
      rw [hn] at hh
      exact hh
    have hle : i ≤ j := Nat.floor_le_floor
      (mul_le_mul_of_nonneg_right hxy.le (by positivity))
    exact lt_of_le_of_ne hle hj
  have hpar : i / (next n).branchCount = j / (next n).branchCount := by
    dsimp [i, j]
    rw [address_parent L next hx, address_parent L next hy, hsame]
  let δ := encode L y - encode L x
  let d := (j : ℝ) - (i : ℝ)
  let g := (next n).gap
  let W := (L n).len
  let b := ((next n).branchCount : ℝ)
  let p := ((L n).count : ℝ)
  have hp : 0 < p := by dsimp [p]; exact_mod_cast (L n).count_pos
  have hb : 0 < b := by dsimp [b]; exact_mod_cast (show 0 < (next n).branchCount by have := (next n).two_le; omega)
  have hd : 1 ≤ d := by
    have hh : (i : ℝ) + 1 ≤ j := by exact_mod_cast (show i + 1 ≤ j by omega)
    dsimp [d]
    linarith
  have hg : 0 < g := (next n).gap_pos
  have hδ : g * d / 2 ≤ δ := by
    have hs := (next n).spacing i j (address_lt L hy _) hpar hij
    have hx₁ := (encode_mem L next hx (n + 1)).2
    have hy₁ := (encode_mem L next hy (n + 1)).1
    change encode L x ≤ (L (n + 1)).start i + (L (n + 1)).len at hx₁
    change (L (n + 1)).start j ≤ encode L y at hy₁
    have hlen : (L (n + 1)).len ≤ g / 2 := (next n).narrow
    dsimp [g, d, δ] at *
    nlinarith [mul_nonneg (sub_nonneg.mpr hd) hg.le]
  have hδpos : 0 < δ := (by positivity : 0 < g * d / 2).trans_le hδ
  refine ⟨sub_pos.mp hδpos, ?_⟩
  have hh : y - x ≤ 1 / p := by
    have hx' := (address_bounds L hx n).1
    have hy' := (address_bounds L hy n).2
    rw [hsame] at hx'
    exact ((lt_div_iff₀ hp).mpr (by dsimp [p]; nlinarith)).le
  have hh' : (y - x) * (p * b) ≤ 2 * d := by
    have hx' := (address_bounds L hx (n + 1)).1
    have hy' := (address_bounds L hy (n + 1)).2
    have he : ((L (n + 1)).count : ℝ) = p * b := by
      dsimp [p, b]
      exact_mod_cast (next n).count_eq
    rw [he] at hx' hy'
    dsimp [d, i, j] at *
    nlinarith
  have hW : 0 < W := (L n).len_pos
  have hcov : W ≤ 128 * g * b := (next n).coverage
  have hmass' : 1 / p ≤ W ^ u := hmass n
  have hlinear : (y - x) * W ≤ 512 * δ / p := by
    apply (le_div_iff₀ hp).mpr
    have h₁ := mul_le_mul_of_nonneg_left hcov (sub_nonneg.mpr hxy.le)
    have h₂ := mul_le_mul_of_nonneg_right hh' (show 0 ≤ 128 * g by positivity)
    have h₃ : (2 * d) * (128 * g) ≤ 512 * δ := by linarith
    exact (show (y - x) * W * p ≤ ((y - x) * (128 * g * b)) * p from
      mul_le_mul_of_nonneg_right h₁ hp.le).trans
      (by convert h₂.trans h₃ using 1; ring)
  by_cases hlarge : W ≤ δ
  · have hpower := Real.rpow_le_rpow hW.le hlarge hu.le
    have := (hh.trans hmass').trans hpower
    nlinarith [Real.rpow_nonneg hδpos.le u]
  · have hsmall := le_of_not_ge hlarge
    have he : W ^ u * δ ≤ δ ^ u * W := by
      have hpow := Real.rpow_le_rpow_of_nonpos hδpos hsmall (show u - 1 ≤ 0 by linarith)
      rw [Real.rpow_sub hW, Real.rpow_sub hδpos, Real.rpow_one, Real.rpow_one] at hpow
      exact (div_le_div_iff₀ hW hδpos).mp hpow
    have h₁ := mul_le_mul_of_nonneg_left hmass' (show 0 ≤ 512 * δ by positivity)
    have h₂ := mul_le_mul_of_nonneg_left he (show 0 ≤ (512 : ℝ) by norm_num)
    apply le_of_mul_le_mul_right _ hW
    calc
      _ ≤ 512 * δ / p := hlinear
      _ ≤ 512 * δ * W ^ u := by simpa only [mul_one_div] using h₁
      _ ≤ _ := by nlinarith

/-- The intersection of a uniformly branching interval construction has
dimension at least the exponent allowed by its reciprocal branch counts. -/
theorem dim_ge_of_refinements (S : Set ℝ) {u : ℝ≥0} (hu : 0 < u) (hu1 : u ≤ 1)
    (hroot : (L 0).count = 1) (hmass : ∀ n, 1 / ((L n).count : ℝ) ≤ (L n).len ^ (u : ℝ))
    (hS : ∀ z : ℝ, (∀ n, ∃ i < (L n).count, z ∈ (L n).box i) → z ∈ S) :
    (u : ℝ≥0∞) ≤ dimH S := by
  let I := Ico (0 : ℝ) 1
  let f := encode L
  let g := Function.invFunOn f I
  have hu' : 0 < (u : ℝ) := by exact_mod_cast hu
  have hu1' : (u : ℝ) ≤ 1 := by exact_mod_cast hu1
  have hs (x y : ℝ) (hx : x ∈ I) (hy : y ∈ I) (hxy : x < y) :=
    holder_ordered L next hu' hu1' hroot hmass hx hy hxy
  have hinj : Set.InjOn f I := by
    intro x hx y hy heq
    rcases lt_trichotomy x y with h | h | h
    · exact False.elim ((hs x y hx hy h).1.ne heq)
    · exact h
    · exact False.elim ((hs y x hy hx h).1.ne heq.symm)
  have himage : f '' I ⊆ S := by
    rintro _ ⟨x, hx, rfl⟩
    exact hS _ fun n => ⟨address L x n, address_lt L hx n, encode_mem L next hx n⟩
  have hgimage : g '' (f '' I) = I := hinj.invFunOn_image Set.Subset.rfl
  have hh : HolderOnWith (512 : ℝ≥0) u g (f '' I) := by
    rintro _ ⟨x, hx, rfl⟩ _ ⟨y, hy, rfl⟩
    have hleft := hinj.leftInvOn_invFunOn
    change edist (g (f x)) (g (f y)) ≤ (512 : ℝ≥0∞) * edist (f x) (f y) ^ (u : ℝ)
    have hleft' {z} (hz : z ∈ I) : g (f z) = z := hleft hz
    rw [hleft' hx, hleft' hy]
    have hdist : dist x y ≤ 512 * dist (f x) (f y) ^ (u : ℝ) := by
      rcases lt_trichotomy x y with h | rfl | h
      · rw [Real.dist_eq, Real.dist_eq, abs_of_neg (sub_neg.mpr h),
          abs_of_neg (sub_neg.mpr (hs x y hx hy h).1), neg_sub, neg_sub]
        exact (hs x y hx hy h).2
      · simp [Real.zero_rpow hu'.ne']
      · rw [dist_comm x y, dist_comm (f x) (f y), Real.dist_eq, Real.dist_eq,
          abs_of_neg (sub_neg.mpr h), abs_of_neg (sub_neg.mpr (hs y x hy hx h).1),
          neg_sub, neg_sub]
        exact (hs y x hy hx h).2
    rw [edist_dist, edist_dist, ENNReal.ofReal_rpow_of_nonneg dist_nonneg hu'.le,
      ← show ENNReal.ofReal 512 = (512 : ℝ≥0∞) by norm_num,
      ← ENNReal.ofReal_mul (by norm_num)]
    exact ENNReal.ofReal_le_ofReal hdist
  have hdim : dimH I = 1 := by
    apply le_antisymm
    · exact (dimH_mono (subset_univ I)).trans_eq Real.dimH_univ
    · have h := Real.dimH_of_nonempty_interior (s := Ioo (0 : ℝ) 1) (by
        rw [isOpen_Ioo.interior_eq]
        exact nonempty_Ioo.mpr zero_lt_one)
      exact (by simpa using h.symm : (1 : ℝ≥0∞) = dimH (Ioo (0 : ℝ) 1)) ▸
        dimH_mono (Ioo_subset_Ico_self : Ioo (0 : ℝ) 1 ⊆ I)
  have hb := hh.dimH_image_le hu
  rw [hgimage, hdim] at hb
  have hb' : (u : ℝ≥0∞) ≤ dimH (f '' I) := by
    simpa using (ENNReal.le_div_iff_mul_le (Or.inl (by exact_mod_cast hu.ne'))
      (Or.inl ENNReal.coe_ne_top)).mp hb
  exact hb'.trans (dimH_mono himage)

end
end RevisedTanZhou
