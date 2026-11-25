import Conjectures.CaioloFerroniHosterRankCoalesce
import Conjectures.CaioloFerroniHosterFlags

/-! # Flag counts of the coalesced matroid in every rank -/

set_option linter.unusedSectionVars false
set_option linter.unusedSimpArgs false

namespace CaioloFerroniHoster.Ranks

open Finset Submodule
open scoped Classical

noncomputable section

variable {F V X : Type u} [Field F] [Fintype F] [AddCommGroup V] [Module F V]
variable [Module.Finite F V] [Finite V] [Finite X]

variable {k : ℕ} {B : Type*} (blocks : Blocks (F := F) (V := V) (X := X) k B)

private def lowLayerEquiv (A : Frame F V X) {r : ℕ} (hr : r < k) :
    FrameLayer A r ≃ {C : RankedFlat (coalescedMatroid blocks) r // C.val ⊆ carrier A} :=
  Equiv.ofBijective (fun C =>
    let h := small_flat blocks (A := C.val) (by rw [C.property.2]; omega)
      (by rw [C.property.2]; intro h; omega)
    ⟨⟨carrier C.val, h.1, h.2.trans (congrArg Nat.cast C.property.2)⟩,
      carrier_mono C.property.1⟩) (by
    constructor
    · intro C D h
      exact Subtype.ext <| carrier_injective <| congrArg (fun S => S.val.val) h
    · intro C
      obtain ⟨D, hd, _, hc⟩ | h :=
        rankedFlat_description blocks (by omega) C.val
      · exact ⟨⟨D, carrier_le_iff.mp (hc ▸ C.property), hd⟩,
          Subtype.ext (Subtype.ext hc.symm)⟩
      · omega)

private def lowFlagEquiv (A : Frame F V X) (s : List ℕ) (hs : ∀ r ∈ s, r < k) :
    FrameFlag A s ≃ FlatFlag (coalescedMatroid blocks) (carrier A) s := by
  induction s generalizing A with
  | nil => exact Equiv.refl _
  | cons r s ih =>
    exact Equiv.sigmaCongr (lowLayerEquiv blocks A (hs r (by simp))) fun C =>
      ih C.val (fun t ht => hs t (List.mem_cons_of_mem _ ht))

theorem card_lowFlatFlag (A : Frame F V X) (s : List ℕ) (hs : ∀ r ∈ s, r < k) :
    Nat.card (FlatFlag (coalescedMatroid blocks) (carrier A) s) =
      productFlag (Fintype.card F) (Module.finrank F A.1) A.2.card s :=
  (Nat.card_congr (lowFlagEquiv blocks A s hs).symm).trans (card_frameFlag A s)

variable [Fintype X] [Finite B]

private abbrev OldLayer :=
  {A : FrameLayer (topFrame : Frame F V X) k // ∀ b, ¬ A.val ≤ blocks.frame b}

private abbrev RemovedLayer :=
  {A : FrameLayer (topFrame : Frame F V X) k // ¬ ∀ b, ¬ A.val ≤ blocks.frame b}

private def removedEquiv :
    (Σ b : B, FrameLayer (blocks.frame b) k) ≃ RemovedLayer blocks :=
  Equiv.ofBijective (fun ⟨b, A⟩ => ⟨⟨A.val, le_topFrame _, A.property.2⟩,
    fun h => h b A.property.1⟩) (by
    constructor
    · rintro ⟨b, A⟩ ⟨c, C⟩ he
      have he' : A.val = C.val := congrArg (fun (D : RemovedLayer blocks) => D.val.val) he
      have hbc := blocks.unique_above (show k ≤ frameRank A.val by rw [A.property.2])
        A.property.1 (he'.symm ▸ C.property.1)
      subst c
      rw [Subtype.ext he']
    · intro A
      obtain ⟨b, hb⟩ : ∃ b, A.val.val ≤ blocks.frame b := by
        simpa only [not_forall, not_not] using A.property
      exact ⟨⟨b, ⟨A.val.val, hb, A.val.property.2⟩⟩, rfl⟩)

private def hyperplaneEquiv
    (hblock : ∀ b, Nonempty (FrameLayer (blocks.frame b) k)) :
    OldLayer blocks ⊕ B ≃
      {S : RankedFlat (coalescedMatroid blocks) k //
        S.val ⊆ carrier (topFrame : Frame F V X)} :=
  let oldMap (A : OldLayer blocks) := by
    have h := small_flat blocks (A := A.val.val) (by rw [A.val.property.2]) (fun _ => A.property)
    refine (⟨⟨carrier A.val.val, h.1, ?_⟩, carrier_mono A.val.property.1⟩ :
      {S : RankedFlat (coalescedMatroid blocks) k //
        S.val ⊆ carrier (topFrame : Frame F V X)})
    rw [h.2, A.val.property.2]
  let blockMap (b : B) := by
    let A := (hblock b).some
    have h := block_flat blocks A.property.2 A.property.1
    exact (⟨⟨carrier (blocks.frame b), h.1, h.2⟩, carrier_mono (le_topFrame _)⟩ :
      {S : RankedFlat (coalescedMatroid blocks) k //
        S.val ⊆ carrier (topFrame : Frame F V X)})
  Equiv.ofBijective (Sum.elim oldMap blockMap) (by
    constructor
    · intro A C hAC
      have h := congrArg (fun S => S.val.val) hAC
      rcases A with A | b <;> rcases C with C | c
      · exact congrArg Sum.inl (Subtype.ext (Subtype.ext (carrier_injective h)))
      · have hc := carrier_injective h
        have ha := A.val.property.2
        change A.val.val = blocks.frame c at hc
        rw [hc, blocks.rank_top] at ha
        omega
      · have hc := carrier_injective h.symm
        have ha := C.val.property.2
        change C.val.val = blocks.frame b at hc
        rw [hc, blocks.rank_top] at ha
        omega
      · have hc := carrier_injective h
        exact congrArg Sum.inr (blocks.unique_above (by rw [blocks.rank_top]; omega)
          (le_refl _) hc.le)
    · intro S
      rcases rankedFlat_description blocks (le_refl k) S.val with ⟨A, hA, hgood, hS⟩ | ⟨_, b, hb⟩
      · exact ⟨.inl ⟨⟨A, le_topFrame _, hA⟩, hgood rfl⟩,
          Subtype.ext (Subtype.ext hS.symm)⟩
      · exact ⟨.inr b, Subtype.ext (Subtype.ext hb.symm)⟩)

set_option maxHeartbeats 1500000 in
omit [Fintype F] in
theorem hyperplane_replacement_count
    (hblock : ∀ b, Nonempty (FrameLayer (blocks.frame b) k))
    (s : List ℕ) (hs : ∀ r ∈ s, r < k) :
    Nat.card (FlatFlag (coalescedMatroid blocks) (carrier (topFrame : Frame F V X)) (k :: s)) +
      Nat.card (Σ b : B, FrameFlag (blocks.frame b) (k :: s)) =
    Nat.card (FrameFlag (topFrame : Frame F V X) (k :: s)) +
      Nat.card (Σ b : B, FrameFlag (blocks.frame b) s) := by
  let good := Σ A : OldLayer blocks, FrameFlag A.val.val s
  let bad := Σ A : RemovedLayer blocks, FrameFlag A.val.val s
  let new := Σ b : B, FrameFlag (blocks.frame b) s
  have hactual :
      Nat.card (FlatFlag (coalescedMatroid blocks) (carrier (topFrame : Frame F V X)) (k :: s)) =
        Nat.card good + Nat.card new := by
    rw [← Nat.card_sum]
    let fibers : OldLayer blocks ⊕ B → Type _ :=
      Sum.elim (fun A => FrameFlag A.val.val s) (fun b => FrameFlag (blocks.frame b) s)
    let target (C : {S : RankedFlat (coalescedMatroid blocks) k //
        S.val ⊆ carrier (topFrame : Frame F V X)}) := FlatFlag (coalescedMatroid blocks) C.val.val s
    have fiberEquiv (A : OldLayer blocks ⊕ B) :
        fibers A ≃ target (hyperplaneEquiv blocks hblock A) := by
      cases A with
      | inl A => exact lowFlagEquiv blocks A.val.val s hs
      | inr b => exact lowFlagEquiv blocks (blocks.frame b) s hs
    exact Nat.card_congr (((Equiv.sumSigmaDistrib fibers).symm.trans
      (Equiv.sigmaCongr (hyperplaneEquiv blocks hblock) fiberEquiv)).symm)
  have hbase : Nat.card (FrameFlag (topFrame : Frame F V X) (k :: s)) =
      Nat.card good + Nat.card bad := by
    rw [← Nat.card_sum]
    let e := Equiv.sumCompl (fun A : FrameLayer (topFrame : Frame F V X) k =>
      ∀ b, ¬ A.val ≤ blocks.frame b)
    let fibers (A : OldLayer blocks ⊕ RemovedLayer blocks) := FrameFlag (e A).val s
    exact Nat.card_congr (((Equiv.sumSigmaDistrib fibers).symm.trans
      (Equiv.sigmaCongr e (fun A => Equiv.refl (fibers A)))).symm)
  have hbad : Nat.card (Σ b : B, FrameFlag (blocks.frame b) (k :: s)) =
      Nat.card bad :=
    Nat.card_congr ((Equiv.sigmaAssoc _).symm.trans
      (Equiv.sigmaCongr (removedEquiv blocks) (fun _ => Equiv.refl _)))
  dsimp only [new] at hactual
  rw [hactual, hbase, hbad]
  ac_rfl

end
end CaioloFerroniHoster.Ranks
