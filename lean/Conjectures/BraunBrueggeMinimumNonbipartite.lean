import Conjectures.BraunBrueggeMinimumRecoveryCount

/-! Matching-face vertices and the vertices recovered by a single flip give
strictly more facets than the balanced minimum in a nonbipartite graph. -/

open Set

namespace BraunBruegge

variable {V M : Type*} {G : SimpleGraph V}

namespace IndexedMatching

variable (m : IndexedMatching G M)

private theorem sum_matchFaceVertexLower_le_inside [Fintype V] [Fintype M] [DecidableEq M] [Nonempty M]
    (hG : G.Connected) (root : V) (hr : Nat.card m.Uncovered ≤ 1) :
    (∑ d : M → Bool, (m.orient d).matchFaceVertexLower (Nat.card m.Uncovered)) ≤
      Nat.card (m.InsideVertex root) := by
  classical
  let P := (polar G root).extremePoints ℝ
  let : Finite P := finite_polar_vertices hG root
  let Q (d : M → Bool) := ((m.orient d).MatchFace root).extremePoints ℝ
  have hsub (d : M → Bool) : Q d ⊆ P := ((m.orient d).matchFace_extreme root).extremePoints_subset_extremePoints
  let finiteQ (d : M → Bool) : Finite (Q d) :=
    Finite.of_injective (Set.inclusion (hsub d)) (Set.inclusion_injective _)
  let fintypeQ (d : M → Bool) : Fintype (Q d) := @Fintype.ofFinite _ (finiteQ d)
  let number (d : M → Bool) := (m.orient d).matchFaceVertexLower (Nat.card m.Uncovered)
  have h (d : M → Bool) : number d ≤ @Fintype.card (Q d) (fintypeQ d) := by
    have hr' := Nat.card_congr (m.uncoveredOrientEquiv d)
    rw [← Nat.card_eq_fintype_card]
    change (m.orient d).matchFaceVertexLower (Nat.card m.Uncovered) ≤ Nat.card (Q d)
    rw [← hr']
    exact (m.orient d).matchFaceVertexLower_le_card hG root (hr'.symm ▸ hr)
  let pick (d : M → Bool) : Fin (number d) ↪ Q d := by
    let : Fintype (Q d) := fintypeQ d
    exact (Fin.castLEEmb (h d)).trans (Fintype.equivFin (Q d)).symm.toEmbedding
  let toInside (p : Σ d : M → Bool, Fin (number d)) : m.InsideVertex root :=
    let v := pick p.1 p.2
    ⟨⟨v.val, hsub p.1 v.property⟩, ⟨p.1, v.property.1⟩⟩
  have hi : Function.Injective toInside := by
    rintro ⟨d, i⟩ ⟨e, j⟩ he
    have hp : (pick d i).val = (pick e j).val := congrArg (fun v => v.val.val) he
    have hpe : (pick d i).val ∈ (m.orient e).MatchFace root := hp.symm ▸ (pick e j).property.1
    have hd : d = e := m.orientations_eq_of_pair_tight
      ((m.orient d).matchFace_tight (pick d i).property.1)
      ((m.orient e).matchFace_tight hpe)
    subst e
    have hje : i = j := (pick d).injective (Subtype.ext hp)
    subst j
    rfl
  have hc := Nat.card_le_card_of_injective toInside hi
  rw [Nat.card_eq_fintype_card, Fintype.card_sigma] at hc
  simpa only [Fintype.card_fin, number] using hc

theorem almostPerfect_facet_lower [Fintype V] [DecidableEq V] [Nontrivial V] [Fintype M] [Nonempty M]
    (hm : m.IsMaximum) (hG : G.Connected) (hn : ¬G.IsBipartite) (root : V)
    (hr : Nat.card m.Uncovered ≤ 1) :
    (2 + Nat.card m.Uncovered) * 2 ^ Fintype.card M ≤ Nat.card {F // IsFacet G F} := by
  classical
  let n := Nat.card m.Uncovered
  let p (d : M → Bool) := (m.orient d).Strong
  let : Fintype m.StrongOrientation := Fintype.ofFinite _
  have hs : (∑ d : M → Bool, if p d then 1 else 0) = Nat.card m.StrongOrientation := by
    rw [Finset.sum_boole, Nat.card_eq_fintype_card]
    exact (Fintype.card_subtype p).symm
  have hterm (d : M → Bool) :
      (m.orient d).matchFaceVertexLower n + (if p d then 1 else 0) = 2 + n := by
    by_cases he : p d <;> simp only [p, matchFaceVertexLower] at he ⊢ <;> simp [he] <;> omega
  have htotal : (∑ d : M → Bool, (m.orient d).matchFaceVertexLower n) + Nat.card m.StrongOrientation =
      (2 + n) * 2 ^ Fintype.card M := by
    rw [← hs, ← Finset.sum_add_distrib]
    simp only [hterm, Finset.sum_const, Finset.card_univ, Fintype.card_fun, Fintype.card_bool, smul_eq_mul]
    exact Nat.mul_comm _ _
  have hi := m.sum_matchFaceVertexLower_le_inside hG root hr
  have ho := m.strongOrientations_le_outside hm hG hn root
  let : Finite ((polar G root).extremePoints ℝ) := finite_polar_vertices hG root
  let q (v : (polar G root).extremePoints ℝ) := ∃ d : M → Bool, v.val ∈ (m.orient d).MatchFace root
  have hc := Nat.card_congr (Equiv.sumCompl q)
  change Nat.card (m.InsideVertex root ⊕ m.OutsideVertex root) = Nat.card ((polar G root).extremePoints ℝ) at hc
  rw [Nat.card_sum, Nat.card_congr (polarVerticesEquivFacets hG root)] at hc
  exact htotal.symm.trans_le ((Nat.add_le_add hi ho).trans_eq hc)

end IndexedMatching

theorem balancedFacetMinimum_lt_nonbipartite [Fintype V] [DecidableEq V] [Nontrivial V]
    (hG : G.Connected) (hn : ¬G.IsBipartite) (root : V) :
    balancedFacetMinimum (Fintype.card V) < Nat.card {F // IsFacet G F} := by
  obtain ⟨k, m, hm⟩ := exists_maximum_matching G
  by_cases hr : 2 ≤ Nat.card m.Uncovered
  · exact m.balancedFacetMinimum_lt_of_two_uncovered hm hG root hr
  have hcard := m.card_eq
  rw [Fintype.card_fin] at hcard
  have hnV := Fintype.one_lt_card (α := V)
  let : Nonempty (Fin k) := ⟨⟨0, by omega⟩⟩
  have h := m.almostPerfect_facet_lower hm hG hn root (by omega)
  rw [Fintype.card_fin] at h
  have hu : Nat.card m.Uncovered = 0 ∨ Nat.card m.Uncovered = 1 := by omega
  rcases hu with hu | hu
  · rw [hu, add_zero] at h hcard
    rw [hcard, balancedFacetMinimum_even, pow_succ]
    have hp : 0 < (2 : ℕ) ^ k := by positivity
    omega
  · rw [hu] at h hcard
    rw [hcard, balancedFacetMinimum_odd]
    have hp : 0 < (2 : ℕ) ^ k := by positivity
    omega

end BraunBruegge
