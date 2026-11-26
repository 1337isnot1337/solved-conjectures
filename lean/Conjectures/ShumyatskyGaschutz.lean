module

public import Mathlib.Algebra.Group.Subgroup.Basic
public import Mathlib.Data.Fin.VecNotation
public import Mathlib.Data.Fintype.BigOperators
public import Mathlib.Order.Preorder.Finite
public import Mathlib.SetTheory.Cardinal.Finite

/-! Gaschütz's lifting lemma for finite groups. The number of lifts
generating any given subgroup is independent of the chosen generating
tuple in the quotient. -/

@[expose] public section

namespace Shumyatsky

variable {G Q I : Type*} [Group G] [Group Q]

private def TupleLifts (f : G →* Q) (a : I → Q) (H : Subgroup G) :=
  {z : I → G // (∀ i, z i ∈ H) ∧ ∀ i, f (z i) = a i}

private def ExactTupleLifts (f : G →* Q) (a : I → Q) (H : Subgroup G) :=
  {z : I → G // Subgroup.closure (Set.range z) = H ∧ ∀ i, f (z i) = a i}

private instance [Finite G] [Finite I] (f : G →* Q) (a : I → Q) (H : Subgroup G) :
    Finite (TupleLifts f a H) := by
  unfold TupleLifts
  infer_instance

private instance [Finite G] [Finite I] (f : G →* Q) (a : I → Q) (H : Subgroup G) :
    Finite (ExactTupleLifts f a H) := by
  unfold ExactTupleLifts
  infer_instance

private theorem card_tupleLifts_eq (f : G →* Q) (a b : I → Q)
    (ha : Subgroup.closure (Set.range a) = ⊤)
    (hb : Subgroup.closure (Set.range b) = ⊤) (H : Subgroup G) :
    Nat.card (TupleLifts f a H) = Nat.card (TupleLifts f b H) := by
  classical
  by_cases hH : H.map f = ⊤
  · have hAdjust (i : I) : ∃ c : H, f c = b i * (a i)⁻¹ := by
      have hMem : b i * (a i)⁻¹ ∈ H.map f := hH.symm ▸ Subgroup.mem_top _
      obtain ⟨c, hc, he⟩ := Subgroup.mem_map.mp hMem
      exact ⟨⟨c, hc⟩, he⟩
    choose c hc using hAdjust
    apply Nat.card_congr
    refine {
      toFun := fun z => ⟨fun i => (c i : G) * z.val i, fun i => H.mul_mem (c i).property (z.property.1 i), ?_⟩
      invFun := fun z => ⟨fun i => (c i : G)⁻¹ * z.val i,
        fun i => H.mul_mem (H.inv_mem (c i).property) (z.property.1 i), ?_⟩
      left_inv := ?_
      right_inv := ?_ }
    · intro i
      rw [map_mul, hc, z.property.2, inv_mul_cancel_right]
    · intro i
      rw [map_mul, map_inv, hc, z.property.2, mul_inv_rev, inv_inv, mul_assoc,
        inv_mul_cancel, mul_one]
    · intro z
      exact Subtype.ext (funext fun i => inv_mul_cancel_left _ _)
    · intro z
      exact Subtype.ext (funext fun i => mul_inv_cancel_left _ _)
  · have hEmpty (d : I → Q) (hd : Subgroup.closure (Set.range d) = ⊤) :
        IsEmpty (TupleLifts f d H) := ⟨fun z => by
      apply hH
      apply top_unique
      rw [← hd]
      apply (Subgroup.closure_le _).mpr
      rintro _ ⟨i, rfl⟩
      exact ⟨z.val i, z.property.1 i, z.property.2 i⟩⟩
    exact (Nat.card_eq_zero.mpr (Or.inl (hEmpty a ha))).trans
      (Nat.card_eq_zero.mpr (Or.inl (hEmpty b hb))).symm

private noncomputable def tupleLiftsSplit (f : G →* Q) (a : I → Q) (H : Subgroup G) :
    TupleLifts f a H ≃ (ExactTupleLifts f a H ⊕
      Σ K : Set.Iio H, ExactTupleLifts f a K.val) := by
  classical
  let into (K : Subgroup G) (hK : K ≤ H) (z : ExactTupleLifts f a K) : TupleLifts f a H :=
    ⟨z.val, fun i => hK (Eq.mp (congrArg (fun J : Subgroup G => z.val i ∈ J) z.property.1)
      (Subgroup.subset_closure (Set.mem_range_self i))), z.property.2⟩
  refine {
    toFun := fun z => if h : Subgroup.closure (Set.range z.val) = H then
      Sum.inl ⟨z.val, h, z.property.2⟩
      else Sum.inr ⟨⟨Subgroup.closure (Set.range z.val),
        lt_of_le_of_ne ((Subgroup.closure_le _).mpr (Set.range_subset_iff.mpr z.property.1)) h⟩,
        ⟨z.val, rfl, z.property.2⟩⟩
    invFun := Sum.elim (into H le_rfl) (fun ⟨K, z⟩ => into K.val (le_of_lt K.property) z)
    left_inv := ?_
    right_inv := ?_}
  · intro z
    dsimp only
    split <;> exact Subtype.ext rfl
  · rintro (z | ⟨K, z⟩)
    · dsimp only [Sum.elim, into]
      rw [dite_eq_left z.property.1]
      exact congrArg Sum.inl (Subtype.ext rfl)
    · have hNe : Subgroup.closure (Set.range z.val) ≠ H :=
        z.property.1.trans_ne (ne_of_lt K.property)
      dsimp only [Sum.elim, into]
      rw [dite_eq_right hNe]
      congr 1
      apply Sigma.subtype_ext
      · exact Subtype.ext z.property.1
      · rfl

/-- Every generating tuple of the quotient has the same number of
    lifts that generate any fixed subgroup of the ambient finite group. -/
theorem card_exact_generating_lifts_eq [Finite G] [Finite I]
    (f : G →* Q) (a b : I → Q)
    (ha : Subgroup.closure (Set.range a) = ⊤)
    (hb : Subgroup.closure (Set.range b) = ⊤) (H : Subgroup G) :
    Nat.card {z : I → G // Subgroup.closure (Set.range z) = H ∧ ∀ i, f (z i) = a i} =
      Nat.card {z : I → G // Subgroup.closure (Set.range z) = H ∧ ∀ i, f (z i) = b i} := by
  classical
  have : Finite (Subgroup G) :=
    Finite.of_injective (fun K : Subgroup G => (K : Set G)) SetLike.coe_injective
  change Nat.card (ExactTupleLifts f a H) = Nat.card (ExactTupleLifts f b H)
  induction H using WellFoundedLT.induction with
  | ind H ih =>
    have h := card_tupleLifts_eq f a b ha hb H
    let eA := tupleLiftsSplit f a H
    let eB := tupleLiftsSplit f b H
    have : Finite (Σ K : Set.Iio H, ExactTupleLifts f a K.val) :=
      Finite.of_injective _ (eA.symm.injective.comp Sum.inr_injective)
    have : Finite (Σ K : Set.Iio H, ExactTupleLifts f b K.val) :=
      Finite.of_injective _ (eB.symm.injective.comp Sum.inr_injective)
    rw [Nat.card_congr eA, Nat.card_congr eB, Nat.card_sum, Nat.card_sum] at h
    let _ := Fintype.ofFinite (Set.Iio H)
    rw [Nat.card_sigma, Nat.card_sigma] at h
    have hSum : ∑ K : Set.Iio H, Nat.card (ExactTupleLifts f a (K : Subgroup G)) =
        ∑ K : Set.Iio H, Nat.card (ExactTupleLifts f b (K : Subgroup G)) :=
      Finset.sum_congr rfl (fun K _ => ih K.val K.property)
    rw [hSum] at h
    exact Nat.add_right_cancel h

/-- Gaschütz's lemma. If the ambient group has a generating tuple of
    this length, then every generating tuple in any quotient lifts. -/
theorem exists_generating_lifts [Finite G] [Finite I] (f : G →* Q)
    (hf : Function.Surjective f) (a : I → Q)
    (ha : Subgroup.closure (Set.range a) = ⊤)
    (hGen : ∃ z : I → G, Subgroup.closure (Set.range z) = ⊤) :
    ∃ z : I → G, Subgroup.closure (Set.range z) = ⊤ ∧ ∀ i, f (z i) = a i := by
  obtain ⟨z, hZ⟩ := hGen
  let b : I → Q := f ∘ z
  have hb : Subgroup.closure (Set.range b) = ⊤ := by
    rw [show Set.range b = f '' Set.range z from Set.range_comp f z,
      ← MonoidHom.map_closure, hZ, Subgroup.map_top, MonoidHom.range_eq_top.mpr hf]
  have he := card_exact_generating_lifts_eq f a b ha hb ⊤
  have hNonempty : Nonempty {w : I → G //
      Subgroup.closure (Set.range w) = ⊤ ∧ ∀ i, f (w i) = b i} := ⟨⟨z, hZ, fun _ => rfl⟩⟩
  have hPos := (Nat.card_pos_iff (α := {w : I → G //
      Subgroup.closure (Set.range w) = ⊤ ∧ ∀ i, f (w i) = b i})).2 ⟨hNonempty, inferInstance⟩
  rw [← he] at hPos
  obtain ⟨w⟩ := (Nat.card_pos_iff.mp hPos).1
  exact ⟨w.val, w.property⟩

/-- The ordered-pair form used for the two outer word labels. -/
theorem exists_generating_pair_lifts [Finite G] (f : G →* Q)
    (hf : Function.Surjective f) (a b : Q)
    (hQ : Subgroup.closure {a, b} = ⊤)
    (hG : ∃ x y : G, Subgroup.closure {x, y} = ⊤) :
    ∃ x y : G, f x = a ∧ f y = b ∧ Subgroup.closure {x, y} = ⊤ := by
  let q : Fin 2 → Q := ![a, b]
  have hRange : Set.range q = {a, b} := Matrix.range_cons_cons_empty a b ![]
  obtain ⟨z, hz, hLifts⟩ := exists_generating_lifts f hf q (hRange ▸ hQ) (by
    obtain ⟨x, y, hxy⟩ := hG
    exact ⟨![x, y], (Matrix.range_cons_cons_empty x y ![]).symm ▸ hxy⟩)
  have hZ : Set.range z = {z 0, z 1} := by
    rw [← Matrix.range_cons_cons_empty (z 0) (z 1) ![]]
    congr 1
    funext i
    rcases Fin.eq_zero_or_eq_succ i with h | ⟨j, h⟩
    · subst i
      rfl
    · subst i
      have hj : j = 0 := Subsingleton.elim _ _
      subst j
      rfl
  exact ⟨z 0, z 1, hLifts 0, hLifts 1, hZ ▸ hz⟩

end Shumyatsky
