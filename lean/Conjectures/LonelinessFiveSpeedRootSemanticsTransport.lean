import Conjectures.LonelinessFiveSpeedRootSemanticsDefs
import Mathlib.Algebra.BigOperators.ModEq
import Mathlib.Tactic.Ring
import Mathlib.Tactic.Choose

/-! Transport both structural root alternatives through a common modular
unit, independent coordinate folding, and a coordinate permutation. The
two zero forms remain distinct after normalization up to overall sign. -/

namespace Loneliness.FiveSpeedRoot

open scoped BigOperators
open Loneliness.Modular

theorem folded_int_modEq_sign (p a : ℕ) (hp : 0 < p) :
    ∃ ε : ℤ, (ε = 1 ∨ ε = -1) ∧
      (folded p a : ℤ) ≡ ε * (a : ℤ) [ZMOD (p : ℤ)] := by
  have hmod : ((a % p : ℕ) : ℤ) ≡ (a : ℤ) [ZMOD (p : ℤ)] :=
    Int.natCast_modEq_iff.mpr (Nat.mod_mod a p)
  by_cases h : a % p ≤ p - a % p
  · refine ⟨1, Or.inl rfl, ?_⟩
    simpa only [folded, min_eq_left h, one_mul] using hmod
  · refine ⟨-1, Or.inr rfl, ?_⟩
    have hle : a % p ≤ p := (Nat.mod_lt a hp).le
    have hz : (p : ℤ) ≡ 0 [ZMOD (p : ℤ)] := by simp [Int.ModEq]
    have hh := hz.sub hmod
    simpa only [folded, min_eq_right (le_of_not_ge h), Nat.cast_sub hle,
      zero_sub, neg_one_mul] using hh

theorem int_unit_cancel (p u invU : ℕ) (hunit : (u * invU) % p = 1 % p)
    (x : ℤ) (hx : (p : ℤ) ∣ (u : ℤ) * x) : (p : ℤ) ∣ x := by
  have hu : ((u * invU : ℕ) : ℤ) ≡ (1 : ℤ) [ZMOD (p : ℤ)] :=
    Int.natCast_modEq_iff.mpr hunit
  have hu' : (invU : ℤ) * (u : ℤ) ≡ (1 : ℤ) [ZMOD (p : ℤ)] := by
    simpa only [Nat.cast_mul, mul_comm] using hu
  have hxunit : ((invU : ℤ) * (u : ℤ)) * x ≡ x [ZMOD (p : ℤ)] := by
    simpa only [one_mul] using hu'.mul_right x
  have hxzero : ((invU : ℤ) * (u : ℤ)) * x ≡ 0 [ZMOD (p : ℤ)] := by
    simpa only [mul_assoc, mul_zero] using hx.modEq_zero_int.mul_left (invU : ℤ)
  exact Int.modEq_zero_iff_dvd.mp (hxunit.symm.trans hxzero)

theorem dot_neg (r : Row) (v : Speeds) : dot (-r) v = -dot r v := by
  simp only [dot, Pi.neg_apply, neg_mul, Finset.sum_neg_distrib]

theorem divides_dot_reindexed (p u invU : ℕ) (hunit : (u * invU) % p = 1 % p)
    (v q : Speeds) (π : Equiv.Perm (Fin 5)) (σ : Fin 5 → ℤ)
    (hpoint : ∀ i, (q i : ℤ) ≡ σ i * (u : ℤ) * (v (π i) : ℤ) [ZMOD (p : ℤ)])
    (r : Row) (hr : (p : ℤ) ∣ dot r q) :
    (p : ℤ) ∣ dot (signPerm (fun j => σ (π.symm j)) π.symm r) v := by
  let r' := signPerm (fun j => σ (π.symm j)) π.symm r
  have hsum : dot r q ≡
      (∑ i : Fin 5, r i * (σ i * (u : ℤ) * (v (π i) : ℤ))) [ZMOD (p : ℤ)] :=
    Int.ModEq.sum (fun i _ => (hpoint i).mul_left (r i))
  have hreindex : dot r' v = ∑ i : Fin 5, σ i * r i * (v (π i) : ℤ) := by
    simpa only [dot, r', signPerm, Equiv.symm_apply_apply] using
      (Equiv.sum_comp π (fun j => σ (π.symm j) * r (π.symm j) * (v j : ℤ))).symm
  have heq : (∑ i : Fin 5, r i * (σ i * (u : ℤ) * (v (π i) : ℤ))) =
      (u : ℤ) * dot r' v := by
    rw [hreindex, Finset.mul_sum]
    apply Finset.sum_congr rfl
    intro i _
    ring
  have hcon : dot r q ≡ (u : ℤ) * dot r' v [ZMOD (p : ℤ)] := by
    rw [← heq]
    exact hsum
  have hprod : (p : ℤ) ∣ (u : ℤ) * dot r' v :=
    Int.modEq_zero_iff_dvd.mp (hcon.symm.trans hr.modEq_zero_int)
  exact int_unit_cancel p u invU hunit (dot r' v) hprod

theorem twoShortRelations_of_folded_unit_reindex (p : ℕ) (hp : 0 < p)
    (u invU : ℕ) (hunit : (u * invU) % p = 1 % p)
    (v q : Speeds) (π : Equiv.Perm (Fin 5))
    (hq : ∀ i, q i = folded p (u * v (π i)))
    (h : TwoShortRelations p q) : TwoShortRelations p v := by
  classical
  have hsign (i : Fin 5) : ∃ ε : ℤ, (ε = 1 ∨ ε = -1) ∧
      (q i : ℤ) ≡ ε * (u : ℤ) * (v (π i) : ℤ) [ZMOD (p : ℤ)] := by
    obtain ⟨ε, hε, hmod⟩ := folded_int_modEq_sign p (u * v (π i)) hp
    refine ⟨ε, hε, ?_⟩
    simpa only [hq i, Nat.cast_mul, mul_assoc] using hmod
  choose σ hσ hpoint using hsign
  obtain ⟨a, b, hab, ha, hb⟩ := (twoShortRelations_iff p q).mp h
  obtain ⟨c, d, hcd, hc, hd⟩ := two_distinct_forms_signPerm a b hab
    (fun j => σ (π.symm j)) (fun j => hσ (π.symm j)) π.symm
  have hca := divides_dot_reindexed p u invU hunit v q π σ hpoint (formRows a) ha
  have hdb := divides_dot_reindexed p u invU hunit v q π σ hpoint (formRows b) hb
  apply (twoShortRelations_iff p v).mpr
  refine ⟨c, d, hcd, ?_, ?_⟩
  · rcases hc with hc | hc <;> simpa only [hc, dot_neg, Int.dvd_neg] using hca
  · rcases hd with hd | hd <;> simpa only [hd, dot_neg, Int.dvd_neg] using hdb

theorem folded134_of_folded_unit_reindex (p : ℕ) (hp : 0 < p)
    (u invU : ℕ) (hunit : (u * invU) % p = 1 % p)
    (v q : Speeds) (π : Equiv.Perm (Fin 5))
    (hq : ∀ i, q i = folded p (u * v (π i)))
    (h : Folded134 p q) : Folded134 p v := by
  obtain ⟨a, ha, h3, h4⟩ := h
  have transfer (k : ℕ) (hk : folded p (k * a) ∈ foldedCoordinates p q) :
      folded p (k * (invU * a)) ∈ foldedCoordinates p v := by
    obtain ⟨j, hj⟩ := (mem_foldedCoordinates p q _).mp hk
    have he : folded p (k * (invU * a)) = folded p (v (π j)) := by
      calc
        _ = folded p (invU * folded p (k * a)) := by
          rw [folded_mul_folded p (k * a) invU hp]
          congr 1
          ring
        _ = folded p (invU * folded p (q j)) := by rw [← hj]
        _ = folded p (invU * q j) := folded_mul_folded p (q j) invU hp
        _ = folded p (invU * folded p (u * v (π j))) := by rw [hq j]
        _ = folded p (v (π j)) := folded_unit_cancel_folded hp hunit (v (π j))
    exact (mem_foldedCoordinates p v _).mpr ⟨π j, he.symm⟩
  refine ⟨invU * a, ?_, transfer 3 h3, transfer 4 h4⟩
  simpa only [one_mul] using transfer 1 (by simpa only [one_mul] using ha)

end Loneliness.FiveSpeedRoot
