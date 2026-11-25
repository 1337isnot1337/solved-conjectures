import Conjectures.BraunBrueggeMinimumBipartiteFacets
import Mathlib.Combinatorics.SimpleGraph.Metric

/-! Every connected bipartite graph has at least the facet count of its
complete bipartite supergraph. A missing cross-edge gives a new facet via
the distance potential. -/

namespace BraunBruegge

variable {L R : Type*} [Fintype L] [Fintype R] [DecidableEq L] [DecidableEq R] [Nonempty R]

private abbrev K := completeBipartiteGraph L R

private def parityColor (v : L ⊕ R) : ℕ := if v.isLeft then 1 else 0

omit [Fintype L] [Fintype R] [DecidableEq L] [DecidableEq R] [Nonempty R] in
private theorem adjacent_color_ne {u v : L ⊕ R} (h : (K (L := L) (R := R)).Adj u v) :
    parityColor u ≠ parityColor v := by
  cases u <;> cases v <;> simp [K, completeBipartiteGraph, parityColor] at h ⊢

omit [Fintype L] [Fintype R] [DecidableEq L] [DecidableEq R] [Nonempty R] in
private theorem walk_color_parity {G : SimpleGraph (L ⊕ R)} (hK : G ≤ K) {u v : L ⊕ R}
    (p : G.Walk u v) : (p.length + parityColor u) % 2 = parityColor v := by
  induction p with
  | nil =>
    simp only [SimpleGraph.Walk.length_nil, zero_add]
    unfold parityColor
    split_ifs <;> decide
  | @cons u w v e p ih =>
    have hn := adjacent_color_ne (hK e)
    rw [SimpleGraph.Walk.length_cons]
    cases u <;> cases w <;> simp [parityColor] at hn ih ⊢ <;> omega

private noncomputable def distancePotential (G : SimpleGraph (L ⊕ R)) (a root : L ⊕ R) (v : L ⊕ R) : ℝ :=
  (G.dist a v : ℝ) - G.dist a root

omit [DecidableEq L] [DecidableEq R] [Nonempty R] in
private theorem distancePotential_vertex {G : SimpleGraph (L ⊕ R)} (hG : G.Connected) (hK : G ≤ K)
    (a root : L ⊕ R) : distancePotential G a root ∈ (polar G root).extremePoints ℝ := by
  have parity (v : L ⊕ R) : (G.dist a v + parityColor a) % 2 = parityColor v := by
    obtain ⟨p, hp⟩ := hG.exists_walk_length_eq_dist a v
    exact hp ▸ walk_color_parity hK p
  have tight {u v : L ⊕ R} (e : G.Adj u v) :
      |distancePotential G a root u - distancePotential G a root v| = 1 := by
    have h₁ : G.dist a u ≤ G.dist a v + 1 := by
      simpa [(SimpleGraph.dist_eq_one_iff_adj).mpr e.symm] using
        (hG.dist_triangle (u := a) (v := v) (w := u))
    have h₂ : G.dist a v ≤ G.dist a u + 1 := by
      simpa [(SimpleGraph.dist_eq_one_iff_adj).mpr e] using
        (hG.dist_triangle (u := a) (v := u) (w := v))
    have hne : G.dist a u ≠ G.dist a v := by
      intro he
      have h := parity u
      rw [he, parity v] at h
      exact adjacent_color_ne (hK e) h.symm
    have hd : G.dist a u = G.dist a v + 1 ∨ G.dist a v = G.dist a u + 1 := by omega
    have he : distancePotential G a root u - distancePotential G a root v =
        (G.dist a u : ℝ) - (G.dist a v : ℝ) := by unfold distancePotential; ring
    rw [he]
    rcases hd with h | h
    · rw [h, Nat.cast_add, Nat.cast_one, add_sub_cancel_left]
      norm_num
    · rw [h, Nat.cast_add, Nat.cast_one]
      have eq : (G.dist a u : ℝ) - ((G.dist a u : ℝ) + 1) = -1 := by ring
      rw [eq, abs_neg, abs_one]
  have ht : tightGraph G (distancePotential G a root) = G := by
    ext u v
    exact ⟨fun h => h.1, fun e => ⟨e, tight e⟩⟩
  exact mem_extreme_polar_iff.mpr ⟨⟨by simp [distancePotential], fun _ _ h => (tight h).le⟩, ht.symm ▸ hG⟩

private def includeVertex {G : SimpleGraph (L ⊕ R)} (hG : G.Connected) (hK : G ≤ K) (root : L) :
    (polar (K (L := L) (R := R)) (.inl root)).extremePoints ℝ ↪ (polar G (.inl root)).extremePoints ℝ where
  toFun f := ⟨f.val, by
    have ht := tightGraph_eq_of_bipartition Sum.isLeft
      (by intro u v h; cases u <;> cases v <;> simp [K, completeBipartiteGraph] at h ⊢) f.property
    have h : ∀ ⦃u v⦄, G.Adj u v → |f.val u - f.val v| = 1 := by
      intro u v e
      have he : (tightGraph K f.val).Adj u v := ht.symm ▸ hK e
      exact he.2
    have eq : tightGraph G f.val = G := by
      ext u v
      exact ⟨fun he => he.1, fun e => ⟨e, h e⟩⟩
    exact mem_extreme_polar_iff.mpr ⟨⟨f.property.1.1, fun _ _ e => (h e).le⟩, eq.symm ▸ hG⟩⟩
  inj' := fun _ _ e => Subtype.ext (congrArg
    (fun q : (polar G (.inl root)).extremePoints ℝ => q.val) e)

omit [Fintype L] [Fintype R] [DecidableEq L] [DecidableEq R] in
private theorem nontrivial_sum (root : L) : Nontrivial (L ⊕ R) := by
  obtain ⟨r⟩ := (inferInstance : Nonempty R)
  exact ⟨⟨.inl root, .inr r, Sum.inl_ne_inr⟩⟩

theorem complete_bipartite_facets_le {G : SimpleGraph (L ⊕ R)} (hG : G.Connected) (hK : G ≤ K)
    (root : L) : 2 ^ Fintype.card L + 2 ^ Fintype.card R - 2 ≤ Nat.card {F // IsFacet G F} := by
  have := nontrivial_sum (R := R) root
  have := finite_polar_vertices hG (.inl root)
  rw [← card_complete_bipartite_polar_vertices (R := R) root,
    ← Nat.card_congr (polarVerticesEquivFacets hG (.inl root))]
  exact Nat.card_le_card_of_injective _ (includeVertex hG hK root).injective

theorem complete_bipartite_facets_lt {G : SimpleGraph (L ⊕ R)} (hG : G.Connected) (hK : G ≤ K)
    (hne : G ≠ K) (root : L) : 2 ^ Fintype.card L + 2 ^ Fintype.card R - 2 < Nat.card {F // IsFacet G F} := by
  classical
  have := nontrivial_sum (R := R) root
  have := finite_polar_vertices hG (.inl root)
  have := finite_complete_bipartite_polar_vertices (R := R) root
  have hmissing : ∃ u v, (K (L := L) (R := R)).Adj u v ∧ ¬G.Adj u v := by
    by_contra! h
    exact hne (le_antisymm hK h)
  obtain ⟨u, v, e, hm⟩ := hmissing
  let p : (polar G (.inl root)).extremePoints ℝ :=
    ⟨distancePotential G u (.inl root), distancePotential_vertex hG hK u (.inl root)⟩
  have hp (f : (polar (K (L := L) (R := R)) (.inl root)).extremePoints ℝ) :
      includeVertex hG hK root f ≠ p := by
    intro he
    have eq : f.val = distancePotential G u (.inl root) := congrArg Subtype.val he
    have hdist := hG.one_lt_dist_of_ne_of_not_adj e.ne hm
    have hbound := f.property.1.2 e.symm
    rw [eq] at hbound
    have hh : distancePotential G u (.inl root) v - distancePotential G u (.inl root) u =
        (G.dist u v : ℝ) := by simp [distancePotential]
    rw [hh, abs_of_nonneg (by positivity)] at hbound
    exact (not_le_of_gt hdist) (by exact_mod_cast hbound)
  let : Fintype ((polar (K (L := L) (R := R)) (.inl root)).extremePoints ℝ) := Fintype.ofFinite _
  let : Fintype ((polar G (.inl root)).extremePoints ℝ) := Fintype.ofFinite _
  have hcard := Fintype.card_lt_of_injective_of_notMem (includeVertex hG hK root)
    (includeVertex hG hK root).injective (b := p) (by rintro ⟨f, hf⟩; exact hp f hf)
  rw [← card_complete_bipartite_polar_vertices (R := R) root,
    ← Nat.card_congr (polarVerticesEquivFacets hG (.inl root))]
  simpa [Nat.card_eq_fintype_card] using hcard

private def balancedPowerSum (n : ℕ) : ℕ := 2 ^ (n / 2) + 2 ^ ((n + 1) / 2)

private theorem balanced_powers_sorted (a b : ℕ) (hab : a ≤ b) :
    balancedPowerSum (a + b) ≤ 2 ^ a + 2 ^ b ∧
      (balancedPowerSum (a + b) = 2 ^ a + 2 ^ b ↔ b ≤ a + 1) := by
  generalize hd : b - a = d
  induction d using Nat.strong_induction_on generalizing a b with
  | h d ih =>
    by_cases hclose : b ≤ a + 1
    · have ha : (a + b) / 2 = a := by omega
      have hb : (a + b + 1) / 2 = b := by omega
      simp [balancedPowerSum, ha, hb, hclose]
    · have hsorted : a + 1 ≤ b - 1 := by omega
      have hsmall : b - 1 - (a + 1) < d := by omega
      have hIH := (ih (b - 1 - (a + 1)) hsmall (a + 1) (b - 1) hsorted rfl).1
      rw [show a + 1 + (b - 1) = a + b by omega] at hIH
      have hpow : (2 : ℕ) ^ a < 2 ^ (b - 1) := Nat.pow_lt_pow_right (by decide) (by omega)
      have hleft : (2 : ℕ) ^ (a + 1) = 2 ^ a * 2 := by rw [pow_succ]
      have hright : (2 : ℕ) ^ b = 2 ^ (b - 1) * 2 := by
        nth_rw 1 [← Nat.sub_add_cancel (show 1 ≤ b by omega)]
        rw [pow_succ]
      have hlt : balancedPowerSum (a + b) < 2 ^ a + 2 ^ b := by omega
      exact ⟨hlt.le, by simp [hclose, hlt.ne]⟩

def balancedFacetMinimum (n : ℕ) : ℕ := balancedPowerSum n - 2

theorem balancedFacetMinimum_even (k : ℕ) : balancedFacetMinimum (2 * k) = 2 ^ (k + 1) - 2 := by
  rw [balancedFacetMinimum, balancedPowerSum, show 2 * k / 2 = k by omega,
    show (2 * k + 1) / 2 = k by omega, pow_succ]
  omega

theorem balancedFacetMinimum_odd (k : ℕ) : balancedFacetMinimum (2 * k + 1) = 3 * 2 ^ k - 2 := by
  rw [balancedFacetMinimum, balancedPowerSum, show (2 * k + 1) / 2 = k by omega,
    show (2 * k + 1 + 1) / 2 = k + 1 by omega, pow_succ]
  omega

theorem balanced_complete_bipartite_minimum {G : SimpleGraph (L ⊕ R)} (hG : G.Connected)
    (hK : G ≤ K) (root : L) :
    let a := Fintype.card L
    let b := Fintype.card R
    let minimum := balancedFacetMinimum (a + b)
    minimum ≤ Nat.card {F // IsFacet G F} ∧
      (minimum = Nat.card {F // IsFacet G F} ↔ G = K ∧ a ≤ b + 1 ∧ b ≤ a + 1) := by
  let a := Fintype.card L
  let b := Fintype.card R
  change balancedPowerSum (a + b) - 2 ≤ Nat.card {F // IsFacet G F} ∧
    (balancedPowerSum (a + b) - 2 = Nat.card {F // IsFacet G F} ↔ G = K ∧ a ≤ b + 1 ∧ b ≤ a + 1)
  have hpow : balancedPowerSum (a + b) ≤ 2 ^ a + 2 ^ b ∧
      (balancedPowerSum (a + b) = 2 ^ a + 2 ^ b ↔ a ≤ b + 1 ∧ b ≤ a + 1) := by
    by_cases h : a ≤ b
    · have ha : a ≤ b + 1 := by omega
      simpa only [ha, true_and] using balanced_powers_sorted a b h
    · have hb : b ≤ a + 1 := by omega
      have h' : b ≤ a := by omega
      simpa only [add_comm b a, add_comm ((2 : ℕ) ^ b) (2 ^ a), hb, and_true] using
        balanced_powers_sorted b a h'
  have hl : 2 ^ a + 2 ^ b - 2 ≤ Nat.card {F // IsFacet G F} := complete_bipartite_facets_le hG hK root
  have h2 : 2 ≤ balancedPowerSum (a + b) := by
    have ha : 0 < (2 : ℕ) ^ ((a + b) / 2) := by positivity
    have hb : 0 < (2 : ℕ) ^ ((a + b + 1) / 2) := by positivity
    unfold balancedPowerSum
    omega
  refine ⟨by omega, ?_⟩
  constructor
  · intro he
    have hg : G = K := by
      by_contra hg
      have hlt : 2 ^ a + 2 ^ b - 2 < Nat.card {F // IsFacet G F} :=
        complete_bipartite_facets_lt hG hK hg root
      omega
    exact ⟨hg, hpow.2.mp (by omega)⟩
  · rintro ⟨rfl, ha, hb⟩
    rw [hpow.2.mpr ⟨ha, hb⟩, card_complete_bipartite_facets root]

end BraunBruegge
