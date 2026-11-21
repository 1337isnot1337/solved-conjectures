import Conjectures.CircularIndexBase
import Mathlib.Combinatorics.SimpleGraph.Finite
import Mathlib.Data.ZMod.Basic

/-!
# Literal circulants and their edge parameterization

The graph in this file has vertices `ZMod (6*g+1)` and exactly the connection
lengths `1,...,2*g-2,2*g+1,3*g`.  The arithmetic base-class model is linked to
these actual undirected edges, rather than used as a substitute for the graph.
-/

namespace CircularIndex

instance order_neZero (g : ℕ) : NeZero (order g) := ⟨by simp [order]⟩

def graph (g : ℕ) : SimpleGraph (ZMod (order g)) where
  Adj x y := x ≠ y ∧ ∃ s : ℕ, AllowedLength g s ∧
    (y = x + (s : ZMod (order g)) ∨ x = y + (s : ZMod (order g)))
  symm := ⟨by
    rintro x y ⟨hne, s, hs, hxy | hyx⟩
    · exact ⟨hne.symm, s, hs, Or.inr hxy⟩
    · exact ⟨hne.symm, s, hs, Or.inl hyx⟩⟩
  loopless := ⟨by intro x h; exact h.1 rfl⟩

theorem allowedLength_bounds (g s : ℕ) (hg : 2 ≤ g) (hs : AllowedLength g s) :
    1 ≤ s ∧ s ≤ 3 * g := by
  simp only [AllowedLength] at hs
  omega

theorem natCast_injective_below (n a b : ℕ) (ha : a < n) (hb : b < n)
    (h : (a : ZMod n) = (b : ZMod n)) : a = b := by
  have hv := congrArg ZMod.val h
  simpa only [ZMod.val_natCast_of_lt ha, ZMod.val_natCast_of_lt hb] using hv

theorem length_cast_ne_zero (g s : ℕ) (hg : 2 ≤ g) (hs : AllowedLength g s) :
    (s : ZMod (order g)) ≠ 0 := by
  obtain ⟨hspos, hsle⟩ := allowedLength_bounds g s hg hs
  have hslt : s < order g := by simp only [order]; omega
  have hzero : 0 < order g := by simp only [order]; omega
  intro h
  have he := natCast_injective_below (order g) s 0 hslt hzero h
  omega

def lengthEdge (g s : ℕ) (x : ZMod (order g)) : Sym2 (ZMod (order g)) :=
  s(x, x + (s : ZMod (order g)))

theorem lengthEdge_mem (g s : ℕ) (hg : 2 ≤ g) (hs : AllowedLength g s)
    (x : ZMod (order g)) : lengthEdge g s x ∈ (graph g).edgeSet := by
  change (graph g).Adj x (x + (s : ZMod (order g)))
  refine ⟨?_, s, hs, Or.inl rfl⟩
  intro h
  apply length_cast_ne_zero g s hg hs
  exact add_left_cancel (show x + (s : ZMod (order g)) = x + 0 by simpa using h.symm)

theorem lengthEdge_injective (g s t : ℕ) (hg : 2 ≤ g)
    (hs : AllowedLength g s) (ht : AllowedLength g t)
    (x y : ZMod (order g)) (h : lengthEdge g s x = lengthEdge g t y) :
    s = t ∧ x = y := by
  obtain ⟨hspos, hsle⟩ := allowedLength_bounds g s hg hs
  obtain ⟨htpos, htle⟩ := allowedLength_bounds g t hg ht
  have hslt : s < order g := by simp only [order]; omega
  have htlt : t < order g := by simp only [order]; omega
  rcases Sym2.eq_iff.mp h with ⟨hxy, hst⟩ | ⟨hxt, hys⟩
  · refine ⟨?_, hxy⟩
    rw [hxy] at hst
    exact natCast_injective_below (order g) s t hslt htlt (add_left_cancel hst)
  · have hsum : ((s + t : ℕ) : ZMod (order g)) = 0 := by
      have : x + ((s : ZMod (order g)) + (t : ZMod (order g))) = x := by
        calc
          x + ((s : ZMod (order g)) + (t : ZMod (order g))) =
              (x + (s : ZMod (order g))) + (t : ZMod (order g)) := by ac_rfl
          _ = y + (t : ZMod (order g)) := by rw [hys]
          _ = x := hxt.symm
      simpa only [Nat.cast_add] using
        (add_left_cancel (show x + ((s : ZMod (order g)) + (t : ZMod (order g))) = x + 0 by
          simpa using this))
    have hstlt : s + t < order g := by simp only [order]; omega
    have hzero : 0 < order g := by simp only [order]; omega
    have he := natCast_injective_below (order g) (s + t) 0 hstlt hzero hsum
    omega

theorem edge_exists_length (g : ℕ) (_hg : 2 ≤ g) (e : (graph g).edgeSet) :
    ∃ s : ℕ, AllowedLength g s ∧ ∃ x : ZMod (order g), lengthEdge g s x = e.val := by
  rcases e with ⟨e, he⟩
  induction e using Sym2.ind with
  | _ x y =>
    rcases he with ⟨_, s, hs, hxy | hyx⟩
    · exact ⟨s, hs, x, Sym2.eq_iff.mpr (Or.inl ⟨rfl, hxy.symm⟩)⟩
    · exact ⟨s, hs, y, Sym2.eq_iff.mpr (Or.inr ⟨rfl, hyx.symm⟩)⟩

def baseStart (g ε j : ℕ) : ℕ :=
  if j = 0 ∧ ε = 0 then baseRight g ε j else baseLeft g ε j

theorem baseStart_length_pair (g ε j : ℕ) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hj : j < g) :
    s((baseStart g ε j : ZMod (order g)),
        (baseStart g ε j : ZMod (order g)) + (baseLength g ε j : ZMod (order g))) =
      s((baseLeft g ε j : ZMod (order g)), (baseRight g ε j : ZMod (order g))) := by
  by_cases h : j = 0 ∧ ε = 0
  · rcases h with ⟨rfl, rfl⟩
    have he : (4 * g : ℕ) + (2 * g + 1) = order g := by simp [order]; omega
    have hz : ((4 * g : ℕ) : ZMod (order g)) + ((2 * g + 1 : ℕ) : ZMod (order g)) = 0 := by
      rw [← Nat.cast_add, he]
      exact ZMod.natCast_self _
    simp only [baseStart, baseLeft, baseRight, baseLength, ↓reduceIte, and_self, Nat.cast_zero]
    rw [hz]
    exact Sym2.eq_swap
  · have he : baseLeft g ε j + baseLength g ε j = baseRight g ε j := by
      simp only [baseLeft, baseLength, baseRight]
      split_ifs <;> omega
    simp only [baseStart, h, ↓reduceIte]
    rw [← Nat.cast_add, he]

def translatedBaseEdge (g ε j : ℕ) (i : ZMod (order g)) : Sym2 (ZMod (order g)) :=
  s(i + (baseLeft g ε j : ZMod (order g)), i + (baseRight g ε j : ZMod (order g)))

theorem translatedBaseEdge_eq_lengthEdge (g ε j : ℕ) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hj : j < g) (i : ZMod (order g)) :
    translatedBaseEdge g ε j i = lengthEdge g (baseLength g ε j)
      (i + (baseStart g ε j : ZMod (order g))) := by
  have hp := congrArg (Sym2.map (fun x : ZMod (order g) => i + x))
    (baseStart_length_pair g ε j hg hε hj)
  simpa only [Sym2.map_mk, translatedBaseEdge, lengthEdge, add_assoc] using hp.symm

theorem translatedBaseEdge_mem (g ε j : ℕ) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hj : j < g) (i : ZMod (order g)) :
    translatedBaseEdge g ε j i ∈ (graph g).edgeSet := by
  rw [translatedBaseEdge_eq_lengthEdge g ε j hg hε hj]
  exact lengthEdge_mem g (baseLength g ε j) hg (baseLength_allowed g ε j hg hε hj) _

theorem translatedBaseEdge_injective (g ε η j k : ℕ) (hg : 2 ≤ g)
    (hε : ε ≤ 1) (hη : η ≤ 1) (hj : j < g) (hk : k < g)
    (x y : ZMod (order g))
    (h : translatedBaseEdge g ε j x = translatedBaseEdge g η k y) :
    ε = η ∧ j = k ∧ x = y := by
  rw [translatedBaseEdge_eq_lengthEdge g ε j hg hε hj,
    translatedBaseEdge_eq_lengthEdge g η k hg hη hk] at h
  obtain ⟨hl, hx⟩ := lengthEdge_injective g (baseLength g ε j) (baseLength g η k) hg
    (baseLength_allowed g ε j hg hε hj) (baseLength_allowed g η k hg hη hk) _ _ h
  obtain ⟨he, hjk⟩ := baseLength_injective g ε η j k hg hε hη hj hk hl
  subst η
  subst k
  exact ⟨rfl, rfl, add_right_cancel hx⟩

theorem translatedBaseEdge_surjective (g : ℕ) (hg : 2 ≤ g) (e : (graph g).edgeSet) :
    ∃ ε ≤ 1, ∃ j < g, ∃ x : ZMod (order g), translatedBaseEdge g ε j x = e.val := by
  obtain ⟨s, hs, y, hy⟩ := edge_exists_length g hg e
  obtain ⟨ε, hε, j, hj, hlen⟩ := baseLength_surjective g s hg hs
  refine ⟨ε, hε, j, hj, y - (baseStart g ε j : ZMod (order g)), ?_⟩
  rw [translatedBaseEdge_eq_lengthEdge g ε j hg hε hj, sub_add_cancel, hlen]
  exact hy

abbrev EdgeParam (g : ℕ) := Fin 2 × Fin g × ZMod (order g)

def edgeParamMap (g : ℕ) (hg : 2 ≤ g) (a : EdgeParam g) : (graph g).edgeSet :=
  ⟨translatedBaseEdge g a.1 a.2.1 a.2.2,
    translatedBaseEdge_mem g a.1 a.2.1 hg (by omega) a.2.1.isLt a.2.2⟩

theorem edgeParamMap_bijective (g : ℕ) (hg : 2 ≤ g) :
    Function.Bijective (edgeParamMap g hg) := by
  constructor
  · rintro ⟨ε, j, x⟩ ⟨η, k, y⟩ h
    have hh := congrArg Subtype.val h
    obtain ⟨he, hj, hx⟩ := translatedBaseEdge_injective g ε η j k hg
      (by omega) (by omega) j.isLt k.isLt x y hh
    have he' : ε = η := Fin.ext he
    have hj' : j = k := Fin.ext hj
    subst η
    subst k
    subst y
    rfl
  · intro e
    obtain ⟨ε, hε, j, hj, x, hx⟩ := translatedBaseEdge_surjective g hg e
    refine ⟨⟨⟨ε, by omega⟩, ⟨j, hj⟩, x⟩, ?_⟩
    exact Subtype.ext hx

noncomputable def edgeEquiv (g : ℕ) (hg : 2 ≤ g) : EdgeParam g ≃ (graph g).edgeSet :=
  Equiv.ofBijective (edgeParamMap g hg) (edgeParamMap_bijective g hg)

theorem card_edges (g : ℕ) (hg : 2 ≤ g) :
    Nat.card (graph g).edgeSet = 2 * g * order g := by
  rw [← Nat.card_congr (edgeEquiv g hg)]
  simp [EdgeParam, Nat.card_eq_fintype_card, ZMod.card, Nat.mul_assoc]

end CircularIndex
