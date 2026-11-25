module

public import Conjectures.ShumyatskyFactorAction
public import Mathlib.GroupTheory.Subgroup.Simple
public import Mathlib.GroupTheory.Subgroup.Center

/-!
# Automorphisms of a product of nonabelian simple factors

The coordinate subgroups are precisely the minimal nontrivial normal
subgroups of the direct product. Use this to recover the permutation
of factors from an arbitrary automorphism of the actual product.
-/

@[expose] public section

namespace Shumyatsky

variable {ι S : Type*} [Group S] [DecidableEq ι]
local notation "singleFactor" => Pi.mulSingle (M := fun _ : ι => S)

theorem coordinateFactor_normal (i : ι) : (coordinateFactor (S := S) i).Normal where
  conj_mem x hx v := by
    obtain ⟨s, rfl⟩ := hx
    refine ⟨v i * s * (v i)⁻¹, ?_⟩
    funext j
    change singleFactor i (v i * s * (v i)⁻¹) j = v j * singleFactor i s j * (v j)⁻¹
    by_cases h : j = i
    · subst j
      simp
    · simp [Pi.mulSingle_eq_of_ne h]

theorem coordinateFactor_le_iff [Nontrivial S] (i j : ι) :
    coordinateFactor (S := S) i ≤ coordinateFactor j ↔ i = j := by
  constructor
  · intro h
    by_contra hne
    obtain ⟨s, hs⟩ := exists_ne (1 : S)
    have hmem : singleFactor i s ∈ coordinateFactor j := h ⟨s, rfl⟩
    obtain ⟨t, ht⟩ := hmem
    have he : singleFactor j t i = singleFactor i s i := congrFun ht i
    rw [Pi.mulSingle_eq_of_ne hne, Pi.mulSingle_eq_same] at he
    exact hs he.symm
  · rintro rfl
    exact le_rfl

theorem coordinateFactor_ne_bot [Nontrivial S] (i : ι) :
    coordinateFactor (S := S) i ≠ ⊥ := by
  intro h
  obtain ⟨s, hs⟩ := exists_ne (1 : S)
  have hmem : singleFactor i s ∈ coordinateFactor i := ⟨s, rfl⟩
  rw [h, Subgroup.mem_bot] at hmem
  exact hs (by simpa using congrFun hmem i)

private theorem coordinateFactor_le_of_nonidentity_single [IsSimpleGroup S]
    (N : Subgroup (ι → S)) [N.Normal] (i : ι) (s : S)
    (hs : s ≠ 1) (hmem : singleFactor i s ∈ N) : coordinateFactor i ≤ N := by
  let single : S →* (ι → S) := MonoidHom.mulSingle (fun _ : ι => S) i
  have : (N.comap single).Normal := Subgroup.Normal.comap inferInstance single
  rcases Subgroup.Normal.eq_bot_or_eq_top (N.comap single) with hbot | htop
  · have h : s ∈ N.comap single := hmem
    rw [hbot, Subgroup.mem_bot] at h
    exact (hs h).elim
  · rintro x ⟨t, rfl⟩
    change t ∈ N.comap single
    rw [htop]
    exact Subgroup.mem_top t

/-- Every nontrivial normal subgroup contains an entire factor. -/
theorem exists_coordinateFactor_le_normal [IsSimpleGroup S]
    (hCenter : Subgroup.center S = ⊥) (N : Subgroup (ι → S)) [N.Normal]
    (hN : N ≠ ⊥) : ∃ i, coordinateFactor (S := S) i ≤ N := by
  have hx : ∃ x ∈ N, x ≠ (1 : ι → S) := by
    by_contra! h
    apply hN
    exact le_antisymm (fun x hx => Subgroup.mem_bot.mpr (h x hx)) bot_le
  obtain ⟨x, hxN, hx⟩ := hx
  have hi : ∃ i, x i ≠ 1 := by
    by_contra! h
    exact hx (funext h)
  obtain ⟨i, hi⟩ := hi
  have hs : ∃ s : S, s * x i * s⁻¹ * (x i)⁻¹ ≠ 1 := by
    by_contra! h
    have hc : x i ∈ Subgroup.center S := by
      rw [Subgroup.mem_center_iff]
      intro s
      have he := h s
      have h' : s * x i * s⁻¹ = x i := mul_inv_eq_one.mp he
      exact mul_inv_eq_iff_eq_mul.mp h'
    rw [hCenter, Subgroup.mem_bot] at hc
    exact hi hc
  obtain ⟨s, hs⟩ := hs
  let v : ι → S := singleFactor i s
  have hmem : v * x * v⁻¹ * x⁻¹ ∈ N :=
    N.mul_mem (Subgroup.Normal.conj_mem inferInstance x hxN v) (N.inv_mem hxN)
  have he : v * x * v⁻¹ * x⁻¹ = singleFactor i (s * x i * s⁻¹ * (x i)⁻¹) := by
    funext j
    change v j * x j * (v j)⁻¹ * (x j)⁻¹ = _
    by_cases hj : j = i
    · subst j
      simp [v]
    · simp [v, Pi.mulSingle_eq_of_ne hj]
  rw [he] at hmem
  exact ⟨i, coordinateFactor_le_of_nonidentity_single N i _ hs hmem⟩

theorem eq_coordinateFactor_of_normal_le [IsSimpleGroup S]
    (hCenter : Subgroup.center S = ⊥) (N : Subgroup (ι → S))
    [N.Normal] (hN : N ≠ ⊥) (i : ι) (hNi : N ≤ coordinateFactor i) :
    N = coordinateFactor i := by
  obtain ⟨j, hj⟩ := exists_coordinateFactor_le_normal hCenter N hN
  have hji := (coordinateFactor_le_iff j i).1 (hj.trans hNi)
  subst j
  exact le_antisymm hNi hj

/-- Every automorphism of the product permutes the actual simple factors. -/
theorem exists_factor_permutation [Finite ι] [IsSimpleGroup S]
    (hCenter : Subgroup.center S = ⊥) (e : MulAut (ι → S)) :
    ∃ σ : Equiv.Perm ι, ∀ i, (coordinateFactor (S := S) i).map
      (e : (ι → S) →* (ι → S)) = coordinateFactor (σ i) := by
  let f : (ι → S) →* (ι → S) := e
  have hImage (i : ι) : ∃ j, (coordinateFactor (S := S) i).map f = coordinateFactor j := by
    let U := (coordinateFactor (S := S) i).map f
    have : U.Normal := (coordinateFactor_normal i).map f e.surjective
    have hU : U ≠ ⊥ := fun h =>
      coordinateFactor_ne_bot i ((Subgroup.map_eq_bot_iff_of_injective (coordinateFactor i) (f := f) e.injective).1 h)
    obtain ⟨j, hj⟩ := exists_coordinateFactor_le_normal hCenter U hU
    let V := (coordinateFactor (S := S) j).comap f
    have hMap : V.map f = coordinateFactor j :=
      Subgroup.map_comap_eq_self_of_surjective e.surjective _
    have : V.Normal := (coordinateFactor_normal j).comap f
    have hV : V ≠ ⊥ := by
      intro h
      rw [h, Subgroup.map_bot] at hMap
      exact coordinateFactor_ne_bot j hMap.symm
    have hVi : V ≤ coordinateFactor i := by
      apply (Subgroup.map_le_map_iff_of_injective (f := f) e.injective).1
      rw [hMap]
      exact hj
    have hEq := eq_coordinateFactor_of_normal_le hCenter V hV i hVi
    exact ⟨j, hEq ▸ hMap⟩
  choose σ hσ using hImage
  have hInjective : Function.Injective σ := by
    intro i j h
    apply (coordinateFactor_le_iff (S := S) i j).1
    apply (Subgroup.map_le_map_iff_of_injective (f := f) e.injective).1
    rw [hσ i, hσ j, h]
  exact ⟨Equiv.ofBijective σ ⟨hInjective, Finite.surjective_of_injective hInjective⟩, hσ⟩

/-- The exact wreath-product representation used in the written lift. -/
theorem exists_simple_product_factorAction [Finite ι] [IsSimpleGroup S]
    (hCenter : Subgroup.center S = ⊥) (e : MulAut (ι → S)) :
    ∃ (σ : Equiv.Perm ι) (a : ι → MulAut S), e = factorAction σ a := by
  obtain ⟨σ, hσ⟩ := exists_factor_permutation hCenter e
  obtain ⟨a, ha⟩ := exists_factorAction_of_maps_factors e σ hσ
  exact ⟨σ, a, ha⟩

/-- For nonabelian simple factors, the center condition follows from
    simplicity, so the product representation has the original
    hypotheses of the written lifting argument. -/
theorem exists_nonabelian_simple_product_factorAction [Finite ι] [IsSimpleGroup S]
    (hNoncomm : ¬ IsMulCommutative S) (e : MulAut (ι → S)) :
    ∃ (σ : Equiv.Perm ι) (a : ι → MulAut S), e = factorAction σ a := by
  have hCenter := (Subgroup.Normal.eq_bot_or_eq_top (Subgroup.center S)).resolve_right
    fun h => hNoncomm (Subgroup.center_eq_top_iff.mp h)
  exact exists_simple_product_factorAction hCenter e

end Shumyatsky
