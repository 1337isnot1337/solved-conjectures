import Conjectures.BraunBrueggeMinimumUncoveredCount
import Mathlib.Analysis.Convex.Topology
import Mathlib.LinearAlgebra.AffineSpace.FiniteDimensional

/-! Affine variations inside matching faces give extra vertices when the pair
arcs do not connect all pairs in both directions. -/

open Set

namespace BraunBruegge

variable {V M : Type*} {G : SimpleGraph V}

theorem orientedEdgeFace_convex (G : SimpleGraph V) (root : V) (E : Set (V × V)) :
    Convex ℝ (orientedEdgeFace G root E) := by
  intro f hf g hg a b ha hb hab
  refine ⟨⟨?_, ?_⟩, ?_⟩
  · change a * f root + b * g root = 0
    rw [hf.1.1, hg.1.1, mul_zero, mul_zero, add_zero]
  · intro u v he
    have hf' := abs_le.mp (hf.1.2 he)
    have hg' := abs_le.mp (hg.1.2 he)
    apply abs_le.mpr
    change -1 ≤ a * f u + b * g u - (a * f v + b * g v) ∧
      a * f u + b * g u - (a * f v + b * g v) ≤ 1
    constructor <;> nlinarith [mul_nonneg ha (sub_nonneg.mpr hf'.1),
      mul_nonneg hb (sub_nonneg.mpr hg'.1), mul_nonneg ha (sub_nonneg.mpr hf'.2),
      mul_nonneg hb (sub_nonneg.mpr hg'.2)]
  · intro uv he
    change a * f uv.2 + b * g uv.2 - (a * f uv.1 + b * g uv.1) = 1
    calc
      _ = a * (f uv.2 - f uv.1) + b * (g uv.2 - g uv.1) := by ring
      _ = 1 := by rw [hf.2 uv he, hg.2 uv he, mul_one, mul_one, hab]

private theorem extreme_card_of_affineIndependent [Fintype V] {S : Set (V → ℝ)}
    (hC : IsCompact S) (hS : Convex ℝ S) (hN : S.Nonempty)
    (hF : (S.extremePoints ℝ).Finite) {ι : Type*} [Fintype ι] {p : ι → V → ℝ}
    (hp : ∀ i, p i ∈ S) (hI : AffineIndependent ℝ p) :
    Fintype.card ι ≤ Nat.card (S.extremePoints ℝ) := by
  classical
  let E := S.extremePoints ℝ
  let : Fintype E := hF.fintype
  let : Nonempty E := (hC.extremePoints_nonempty hN).to_subtype
  have hH : convexHull ℝ E = S :=
    (hF.isCompact_convexHull ℝ).isClosed.closure_eq ▸ closure_convexHull_extremePoints hC hS
  have hspan : vectorSpan ℝ (Set.range p) ≤ vectorSpan ℝ E := by
    rw [← direction_affineSpan ℝ (Set.range p), ← direction_affineSpan ℝ E,
      ← affineSpan_convexHull (𝕜 := ℝ) E, hH]
    apply AffineSubspace.direction_le (affineSpan_mono ℝ ?_)
    rintro _ ⟨i, rfl⟩
    exact hp i
  have h₁ := hI.card_le_finrank_succ
  have h₂ := finrank_vectorSpan_range_add_one_le ℝ ((↑) : E → V → ℝ)
  rw [Subtype.range_coe] at h₂
  rw [Nat.card_eq_fintype_card]
  exact h₁.trans ((Nat.add_le_add_right (Submodule.finrank_mono hspan) 1).trans h₂)

namespace IndexedMatching

variable (m : IndexedMatching G M)

def Strong : Prop := ∀ i j, Relation.ReflTransGen m.Arc i j

abbrev MatchFace (root : V) := orientedEdgeFace G root m.pairEdges

theorem matchFace_tight {root : V} {f : V → ℝ} (hf : f ∈ m.MatchFace root) (i : M) :
    f (m.high i) - f (m.low i) = 1 := hf.2 _ ⟨i, rfl⟩

theorem matchFace_extreme (root : V) :
    IsExtreme ℝ (polar G root) (m.MatchFace root) :=
  orientedEdgeFace_isExtreme G root m.pairEdges (by rintro _ ⟨i, rfl⟩; exact m.edge i)

private noncomputable def centered (root : V) (t : M → ℝ) (u : m.Uncovered → ℝ) : V → ℝ :=
  fun x => m.label t u x - m.label t u root

private theorem centered_mem_matchFace (root : V) (t : M → ℝ) (u : m.Uncovered → ℝ)
    (ht : ∀ i, 0 ≤ t i ∧ t i ≤ 1 / 4) (hu : ∀ v, 1 / 2 ≤ u v ∧ u v ≤ 3 / 4)
    (ha : ∀ i j, m.Arc i j → t i ≤ t j) : m.centered root t u ∈ m.MatchFace root := by
  have hd (x y : V) : m.centered root t u x - m.centered root t u y = m.label t u x - m.label t u y := by
    unfold centered
    ring
  refine ⟨⟨by simp [centered], ?_⟩, ?_⟩
  · intro x y he
    obtain ⟨i, rfl⟩ := m.endpointsEquiv.surjective x
    obtain ⟨j, rfl⟩ := m.endpointsEquiv.surjective y
    rcases i with i | p <;> rcases j with j | q
    · cases i with
      | inl i =>
        cases j with
        | inl j =>
          change |m.centered root t u (m.low i) - m.centered root t u (m.low j)| ≤ 1
          rw [hd, label_low, label_low]
          exact abs_le.mpr ⟨by linarith [(ht i).1, (ht j).2], by linarith [(ht i).2, (ht j).1]⟩
        | inr j =>
          change |m.centered root t u (m.low i) - m.centered root t u (m.high j)| ≤ 1
          rw [hd, label_low, label_high]
          exact abs_le.mpr ⟨by linarith [ha j i he.symm], by linarith [(ht i).2, (ht j).1]⟩
      | inr i =>
        cases j with
        | inl j =>
          change |m.centered root t u (m.high i) - m.centered root t u (m.low j)| ≤ 1
          rw [hd, label_high, label_low]
          exact abs_le.mpr ⟨by linarith [(ht i).1, (ht j).2], by linarith [ha i j he]⟩
        | inr j =>
          change |m.centered root t u (m.high i) - m.centered root t u (m.high j)| ≤ 1
          rw [hd, label_high, label_high]
          exact abs_le.mpr ⟨by linarith [(ht i).1, (ht j).2], by linarith [(ht i).2, (ht j).1]⟩
    · cases i with
      | inl i =>
        change |m.centered root t u (m.low i) - m.centered root t u q.val| ≤ 1
        rw [hd, label_low, label_uncovered]
        exact abs_le.mpr ⟨by linarith [(ht i).1, (hu q).2], by linarith [(ht i).2, (hu q).1]⟩
      | inr i =>
        change |m.centered root t u (m.high i) - m.centered root t u q.val| ≤ 1
        rw [hd, label_high, label_uncovered]
        exact abs_le.mpr ⟨by linarith [(ht i).1, (hu q).2], by linarith [(ht i).2, (hu q).1]⟩
    · cases j with
      | inl j =>
        change |m.centered root t u p.val - m.centered root t u (m.low j)| ≤ 1
        rw [hd, label_uncovered, label_low]
        exact abs_le.mpr ⟨by linarith [(hu p).1, (ht j).2], by linarith [(hu p).2, (ht j).1]⟩
      | inr j =>
        change |m.centered root t u p.val - m.centered root t u (m.high j)| ≤ 1
        rw [hd, label_uncovered, label_high]
        exact abs_le.mpr ⟨by linarith [(hu p).1, (ht j).2], by linarith [(hu p).2, (ht j).1]⟩
    · change |m.centered root t u p.val - m.centered root t u q.val| ≤ 1
      rw [hd, label_uncovered, label_uncovered]
      exact abs_le.mpr ⟨by linarith [(hu p).1, (hu q).2], by linarith [(hu p).2, (hu q).1]⟩
  · rintro _ ⟨i, rfl⟩
    rw [hd, label_high, label_low, add_sub_cancel_left]

private theorem matchFace_minimum_of_points [Fintype V] (hG : G.Connected) (root : V)
    {ι : Type*} [Fintype ι] [Nonempty ι] {p : ι → V → ℝ}
    (hp : ∀ i, p i ∈ m.MatchFace root) (hi : AffineIndependent ℝ p) :
    Fintype.card ι ≤ Nat.card ((m.MatchFace root).extremePoints ℝ) := by
  classical
  have he := m.matchFace_extreme root
  have hF : (polar G root).extremePoints ℝ |>.Finite := finite_polar_vertices hG root
  apply extreme_card_of_affineIndependent
    ((polar_isCompact hG root).of_isClosed_subset (orientedEdgeFace_isClosed G root _) he.subset)
    (orientedEdgeFace_convex G root _) ⟨p (Classical.choice ‹Nonempty ι›), hp _⟩
    (hF.subset he.extremePoints_subset_extremePoints) hp hi

private theorem centered_low_difference (root : V) (t : M → ℝ) (u : m.Uncovered → ℝ) (i j : M) :
    m.centered root t u (m.low i) - m.centered root t u (m.low j) = t i - t j := by
  simp only [centered, label_low]
  ring

private theorem centered_uncovered_difference (root : V) (t : M → ℝ) (u : m.Uncovered → ℝ)
    (v : m.Uncovered) (i : M) :
    m.centered root t u v.val - m.centered root t u (m.low i) = u v - t i := by
  simp only [centered, label_uncovered, label_low]
  ring

private theorem exists_nonconstant_quarter_shift (h : ¬m.Strong) :
    ∃ (t : M → ℝ) (i j : M), t i ≠ t j ∧ (∀ k, 0 ≤ t k ∧ t k ≤ 1 / 4) ∧
      (∀ k l, m.Arc k l → t k ≤ t l) := by
  classical
  unfold Strong at h
  push Not at h
  obtain ⟨i, j, hij⟩ := h
  let t (k : M) : ℝ := if Relation.ReflTransGen m.Arc i k then 1 / 4 else 0
  refine ⟨t, i, j, by norm_num [t, Relation.ReflTransGen.refl, hij], ?_, ?_⟩
  · intro k
    unfold t
    split_ifs <;> norm_num
  · intro k l e
    by_cases hk : Relation.ReflTransGen m.Arc i k
    · have hl := hk.tail e
      simp [t, hk, hl]
    · simp [t, hk]
      split_ifs <;> norm_num

noncomputable def matchFaceVertexLower (r : ℕ) : ℕ := by
  classical
  exact 1 + r + if m.Strong then 0 else 1

theorem matchFaceVertexLower_le_card [Fintype V] [Nonempty M] (hG : G.Connected) (root : V)
    (hr : Nat.card m.Uncovered ≤ 1) :
    m.matchFaceVertexLower (Nat.card m.Uncovered) ≤ Nat.card ((m.MatchFace root).extremePoints ℝ) := by
  classical
  let t₀ : M → ℝ := fun _ => 0
  let u₀ : m.Uncovered → ℝ := fun _ => 1 / 2
  let u₁ : m.Uncovered → ℝ := fun _ => 3 / 4
  let f := m.centered root t₀ u₀
  let g := m.centered root t₀ u₁
  have hf : f ∈ m.MatchFace root := m.centered_mem_matchFace root t₀ u₀
    (by intro i; norm_num [t₀]) (by intro v; norm_num [u₀]) (by intros; rfl)
  have hg : g ∈ m.MatchFace root := m.centered_mem_matchFace root t₀ u₁
    (by intro i; norm_num [t₀]) (by intro v; norm_num [u₁]) (by intros; rfl)
  have hfg (v : m.Uncovered) : f ≠ g := by
    intro e
    let i : M := Classical.choice ‹Nonempty M›
    have e₀ := m.centered_uncovered_difference root t₀ u₀ v i
    have e₁ := m.centered_uncovered_difference root t₀ u₁ v i
    change f v.val - f (m.low i) = u₀ v - t₀ i at e₀
    change g v.val - g (m.low i) = u₁ v - t₀ i at e₁
    rw [e] at e₀
    norm_num [u₀, u₁, t₀] at e₀ e₁
    linarith
  have hone : Nat.card m.Uncovered = 0 ∨ Nat.card m.Uncovered = 1 := by omega
  by_cases hs : m.Strong
  · rcases hone with h0 | h1
    · simp only [matchFaceVertexLower, h0, hs, ite_true, add_zero]
      let p : Fin 1 → V → ℝ := fun _ => f
      simpa using m.matchFace_minimum_of_points hG root (p := p) (fun _ => hf)
        (affineIndependent_of_subsingleton ℝ p)
    · have hu := (Nat.card_pos_iff.mp (by omega : 0 < Nat.card m.Uncovered)).1
      obtain ⟨v⟩ := hu
      simpa only [Fintype.card_fin, matchFaceVertexLower, h1, hs, ite_true, ite_false] using m.matchFace_minimum_of_points hG root
        (p := ![f, g]) (by intro k; fin_cases k <;> first | exact hf | exact hg)
        (affineIndependent_of_ne ℝ (hfg v))
  · obtain ⟨t, i, j, hij, ht, ha⟩ := m.exists_nonconstant_quarter_shift hs
    let q := m.centered root t u₀
    have hq : q ∈ m.MatchFace root :=
      m.centered_mem_matchFace root t u₀ ht (by intro v; norm_num [u₀]) ha
    let L : (V → ℝ) →ₗ[ℝ] ℝ :=
      (LinearMap.proj (R := ℝ) (φ := fun _ : V => ℝ) (m.low i)) - LinearMap.proj (m.low j)
    have hfL : L f = 0 := by
      change f (m.low i) - f (m.low j) = 0
      rw [m.centered_low_difference root t₀ u₀]
      simp [t₀]
    have hgL : L g = 0 := by
      change g (m.low i) - g (m.low j) = 0
      rw [m.centered_low_difference root t₀ u₁]
      simp [t₀]
    have hqL : L q ≠ 0 := by
      change q (m.low i) - q (m.low j) ≠ 0
      rw [m.centered_low_difference root t u₀]
      exact sub_ne_zero.mpr hij
    rcases hone with h0 | h1
    · have he : f ≠ q := fun h => hqL (h ▸ hfL)
      simpa only [Fintype.card_fin, matchFaceVertexLower, h0, hs, ite_true, ite_false] using m.matchFace_minimum_of_points hG root
        (p := ![f, q]) (by intro k; fin_cases k <;> first | exact hf | exact hq)
        (affineIndependent_of_ne ℝ he)
    · obtain ⟨v⟩ := (Nat.card_pos_iff.mp (by omega : 0 < Nat.card m.Uncovered)).1
      have hi : AffineIndependent ℝ ![f, g, q] :=
        affineIndependent_of_ne_of_mem_of_mem_of_notMem (s := L.ker.toAffineSubspace)
          (hfg v) (LinearMap.mem_ker.mpr hfL) (LinearMap.mem_ker.mpr hgL)
          (fun h => hqL (LinearMap.mem_ker.mp h))
      simpa only [Fintype.card_fin, matchFaceVertexLower, h1, hs, ite_true, ite_false] using m.matchFace_minimum_of_points hG root
        (p := ![f, g, q]) (by intro k; fin_cases k <;> first | exact hf | exact hg | exact hq) hi

end IndexedMatching
end BraunBruegge
