import Mathlib.Analysis.Convex.Extreme
import Mathlib.Combinatorics.SimpleGraph.Connectivity.Connected
import Mathlib.Tactic

/-! The normalized polar of a symmetric edge polytope and its extreme
point criterion. Tight edges determine the label on each connected
component up to a constant. -/

open Finset Set

namespace BraunBruegge

variable {V : Type*}

def polar (G : SimpleGraph V) (root : V) : Set (V → ℝ) :=
  {f | f root = 0 ∧ ∀ ⦃u v⦄, G.Adj u v → |f u - f v| ≤ 1}

def tightGraph (G : SimpleGraph V) (f : V → ℝ) : SimpleGraph V where
  Adj u v := G.Adj u v ∧ |f u - f v| = 1
  symm := ⟨fun _ _ h => ⟨h.1.symm, by rw [abs_sub_comm]; exact h.2⟩⟩
  loopless := ⟨fun u h => G.loopless.irrefl u h.1⟩

theorem eq_of_reachable {G : SimpleGraph V} {A : Type*} (f : V → A)
    (h : ∀ ⦃u v⦄, G.Adj u v → f u = f v) {u v : V} (hr : G.Reachable u v) : f u = f v := by
  obtain ⟨w⟩ := hr
  induction w with
  | nil => rfl
  | cons e _ ih => exact (h e).trans ih

theorem endpoint_eq_of_tight {a b x y z : ℝ}
    (ha : 0 < a) (hb : 0 < b) (hs : a + b = 1)
    (hx : |x| ≤ 1) (hy : |y| ≤ 1) (hz : a * x + b * y = z) (he : |z| = 1) : x = z := by
  have upper (a b x y : ℝ) (ha : 0 < a) (hb : 0 ≤ b) (hs : a + b = 1)
      (hx : x ≤ 1) (hy : y ≤ 1) (he : a * x + b * y = 1) : x = 1 := by
    apply le_antisymm hx
    by_contra! hh
    have h1 := mul_lt_mul_of_pos_left hh ha
    have h2 := mul_le_mul_of_nonneg_left hy hb
    linarith
  have hx' := abs_le.mp hx
  have hy' := abs_le.mp hy
  by_cases h : 0 ≤ z
  · rw [abs_of_nonneg h] at he
    exact (upper a b x y ha hb.le hs hx'.2 hy'.2 (hz.trans he)).trans he.symm
  · rw [abs_of_neg (lt_of_not_ge h)] at he
    have e := upper a b (-x) (-y) ha hb.le hs (by linarith [hx'.1]) (by linarith [hy'.1]) (by linarith)
    linarith

private theorem extreme_of_tight_connected {G : SimpleGraph V} {root : V} {f : V → ℝ}
    (hf : f ∈ polar G root) (hc : (tightGraph G f).Connected) :
    f ∈ (polar G root).extremePoints ℝ := by
  apply mem_extremePoints_iff_left.mpr
  refine ⟨hf, ?_⟩
  intro x hx y hy hseg
  obtain ⟨a, b, ha, hb, hab, hz⟩ := hseg
  have hdiff {u v : V} (h : (tightGraph G f).Adj u v) : x u - f u = x v - f v := by
    have hu := congrFun hz u
    have hv := congrFun hz v
    change a * x u + b * y u = f u at hu
    change a * x v + b * y v = f v at hv
    have e := endpoint_eq_of_tight ha hb hab (hx.2 h.1) (hy.2 h.1)
      (by linear_combination hu - hv) h.2
    linarith
  funext v
  have hr := eq_of_reachable (G := tightGraph G f) (fun u => x u - f u)
    (fun _ _ h => hdiff h) (hc root v)
  change x root - f root = x v - f v at hr
  rw [hx.1, hf.1] at hr
  linarith

private theorem tight_connected_of_extreme [Fintype V] {G : SimpleGraph V} {root : V}
    {f : V → ℝ} (hf : f ∈ (polar G root).extremePoints ℝ) : (tightGraph G f).Connected := by
  classical
  let : Nonempty V := ⟨root⟩
  rw [mem_extremePoints_iff_left] at hf
  let H := tightGraph G f
  by_contra hnot
  have hv : ∃ v, ¬H.Reachable root v := by
    by_contra! h
    have hconnected : H.Connected := { preconnected := fun u w => (h u).symm.trans (h w) }
    exact hnot hconnected
  obtain ⟨v, hv⟩ := hv
  let shift (u : V) : ℝ := if H.Reachable root u then 0 else 1
  have shift_root : shift root = 0 := by simp [shift]
  have shift_v : shift v = 1 := by simp [shift, hv]
  have shift_tight {u w : V} (h : H.Adj u w) : shift u = shift w := by
    have he : H.Reachable root u ↔ H.Reachable root w :=
      ⟨fun hu => hu.trans h.reachable, fun hw => hw.trans h.symm.reachable⟩
    simp only [shift, he]
  let slack (p : V × V) : ℝ := if |f p.1 - f p.2| < 1 then 1 - |f p.1 - f p.2| else 1
  have hslack (p : V × V) : 0 < slack p := by
    dsimp [slack]
    split_ifs <;> linarith
  let gaps := Finset.univ.image slack
  have hgaps : gaps.Nonempty := ⟨slack (root, root), mem_image_of_mem _ (mem_univ _)⟩
  let ε := gaps.min' hgaps
  have hε : 0 < ε := by
    obtain ⟨p, _, hp⟩ := Finset.mem_image.mp (min'_mem gaps hgaps)
    rw [← show slack p = ε from hp]
    exact hslack p
  let perturbed (t : ℝ) (u : V) := f u + t * shift u
  have valid (t : ℝ) (ht : |t| ≤ ε) : perturbed t ∈ polar G root := by
    refine ⟨by simp [perturbed, shift_root, hf.1.1], ?_⟩
    intro u w he
    have hbound := hf.1.2 he
    by_cases htight : |f u - f w| = 1
    · have hshift := shift_tight (show H.Adj u w from ⟨he, htight⟩)
      have habs : perturbed t u - perturbed t w = f u - f w := by
        simp only [perturbed, hshift]
        ring
      rwa [habs]
    · have hs : |f u - f w| < 1 := lt_of_le_of_ne hbound htight
      have hmin : ε ≤ 1 - |f u - f w| := by
        have hle := min'_le gaps (slack (u, w)) (mem_image_of_mem _ (mem_univ _))
        simpa only [ε, slack, hs, ite_true] using hle
      have hshift : |shift u - shift w| ≤ 1 := by
        unfold shift
        split_ifs <;> norm_num
      calc
        |perturbed t u - perturbed t w| = |(f u - f w) + t * (shift u - shift w)| := by
          congr 1
          unfold perturbed
          ring
        _ ≤ |f u - f w| + |t| * |shift u - shift w| := by
          rw [← abs_mul]
          exact abs_add_le _ _
        _ ≤ 1 := by
          have hmul := mul_le_mul_of_nonneg_left hshift (abs_nonneg t)
          linarith
  have hp := valid ε (by simp [abs_of_pos hε])
  have hm := valid (-ε) (by simp [abs_of_pos hε])
  have hseg : f ∈ openSegment ℝ (perturbed ε) (perturbed (-ε)) := by
    refine ⟨1 / 2, 1 / 2, by norm_num, by norm_num, by norm_num, ?_⟩
    funext u
    change 1 / 2 * perturbed ε u + 1 / 2 * perturbed (-ε) u = f u
    unfold perturbed
    ring
  have he := congrFun (hf.2 _ hp _ hm hseg) v
  simp only [perturbed, shift_v, mul_one] at he
  linarith

/-- A normalized feasible potential is an extreme point exactly when its
tight edges form a connected spanning graph. -/
theorem mem_extreme_polar_iff [Fintype V] {G : SimpleGraph V} {root : V} {f : V → ℝ} :
    f ∈ (polar G root).extremePoints ℝ ↔ f ∈ polar G root ∧ (tightGraph G f).Connected :=
  ⟨fun hf => ⟨hf.1, tight_connected_of_extreme hf⟩,
    fun ⟨hf, hc⟩ => extreme_of_tight_connected hf hc⟩

theorem int_difference_of_tight_reachable {G : SimpleGraph V} {f : V → ℝ} {u v : V}
    (h : (tightGraph G f).Reachable u v) : ∃ z : ℤ, f u - f v = z := by
  obtain ⟨p⟩ := h
  induction p with
  | nil => exact ⟨0, by simp⟩
  | @cons u w v he _ ih =>
    obtain ⟨z, hz⟩ := ih
    have ha : |f u - f w| = 1 := he.2
    by_cases hnonneg : 0 ≤ f u - f w
    · rw [abs_of_nonneg hnonneg] at ha
      refine ⟨1 + z, ?_⟩
      push_cast
      linarith
    · rw [abs_of_neg (lt_of_not_ge hnonneg)] at ha
      refine ⟨-1 + z, ?_⟩
      push_cast
      linarith

theorem int_label_of_mem_extreme_polar [Fintype V] {G : SimpleGraph V} {root : V}
    {f : V → ℝ} (hf : f ∈ (polar G root).extremePoints ℝ) (v : V) : ∃ z : ℤ, f v = z := by
  obtain ⟨hmem, hconn⟩ := mem_extreme_polar_iff.mp hf
  obtain ⟨z, hz⟩ := int_difference_of_tight_reachable (hconn v root)
  exact ⟨z, by simpa [hmem.1] using hz⟩

end BraunBruegge
