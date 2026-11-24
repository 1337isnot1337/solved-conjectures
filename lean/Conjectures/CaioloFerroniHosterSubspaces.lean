import Conjectures.CaioloFerroniHosterArithmetic
import Mathlib.LinearAlgebra.Dual.Lemmas
import Mathlib.LinearAlgebra.FiniteDimensional.Lemmas
import Mathlib.Tactic

/-! Counting subspaces by projection along one fixed line. -/

namespace CaioloFerroniHoster

open Submodule
open scoped Classical

noncomputable section

universe u

variable {F W : Type u} [Field F] [Fintype F] [AddCommGroup W] [Module F W]
variable [Module.Finite F W]

abbrev SizedSubspace (F W : Type*) [Field F] [AddCommGroup W] [Module F W] (d : ℕ) :=
  {S : Submodule F W // Module.finrank F S = d}

instance [Finite W] : Finite (Submodule F W) :=
  Finite.of_injective (fun S : Submodule F W => (S : Set W)) SetLike.coe_injective

private def vertical : Submodule F (W × F) :=
  (⊥ : Submodule F W).prod ⊤

private def proj (S : Submodule F (W × F)) : Submodule F W :=
  S.map (LinearMap.fst F W F)

private def pull (T : Submodule F W) : Submodule F (W × F) :=
  T.prod ⊤

omit [Fintype F] [Module.Finite F W] in
private theorem mem_vertical {v : W × F} : v ∈ vertical (F := F) (W := W) ↔ v.1 = 0 := by
  simp [vertical]

omit [Fintype F] [Module.Finite F W] in
private theorem mem_pull {T : Submodule F W} {v : W × F} : v ∈ pull T ↔ v.1 ∈ T := by
  simp [pull]

omit [Fintype F] [Module.Finite F W] in
private theorem proj_pull (T : Submodule F W) : proj (pull T) = T := by
  ext x
  constructor
  · rintro ⟨v, hv, rfl⟩
    exact mem_pull.mp hv
  · intro hx
    exact ⟨(x, 0), mem_pull.mpr hx, rfl⟩

omit [Fintype F] [Module.Finite F W] in
private theorem pull_proj {S : Submodule F (W × F)} (h : vertical ≤ S) :
    pull (proj S) = S := by
  ext v
  rw [mem_pull]
  constructor
  · rintro ⟨w, hw, hv⟩
    have hz : v - w ∈ vertical := mem_vertical.mpr (sub_eq_zero.mpr hv.symm)
    simpa using S.add_mem (h hz) hw
  · exact fun hv => ⟨v, hv, rfl⟩

private def pullEquiv (T : Submodule F W) : pull T ≃ₗ[F] T × F where
  toFun v := (⟨v.val.1, mem_pull.mp v.property⟩, v.val.2)
  invFun v := ⟨(v.1.val, v.2), mem_pull.mpr v.1.property⟩
  left_inv _ := rfl
  right_inv _ := rfl
  map_add' _ _ := rfl
  map_smul' _ _ := rfl

omit [Fintype F] in
private theorem pull_rank (T : Submodule F W) :
    Module.finrank F (pull T) = Module.finrank F T + 1 := by
  rw [(pullEquiv T).finrank_eq, Module.finrank_prod, Module.finrank_self]

private def projMap (S : Submodule F (W × F)) : S →ₗ[F] proj S :=
  ((LinearMap.fst F W F).comp S.subtype).codRestrict (proj S) fun v => ⟨v, v.property, rfl⟩

omit [Fintype F] in
private theorem vertical_atom : IsAtom (vertical (F := F) (W := W)) := by
  rw [Submodule.isAtom_iff_finrank_eq_one]
  change Module.finrank F (pull (⊥ : Submodule F W)) = 1
  rw [pull_rank, finrank_bot]

omit [Fintype F] in
private theorem projMap_bijective {S : Submodule F (W × F)} (h : ¬ vertical ≤ S) :
    Function.Bijective (projMap S) := by
  have hbot : S ⊓ vertical = ⊥ :=
    (vertical_atom.le_iff.mp inf_le_right).resolve_right
      (fun he => h (he ▸ inf_le_left))
  refine ⟨?_, ?_⟩
  · apply LinearMap.ker_eq_bot.mp
    rw [eq_bot_iff]
    intro v hv
    change projMap S v = 0 at hv
    have hfst : v.val.1 = 0 := congrArg Subtype.val hv
    have hz : v.val ∈ S ⊓ vertical := ⟨v.property, mem_vertical.mpr hfst⟩
    rw [hbot, Submodule.mem_bot] at hz
    simpa only [Submodule.mem_bot] using (Subtype.ext hz : v = 0)
  · rintro ⟨x, v, hv, rfl⟩
    exact ⟨⟨v, hv⟩, rfl⟩

private def projectEquiv {S : Submodule F (W × F)} (h : ¬ vertical ≤ S) :
    S ≃ₗ[F] proj S :=
  LinearEquiv.ofBijective (projMap S) (projMap_bijective h)

private def graphOver (T : Submodule F W) (l : T →ₗ[F] F) : Submodule F (W × F) :=
  (T.subtype.prod l).range

omit [Fintype F] [Module.Finite F W] in
private theorem mem_graphOver {T : Submodule F W} {l : T →ₗ[F] F} {v : W × F} :
    v ∈ graphOver T l ↔ ∃ x : T, (x.val, l x) = v := Iff.rfl

omit [Fintype F] [Module.Finite F W] in
private theorem proj_graphOver (T : Submodule F W) (l : T →ₗ[F] F) :
    proj (graphOver T l) = T := by
  ext x
  constructor
  · rintro ⟨v, ⟨w, rfl⟩, rfl⟩
    exact w.property
  · intro hx
    exact ⟨(x, l ⟨x, hx⟩), ⟨⟨x, hx⟩, rfl⟩, rfl⟩

omit [Fintype F] [Module.Finite F W] in
private theorem vertical_not_le_graphOver (T : Submodule F W) (l : T →ₗ[F] F) :
    ¬ vertical ≤ graphOver T l := by
  intro h
  obtain ⟨x, hx⟩ := mem_graphOver.mp (h (show (0, 1) ∈ vertical from mem_vertical.mpr rfl))
  have h0 : x = 0 := Subtype.ext (congrArg Prod.fst hx)
  have h1 := congrArg Prod.snd hx
  simp [h0] at h1

private def graphOverOf {S : Submodule F (W × F)} (h : ¬ vertical ≤ S) :
    proj S →ₗ[F] F :=
  (LinearMap.snd F W F).comp (S.subtype.comp (projectEquiv h).symm.toLinearMap)

omit [Fintype F] in
private theorem graphOver_eq {S : Submodule F (W × F)} (h : ¬ vertical ≤ S) :
    graphOver (proj S) (graphOverOf h) = S := by
  have hfst (x : proj S) : ((projectEquiv h).symm x).val.1 = x.val :=
    congrArg Subtype.val ((projectEquiv h).apply_symm_apply x)
  ext v
  rw [mem_graphOver]
  constructor
  · rintro ⟨x, rfl⟩
    have he : (x.val, graphOverOf h x) = ((projectEquiv h).symm x).val :=
      Prod.ext (hfst x).symm rfl
    rw [he]
    exact ((projectEquiv h).symm x).property
  · intro hv
    refine ⟨projectEquiv h ⟨v, hv⟩, Prod.ext rfl ?_⟩
    change ((projectEquiv h).symm (projectEquiv h ⟨v, hv⟩)).val.2 = v.2
    rw [LinearEquiv.symm_apply_apply]

omit [Fintype F] [Module.Finite F W] in
private theorem graphOver_inj (T : Submodule F W) {f g : T →ₗ[F] F}
    (he : graphOver T f = graphOver T g) : f = g := by
  ext x
  have hx : (x.val, f x) ∈ graphOver T g := he ▸ mem_graphOver.mpr ⟨x, rfl⟩
  obtain ⟨y, hy⟩ := mem_graphOver.mp hx
  have hyx : y = x := Subtype.ext (congrArg Prod.fst hy)
  exact (hyx ▸ congrArg Prod.snd hy).symm

private def containsEquiv (i : ℕ) :
    SizedSubspace F W i ≃ {S : SizedSubspace F (W × F) (i + 1) // vertical ≤ S.val} where
  toFun T := ⟨⟨pull T, by rw [pull_rank, T.property]⟩, fun _ hv =>
    mem_pull.mpr (by rw [mem_vertical.mp hv]; exact T.val.zero_mem)⟩
  invFun S := ⟨proj S.val.val, by
    have h := pull_rank (proj S.val.val)
    rw [pull_proj S.property, S.val.property] at h
    omega⟩
  left_inv T := Subtype.ext (proj_pull T.val)
  right_inv S := Subtype.ext (Subtype.ext (pull_proj S.property))

private def omitsEquiv (i : ℕ) :
    (Σ T : SizedSubspace F W i, T.val →ₗ[F] F) ≃
      {S : SizedSubspace F (W × F) i // ¬ vertical ≤ S.val} :=
  Equiv.ofBijective (fun ⟨T, l⟩ =>
    let h := vertical_not_le_graphOver T.val l
    ⟨⟨graphOver T.val l, by rw [(projectEquiv h).finrank_eq, proj_graphOver, T.property]⟩, h⟩)
    (by
      constructor
      · rintro ⟨T, f⟩ ⟨U, g⟩ he
        have he' : graphOver T.val f = graphOver U.val g := congrArg (fun S => S.val.val) he
        have hTU : T = U := Subtype.ext (by simpa only [proj_graphOver] using congrArg proj he')
        subst U
        rw [graphOver_inj T.val he']
      · intro S
        let h := S.property
        let T : SizedSubspace F W i := ⟨proj S.val.val,
          (projectEquiv h).finrank_eq.symm.trans S.val.property⟩
        exact ⟨⟨T, graphOverOf h⟩, Subtype.ext (Subtype.ext (graphOver_eq h))⟩)

private theorem sizedSpace_succ (i : ℕ) :
    Nat.card (SizedSubspace F (W × F) (i + 1)) =
      Nat.card (SizedSubspace F W i) +
        Fintype.card F ^ (i + 1) * Nat.card (SizedSubspace F W (i + 1)) := by
  have : Finite W := Module.finite_of_finite F
  rw [← Nat.card_congr (Equiv.sumCompl
    (fun S : SizedSubspace F (W × F) (i + 1) => vertical ≤ S.val)),
    Nat.card_sum, ← Nat.card_congr (containsEquiv i), ← Nat.card_congr (omitsEquiv (i + 1))]
  let _ : Fintype (SizedSubspace F W (i + 1)) := Fintype.ofFinite _
  let _ (T : SizedSubspace F W (i + 1)) : Finite (T.val →ₗ[F] F) :=
    Finite.of_injective (fun l : T.val →ₗ[F] F => (l : T.val → F)) DFunLike.coe_injective
  rw [Nat.card_sigma]
  congr 1
  have hc (T : SizedSubspace F W (i + 1)) :
      Nat.card (T.val →ₗ[F] F) = Fintype.card F ^ (i + 1) := by
    rw [Module.natCard_eq_pow_finrank (K := F), Nat.card_eq_fintype_card]
    change _ ^ Module.finrank F (Module.Dual F T.val) = _
    rw [Subspace.dual_finrank_eq, T.property]
  simp_rw [hc]
  rw [Finset.sum_const, Finset.card_univ, nsmul_eq_mul, ← Nat.card_eq_fintype_card, mul_comm, Nat.cast_id]

private def sizedSpaceCongr {V : Type*} [AddCommGroup V] [Module F V]
    (e : W ≃ₗ[F] V) (i : ℕ) : SizedSubspace F W i ≃ SizedSubspace F V i where
  toFun S := ⟨S.val.map e.toLinearMap, (e.submoduleMap S.val).finrank_eq.symm.trans S.property⟩
  invFun S := ⟨S.val.map e.symm.toLinearMap,
    (e.symm.submoduleMap S.val).finrank_eq.symm.trans S.property⟩
  left_inv S := Subtype.ext (by simp [← Submodule.map_comp])
  right_inv S := Subtype.ext (by simp [← Submodule.map_comp])


theorem card_sizedSubspace (i : ℕ) :
    Nat.card (SizedSubspace F W i) = gaussian (Fintype.card F) (Module.finrank F W) i := by
  generalize hn : Module.finrank F W = n
  induction n generalizing W i with
  | zero =>
    cases i with
    | zero =>
      simp only [gaussian, ite_true]
      have : Unique (SizedSubspace F W 0) :=
        ⟨⟨⟨⊥, finrank_bot _ _⟩⟩, fun T => Subtype.ext (finrank_eq_zero.mp T.property)⟩
      exact Nat.card_unique
    | succ i =>
      simp only [gaussian, Nat.succ_ne_zero, ite_false, Nat.card_eq_zero]
      exact Or.inl ⟨fun T => by
        have := Submodule.finrank_le T.val
        rw [T.property, hn] at this
        omega⟩
  | succ n ih =>
    cases i with
    | zero =>
      rw [gaussian]
      have : Unique (SizedSubspace F W 0) :=
        ⟨⟨⟨⊥, finrank_bot _ _⟩⟩, fun T => Subtype.ext (finrank_eq_zero.mp T.property)⟩
      exact Nat.card_unique
    | succ i =>
      let V := Fin n → F
      have hV : Module.finrank F V = n := by simp [V, Module.finrank_fintype_fun_eq_card]
      have hWV : Module.finrank F W = Module.finrank F (V × F) := by
        rw [hn, Module.finrank_prod, Module.finrank_self, hV]
      let e := LinearEquiv.ofFinrankEq W (V × F) hWV
      rw [Nat.card_congr (sizedSpaceCongr e _), sizedSpace_succ, ih _ hV, ih _ hV, gaussian]

end
end CaioloFerroniHoster
