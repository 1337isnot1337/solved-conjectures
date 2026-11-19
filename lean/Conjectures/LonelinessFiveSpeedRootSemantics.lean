import Conjectures.LonelinessFiveSpeedRootSemanticsNormalize
import Conjectures.LonelinessFiveSpeedRootSemanticsTransport
import Conjectures.LonelinessFiveSpeedScalarInverse

/-! From a normalized modular root cover to unrestricted five-coordinate
inputs. Zero residues and folded collisions remain explicit alternatives;
they are the speed and signed-pair factors in the later prime-product lift. -/

namespace Loneliness.FiveSpeedRoot

open Loneliness.Modular

def ZeroCoordinate (p : ℕ) (v : Speeds) : Prop :=
  ∃ i : Fin 5, (p : ℤ) ∣ (v i : ℤ)

def SignedCollision (p : ℕ) (v : Speeds) : Prop :=
  ∃ i j : Fin 5, i < j ∧
    ((p : ℤ) ∣ (v i : ℤ) - (v j : ℤ) ∨ (p : ℤ) ∣ (v i : ℤ) + (v j : ℤ))

def RootOutcome (p : ℕ) (v : Speeds) : Prop :=
  HasWitness 5 p (List.ofFn v) ∨ ZeroCoordinate p v ∨ SignedCollision p v ∨
    TwoShortRelations p v ∨ Folded134 p v

def GlobalRootCover (p : ℕ) : Prop := ∀ v : Speeds, RootOutcome p v

theorem folded_eq_signed_dvd (p a b : ℕ) (hp : 0 < p)
    (hfold : folded p a = folded p b) :
    (p : ℤ) ∣ (a : ℤ) - (b : ℤ) ∨ (p : ℤ) ∣ (a : ℤ) + (b : ℤ) := by
  obtain ⟨ε, hε, ha⟩ := folded_int_modEq_sign p a hp
  obtain ⟨δ, hδ, hb⟩ := folded_int_modEq_sign p b hp
  have he : (folded p a : ℤ) ≡ (folded p b : ℤ) [ZMOD (p : ℤ)] := by
    simpa only [hfold] using (Int.ModEq.refl (folded p b : ℤ))
  have h := ha.symm.trans (he.trans hb)
  rcases hε with rfl | rfl <;> rcases hδ with rfl | rfl <;>
    simp only [one_mul, neg_one_mul] at h
  · exact Or.inl h.symm.dvd
  · right
    simpa only [sub_neg_eq_add] using h.symm.dvd
  · right
    simpa only [neg_neg, sub_neg_eq_add] using h.neg.symm.dvd
  · left
    simpa only [neg_neg] using h.neg.symm.dvd

theorem rootCover_of_normalized (p : ℕ) (hp : 2 ≤ p) (inv : ℕ → ℕ)
    (hinv : ∀ a, 0 < a → 2 * a ≤ p → (a * inv a) % p = 1 % p)
    (hcover : NormalizedRootCover p inv) : GlobalRootCover p := by
  classical
  intro v
  have hppos : 0 < p := by omega
  by_cases hzero : ∃ i : Fin 5, folded p (v i) = 0
  · obtain ⟨i, hi⟩ := hzero
    refine Or.inr (Or.inl ⟨i, ?_⟩)
    have hd : p ∣ v i := Nat.dvd_of_mod_eq_zero ((folded_eq_zero_iff hppos).mp hi)
    exact_mod_cast hd
  have hpositive (i : Fin 5) : 0 < folded p (v i) :=
    Nat.pos_of_ne_zero (fun h => hzero ⟨i, h⟩)
  by_cases hinj : Function.Injective (fun i => folded p (v i))
  · obtain ⟨u, invU, q, π, hunit, hq, hqi⟩ :=
      normalized_quintuple_of_five_folded p hp inv hinv v hpositive hinj
    rcases hcover q hq with hw | htwo | h134
    · exact Or.inl (hasWitness_of_folded_unit_reindex p hppos u invU hunit v q π hqi hw)
    · exact Or.inr (Or.inr (Or.inr (Or.inl
        (twoShortRelations_of_folded_unit_reindex p hppos u invU hunit v q π hqi htwo))))
    · exact Or.inr (Or.inr (Or.inr (Or.inr
        (folded134_of_folded_unit_reindex p hppos u invU hunit v q π hqi h134))))
  · have hex : ∃ i j : Fin 5, folded p (v i) = folded p (v j) ∧ i ≠ j := by
      by_contra h
      apply hinj
      intro i j hij
      by_contra hne
      exact h ⟨i, j, hij, hne⟩
    obtain ⟨i, j, hij, hne⟩ := hex
    apply Or.inr
    apply Or.inr
    apply Or.inl
    rcases lt_or_gt_of_ne hne with hlt | hgt
    · exact ⟨i, j, hlt, folded_eq_signed_dvd p (v i) (v j) hppos hij⟩
    · exact ⟨j, i, hgt, folded_eq_signed_dvd p (v j) (v i) hppos hij.symm⟩

theorem normalized_quintuple_of_scalar_table (p : ℕ) (hp : 2 ≤ p)
    (table : Array Loneliness.FiveSpeedCertificate.ScalarMaskEntry)
    (hcheck : Loneliness.FiveSpeedCertificate.scalarTableCheck p table = true)
    (v : Speeds) (hpositive : ∀ i, 0 < folded p (v i))
    (hinjective : Function.Injective (fun i => folded p (v i))) :
    ∃ (u invU : ℕ) (q : Speeds) (π : Equiv.Perm (Fin 5)),
      (u * invU) % p = 1 % p ∧
      NormalizedQuintuple p (Loneliness.FiveSpeedCertificate.scalarInverse table) q ∧
      ∀ i, q i = folded p (u * v (π i)) :=
  normalized_quintuple_of_five_folded p hp _
    (Loneliness.FiveSpeedCertificate.scalarTableCheck_inverse p table hcheck)
    v hpositive hinjective

theorem rootCover_of_scalar_table (p : ℕ) (hp : 2 ≤ p)
    (table : Array Loneliness.FiveSpeedCertificate.ScalarMaskEntry)
    (hcheck : Loneliness.FiveSpeedCertificate.scalarTableCheck p table = true)
    (hcover : NormalizedRootCover p (Loneliness.FiveSpeedCertificate.scalarInverse table)) :
    GlobalRootCover p :=
  rootCover_of_normalized p hp _
    (Loneliness.FiveSpeedCertificate.scalarTableCheck_inverse p table hcheck) hcover

theorem rootOutcome_of_value_lt (p : ℕ) (hp : 0 < p) (hcover : GlobalRootCover p)
    (v : Speeds) (hv : value (List.ofFn v) < (1 / 5 : ℝ)) :
    ZeroCoordinate p v ∨ SignedCollision p v ∨ TwoShortRelations p v ∨ Folded134 p v := by
  rcases hcover v with hw | h
  · exact False.elim ((no_witness_of_value_lt (by decide : 2 ≤ 5) hp hv) hw)
  · exact h

end Loneliness.FiveSpeedRoot
