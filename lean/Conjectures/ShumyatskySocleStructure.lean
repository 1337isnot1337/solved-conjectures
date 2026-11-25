module

public import Conjectures.ShumyatskySocleAssembly
public import Mathlib.GroupTheory.NoncommPiCoprod
public import Mathlib.GroupTheory.Subgroup.Center
public import Mathlib.Algebra.Group.Subgroup.Pointwise
public import Mathlib.Order.Preorder.Finite

/-! Realize the socle as the actual direct product of the minimal
normal subgroups when each of them is nonabelian. -/

@[expose] public section

namespace Shumyatsky

variable {G I : Type*} [Group G]

private theorem normal_map_subtype_of_characteristic (N : Subgroup G) [N.Normal]
    (K : Subgroup N) (hK : K.Characteristic) : (K.map N.subtype).Normal where
  conj_mem x hx g := by
    obtain ⟨a, ha, rfl⟩ := Subgroup.mem_map.mp hx
    let c : MulAut N := MulAut.conjNormal g
    exact ⟨c a, Subgroup.characteristic_iff_le_comap.mp hK c ha, rfl⟩

/-- The center of a nonabelian minimal normal subgroup is trivial. -/
theorem center_eq_bot_of_nonabelian_minimal_normal {N : Subgroup G}
    (hN : IsMinimalNormalSubgroup N) (hNonabel : ¬IsMulCommutative N) :
    Subgroup.center N = ⊥ := by
  have : N.Normal := hN.normal
  let C := Subgroup.center N
  let M := C.map N.subtype
  have hNormal : M.Normal := normal_map_subtype_of_characteristic N C inferInstance
  have hLe : M ≤ N := by
    intro x hx
    obtain ⟨a, _, rfl⟩ := Subgroup.mem_map.mp hx
    exact a.property
  by_contra hC
  have hMBot : M ≠ ⊥ := fun he => hC
    ((Subgroup.map_eq_bot_iff_of_injective C N.subtype_injective).1 he)
  have hMN : M = N := hN.eq_of_le M hNormal hLe hMBot
  have hCTop : C = ⊤ := by
    apply Subgroup.map_injective N.subtype_injective
    rw [Subgroup.map_top, N.range_subtype]
    exact hMN
  exact hNonabel (Subgroup.center_eq_top_iff.mp hCTop)

/-- Pairwise commuting centerless subgroups are independent as a
    whole family, including their relation to products of the others. -/
theorem iSupIndep_of_commuting_centerless (N : I → Subgroup G)
    (hCommute : ∀ i j, i ≠ j → ∀ a : N i, ∀ b : N j, Commute (a : G) (b : G))
    (hCenter : ∀ i, Subgroup.center (N i) = ⊥) :
    iSupIndep N := by
  intro i
  have hCentralizes : (⨆ (j) (_ : j ≠ i), N j) ≤ Subgroup.centralizer (N i : Set G) := by
    apply iSup_le
    intro j
    apply iSup_le
    intro hji x hx
    apply Subgroup.mem_centralizer_iff.mpr
    intro y hy
    exact (hCommute j i hji ⟨x, hx⟩ ⟨y, hy⟩).eq.symm
  apply disjoint_iff.mpr
  apply le_antisymm _ bot_le
  intro x hx
  have hxCentral : (⟨x, hx.1⟩ : N i) ∈ Subgroup.center (N i) := by
    apply Subgroup.mem_center_iff.mpr
    intro y
    exact Subtype.ext ((Subgroup.mem_centralizer_iff.mp (hCentralizes hx.2)) y y.property)
  rw [hCenter i, Subgroup.mem_bot] at hxCentral
  exact Subgroup.mem_bot.mpr (congrArg Subtype.val hxCentral)

/-- The multiplication homomorphism identifies the actual join of
    commuting centerless subgroups with their direct product. -/
noncomputable def directProductEquivJoin [Finite I] (N : I → Subgroup G)
    (hCommute : ∀ i j, i ≠ j → ∀ a : N i, ∀ b : N j, Commute (a : G) (b : G))
    (hCenter : ∀ i, Subgroup.center (N i) = ⊥) :
    (∀ i, N i) ≃* (⨆ i, N i : Subgroup G) := by
  classical
  let _ := Fintype.ofFinite I
  have hPair : Pairwise fun i j => ∀ x y : G, x ∈ N i → y ∈ N j → Commute x y :=
    fun i j hij x y hx hy => hCommute i j hij ⟨x, hx⟩ ⟨y, hy⟩
  let f := Subgroup.noncommPiCoprod hPair
  have hInj : Function.Injective f := Subgroup.injective_noncommPiCoprod_of_iSupIndep
    (iSupIndep_of_commuting_centerless N hCommute hCenter)
  have hRange : f.range = ⨆ i, N i := Subgroup.noncommPiCoprod_range
  exact (MonoidHom.ofInjective hInj).trans (MulEquiv.subgroupCongr hRange)

/-- The socle is the join of all actual minimal normal subgroups. -/
def minimalNormalSocle (G : Type*) [Group G] : Subgroup G :=
  ⨆ N : {N : Subgroup G // IsMinimalNormalSubgroup N}, N.val

instance minimalNormalSocle_normal : (minimalNormalSocle G).Normal := by
  unfold minimalNormalSocle
  have : ∀ N : {N : Subgroup G // IsMinimalNormalSubgroup N}, N.val.Normal :=
    fun N => N.property.normal
  infer_instance

/-- In the remaining case of the Shumyatsky reduction the socle is
    the direct product of its distinct nonabelian minimal normals. -/
noncomputable def minimalNormalSocleEquiv [Finite G]
    (hNonabel : ∀ N : Subgroup G, IsMinimalNormalSubgroup N → ¬IsMulCommutative N) :
    minimalNormalSocle G ≃* (∀ N : {N : Subgroup G // IsMinimalNormalSubgroup N}, N.val) := by
  have : Finite (Subgroup G) :=
    Finite.of_injective (fun H : Subgroup G => (H : Set G)) SetLike.coe_injective
  exact (directProductEquivJoin
    (fun N : {N : Subgroup G // IsMinimalNormalSubgroup N} => N.val)
    (fun N M hNM => commute_of_distinct_minimal_normal N.property M.property
      (fun h => hNM (Subtype.ext h)))
    (fun N => center_eq_bot_of_nonabelian_minimal_normal N.property (hNonabel N.val N.property))).symm

/-- A nontrivial normal subgroup of a finite group contains a minimal
    nontrivial normal subgroup of the ambient group. -/
theorem exists_minimal_normal_below [Finite G] (N : Subgroup G) [N.Normal]
    (hN : N ≠ ⊥) : ∃ M : Subgroup G, M ≤ N ∧ IsMinimalNormalSubgroup M := by
  have : Finite (Subgroup G) :=
    Finite.of_injective (fun H : Subgroup G => (H : Set G)) SetLike.coe_injective
  let candidates : Set (Subgroup G) := {M | M ≤ N ∧ M.Normal ∧ M ≠ ⊥}
  have hCandidates : candidates.Nonempty := ⟨N, le_rfl, inferInstance, hN⟩
  obtain ⟨M, hM, hMinimal⟩ := (Set.toFinite candidates).exists_minimal hCandidates
  refine ⟨M, hM.1, hM.2.1, hM.2.2, ?_⟩
  intro K hNormal hLe hNontriv
  exact le_antisymm hLe (hMinimal ⟨hLe.trans hM.1, hNormal, hNontriv⟩ hLe)

/-- The socle of a nontrivial finite group is nontrivial. -/
theorem minimalNormalSocle_ne_bot [Finite G] [Nontrivial G] :
    minimalNormalSocle G ≠ ⊥ := by
  have hTop : (⊤ : Subgroup G) ≠ ⊥ := by
    intro he
    obtain ⟨x, hx⟩ := exists_ne (1 : G)
    exact hx (Subgroup.mem_bot.mp (he ▸ Subgroup.mem_top x))
  obtain ⟨N, _, hMin⟩ := exists_minimal_normal_below (⊤ : Subgroup G) hTop
  have hLe : N ≤ minimalNormalSocle G :=
    le_iSup (fun M : {M : Subgroup G // IsMinimalNormalSubgroup M} => M.val) ⟨N, hMin⟩
  intro h
  rw [h] at hLe
  exact hMin.neBot (le_antisymm hLe bot_le)

/-- Realize the simultaneous factor lift on the quotient by the actual socle. -/
theorem exists_generating_pair_of_socle_factor_lifts [Finite G]
    (hMinimal : PrimeSpectrumMinimal G)
    (hNonabel : ∀ N : Subgroup G, IsMinimalNormalSubgroup N → ¬IsMulCommutative N)
    (x₀ g₀ : G)
    (hQuotient : let q := QuotientGroup.mk' (minimalNormalSocle G)
      Subgroup.closure {q x₀, q g₀ * q x₀ * (q g₀)⁻¹} = ⊤)
    (hLocal : ∀ N : {N : Subgroup G // IsMinimalNormalSubgroup N},
      letI : N.val.Normal := N.property.normal
      ∃ a b : N.val,
        let x := (MulAut.conjNormal (H := N.val)) x₀ * MulAut.conj a
        let g := (MulAut.conjNormal (H := N.val)) g₀ * MulAut.conj b
        primeSpectrum N.val ⊆ primeSpectrum (Subgroup.closure {x, g * x * g⁻¹})) :
    let q := QuotientGroup.mk' (minimalNormalSocle G)
    ∃ x g : G, q x = q x₀ ∧ q g = q g₀ ∧ Subgroup.closure {x, g * x * g⁻¹} = ⊤ := by
  let q := QuotientGroup.mk' (minimalNormalSocle G)
  have hKer : q.ker = minimalNormalSocle G := QuotientGroup.ker_mk' _
  let N (i : {N : Subgroup G // IsMinimalNormalSubgroup N}) := i.val
  have : Finite (Subgroup G) :=
    Finite.of_injective (fun H : Subgroup G => (H : Set G)) SetLike.coe_injective
  let : ∀ i, (N i).Normal := fun i => i.property.normal
  have hLe (i) : N i ≤ q.ker := by
    rw [hKer]
    exact le_iSup N i
  have hProduct : q.ker ≃* ∀ i, N i :=
    (MulEquiv.subgroupCongr hKer).trans (minimalNormalSocleEquiv hNonabel)
  have hCommute (i j) (hij : i ≠ j) (a : N i) (b : N j) : Commute (a : G) (b : G) :=
    commute_of_distinct_minimal_normal i.property j.property (fun he => hij (Subtype.ext he)) a b
  exact exists_generating_pair_of_factor_lifts N q
    (QuotientGroup.mk'_surjective _) hMinimal hLe hProduct hCommute x₀ g₀ hQuotient hLocal

end Shumyatsky
