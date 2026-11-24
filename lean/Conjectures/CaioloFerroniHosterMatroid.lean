import Mathlib.Combinatorics.Matroid.IndepAxioms
import Mathlib.Combinatorics.Matroid.Closure
import Mathlib.Combinatorics.Matroid.Rank.Finite
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.Tactic

/-! Coalescing rank-five blocks in a projective geometry with free points. -/

namespace CaioloFerroniHoster

open Finset Submodule
open scoped Classical

noncomputable section

variable (F V X : Type*) [Field F] [AddCommGroup V] [Module F V]

/-- A geometric point is a one-dimensional subspace. The right summand is free. -/
abbrev Point := {L : Submodule F V // Module.finrank F L = 1} ⊕ X

/-- Untruncated flat of the direct sum of the geometry and a free matroid. -/
abbrev Frame := Submodule F V × Finset X

variable {F V X}

def pointFrame : Point F V X → Frame F V X
  | .inl L => (L, ∅)
  | .inr x => (⊥, {x})

def frameRank (A : Frame F V X) : ℕ := Module.finrank F A.1 + A.2.card

def carrier (A : Frame F V X) : Set (Point F V X) :=
  {e | pointFrame e ≤ A}

def spanPoints (I : Finset (Point F V X)) : Frame F V X :=
  I.sup pointFrame

@[simp] theorem spanPoints_le {I : Finset (Point F V X)} {A : Frame F V X} :
    spanPoints I ≤ A ↔ (I : Set (Point F V X)) ⊆ carrier A :=
  Finset.sup_le_iff

@[simp] theorem spanPoints_insert (e : Point F V X) (I : Finset (Point F V X)) :
    spanPoints (insert e I) = pointFrame e ⊔ spanPoints I :=
  Finset.sup_insert

theorem carrier_mono {A B : Frame F V X} (h : A ≤ B) : carrier A ⊆ carrier B :=
  fun _ he => le_trans he h

theorem carrier_le_iff {A B : Frame F V X} : carrier A ⊆ carrier B ↔ A ≤ B := by
  refine ⟨fun h => ⟨?_, ?_⟩, carrier_mono⟩
  · intro v hv
    by_cases hz : v = 0
    · simp [hz]
    have hm : pointFrame (Sum.inl ⟨F ∙ v, finrank_span_singleton hz⟩ :
        Point F V X) ≤ B :=
      h (show pointFrame (Sum.inl ⟨F ∙ v, finrank_span_singleton hz⟩ :
        Point F V X) ≤ A from ⟨(span_singleton_le_iff_mem v A.1).mpr hv, empty_subset _⟩)
    exact (span_singleton_le_iff_mem v B.1).mp hm.1
  · intro x hx
    have hm : pointFrame (Sum.inr x : Point F V X) ≤ B :=
      h (show pointFrame (Sum.inr x : Point F V X) ≤ A from
        ⟨bot_le, singleton_subset_iff.mpr hx⟩)
    exact singleton_subset_iff.mp hm.2

theorem carrier_injective : Function.Injective (carrier (F := F) (V := V) (X := X)) :=
  fun _ _ h => le_antisymm (carrier_le_iff.mp h.subset) (carrier_le_iff.mp h.symm.subset)

@[simp] theorem carrier_bot : carrier (⊥ : Frame F V X) = ∅ := by
  ext e
  constructor
  · intro he
    have h : pointFrame e ≤ ⊥ := he
    cases e with
    | inl L =>
      have heL : L.val = (⊥ : Submodule F V) := le_bot_iff.mp h.1
      have heR := L.property
      rw [heL, finrank_bot] at heR
      contradiction
    | inr x =>
      have hmem : x ∈ (⊥ : Frame F V X).2 := h.2 (mem_singleton_self x)
      simp at hmem
  · simp

theorem spanPoints_mono {I J : Finset (Point F V X)} (h : I ⊆ J) :
    spanPoints I ≤ spanPoints J :=
  Finset.sup_mono h

variable [Module.Finite F V]

theorem frameRank_mono {A B : Frame F V X} (h : A ≤ B) : frameRank A ≤ frameRank B :=
  Nat.add_le_add (Submodule.finrank_mono h.1) (Finset.card_le_card h.2)

theorem frameRank_strictMono : StrictMono (frameRank (F := F) (V := V) (X := X)) := by
  intro A B h
  have h₁ := Submodule.finrank_mono h.le.1
  have h₂ := Finset.card_le_card h.le.2
  by_contra! hr
  have hfst := Submodule.eq_of_le_of_finrank_le h.le.1 (show _ by
    dsimp [frameRank] at hr
    omega)
  have hsnd := Finset.eq_of_subset_of_card_le h.le.2 (show _ by
    dsimp [frameRank] at hr
    omega)
  exact h.ne (Prod.ext hfst hsnd)

omit [Module.Finite F V] in
@[simp] theorem frameRank_bot : frameRank (⊥ : Frame F V X) = 0 := by
  simp [frameRank]

omit [Module.Finite F V] in
@[simp] theorem pointFrame_rank (e : Point F V X) : frameRank (pointFrame e) = 1 := by
  cases e with
  | inl L =>
    change Module.finrank F L.val + (∅ : Finset X).card = 1
    simp [L.property]
  | inr x =>
    change Module.finrank F (⊥ : Submodule F V) + ({x} : Finset X).card = 1
    simp [finrank_bot]

theorem frameRank_sup_le (A B : Frame F V X) :
    frameRank (A ⊔ B) ≤ frameRank A + frameRank B := by
  have h₁ := Submodule.finrank_sup_add_finrank_inf_eq A.1 B.1
  have h₂ := Finset.card_union_le (s := A.2) (t := B.2)
  change Module.finrank F (A.1 ⊔ B.1 : Submodule F V) + (A.2 ∪ B.2).card ≤ _
  unfold frameRank
  omega

theorem span_insert_rank {I : Finset (Point F V X)} {e : Point F V X}
    (he : e ∉ carrier (spanPoints I)) :
    frameRank (spanPoints (insert e I)) = frameRank (spanPoints I) + 1 := by
  rw [spanPoints_insert]
  have hu := frameRank_sup_le (pointFrame e) (spanPoints I)
  rw [pointFrame_rank] at hu
  have hne : spanPoints I ≠ pointFrame e ⊔ spanPoints I := by
    intro h
    apply he
    change pointFrame e ≤ spanPoints I
    rw [h]
    exact le_sup_left
  have hl := frameRank_strictMono (lt_of_le_of_ne le_sup_right hne)
  omega

theorem span_rank_le_card (I : Finset (Point F V X)) : frameRank (spanPoints I) ≤ I.card := by
  induction I using Finset.induction_on with
  | empty => simp [spanPoints]
  | @insert e I he ih =>
    rw [spanPoints_insert, Finset.card_insert_of_notMem he]
    have h := frameRank_sup_le (pointFrame e) (spanPoints I)
    rw [pointFrame_rank] at h
    omega

def freeIndependent (I : Finset (Point F V X)) : Prop :=
  frameRank (spanPoints I) = I.card

theorem freeIndependent_subset {I J : Finset (Point F V X)}
    (hJ : freeIndependent J) (hIJ : I ⊆ J) : freeIndependent I := by
  have he : (J \ I) ∪ I = J := sdiff_union_of_subset hIJ
  have hcard := Finset.card_sdiff_of_subset hIJ
  have hIJcard := Finset.card_le_card hIJ
  have hu := frameRank_sup_le (spanPoints (J \ I)) (spanPoints I)
  have hh := span_rank_le_card (J \ I)
  have hi := span_rank_le_card I
  unfold spanPoints at hu
  rw [← Finset.sup_union, he] at hu
  change frameRank (spanPoints J) ≤ frameRank (spanPoints (J \ I)) + frameRank (spanPoints I) at hu
  unfold freeIndependent at hJ ⊢
  omega

theorem freeIndependent_insert {I : Finset (Point F V X)} {e : Point F V X}
    (hI : freeIndependent I) :
    freeIndependent (insert e I) ↔ e ∈ I ∨ e ∉ carrier (spanPoints I) := by
  by_cases he : e ∈ I
  · simp [he, hI]
  simp only [he, false_or]
  by_cases hc : e ∈ carrier (spanPoints I)
  · have hu : spanPoints (insert e I) = spanPoints I := by
      rw [spanPoints_insert, sup_eq_right.mpr hc]
    simp only [hc, not_true_eq_false, iff_false]
    unfold freeIndependent at hI ⊢
    rw [hu, Finset.card_insert_of_notMem he, hI]
    omega
  · have hu := span_insert_rank hc
    unfold freeIndependent at hI ⊢
    rw [hu, Finset.card_insert_of_notMem he, hI]
    simp [hc]

theorem exists_outside {J : Finset (Point F V X)} {A : Frame F V X}
    (h : frameRank A < frameRank (spanPoints J)) :
    ∃ e ∈ J, e ∉ carrier A := by
  by_contra! hn
  exact (Nat.not_lt_of_ge (frameRank_mono (spanPoints_le.mpr hn))) h

theorem exists_free_basis (A : Frame F V X) :
    ∃ I : Finset (Point F V X), freeIndependent I ∧ spanPoints I = A := by
  have extension : ∀ I : Finset (Point F V X), freeIndependent I →
      spanPoints I ≤ A → ∃ J : Finset (Point F V X), freeIndependent J ∧ spanPoints J = A := by
    intro I
    induction h : frameRank A - frameRank (spanPoints I) using Nat.strong_induction_on
      generalizing I with
    | h n ih =>
      intro hI hIA
      by_cases he : spanPoints I = A
      · exact ⟨I, hI, he⟩
      obtain ⟨e, heA, heI⟩ : ∃ e, e ∈ carrier A ∧ e ∉ carrier (spanPoints I) := by
        by_contra! hn
        exact he (le_antisymm hIA (carrier_le_iff.mp hn))
      refine ih _ ?_ (insert e I) rfl ?_ ?_
      · rw [span_insert_rank heI]
        have := frameRank_strictMono (lt_of_le_of_ne hIA he)
        omega
      · exact (freeIndependent_insert hI).2 (Or.inr heI)
      · rw [spanPoints_insert]
        exact sup_le heA hIA
  exact extension ∅ (by simp [freeIndependent, spanPoints]) (by simp [spanPoints])

/-- Properties of the rank-five blocks needed for coalescence. -/
structure Blocks (B : Type*) where
  frame : B → Frame F V X
  rank_five : ∀ b, frameRank (frame b) = 5
  inf_rank_le : ∀ {a b}, a ≠ b → frameRank (frame a ⊓ frame b) ≤ 3

variable {B : Type*} (blocks : Blocks (F := F) (V := V) (X := X) B)

theorem Blocks.unique_above_four {A : Frame F V X} (hA : 4 ≤ frameRank A)
    {a b : B} (ha : A ≤ blocks.frame a) (hb : A ≤ blocks.frame b) : a = b := by
  by_contra hn
  have h := frameRank_mono (le_inf ha hb)
  have hb := blocks.inf_rank_le hn
  omega

def coalescedIndependent (I : Finset (Point F V X)) : Prop :=
  freeIndependent I ∧ I.card ≤ 5 ∧ ∀ b, spanPoints I ≤ blocks.frame b → I.card ≤ 4

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
  by_cases hi4 : I.card < 4
  · exact ⟨e, heJ, outside he, insert_free he, (by rw [insert_card he]; omega),
      fun _ _ => by rw [insert_card he]; omega⟩
  have hi4' : I.card = 4 := by omega
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
    have heq := blocks.unique_above_four (show 4 ≤ frameRank (spanPoints I) by
      rw [hi, hi4']) hIc hIb
    subst c
    rw [spanPoints_insert] at hc
    exact le_sup_left.trans hc
  exact (show ¬ J.card ≤ 4 by omega) (hjB b hjb)

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

theorem indep_of_free_of_card_le_four {I : Finset (Point F V X)}
    (hI : freeIndependent I) (hcard : I.card ≤ 4) :
    (coalescedMatroid blocks).Indep (I : Set (Point F V X)) :=
  (coalescedMatroid_indep blocks).2 ⟨hI, hcard.trans (by decide), fun _ _ => hcard⟩

theorem closure_of_small_basis {I : Finset (Point F V X)} (hI : freeIndependent I)
    (hcard : I.card ≤ 4) :
    (coalescedMatroid blocks).closure (I : Set (Point F V X)) =
      {e | e ∈ carrier (spanPoints I) ∨
        (I.card = 4 ∧ ∃ b, spanPoints I ≤ blocks.frame b ∧ e ∈ carrier (blocks.frame b))} := by
  have hi := indep_of_free_of_card_le_four blocks hI hcard
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

abbrev RankedFlat (M : Matroid (Point F V X)) (r : ℕ) :=
  {S : Set (Point F V X) // M.IsFlat S ∧ M.eRk S = (r : ℕ∞)}

private theorem closure_rank {I : Finset (Point F V X)}
    (hI : (coalescedMatroid blocks).Indep (I : Set (Point F V X))) :
    (coalescedMatroid blocks).eRk ((coalescedMatroid blocks).closure I) = (I.card : ℕ∞) := by
  rw [← hI.isBasis_closure.encard_eq_eRk, Set.encard_coe_eq_coe_finsetCard]

theorem small_flat {A : Frame F V X} (hA : frameRank A ≤ 4)
    (hb : frameRank A = 4 → ∀ b, ¬ A ≤ blocks.frame b) :
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
    closure_rank blocks (indep_of_free_of_card_le_four blocks hi (hr ▸ hA))⟩

theorem block_flat {A : Frame F V X} (hA : frameRank A = 4)
    {b : B} (hAb : A ≤ blocks.frame b) :
    (coalescedMatroid blocks).IsFlat (carrier (blocks.frame b)) ∧
      (coalescedMatroid blocks).eRk (carrier (blocks.frame b)) = 4 := by
  obtain ⟨I, hi, hiA⟩ := exists_free_basis A
  have hr : I.card = 4 := hi.symm.trans ((congrArg frameRank hiA).trans hA)
  have hc : (coalescedMatroid blocks).closure (I : Set (Point F V X)) =
      carrier (blocks.frame b) := by
    rw [closure_of_small_basis blocks hi (by omega), hiA, hr]
    ext e
    constructor
    · rintro (he | ⟨_, c, hc, he⟩)
      · exact carrier_mono hAb he
      · rwa [blocks.unique_above_four (by omega) hc hAb] at he
    · intro he
      exact Or.inr ⟨rfl, b, hAb, he⟩
  rw [← hc]
  exact ⟨(coalescedMatroid blocks).isFlat_closure _, by
    rw [closure_rank blocks (indep_of_free_of_card_le_four blocks hi (by omega)), hr]
    rfl⟩

variable [Finite (Point F V X)]

theorem rankedFlat_description {r : ℕ} (hr : r ≤ 4)
    (S : RankedFlat (coalescedMatroid blocks) r) :
    (∃ A : Frame F V X, frameRank A = r ∧
      (r = 4 → ∀ b, ¬ A ≤ blocks.frame b) ∧ S.val = carrier A) ∨
      (r = 4 ∧ ∃ b, S.val = carrier (blocks.frame b)) := by
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
  by_cases hh : r = 4 ∧ ∃ b, spanPoints I ≤ blocks.frame b
  · obtain ⟨h4, b, hb⟩ := hh
    refine Or.inr ⟨h4, b, hc.symm.trans ?_⟩
    ext e
    constructor
    · rintro (he | ⟨_, c, hc', he⟩)
      · exact carrier_mono hb he
      · have heq := blocks.unique_above_four (show 4 ≤ frameRank (spanPoints I) by
          rw [show frameRank (spanPoints I) = I.card from hf, hcard, h4]) hc' hb
        simpa only [heq] using he
    · intro he
      exact Or.inr ⟨h4, b, hb, he⟩
  · refine Or.inl ⟨spanPoints I, hf.trans hcard,
      fun h b hb => hh ⟨h, b, hb⟩, hc.symm.trans ?_⟩
    ext e
    exact ⟨fun h => h.elim id fun ⟨h4, b, hb, _⟩ => (hh ⟨h4, b, hb⟩).elim, Or.inl⟩

end
end CaioloFerroniHoster
