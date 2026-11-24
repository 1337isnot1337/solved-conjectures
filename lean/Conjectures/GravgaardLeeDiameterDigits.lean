import Conjectures.GravgaardLeeUpperLowerBasic

/-!
# Infinite and terminating large-digit Lüroth expansions
-/

open Filter Finset Set
open scoped Topology Pointwise

namespace GravgaardLeeDiameter

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth GravgaardLeeUpperLower

noncomputable section

abbrev closedDigits (k : ℕ) : Set ℝ := closure (largeDigitSet k)

theorem closedDigits_bounds {k : ℕ} (hk : 2 ≤ k) :
    closedDigits k ⊆ Icc 0 (endpoint k) :=
  closure_minimal (fun _ hx => ⟨(largeDigitSet_endpoint_bounds hk hx).1.le,
    (largeDigitSet_endpoint_bounds hk hx).2⟩) isClosed_Icc

theorem closedDigits_compact {k : ℕ} (hk : 2 ≤ k) : IsCompact (closedDigits k) :=
  isCompact_Icc.of_isClosed_subset isClosed_closure (closedDigits_bounds hk)

theorem prepend_large {k d : ℕ} (hk : 2 ≤ k) (hd : k ≤ d) {y : ℝ}
    (hy : y ∈ largeDigitSet k) : branch d y ∈ largeDigitSet k := by
  obtain ⟨a, ha, rfl⟩ := (mem_largeDigitSet hk).mp hy
  let digits : ℕ → ℕ := Nat.rec d (fun i _ => a i)
  have hdigit (i : ℕ) : k ≤ digits i := by
    cases i with
    | zero => exact hd
    | succ i => exact ha i
  exact (mem_largeDigitSet hk).mpr ⟨digits, hdigit, value_head digits (fun i => hk.trans (hdigit i))⟩

theorem prepend_closed {k d : ℕ} (hk : 2 ≤ k) (hd : k ≤ d) {y : ℝ}
    (hy : y ∈ closedDigits k) : branch d y ∈ closedDigits k := by
  have hcont : Continuous (branch d) := by unfold branch; fun_prop
  exact closure_mono (show branch d '' largeDigitSet k ⊆ largeDigitSet k from
    fun _ hz => by
      obtain ⟨z, hz, rfl⟩ := hz
      exact prepend_large hk hd hz)
    (image_closure_subset_closure_image hcont ⟨y, hy, rfl⟩)

theorem zero_mem_closed {k : ℕ} (hk : 2 ≤ k) : 0 ∈ closedDigits k := by
  apply Metric.mem_closure_iff.mpr
  intro ε hε
  obtain ⟨n, hn⟩ := exists_nat_gt (max (k : ℝ) (1 / ε + 1))
  have hk' : k ≤ n := by exact_mod_cast (le_max_left _ _).trans hn.le
  have hn' : (1 / ε + 1 : ℝ) < n := (le_max_right _ _).trans_lt hn
  let y := branch n (endpoint k)
  have hy := prepend_large hk hk' (endpoint_mem_large hk)
  refine ⟨y, hy, ?_⟩
  rw [dist_zero_left, Real.norm_eq_abs, abs_of_pos (largeDigitSet_endpoint_bounds hk hy).1]
  have htop : y ≤ 1 / ((n : ℝ) - 1) := by
    have h := branch_mono (hk.trans hk') (endpoint_le_one hk)
    rwa [show branch n 1 = 1 / ((n : ℝ) - 1) by simpa [branch] using digitTop (hk.trans hk')] at h
  have hn2 : (2 : ℝ) ≤ n := by exact_mod_cast hk.trans hk'
  exact htop.trans_lt ((div_lt_iff₀ (by linarith)).mpr (by
    have := (div_lt_iff₀ hε).mp (show 1 / ε < (n : ℝ) - 1 by linarith)
    linarith))

theorem largeDigitSet_head {k : ℕ} (hk : 2 ≤ k) {y : ℝ} (hy : y ∈ largeDigitSet k) :
    ∃ d ≥ k, ∃ z ∈ largeDigitSet k, y = branch d z := by
  obtain ⟨a, ha, rfl⟩ := (mem_largeDigitSet hk).mp hy
  exact ⟨a 0, ha 0, value (fun i => a (i + 1)),
    (mem_largeDigitSet hk).mpr ⟨_, fun i => ha (i + 1), rfl⟩,
    value_head a (fun i => hk.trans (ha i))⟩

theorem branch_le_digitTop {k d : ℕ} (hk : 2 ≤ k) (hd : 2 ≤ d) :
    branch d (endpoint k) ≤ 1 / ((d : ℝ) - 1) := by
  have h := branch_mono hd (endpoint_le_one hk)
  rwa [show branch d 1 = 1 / ((d : ℝ) - 1) by simpa [branch] using digitTop hd] at h

/-- A positive limit of allowed expansions still has a finite first digit. -/
theorem closedDigits_head {k : ℕ} (hk : 2 ≤ k) {y : ℝ} (hy : y ∈ closedDigits k)
    (hpos : 0 < y) : ∃ d ≥ k, ∃ z ∈ closedDigits k, y = branch d z := by
  obtain ⟨N, hN⟩ := exists_nat_gt (1 / (y / 2) + 1)
  let C := ⋃ d ∈ ((range (N + 1)).filter (fun d => k ≤ d)), branch d '' closedDigits k
  have hclosed : IsClosed C := by
    apply isClosed_biUnion_finset
    intro d _
    exact ((closedDigits_compact hk).image (by unfold branch; fun_prop)).isClosed
  have hm : y ∈ closure C := by
    apply Metric.mem_closure_iff.mpr
    intro ε hε
    obtain ⟨z, hz, hd⟩ := Metric.mem_closure_iff.mp hy (min ε (y / 2))
      (lt_min hε (by positivity))
    have hyz : y / 2 < z := by
      have h := hd.trans_le (min_le_right _ _)
      rw [Real.dist_eq, abs_lt] at h
      linarith
    obtain ⟨d, hdk, t, ht, rfl⟩ := largeDigitSet_head hk hz
    have ht' := (largeDigitSet_endpoint_bounds hk ht).2
    have htop := (branch_mono (hk.trans hdk) ht').trans (branch_le_digitTop hk (hk.trans hdk))
    have hdR : (2 : ℝ) ≤ d := by exact_mod_cast hk.trans hdk
    have hdN : (d : ℝ) < N := by
      have hh := (lt_div_iff₀ (show 0 < (d : ℝ) - 1 by linarith)).mp (hyz.trans_le htop)
      have hd' : (d : ℝ) - 1 < 1 / (y / 2) :=
        (lt_div_iff₀ (by positivity)).mpr (by simpa [mul_comm] using hh)
      linarith
    have hdN' : d < N := by exact_mod_cast hdN
    exact ⟨_, mem_iUnion₂.mpr ⟨d, mem_filter.mpr ⟨mem_range.mpr (by omega), hdk⟩, t, subset_closure ht, rfl⟩,
      hd.trans_le (min_le_left _ _)⟩
  rw [hclosed.closure_eq] at hm
  obtain ⟨d, hd, z, hz, rfl⟩ := mem_iUnion₂.mp hm
  exact ⟨d, (mem_filter.mp hd).2, z, hz, rfl⟩

/-- A bounded infinite recursion through the affine digit maps gives the
series value of its digit string. -/
theorem value_of_tail_recursion (a : ℕ → ℕ) (t : ℕ → ℝ) (ha : ∀ n, 2 ≤ a n)
    (ht : ∀ n, t n ∈ Icc (0 : ℝ) 1) (hrec : ∀ n, t n = branch (a n) (t (n + 1))) :
    value a = t 0 := by
  have hp (n : ℕ) : truncation a n + (∏ j ∈ range n, width (a j)) * t n = t 0 := by
    induction n with
    | zero => simp [truncation]
    | succ n ih =>
      rw [prefix_succ, prod_range_succ, ← ih]
      rw [hrec n, branch]
      ring
  have hsmall : Tendsto (fun n => (∏ j ∈ range n, width (a j)) * t n) atTop (𝓝 0) := by
    apply tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds
      (tendsto_pow_atTop_nhds_zero_of_lt_one (by norm_num : (0 : ℝ) ≤ 1 / 2) (by norm_num))
    · exact fun n => mul_nonneg (prod_nonneg fun j _ => (width_pos (ha j)).le) (ht n).1
    · exact fun n => (mul_le_of_le_one_right
        (prod_nonneg fun j _ => (width_pos (ha j)).le) (ht n).2).trans (scale_le a ha n)
  have hlim := (tendsto_prefix a ha).add hsmall
  simp only [add_zero] at hlim
  rw [show (fun n => truncation a n + (∏ j ∈ range n, width (a j)) * t n) =
      fun _ => t 0 from funext hp] at hlim
  exact tendsto_nhds_unique hlim tendsto_const_nhds

theorem large_of_tail_choices {k : ℕ} (hk : 2 ≤ k) {G : Set ℝ} (hG : G ⊆ Icc 0 1)
    (hnext : ∀ y ∈ G, ∃ d ≥ k, ∃ z ∈ G, y = branch d z) : G ⊆ largeDigitSet k := by
  intro y hy
  choose d hd z hz heq using fun y : G => hnext y y.prop
  let next (x : G) : G := ⟨z x, hz x⟩
  let states (n : ℕ) : G := next^[n] ⟨y, hy⟩
  let a (n : ℕ) := d (states n)
  let t (n : ℕ) : ℝ := states n
  have ht (n : ℕ) : t n = branch (a n) (t (n + 1)) := by
    simpa only [t, a, states, Function.iterate_succ_apply'] using heq (states n)
  exact (mem_largeDigitSet hk).mpr
    ⟨a, fun n => hd (states n), value_of_tail_recursion a t (fun n => hk.trans (hd (states n)))
      (fun n => hG (states n).prop) ht⟩

/-- Every positive point in the unit interval has an infinite expansion
when all digits at least two are permitted. -/
theorem largeDigitSet_two : largeDigitSet 2 = Ioc (0 : ℝ) 1 := by
  apply Set.Subset.antisymm
  · intro y hy
    have h := largeDigitSet_endpoint_bounds (by decide : 2 ≤ 2) hy
    norm_num [endpoint] at h ⊢
    exact h
  · apply large_of_tail_choices (by decide : 2 ≤ 2)
      (fun _ hy => ⟨hy.1.le, hy.2⟩)
    intro y hy
    let d := ⌊1 / y⌋₊ + 1
    have hratio : 1 ≤ 1 / y := (le_div_iff₀ hy.1).mpr (by simpa using hy.2)
    have hd : 2 ≤ d := by
      have hf : 1 ≤ ⌊1 / y⌋₊ := Nat.le_floor (by simpa using hratio)
      dsimp [d]
      omega
    have hdR : (2 : ℝ) ≤ d := by exact_mod_cast hd
    have hlo : 1 / (d : ℝ) < y := by
      apply (div_lt_iff₀ (by linarith)).mpr
      have h := (div_lt_iff₀ hy.1).mp (Nat.lt_floor_add_one (1 / y))
      simpa [d, mul_comm] using h
    have hhi : y ≤ 1 / ((d : ℝ) - 1) := by
      apply (le_div_iff₀ (by linarith)).mpr
      have h := (le_div_iff₀ hy.1).mp (Nat.floor_le (show 0 ≤ 1 / y by positivity))
      simpa [d, mul_comm] using h
    let z := (y - 1 / (d : ℝ)) / width d
    have hwidth := width_pos hd
    refine ⟨d, hd, z, ⟨div_pos (sub_pos.mpr hlo) hwidth, ?_⟩, ?_⟩
    · apply (div_le_iff₀ hwidth).mpr
      rw [one_mul]
      rw [← digitTop hd] at hhi
      linarith
    · unfold branch z
      field_simp [hwidth.ne']
      ring

end

end GravgaardLeeDiameter
