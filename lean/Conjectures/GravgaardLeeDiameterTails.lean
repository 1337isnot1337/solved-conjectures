import Conjectures.GravgaardLeeDiameterDigits

/-!
# Finite endpoints and positive replacement tails
-/

open Filter Finset Set
open scoped Topology Pointwise

namespace GravgaardLeeDiameter

open GravgaardLeeLargeLuroth GravgaardLeeMixedLuroth GravgaardLeeUpperLower

noncomputable section

def wordValue (digits : List ℕ) (z : ℝ) : ℝ := digits.foldr branch z
def wordScale (digits : List ℕ) : ℝ := (digits.map width).prod

theorem word_affine (w : List ℕ) (z : ℝ) :
    wordValue w z = wordValue w 0 + wordScale w * z := by
  induction w with
  | nil => simp [wordValue, wordScale]
  | cons d w ih =>
      simp only [wordValue, List.foldr_cons, wordScale, List.map_cons, List.prod_cons] at ih ⊢
      rw [branch, branch, ih]
      ring

theorem wordScale_pos {k : ℕ} (hk : 2 ≤ k) {w : List ℕ} (hw : ∀ d ∈ w, k ≤ d) :
    0 < wordScale w := by
  induction w with
  | nil => simp [wordScale]
  | cons d w ih =>
      simp only [wordScale, List.map_cons, List.prod_cons]
      exact mul_pos (width_pos (hk.trans (hw d (List.mem_cons_self ..))))
        (ih fun e he => hw e (List.mem_cons_of_mem _ he))

theorem word_mem_large {k : ℕ} (hk : 2 ≤ k) {w : List ℕ} (hw : ∀ d ∈ w, k ≤ d)
    {z : ℝ} (hz : z ∈ largeDigitSet k) : wordValue w z ∈ largeDigitSet k := by
  induction w with
  | nil => exact hz
  | cons d w ih =>
      exact prepend_large hk (hw d (List.mem_cons_self ..))
        (ih fun e he => hw e (List.mem_cons_of_mem _ he))

theorem word_zero_mem_closed {k : ℕ} (hk : 2 ≤ k) {w : List ℕ} (hw : ∀ d ∈ w, k ≤ d) :
    wordValue w 0 ∈ closedDigits k := by
  induction w with
  | nil => exact zero_mem_closed hk
  | cons d w ih =>
      exact prepend_closed hk (hw d (List.mem_cons_self ..))
        (ih fun e he => hw e (List.mem_cons_of_mem _ he))

theorem finite_or_large {k : ℕ} (hk : 2 ≤ k) {y : ℝ} (hy : y ∈ closedDigits k) :
    (∃ w : List ℕ, (∀ d ∈ w, k ≤ d) ∧ y = wordValue w 0) ∨ y ∈ largeDigitSet k := by
  let finite : Set ℝ := {z | ∃ w : List ℕ, (∀ d ∈ w, k ≤ d) ∧ z = wordValue w 0}
  by_cases hy' : y ∈ finite
  · exact Or.inl hy'
  · right
    apply large_of_tail_choices hk (G := closedDigits k \ finite) ?_ ?_ ⟨hy, hy'⟩
    · intro z hz
      exact ⟨(closedDigits_bounds hk hz.1).1, (closedDigits_bounds hk hz.1).2.trans (endpoint_le_one hk)⟩
    · intro z hz
      have hzpos : 0 < z := lt_of_le_of_ne (closedDigits_bounds hk hz.1).1
        (fun heq => hz.2 ⟨[], by simp, heq.symm⟩)
      obtain ⟨d, hd, t, ht, hzt⟩ := closedDigits_head hk hz.1 hzpos
      refine ⟨d, hd, t, ⟨ht, ?_⟩, hzt⟩
      rintro ⟨w, hw, rfl⟩
      exact hz.2 ⟨d :: w, fun e he => by
        rcases List.mem_cons.mp he with rfl | he
        · exact hd
        · exact hw e he, hzt⟩

def IsLeftIsolated (S : Set ℝ) (y : ℝ) : Prop :=
  ∃ l < y, ∀ z ∈ S, l < z → y ≤ z

private theorem zero_left_isolated {k : ℕ} (hk : 2 ≤ k) :
    IsLeftIsolated (closedDigits k) 0 :=
  ⟨-1, by norm_num, fun _ hy _ => (closedDigits_bounds hk hy).1⟩

private theorem branch_gap_pos {k d : ℕ} (hk : 3 ≤ k) (hd : 2 ≤ d) :
    branch (d + 1) (endpoint k) < 1 / (d : ℝ) := by
  have h := digitTop (d := d + 1) (by omega)
  simp only [Nat.cast_add, Nat.cast_one, add_sub_cancel_right] at h
  have hwidth := width_pos (d := d + 1) (by omega)
  have hgap := mul_pos hwidth (sub_pos.mpr (endpoint_lt_one hk))
  simp only [branch, Nat.cast_add, Nat.cast_one]
  nlinarith

private theorem branch_left_isolated {k d : ℕ} (hk : 3 ≤ k) (hd : k ≤ d)
    {y : ℝ} (hy : y ∈ closedDigits k) (hiso : IsLeftIsolated (closedDigits k) y) :
    IsLeftIsolated (closedDigits k) (branch d y) := by
  obtain ⟨l, hl, hiso⟩ := hiso
  have hk₂ : 2 ≤ k := by omega
  have hd₂ := hk₂.trans hd
  have hy' := closedDigits_bounds hk₂ hy
  have hdwidth := width_pos hd₂
  have hbranch : 0 < 1 / (d : ℝ) := by positivity
  have hbase : 1 / (d : ℝ) ≤ branch d y := by
    unfold branch
    exact le_add_of_nonneg_right (mul_nonneg hdwidth.le hy'.1)
  have hmono : StrictMono (branch d) := fun a b hab => by
    unfold branch
    exact add_lt_add_right (mul_lt_mul_of_pos_left hab hdwidth) _
  let lower := max (branch (d + 1) (endpoint k)) (branch d l)
  refine ⟨lower, max_lt ((branch_gap_pos hk hd₂).trans_le hbase) (hmono hl), ?_⟩
  intro z hz hzlo
  have hzpos : 0 < z := by
    have hlo : 0 < branch (d + 1) (endpoint k) := by
      have := width_pos (d := d + 1) (by omega)
      have := endpoint_pos hk₂
      unfold branch
      positivity
    exact (hlo.trans_le (le_max_left _ _)).trans hzlo
  obtain ⟨e, he, t, ht, rfl⟩ := closedDigits_head hk₂ hz hzpos
  have ht' := closedDigits_bounds hk₂ ht
  rcases lt_trichotomy d e with hde | rfl | hed
  · have htop := (branch_mono (hk₂.trans he) ht'.2).trans
      (branch_antitone_digit (by omega : 2 ≤ d + 1) (by omega : d + 1 ≤ e)
        (endpoint_pos hk₂).le)
    exact False.elim ((not_lt_of_ge (htop.trans (le_max_left _ _))) hzlo)
  · exact (branch_mono hd₂) (hiso t ht (hmono.lt_iff_lt.mp ((le_max_right _ _).trans_lt hzlo)))
  · have heR : (2 : ℝ) ≤ e := by exact_mod_cast hk₂.trans he
    have hedR : (e : ℝ) + 1 ≤ d := by exact_mod_cast (show e + 1 ≤ d by omega)
    calc
      branch d y ≤ branch d (endpoint k) := branch_mono hd₂ hy'.2
      _ ≤ 1 / ((d : ℝ) - 1) := branch_le_digitTop hk₂ hd₂
      _ ≤ 1 / (e : ℝ) := one_div_le_one_div_of_le (by linarith) (by linarith)
      _ ≤ branch e t := le_add_of_nonneg_right (mul_nonneg (width_pos (hk₂.trans he)).le ht'.1)

theorem excluded_left_isolated {k : ℕ} (hk : 2 ≤ k) {y : ℝ}
    (hy : y ∈ closedDigits k) (hbad : y ∉ largeDigitSet k) :
    IsLeftIsolated (closedDigits k) y := by
  by_cases htwo : k = 2
  · subst k
    have h := closedDigits_bounds hk hy
    rw [largeDigitSet_two] at hbad
    have hle := h.2
    norm_num [endpoint] at hle
    have hy₀ : y = 0 := by
      by_contra hne
      exact hbad ⟨lt_of_le_of_ne h.1 (Ne.symm hne), hle⟩
    rw [hy₀]
    exact zero_left_isolated hk
  · rcases finite_or_large hk hy with ⟨w, hw, rfl⟩ | h
    · clear hy hbad
      induction w with
      | nil => exact zero_left_isolated hk
      | cons d w ih =>
          have hw' (e : ℕ) (he : e ∈ w) := hw e (List.mem_cons_of_mem _ he)
          exact branch_left_isolated (by omega) (hw d (List.mem_cons_self ..))
            (word_zero_mem_closed hk hw') (ih hw')
    · exact (hbad h).elim

/-- Affine prefixing of an arbitrary admissible tail preserves admissibility. -/
theorem prefix_mem_large {k : ℕ} (hk : 2 ≤ k) (a : ℕ → ℕ) (ha : ∀ i, k ≤ a i)
    (n : ℕ) {z : ℝ} (hz : z ∈ largeDigitSet k) :
    truncation a n + (∏ j ∈ range n, width (a j)) * z ∈ largeDigitSet k := by
  induction n generalizing a with
  | zero => simpa [truncation] using hz
  | succ n ih =>
      rw [prefix_head, prod_range_succ']
      convert prepend_large hk (ha 0) (ih (fun i => a (i + 1)) (fun i => ha (i + 1))) using 1
      unfold branch
      ring

end

end GravgaardLeeDiameter
