import Mathlib.Algebra.Group.Prod
import Mathlib.GroupTheory.Index
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.Tactic.Abel
import Mathlib.Tactic.NormNum.Prime

/-!
# Product coordinates for the order-596 border domain

Let `S` be a subgroup of a finite abelian group `G`, with cardinality 149
and index four. The map `g ↦ g - 149 • g` is a retraction onto `S`:
149 acts as the identity on the quotient of order four and as zero on `S`.
Together with the actual quotient map this gives an additive isomorphism
`G ≃+ (G ⧸ S) × S`. A group of prime order 149 is cyclic, so the second
factor can be identified with `ZMod 149`.

The resulting first coordinate is the literal quotient map. In particular,
the distinguished subgroup maps exactly to the zero-first-coordinate fiber.
-/

namespace HadamardBorderSymmetry

local instance symmetryDomain149Fact : Fact (Nat.Prime 149) := ⟨by norm_num⟩

variable {G : Type*} [AddCommGroup G]

/-- Multiplication by 149 is the identity on a quotient of order four. -/
theorem quotient149_nsmul_eq_self (S : AddSubgroup G) (hindex : S.index = 4)
    (q : G ⧸ S) : (149 : ℕ) • q = q := by
  have hfour : (4 : ℕ) • q = 0 := by
    simpa only [← S.index_eq_card, hindex] using (card_nsmul_eq_zero' (x := q))
  calc
    (149 : ℕ) • q = (37 : ℕ) • ((4 : ℕ) • q) + q := by abel
    _ = q := by rw [hfour, nsmul_zero, zero_add]

/-- A concrete additive retraction onto a subgroup of index four. -/
def borderRetraction149 (S : AddSubgroup G) (hindex : S.index = 4) : G →+ S where
  toFun g := ⟨g - (149 : ℕ) • g, by
    apply (QuotientAddGroup.eq_zero_iff _).mp
    change (QuotientAddGroup.mk' S) (g - (149 : ℕ) • g) = 0
    rw [map_sub, map_nsmul, quotient149_nsmul_eq_self S hindex, sub_self]⟩
  map_zero' := by
    apply Subtype.ext
    simp
  map_add' x y := by
    apply Subtype.ext
    change (x + y) - (149 : ℕ) • (x + y) =
      (x - (149 : ℕ) • x) + (y - (149 : ℕ) • y)
    rw [nsmul_add]
    abel

@[simp]
theorem borderRetraction149_coe (S : AddSubgroup G) (hindex : S.index = 4) (g : G) :
    (borderRetraction149 S hindex g : G) = g - (149 : ℕ) • g := rfl

/-- The cardinality hypothesis makes the retraction the identity on `S`. -/
theorem borderRetraction149_subtype (S : AddSubgroup G) (hS : Nat.card S = 149)
    (hindex : S.index = 4) (s : S) : borderRetraction149 S hindex (s : G) = s := by
  have hs : (149 : ℕ) • s = 0 := by
    simpa only [hS] using (card_nsmul_eq_zero' (x := s))
  have hsG : (149 : ℕ) • (s : G) = 0 := by
    simpa using congrArg (fun x : S => (x : G)) hs
  apply Subtype.ext
  change (s : G) - (149 : ℕ) • (s : G) = (s : G)
  rw [hsG, sub_zero]

/-- The actual quotient coordinate and the complementary subgroup coordinate. -/
def borderQuotientProductHom149 (S : AddSubgroup G) (hindex : S.index = 4) :
    G →+ (G ⧸ S) × S :=
  (QuotientAddGroup.mk' S).prod (borderRetraction149 S hindex)

theorem borderQuotientProductHom149_injective (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) :
    Function.Injective (borderQuotientProductHom149 S hindex) := by
  intro x y hxy
  let π := QuotientAddGroup.mk' S
  let p := borderRetraction149 S hindex
  have hquot : π x = π y := congrArg Prod.fst hxy
  have hproj : p x = p y := congrArg Prod.snd hxy
  have hmem : x - y ∈ S := by
    apply (QuotientAddGroup.eq_zero_iff _).mp
    change π (x - y) = 0
    rw [map_sub, hquot, sub_self]
  have hzero : p (x - y) = 0 := by rw [map_sub, hproj, sub_self]
  have hfix : p (x - y) = ⟨x - y, hmem⟩ :=
    borderRetraction149_subtype S hS hindex ⟨x - y, hmem⟩
  have hdifference : x - y = 0 :=
    congrArg (fun s : S => (s : G)) (hfix.symm.trans hzero)
  exact sub_eq_zero.mp hdifference

/-- This is an additive product decomposition, with no assumed splitting. -/
noncomputable def borderQuotientProductEquiv149 [Finite G] (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) : G ≃+ (G ⧸ S) × S :=
  AddEquiv.ofBijective (borderQuotientProductHom149 S hindex)
    ((Nat.bijective_iff_injective_and_card _).mpr
      ⟨borderQuotientProductHom149_injective S hS hindex, by
        rw [Nat.card_prod]
        exact S.card_eq_card_quotient_mul_card_addSubgroup⟩)

/-- A subgroup of prime order 149 is additively isomorphic to `ZMod 149`. -/
noncomputable def subgroupEquivZMod149 (S : AddSubgroup G) (hS : Nat.card S = 149) :
    S ≃+ ZMod 149 := by
  simpa only [hS] using
    (zmodAddCyclicAddEquiv (G := S) (isAddCyclic_of_prime_card hS)).symm

/-- Product coordinates for every finite abelian domain with a subgroup
of size 149 and index four. -/
noncomputable def borderDomainEquiv149 [Finite G] (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) :
    G ≃+ (G ⧸ S) × ZMod 149 :=
  (borderQuotientProductEquiv149 S hS hindex).trans
    ((AddEquiv.refl (G ⧸ S)).prodCongr (subgroupEquivZMod149 S hS))

/-- The first coordinate is the actual quotient map. -/
theorem borderDomainEquiv149_fst [Finite G] (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (g : G) :
    (borderDomainEquiv149 S hS hindex g).1 = QuotientAddGroup.mk' S g := rfl

/-- Membership in the distinguished subgroup becomes a zero first coordinate. -/
theorem borderDomainEquiv149_mem_iff [Finite G] (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (g : G) :
    g ∈ S ↔ (borderDomainEquiv149 S hS hindex g).1 = 0 := by
  rw [borderDomainEquiv149_fst]
  exact (QuotientAddGroup.eq_zero_iff g).symm

/-- On the subgroup the isomorphism has exactly the required second-factor form. -/
theorem borderDomainEquiv149_subtype [Finite G] (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) (s : S) :
    borderDomainEquiv149 S hS hindex (s : G) = (0, subgroupEquivZMod149 S hS s) := by
  apply Prod.ext
  · change QuotientAddGroup.mk' S (s : G) = 0
    exact (QuotientAddGroup.eq_zero_iff (s : G)).mpr s.property
  · change subgroupEquivZMod149 S hS (borderRetraction149 S hindex (s : G)) = _
    rw [borderRetraction149_subtype]

/-- The image of `S` is the entire second factor, not just a subset of it. -/
theorem borderDomainEquiv149_map_subgroup [Finite G] (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) :
    S.map (borderDomainEquiv149 S hS hindex).toAddMonoidHom =
      (⊥ : AddSubgroup (G ⧸ S)).prod ⊤ := by
  ext x
  simp only [AddSubgroup.mem_map, AddSubgroup.mem_prod, AddSubgroup.mem_bot,
    AddSubgroup.mem_top, and_true]
  constructor
  · rintro ⟨g, hg, rfl⟩
    exact (borderDomainEquiv149_mem_iff S hS hindex g).mp hg
  · intro hx
    obtain ⟨g, hg⟩ := (borderDomainEquiv149 S hS hindex).surjective x
    refine ⟨g, (borderDomainEquiv149_mem_iff S hS hindex g).mpr ?_, hg⟩
    rw [hg]
    exact hx

/-- The quotient in the constructed product has the required order four. -/
theorem border_quotient_card_four (S : AddSubgroup G) (hindex : S.index = 4) :
    Nat.card (G ⧸ S) = 4 := S.index_eq_card.symm.trans hindex

/-- An explicit existence endpoint combining the product decomposition
with the exact subgroup and quotient data. -/
theorem exists_border_domain_equiv149 [Finite G] (S : AddSubgroup G)
    (hS : Nat.card S = 149) (hindex : S.index = 4) :
    ∃ e : G ≃+ (G ⧸ S) × ZMod 149,
      (∀ g : G, (e g).1 = QuotientAddGroup.mk' S g) ∧
      (∀ g : G, g ∈ S ↔ (e g).1 = 0) ∧ Nat.card (G ⧸ S) = 4 := by
  exact ⟨borderDomainEquiv149 S hS hindex, borderDomainEquiv149_fst S hS hindex,
    borderDomainEquiv149_mem_iff S hS hindex, border_quotient_card_four S hindex⟩

end HadamardBorderSymmetry
