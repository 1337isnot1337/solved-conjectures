module

public import Conjectures.ShumyatskyPrimeKernelLift
public import Conjectures.ShumyatskySocleAssembly
public import Mathlib.GroupTheory.Sylow
public import Mathlib.SetTheory.Cardinal.Finite

/-! An abelian minimal normal subgroup of a finite group has a
single prime in its spectrum, since its Sylow subgroups are
characteristic. This discharges the abelian case of the lift. -/

@[expose] public section

namespace Shumyatsky

variable {G : Type*} [Group G]

theorem exists_prime_spectrum_of_abelian_minimal_normal [Finite G]
    (N : Subgroup G) [IsMulCommutative N] (hMin : IsMinimalNormalSubgroup N) :
    ∃ p : ℕ, p.Prime ∧ primeSpectrum N ⊆ {p} := by
  classical
  have : N.Normal := hMin.normal
  have : Nontrivial N := N.nontrivial_iff_ne_bot.mpr hMin.neBot
  have hCard : Nat.card N ≠ 1 := by
    intro he
    have hSub := (Nat.card_eq_one_iff_unique.mp he).1
    obtain ⟨x, y, hxy⟩ := exists_pair_ne N
    exact hxy (hSub.elim x y)
  obtain ⟨p, hp, hDiv⟩ := Nat.exists_prime_and_dvd hCard
  have : Fact p.Prime := ⟨hp⟩
  let P : Sylow p N := default
  have hChar : (P : Subgroup N).Characteristic :=
    Sylow.characteristic_of_normal P (P : Subgroup N).normal_of_isMulCommutative
  let S := (P : Subgroup N).map N.subtype
  have hNormal : S.Normal :=
    { conj_mem := by
        intro a ha g
        obtain ⟨b, hb, rfl⟩ := Subgroup.mem_map.mp ha
        let conj : MulAut N := MulAut.conjNormal g
        have hb' : conj b ∈ (P : Subgroup N) :=
          Subgroup.characteristic_iff_le_comap.mp hChar conj hb
        exact ⟨conj b, hb', rfl⟩ }
  have hLe : S ≤ N := by
    intro x hx
    obtain ⟨a, _, rfl⟩ := Subgroup.mem_map.mp hx
    exact a.property
  have hS : S ≠ ⊥ := fun he => P.ne_bot_of_dvd_card hDiv
    ((Subgroup.map_eq_bot_iff_of_injective (P : Subgroup N) N.subtype_injective).mp he)
  have hEq := hMin.eq_of_le S hNormal hLe hS
  have hTop : (P : Subgroup N) = ⊤ := by
    apply Subgroup.map_injective N.subtype_injective
    rw [Subgroup.map_top, N.range_subtype]
    exact hEq
  obtain ⟨k, hk⟩ := IsPGroup.iff_card.mp P.isPGroup'
  change Nat.card (P : Subgroup N) = p ^ k at hk
  rw [hTop, Subgroup.card_top] at hk
  refine ⟨p, hp, ?_⟩
  intro q hq
  have hqDvd : q ∣ p ^ k := hk ▸ hq.2
  exact Set.mem_singleton_iff.mpr ((Nat.prime_dvd_prime_iff_eq hq.1 hp).mp
    (hq.1.dvd_of_dvd_pow hqDvd))

/-- The abelian minimal normal case needs no external group-generation
    input. The original quotient pair lifts to a generating pair. -/
theorem exists_lift_across_abelian_minimal_normal [Finite G]
    (N : Subgroup G) [N.Normal] [IsMulCommutative N] (hMin : IsMinimalNormalSubgroup N)
    (hSpectrum : PrimeSpectrumMinimal G) (x g : G)
    (hQuotient : let f := QuotientGroup.mk' N
      Subgroup.closure {f x, f g * f x * (f g)⁻¹} = ⊤) :
    ∃ x' g' : G, Subgroup.closure {x', g' * x' * (g')⁻¹} = ⊤ := by
  obtain ⟨p, hp, hPrimes⟩ := exists_prime_spectrum_of_abelian_minimal_normal N hMin
  let f := QuotientGroup.mk' N
  have hKer : f.ker = N := QuotientGroup.ker_mk' N
  have : Nontrivial f.ker := by rw [hKer]; exact N.nontrivial_iff_ne_bot.mpr hMin.neBot
  have : IsMulCommutative f.ker := by rw [hKer]; infer_instance
  have hPrimes' : primeSpectrum f.ker ⊆ {p} := by rw [hKer]; exact hPrimes
  obtain ⟨x', g', _, _, hGenerate⟩ := exists_lift_across_abelian_prime_kernel f
    (QuotientGroup.mk'_surjective N) hSpectrum hp hPrimes' x g hQuotient
  exact ⟨x', g', hGenerate⟩

end Shumyatsky
