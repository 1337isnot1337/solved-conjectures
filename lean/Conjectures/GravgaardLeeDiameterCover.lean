import Conjectures.GravgaardLeeDiameterDigits

/-!
# Covering the closed sum by simultaneous cylinder refinement

Splitting a coordinate of largest scale-weighted digit width preserves the
target interval. The threshold on the sum of the original diameters supplies
the overlap, regardless of the separation of the digit bounds.
-/

open Finset Set
open scoped Pointwise

namespace GravgaardLeeDiameter

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth GravgaardLeeUpperLower

noncomputable section

private structure Node (k : ℕ) where
  lo : ℝ
  scale : ℝ
  digit : ℕ
  scale_pos : 0 < scale
  scale_le : scale ≤ 1
  digit_ge : k ≤ digit
  closed : ∀ y ∈ closedDigits k, lo + scale * y ∈ closedDigits k

namespace Node

variable {k : ℕ}

private def len (s : Node k) : ℝ := s.scale * branch s.digit (endpoint k)
private def hi (s : Node k) : ℝ := s.lo + s.len
private def rate (s : Node k) : ℝ := s.scale * width s.digit

private def root (k : ℕ) : Node k := ⟨0, 1, k, by norm_num, le_rfl, le_rfl, by simp⟩

private def left (s : Node k) : Node k :=
  ⟨s.lo, s.scale, s.digit + 1, s.scale_pos, s.scale_le, s.digit_ge.trans (Nat.le_succ _), s.closed⟩

private def right (s : Node k) (hk : 2 ≤ k) : Node k where
  lo := s.lo + s.scale / s.digit
  scale := s.rate
  digit := k
  scale_pos := mul_pos s.scale_pos (width_pos (hk.trans s.digit_ge))
  scale_le := (mul_le_of_le_one_right s.scale_pos.le
    ((width_le_half (hk.trans s.digit_ge)).trans (by norm_num))).trans s.scale_le
  digit_ge := le_rfl
  closed := by
    intro y hy
    convert s.closed (branch s.digit y) (prepend_closed hk s.digit_ge hy) using 1
    simp only [branch, rate]
    ring

private theorem len_nonneg (s : Node k) (hk : 2 ≤ k) : 0 ≤ s.len := by
  have hd := hk.trans s.digit_ge
  have hwidth := width_pos hd
  have ha := endpoint_pos hk
  have hdc : (2 : ℝ) ≤ s.digit := by exact_mod_cast hd
  unfold len branch
  exact mul_nonneg s.scale_pos.le (add_nonneg (by positivity) (mul_nonneg hwidth.le ha.le))

private theorem hi_mem (s : Node k) (hk : 2 ≤ k) : s.hi ∈ closedDigits k :=
  s.closed _ (prepend_closed hk s.digit_ge (subset_closure (endpoint_mem_large hk)))

private theorem left_rate (s : Node k) (hk : 2 ≤ k) : s.left.rate ≤ s.rate :=
  mul_le_mul_of_nonneg_left (width_antitone (hk.trans s.digit_ge) (Nat.le_succ s.digit)) s.scale_pos.le

private theorem right_rate (s : Node k) (hk : 2 ≤ k) : (s.right hk).rate ≤ s.rate :=
  mul_le_of_le_one_right (mul_pos s.scale_pos (width_pos (hk.trans s.digit_ge))).le
    ((width_le_half hk).trans (by norm_num))

private theorem right_hi (s : Node k) (hk : 2 ≤ k) : (s.right hk).hi = s.hi := by
  simp only [hi, len, right, rate]
  rw [endpoint_fixed hk]
  unfold branch
  ring

private theorem right_len (s : Node k) (hk : 2 ≤ k) :
    (s.right hk).len = endpoint k * s.rate := by
  simp only [len, right, endpoint_fixed hk]
  ring

private theorem left_len (s : Node k) (hk : 2 ≤ k) :
    endpoint k * s.rate ≤ s.left.len := by
  have hd := hk.trans s.digit_ge
  have hdR : (2 : ℝ) ≤ s.digit := by exact_mod_cast hd
  have hwidth : width s.digit ≤ 1 / (s.digit : ℝ) := by
    unfold width
    apply one_div_le_one_div_of_le (by linarith)
    nlinarith [mul_nonneg (show 0 ≤ (s.digit : ℝ) by positivity)
      (show 0 ≤ (s.digit : ℝ) - 2 by linarith)]
  have htop : branch (s.digit + 1) 1 = 1 / (s.digit : ℝ) := by
    simpa [branch] using (digitTop (d := s.digit + 1) (by omega))
  have hlow : endpoint k * branch (s.digit + 1) 1 ≤ branch (s.digit + 1) (endpoint k) := by
    have h := endpoint_le_one hk
    have hd' : 0 < (s.digit : ℝ) + 1 := by linarith
    simp only [branch, mul_one, Nat.cast_add, Nat.cast_one]
    nlinarith [mul_nonneg (sub_nonneg.mpr h) (show 0 ≤ 1 / ((s.digit : ℝ) + 1) by positivity)]
  have h := mul_le_mul_of_nonneg_left
    ((mul_le_mul_of_nonneg_left hwidth (endpoint_pos hk).le).trans (htop ▸ hlow)) s.scale_pos.le
  simpa only [len, left, rate, mul_left_comm] using h

private theorem gap_eq (s : Node k) (hk : 2 ≤ k) :
    (s.right hk).lo - s.left.hi = s.scale * ((1 - endpoint k) * width (s.digit + 1)) := by
  have h := digitTop (d := s.digit + 1) (by have := hk.trans s.digit_ge; omega)
  simp only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] at h
  simp only [right, left, hi, len, branch, Nat.cast_add, Nat.cast_one]
  rw [div_eq_mul_one_div]
  linear_combination -s.scale * h

private theorem gap_nonneg (s : Node k) (hk : 2 ≤ k) :
    0 ≤ (s.right hk).lo - s.left.hi := by
  rw [gap_eq s hk]
  exact mul_nonneg s.scale_pos.le (mul_nonneg (sub_nonneg.mpr (endpoint_le_one hk))
    (width_pos (by have := hk.trans s.digit_ge; omega)).le)

private theorem gap_le (s : Node k) (hk : 2 ≤ k) :
    (s.right hk).lo - s.left.hi ≤ (1 - endpoint k) * s.rate := by
  rw [gap_eq s hk, rate]
  calc
    _ ≤ s.scale * ((1 - endpoint k) * width s.digit) :=
      mul_le_mul_of_nonneg_left
        (mul_le_mul_of_nonneg_left (width_antitone (hk.trans s.digit_ge) (Nat.le_succ s.digit))
          (sub_nonneg.mpr (endpoint_le_one hk))) s.scale_pos.le
    _ = _ := by ring

private theorem len_add (s : Node k) (hk : 2 ≤ k) :
    s.left.len + (s.right hk).len ≤ s.len := by
  have h := gap_nonneg s hk
  have h' := right_hi s hk
  change s.lo + s.scale / (s.digit : ℝ) - (s.lo + s.left.len) ≥ 0 at h
  change (s.lo + s.scale / (s.digit : ℝ)) + (s.right hk).len = s.lo + s.len at h'
  linarith

private theorem len_sq_le (s : Node k) (hk : 2 ≤ k) : s.len ^ 2 ≤ 2 * s.rate := by
  have hd := hk.trans s.digit_ge
  have hdR : (2 : ℝ) ≤ s.digit := by exact_mod_cast hd
  have hd₀ : 0 < (s.digit : ℝ) - 1 := by linarith
  have h := mul_le_mul_of_nonneg_left (branch_le_digitTop hk hd) s.scale_pos.le
  calc
    s.len ^ 2 ≤ (s.scale * (1 / ((s.digit : ℝ) - 1))) ^ 2 :=
      pow_le_pow_left₀ (s.len_nonneg hk) h _
    _ ≤ 2 * s.rate := by
      unfold rate width
      have hscale : s.scale * s.scale ≤ s.scale := mul_le_of_le_one_right s.scale_pos.le s.scale_le
      have hmul : s.scale * (s.scale * (s.digit : ℝ)) ≤
          s.scale * (2 * ((s.digit : ℝ) - 1)) := by
        apply mul_le_mul_of_nonneg_left _ s.scale_pos.le
        have := mul_le_of_le_one_left (show (0 : ℝ) ≤ s.digit by positivity) s.scale_le
        linarith
      field_simp [show (0 : ℝ) < s.digit by linarith, hd₀]
      nlinarith [mul_le_mul_of_nonneg_right hmul hd₀.le]

end Node

private def total {ι : Type*} [Fintype ι] {k : ι → ℕ}
    (f : ∀ i, Node (k i) → ℝ) (s : ∀ i, Node (k i)) : ℝ :=
  ∑ i, f i (s i)

private theorem total_update {ι : Type*} [Fintype ι] [DecidableEq ι] {k : ι → ℕ}
    (f : ∀ i, Node (k i) → ℝ) (s : ∀ i, Node (k i)) (j : ι) (u : Node (k j)) :
    total f (Function.update s j u) = f j u + ∑ i ∈ univ.erase j, f i (s i) := by
  unfold total
  rw [← sum_erase_add _ _ (mem_univ j), Function.update_self, add_comm]
  congr 1
  exact sum_congr rfl fun i hi => by rw [Function.update_of_ne (mem_erase.mp hi).1]

private def Admissible {ι : Type*} [Fintype ι] (k : ι → ℕ) (x : ℝ)
    (s : ∀ i, Node (k i)) : Prop :=
  x ∈ Icc (total (fun _ t => t.lo) s) (total (fun _ t => t.hi) s) ∧
    ∀ i j, endpoint (k i) * (s j).rate ≤ (s i).len

private theorem root_admissible {ι : Type*} [Fintype ι] {k : ι → ℕ}
    (hk : ∀ i, 2 ≤ k i) {x : ℝ} (hx : x ∈ Icc 0 (∑ i, endpoint (k i))) :
    Admissible k x (fun i => Node.root (k i)) := by
  refine ⟨by simpa [total, Node.root, Node.hi, Node.len, endpoint_fixed (hk _)] using hx, ?_⟩
  intro i j
  have hw := (width_le_half (hk j)).trans (by norm_num : (1 : ℝ) / 2 ≤ 1)
  simpa [Node.root, Node.rate, Node.len, endpoint_fixed (hk i)] using
    mul_le_of_le_one_right (endpoint_pos (hk i)).le hw

private theorem refine_node {ι : Type*} [Fintype ι] {k : ι → ℕ} (hk : ∀ i, 2 ≤ k i)
    (hdiam : 1 ≤ ∑ i, endpoint (k i)) {x : ℝ} {s : ∀ i, Node (k i)}
    (hs : Admissible k x s) (j : ι) (hmax : ∀ i, (s i).rate ≤ (s j).rate) :
    ∃ t : ∀ i, Node (k i), Admissible k x t ∧
      total (fun _ t => t.len) t + endpoint (k j) * (s j).rate ≤ total (fun _ t => t.len) s := by
  classical
  let L := (s j).left
  let R := (s j).right (hk j)
  let lo := ∑ i ∈ univ.erase j, (s i).lo
  let hi := ∑ i ∈ univ.erase j, (s i).hi
  have hj := Finset.mem_univ j
  have hslo : (s j).lo + lo ≤ x := by
    have he := sum_erase_add univ (fun i => (s i).lo) hj
    have hh := hs.1.1
    unfold total at hh
    dsimp [lo]
    linarith
  have hshi : x ≤ (s j).hi + hi := by
    have he := sum_erase_add univ (fun i => (s i).hi) hj
    have hh := hs.1.2
    unfold total at hh
    dsimp [hi]
    linarith
  have hgap : R.lo + lo ≤ L.hi + hi := by
    have hother := Finset.sum_le_sum (s := univ.erase j) (fun i _ => hs.2 i j)
    rw [← Finset.sum_mul] at hother
    have hweights := sum_erase_add univ (fun i => endpoint (k i)) hj
    have hw : 1 - endpoint (k j) ≤ ∑ i ∈ univ.erase j, endpoint (k i) := by linarith
    have hscale : 0 ≤ (s j).rate := mul_nonneg (s j).scale_pos.le
      (width_pos ((hk j).trans (s j).digit_ge)).le
    have hb := (mul_le_mul_of_nonneg_right hw hscale).trans hother
    have hsums : (∑ i ∈ univ.erase j, (s i).len) = hi - lo := by
      simp only [hi, lo, Node.hi, Finset.sum_add_distrib]
      ring
    rw [hsums] at hb
    have hg := (s j).gap_le (hk j)
    change R.lo - L.hi ≤ _ at hg
    linarith
  have hlower : endpoint (k j) * (s j).rate ≤ L.len := (s j).left_len (hk j)
  have hleft : L.rate ≤ (s j).rate := (s j).left_rate (hk j)
  have hright : R.rate ≤ (s j).rate := (s j).right_rate (hk j)
  have hlen : L.len + R.len ≤ (s j).len := (s j).len_add (hk j)
  have hRlen : R.len = endpoint (k j) * (s j).rate := (s j).right_len (hk j)
  have update_ok (u : Node (k j)) (hu : x ∈ Icc (u.lo + lo) (u.hi + hi))
      (hur : u.rate ≤ (s j).rate) (hul : endpoint (k j) * (s j).rate ≤ u.len)
      (hdec : u.len + endpoint (k j) * (s j).rate ≤ (s j).len) :
      ∃ t : ∀ i, Node (k i), Admissible k x t ∧
        total (fun _ t => t.len) t + endpoint (k j) * (s j).rate ≤ total (fun _ t => t.len) s := by
    let t := Function.update s j u
    refine ⟨t, ⟨?_, ?_⟩, ?_⟩
    · simpa only [t, total_update] using hu
    · have hnew (i : ι) : (t i).rate ≤ (s i).rate := by
        by_cases hi : i = j
        · subst i
          simpa only [t, Function.update_self] using hur
        · simp only [t, Function.update_of_ne hi, le_refl]
      intro i q
      by_cases hi : i = j
      · subst i
        rw [show t j = u from Function.update_self _ _ _]
        exact (mul_le_mul_of_nonneg_left ((hnew q).trans (hmax q)) (endpoint_pos (hk j)).le).trans hul
      · rw [show t i = s i from Function.update_of_ne hi _ _]
        exact (mul_le_mul_of_nonneg_left (hnew q) (endpoint_pos (hk i)).le).trans (hs.2 i q)
    · rw [total_update]
      have he := sum_erase_add univ (fun i => (s i).len) hj
      unfold total
      linarith
  by_cases hxL : x ≤ L.hi + hi
  · exact update_ok L ⟨hslo, hxL⟩ hleft hlower (by linarith)
  · have hh : R.hi = (s j).hi := (s j).right_hi (hk j)
    exact update_ok R ⟨by linarith, by rwa [hh]⟩ hright hRlen.ge (by linarith)

private theorem exists_small_rates {ι : Type*} [Fintype ι] [Nonempty ι] {k : ι → ℕ}
    (hk : ∀ i, 2 ≤ k i) (hdiam : 1 ≤ ∑ i, endpoint (k i)) {x : ℝ}
    (hx : x ∈ Icc 0 (∑ i, endpoint (k i))) {ε : ℝ} (hε : 0 < ε) :
    ∃ s : ∀ i, Node (k i), Admissible k x s ∧ ∀ i, (s i).rate ≤ ε := by
  classical
  let W := {w : ℝ | ∃ s : ∀ i, Node (k i),
    Admissible k x s ∧ total (fun _ t => t.len) s = w}
  have hW : W.Nonempty := ⟨_, _, root_admissible hk hx, rfl⟩
  have hlower : BddBelow W := ⟨0, by
    rintro w ⟨s, _, rfl⟩
    exact sum_nonneg fun i _ => (s i).len_nonneg (hk i)⟩
  obtain ⟨i₀, _, hmin⟩ := Finset.exists_min_image univ (fun i => endpoint (k i)) univ_nonempty
  let δ := endpoint (k i₀) * ε
  have hδ : 0 < δ := mul_pos (endpoint_pos (hk i₀)) hε
  obtain ⟨_, ⟨s, hs, rfl⟩, hnear⟩ := exists_lt_of_csInf_lt hW
    (show sInf W < sInf W + δ by linarith)
  refine ⟨s, hs, fun i => ?_⟩
  by_contra! hi
  obtain ⟨j, _, hj⟩ := Finset.exists_max_image univ (fun i => (s i).rate) univ_nonempty
  obtain ⟨t, ht, hdec⟩ := refine_node hk hdiam hs j (fun u => hj u (mem_univ _))
  have hδ' : δ ≤ endpoint (k j) * (s j).rate :=
    mul_le_mul (hmin j (mem_univ _)) ((hi.trans_le (hj i (mem_univ _))).le)
      hε.le (endpoint_pos (hk j)).le
  have hbest := csInf_le hlower (show total (fun _ t => t.len) t ∈ W from ⟨t, ht, rfl⟩)
  linarith

/-- The sum set consists of the sums of tuples of actual summand values. -/
def sumSet {ι : Type*} [Fintype ι] (sets : ι → Set ℝ) : Set ℝ :=
  (fun y : ι → ℝ => ∑ i, y i) '' {y | ∀ i, y i ∈ sets i}

theorem closed_sum_compact {ι : Type*} [Fintype ι] {k : ι → ℕ} (hk : ∀ i, 2 ≤ k i) :
    IsCompact (sumSet fun i => closedDigits (k i)) :=
  (isCompact_pi_infinite fun i => closedDigits_compact (hk i)).image
    (continuous_finsetSum _ fun i _ => continuous_apply i)

/-- The compact hull is covered, including at equality of the total diameter. -/
theorem closed_sum_eq {ι : Type*} [Fintype ι] {k : ι → ℕ} (hk : ∀ i, 2 ≤ k i)
    (hdiam : 1 ≤ ∑ i, endpoint (k i)) :
    (sumSet fun i => closedDigits (k i)) = Icc 0 (∑ i, endpoint (k i)) := by
  classical
  apply Set.Subset.antisymm
  · rintro _ ⟨y, hy, rfl⟩
    exact ⟨sum_nonneg (fun i _ => (closedDigits_bounds (hk i) (hy i)).1),
      sum_le_sum (fun i _ => (closedDigits_bounds (hk i) (hy i)).2)⟩
  · intro x hx
    have : Nonempty ι := by
      by_contra! h
      norm_num at hdiam
    rw [← (closed_sum_compact hk).isClosed.closure_eq]
    apply Metric.mem_closure_iff.mpr
    intro ε hε
    let δ := ε / ((Fintype.card ι : ℝ) + 1)
    have hδ : 0 < δ := by dsimp [δ]; positivity
    obtain ⟨s, hs, hsmall⟩ := exists_small_rates hk hdiam hx
      (show 0 < δ ^ 2 / 4 by positivity)
    let y (i : ι) := (s i).hi
    refine ⟨∑ i, y i, ⟨y, fun i => (s i).hi_mem (hk i), rfl⟩, ?_⟩
    have hlen (i : ι) : (s i).len ≤ δ := by
      have h := (s i).len_sq_le (hk i)
      have h' := hsmall i
      by_contra! hcontra
      nlinarith [sq_nonneg ((s i).len - δ), mul_pos hδ (sub_pos.mpr hcontra)]
    have hsum : (∑ i, (s i).len) ≤ (Fintype.card ι : ℝ) * δ := by
      simpa only [Finset.sum_const, Finset.card_univ, nsmul_eq_mul] using
        sum_le_sum (s := Finset.univ) (g := fun _ : ι => δ) (fun i _ => hlen i)
    have hδsmall : (Fintype.card ι : ℝ) * δ < ε := by
      have hδeq : δ * ((Fintype.card ι : ℝ) + 1) = ε := by
        dsimp [δ]
        field_simp
      linarith
    have hhi : x ≤ ∑ i, y i := hs.1.2
    have hlo : (∑ i, (s i).lo) ≤ x := hs.1.1
    rw [Real.dist_eq, abs_of_nonpos (sub_nonpos.mpr hhi)]
    have heq : (∑ i, y i) = (∑ i, (s i).lo) + ∑ i, (s i).len := by
      simp only [y, Node.hi, Finset.sum_add_distrib]
    linarith

end

end GravgaardLeeDiameter
