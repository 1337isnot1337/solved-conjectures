import Conjectures.LonelinessPigeonholePlane
import Mathlib.Data.Fintype.Perm

/-! Every primitive positive four-speed tuple of value below `2/9` has all
coordinates at most `18^3 = 5832`. This is independent of the finite four-speed
classification: only the verified bound for at most three speeds is used. -/

namespace Loneliness.Pigeonhole

open CoordinateSubspace SubspaceDensity

theorem four_speed_cutoff_last (v : Fin 4 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : value (List.ofFn v) < (2 / 9 : ℝ)) : v (Fin.last 3) ≤ 5832 := by
  by_contra hn
  have hlarge : (18 : ℕ) ^ 3 < v (Fin.last 3) := by
    norm_num
    exact Nat.lt_of_not_ge hn
  obtain ⟨F, hdim, hfree, hvF, hbound⟩ :=
    approximation_plane (n := 3) v hpositive hprimitive 18 (by decide) hlarge
  have hfreeR := coordinateFree_realSpan hfree
  have hlower := SmallRunner.subspace_value_lower F hfreeR
    (by simp [finrank_realSpan, hdim])
  norm_num [finrank_realSpan, hdim] at hlower
  change spaceValue (realSpan F) ≤ value (List.ofFn v) + 1 / (2 * (18 : ℝ)) at hbound
  norm_num only at hbound
  linarith

theorem dvd_foldr_gcd_iff (a : ℕ) (ds : List ℕ) :
    a ∣ ds.foldr Nat.gcd 0 ↔ ∀ b ∈ ds, a ∣ b := by
  induction ds with
  | nil => simp
  | cons b ds ih => simp [Nat.dvd_gcd_iff, ih]

theorem foldr_gcd_eq_of_perm {ds es : List ℕ} (hperm : ds.Perm es) :
    ds.foldr Nat.gcd 0 = es.foldr Nat.gcd 0 := by
  apply Nat.dvd_antisymm
  · apply (dvd_foldr_gcd_iff _ es).mpr
    intro a ha
    exact (dvd_foldr_gcd_iff _ ds).mp (dvd_refl _) a (hperm.mem_iff.mpr ha)
  · apply (dvd_foldr_gcd_iff _ ds).mpr
    intro a ha
    exact (dvd_foldr_gcd_iff _ es).mp (dvd_refl _) a (hperm.mem_iff.mp ha)

theorem four_speed_cutoff (v : Fin 4 → ℕ)
    (hpositive : ∀ i, 0 < v i)
    (hprimitive : (List.ofFn v).foldr Nat.gcd 0 = 1)
    (hbelow : value (List.ofFn v) < (2 / 9 : ℝ)) :
    ∀ i, v i ≤ 5832 := by
  intro i
  let p : Equiv.Perm (Fin 4) := Equiv.swap i (Fin.last 3)
  let u : Fin 4 → ℕ := v ∘ p
  have hperm : (List.ofFn u).Perm (List.ofFn v) := p.ofFn_comp_perm v
  have huprimitive : (List.ofFn u).foldr Nat.gcd 0 = 1 :=
    (foldr_gcd_eq_of_perm hperm).trans hprimitive
  have huvalue : value (List.ofFn u) = value (List.ofFn v) := CriticalFamilies.value_perm hperm
  have hlast := four_speed_cutoff_last u (fun k => hpositive (p k)) huprimitive
    (by simpa only [huvalue] using hbelow)
  simpa [u, p] using hlast

end Loneliness.Pigeonhole
