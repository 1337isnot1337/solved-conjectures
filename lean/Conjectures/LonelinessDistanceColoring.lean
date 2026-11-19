import Conjectures.LonelinessContinuity
import Conjectures.LonelinessCoalescenceValue
import Mathlib.Combinatorics.SimpleGraph.Coloring.Vertex
import Mathlib.Combinatorics.SimpleGraph.Clique
import Mathlib.Algebra.Order.Floor.Semiring
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

/-! A circle character with clearance at least `1/q` gives an actual
proper `q`-coloring of the integer distance graph. -/

namespace Loneliness.DistanceColoring

def graph (ds : List ℕ) : SimpleGraph ℤ where
  Adj m n := m ≠ n ∧ (m - n).natAbs ∈ ds
  symm := ⟨by
    intro m n h
    refine ⟨h.1.symm, ?_⟩
    rw [show n - m = -(m - n) by omega, Int.natAbs_neg]
    exact h.2⟩
  loopless := ⟨by
    intro m h
    exact h.1 rfl⟩

@[simp] theorem graph_adj (ds : List ℕ) (m n : ℤ) :
    (graph ds).Adj m n ↔ m ≠ n ∧ (m - n).natAbs ∈ ds := Iff.rfl

noncomputable def phaseIndex (q : ℕ) (t : ℝ) (m : ℤ) : ℕ :=
  ⌊(q : ℝ) * Int.fract ((m : ℝ) * t)⌋₊

theorem phaseIndex_lt (q : ℕ) (hq : 0 < q) (t : ℝ) (m : ℤ) :
    phaseIndex q t m < q := by
  have hqR : (0 : ℝ) < q := by exact_mod_cast hq
  apply (Nat.floor_lt (mul_nonneg hqR.le (Int.fract_nonneg _))).mpr
  simpa only [mul_one] using mul_lt_mul_of_pos_left (Int.fract_lt_one ((m : ℝ) * t)) hqR

noncomputable def phaseColor (q : ℕ) (hq : 0 < q) (t : ℝ) (m : ℤ) : Fin q :=
  ⟨phaseIndex q t m, phaseIndex_lt q hq t m⟩

theorem same_phase_bin (q : ℕ) (hq : 0 < q) (x y : ℝ)
    (hbin : ⌊(q : ℝ) * Int.fract x⌋₊ = ⌊(q : ℝ) * Int.fract y⌋₊) :
    |Int.fract x - Int.fract y| < (1 : ℝ) / q := by
  have hqR : (0 : ℝ) < q := by exact_mod_cast hq
  have hx0 : 0 ≤ (q : ℝ) * Int.fract x := mul_nonneg hqR.le (Int.fract_nonneg x)
  have hy0 : 0 ≤ (q : ℝ) * Int.fract y := mul_nonneg hqR.le (Int.fract_nonneg y)
  have hxl := Nat.floor_le hx0
  have hyl := Nat.floor_le hy0
  have hxu := Nat.lt_floor_add_one ((q : ℝ) * Int.fract x)
  have hyu := Nat.lt_floor_add_one ((q : ℝ) * Int.fract y)
  rw [hbin] at hxl hxu
  have hxy : Int.fract x - Int.fract y < (1 : ℝ) / q := by
    apply (lt_div_iff₀ hqR).mpr
    nlinarith only [hxu, hyl]
  have hyx : Int.fract y - Int.fract x < (1 : ℝ) / q := by
    apply (lt_div_iff₀ hqR).mpr
    nlinarith only [hyu, hxl]
  exact abs_lt.mpr ⟨by linarith, hxy⟩

theorem distance_sub_le_fract (x y : ℝ) :
    distance (x - y) ≤ |Int.fract x - Int.fract y| := by
  calc
    _ ≤ |(x - y) - ((⌊x⌋ - ⌊y⌋ : ℤ) : ℝ)| := distance_le_int _ _
    _ = _ := by
      rw [Int.cast_sub]
      simp only [Int.fract]
      congr 1
      ring

noncomputable def coloring_of_clearance (ds : List ℕ) (q : ℕ) (hq : 0 < q)
    (t : ℝ) (hclearance : (1 : ℝ) / q ≤ clearance ds t) :
    (graph ds).Coloring (Fin q) :=
  SimpleGraph.Coloring.mk (phaseColor q hq t) (by
    intro m n hadj heq
    have hbin : phaseIndex q t m = phaseIndex q t n := congrArg Fin.val heq
    have hsmall := same_phase_bin q hq ((m : ℝ) * t) ((n : ℝ) * t) hbin
    have hlower := hclearance.trans (clearance_le_of_mem hadj.2 t)
    have hdist : distance (((m - n).natAbs : ℝ) * t) =
        distance ((m : ℝ) * t - (n : ℝ) * t) := by
      simpa only [Int.cast_sub, sub_mul] using
        CoordinateSubspace.distance_natAbs_mul (m - n) t
    rw [hdist] at hlower
    exact (not_lt_of_ge hlower)
      ((distance_sub_le_fract ((m : ℝ) * t) ((n : ℝ) * t)).trans_lt hsmall))

theorem colorable_of_value (ds : List ℕ) (q : ℕ) (hq : 0 < q)
    (hvalue : (1 : ℝ) / q ≤ value ds) : (graph ds).Colorable q := by
  obtain ⟨t, _, ht⟩ := value_max ds
  exact ⟨coloring_of_clearance ds q hq t (by rw [ht]; exact hvalue)⟩

theorem not_triangleFree_of_additive (ds : List ℕ) (a b : ℕ)
    (ha : 0 < a) (hb : 0 < b) (hamem : a ∈ ds) (hbmem : b ∈ ds)
    (habmem : a + b ∈ ds) : ¬(graph ds).CliqueFree 3 := by
  have h0a : (graph ds).Adj 0 (a : ℤ) := by
    refine ⟨by omega, ?_⟩
    simpa only [zero_sub, Int.natAbs_neg, Int.natAbs_natCast] using hamem
  have h0ab : (graph ds).Adj 0 ((a + b : ℕ) : ℤ) := by
    refine ⟨by omega, ?_⟩
    simpa only [zero_sub, Int.natAbs_neg, Int.natAbs_natCast] using habmem
  have haab : (graph ds).Adj (a : ℤ) ((a + b : ℕ) : ℤ) := by
    refine ⟨by omega, ?_⟩
    rw [show (a : ℤ) - ((a + b : ℕ) : ℤ) = -(b : ℤ) by omega,
      Int.natAbs_neg, Int.natAbs_natCast]
    exact hbmem
  intro hfree
  apply hfree {0, (a : ℤ), ((a + b : ℕ) : ℤ)}
  exact SimpleGraph.is3Clique_triple_iff.mpr ⟨h0a, h0ab, haab⟩

theorem triangleFree_no_additive (ds : List ℕ) (hpositive : ∀ a ∈ ds, 0 < a)
    (hfree : (graph ds).CliqueFree 3) : ¬∃ a ∈ ds, ∃ b ∈ ds, a + b ∈ ds := by
  rintro ⟨a, ha, b, hb, hab⟩
  exact not_triangleFree_of_additive ds a b (hpositive a ha) (hpositive b hb) ha hb hab hfree

end Loneliness.DistanceColoring
