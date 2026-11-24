import Conjectures.CaioloFerroniHosterMatroid
import Conjectures.CaioloFerroniHosterSubspaces
import Mathlib.Data.Nat.Factorial.BigOperators

/-! Rank-selected flags of the product lattice and of the coalesced matroid. -/

namespace CaioloFerroniHoster

open Finset Submodule
open scoped Classical

noncomputable section

variable {F V X : Type u} [Field F] [Fintype F] [AddCommGroup V] [Module F V]
variable [Module.Finite F V] [Finite V] [Finite X]

/-- Frames of rank `r` below a specified frame. -/
abbrev FrameLayer (A : Frame F V X) (r : ℕ) :=
  {B : Frame F V X // B ≤ A ∧ frameRank B = r}

private def subspaceBelowEquiv (A : Submodule F V) (r : ℕ) :
    {B : Submodule F V // B ≤ A ∧ Module.finrank F B = r} ≃ SizedSubspace F A r :=
  {
    toFun := fun B => ⟨B.val.comap A.subtype,
      (Submodule.comapSubtypeEquivOfLe B.property.1).finrank_eq.trans B.property.2⟩
    invFun := fun B => ⟨B.val.map A.subtype, Submodule.map_subtype_le _ _,
      (Submodule.finrank_map_subtype_eq A B.val).trans B.property⟩
    left_inv := fun B => Subtype.ext (by
      change Submodule.map A.subtype (Submodule.comap A.subtype B.val) = B.val
      rw [Submodule.map_comap_subtype, inf_eq_right.mpr B.property.1])
    right_inv := fun B => Subtype.ext <| (Submodule.MapSubtype.orderIso A).left_inv B.val
  }

private abbrev subsetsOfSize (A : Finset X) (t : ℕ) :=
  {B : Finset X // B ⊆ A ∧ B.card = t}

private theorem card_subsetsOfSize (A : Finset X) (t : ℕ) :
    Nat.card (subsetsOfSize A t) = A.card.choose t := by
  have h : (subsetsOfSize A t) ≃ ↥(A.powersetCard t) :=
    Equiv.subtypeEquivProp (by ext B; exact Finset.mem_powersetCard.symm)
  rw [Nat.card_congr h, Nat.card_eq_fintype_card, Fintype.card_coe, card_powersetCard]

/-- Below `A`, separate a rank layer according to its geometric dimension. -/
private def frameLayerEquiv (A : Frame F V X) (r : ℕ) :
    FrameLayer A r ≃
      Σ i : Fin (r + 1),
        {B : Submodule F V // B ≤ A.1 ∧ Module.finrank F B = i.val} ×
          subsetsOfSize A.2 (r - i.val) where
  toFun B := by
    have hr := B.property.2
    unfold frameRank at hr
    exact ⟨⟨Module.finrank F B.val.1, by omega⟩, ⟨B.val.1, B.property.1.1, rfl⟩,
      ⟨B.val.2, B.property.1.2, by change _ = r - Module.finrank F B.val.1; omega⟩⟩
  invFun := fun ⟨i, U, S⟩ => ⟨(U.val, S.val), ⟨U.property.1, S.property.1⟩, by
    have hi := i.isLt
    change Module.finrank F U.val + S.val.card = r
    rw [U.property.2, S.property.2]
    omega⟩
  left_inv _ := rfl
  right_inv := by
    rintro ⟨⟨i, hi⟩, ⟨U, hU, hr⟩, S, hS, hs⟩
    dsimp at hr
    subst i
    rfl

/-- Strict rank flags are counted from their largest chosen flat down. -/
def FrameFlag (A : Frame F V X) : List ℕ → Type u
  | [] => PUnit
  | r :: s => Σ B : FrameLayer A r, FrameFlag B.val s

instance frameFlag_finite (A : Frame F V X) (s : List ℕ) : Finite (FrameFlag A s) := by
  induction s generalizing A with
  | nil => change Finite PUnit; infer_instance
  | cons r s ih =>
    change Finite (Σ B : FrameLayer A r, FrameFlag B.val s)
    let _ (B : FrameLayer A r) : Finite (FrameFlag B.val s) := ih B.val
    infer_instance

theorem card_sigma_by_layer {A : Frame F V X} {r : ℕ} (f : FrameLayer A r → ℕ)
    (v : ℕ → ℕ → ℕ) (hf : ∀ B, f B = v (Module.finrank F B.val.1) B.val.2.card) :
    letI := Fintype.ofFinite (FrameLayer A r)
    ∑ B : FrameLayer A r, f B =
      ∑ i ∈ range (r + 1),
        gaussian (Fintype.card F) (Module.finrank F A.1) i *
          A.2.card.choose (r - i) * v i (r - i) := by
  classical
  letI := Fintype.ofFinite (FrameLayer A r)
  letI (i : Fin (r + 1)) :=
    Fintype.ofFinite ({B : Submodule F V // B ≤ A.1 ∧ Module.finrank F B = i.val} ×
      subsetsOfSize A.2 (r - i.val))
  let e := frameLayerEquiv A r
  calc
    _ = ∑ p : Σ i : Fin (r + 1),
          {B : Submodule F V // B ≤ A.1 ∧ Module.finrank F B = i.val} ×
            subsetsOfSize A.2 (r - i.val), f (e.symm p) := by
          exact Fintype.sum_equiv e _ _ (by simp)
    _ = _ := by
      rw [Fintype.sum_sigma]
      have hinner (i : Fin (r + 1)) : (∑ d, f (e.symm ⟨i, d⟩)) =
          gaussian (Fintype.card F) (Module.finrank F A.1) i.val *
            A.2.card.choose (r - i.val) * v i.val (r - i.val) := by
        simp_rw [hf]
        have hd (d : {B : Submodule F V // B ≤ A.1 ∧ Module.finrank F B = i.val} ×
            subsetsOfSize A.2 (r - i.val)) :
            Module.finrank F (e.symm ⟨i, d⟩).val.1 = i.val ∧
              (e.symm ⟨i, d⟩).val.2.card = r - i.val :=
          ⟨d.1.property.2, d.2.property.2⟩
        simp only [(hd _).1, (hd _).2, sum_const, card_univ, nsmul_eq_mul]
        rw [← Nat.card_eq_fintype_card, Nat.card_prod, Nat.card_congr (subspaceBelowEquiv A.1 i.val),
          card_sizedSubspace, card_subsetsOfSize]
        rfl
      simp_rw [hinner]
      exact Fin.sum_univ_eq_sum_range (fun i : ℕ =>
        gaussian (Fintype.card F) (Module.finrank F A.1) i *
          A.2.card.choose (r - i) * v i (r - i)) (r + 1)

theorem card_frameFlag (A : Frame F V X) (s : List ℕ) :
    Nat.card (FrameFlag A s) =
      productFlag (Fintype.card F) (Module.finrank F A.1) A.2.card s := by
  induction s generalizing A with
  | nil => change Nat.card PUnit = 1; exact Nat.card_unique
  | cons r s ih =>
    letI := Fintype.ofFinite (FrameLayer A r)
    change Nat.card (Σ B : FrameLayer A r, FrameFlag B.val s) = _
    rw [Nat.card_sigma, productFlag]
    exact card_sigma_by_layer (A := A) (fun B => Nat.card (FrameFlag B.val s))
      (fun d t => productFlag (Fintype.card F) d t s) (fun B => ih B.val)

/-- Rank flags of actual flats, with a specified inclusive upper bound. -/
def FlatFlag (M : Matroid (Point F V X)) (A : Set (Point F V X)) : List ℕ → Type u
  | [] => PUnit
  | r :: s => Σ B : {B : RankedFlat M r // B.val ⊆ A}, FlatFlag M B.val.val s

instance flatFlag_finite (M : Matroid (Point F V X)) (A : Set (Point F V X)) (s : List ℕ) :
    Finite (FlatFlag M A s) := by
  induction s generalizing A with
  | nil => change Finite PUnit; infer_instance
  | cons r s ih =>
    change Finite (Σ B : {B : RankedFlat M r // B.val ⊆ A}, FlatFlag M B.val.val s)
    let _ (B : {B : RankedFlat M r // B.val ⊆ A}) : Finite (FlatFlag M B.val.val s) := ih _
    infer_instance

variable {B : Type*} (blocks : Blocks (F := F) (V := V) (X := X) B)

private def lowLayerEquiv (A : Frame F V X) {r : ℕ} (hr : r ≤ 3) :
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

private def lowFlagEquiv (A : Frame F V X) (s : List ℕ) (hs : ∀ r ∈ s, r ≤ 3) :
    FrameFlag A s ≃ FlatFlag (coalescedMatroid blocks) (carrier A) s := by
  induction s generalizing A with
  | nil => exact Equiv.refl _
  | cons r s ih =>
    exact Equiv.sigmaCongr (lowLayerEquiv blocks A (hs r (by simp))) fun C =>
      ih C.val (fun t ht => hs t (List.mem_cons_of_mem _ ht))

theorem card_lowFlatFlag (A : Frame F V X) (s : List ℕ) (hs : ∀ r ∈ s, r ≤ 3) :
    Nat.card (FlatFlag (coalescedMatroid blocks) (carrier A) s) =
      productFlag (Fintype.card F) (Module.finrank F A.1) A.2.card s :=
  (Nat.card_congr (lowFlagEquiv blocks A s hs).symm).trans (card_frameFlag A s)

variable [Fintype X] [Finite B]

def topFrame : Frame F V X := (⊤, univ)

theorem le_topFrame (A : Frame F V X) : A ≤ topFrame := ⟨le_top, subset_univ _⟩

@[simp] theorem carrier_topFrame :
    carrier (topFrame : Frame F V X) = Set.univ := by
  ext e
  exact iff_of_true (le_topFrame (pointFrame e)) (Set.mem_univ _)

private abbrev OldLayer :=
  {A : FrameLayer (topFrame : Frame F V X) 4 // ∀ b, ¬ A.val ≤ blocks.frame b}

private abbrev RemovedLayer :=
  {A : FrameLayer (topFrame : Frame F V X) 4 // ¬ ∀ b, ¬ A.val ≤ blocks.frame b}

private def removedEquiv :
    (Σ b : B, FrameLayer (blocks.frame b) 4) ≃ RemovedLayer blocks :=
  Equiv.ofBijective (fun ⟨b, A⟩ => ⟨⟨A.val, le_topFrame _, A.property.2⟩,
    fun h => h b A.property.1⟩) (by
    constructor
    · rintro ⟨b, A⟩ ⟨c, C⟩ he
      have he' : A.val = C.val := congrArg (fun (D : RemovedLayer blocks) => D.val.val) he
      have hbc := blocks.unique_above_four (show 4 ≤ frameRank A.val by rw [A.property.2])
        A.property.1 (he'.symm ▸ C.property.1)
      subst c
      rw [Subtype.ext he']
    · intro A
      obtain ⟨b, hb⟩ : ∃ b, A.val.val ≤ blocks.frame b := by
        simpa only [not_forall, not_not] using A.property
      exact ⟨⟨b, ⟨A.val.val, hb, A.val.property.2⟩⟩, rfl⟩)

private def hyperplaneEquiv
    (hblock : ∀ b, Nonempty (FrameLayer (blocks.frame b) 4)) :
    OldLayer blocks ⊕ B ≃
      {S : RankedFlat (coalescedMatroid blocks) 4 //
        S.val ⊆ carrier (topFrame : Frame F V X)} :=
  let oldMap (A : OldLayer blocks) := by
    have h := small_flat blocks (A := A.val.val) (by rw [A.val.property.2]) (fun _ => A.property)
    refine (⟨⟨carrier A.val.val, h.1, ?_⟩, carrier_mono A.val.property.1⟩ :
      {S : RankedFlat (coalescedMatroid blocks) 4 //
        S.val ⊆ carrier (topFrame : Frame F V X)})
    rw [h.2, A.val.property.2]
  let blockMap (b : B) := by
    let A := (hblock b).some
    have h := block_flat blocks A.property.2 A.property.1
    exact (⟨⟨carrier (blocks.frame b), h.1, h.2⟩, carrier_mono (le_topFrame _)⟩ :
      {S : RankedFlat (coalescedMatroid blocks) 4 //
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
        rw [hc, blocks.rank_five] at ha
        omega
      · have hc := carrier_injective h.symm
        have ha := C.val.property.2
        change C.val.val = blocks.frame b at hc
        rw [hc, blocks.rank_five] at ha
        omega
      · have hc := carrier_injective h
        exact congrArg Sum.inr (blocks.unique_above_four (by rw [blocks.rank_five]; decide)
          (le_refl _) hc.le)
    · intro S
      rcases rankedFlat_description blocks (le_refl 4) S.val with ⟨A, hA, hgood, hS⟩ | ⟨_, b, hb⟩
      · exact ⟨.inl ⟨⟨A, le_topFrame _, hA⟩, hgood rfl⟩,
          Subtype.ext (Subtype.ext hS.symm)⟩
      · exact ⟨.inr b, Subtype.ext (Subtype.ext hb.symm)⟩)

set_option maxHeartbeats 1500000 in
theorem hyperplane_replacement_count
    (hblock : ∀ b, Nonempty (FrameLayer (blocks.frame b) 4))
    (s : List ℕ) (hs : ∀ r ∈ s, r ≤ 3) :
    Nat.card (FlatFlag (coalescedMatroid blocks) (carrier (topFrame : Frame F V X)) (4 :: s)) +
      Nat.card (Σ b : B, FrameFlag (blocks.frame b) (4 :: s)) =
    Nat.card (FrameFlag (topFrame : Frame F V X) (4 :: s)) +
      Nat.card (Σ b : B, FrameFlag (blocks.frame b) s) := by
  let good := Σ A : OldLayer blocks, FrameFlag A.val.val s
  let bad := Σ A : RemovedLayer blocks, FrameFlag A.val.val s
  let new := Σ b : B, FrameFlag (blocks.frame b) s
  have hactual :
      Nat.card (FlatFlag (coalescedMatroid blocks) (carrier (topFrame : Frame F V X)) (4 :: s)) =
        Nat.card good + Nat.card new := by
    rw [← Nat.card_sum]
    let fibers : OldLayer blocks ⊕ B → Type _ :=
      Sum.elim (fun A => FrameFlag A.val.val s) (fun b => FrameFlag (blocks.frame b) s)
    let target (C : {S : RankedFlat (coalescedMatroid blocks) 4 //
        S.val ⊆ carrier (topFrame : Frame F V X)}) := FlatFlag (coalescedMatroid blocks) C.val.val s
    have fiberEquiv (A : OldLayer blocks ⊕ B) :
        fibers A ≃ target (hyperplaneEquiv blocks hblock A) := by
      cases A with
      | inl A => exact lowFlagEquiv blocks A.val.val s hs
      | inr b => exact lowFlagEquiv blocks (blocks.frame b) s hs
    exact Nat.card_congr (((Equiv.sumSigmaDistrib fibers).symm.trans
      (Equiv.sigmaCongr (hyperplaneEquiv blocks hblock) fiberEquiv)).symm)
  have hbase : Nat.card (FrameFlag (topFrame : Frame F V X) (4 :: s)) =
      Nat.card good + Nat.card bad := by
    rw [← Nat.card_sum]
    let e := Equiv.sumCompl (fun A : FrameLayer (topFrame : Frame F V X) 4 =>
      ∀ b, ¬ A.val ≤ blocks.frame b)
    let fibers (A : OldLayer blocks ⊕ RemovedLayer blocks) := FrameFlag (e A).val s
    exact Nat.card_congr (((Equiv.sumSigmaDistrib fibers).symm.trans
      (Equiv.sigmaCongr e (fun A => Equiv.refl (fibers A)))).symm)
  have hbad : Nat.card (Σ b : B, FrameFlag (blocks.frame b) (4 :: s)) =
      Nat.card bad :=
    Nat.card_congr ((Equiv.sigmaAssoc _).symm.trans
      (Equiv.sigmaCongr (removedEquiv blocks) (fun _ => Equiv.refl _)))
  dsimp only [new] at hactual
  rw [hactual, hbase, hbad]
  ac_rfl

end
end CaioloFerroniHoster
