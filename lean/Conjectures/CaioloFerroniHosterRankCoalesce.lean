import Conjectures.CaioloFerroniHosterMatroid

/-!
# Coalescing in every rank

The rank-five coalescence of `CaioloFerroniHosterMatroid`, with the rank as a parameter.
Frames and free independence are reused from that module.
-/

set_option linter.unusedSectionVars false
set_option linter.unusedSimpArgs false

namespace CaioloFerroniHoster.Ranks

open Finset Submodule
open scoped Classical

noncomputable section

variable {F V X : Type*} [Field F] [AddCommGroup V] [Module F V] [Module.Finite F V]

/-- Properties of the rank-(k+1) blocks needed for coalescence. -/
structure Blocks (k : ℕ) (B : Type*) where
  frame : B → Frame F V X
  rank_top : ∀ b, frameRank (frame b) = k + 1
  inf_rank_le : ∀ {a b}, a ≠ b → frameRank (frame a ⊓ frame b) < k

variable {k : ℕ} {B : Type*} (blocks : Blocks (F := F) (V := V) (X := X) k B)

theorem Blocks.unique_above {A : Frame F V X} (hA : k ≤ frameRank A)
    {a b : B} (ha : A ≤ blocks.frame a) (hb : A ≤ blocks.frame b) : a = b := by
  by_contra hn
  have h := frameRank_mono (le_inf ha hb)
  have hb := blocks.inf_rank_le hn
  omega

def coalescedIndependent (I : Finset (Point F V X)) : Prop :=
  freeIndependent I ∧ I.card ≤ k + 1 ∧ ∀ b, spanPoints I ≤ blocks.frame b → I.card ≤ k

private theorem coalesced_aug {I J : Finset (Point F V X)}
    (hI : coalescedIndependent blocks I) (hJ : coalescedIndependent blocks J)
    (hIJ : I.card < J.card) : ∃ e ∈ J, e ∉ I ∧ coalescedIndependent blocks (insert e I) := by
  obtain ⟨hi, hi5, _⟩ := hI
  obtain ⟨hj, hj5, hjB⟩ := hJ
  have hlt : frameRank (spanPoints I) < frameRank (spanPoints J) := by
    simpa [freeIndependent] using (hi.symm ▸ hj.symm ▸ hIJ)
  obtain ⟨e, heJ, he⟩ := exists_outside hlt
  have outside {x : Point F V X} (hx : x ∉ carrier (spanPoints I)) : x ∉ I := by
    intro hxI
    exact hx (spanPoints_le.mp (le_refl _) hxI)
  have insert_card {x : Point F V X} (hx : x ∉ carrier (spanPoints I)) :
      (insert x I).card = I.card + 1 := Finset.card_insert_of_notMem (outside hx)
  have insert_free {x : Point F V X} (hx : x ∉ carrier (spanPoints I)) :
      freeIndependent (insert x I) := (freeIndependent_insert hi).2 (Or.inr hx)
  by_cases hi4 : I.card < k
  · exact ⟨e, heJ, outside he, insert_free he, (by rw [insert_card he]; omega),
      fun _ _ => by rw [insert_card he]; omega⟩
  have hi4' : I.card = k := by omega
  by_contra! hn
  have bad (x : Point F V X) (hxJ : x ∈ J) (hx : x ∉ carrier (spanPoints I)) :
      ∃ b, spanPoints (insert x I) ≤ blocks.frame b := by
    by_contra! hm
    apply hn x hxJ (outside hx)
    refine ⟨insert_free hx, by rw [insert_card hx, hi4'], ?_⟩
    exact fun b hb => (hm b hb).elim
  obtain ⟨b, hb⟩ := bad e heJ he
  have hIb : spanPoints I ≤ blocks.frame b :=
    (spanPoints_mono (Finset.subset_insert _ _)).trans hb
  have hjb : spanPoints J ≤ blocks.frame b := by
    rw [spanPoints_le]
    intro x hxJ
    by_cases hx : x ∈ carrier (spanPoints I)
    · exact carrier_mono hIb hx
    obtain ⟨c, hc⟩ := bad x hxJ hx
    have hIc := (spanPoints_mono (Finset.subset_insert _ _)).trans hc
    have heq := blocks.unique_above (show k ≤ frameRank (spanPoints I) by
      rw [hi, hi4']) hIc hIb
    subst c
    rw [spanPoints_insert] at hc
    exact le_sup_left.trans hc
  exact (show ¬ J.card ≤ k by omega) (hjB b hjb)

def coalescedMatroid : Matroid (Point F V X) :=
  (IndepMatroid.ofFinset Set.univ (coalescedIndependent blocks)
    (by simp [coalescedIndependent, freeIndependent, spanPoints])
    (fun _ _ hJ hIJ => ⟨freeIndependent_subset hJ.1 hIJ,
      (Finset.card_le_card hIJ).trans hJ.2.1,
      fun b hIb => by
        by_contra! hI
        have he : _ = _ := Finset.eq_of_subset_of_card_le hIJ (by
          have := hJ.2.1
          omega)
        subst_vars
        exact (Nat.not_le_of_gt hI) (hJ.2.2 b hIb)⟩)
    (fun _ _ => coalesced_aug blocks) (by simp)).matroid

@[simp] theorem coalescedMatroid_indep {I : Finset (Point F V X)} :
    (coalescedMatroid blocks).Indep (I : Set (Point F V X)) ↔ coalescedIndependent blocks I := by
  unfold coalescedMatroid
  exact IndepMatroid.matroid_indep_iff.trans (IndepMatroid.ofFinset_indep _ _ _ _ _ _)

@[simp] theorem coalescedMatroid_ground : (coalescedMatroid blocks).E = Set.univ := rfl

theorem indep_of_free_of_card_le {I : Finset (Point F V X)}
    (hI : freeIndependent I) (hcard : I.card ≤ k) :
    (coalescedMatroid blocks).Indep (I : Set (Point F V X)) :=
  (coalescedMatroid_indep blocks).2 ⟨hI, hcard.trans (Nat.le_succ k), fun _ _ => hcard⟩

theorem closure_of_small_basis {I : Finset (Point F V X)} (hI : freeIndependent I)
    (hcard : I.card ≤ k) :
    (coalescedMatroid blocks).closure (I : Set (Point F V X)) =
      {e | e ∈ carrier (spanPoints I) ∨
        (I.card = k ∧ ∃ b, spanPoints I ≤ blocks.frame b ∧ e ∈ carrier (blocks.frame b))} := by
  have hi := indep_of_free_of_card_le blocks hI hcard
  ext e
  by_cases he : e ∈ I
  · have hc := spanPoints_le.mp (le_refl (spanPoints I)) he
    exact iff_of_true ((coalescedMatroid blocks).subset_closure (I : Set _) hi.subset_ground he) (Or.inl hc)
  have hg : e ∈ (coalescedMatroid blocks).E := by simp
  have hinsert := hi.notMem_closure_iff_of_notMem (show e ∉ (I : Set _) from he) hg
  rw [← Finset.coe_insert, coalescedMatroid_indep] at hinsert
  change _ ↔ _ ∨ _
  rw [← not_iff_not, hinsert]
  simp only [coalescedIndependent, freeIndependent_insert hI, he, false_or, spanPoints_insert,
    Finset.card_insert_of_notMem he, sup_le_iff]
  constructor
  · rintro ⟨hc, _, hb⟩ (h | ⟨hr, b, hbI, hbe⟩)
    · exact hc h
    · have := hb b ⟨hbe, hbI⟩
      omega
  · intro hn
    refine ⟨fun h => hn (Or.inl h), by omega, ?_⟩
    intro b hb
    by_contra! hbad
    exact hn (Or.inr ⟨by omega, b, hb.2, hb.1⟩)

private theorem closure_rank {I : Finset (Point F V X)}
    (hI : (coalescedMatroid blocks).Indep (I : Set (Point F V X))) :
    (coalescedMatroid blocks).eRk ((coalescedMatroid blocks).closure I) = (I.card : ℕ∞) := by
  rw [← hI.isBasis_closure.encard_eq_eRk, Set.encard_coe_eq_coe_finsetCard]

theorem small_flat {A : Frame F V X} (hA : frameRank A ≤ k)
    (hb : frameRank A = k → ∀ b, ¬ A ≤ blocks.frame b) :
    (coalescedMatroid blocks).IsFlat (carrier A) ∧
      (coalescedMatroid blocks).eRk (carrier A) = (frameRank A : ℕ∞) := by
  obtain ⟨I, hi, hiA⟩ := exists_free_basis A
  have hr : I.card = frameRank A := hi.symm.trans (congrArg frameRank hiA)
  have hc : (coalescedMatroid blocks).closure (I : Set (Point F V X)) = carrier A := by
    rw [closure_of_small_basis blocks hi (hr ▸ hA), hiA, hr]
    ext e
    exact ⟨fun h => h.elim id fun h' => by
      obtain ⟨hd, b, hbA, _⟩ := h'
      exact (hb hd b hbA).elim, Or.inl⟩
  rw [← hc, ← hr]
  exact ⟨(coalescedMatroid blocks).isFlat_closure _,
    closure_rank blocks (indep_of_free_of_card_le blocks hi (hr ▸ hA))⟩

theorem block_flat {A : Frame F V X} (hA : frameRank A = k)
    {b : B} (hAb : A ≤ blocks.frame b) :
    (coalescedMatroid blocks).IsFlat (carrier (blocks.frame b)) ∧
      (coalescedMatroid blocks).eRk (carrier (blocks.frame b)) = (k : ℕ∞) := by
  obtain ⟨I, hi, hiA⟩ := exists_free_basis A
  have hr : I.card = k := hi.symm.trans ((congrArg frameRank hiA).trans hA)
  have hc : (coalescedMatroid blocks).closure (I : Set (Point F V X)) =
      carrier (blocks.frame b) := by
    rw [closure_of_small_basis blocks hi (by omega), hiA, hr]
    ext e
    constructor
    · rintro (he | ⟨_, c, hc, he⟩)
      · exact carrier_mono hAb he
      · rwa [blocks.unique_above (by omega) hc hAb] at he
    · intro he
      exact Or.inr ⟨rfl, b, hAb, he⟩
  rw [← hc]
  exact ⟨(coalescedMatroid blocks).isFlat_closure _, by
    rw [closure_rank blocks (indep_of_free_of_card_le blocks hi (by omega)), hr]⟩

variable [Finite (Point F V X)]

theorem rankedFlat_description {r : ℕ} (hr : r ≤ k)
    (S : RankedFlat (coalescedMatroid blocks) r) :
    (∃ A : Frame F V X, frameRank A = r ∧
      (r = k → ∀ b, ¬ A ≤ blocks.frame b) ∧ S.val = carrier A) ∨
      (r = k ∧ ∃ b, S.val = carrier (blocks.frame b)) := by
  obtain ⟨J, hJ⟩ := (coalescedMatroid blocks).exists_isBasis S.val S.property.1.subset_ground
  let I := (Set.toFinite J).toFinset
  have hI : (I : Set (Point F V X)) = J := Set.Finite.coe_toFinset _
  have hcard : I.card = r := by
    have he := hJ.encard_eq_eRk.trans S.property.2
    rw [← hI, Set.encard_coe_eq_coe_finsetCard] at he
    exact_mod_cast he
  have hi : (coalescedMatroid blocks).Indep (I : Set (Point F V X)) := hI ▸ hJ.indep
  have hf := ((coalescedMatroid_indep blocks).mp hi).1
  have hc : (coalescedMatroid blocks).closure (I : Set (Point F V X)) = S.val := by
    rw [hI, hJ.closure_eq_closure, S.property.1.closure]
  rw [closure_of_small_basis blocks hf (hcard ▸ hr), hcard] at hc
  by_cases hh : r = k ∧ ∃ b, spanPoints I ≤ blocks.frame b
  · obtain ⟨h4, b, hb⟩ := hh
    refine Or.inr ⟨h4, b, hc.symm.trans ?_⟩
    ext e
    constructor
    · rintro (he | ⟨_, c, hc', he⟩)
      · exact carrier_mono hb he
      · have heq := blocks.unique_above (show k ≤ frameRank (spanPoints I) by
          rw [show frameRank (spanPoints I) = I.card from hf, hcard, h4]) hc' hb
        simpa only [heq] using he
    · intro he
      exact Or.inr ⟨h4, b, hb, he⟩
  · refine Or.inl ⟨spanPoints I, hf.trans hcard,
      fun h b hb => hh ⟨h, b, hb⟩, hc.symm.trans ?_⟩
    ext e
    exact ⟨fun h => h.elim id fun ⟨h4, b, hb, _⟩ => (hh ⟨h4, b, hb⟩).elim, Or.inl⟩

end
end CaioloFerroniHoster.Ranks
