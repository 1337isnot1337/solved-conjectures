import Conjectures.RevisedTanZhouScale
import Conjectures.RevisedTanZhouCoding

/-!
# Equal-width refinements on favorable scales

A greedy packing supplies equally many separated children in each parent.
The finite digit exception and the already used neighborhoods together
have measure smaller than the interior available in the parent.
-/

open Set Finset Filter MeasureTheory
open scoped Topology ENNReal NNReal

namespace RevisedTanZhou
noncomputable section

private theorem exists_packing {B : Set ℝ} {l L δ ρ : ℝ}
    (hL : 0 < L) (hδ : 0 < δ) (hρ : 0 < ρ) (hsmall : δ ≤ L / 128)
    (hr : ρ ≤ δ / 2) (hB : volume B ≤ ENNReal.ofReal (L / 8))
    {good : ℝ → Prop}
    (hnearness : ∀ x ∈ Set.Ioo (l + L / 4) (l + 3 * L / 4), x ∉ B →
      ∃ y, |y - x| ≤ δ ∧ good y)
    (n : ℕ) (hbudget : (n : ℝ) * δ ≤ L / 32) :
    ∃ s : Finset ℝ, s.card = n ∧
      (∀ y ∈ s, Set.Icc y (y + ρ) ⊆ Set.Icc l (l + L) ∧ good y) ∧
      ∀ x ∈ s, ∀ y ∈ s, x ≠ y → δ ≤ |x - y| := by
  classical
  induction n with
  | zero => exact ⟨∅, rfl, by simp, by simp⟩
  | succ n ih =>
    have hnp : (n : ℝ) * δ ≤ L / 32 := by push_cast at hbudget; linarith
    obtain ⟨s, hs, hs_good, hs_sep⟩ := ih hnp
    let used := ⋃ p : s, Metric.ball p.val (2 * δ)
    have hused : volume used ≤ ENNReal.ofReal (4 * ((n : ℝ) * δ)) := by
      apply (measure_iUnion_fintype_le _ _).trans
      have hb (p : s) : volume (Metric.ball p.val (2 * δ)) = ENNReal.ofReal (4 * δ) := by
        rw [Real.volume_ball]
        congr 1
        ring
      simp_rw [hb]
      rw [sum_const, Finset.card_univ, Fintype.card_coe, hs, nsmul_eq_mul, ← ENNReal.ofReal_natCast,
        ← ENNReal.ofReal_mul (Nat.cast_nonneg _)]
      apply ENNReal.ofReal_le_ofReal
      ring_nf
      exact le_rfl
    have hnot : ¬ Set.Ioo (l + L / 4) (l + 3 * L / 4) ⊆ B ∪ used := by
      intro hh
      have hm := (measure_mono hh).trans
        ((measure_union_le _ _).trans (add_le_add hB hused))
      rw [Real.volume_Ioo, ← ENNReal.ofReal_add (by positivity) (by positivity)] at hm
      have h' := (ENNReal.ofReal_le_ofReal_iff (by positivity :
        0 ≤ L / 8 + 4 * ((n : ℝ) * δ))).mp hm
      linarith
    obtain ⟨x, hx, hfree⟩ := not_subset.mp hnot
    have hxB : x ∉ B := fun hb => hfree (Or.inl hb)
    obtain ⟨y, hy, hygood⟩ := hnearness x hx hxB
    have hsep (p : ℝ) (hp : p ∈ s) : δ ≤ |y - p| := by
      have hdist : 2 * δ ≤ |x - p| := by
        by_contra! h
        apply hfree
        exact Or.inr (mem_iUnion.mpr ⟨⟨p, hp⟩, by simpa [Metric.mem_ball, Real.dist_eq] using h⟩)
      have ht : |x - p| ≤ |x - y| + |y - p| := by
        simpa only [Real.dist_eq] using dist_triangle x y p
      rw [abs_sub_comm x y] at ht
      linarith
    have hyN : y ∉ s := fun hh => by have hh' := hsep y hh; simp at hh'; linarith
    refine ⟨insert y s, by rw [card_insert_of_notMem hyN, hs], ?_, ?_⟩
    · intro z hz
      rcases mem_insert.mp hz with rfl | hz
      · refine ⟨Icc_subset_Icc ?_ ?_, hygood⟩
        · have hh := (abs_le.mp hy).1
          have hx' := hx.1
          linarith
        · have hh := (abs_le.mp hy).2
          have hx' := hx.2
          linarith
      · exact hs_good z hz
    · intro a ha b hb hab
      rcases mem_insert.mp ha with ha | ha
      · rcases mem_insert.mp hb with hb | hb
        · exact (hab (ha.trans hb.symm)).elim
        · rw [ha]
          exact hsep b hb
      · rcases mem_insert.mp hb with hb | hb
        · rw [hb, abs_sub_comm]
          exact hsep a ha
        · exact hs_sep a ha b hb hab

private theorem numbered_packing {B : Set ℝ} {l L δ ρ : ℝ}
    (hL : 0 < L) (hδ : 0 < δ) (hρ : 0 < ρ) (hsmall : δ ≤ L / 128)
    (hr : ρ ≤ δ / 2) (hB : volume B ≤ ENNReal.ofReal (L / 8))
    {good : ℝ → Prop}
    (hnearness : ∀ x ∈ Set.Ioo (l + L / 4) (l + 3 * L / 4), x ∉ B → ∃ y, |y - x| ≤ δ ∧ good y)
    (n : ℕ) (hbudget : (n : ℝ) * δ ≤ L / 32) :
    ∃ c : Fin n → ℝ,
      (∀ i, Set.Icc (c i) (c i + ρ) ⊆ Set.Icc l (l + L) ∧ good (c i)) ∧
      ∀ i j, i ≤ j → δ * ((j.val : ℝ) - i.val) ≤ c j - c i := by
  classical
  obtain ⟨s, hs, hinside, hsep⟩ := exists_packing hL hδ hρ hsmall hr hB hnearness n hbudget
  let c := s.orderEmbOfFin hs
  refine ⟨c, fun i => hinside _ (s.orderEmbOfFin_mem hs i), ?_⟩
  have hstep (i : Fin n) (hi : i.val + 1 < n) :
      δ ≤ c ⟨i.val + 1, hi⟩ - c i := by
    let j : Fin n := ⟨i.val + 1, hi⟩
    have hj : c i < c j := c.strictMono (by change i.val < i.val + 1; omega)
    have h := hsep (c j) (s.orderEmbOfFin_mem hs j) (c i) (s.orderEmbOfFin_mem hs i) hj.ne'
    rwa [abs_of_nonneg (sub_nonneg.mpr hj.le)] at h
  intro i j hij
  have h (a : ℕ) (hia : i.val ≤ a) (ha : a < n) :
      δ * ((a : ℝ) - i.val) ≤ c ⟨a, ha⟩ - c i := by
    induction a, hia using Nat.le_induction with
    | base => simp
    | succ a ha' ih =>
      have hprev := ih (by omega)
      have hnext := hstep ⟨a, by omega⟩ ha
      push_cast
      linarith
  exact h j.val hij j.prop

private structure Plan (K : ℕ) (ψ : ℕ → ℝ) (L u : ℝ) where
  stepSize : ℝ
  childLen : ℝ
  count : ℕ
  step_pos : 0 < stepSize
  child_pos : 0 < childLen
  two_le : 2 ≤ count
  step_small : stepSize ≤ L / 128
  narrow : childLen ≤ stepSize / 2
  budget : (count : ℝ) * stepSize ≤ L / 32
  enough : L ≤ 128 * stepSize * count
  weight : 1 / (count : ℝ) ≤ childLen ^ u
  bad : Set ℝ
  small_bad : volume bad ≤ ENNReal.ofReal (L / 8)
  near : ∀ x ∈ Set.Ioc (0 : ℝ) 1, x ∉ bad → ∃ y, |y - x| ≤ stepSize ∧
    ∃ n ≥ K, ∃ w : Word (n + 1), Set.Icc y (y + childLen) ⊆ target ψ w

private theorem exists_plan {ψ : ℕ → ℝ} (hmono : Antitone ψ) {u t L : ℝ}
    (hu : 0 < u) (ht : 0 ≤ t) (hs : u * (1 + t) < 1) (hL : 0 < L)
    (hfav : ∃ᶠ q : ℕ in atTop, (q : ℝ) ^ (-t) ≤ ψ q) (K : ℕ) :
    Nonempty (Plan K ψ L u) := by
  let v := (u * (1 + t) + 1) / 2
  have hv : 0 < v := by dsimp [v]; nlinarith
  have hv1 : v < 1 := by dsimp [v]; linarith
  have huv : u * (1 + t) < v := by dsimp [v]; linarith
  let C := (4 : ℝ) ^ u * (64 / L)
  have hall := (eventually_stopping_parameters hv hv1 (show 0 < L / 8 by positivity) K).and
    ((eventually_small_power hv (show 0 < L / 128 by positivity)).and
      ((eventually_power_dominates huv C).and (eventually_ge_atTop (1 : ℕ))))
  obtain ⟨q, hψ, ⟨N, M, hbad, hN, hK, hmax⟩, hδL, hpow, hq⟩ := (hfav.and_eventually hall).exists
  let δ := (q : ℝ) ^ (-v)
  let ρ := (q : ℝ) ^ (-(1 + t)) / 4
  let n := ⌊L / (32 * δ)⌋₊
  have hq1 : (1 : ℝ) ≤ q := by exact_mod_cast hq
  have hq0 : 0 < (q : ℝ) := zero_lt_one.trans_le hq1
  have hδ : 0 < δ := Real.rpow_pos_of_pos hq0 _
  have hρ : 0 < ρ := div_pos (Real.rpow_pos_of_pos hq0 _) (by norm_num)
  have hnlo : L / (32 * δ) < (n : ℝ) + 1 := Nat.lt_floor_add_one _
  have hnhi : (n : ℝ) ≤ L / (32 * δ) := Nat.floor_le (by positivity)
  have hscale : (4 : ℝ) ≤ L / (32 * δ) := (le_div_iff₀ (by positivity)).mpr (by
    change δ < L / 128 at hδL
    linarith)
  have hn₂ : 2 ≤ n := (by decide : 2 ≤ 4).trans (Nat.le_floor (n := 4) (by exact hscale))
  have hweightbound : L / (64 * δ) ≤ (n : ℝ) := by
    calc
      _ = L / (32 * δ) / 2 := by ring
      _ ≤ (n : ℝ) := by linarith
  have hnR : 0 < (n : ℝ) := by exact_mod_cast (show 0 < n by omega)
  have hρδ : ρ ≤ δ / 2 := by
    have h := Real.rpow_le_rpow_of_exponent_le hq1 (show -(1 + t) ≤ -v by linarith)
    dsimp [ρ, δ]
    linarith [hδ.le]
  have hweight : 1 / (n : ℝ) ≤ ρ ^ u := by
    have hm := mul_le_mul_of_nonneg_right hweightbound (Real.rpow_nonneg hρ.le u)
    apply (div_le_iff₀ hnR).mpr
    rw [mul_comm (ρ ^ u)]
    refine le_trans ?_ hm
    have hid : L / (64 * δ) * ρ ^ u =
        ((q : ℝ) ^ v) / (C * (q : ℝ) ^ (u * (1 + t))) := by
      have hc4 : (0 : ℝ) < 4 ^ u := Real.rpow_pos_of_pos (by norm_num) _
      dsimp [ρ, δ, C]
      rw [Real.div_rpow (Real.rpow_nonneg hq0.le _) (by norm_num), ← Real.rpow_mul hq0.le,
        Real.rpow_neg hq0.le, show -(1 + t) * u = -(u * (1 + t)) by ring,
        Real.rpow_neg hq0.le]
      field_simp
    rw [hid]
    exact (le_div_iff₀ (by dsimp [C]; positivity)).mpr (by simpa using hpow.le)
  refine ⟨⟨δ, ρ, n, hδ, hρ, hn₂, hδL.le, hρδ, ?_, ?_, hweight,
    badPrefix N M, hbad, ?_⟩⟩
  · have hh := (le_div_iff₀ (by positivity : 0 < 32 * δ)).mp hnhi
    linarith
  · have hh := (div_le_iff₀ (by positivity : 0 < 64 * δ)).mp hweightbound
    nlinarith [mul_nonneg hnR.le hδ.le]
  · intro x hx hgood
    have hR : 1 ≤ (q : ℝ) ^ v := Real.one_le_rpow hq1 hv.le
    obtain ⟨y, hy, hn, hw, w, htarget⟩ :=
      target_near_good hmono hx hgood hR hN hK hmax ht hq hψ
    rw [one_div, ← Real.rpow_neg hq0.le] at hy
    exact ⟨y, hy, hn, hw, w, htarget⟩

private structure ConstructionLevel (ψ : ℕ → ℝ) (u : ℝ) (n : ℕ) where
  level : Level
  inside : ∀ i < level.count, level.box i ⊆ Set.Icc 0 1
  weight : 1 / (level.count : ℝ) ≤ level.len ^ u
  valid : ∀ i < level.count, ∀ K, K < n →
    ∃ m ≥ K, ∃ w : Word (m + 1), level.box i ⊆ target ψ w

private def initial (ψ : ℕ → ℝ) (u : ℝ) : ConstructionLevel ψ u 0 where
  level := ⟨1, by norm_num, 1, by norm_num, fun _ => 0⟩
  inside := by simp [Level.box]
  weight := by norm_num
  valid := fun _ _ K hK => (Nat.not_lt_zero K hK).elim

private theorem extend {ψ : ℕ → ℝ} {u t : ℝ}
    (hmono : Antitone ψ) (hu : 0 < u) (ht : 0 ≤ t) (hs : u * (1 + t) < 1)
    (hfav : ∃ᶠ q : ℕ in atTop, (q : ℝ) ^ (-t) ≤ ψ q) {n : ℕ}
    (p : ConstructionLevel ψ u n) :
    ∃ q : ConstructionLevel ψ u (n + 1), Nonempty (Refinement p.level q.level) := by
  classical
  obtain ⟨c⟩ := exists_plan hmono hu ht hs p.level.len_pos hfav n
  let a := p.level
  let good (y : ℝ) := ∃ m ≥ n, ∃ w : Word (m + 1), Set.Icc y (y + c.childLen) ⊆ target ψ w
  have hp (i : Fin a.count) :
      ∃ pts : Fin c.count → ℝ,
        (∀ j, Set.Icc (pts j) (pts j + c.childLen) ⊆ a.box i ∧ good (pts j)) ∧
        ∀ j k, j ≤ k → c.stepSize * ((k.val : ℝ) - j.val) ≤ pts k - pts j := by
    apply numbered_packing a.len_pos c.step_pos c.child_pos c.step_small c.narrow c.small_bad
    · intro x hx hgood
      have h₁ := hx.1
      have h₂ := hx.2
      have hpos := a.len_pos
      have hbox : x ∈ a.box i := ⟨by linarith, by linarith⟩
      have hunit := p.inside i i.prop hbox
      have hzero : 0 ≤ a.start i := (p.inside i i.prop
        ⟨le_rfl, le_add_of_nonneg_right a.len_pos.le⟩).1
      exact c.near x ⟨by linarith, hunit.2⟩ hgood
    · exact c.budget
  choose pts hpts hsep using hp
  have hb : 0 < c.count := by have := c.two_le; omega
  let q : Level := ⟨a.count * c.count, Nat.mul_pos a.count_pos hb, c.childLen, c.child_pos,
    fun i => if h : i < a.count * c.count then
      pts ⟨i / c.count, (Nat.div_lt_iff_lt_mul hb).mpr h⟩ ⟨i % c.count, Nat.mod_lt _ hb⟩ else 0⟩
  have hpos (i : ℕ) (hi : i < q.count) :
      q.start i = pts ⟨i / c.count, (Nat.div_lt_iff_lt_mul hb).mpr hi⟩
        ⟨i % c.count, Nat.mod_lt _ hb⟩ := by simp only [q, dite_eq_left hi]
  have hboxes (i : ℕ) (hi : i < q.count) :
      q.box i ⊆ a.box (i / c.count) ∧ good (q.start i) := by
    unfold Level.box at ⊢
    rw [hpos i hi]
    exact hpts _ _
  have hsmall : q.len ≤ a.len / 2 := by
    change c.childLen ≤ p.level.len / 2
    have h := c.narrow
    have h' := c.step_small
    have hp' := p.level.len_pos
    linarith
  have hqweight : 1 / (q.count : ℝ) ≤ q.len ^ u := by
    have hc : (c.count : ℝ) ≤ q.count := by
      exact_mod_cast Nat.le_mul_of_pos_left c.count a.count_pos
    exact (one_div_le_one_div_of_le (by exact_mod_cast hb) hc).trans c.weight
  refine ⟨⟨q, fun i hi =>
    (hboxes i hi).1.trans (p.inside _ ((Nat.div_lt_iff_lt_mul hb).mpr hi)), hqweight, ?_⟩, ?_⟩
  · intro i hi K hK
    obtain ⟨m, hm, w, hw⟩ := (hboxes i hi).2
    exact ⟨m, (show K ≤ n by omega).trans hm, w, hw⟩
  · refine ⟨⟨c.count, c.two_le, rfl, c.stepSize, c.step_pos, hsmall,
      c.narrow, c.enough, fun i hi => (hboxes i hi).1, ?_⟩⟩
    intro i j hj hpar hij
    have hi := hij.trans hj
    rw [hpos i hi, hpos j hj]
    have heq : (⟨i / c.count, (Nat.div_lt_iff_lt_mul hb).mpr hi⟩ : Fin a.count) =
        ⟨j / c.count, (Nat.div_lt_iff_lt_mul hb).mpr hj⟩ := Fin.ext hpar
    rw [heq]
    have hmod : i % c.count ≤ j % c.count := by
      have hi' := Nat.mod_add_div i c.count
      have hj' := Nat.mod_add_div j c.count
      rw [hpar] at hi'
      omega
    have hdist : ((j % c.count : ℕ) : ℝ) - ((i % c.count : ℕ) : ℝ) = (j : ℝ) - (i : ℝ) := by
      have hi' := congrArg (fun n : ℕ => (n : ℝ)) (Nat.mod_add_div i c.count)
      have hj' := congrArg (fun n : ℕ => (n : ℝ)) (Nat.mod_add_div j c.count)
      rw [hpar] at hi'
      push_cast at hi' hj'
      linarith
    rw [← hdist]
    exact hsep ⟨j / c.count, (Nat.div_lt_iff_lt_mul hb).mpr hj⟩
      ⟨i % c.count, Nat.mod_lt _ hb⟩ ⟨j % c.count, Nat.mod_lt _ hb⟩ (show i % c.count ≤ j % c.count from hmod)

/-- Favorable power-law scales give the matching lower bound via a
Hölder decoding of nested target intervals. -/
theorem lower_of_frequently_power {ψ : ℕ → ℝ} (hmono : Antitone ψ) {u : ℝ≥0} {t : ℝ}
    (hu : 0 < u) (ht : 0 ≤ t) (hs : (u : ℝ) * (1 + t) < 1)
    (hfav : ∃ᶠ q : ℕ in atTop, (q : ℝ) ^ (-t) ≤ ψ q) :
    (u : ℝ≥0∞) ≤ dimH (approxSet ψ) := by
  have huR : 0 < (u : ℝ) := by exact_mod_cast hu
  have hu1 : u ≤ 1 := by exact_mod_cast (show (u : ℝ) ≤ 1 by nlinarith)
  let states := Nat.rec (motive := fun n => ConstructionLevel ψ (u : ℝ) n)
    (initial ψ u) (fun _ p => (extend hmono huR ht hs hfav p).choose)
  let L (n : ℕ) := (states n).level
  let next (n : ℕ) : Refinement (L n) (L (n + 1)) :=
    Classical.choice ((extend hmono huR ht hs hfav (states n)).choose_spec)
  apply dim_ge_of_refinements L next (approxSet ψ) hu hu1 rfl (fun n => (states n).weight)
  intro z hz K
  obtain ⟨i, hi, hz'⟩ := hz (K + 1)
  obtain ⟨n, hn, w, hw⟩ := (states (K + 1)).valid i hi K (by omega)
  exact ⟨n, hn, w, hw hz'⟩

end
end RevisedTanZhou
