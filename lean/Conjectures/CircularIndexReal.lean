import Conjectures.CircularIndexCounting
import Mathlib.Algebra.Order.Archimedean.Real.Basic
import Mathlib.Tactic.Linarith

/-!
# The real-circle definition and the integer-to-real bridge

Colors are real numbers in `[0,r)`.  For incident distinct edges both
`1 ≤ |x-y|` and `|x-y| ≤ r-1` hold, exactly the circular-distance condition.
-/

namespace CircularIndex

structure RealCircularEdgeColoring {V : Type*} (G : SimpleGraph V) (r : ℝ) where
  one_le : 1 ≤ r
  colors : G.edgeSet → ℝ
  nonneg : ∀ e, 0 ≤ colors e
  lt_radius : ∀ e, colors e < r
  separated : ∀ e f : G.edgeSet, e ≠ f →
    (∃ v : V, v ∈ e.val ∧ v ∈ f.val) →
      1 ≤ |colors f - colors e| ∧ |colors f - colors e| ≤ r - 1

noncomputable def circularChromaticIndex {V : Type*} (G : SimpleGraph V) : ℝ :=
  sInf {r : ℝ | Nonempty (RealCircularEdgeColoring G r)}

theorem zmod_val_sub_wrap {p : ℕ} [NeZero p] (x y : ZMod p)
    (hle : x.val ≤ y.val) (hne : y ≠ x) :
    (x - y).val = p - (y.val - x.val) := by
  have hne' : y - x ≠ 0 := sub_ne_zero.mpr hne
  rw [show x - y = -(y - x) by abel, ZMod.neg_val, ite_eq_right hne', ZMod.val_sub hle]

theorem integer_gap_bounds {p q : ℕ} [NeZero p] (hq : 0 < q) (x y : ZMod p)
    (hxy : q ≤ (y - x).val) (hyx : q ≤ (x - y).val) (hle : x.val ≤ y.val) :
    q ≤ y.val - x.val ∧ q ≤ p - (y.val - x.val) := by
  have hne : y ≠ x := by intro h; simp [h] at hxy; omega
  rw [ZMod.val_sub hle] at hxy
  rw [zmod_val_sub_wrap x y hle hne] at hyx
  exact ⟨hxy, hyx⟩

theorem real_gap_bounds (p q a b : ℕ) (hq : 0 < q) (hab : a ≤ b) (_hb : b < p)
    (hl : q ≤ b - a) (hu : q ≤ p - (b - a)) :
    1 ≤ |(b : ℝ) / q - (a : ℝ) / q| ∧
      |(b : ℝ) / q - (a : ℝ) / q| ≤ (p : ℝ) / q - 1 := by
  have hq' : (0 : ℝ) < q := by exact_mod_cast hq
  have hab' : (a : ℝ) ≤ b := by exact_mod_cast hab
  have hl' : (q : ℝ) ≤ (b : ℝ) - a := by
    have h := (show (q : ℝ) ≤ ((b - a : ℕ) : ℝ) by exact_mod_cast hl)
    rwa [Nat.cast_sub hab] at h
  have hu' : (q : ℝ) ≤ (p : ℝ) - ((b : ℝ) - a) := by
    have h := (show (q : ℝ) ≤ ((p - (b - a) : ℕ) : ℝ) by exact_mod_cast hu)
    rwa [Nat.cast_sub (show b - a ≤ p by omega), Nat.cast_sub hab] at h
  rw [← sub_div, abs_of_nonneg (div_nonneg (sub_nonneg.mpr hab') hq'.le)]
  constructor
  · exact (le_div_iff₀ hq').mpr (by simpa using hl')
  · apply (div_le_iff₀ hq').mpr
    rw [sub_mul, div_mul_cancel₀ _ hq'.ne', one_mul]
    linarith

theorem zmod_real_gap_bounds {p q : ℕ} [NeZero p] (hq : 0 < q) (x y : ZMod p)
    (hxy : q ≤ (y - x).val) (hyx : q ≤ (x - y).val) :
    1 ≤ |(y.val : ℝ) / q - (x.val : ℝ) / q| ∧
      |(y.val : ℝ) / q - (x.val : ℝ) / q| ≤ (p : ℝ) / q - 1 := by
  rcases le_total x.val y.val with hle | hle
  · obtain ⟨hl, hu⟩ := integer_gap_bounds hq x y hxy hyx hle
    exact real_gap_bounds p q x.val y.val hq hle (ZMod.val_lt y) hl hu
  · obtain ⟨hl, hu⟩ := integer_gap_bounds hq y x hyx hxy hle
    simpa only [abs_sub_comm] using
      (real_gap_bounds p q y.val x.val hq hle (ZMod.val_lt x) hl hu)

noncomputable def IntegerCircularEdgeColoring.toReal {V : Type*} {G : SimpleGraph V}
    {p q : ℕ} [NeZero p] (C : IntegerCircularEdgeColoring G p q) (hq : 0 < q)
    (hqp : q ≤ p) : RealCircularEdgeColoring G ((p : ℝ) / q) where
  one_le := by
    have hq' : (0 : ℝ) < q := by exact_mod_cast hq
    apply (le_div_iff₀ hq').mpr
    simpa using (show (q : ℝ) ≤ p by exact_mod_cast hqp)
  colors e := (C.colors e).val / (q : ℝ)
  nonneg e := div_nonneg (Nat.cast_nonneg _) (Nat.cast_nonneg _)
  lt_radius e := by
    have hq' : (0 : ℝ) < q := by exact_mod_cast hq
    exact (div_lt_div_iff_of_pos_right hq').mpr (by exact_mod_cast ZMod.val_lt (C.colors e))
  separated e f hef hv := by
    exact zmod_real_gap_bounds hq (C.colors e) (C.colors f) (C.separated e f hef hv)
      (C.separated f e (Ne.symm hef) (by rcases hv with ⟨v, he, hf⟩; exact ⟨v, hf, he⟩))

theorem circularChromaticIndex_le_of_coloring {V : Type*} {G : SimpleGraph V}
    {r : ℝ} (C : RealCircularEdgeColoring G r) : circularChromaticIndex G ≤ r := by
  apply csInf_le
  · exact ⟨1, fun s hs => hs.some.one_le⟩
  · exact ⟨C⟩

theorem circulant_circularChromaticIndex_upper_bound (g : ℕ) (hg : 2 ≤ g) :
    circularChromaticIndex (graph g) ≤ (2 * order g : ℝ) / 3 := by
  have hpq : 3 ≤ 2 * order g := by simp only [order]; omega
  have C := (circulantColoring g hg).toReal (by omega : 0 < 3) hpq
  have h := circularChromaticIndex_le_of_coloring C
  simpa only [Nat.cast_mul, Nat.cast_ofNat] using h

end CircularIndex
