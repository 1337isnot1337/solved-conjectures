import Mathlib.Data.Nat.Prime.Basic
import Mathlib.Data.Nat.GCD.BigOperators
import Mathlib.Data.Int.Basic
import Mathlib.Algebra.Ring.Int.Defs
import Mathlib.Algebra.BigOperators.GroupWithZero.Finset
import Mathlib.Algebra.BigOperators.Group.Finset.Piecewise
import Mathlib.Algebra.BigOperators.Ring.List
import Mathlib.Tactic.ByContra

/-! Integer prime avoidance for the root-product lift. Zero factors may be
replaced by one; a prime avoiding the replacement product then turns any
divisibility of an original factor into an exact zero. -/

namespace Loneliness.FiveSpeedRoot

open scoped BigOperators

private theorem distinct_prime_product_dvd (ps : Finset ℕ) (D : ℕ)
    (hprime : ∀ p ∈ ps, p.Prime) (hdiv : ∀ p ∈ ps, p ∣ D) :
    (∏ p ∈ ps, p) ∣ D := by
  classical
  induction ps using Finset.induction_on with
  | empty => simp
  | @insert p ps hnot ih =>
    rw [Finset.prod_insert hnot]
    have hcop : p.Coprime (∏ q ∈ ps, q) := by
      apply Nat.Coprime.prod_right
      intro q hq
      exact (Nat.coprime_primes (hprime p (by simp))
        (hprime q (by simp [hq]))).mpr (fun heq => hnot (heq ▸ hq))
    exact hcop.mul_dvd_of_dvd_of_dvd (hdiv p (by simp))
      (ih (fun q hq => hprime q (by simp [hq]))
        (fun q hq => hdiv q (by simp [hq])))

theorem integer_eq_zero_of_prime_product (ps : Finset ℕ) (z : ℤ)
    (hprime : ∀ p ∈ ps, p.Prime)
    (hdiv : ∀ p ∈ ps, (p : ℤ) ∣ z)
    (hbound : z.natAbs < ∏ p ∈ ps, p) : z = 0 := by
  have hprod := distinct_prime_product_dvd ps z.natAbs hprime
    (fun p hp => Int.natCast_dvd.mp (hdiv p hp))
  apply Int.natAbs_eq_zero.mp
  by_contra hz
  exact (not_le_of_gt hbound) (Nat.le_of_dvd (Nat.pos_of_ne_zero hz) hprod)

theorem exists_prime_avoiding_integer_list (ps : Finset ℕ) (factors : List ℤ)
    (hprime : ∀ p ∈ ps, p.Prime)
    (hnonzero : ∀ z ∈ factors, z ≠ 0)
    (hbound : factors.prod.natAbs < ∏ p ∈ ps, p) :
    ∃ p ∈ ps, ∀ z ∈ factors, ¬(p : ℤ) ∣ z := by
  classical
  by_contra! hnone
  have hdiv : ∀ p ∈ ps, p ∣ factors.prod.natAbs := by
    intro p hp
    obtain ⟨z, hz, hdiv⟩ := hnone p hp
    exact Int.natCast_dvd.mp (hdiv.trans (List.dvd_prod hz))
  have hprod := distinct_prime_product_dvd ps factors.prod.natAbs hprime hdiv
  have hnz : factors.prod ≠ 0 := List.prod_ne_zero (l := factors) (fun hz => hnonzero 0 hz rfl)
  have hpos : 0 < factors.prod.natAbs :=
    Nat.pos_of_ne_zero (fun hz => hnz (Int.natAbs_eq_zero.mp hz))
  exact (not_le_of_gt hbound) (Nat.le_of_dvd hpos hprod)

theorem exists_prime_avoiding_integer_finset {ι : Type*} (ps : Finset ℕ)
    (s : Finset ι) (f : ι → ℤ)
    (hprime : ∀ p ∈ ps, p.Prime)
    (hnonzero : ∀ i ∈ s, f i ≠ 0)
    (hbound : (∏ i ∈ s, f i).natAbs < ∏ p ∈ ps, p) :
    ∃ p ∈ ps, ∀ i ∈ s, ¬(p : ℤ) ∣ f i := by
  classical
  by_contra! hnone
  have hdiv : ∀ p ∈ ps, p ∣ (∏ i ∈ s, f i).natAbs := by
    intro p hp
    obtain ⟨i, hi, hdiv⟩ := hnone p hp
    exact Int.natCast_dvd.mp (hdiv.trans (Finset.dvd_prod_of_mem f hi))
  have hprod := distinct_prime_product_dvd ps (∏ i ∈ s, f i).natAbs hprime hdiv
  have hnz : (∏ i ∈ s, f i) ≠ 0 := (Finset.prod_ne_zero_iff (s := s) (f := f)).mpr hnonzero
  have hpos : 0 < (∏ i ∈ s, f i).natAbs :=
    Nat.pos_of_ne_zero (fun hz => hnz (Int.natAbs_eq_zero.mp hz))
  exact (not_le_of_gt hbound) (Nat.le_of_dvd hpos hprod)

def replaceZero (z : ℤ) : ℤ := if z = 0 then 1 else z

theorem replaceZero_ne_zero (z : ℤ) : replaceZero z ≠ 0 := by
  by_cases hz : z = 0 <;> simp [replaceZero, hz]

theorem zero_of_dvd_of_avoids_replaceZero (p : ℕ) (z : ℤ)
    (havoid : ¬(p : ℤ) ∣ replaceZero z) (hdiv : (p : ℤ) ∣ z) : z = 0 := by
  by_contra hz
  apply havoid
  simpa only [replaceZero, ite_eq_right hz] using hdiv

theorem replaceZero_natAbs_le (z : ℤ) (B : ℕ) (hB : 1 ≤ B)
    (hz : z.natAbs ≤ B) : (replaceZero z).natAbs ≤ B := by
  by_cases hzero : z = 0
  · simpa only [replaceZero, ite_eq_left hzero, Int.natAbs_one] using hB
  · simpa only [replaceZero, ite_eq_right hzero] using hz

theorem list_prod_natAbs_le_pow (factors : List ℤ) (B : ℕ)
    (hbound : ∀ z ∈ factors, z.natAbs ≤ B) :
    factors.prod.natAbs ≤ B ^ factors.length := by
  induction factors with
  | nil => simp
  | cons z zs ih =>
    have hz : z.natAbs ≤ B := hbound z (by simp)
    have hzs : ∀ w ∈ zs, w.natAbs ≤ B := fun w hw => hbound w (by simp [hw])
    calc
      (z :: zs).prod.natAbs = z.natAbs * zs.prod.natAbs := by
        simp only [List.prod_cons, Int.natAbs_mul]
      _ ≤ B * B ^ zs.length := Nat.mul_le_mul hz (ih hzs)
      _ = B ^ (z :: zs).length := by simp only [List.length_cons, pow_succ, Nat.mul_comm]

theorem exists_prime_avoiding_replaced_list (ps : Finset ℕ) (factors : List ℤ)
    (B : ℕ) (hB : 1 ≤ B)
    (hprime : ∀ p ∈ ps, p.Prime)
    (hsize : ∀ z ∈ factors, z.natAbs ≤ B)
    (hbound : B ^ factors.length < ∏ p ∈ ps, p) :
    ∃ p ∈ ps, ∀ z ∈ factors, ¬(p : ℤ) ∣ replaceZero z := by
  have hnz : ∀ z ∈ factors.map replaceZero, z ≠ 0 := by
    intro z hz
    obtain ⟨w, _, rfl⟩ := List.mem_map.mp hz
    exact replaceZero_ne_zero w
  have hsize' : ∀ z ∈ factors.map replaceZero, z.natAbs ≤ B := by
    intro z hz
    obtain ⟨w, hw, rfl⟩ := List.mem_map.mp hz
    exact replaceZero_natAbs_le w B hB (hsize w hw)
  have hb : (factors.map replaceZero).prod.natAbs < ∏ p ∈ ps, p :=
    (list_prod_natAbs_le_pow _ B hsize').trans_lt (by simpa only [List.length_map] using hbound)
  obtain ⟨p, hp, havoid⟩ := exists_prime_avoiding_integer_list ps
    (factors.map replaceZero) hprime hnz hb
  exact ⟨p, hp, fun z hz => havoid _ (List.mem_map.mpr ⟨z, hz, rfl⟩)⟩

theorem exists_prime_detecting_zeros (ps : Finset ℕ) (factors : List ℤ)
    (B : ℕ) (hB : 1 ≤ B)
    (hprime : ∀ p ∈ ps, p.Prime)
    (hsize : ∀ z ∈ factors, z.natAbs ≤ B)
    (hbound : B ^ factors.length < ∏ p ∈ ps, p) :
    ∃ p ∈ ps, ∀ z ∈ factors, (p : ℤ) ∣ z → z = 0 := by
  obtain ⟨p, hp, havoid⟩ := exists_prime_avoiding_replaced_list
    ps factors B hB hprime hsize hbound
  exact ⟨p, hp, fun z hz hdiv => zero_of_dvd_of_avoids_replaceZero p z (havoid z hz) hdiv⟩

end Loneliness.FiveSpeedRoot
