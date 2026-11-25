import Conjectures.CaioloFerroniHosterRankPositivity
import Mathlib.Combinatorics.Matroid.Closure
import Mathlib.Combinatorics.Matroid.Rank.ENat
import Mathlib.Combinatorics.Matroid.Rank.Finite

/-! # The lattice of flats of a finite matroid as a `FlatSystem` -/

set_option linter.unusedSectionVars false

namespace CaioloFerroniHoster.Ranks

open Set
open scoped Classical

noncomputable section

variable {E : Type*} [Finite E] (M : Matroid E)

/-- Flats of `M`. -/
abbrev Flats := {F : Set E // M.IsFlat F}

instance : Fintype (Flats M) := Fintype.ofFinite _

instance : OrderBot (Flats M) where
  bot := ⟨M.closure ∅, M.isFlat_closure ∅⟩
  bot_le F := by
    change M.closure ∅ ⊆ F.1
    rw [← F.2.closure]
    exact M.closure_subset_closure (empty_subset _)

instance : OrderTop (Flats M) where
  top := ⟨M.E, M.ground_isFlat⟩
  le_top F := F.2.subset_ground

/-- Rank of a flat. -/
def flatRk (F : Flats M) : ℕ := (M.eRk F.1).toNat

theorem flatRk_coe (F : Flats M) : (flatRk M F : ℕ∞) = M.eRk F.1 :=
  ENat.natCast_toNat ((M.eRk_le_encard _).trans_lt (Set.toFinite _).encard_lt_top).ne

private def enc (e : E) : ℕ := (Finite.equivFin E e).val

private theorem enc_inj : Function.Injective (enc (E := E)) := fun _ _ h =>
  (Finite.equivFin E).injective (Fin.ext h)

private def add (F : Flats M) (n : ℕ) : Flats M :=
  ⟨M.closure (F.1 ∪ {e | enc e = n}), M.isFlat_closure _⟩

private theorem add_eq (F : Flats M) (e : E) :
    (add M F (enc e)).1 = M.closure (insert e F.1) := by
  have : {x : E | enc x = enc e} = {e} := by ext x; simp [enc_inj.eq_iff]
  simp only [add, this, Set.union_singleton]

private theorem notMem_cl {F : Flats M} {e : E} (h : e ∉ F.1) : e ∉ M.closure F.1 := by
  rwa [F.2.closure]

/-- The flats of a finite matroid. -/
def flatSystem : FlatSystem (Flats M) where
  rk := flatRk M
  mem n F := ∃ e ∈ F.1, enc e = n
  join := add M
  rk_bot := by
    change (M.eRk (M.closure ∅)).toNat = 0
    rw [M.eRk_closure_eq, M.eRk_empty]; rfl
  rk_mono := by
    intro F G h
    obtain ⟨e, heG, heF⟩ := Set.exists_of_ssubset (show F.1 ⊂ G.1 from h)
    have h1 : M.eRk (insert e F.1) = M.eRk F.1 + 1 :=
      M.eRk_insert_eq_add_one ⟨G.2.subset_ground heG, notMem_cl M heF⟩
    have h2 : M.eRk (insert e F.1) ≤ M.eRk G.1 :=
      M.eRk_mono (Set.insert_subset heG (show F.1 ⊆ G.1 from h.le))
    rw [h1, ← flatRk_coe, ← flatRk_coe] at h2
    have h3 : flatRk M F + 1 ≤ flatRk M G := by exact_mod_cast h2
    omega
  le_iff F G := by
    constructor
    · rintro h n ⟨e, he, rfl⟩; exact ⟨e, h he, rfl⟩
    · intro h e he
      obtain ⟨e', he', heq⟩ := h _ ⟨e, he, rfl⟩
      rwa [← enc_inj heq]
  join_le := by
    rintro F G n hFG ⟨e, he, rfl⟩
    change (add M F (enc e)).1 ⊆ G.1
    rw [add_eq, ← G.2.closure]
    exact M.closure_subset_closure (Set.insert_subset he hFG)
  le_join F n := by
    change F.1 ⊆ (add M F n).1
    refine (F.2.closure.symm.subset).trans ?_
    exact M.closure_subset_closure Set.subset_union_left
  mem_join := by
    rintro F n G ⟨e, he, rfl⟩
    refine ⟨e, ?_, rfl⟩
    rw [add_eq]
    exact M.mem_closure_of_mem' (Set.mem_insert _ _) (G.2.subset_ground he)
  rk_join := by
    rintro F n G ⟨e, he, rfl⟩ hn
    have heF : e ∉ F.1 := fun h => hn ⟨e, h, rfl⟩
    have h1 : M.eRk (insert e F.1) = M.eRk F.1 + 1 :=
      M.eRk_insert_eq_add_one ⟨G.2.subset_ground he, notMem_cl M heF⟩
    have : (flatRk M (add M F (enc e)) : ℕ∞) = (flatRk M F + 1 : ℕ) := by
      rw [flatRk_coe, add_eq, M.eRk_closure_eq, h1, ← flatRk_coe]; push_cast; rfl
    exact_mod_cast this

/-- Every nonloop of a flat is missed by some flat one rank lower. -/
theorem exists_coatom (F : Flats M) (n : ℕ) (h : (flatSystem M).mem n F)
    (h0 : ¬ (flatSystem M).mem n ⊥) :
    ∃ G, G ≤ F ∧ flatRk M G + 1 = flatRk M F ∧ ¬ (flatSystem M).mem n G := by
  obtain ⟨e, he, rfl⟩ := h
  have hnl : e ∉ M.closure ∅ := fun hh => h0 ⟨e, hh, rfl⟩
  have hind : M.Indep {e} := by
    have := (M.empty_indep.notMem_closure_iff_of_notMem (by simp) (F.2.subset_ground he)).1 hnl
    simpa using this
  obtain ⟨I, hI, heI⟩ := hind.subset_isBasis_of_subset (Set.singleton_subset_iff.2 he)
    F.2.subset_ground
  have heI : e ∈ I := heI rfl
  let G : Flats M := ⟨M.closure (I \ {e}), M.isFlat_closure _⟩
  have hId : M.Indep (I \ {e}) := hI.indep.subset Set.sdiff_subset
  have heG : e ∉ G.1 := by
    change e ∉ M.closure (I \ {e})
    rw [hId.notMem_closure_iff_of_notMem (by simp) (F.2.subset_ground he)]
    rw [Set.insert_sdiff_singleton, Set.insert_eq_of_mem heI]
    exact hI.indep
  refine ⟨G, ?_, ?_, ?_⟩
  · change M.closure (I \ {e}) ⊆ F.1
    rw [← F.2.closure]
    exact M.closure_subset_closure (Set.sdiff_subset.trans hI.subset)
  · have h1 : M.eRk F.1 = I.encard := hI.eRk_eq_encard
    have h2 : M.eRk G.1 = (I \ {e}).encard := by
      change M.eRk (M.closure _) = _
      rw [M.eRk_closure_eq, hId.eRk_eq_encard]
    have h3 := Set.encard_sdiff_singleton_add_one heI
    rw [← h1, ← h2, ← flatRk_coe, ← flatRk_coe] at h3
    exact_mod_cast h3
  · rintro ⟨e', he', heq⟩
    exact heG (enc_inj heq ▸ he')

/-- Dual Chow polynomial of the lattice of flats. -/
def dualChow : Polynomial ℤ := Hstar (flatRk M) (⊤ : Flats M)

/-- Dual right augmented Chow polynomial of the lattice of flats. -/
def dualAug : Polynomial ℤ := Fstar (flatRk M) (⊤ : Flats M)

theorem flatRk_top {r : ℕ} (h : M.eRank = r) : flatRk M ⊤ = r := by
  change (M.eRk M.E).toNat = r
  rw [← M.eRank_def, h]; rfl

theorem dualChow_eq {n : ℕ} (h : M.eRank = (n + 1 : ℕ)) :
    dualChow M = gammaSum (flatRk M) ⊤ n :=
  Hstar_eq (flatSystem M).rk_mono (flatSystem M).rk_bot (flatRk_top M h)

theorem dualAug_eq {n : ℕ} (h : M.eRank = (n + 1 : ℕ)) :
    dualAug M = gammaSumAug (flatRk M) ⊤ (n + 1) :=
  Fstar_eq (flatSystem M).rk_mono (flatSystem M).rk_bot (flatRk_top M h)

theorem matroid_beta_nonneg {F : Flats M} {t : List ℕ} (h : FlatSystem.Good (flatRk M F) t) :
    0 ≤ beta (flatRk M) F t := (flatSystem M).beta_nonneg h

theorem matroid_beta_full_pos {F : Flats M} {n : ℕ} (h : flatRk M F = n + 1) :
    0 < beta (flatRk M) F (FlatSystem.full n) :=
  (flatSystem M).beta_full_pos (exists_coatom M) n F h

end
end CaioloFerroniHoster.Ranks
