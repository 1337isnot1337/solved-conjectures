module

public import Conjectures.ShumyatskySocleStructure
public import Conjectures.ShumyatskyCyclicNormalization
public import Conjectures.ShumyatskyCoprimeQuotient

/-! Realize the one-factor adjustment on the actual conjugation image
of the ambient group and its quotient by the inner automorphisms. -/

@[expose] public section

namespace Shumyatsky

variable {G : Type*} [Group G]

/-- The action of the ambient group on a normal subgroup, with its
    actual automorphism image as codomain. -/
def normalActionToRange (N : Subgroup G) [N.Normal] :
    G →* (MulAut.conjNormal (H := N)).range :=
  (MulAut.conjNormal (H := N)).rangeRestrict

/-- The subgroup of inner automorphisms inside the ambient action image. -/
def innerActionInRange (N : Subgroup G) [N.Normal] :
    Subgroup (MulAut.conjNormal (H := N)).range :=
  N.map (normalActionToRange N)

instance innerActionInRange_normal (N : Subgroup G) [N.Normal] :
    (innerActionInRange N).Normal :=
  Subgroup.Normal.map inferInstance _ (MulAut.conjNormal (H := N)).rangeRestrict_surjective

/-- Under the inclusion of the action image, its inner subgroup is
    exactly the inner automorphisms of the factor. -/
theorem map_innerActionInRange_eq_conj_range (N : Subgroup G) [N.Normal] :
    (innerActionInRange N).map ((MulAut.conjNormal (H := N)).range).subtype =
      (MulAut.conj (G := N)).range := by
  rw [innerActionInRange, Subgroup.map_map]
  ext x
  constructor
  · intro hx
    obtain ⟨a, ha, rfl⟩ := Subgroup.mem_map.mp hx
    exact ⟨⟨a, ha⟩, (MulAut.conjNormal_val (h := ⟨a, ha⟩)).symm⟩
  · intro hx
    obtain ⟨a, rfl⟩ := MonoidHom.mem_range.mp hx
    exact ⟨a, a.property, MulAut.conjNormal_val⟩

/-- The ambient action followed by its quotient by inner automorphisms. -/
def actionToOuterRange (N : Subgroup G) [N.Normal] :
    G →* ((MulAut.conjNormal (H := N)).range ⧸ innerActionInRange N) :=
  (QuotientGroup.mk' (innerActionInRange N)).comp (normalActionToRange N)

private theorem normalActionToRange_injective_on_factor (N : Subgroup G) [N.Normal]
    (hCenter : Subgroup.center N = ⊥) :
    Function.Injective ((normalActionToRange N).comp N.subtype) := by
  apply (MonoidHom.ker_eq_bot_iff (f := (normalActionToRange N).comp N.subtype)).mp
  apply le_antisymm _ bot_le
  intro a ha
  have he : MulAut.conj a = 1 := by
    have hEq : MulAut.conjNormal (H := N) (a : G) = 1 :=
      congrArg Subtype.val (MonoidHom.mem_ker.mp ha)
    rwa [MulAut.conjNormal_val] at hEq
  rw [← hCenter, Subgroup.mem_center_iff]
  intro b
  have hConj : a * b * a⁻¹ = b := DFunLike.congr_fun he b
  exact (mul_inv_eq_iff_eq_mul.mp hConj).symm

/-- The inner subgroup has the order of its centerless factor. -/
theorem card_innerActionInRange (N : Subgroup G) [N.Normal]
    (hCenter : Subgroup.center N = ⊥) : Nat.card (innerActionInRange N) = Nat.card N := by
  have hInj := normalActionToRange_injective_on_factor N hCenter
  let f := (normalActionToRange N).subgroupMap N
  have hInjective : Function.Injective f := by
    intro a b he
    exact hInj (congrArg Subtype.val he)
  exact (Nat.card_congr (Equiv.ofBijective f
    ⟨hInjective, (normalActionToRange N).subgroupMap_surjective N⟩)).symm

/-- The outer action kills the entire socle. On the selected factor
    it is inner, and every other minimal normal subgroup centralizes it. -/
theorem minimalNormalSocle_le_ker_actionToOuterRange (N : Subgroup G)
    [N.Normal] (hN : IsMinimalNormalSubgroup N) :
    minimalNormalSocle G ≤ (actionToOuterRange N).ker := by
  apply iSup_le
  intro M a ha
  apply MonoidHom.mem_ker.mpr
  change QuotientGroup.mk' (innerActionInRange N) (normalActionToRange N a) = 1
  by_cases he : M.val = N
  · apply MonoidHom.mem_ker.mp
    rw [QuotientGroup.ker_mk']
    exact Subgroup.mem_map_of_mem _ (he ▸ ha)
  · have hTrivial : normalActionToRange N a = 1 := by
      apply Subtype.ext
      apply MulEquiv.ext
      intro b
      apply Subtype.ext
      change a * (b : G) * a⁻¹ = b
      exact mul_inv_eq_iff_eq_mul.mpr (commute_of_distinct_minimal_normal
        M.property hN he ⟨a, ha⟩ b).eq
    rw [hTrivial, map_one]

private theorem zpowers_actionToOuterRange_eq_top (N : Subgroup G) [N.Normal]
    (hN : IsMinimalNormalSubgroup N)
    [IsMulCommutative ((MulAut.conjNormal (H := N)).range ⧸ innerActionInRange N)]
    (x g : G)
    (hGen : let q := QuotientGroup.mk' (minimalNormalSocle G)
      Subgroup.closure {q x, q g * q x * (q g)⁻¹} = ⊤) :
    Subgroup.zpowers (actionToOuterRange N x) = ⊤ := by
  let q := QuotientGroup.mk' (minimalNormalSocle G)
  let r := actionToOuterRange N
  let f := QuotientGroup.lift (minimalNormalSocle G) r
    (minimalNormalSocle_le_ker_actionToOuterRange N hN)
  have hR : Function.Surjective r :=
    (QuotientGroup.mk'_surjective _).comp
      (MulAut.conjNormal (H := N)).rangeRestrict_surjective
  have hF : Function.Surjective f := by
    intro y
    obtain ⟨a, ha⟩ := hR y
    exact ⟨q a, ha⟩
  change Subgroup.closure {q x, q g * q x * (q g)⁻¹} = ⊤ at hGen
  have hMap := congrArg (fun H : Subgroup (G ⧸ minimalNormalSocle G) => H.map f) hGen
  have hConj : f (q g * q x * (q g)⁻¹) = r x := by
    rw [map_mul, map_mul, map_inv]
    change r g * r x * (r g)⁻¹ = r x
    rw [mul_comm' (r g) (r x), mul_assoc, mul_inv_cancel, mul_one]
  rw [MonoidHom.map_closure, Set.image_insert_eq, Set.image_singleton, Subgroup.map_top,
    MonoidHom.range_eq_top.mpr hF, hConj] at hMap
  change Subgroup.closure {r x, r x} = ⊤ at hMap
  rwa [Set.pair_eq_singleton, ← Subgroup.zpowers_eq_closure] at hMap

private theorem exists_factor_adjustment_of_same_outer_image (N : Subgroup G) [N.Normal]
    (x : G) (a : (MulAut.conjNormal (H := N)).range)
    (ha : QuotientGroup.mk' (innerActionInRange N) a = actionToOuterRange N x) :
    ∃ u : N, (a : MulAut N) = MulAut.conjNormal x * MulAut.conj u := by
  let R := normalActionToRange N
  let q := QuotientGroup.mk' (innerActionInRange N)
  have hMem : (R x)⁻¹ * a ∈ innerActionInRange N := by
    rw [← QuotientGroup.ker_mk' (innerActionInRange N)]
    apply MonoidHom.mem_ker.mpr
    change q ((R x)⁻¹ * a) = 1
    rw [map_mul, map_inv, ha]
    exact inv_mul_cancel _
  obtain ⟨u, hu, hEq⟩ := Subgroup.mem_map.mp hMem
  have hA : a = R x * R u := by rw [hEq, mul_inv_cancel_left]
  refine ⟨⟨u, hu⟩, ?_⟩
  have hVal := congrArg Subtype.val hA
  change (a : MulAut N) = MulAut.conjNormal x * MulAut.conjNormal u at hVal
  rwa [show MulAut.conjNormal (H := N) u = MulAut.conj (⟨u, hu⟩ : N) from
    MulAut.conjNormal_val (h := (⟨u, hu⟩ : N))] at hVal

/-- Given cyclic outer image and conjugate generation of the actual
    automorphism image, realize its conjugate pair by inner adjustments
    that retain the two chosen images in the socle quotient. -/
theorem exists_single_factor_prime_lift [Finite G] (N : Subgroup G)
    [N.Normal] (hN : IsMinimalNormalSubgroup N) (hCenter : Subgroup.center N = ⊥)
    (hCyclic : IsCyclic ((MulAut.conjNormal (H := N)).range ⧸ innerActionInRange N))
    (hGenerate : ∃ a b : (MulAut.conjNormal (H := N)).range,
      Subgroup.closure {a, b * a * b⁻¹} = ⊤)
    (x₀ g₀ : G)
    (hGen : let q := QuotientGroup.mk' (minimalNormalSocle G)
      Subgroup.closure {q x₀, q g₀ * q x₀ * (q g₀)⁻¹} = ⊤) :
    ∃ u v : N,
      let x := MulAut.conjNormal x₀ * MulAut.conj u
      let g := MulAut.conjNormal g₀ * MulAut.conj v
      primeSpectrum N ⊆ primeSpectrum (Subgroup.closure {x, g * x * g⁻¹}) := by
  let L := (MulAut.conjNormal (H := N)).range
  let q := QuotientGroup.mk' (innerActionInRange N)
  have : Finite L := Finite.of_surjective _ (MulAut.conjNormal (H := N)).rangeRestrict_surjective
  let _ : CommGroup (L ⧸ innerActionInRange N) := IsCyclic.commGroup
  obtain ⟨x, g, hPair⟩ := hGenerate
  have hXPow := zpowers_actionToOuterRange_eq_top N hN x₀ g₀ hGen
  obtain ⟨a, b, ha, hb, hTop⟩ := exists_conjugate_pair_prescribing_cyclic_quotient q
    (QuotientGroup.mk'_surjective _) x g hPair
    (actionToOuterRange N x₀) (actionToOuterRange N g₀) hXPow
  obtain ⟨u, hU⟩ := exists_factor_adjustment_of_same_outer_image N x₀ a ha
  obtain ⟨v, hV⟩ := exists_factor_adjustment_of_same_outer_image N g₀ b hb
  refine ⟨u, v, ?_⟩
  dsimp only
  rw [← hU, ← hV]
  let H := Subgroup.closure ({(a : MulAut N), (b : MulAut N) * a * (b : MulAut N)⁻¹} :
    Set (MulAut N))
  have hHL : H = L := by
    have h := congrArg (fun P : Subgroup L => P.map L.subtype) hTop
    rw [MonoidHom.map_closure, Set.image_insert_eq, Set.image_singleton,
      Subgroup.map_top, L.range_subtype] at h
    exact h
  change primeSpectrum N ⊆ primeSpectrum H
  rw [hHL]
  exact primeSpectrum_mono_of_injective _ (normalActionToRange_injective_on_factor N hCenter)

/-- The one-factor lift in a minimal group, with the external
    automorphism and conjugate-generation results isolated as premises. -/
theorem exists_single_factor_prime_lift_of_automorphism_inputs [Finite G]
    (N : Subgroup G) [N.Normal] (hN : IsMinimalNormalSubgroup N)
    (hNonabel : ¬IsMulCommutative N) (hMinimal : PrimeSpectrumMinimal G)
    (hSolvable : Group.IsSolvable ((MulAut.conjNormal (H := N)).range ⧸ innerActionInRange N))
    (hCoprimeCyclic : ∀ H : Subgroup (MulAut N),
      Nat.Coprime (Nat.card N) (Nat.card H) → IsCyclic H)
    (hGenerate : IsCyclic ((MulAut.conjNormal (H := N)).range ⧸ innerActionInRange N) →
      ∃ a b : (MulAut.conjNormal (H := N)).range, Subgroup.closure {a, b * a * b⁻¹} = ⊤)
    (x₀ g₀ : G)
    (hGen : let q := QuotientGroup.mk' (minimalNormalSocle G)
      Subgroup.closure {q x₀, q g₀ * q x₀ * (q g₀)⁻¹} = ⊤) :
    ∃ u v : N,
      let x := MulAut.conjNormal x₀ * MulAut.conj u
      let g := MulAut.conjNormal g₀ * MulAut.conj v
      primeSpectrum N ⊆ primeSpectrum (Subgroup.closure {x, g * x * g⁻¹}) := by
  let L := (MulAut.conjNormal (H := N)).range
  let I := innerActionInRange N
  have : Finite L := Finite.of_surjective _ (MulAut.conjNormal (H := N)).rangeRestrict_surjective
  have hCenter := center_eq_bot_of_nonabelian_minimal_normal hN hNonabel
  have hCard := card_innerActionInRange N hCenter
  have hCyclic : IsCyclic (L ⧸ I) := by
    apply isCyclic_quotient_of_solvable_and_coprime_subgroups I
      (hMinimal.of_surjective (normalActionToRange N) _)
    · intro H hH
      let e := H.equivMapOfInjective L.subtype L.subtype_injective
      apply e.isCyclic.mpr
      apply hCoprimeCyclic
      rw [← Nat.card_congr e.toEquiv, ← hCard]
      exact hH
    · exact (MulAut.conjNormal (H := N)).rangeRestrict_surjective
  exact exists_single_factor_prime_lift N hN hCenter hCyclic (hGenerate hCyclic)
    x₀ g₀ hGen

end Shumyatsky
