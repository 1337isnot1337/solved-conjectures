import Conjectures.HadamardBorderSymmetryDomain
import Conjectures.HadamardBorderSymmetryMain

/-!
# Transfer to an arbitrary finite abelian border domain

The hypotheses concern the actual sign rows on `G` and their correlations,
distinguishing nonzero shifts in `S` from shifts outside `S`. Product
coordinates are constructed from the subgroup cardinality and index.
The full common multiplier group and its actual orbit quotient are then
transported by conjugation, rather than restricted to a prescribed family
of coordinate actions.
-/

namespace HadamardBorderSymmetry

open scoped BigOperators

abbrev DomainRows (G : Type*) := Fin 4 → G → ℤ

section OriginalDomain

variable {G : Type*} [AddCommGroup G] [Fintype G]

def combinedCorrelationOn (F : DomainRows G) (h : G) : ℤ :=
  ∑ i, ∑ x, F i (x + h) * F i x

/-- The unnormalized border hypotheses on the original finite abelian group. -/
structure IsBorderCoreOn149 (S : AddSubgroup G) (F : DomainRows G) : Prop where
  sign : ∀ i x, F i x = 1 ∨ F i x = -1
  correlation_inside : ∀ h, h ≠ 0 → h ∈ S → combinedCorrelationOn F h = -12
  correlation_outside : ∀ h, h ∉ S → combinedCorrelationOn F h = 4

/-- The original rows, evaluated in the constructed product coordinates. -/
noncomputable def rowsInProduct149 (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G) :
    BorderRows (G ⧸ S) :=
  fun i q x => F i ((borderDomainEquiv149 S hS hindex).symm (q, x))

theorem rowsInProduct149_correlation (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G)
    [Fintype (G ⧸ S)] (h : G ⧸ S) (t : ZMod 149) :
    combinedCorrelation149 (rowsInProduct149 S hS hindex F) h t =
      combinedCorrelationOn F ((borderDomainEquiv149 S hS hindex).symm (h, t)) := by
  let e := borderDomainEquiv149 S hS hindex
  unfold combinedCorrelation149 combinedCorrelationOn
  apply Finset.sum_congr rfl
  intro i _
  rw [← Fintype.sum_prod_type]
  apply Fintype.sum_equiv e.symm.toEquiv
  intro x
  change F i (e.symm (x + (h, t))) * F i (e.symm x) =
    F i (e.symm x + e.symm (h, t)) * F i (e.symm x)
  rw [map_add]

/-- Product coordinates preserve every sign and every required correlation. -/
theorem rowsInProduct149_isBorderCore (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G)
    [Fintype (G ⧸ S)] [DecidableEq (G ⧸ S)] (hF : IsBorderCoreOn149 S F) :
    IsBorderCore149 (rowsInProduct149 S hS hindex F) := by
  let e := borderDomainEquiv149 S hS hindex
  refine ⟨fun i q x => hF.sign i (e.symm (q, x)), ?_⟩
  intro h t hne
  rw [rowsInProduct149_correlation]
  have hg : e.symm (h, t) ≠ 0 := by
    intro hz
    apply hne
    exact e.symm.injective (hz.trans (map_zero e.symm).symm)
  have hmembership : e.symm (h, t) ∈ S ↔ h = 0 := by
    rw [borderDomainEquiv149_mem_iff S hS hindex]
    change (e (e.symm (h, t))).1 = 0 ↔ h = 0
    rw [e.apply_symm_apply]
  by_cases hh : h = 0
  · rw [ite_eq_left hh]
    exact hF.correlation_inside _ hg (hmembership.mpr hh)
  · rw [ite_eq_right hh]
    exact hF.correlation_outside _ (fun hs => hh (hmembership.mp hs))

end OriginalDomain

/-- The full actual subgroup of additive automorphisms fixing all four rows. -/
def commonMultiplierGroupOn {G : Type*} [AddGroup G] (F : DomainRows G) :
    Subgroup (Multiplicative (AddAut G)) where
  carrier := {u | ∀ i x, F i (u.toAdd x) = F i x}
  one_mem' := by intro i x; rfl
  mul_mem' := by
    intro u v hu hv i x
    change F i (u.toAdd (v.toAdd x)) = F i x
    rw [hu, hv]
  inv_mem' := by
    intro u hu i x
    change F i (u.toAdd.symm x) = F i x
    have h := hu i (u.toAdd.symm x)
    simpa only [u.toAdd.apply_symm_apply] using h.symm

/-- Conjugation of the full additive automorphism group by domain coordinates. -/
def automorphismConjugation {G H : Type*} [AddGroup G] [AddGroup H] (e : G ≃+ H) :
    Multiplicative (AddAut G) ≃* Multiplicative (AddAut H) :=
  (AddAut.congr e).toMultiplicative

theorem automorphismConjugation_apply {G H : Type*} [AddGroup G] [AddGroup H]
    (e : G ≃+ H) (u : Multiplicative (AddAut G)) (x : H) :
    (automorphismConjugation e u).toAdd x = e (u.toAdd (e.symm x)) := rfl

/-- Equivariant equivalences induce equivalences of the actual orbit quotients. -/
def orbitQuotientEquivOfEquivariant {A B X Y : Type*}
    [Group A] [Group B] [MulAction A X] [MulAction B Y]
    (φ : A ≃* B) (e : X ≃ Y)
    (he : ∀ a x, e (a • x) = φ a • e x) :
    MulAction.orbitRel.Quotient A X ≃ MulAction.orbitRel.Quotient B Y :=
  Quotient.congr e fun x y => by
    change (∃ a : A, a • y = x) ↔ ∃ b : B, b • e y = e x
    constructor
    · rintro ⟨a, ha⟩
      refine ⟨φ a, ?_⟩
      rw [← he, ha]
    · rintro ⟨b, hb⟩
      refine ⟨φ.symm b, e.injective ?_⟩
      rw [he, φ.apply_symm_apply]
      exact hb

/-- Enlarging an acting subgroup gives the canonical map on orbit quotients. -/
def orbitQuotientMapOfLe {A X : Type*} [Group A] [MulAction A X]
    (U V : Subgroup A) (hUV : U ≤ V) :
    MulAction.orbitRel.Quotient U X → MulAction.orbitRel.Quotient V X :=
  Quotient.map id fun _ _ h => by
    rcases h with ⟨u, hu⟩
    exact ⟨⟨u.val, hUV u.property⟩, hu⟩

theorem orbitQuotientMapOfLe_surjective {A X : Type*} [Group A] [MulAction A X]
    (U V : Subgroup A) (hUV : U ≤ V) :
    Function.Surjective (orbitQuotientMapOfLe (X := X) U V hUV) := by
  intro q
  refine Quotient.inductionOn' q ?_
  intro x
  exact ⟨Quotient.mk'' x, rfl⟩

/-- A subgroup has at least as many actual orbits as a larger acting subgroup. -/
theorem orbit_count_antitone_of_le {A X : Type*} [Group A] [MulAction A X] [Finite X]
    (U V : Subgroup A) (hUV : U ≤ V) :
    Nat.card (MulAction.orbitRel.Quotient V X) ≤
      Nat.card (MulAction.orbitRel.Quotient U X) :=
  Nat.card_le_card_of_surjective (orbitQuotientMapOfLe (X := X) U V hUV)
    (orbitQuotientMapOfLe_surjective (X := X) U V hUV)

section MultiplierTransfer

variable {G : Type*} [AddCommGroup G] [Fintype G]

/-- Conjugation preserves membership in the full row-preserving subgroup. -/
theorem conjugated_multiplier_mem_iff (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G)
    (u : Multiplicative (AddAut G)) :
    automorphismConjugation (borderDomainEquiv149 S hS hindex) u ∈
        commonMultiplierGroup149 (rowsInProduct149 S hS hindex F) ↔
      u ∈ commonMultiplierGroupOn F := by
  let e := borderDomainEquiv149 S hS hindex
  constructor
  · intro hu i x
    have h := hu i (e x)
    change F i (e.symm ((automorphismConjugation e u).toAdd (e x))) =
      F i (e.symm (e x)) at h
    simpa only [automorphismConjugation_apply, e.symm_apply_apply] using h
  · intro hu i x
    change F i (e.symm ((automorphismConjugation e u).toAdd x)) = F i (e.symm x)
    rw [automorphismConjugation_apply, e.symm_apply_apply]
    exact hu i (e.symm x)

/-- The full actual common multiplier groups are isomorphic. -/
noncomputable def multiplierGroupEquiv149 (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G) :
    commonMultiplierGroupOn F ≃*
      commonMultiplierGroup149 (rowsInProduct149 S hS hindex F) :=
  let φ := automorphismConjugation (borderDomainEquiv149 S hS hindex)
  { toFun := fun u => ⟨φ u.val, (conjugated_multiplier_mem_iff S hS hindex F u.val).mpr
      u.property⟩
    invFun := fun v => ⟨φ.symm v.val,
      (conjugated_multiplier_mem_iff S hS hindex F (φ.symm v.val)).mp
        (by simpa only [φ.apply_symm_apply] using v.property)⟩
    left_inv := fun u => Subtype.ext (φ.symm_apply_apply u.val)
    right_inv := fun v => Subtype.ext (φ.apply_symm_apply v.val)
    map_mul' := fun u v => Subtype.ext (φ.map_mul u.val v.val) }

/-- The coordinate map also identifies the actual orbit quotients. -/
noncomputable def multiplierOrbitEquiv149 (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G) :
    MulAction.orbitRel.Quotient (commonMultiplierGroupOn F) G ≃
      MulAction.orbitRel.Quotient
        (commonMultiplierGroup149 (rowsInProduct149 S hS hindex F))
        ((G ⧸ S) × ZMod 149) :=
  let e := borderDomainEquiv149 S hS hindex
  orbitQuotientEquivOfEquivariant (multiplierGroupEquiv149 S hS hindex F) e.toEquiv (by
    intro u x
    change e (u.val.toAdd x) = (automorphismConjugation e u.val).toAdd (e x)
    rw [automorphismConjugation_apply, e.symm_apply_apply])

theorem card_commonMultiplierGroupOn_eq (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G) :
    Nat.card (commonMultiplierGroupOn F) =
      Nat.card (commonMultiplierGroup149 (rowsInProduct149 S hS hindex F)) :=
  Nat.card_congr (multiplierGroupEquiv149 S hS hindex F).toEquiv

theorem card_multiplierOrbitOn_eq (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G) :
    Nat.card (MulAction.orbitRel.Quotient (commonMultiplierGroupOn F) G) =
      Nat.card (MulAction.orbitRel.Quotient
        (commonMultiplierGroup149 (rowsInProduct149 S hS hindex F))
        ((G ⧸ S) × ZMod 149)) :=
  Nat.card_congr (multiplierOrbitEquiv149 S hS hindex F)

/-- For an arbitrary finite abelian border domain, the order of the full
common multiplier group divides four. No splitting is assumed. -/
theorem common_multiplier_card_dvd_four_on_subgroup149 (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G)
    (hF : IsBorderCoreOn149 S F) : Nat.card (commonMultiplierGroupOn F) ∣ 4 := by
  classical
  let : Fintype (G ⧸ S) := Fintype.ofFinite _
  have hQ : Fintype.card (G ⧸ S) = 4 := by
    simpa only [Nat.card_eq_fintype_card] using border_quotient_card_four S hindex
  rw [card_commonMultiplierGroupOn_eq S hS hindex F]
  exact common_multiplier_card_dvd_four (rowsInProduct149 S hS hindex F) hQ
    (rowsInProduct149_isBorderCore S hS hindex F hF)

/-- In particular, at most four additive automorphisms fix all four rows. -/
theorem common_multiplier_card_le_four_on_subgroup149 (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G)
    (hF : IsBorderCoreOn149 S F) : Nat.card (commonMultiplierGroupOn F) ≤ 4 :=
  Nat.le_of_dvd (by decide)
    (common_multiplier_card_dvd_four_on_subgroup149 S hS hindex F hF)

/-- The full common multiplier group is cyclic on the original domain. -/
theorem common_multiplier_isCyclic_on_subgroup149 (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G)
    (hF : IsBorderCoreOn149 S F) : IsCyclic (commonMultiplierGroupOn F) := by
  classical
  let : Fintype (G ⧸ S) := Fintype.ofFinite _
  have hQ : Fintype.card (G ⧸ S) = 4 := by
    simpa only [Nat.card_eq_fintype_card] using border_quotient_card_four S hindex
  apply (multiplierGroupEquiv149 S hS hindex F).isCyclic.mpr
  exact common_multiplier_isCyclic (rowsInProduct149 S hS hindex F) hQ
    (rowsInProduct149_isBorderCore S hS hindex F hF)

/-- At least 151 actual sign orbits remain for each generator on every
finite abelian border domain with the stated subgroup data. -/
theorem common_multiplier_orbit_count_ge_151_on_subgroup149 (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G)
    (hF : IsBorderCoreOn149 S F) :
    151 ≤ Nat.card (MulAction.orbitRel.Quotient (commonMultiplierGroupOn F) G) := by
  classical
  let : Fintype (G ⧸ S) := Fintype.ofFinite _
  have hQ : Fintype.card (G ⧸ S) = 4 := by
    simpa only [Nat.card_eq_fintype_card] using border_quotient_card_four S hindex
  rw [card_multiplierOrbitOn_eq S hS hindex F]
  exact common_multiplier_orbit_count_ge_151 (rowsInProduct149 S hS hindex F) hQ
    (rowsInProduct149_isBorderCore S hS hindex F hF)

/-- The cardinality conclusion for every actual common multiplier subgroup
on the original domain. -/
theorem symmetry_subgroup_card_dvd_four_on_subgroup149 (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G)
    (hF : IsBorderCoreOn149 S F) (U : Subgroup (Multiplicative (AddAut G)))
    (hU : U ≤ commonMultiplierGroupOn F) : Nat.card U ∣ 4 :=
  (Subgroup.card_dvd_of_le hU).trans
    (common_multiplier_card_dvd_four_on_subgroup149 S hS hindex F hF)

theorem symmetry_subgroup_card_le_four_on_subgroup149 (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G)
    (hF : IsBorderCoreOn149 S F) (U : Subgroup (Multiplicative (AddAut G)))
    (hU : U ≤ commonMultiplierGroupOn F) : Nat.card U ≤ 4 :=
  Nat.le_of_dvd (by decide)
    (symmetry_subgroup_card_dvd_four_on_subgroup149 S hS hindex F hF U hU)

theorem symmetry_subgroup_isCyclic_on_subgroup149 (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G)
    (hF : IsBorderCoreOn149 S F) (U : Subgroup (Multiplicative (AddAut G)))
    (hU : U ≤ commonMultiplierGroupOn F) : IsCyclic U := by
  let : IsCyclic (commonMultiplierGroupOn F) :=
    common_multiplier_isCyclic_on_subgroup149 S hS hindex F hF
  exact Subgroup.isCyclic_of_le hU

/-- The manuscript's any-common-subgroup orbit bound, on the actual
original finite abelian group and without a split-domain hypothesis. -/
theorem symmetry_subgroup_orbit_count_ge_151_on_subgroup149 (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (F : DomainRows G)
    (hF : IsBorderCoreOn149 S F) (U : Subgroup (Multiplicative (AddAut G)))
    (hU : U ≤ commonMultiplierGroupOn F) :
    151 ≤ Nat.card (MulAction.orbitRel.Quotient U G) :=
  (common_multiplier_orbit_count_ge_151_on_subgroup149 S hS hindex F hF).trans
    (orbit_count_antitone_of_le (X := G) U (commonMultiplierGroupOn F) hU)

end MultiplierTransfer

end HadamardBorderSymmetry
