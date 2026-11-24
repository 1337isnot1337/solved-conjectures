import Conjectures.GravgaardLeeLargeLuroth
import Mathlib.Topology.MetricSpace.HausdorffDistance
import Mathlib.Topology.UniformSpace.UniformApproximation

/-! Gravgaard–Lee's mixed Lüroth sumset. Finite digit alphabets give compact
sets of infinite expansions. The covering argument uses a uniform contraction
after normalizing by the sum of the two cylinder scales. -/

open Filter Finset Set
open scoped Topology Pointwise

namespace GravgaardLeeMixedLuroth

open GravgaardLeeLargeLuroth

noncomputable section

theorem width_le_half {d : ℕ} (hd : 2 ≤ d) : width d ≤ 1 / 2 := by
  have hdR : (2 : ℝ) ≤ d := by exact_mod_cast hd
  have hden : (2 : ℝ) ≤ (d : ℝ) * ((d : ℝ) - 1) := by
    nlinarith [mul_nonneg (show 0 ≤ (d : ℝ) from Nat.cast_nonneg d)
      (show 0 ≤ (d : ℝ) - 2 by linarith)]
  unfold width
  exact one_div_le_one_div_of_le (by norm_num) hden

theorem scale_le (a : ℕ → ℕ) (ha : ∀ i, 2 ≤ a i) (n : ℕ) :
    (∏ j ∈ range n, width (a j)) ≤ (1 / 2 : ℝ) ^ n := by
  calc
    _ ≤ ∏ _j ∈ range n, (1 / 2 : ℝ) :=
      Finset.prod_le_prod₀ (fun j _ => (width_pos (ha j)).le) (fun j _ => width_le_half (ha j))
    _ = _ := by simp

theorem value_truncation (a : ℕ → ℕ) (ha : ∀ i, 2 ≤ a i) (n : ℕ) :
    value a = truncation a n + (∏ j ∈ range n, width (a j)) * value (fun i => a (n + i)) := by
  induction n generalizing a with
  | zero => simp [truncation]
  | succ n ih =>
    rw [value_head a ha, ih (fun i => a (i + 1)) (fun i => ha (i + 1)),
      prefix_head, prod_range_succ']
    have hshift : (fun i => a (n + i + 1)) = fun i => a (n + 1 + i) := by
      funext i
      congr 1
      omega
    rw [hshift]
    ring

theorem dist_truncation_value (a : ℕ → ℕ) (ha : ∀ i, 2 ≤ a i) (n : ℕ) :
    dist (truncation a n) (value a) ≤ (1 / 2 : ℝ) ^ n := by
  have hscale : 0 ≤ ∏ j ∈ range n, width (a j) :=
    prod_nonneg fun j _ => (width_pos (ha j)).le
  have htail := value_mem (fun i => a (n + i)) (fun i => ha (n + i))
  rw [Real.dist_eq, abs_of_nonpos (sub_nonpos.mpr (prefix_le_value a ha n)), neg_sub]
  calc
    _ = (∏ j ∈ range n, width (a j)) * value (fun i => a (n + i)) := by
      nth_rw 1 [value_truncation a ha n]
      ring
    _ ≤ _ := (mul_le_of_le_one_right hscale htail.2).trans (scale_le a ha n)

/-- Source digit sets on a finite initial alphabet. -/
def smallDigitSet (m : ℕ) : Set ℝ :=
  {y | ∃ a : ℕ → ℕ, (∀ i, 2 ≤ a i ∧ a i ≤ m) ∧ HasSum (sourceTerm a) y}

theorem mem_smallDigitSet {m : ℕ} {y : ℝ} :
    y ∈ smallDigitSet m ↔ ∃ a : ℕ → ℕ, (∀ i, 2 ≤ a i ∧ a i ≤ m) ∧ value a = y := by
  constructor
  · rintro ⟨a, ha, hy⟩
    exact ⟨a, ha, (value_hasSum a fun i => (ha i).1).unique hy⟩
  · rintro ⟨a, ha, rfl⟩
    exact ⟨a, ha, value_hasSum a fun i => (ha i).1⟩

theorem smallDigitSet_nonempty {m : ℕ} (hm : 2 ≤ m) : (smallDigitSet m).Nonempty :=
  ⟨value (fun _ => 2), mem_smallDigitSet.mpr ⟨fun _ => 2, fun _ => ⟨le_rfl, hm⟩, rfl⟩⟩

theorem smallDigitSet_bounds {m : ℕ} {y : ℝ} (hy : y ∈ smallDigitSet m) :
    y ∈ Ioc (0 : ℝ) 1 := by
  obtain ⟨a, ha, rfl⟩ := mem_smallDigitSet.mp hy
  exact value_mem a (fun i => (ha i).1)

theorem smallDigitSet_compact {m : ℕ} (hm : 2 ≤ m) : IsCompact (smallDigitSet m) := by
  let code (a : ℕ → Fin (m - 1)) (i : ℕ) : ℕ := (a i).val + 2
  have hcode (a : ℕ → Fin (m - 1)) (i : ℕ) : 2 ≤ code a i ∧ code a i ≤ m := by
    have := (a i).isLt
    dsimp only [code]
    omega
  have hset : smallDigitSet m = Set.range (fun a => value (code a)) := by
    ext y
    rw [mem_smallDigitSet]
    constructor
    · rintro ⟨a, ha, rfl⟩
      let b (i : ℕ) : Fin (m - 1) := ⟨a i - 2, by have := ha i; omega⟩
      refine ⟨b, congrArg value ?_⟩
      funext i
      change a i - 2 + 2 = a i
      have := ha i
      omega
    · rintro ⟨a, rfl⟩
      exact ⟨code a, hcode a, rfl⟩
  rw [hset]
  apply isCompact_range
  have hcont (i : ℕ) (f : ℕ → ℝ) : Continuous (fun a : ℕ → Fin (m - 1) => f (code a i)) :=
    (continuous_of_discreteTopology (f := fun b : Fin (m - 1) => f (b.val + 2))).comp
      (continuous_apply i)
  have ht (n : ℕ) : Continuous (fun a => truncation (code a) n) := by
    unfold truncation
    apply continuous_finsetSum
    intro i _
    have hp : Continuous (fun a => ∏ j ∈ range i, width (code a j)) :=
      continuous_finsetProd _ (fun j _ => hcont j width)
    exact hp.mul (hcont i (fun d => (d : ℝ)⁻¹)) |>.congr (fun _ => by simp [div_eq_mul_inv])
  apply TendstoUniformly.continuous (p := atTop) (F := fun n a => truncation (code a) n) _ (Frequently.of_forall ht)
  rw [Metric.tendstoUniformly_iff]
  intro ε hε
  have hlim := tendsto_pow_atTop_nhds_zero_of_lt_one
    (by norm_num : (0 : ℝ) ≤ 1 / 2) (by norm_num : (1 / 2 : ℝ) < 1)
  filter_upwards [(tendsto_order.1 hlim).2 ε hε] with n hn a
  rw [dist_comm]
  exact (dist_truncation_value (code a) (fun i => (hcode a i).1) n).trans_lt hn

theorem prepend_smallDigitSet {m d : ℕ} (hd : 2 ≤ d ∧ d ≤ m) {y : ℝ}
    (hy : y ∈ smallDigitSet m) : 1 / (d : ℝ) + width d * y ∈ smallDigitSet m := by
  obtain ⟨a, ha, rfl⟩ := mem_smallDigitSet.mp hy
  let b : ℕ → ℕ
    | 0 => d
    | n + 1 => a n
  have hb (i : ℕ) : 2 ≤ b i ∧ b i ≤ m := by
    cases i with
    | zero => exact hd
    | succ i => exact ha i
  exact mem_smallDigitSet.mpr ⟨b, hb, by simpa only [b] using value_head b (fun i => (hb i).1)⟩

private inductive Slope
  | sixth | third | one | twoThirds | two | four | twelve

private def slope : Slope → ℝ
  | .sixth => 1 / 6
  | .third => 1 / 3
  | .one => 1
  | .twoThirds => 2 / 3
  | .two => 2
  | .four => 4
  | .twelve => 12

private theorem slope_bounds (s : Slope) : 1 / 6 ≤ slope s ∧ slope s ≤ 12 := by
  cases s <;> norm_num [slope]

private def coordinate (s : Slope) (u : ℝ) : ℝ :=
  2 / 5 + 3 * slope s / 11 + u / 64 * (1 + slope s - 2 / 5 - 3 * slope s / 11)

private def low : Slope → ℝ
  | .sixth => 3
  | .one => 7
  | _ => 1

private def high : Slope → ℝ
  | .sixth => 19
  | .twelve => 22
  | _ => 64

private def primary (s : Slope) : Set ℝ := Icc (coordinate s (low s)) (coordinate s (high s))

private def domain : Slope → Set ℝ
  | .sixth => primary .sixth ∪ Icc (coordinate .sixth 28) (coordinate .sixth 64)
  | s => primary s

private theorem primary_subset (s : Slope) : primary s ⊆ domain s := by
  cases s
  · exact Set.subset_union_left
  all_goals exact Set.Subset.rfl

private theorem domain_bounds {s : Slope} {x : ℝ} (hx : x ∈ domain s) :
    0 ≤ x ∧ x ≤ 1 + slope s := by
  cases s <;> norm_num [domain, primary, low, high, coordinate, slope] at hx ⊢
  · rcases hx with h | h <;> constructor <;> linarith [h.1, h.2]
  all_goals constructor <;> linarith [hx.1, hx.2]

private def CanMove (s : Slope) (x : ℝ) : Prop :=
  ∃ (t : Slope) (u : ℝ) (d : ℕ), u ∈ domain t ∧
    ((2 ≤ d ∧ d ≤ 3 ∧ slope t * width d = slope s ∧
        x = 1 / (d : ℝ) + width d * u) ∨
     (2 ≤ d ∧ d ≤ 4 ∧ slope t = slope s * width d ∧
        x = slope s / (d : ℝ) + u))

private theorem leftMove (s t : Slope) (d : ℕ) {x : ℝ} (hd : 2 ≤ d ∧ d ≤ 3)
    (hscale : slope t * width d = slope s)
    (hlo : 1 / (d : ℝ) + width d * coordinate t (low t) ≤ x)
    (hhi : x ≤ 1 / (d : ℝ) + width d * coordinate t (high t)) : CanMove s x := by
  have hw := width_pos hd.1
  let u := (x - 1 / (d : ℝ)) / width d
  have hu : u * width d = x - 1 / (d : ℝ) := div_mul_cancel₀ _ hw.ne'
  refine ⟨t, u, d, primary_subset t ⟨?_, ?_⟩, Or.inl ⟨hd.1, hd.2, hscale, ?_⟩⟩
  · exact (le_div_iff₀ hw).2 (by linarith [mul_comm (width d) (coordinate t (low t))])
  · exact (div_le_iff₀ hw).2 (by linarith [mul_comm (width d) (coordinate t (high t))])
  · linarith [mul_comm (width d) u]

private theorem rightMove (s t : Slope) (d : ℕ) {x : ℝ} (hd : 2 ≤ d ∧ d ≤ 4)
    (hscale : slope t = slope s * width d)
    (hlo : slope s / (d : ℝ) + coordinate t (low t) ≤ x)
    (hhi : x ≤ slope s / (d : ℝ) + coordinate t (high t)) : CanMove s x := by
  refine ⟨t, x - slope s / (d : ℝ), d, primary_subset t ⟨?_, ?_⟩,
    Or.inr ⟨hd.1, hd.2, hscale, ?_⟩⟩ <;> linarith

private theorem certificate (s : Slope) {x : ℝ} (hx : x ∈ domain s) : CanMove s x := by
  cases s
  case sixth =>
    rcases hx with h | h
    · refine leftMove .sixth .one 3 (by decide) (by norm_num [slope, width]) ?_ ?_
      all_goals norm_num [primary, low, high, coordinate, slope, width] at h ⊢
      all_goals linarith [h.1, h.2]
    · refine leftMove .sixth .third 2 (by decide) (by norm_num [slope, width]) ?_ ?_
      all_goals norm_num [low, high, coordinate, slope, width] at h ⊢
      all_goals linarith [h.1, h.2]
  case third =>
    by_cases h : x ≤ coordinate .third 26
    · refine leftMove .third .two 3 (by decide) (by norm_num [slope, width]) ?_ ?_
      all_goals norm_num [domain, primary, low, high, coordinate, slope, width] at hx h ⊢
      all_goals linarith [hx.1, hx.2]
    · refine leftMove .third .twoThirds 2 (by decide) (by norm_num [slope, width]) ?_ ?_
      all_goals norm_num [domain, primary, low, high, coordinate, slope, width] at hx h ⊢
      all_goals linarith [hx.1, hx.2]
  case one =>
    by_cases h : x ≤ coordinate .one (77 / 5)
    · refine rightMove .one .sixth 3 (by decide) (by norm_num [slope, width]) ?_ ?_
      all_goals norm_num [domain, primary, low, high, coordinate, slope, width] at hx h ⊢
      all_goals linarith [hx.1, hx.2]
    · refine leftMove .one .two 2 (by decide) (by norm_num [slope, width]) ?_ ?_
      all_goals norm_num [domain, primary, low, high, coordinate, slope, width] at hx h ⊢
      all_goals linarith [hx.1, hx.2]
  case twoThirds =>
    by_cases h : x ≤ coordinate .twoThirds 34
    · refine leftMove .twoThirds .four 3 (by decide) (by norm_num [slope, width]) ?_ ?_
      all_goals norm_num [domain, primary, low, high, coordinate, slope, width] at hx h ⊢
      all_goals linarith [hx.1, hx.2]
    · refine rightMove .twoThirds .third 2 (by decide) (by norm_num [slope, width]) ?_ ?_
      all_goals norm_num [domain, primary, low, high, coordinate, slope, width] at hx h ⊢
      all_goals linarith [hx.1, hx.2]
  case two =>
    by_cases h : x ≤ coordinate .two 16
    · refine leftMove .two .twelve 3 (by decide) (by norm_num [slope, width]) ?_ ?_
      all_goals norm_num [domain, primary, low, high, coordinate, slope, width] at hx h ⊢
      all_goals linarith [hx.1, hx.2]
    · refine leftMove .two .four 2 (by decide) (by norm_num [slope, width]) ?_ ?_
      all_goals norm_num [domain, primary, low, high, coordinate, slope, width] at hx h ⊢
      all_goals linarith [hx.1, hx.2]
  case four =>
    by_cases h : x ≤ coordinate .four 15
    · refine rightMove .four .third 4 (by decide) (by norm_num [slope, width]) ?_ ?_
      all_goals norm_num [domain, primary, low, high, coordinate, slope, width] at hx h ⊢
      all_goals linarith [hx.1, hx.2]
    · by_cases h' : x ≤ coordinate .four (55 / 2)
      · refine rightMove .four .twoThirds 3 (by decide) (by norm_num [slope, width]) ?_ ?_
        all_goals norm_num [domain, primary, low, high, coordinate, slope, width] at hx h h' ⊢
        all_goals linarith [hx.1, hx.2]
      · refine rightMove .four .two 2 (by decide) (by norm_num [slope, width]) ?_ ?_
        all_goals norm_num [domain, primary, low, high, coordinate, slope, width] at hx h' ⊢
        all_goals linarith [hx.1, hx.2]
  case twelve =>
    by_cases h : x ≤ coordinate .twelve 9
    · refine rightMove .twelve .one 4 (by decide) (by norm_num [slope, width]) ?_ ?_
      all_goals norm_num [domain, primary, low, high, coordinate, slope, width] at hx h ⊢
      all_goals linarith [hx.1, hx.2]
    · refine rightMove .twelve .two 3 (by decide) (by norm_num [slope, width]) ?_ ?_
      all_goals norm_num [domain, primary, low, high, coordinate, slope, width] at hx h ⊢
      all_goals linarith [hx.1, hx.2]

private def target (s : Slope) : Set ℝ :=
  (fun p : ℝ × ℝ => p.1 + slope s * p.2) '' (smallDigitSet 3 ×ˢ smallDigitSet 4)

private theorem target_compact (s : Slope) : IsCompact (target s) :=
  ((smallDigitSet_compact (by decide : 2 ≤ 3)).prod (smallDigitSet_compact (by decide : 2 ≤ 4))).image
    (continuous_fst.add (continuous_const.mul continuous_snd))

private theorem target_nonempty (s : Slope) : (target s).Nonempty :=
  ((smallDigitSet_nonempty (by decide : 2 ≤ 3)).prod (smallDigitSet_nonempty (by decide : 2 ≤ 4))).image _

private theorem target_bounds {s : Slope} {y : ℝ} (hy : y ∈ target s) :
    0 ≤ y ∧ y ≤ 1 + slope s := by
  obtain ⟨⟨a, b⟩, ⟨ha, hb⟩, rfl⟩ := hy
  have hslope : 0 ≤ slope s := (by norm_num : (0 : ℝ) ≤ 1 / 6).trans (slope_bounds s).1
  have ha' := smallDigitSet_bounds ha
  have hb' := smallDigitSet_bounds hb
  exact ⟨add_nonneg ha'.1.le (mul_nonneg hslope hb'.1.le),
    add_le_add ha'.2 (mul_le_of_le_one_right hslope hb'.2)⟩

private theorem target_left {s t : Slope} {d : ℕ} (hd : 2 ≤ d ∧ d ≤ 3)
    (hscale : slope t * width d = slope s) {y : ℝ} (hy : y ∈ target t) :
    1 / (d : ℝ) + width d * y ∈ target s := by
  obtain ⟨⟨a, b⟩, ⟨ha, hb⟩, rfl⟩ := hy
  refine ⟨⟨1 / (d : ℝ) + width d * a, b⟩, ⟨prepend_smallDigitSet hd ha, hb⟩, ?_⟩
  dsimp
  rw [← hscale]
  ring

private theorem target_right {s t : Slope} {d : ℕ} (hd : 2 ≤ d ∧ d ≤ 4)
    (hscale : slope t = slope s * width d) {y : ℝ} (hy : y ∈ target t) :
    slope s / (d : ℝ) + y ∈ target s := by
  obtain ⟨⟨a, b⟩, ⟨ha, hb⟩, rfl⟩ := hy
  refine ⟨⟨a, 1 / (d : ℝ) + width d * b⟩, ⟨ha, prepend_smallDigitSet hd hb⟩, ?_⟩
  dsimp
  rw [hscale]
  ring

private theorem approximate (n : ℕ) (s : Slope) {x : ℝ} (hx : x ∈ domain s) :
    ∃ y ∈ target s, dist x y ≤ (1 + slope s) * (99 / 100 : ℝ) ^ n := by
  induction n generalizing s x with
  | zero =>
    obtain ⟨y, hy⟩ := target_nonempty s
    obtain ⟨hxl, hxu⟩ := domain_bounds hx
    obtain ⟨hyl, hyu⟩ := target_bounds hy
    refine ⟨y, hy, ?_⟩
    rw [pow_zero, mul_one, Real.dist_eq, abs_le]
    exact ⟨by linarith, by linarith⟩
  | succ n ih =>
    obtain ⟨t, u, d, hu, hm⟩ := certificate s hx
    obtain ⟨y, hy, hdist⟩ := ih t hu
    have hs := slope_bounds s
    rcases hm with ⟨hd, hd', hscale, rfl⟩ | ⟨hd, hd', hscale, rfl⟩
    · refine ⟨_, target_left ⟨hd, hd'⟩ hscale hy, ?_⟩
      have h := width_le_half hd
      have hw := (width_pos hd).le
      have hcontract : width d * (1 + slope t) ≤ (1 + slope s) * (99 / 100 : ℝ) := by
        linarith [hscale]
      have hdist' : dist (1 / (d : ℝ) + width d * u) (1 / (d : ℝ) + width d * y) =
          width d * dist u y := by
        rw [Real.dist_eq, Real.dist_eq, show
          1 / (d : ℝ) + width d * u - (1 / (d : ℝ) + width d * y) = width d * (u - y) by ring,
          abs_mul, abs_of_nonneg hw]
      rw [hdist', pow_succ]
      calc
        _ ≤ width d * ((1 + slope t) * (99 / 100 : ℝ) ^ n) :=
          mul_le_mul_of_nonneg_left hdist hw
        _ = (width d * (1 + slope t)) * (99 / 100 : ℝ) ^ n := by rw [mul_assoc]
        _ ≤ ((1 + slope s) * (99 / 100 : ℝ)) * (99 / 100 : ℝ) ^ n :=
          mul_le_mul_of_nonneg_right hcontract (by positivity)
        _ = _ := by ring
    · refine ⟨_, target_right ⟨hd, hd'⟩ hscale hy, ?_⟩
      have h := width_le_half hd
      have hcontract : 1 + slope t ≤ (1 + slope s) * (99 / 100 : ℝ) := by
        rw [hscale]
        nlinarith [mul_nonneg (show 0 ≤ slope s by linarith)
          (show 0 ≤ (1 / 2 : ℝ) - width d by linarith)]
      rw [dist_add_left, pow_succ]
      calc
        _ ≤ _ := hdist
        _ ≤ ((1 + slope s) * (99 / 100 : ℝ)) * (99 / 100 : ℝ) ^ n :=
          mul_le_mul_of_nonneg_right hcontract (by positivity)
        _ = _ := by ring

private theorem domain_subset_target (s : Slope) : domain s ⊆ target s := by
  intro x hx
  apply ((target_compact s).isClosed.mem_iff_infDist_zero (target_nonempty s)).2
  apply le_antisymm _ Metric.infDist_nonneg
  have hlim := (tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num : (0 : ℝ) ≤ 99 / 100)
    (by norm_num : (99 / 100 : ℝ) < 1)).const_mul (1 + slope s)
  rw [mul_zero] at hlim
  refine ge_of_tendsto' hlim (fun n => ?_)
  obtain ⟨y, hy, hd⟩ := approximate n s hx
  exact (Metric.infDist_le_dist_of_mem hy).trans hd

/-- Full interval certified in the written proof. -/
theorem interval_subset_sum :
    Icc (2879 / 3520 : ℝ) 2 ⊆ smallDigitSet 3 + smallDigitSet 4 := by
  intro x hx
  have hsource : x ∈ domain .one := by
    norm_num [domain, primary, low, high, coordinate, slope] at hx ⊢
    exact hx
  obtain ⟨⟨a, b⟩, ⟨ha, hb⟩, heq⟩ := domain_subset_target .one hsource
  exact ⟨a, ha, b, hb, by simpa [slope] using heq⟩

/-- Gravgaard–Lee, Conjecture 2.2, for every real residue modulo one. -/
theorem conjecture_2_2 (x : ℝ) :
    ∃ y ∈ smallDigitSet 3 + smallDigitSet 4, ∃ n : ℤ, x = y + n := by
  refine ⟨x - (⌊x⌋ : ℤ) + 1, interval_subset_sum ?_, ⌊x⌋ - 1, ?_⟩
  · exact ⟨by linarith [Int.floor_le x], by linarith [Int.lt_floor_add_one x]⟩
  · push_cast
    ring

end

end GravgaardLeeMixedLuroth
