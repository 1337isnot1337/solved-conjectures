import Conjectures.LonelinessFourSpeedCertificate17
import Conjectures.LonelinessFourSpeedCertificate29
import Conjectures.LonelinessFourSpeedCertificate31
import Conjectures.LonelinessFourSpeedCertificate37
import Conjectures.LonelinessFourSpeedCertificate41
import Conjectures.LonelinessFourSpeedCertificate43
import Conjectures.LonelinessFourSpeedCertificate47
import Conjectures.LonelinessFourSpeedCertificate53
import Conjectures.LonelinessFourSpeedCertificate59
import Conjectures.LonelinessFourSpeedCertificate61
import Conjectures.LonelinessModularPrimes

/-! The complete prime-table reduction for the four-speed gap at 2/9.
The bounded integer input is reduced to a literal retained modular support. -/

namespace Loneliness.Modular.FourSpeed

open scoped BigOperators

def checkedPrimes : Finset ℕ := {17,29,31,37,41,43,47,53,59,61}

def retainedFor (p : ℕ) : Finset (Finset ℕ) :=
  if p=17 then Prime17.retained else
  if p=29 then Prime29.retained else
  if p=31 then Prime31.retained else
  if p=37 then Prime37.retained else
  if p=41 then Prime41.retained else
  if p=43 then Prime43.retained else
  if p=47 then Prime47.retained else
  if p=53 then Prime53.retained else
  if p=59 then Prime59.retained else
  if p=61 then Prime61.retained else
  ∅

theorem checkedPrimes_prime : ∀ p∈checkedPrimes, p.Prime := by decide

theorem checkedPrimes_product : (5832 : ℕ)^4 < ∏ p∈checkedPrimes, p := by decide

theorem prod_le_bound_power (ds : List ℕ) (bound : ℕ)
    (hbound : ∀ d∈ds, d≤bound) : ds.prod≤bound^ds.length := by
  induction ds with
  | nil => simp
  | cons d ds ih =>
    have hd := hbound d (by simp)
    have htail := ih (fun a ha => hbound a (by simp [ha]))
    simpa only [List.prod_cons,List.length_cons,pow_succ,Nat.mul_comm] using
      Nat.mul_le_mul hd htail

theorem checked_prime_avoids (ds : List ℕ) (hlen : ds.length=4)
    (hpos : ∀ d∈ds, 0<d) (hbound : ∀ d∈ds, d≤5832) :
    ∃ p∈checkedPrimes, ∀ d∈ds, d%p≠0 := by
  have hprod : ds.prod<(∏ p∈checkedPrimes, p) := by
    have h := prod_le_bound_power ds 5832 hbound
    rw [hlen] at h
    exact h.trans_lt checkedPrimes_product
  obtain ⟨p,hp,havoid⟩ := exists_prime_avoiding_speeds checkedPrimes ds
    checkedPrimes_prime hpos hprod
  exact ⟨p,hp,fun d hd hz => havoid d hd (Nat.dvd_of_mod_eq_zero hz)⟩

theorem retained_table_cover (p : ℕ) (hp : p∈checkedPrimes)
    (ds : List ℕ) (hne : ds≠[]) (hlen : ds.length≤4)
    (hmod : ∀ d∈ds, d%p≠0) (hlow : value ds<(2/9 : ℝ)) :
    ∃ u v : ℕ, (u*v)%p=1%p ∧ foldedSupport p u (residueSupport p ds)∈retainedFor p := by
  simp only [checkedPrimes,Finset.mem_insert,Finset.mem_singleton] at hp
  rcases hp with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  · simpa [retainedFor] using Prime17.residue_cover ds hne hlen hmod hlow
  · simpa [retainedFor] using Prime29.residue_cover ds hne hlen hmod hlow
  · simpa [retainedFor] using Prime31.residue_cover ds hne hlen hmod hlow
  · simpa [retainedFor] using Prime37.residue_cover ds hne hlen hmod hlow
  · simpa [retainedFor] using Prime41.residue_cover ds hne hlen hmod hlow
  · simpa [retainedFor] using Prime43.residue_cover ds hne hlen hmod hlow
  · simpa [retainedFor] using Prime47.residue_cover ds hne hlen hmod hlow
  · simpa [retainedFor] using Prime53.residue_cover ds hne hlen hmod hlow
  · simpa [retainedFor] using Prime59.residue_cover ds hne hlen hmod hlow
  · simpa [retainedFor] using Prime61.residue_cover ds hne hlen hmod hlow

/-- Every positive four-speed input under the rigorous cutoff is covered by
one of the concrete finite support tables. The classification of the retained
supports is a separate subsequent proof obligation. -/
theorem bounded_four_speed_residue_cover (ds : List ℕ) (hlen : ds.length=4)
    (hpos : ∀ d∈ds, 0<d) (hbound : ∀ d∈ds, d≤5832)
    (hlow : value ds<(2/9 : ℝ)) :
    ∃ p∈checkedPrimes, ∃ u v : ℕ, (u*v)%p=1%p ∧
      foldedSupport p u (residueSupport p ds)∈retainedFor p := by
  obtain ⟨p,hp,hmod⟩ := checked_prime_avoids ds hlen hpos hbound
  have hne : ds≠[] := by intro h; simp [h] at hlen
  obtain ⟨u,v,hunit,hmem⟩ := retained_table_cover p hp ds hne (by omega) hmod hlow
  exact ⟨p,hp,u,v,hunit,hmem⟩

end Loneliness.Modular.FourSpeed
