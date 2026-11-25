import Conjectures.BraunBrueggeMinimumCompact
import Mathlib.Analysis.Convex.KreinMilman

/-! Nonempty oriented tight-edge faces supply vertices of the actual
normalized polar. A matching gives a disjoint family of these faces. -/

open Set

namespace BraunBruegge

variable {V : Type*}

def orientedEdgeFace (G : SimpleGraph V) (root : V) (E : Set (V × V)) : Set (V → ℝ) :=
  {f ∈ polar G root | ∀ uv ∈ E, f uv.2 - f uv.1 = 1}

theorem orientedEdgeFace_isClosed (G : SimpleGraph V) (root : V) (E : Set (V × V)) :
    IsClosed (orientedEdgeFace G root E) := by
  have he : orientedEdgeFace G root E = polar G root ∩ ⋂ uv ∈ E, {f | f uv.2 - f uv.1 = 1} := by
    ext f
    simp [orientedEdgeFace]
  rw [he]
  exact (polar_isClosed G root).inter <| isClosed_iInter fun uv => isClosed_iInter fun _ =>
    isClosed_eq ((continuous_apply uv.2).sub (continuous_apply uv.1)) continuous_const

theorem orientedEdgeFace_isExtreme (G : SimpleGraph V) (root : V) (E : Set (V × V))
    (hE : ∀ uv ∈ E, G.Adj uv.1 uv.2) : IsExtreme ℝ (polar G root) (orientedEdgeFace G root E) := by
  refine ⟨fun _ h => h.1, ?_⟩
  intro x hx y hy f hf hseg
  refine ⟨hx, ?_⟩
  intro uv huv
  obtain ⟨a, b, ha, hb, hab, h⟩ := hseg
  have h₀ := congrFun h uv.1
  have h₁ := congrFun h uv.2
  change a * x uv.1 + b * y uv.1 = f uv.1 at h₀
  change a * x uv.2 + b * y uv.2 = f uv.2 at h₁
  have ht := hf.2 uv huv
  have he := (hE uv huv).symm
  have e := endpoint_eq_of_tight (z := f uv.2 - f uv.1) ha hb hab (hx.2 he) (hy.2 he)
    (by linear_combination h₁ - h₀) (by rw [ht, abs_one])
  exact e.trans ht

theorem exists_polar_vertex_of_nonempty_orientedEdgeFace [Fintype V] {G : SimpleGraph V}
    (hG : G.Connected) (root : V) (E : Set (V × V)) (hE : ∀ uv ∈ E, G.Adj uv.1 uv.2)
    (hn : (orientedEdgeFace G root E).Nonempty) :
    ∃ f ∈ orientedEdgeFace G root E, f ∈ (polar G root).extremePoints ℝ := by
  have hf := orientedEdgeFace_isExtreme G root E hE
  have hc := (polar_isCompact hG root).of_isClosed_subset (orientedEdgeFace_isClosed G root E) hf.subset
  obtain ⟨f, h⟩ := hc.extremePoints_nonempty hn
  exact ⟨f, h.1, hf.extremePoints_subset_extremePoints h⟩

def swapEnds {M : Type*} (d : M → Bool) : M ⊕ M ≃ M ⊕ M where
  toFun := Sum.elim (fun i => if d i then .inl i else .inr i) (fun i => if d i then .inr i else .inl i)
  invFun := Sum.elim (fun i => if d i then .inl i else .inr i) (fun i => if d i then .inr i else .inl i)
  left_inv v := by cases v with | inl i | inr i => cases he : d i <;> simp [he]
  right_inv v := by cases v with | inl i | inr i => cases he : d i <;> simp [he]

private def low {M : Type*} (m : M ⊕ M ↪ V) (d : M → Bool) (i : M) : V := m (swapEnds d (.inl i))

private def high {M : Type*} (m : M ⊕ M ↪ V) (d : M → Bool) (i : M) : V := m (swapEnds d (.inr i))

private theorem low_ne_high {M : Type*} (m : M ⊕ M ↪ V) (d : M → Bool) (i j : M) :
    low m d i ≠ high m d j := by
  intro h
  exact Sum.inl_ne_inr ((swapEnds d).injective (m.injective h))

private def matchingEdges {M : Type*} (m : M ⊕ M ↪ V) (d : M → Bool) : Set (V × V) :=
  Set.range (fun i : M => (low m d i, high m d i))

private theorem matchingEdges_adj {M : Type*} {G : SimpleGraph V} (m : M ⊕ M ↪ V)
    (hm : ∀ i : M, G.Adj (m (.inl i)) (m (.inr i))) (d : M → Bool) :
    ∀ uv ∈ matchingEdges m d, G.Adj uv.1 uv.2 := by
  rintro _ ⟨i, rfl⟩
  cases e : d i
  · simpa [low, high, swapEnds, e] using (hm i).symm
  · simpa [low, high, swapEnds, e] using hm i

private theorem matchingFace_nonempty {M : Type*} (G : SimpleGraph V) (root : V)
    (m : M ⊕ M ↪ V) (d : M → Bool) : (orientedEdgeFace G root (matchingEdges m d)).Nonempty := by
  classical
  let label (x : V) : ℝ := if x ∈ Set.range (high m d) then 1 else
    if x ∈ Set.range (low m d) then 0 else 1 / 2
  have hhi (i : M) : label (high m d i) = 1 := by simp [label]
  have hlo (i : M) : label (low m d i) = 0 := by
    have hx : low m d i ∉ Set.range (high m d) := by
      rintro ⟨j, he⟩
      exact low_ne_high m d i j he.symm
    simp only [label, hx, ite_false, Set.mem_range_self, ite_true]
  have hb (v : V) : 0 ≤ label v ∧ label v ≤ 1 := by
    unfold label
    split_ifs <;> norm_num
  let f (v : V) := label v - label root
  refine ⟨f, ⟨by simp [f], ?_⟩, ?_⟩
  · intro u v _
    apply abs_le.mpr
    dsimp [f]
    constructor <;> linarith [(hb u).1, (hb u).2, (hb v).1, (hb v).2]
  · rintro _ ⟨i, rfl⟩
    change f (high m d i) - f (low m d i) = 1
    unfold f
    rw [hhi, hlo]
    ring

private theorem distinct_orientations_disjoint {M : Type*} {G : SimpleGraph V} (root : V)
    (m : M ⊕ M ↪ V) {a b : M → Bool} {f : V → ℝ}
    (ha : f ∈ orientedEdgeFace G root (matchingEdges m a))
    (hb : f ∈ orientedEdgeFace G root (matchingEdges m b)) : a = b := by
  funext i
  have h₁ := ha.2 (low m a i, high m a i) ⟨i, rfl⟩
  have h₂ := hb.2 (low m b i, high m b i) ⟨i, rfl⟩
  cases ea : a i <;> cases eb : b i <;> simp [ea, eb, low, high, swapEnds] at h₁ h₂ ⊢ <;> linarith

/-- Every matching of size `m` supplies `2^m` distinct vertices through its
two orientations on each edge. Later matching arguments can impose extra
tight equalities inside these same faces. -/
theorem pow_card_matching_le_polar_vertices [Fintype V] {M : Type*} [Fintype M]
    {G : SimpleGraph V} (hG : G.Connected) (root : V) (m : M ⊕ M ↪ V)
    (hm : ∀ i : M, G.Adj (m (.inl i)) (m (.inr i))) :
    2 ^ Fintype.card M ≤ Nat.card ((polar G root).extremePoints ℝ) := by
  classical
  have : Finite ((polar G root).extremePoints ℝ) := finite_polar_vertices hG root
  have h (d : M → Bool) := exists_polar_vertex_of_nonempty_orientedEdgeFace hG root
    (matchingEdges m d) (matchingEdges_adj m hm d) (matchingFace_nonempty G root m d)
  let f (d : M → Bool) : ((polar G root).extremePoints ℝ) := ⟨(h d).choose, (h d).choose_spec.2⟩
  have hi : Function.Injective f := by
    intro a b e
    have eq : (h a).choose = (h b).choose := congrArg Subtype.val e
    exact distinct_orientations_disjoint root m (h a).choose_spec.1 (eq ▸ (h b).choose_spec.1)
  simpa [Nat.card_eq_fintype_card] using Nat.card_le_card_of_injective f hi

end BraunBruegge
