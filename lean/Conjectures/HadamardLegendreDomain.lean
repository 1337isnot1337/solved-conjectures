import Mathlib.GroupTheory.Perm.Cycle.Type
import Mathlib.GroupTheory.QuotientGroup.Basic
import Mathlib.GroupTheory.SpecificGroups.Cyclic
import Mathlib.GroupTheory.Index
import Mathlib.Tactic.Abel
import Mathlib.Tactic.NormNum.Prime

/-!
# Actual product coordinates for every abelian group of order 1197

Cauchy's theorem supplies elements of orders seven and nineteen. Their
sum has order 133 and generates a cyclic subgroup of that order.
Multiplication by 666 is a retraction onto this subgroup: it is zero on
the quotient of order nine and is the identity on the subgroup.
This constructs the required product equivalence without a splitting
hypothesis or a classification of groups of order nine.
-/

noncomputable section

namespace HadamardLegendre

variable {G : Type*} [AddCommGroup G]

theorem exists_cyclic_subgroup_card_133 [Finite G] (hG : Nat.card G = 1197) :
    ∃ S : AddSubgroup G, Nat.card S = 133 ∧ IsAddCyclic S := by
  let : Fact (Nat.Prime 7) := ⟨by norm_num⟩
  let : Fact (Nat.Prime 19) := ⟨by norm_num⟩
  obtain ⟨a, ha⟩ := exists_prime_orderOf_dvd_card' (G := Multiplicative G) 7
    (show 7 ∣ Nat.card G by rw [hG]; decide)
  obtain ⟨b, hb⟩ := exists_prime_orderOf_dvd_card' (G := Multiplicative G) 19
    (show 19 ∣ Nat.card G by rw [hG]; decide)
  have hab : orderOf (a * b) = 133 := by
    calc
      orderOf (a * b) = orderOf a * orderOf b :=
        (Commute.all a b).orderOf_mul_eq_mul_orderOf_of_coprime (by rw [ha, hb]; decide)
      _ = 133 := by rw [ha, hb]
  refine ⟨AddSubgroup.zmultiples (a * b).toAdd, ?_, inferInstance⟩
  exact (Nat.card_zmultiples (a * b).toAdd).trans hab

theorem subgroup133_index_nine (S : AddSubgroup G)
    (hG : Nat.card G = 1197) (hS : Nat.card S = 133) : S.index = 9 := by
  have h := S.card_mul_index
  rw [hG, hS] at h
  omega

def retraction133 (S : AddSubgroup G) (hindex : S.index = 9) : G →+ S where
  toFun g := ⟨(666 : ℕ) • g, by
    apply (QuotientAddGroup.eq_zero_iff _).mp
    change (QuotientAddGroup.mk' S) ((666 : ℕ) • g) = 0
    rw [map_nsmul]
    have hq : (9 : ℕ) • (QuotientAddGroup.mk' S g) = 0 := by
      simpa only [← S.index_eq_card, hindex] using
        (card_nsmul_eq_zero' (x := QuotientAddGroup.mk' S g))
    calc
      (666 : ℕ) • (QuotientAddGroup.mk' S g) =
          (74 : ℕ) • ((9 : ℕ) • (QuotientAddGroup.mk' S g)) := by abel
      _ = 0 := by rw [hq, nsmul_zero]⟩
  map_zero' := by
    apply Subtype.ext
    change (666 : ℕ) • (0 : G) = 0
    rw [nsmul_zero]
  map_add' x y := by
    apply Subtype.ext
    change (666 : ℕ) • (x + y) = (666 : ℕ) • x + (666 : ℕ) • y
    rw [nsmul_add]

theorem retraction133_subtype (S : AddSubgroup G)
    (hS : Nat.card S = 133) (hindex : S.index = 9) (s : S) :
    retraction133 S hindex (s : G) = s := by
  have hs : (133 : ℕ) • s = 0 := by
    simpa only [hS] using card_nsmul_eq_zero' (x := s)
  have hsG : (133 : ℕ) • (s : G) = 0 := by
    simpa using congrArg (fun x : S => (x : G)) hs
  apply Subtype.ext
  change (666 : ℕ) • (s : G) = (s : G)
  calc
    (666 : ℕ) • (s : G) = (5 : ℕ) • ((133 : ℕ) • (s : G)) + (s : G) := by abel
    _ = (s : G) := by rw [hsG, nsmul_zero, zero_add]

def quotientProductHom133 (S : AddSubgroup G) (hindex : S.index = 9) :
    G →+ (G ⧸ S) × S :=
  (QuotientAddGroup.mk' S).prod (retraction133 S hindex)

theorem quotientProductHom133_injective (S : AddSubgroup G)
    (hS : Nat.card S = 133) (hindex : S.index = 9) :
    Function.Injective (quotientProductHom133 S hindex) := by
  intro x y hxy
  let π := QuotientAddGroup.mk' S
  let p := retraction133 S hindex
  have hquot : π x = π y := congrArg Prod.fst hxy
  have hproj : p x = p y := congrArg Prod.snd hxy
  have hmem : x - y ∈ S := by
    apply (QuotientAddGroup.eq_zero_iff _).mp
    change π (x - y) = 0
    rw [map_sub, hquot, sub_self]
  have hzero : p (x - y) = 0 := by rw [map_sub, hproj, sub_self]
  have hfix : p (x - y) = ⟨x - y, hmem⟩ :=
    retraction133_subtype S hS hindex ⟨x - y, hmem⟩
  have hdifference : x - y = 0 :=
    congrArg (fun s : S => (s : G)) (hfix.symm.trans hzero)
  exact sub_eq_zero.mp hdifference

def quotientProductEquiv133 [Finite G] (S : AddSubgroup G)
    (hS : Nat.card S = 133) (hindex : S.index = 9) : G ≃+ (G ⧸ S) × S :=
  AddEquiv.ofBijective (quotientProductHom133 S hindex)
    ((Nat.bijective_iff_injective_and_card _).mpr
      ⟨quotientProductHom133_injective S hS hindex, by
        rw [Nat.card_prod]
        exact S.card_eq_card_quotient_mul_card_addSubgroup⟩)

def cyclicSubgroupEquiv133 (S : AddSubgroup G) (hS : Nat.card S = 133)
    (hcyc : IsAddCyclic S) : S ≃+ ZMod 133 :=
  hS ▸ (zmodAddCyclicAddEquiv (G := S) hcyc).symm

def domainEquiv133 [Finite G] (S : AddSubgroup G)
    (hS : Nat.card S = 133) (hindex : S.index = 9) (hcyc : IsAddCyclic S) :
    G ≃+ (G ⧸ S) × ZMod 133 :=
  (quotientProductEquiv133 S hS hindex).trans
    ((AddEquiv.refl (G ⧸ S)).prodCongr (cyclicSubgroupEquiv133 S hS hcyc))

theorem domainEquiv133_fst [Finite G] (S : AddSubgroup G)
    (hS : Nat.card S = 133) (hindex : S.index = 9) (hcyc : IsAddCyclic S) (g : G) :
    (domainEquiv133 S hS hindex hcyc g).1 = QuotientAddGroup.mk' S g := rfl

/-- Every original domain admits the product coordinates required by the
multiplier argument; the order-nine factor remains an arbitrary abelian group. -/
theorem exists_domain_equiv1197 [Finite G] (hG : Nat.card G = 1197) :
    ∃ S : AddSubgroup G, Nat.card S = 133 ∧ Nat.card (G ⧸ S) = 9 ∧
      Nonempty (G ≃+ (G ⧸ S) × ZMod 133) := by
  obtain ⟨S, hS, hcyc⟩ := exists_cyclic_subgroup_card_133 hG
  have hi := subgroup133_index_nine S hG hS
  refine ⟨S, hS, S.index_eq_card.symm.trans hi, ?_⟩
  exact ⟨domainEquiv133 S hS hi hcyc⟩

end HadamardLegendre
