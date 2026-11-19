import Conjectures.LonelinessHyperplaneCoordinateCompression
import Mathlib.Logic.Relation
import Mathlib.Data.Fintype.Option
import Mathlib.Data.Fintype.Prod

/-! Intersections of coordinate-collision events reduce to a single
integer relation on the quotient coordinates. The zero coordinate is
included as `none`, so a collision with it represents failure of
strict positivity. -/

namespace Loneliness.Hyperplane.QuasipolynomialArithmetic

open scoped BigOperators

noncomputable section

abbrev collisionPair (ι : Type*) :=
  {p : Option ι × Option ι // p.1 ≠ p.2}

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

def collisionRelation (S : Finset (collisionPair ι)) (a b : Option ι) : Prop :=
  ∃ e ∈ S, e.1.1 = a ∧ e.1.2 = b

def collisionSetoid (S : Finset (collisionPair ι)) : Setoid (Option ι) :=
  Relation.EqvGen.setoid (collisionRelation S)

abbrev collisionClass (S : Finset (collisionPair ι)) := Quotient (collisionSetoid S)

instance collisionClass_fintype (S : Finset (collisionPair ι)) : Fintype (collisionClass S) :=
  Fintype.ofFinite _

def collisionClassMap (S : Finset (collisionPair ι)) : Option ι → collisionClass S :=
  Quotient.mk (collisionSetoid S)

theorem collisionClassMap_surjective (S : Finset (collisionPair ι)) :
    Function.Surjective (collisionClassMap S) := Quotient.mk_surjective

theorem collisionClassMap_noninjective {S : Finset (collisionPair ι)} (hS : S.Nonempty) :
    ¬ Function.Injective (collisionClassMap S) := by
  obtain ⟨e, he⟩ := hS
  intro hπ
  apply e.2
  apply hπ
  apply Quotient.sound
  exact Relation.EqvGen.rel _ _ ⟨e, he, rfl, rfl⟩

theorem collision_conditions_iff {N : ℕ} (S : Finset (collisionPair ι))
    (v : ι → Fin (N + 1)) :
    (∀ e ∈ S, zeroExtended v e.1.1 = zeroExtended v e.1.2) ↔
      ∀ a b, collisionClassMap S a = collisionClassMap S b →
        zeroExtended v a = zeroExtended v b := by
  constructor
  · intro hv a b hab
    have hrel : Relation.EqvGen (collisionRelation S) a b := Quotient.exact hab
    induction hrel with
    | rel a b h =>
      obtain ⟨e, he, hea, heb⟩ := h
      simpa only [hea, heb] using hv e he
    | refl a => rfl
    | symm a b _ ih => exact ih.symm
    | trans a b c _ _ ihab ihbc => exact ihab.trans ihbc
  · intro hv e he
    apply hv
    apply Quotient.sound
    exact Relation.EqvGen.rel _ _ ⟨e, he, rfl, rfl⟩

def collisionBox (m : ι → ℤ) (S : Finset (collisionPair ι)) (N : ℕ) : Type _ :=
  {v : closedRelationBox m N //
    ∀ e ∈ S, zeroExtended v.1 e.1.1 = zeroExtended v.1 e.1.2}

def collisionBoxEquiv (m : ι → ℤ) (S : Finset (collisionPair ι)) (N : ℕ) :
    collisionBox m S N ≃ coarsenedRelationBox m (collisionClassMap S) N :=
  Equiv.subtypeEquivRight (fun v => collision_conditions_iff S v.1)

def collisionBox_emptyEquiv (m : ι → ℤ) (N : ℕ) :
    collisionBox m ∅ N ≃ closedRelationBox m N where
  toFun v := v.1
  invFun v := ⟨v, by intro e he; exact False.elim (Finset.notMem_empty e he)⟩
  left_inv v := Subtype.ext rfl
  right_inv _ := rfl

/-- Every nonempty collision family lowers the number of free
coordinates, even if the compressed normal becomes zero. -/
theorem collisionBox_isQuasipolynomial_of_nonempty
    (m : ι → ℤ) (S : Finset (collisionPair ι)) (hS : S.Nonempty) :
    IsQuasipolynomial (fun N => (Nat.card (collisionBox m S N) : ℚ))
      (Fintype.card ι - 1) := by
  classical
  have h := coarsenedRelationBox_isQuasipolynomial_of_noninjective
    m (collisionClassMap S) (collisionClassMap_surjective S)
      (collisionClassMap_noninjective hS)
  apply h.congr
  intro N
  exact congrArg (fun n : ℕ => (n : ℚ)) (Nat.card_congr (collisionBoxEquiv m S N)).symm

theorem collisionBox_isQuasipolynomial
    (m : ι → ℤ) (hm : m ≠ 0) (S : Finset (collisionPair ι)) :
    IsQuasipolynomial (fun N => (Nat.card (collisionBox m S N) : ℚ))
      (Fintype.card ι - 1) := by
  classical
  by_cases hS : S = ∅
  · subst S
    have h : IsQuasipolynomial (fun N => (Nat.card (closedRelationBox m N) : ℚ))
        (Fintype.card ι - 1) := closedRelationBox_quasipolynomial_of_nonzero m hm
    apply h.congr
    intro N
    exact congrArg (fun n : ℕ => (n : ℚ)) (Nat.card_congr (collisionBox_emptyEquiv m N)).symm
  · exact collisionBox_isQuasipolynomial_of_nonempty m S
      (Finset.nonempty_iff_ne_empty.mpr hS)

end

end Loneliness.Hyperplane.QuasipolynomialArithmetic
