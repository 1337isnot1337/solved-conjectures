import Conjectures.BraunBrueggeMinimumUncoveredFaces
import Conjectures.BraunBrueggeMinimumBipartiteComparison

/-! Each orientation and independent choice at uncovered vertices gives a distinct facet. -/

open Set

namespace BraunBruegge

variable {V M : Type*} {G : SimpleGraph V}

namespace IndexedMatching

variable (m : IndexedMatching G M)

def orient (d : M → Bool) : IndexedMatching G M where
  endpoints := (swapEnds d).toEmbedding.trans m.endpoints
  edge i := by
    change G.Adj (m.endpoints (swapEnds d (.inl i))) (m.endpoints (swapEnds d (.inr i)))
    cases he : d i
    · simpa [swapEnds, he] using (m.edge i).symm
    · simpa [swapEnds, he] using m.edge i

theorem unmatched_orient (d : M → Bool) (v : V) : (m.orient d).Unmatched v ↔ m.Unmatched v := by
  unfold Unmatched
  apply not_congr
  constructor
  · rintro ⟨i, rfl⟩
    exact ⟨swapEnds d i, rfl⟩
  · rintro ⟨i, rfl⟩
    refine ⟨(swapEnds d).symm i, ?_⟩
    change m.endpoints (swapEnds d ((swapEnds d).symm i)) = m.endpoints i
    rw [Equiv.apply_symm_apply]

def uncoveredOrientEquiv (d : M → Bool) : (m.orient d).Uncovered ≃ m.Uncovered where
  toFun u := ⟨u.val, (m.unmatched_orient d u.val).mp u.property⟩
  invFun u := ⟨u.val, (m.unmatched_orient d u.val).mpr u.property⟩
  left_inv _ := rfl
  right_inv _ := rfl

theorem orientations_eq_of_pair_tight {a b : M → Bool} {f : V → ℝ}
    (ha : ∀ i, f ((m.orient a).high i) - f ((m.orient a).low i) = 1)
    (hb : ∀ i, f ((m.orient b).high i) - f ((m.orient b).low i) = 1) : a = b := by
  funext i
  have h₁ := ha i
  have h₂ := hb i
  cases ea : a i <;> cases eb : b i <;>
    simp [high, low, orient, swapEnds, ea, eb] at h₁ h₂ ⊢ <;> linarith

theorem pow_card_matching_add_uncovered_le_facets [Fintype V] [DecidableEq V] [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) (root : V) :
    2 ^ (Fintype.card M + Nat.card m.Uncovered) ≤ Nat.card {F // IsFacet G F} := by
  classical
  rw [← Nat.card_congr (polarVerticesEquivFacets hG root)]
  let : Finite ((polar G root).extremePoints ℝ) := finite_polar_vertices hG root
  let : Fintype m.Uncovered := Fintype.ofFinite _
  let bits := (M → Bool) × (m.Uncovered → Bool)
  have h (c : bits) := (m.orient c.1).exists_vertex_with_uncovered_choices
    (show (m.orient c.1).IsMaximum from hm) hG root (c.2 ∘ m.uncoveredOrientEquiv c.1)
  let f (c : bits) : (polar G root).extremePoints ℝ := ⟨(h c).choose, (h c).choose_spec.2⟩
  have hi : Function.Injective f := by
    rintro ⟨a, b⟩ ⟨d, c⟩ he
    have he' : (h (a, b)).choose = (h (d, c)).choose := congrArg Subtype.val he
    have h₁ := (h (a, b)).choose_spec.1
    have h₂ := (h (d, c)).choose_spec.1
    rw [← he'] at h₂
    have hd : a = d := m.orientations_eq_of_pair_tight
      ((m.orient a).pair_edges_tight_of_mem_uncoveredFace hm hG h₁)
      ((m.orient d).pair_edges_tight_of_mem_uncoveredFace hm hG h₂)
    subst d
    have hc := (m.orient a).uncoveredFaces_disjoint hm hG h₁ h₂
    congr 1
    funext u
    simpa only [Function.comp_apply, Equiv.apply_symm_apply] using congrFun hc ((m.uncoveredOrientEquiv a).symm u)
  rw [pow_add, Nat.card_eq_fintype_card (α := m.Uncovered)]
  simpa [bits, Nat.card_eq_fintype_card (α := bits)] using Nat.card_le_card_of_injective f hi

theorem balancedFacetMinimum_lt_of_two_uncovered [Fintype V] [DecidableEq V] [Fintype M] [Nontrivial V]
    (hm : m.IsMaximum) (hG : G.Connected) (root : V) (hr : 2 ≤ Nat.card m.Uncovered) :
    balancedFacetMinimum (Fintype.card V) < Nat.card {F // IsFacet G F} := by
  have he := m.card_eq
  have hb := m.pow_card_matching_add_uncovered_le_facets hm hG root
  let k := Fintype.card V / 2
  have hk : Fintype.card V = 2 * k ∨ Fintype.card V = 2 * k + 1 := by omega
  rcases hk with hk | hk
  · rw [hk, balancedFacetMinimum_even]
    have hpow : (2 : ℕ) ^ (k + 1) ≤ 2 ^ (Fintype.card M + Nat.card m.Uncovered) :=
      Nat.pow_le_pow_right (by decide) (by omega)
    have hp : 0 < (2 : ℕ) ^ (k + 1) := by positivity
    omega
  · rw [hk, balancedFacetMinimum_odd]
    have hpow : (2 : ℕ) ^ (k + 2) ≤ 2 ^ (Fintype.card M + Nat.card m.Uncovered) :=
      Nat.pow_le_pow_right (by decide) (by omega)
    rw [pow_add] at hpow
    norm_num at hpow
    have hp : 0 < (2 : ℕ) ^ k := by positivity
    omega

end IndexedMatching
end BraunBruegge
