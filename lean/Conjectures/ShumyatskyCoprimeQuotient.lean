module

public import Conjectures.ShumyatskyAbelianMinimalNormal
public import Conjectures.ShumyatskySocleStructure
public import Mathlib.GroupTheory.SchurZassenhaus
public import Mathlib.GroupTheory.Solvable
public import Mathlib.GroupTheory.SpecificGroups.Cyclic.Basic

/-! Construct a subgroup with the prescribed prime spectrum in a
solvable quotient. For a prime-spectrum-minimal group this forces
the quotient to have coprime order, and Schur–Zassenhaus lifts it
to a subgroup. -/

@[expose] public section

namespace Shumyatsky

universe u

private theorem exists_abelian_minimal_normal (G : Type*) [Group G] [Finite G]
    [Nontrivial G] [Group.IsSolvable G] :
    ∃ N : Subgroup G, IsMinimalNormalSubgroup N ∧ IsMulCommutative N := by
  classical
  have hDerived (n : ℕ) : derivedSeries G n = ⊥ →
      ∃ N : Subgroup G, IsMinimalNormalSubgroup N ∧ IsMulCommutative N := by
    induction n with
    | zero => simp [derivedSeries_zero]
    | succ n ih =>
      intro hNext
      by_cases hN : derivedSeries G n = ⊥
      · exact ih hN
      have : (derivedSeries G n).Normal := derivedSeries_normal G n
      have : IsMulCommutative (derivedSeries G n) :=
        Subgroup.commutator_self_eq_bot_iff.mp (derivedSeries_succ G n ▸ hNext)
      obtain ⟨N, hLe, hMin⟩ := exists_minimal_normal_below (derivedSeries G n) hN
      refine ⟨N, hMin, IsMulCommutative.of_comm ?_⟩
      intro a b
      let f := Subgroup.inclusion hLe
      apply Subgroup.inclusion_injective hLe
      change f (a * b) = f (b * a)
      rw [map_mul, map_mul, mul_comm' (f a) (f b)]
  obtain ⟨n, hn⟩ := Group.IsSolvable.solvable (G := G)
  exact hDerived n hn

private theorem spectrum_comap_eq_union {G Q : Type*} [Group G] [Group Q]
    (q : G →* Q) (hSurj : Function.Surjective q) (U : Subgroup Q) :
    let r : U.comap q →* U := (q.comp (U.comap q).subtype).codRestrict U fun x => x.property
    Function.Surjective r ∧
      Nat.card r.ker = Nat.card q.ker ∧
      primeSpectrum (U.comap q) = primeSpectrum U ∪ primeSpectrum q.ker := by
  let H := U.comap q
  let r : H →* U := (q.comp H.subtype).codRestrict U fun x => x.property
  have hR : Function.Surjective r := by
    intro u
    obtain ⟨x, hx⟩ := hSurj (u : Q)
    exact ⟨⟨x, show q x ∈ U from hx.symm ▸ u.property⟩, Subtype.ext hx⟩
  have hKer : r.ker = q.ker.subgroupOf H := by
    ext x
    change r x = 1 ↔ q (x : G) = 1
    exact ⟨fun h => congrArg Subtype.val h, fun h => Subtype.ext h⟩
  have hLe : q.ker ≤ H := by
    intro x hx
    change q x ∈ U
    rw [MonoidHom.mem_ker.mp hx]
    exact U.one_mem
  have hCard : Nat.card r.ker = Nat.card q.ker := by
    rw [hKer]
    exact Nat.card_congr (Subgroup.subgroupOfEquivOfLe hLe).toEquiv
  exact ⟨hR, hCard, by
    rw [primeSpectrum_ker_union r hR]
    unfold primeSpectrum
    rw [hCard]⟩

/-- The prime-spectrum part of Hall's theorem for a finite solvable group.
    The subgroup realizes every selected prime dividing the group order. -/
theorem exists_subgroup_primeSpectrum_inter (selected : Set ℕ)
    (G : Type u) [Group G] [Finite G] [Group.IsSolvable G] :
    ∃ U : Subgroup G, primeSpectrum U = primeSpectrum G ∩ selected := by
  classical
  let P (n : ℕ) := ∀ (A : Type u) [Group A] [Finite A] [Group.IsSolvable A],
    Nat.card A = n → ∃ U : Subgroup A, primeSpectrum U = primeSpectrum A ∩ selected
  have hAll (n : ℕ) : P n := by
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro A _ _ _ hCard
      rcases subsingleton_or_nontrivial A with hTriv | hNontriv
      · have : Subsingleton A := hTriv
        have hOne : Nat.card A = 1 := Nat.card_eq_one_iff_unique.mpr ⟨hTriv, ⟨1⟩⟩
        refine ⟨⊤, ?_⟩
        ext k
        change (k.Prime ∧ k ∣ Nat.card (⊤ : Subgroup A)) ↔
          (k.Prime ∧ k ∣ Nat.card A) ∧ k ∈ selected
        rw [Subgroup.card_top, hOne]
        by_cases h : k.Prime
        · simp [h, h.not_dvd_one]
        · simp [h]
      have : Nontrivial A := hNontriv
      obtain ⟨N, hN, hAbel⟩ := exists_abelian_minimal_normal A
      have : N.Normal := hN.normal
      have : IsMulCommutative N := hAbel
      obtain ⟨p, hp, hPrime⟩ := exists_prime_spectrum_of_abelian_minimal_normal N hN
      let q := QuotientGroup.mk' N
      have hSurj : Function.Surjective q := QuotientGroup.mk'_surjective N
      have : Group.IsSolvable (A ⧸ N) := Group.isSolvable_of_surjective hSurj
      have hSmall : Nat.card (A ⧸ N) < n := by
        calc
          Nat.card (A ⧸ N) = Nat.card (A ⧸ N) * 1 := (mul_one _).symm
          _ < Nat.card (A ⧸ N) * Nat.card N := Nat.mul_lt_mul_of_pos_left
            ((N.one_lt_card_iff_ne_bot).mpr hN.neBot) Nat.card_pos
          _ = Nat.card A := (Subgroup.card_eq_card_quotient_mul_card_subgroup N).symm
          _ = n := hCard
      obtain ⟨U, hU⟩ := ih (Nat.card (A ⧸ N)) hSmall (A ⧸ N) rfl
      let H := U.comap q
      let r : H →* U := (q.comp H.subtype).codRestrict U fun x => x.property
      obtain ⟨hR, hRCard, hH⟩ := spectrum_comap_eq_union q hSurj U
      change Function.Surjective r at hR
      rw [QuotientGroup.ker_mk'] at hRCard hH
      have hA : primeSpectrum A = primeSpectrum (A ⧸ N) ∪ primeSpectrum N := by
        rw [primeSpectrum_ker_union q hSurj, QuotientGroup.ker_mk']
      by_cases hpselected : p ∈ selected
      · refine ⟨H, ?_⟩
        change primeSpectrum H = _ at hH
        rw [hH, hU, hA]
        ext k
        change (k ∈ primeSpectrum (A ⧸ N) ∧ k ∈ selected) ∨ k ∈ primeSpectrum N ↔
          (k ∈ primeSpectrum (A ⧸ N) ∨ k ∈ primeSpectrum N) ∧ k ∈ selected
        have hMem (hk : k ∈ primeSpectrum N) : k ∈ selected := (hPrime hk) ▸ hpselected
        tauto
      have hCoprime : Nat.Coprime (Nat.card r.ker) (Nat.card (H ⧸ r.ker)) := by
        rw [hRCard, Nat.card_congr (QuotientGroup.quotientKerEquivOfSurjective r hR).toEquiv]
        apply Nat.coprime_of_dvd
        intro k hk hkN hkU
        have hkPrime : k ∈ primeSpectrum N := ⟨hk, hkN⟩
        have hkSpec : k ∈ primeSpectrum U := ⟨hk, hkU⟩
        rw [hU] at hkSpec
        exact hpselected ((hPrime hkPrime) ▸ hkSpec.2)
      obtain ⟨C, hC⟩ := Subgroup.exists_left_complement'_of_coprime hCoprime
      let e := (QuotientGroup.quotientKerEquivOfSurjective r hR).symm.trans hC.QuotientMulEquiv
      refine ⟨C.map H.subtype, ?_⟩
      have hCSpec : primeSpectrum (C.map H.subtype) = primeSpectrum U := by
        unfold primeSpectrum
        rw [← Nat.card_congr (C.equivMapOfInjective H.subtype H.subtype_injective).toEquiv,
          ← Nat.card_congr e.toEquiv]
      rw [hCSpec, hU, hA]
      ext k
      change k ∈ primeSpectrum (A ⧸ N) ∧ k ∈ selected ↔
        (k ∈ primeSpectrum (A ⧸ N) ∨ k ∈ primeSpectrum N) ∧ k ∈ selected
      have hNot (hk : k ∈ primeSpectrum N) (hkselected : k ∈ selected) : False :=
        hpselected ((hPrime hk) ▸ hkselected)
      tauto
  exact hAll (Nat.card G) G rfl

variable {G : Type*} [Group G]

/-- In a prime-spectrum-minimal group, a subgroup of the quotient
    covering every quotient prime outside the kernel must be the whole quotient. -/
theorem hall_quotient_eq_top (N : Subgroup G) [N.Normal] (hMinimal : PrimeSpectrumMinimal G)
    (U : Subgroup (G ⧸ N)) (hCovers : primeSpectrum (G ⧸ N) \ primeSpectrum N ⊆ primeSpectrum U) :
    U = ⊤ := by
  let q := QuotientGroup.mk' N
  have hSurj : Function.Surjective q := QuotientGroup.mk'_surjective N
  let H := U.comap q
  obtain ⟨_, _, hSpectrum⟩ := spectrum_comap_eq_union q hSurj U
  change primeSpectrum H = _ at hSpectrum
  rw [QuotientGroup.ker_mk'] at hSpectrum
  have hTop : H = ⊤ := by
    apply hMinimal H
    refine Set.Subset.antisymm (primeSpectrum_mono_of_injective H.subtype Subtype.val_injective) ?_
    rw [hSpectrum, primeSpectrum_ker_union q hSurj, QuotientGroup.ker_mk']
    rintro p (hp | hp)
    · by_cases hpN : p ∈ primeSpectrum N
      · exact Or.inr hpN
      · exact Or.inl (hCovers ⟨hp, hpN⟩)
    · exact Or.inr hp
  rw [← Subgroup.map_comap_eq_self_of_surjective hSurj U, show U.comap q = H from rfl,
    hTop, Subgroup.map_top, MonoidHom.range_eq_top.mpr hSurj]

/-- The Hall-subgroup input and minimality force the quotient order
    to be coprime to the normal subgroup order. -/
theorem coprime_card_quotient_of_hall (N : Subgroup G) [N.Normal]
    (hMinimal : PrimeSpectrumMinimal G) (U : Subgroup (G ⧸ N))
    (hHall : primeSpectrum U = primeSpectrum (G ⧸ N) \ primeSpectrum N) :
    Nat.Coprime (Nat.card N) (Nat.card (G ⧸ N)) := by
  have hTop := hall_quotient_eq_top N hMinimal U hHall.ge
  rw [hTop, show primeSpectrum (⊤ : Subgroup (G ⧸ N)) = primeSpectrum (G ⧸ N) by
    unfold primeSpectrum
    rw [Nat.card_congr Subgroup.topEquiv.toEquiv]] at hHall
  apply Nat.coprime_of_dvd
  intro p hp hpN hpQ
  have hIn : p ∈ primeSpectrum (G ⧸ N) := ⟨hp, hpQ⟩
  have hOutside : p ∈ primeSpectrum (G ⧸ N) \ primeSpectrum N := hHall ▸ hIn
  exact hOutside.2 ⟨hp, hpN⟩

/-- Schur–Zassenhaus realizes the coprime quotient by a subgroup, so
    cyclicity of the coprime subgroups implies cyclicity of the quotient. -/
theorem isCyclic_quotient_of_hall_and_coprime_subgroups
    (N : Subgroup G) [N.Normal] (hMinimal : PrimeSpectrumMinimal G)
    (U : Subgroup (G ⧸ N))
    (hHall : primeSpectrum U = primeSpectrum (G ⧸ N) \ primeSpectrum N)
    (hCyclic : ∀ H : Subgroup G, Nat.Coprime (Nat.card N) (Nat.card H) → IsCyclic H) :
    IsCyclic (G ⧸ N) := by
  have hCoprime := coprime_card_quotient_of_hall N hMinimal U hHall
  obtain ⟨H, hComplement⟩ := Subgroup.exists_left_complement'_of_coprime hCoprime
  let e := hComplement.QuotientMulEquiv
  apply e.isCyclic.mpr
  exact hCyclic H ((Nat.card_congr e.toEquiv) ▸ hCoprime)

/-- In the one-factor reduction, a solvable outer quotient is cyclic
    if every subgroup of order coprime to the factor is cyclic. -/
theorem isCyclic_quotient_of_solvable_and_coprime_subgroups {G : Type u} [Group G] [Finite G]
    (N : Subgroup G) [N.Normal] [Group.IsSolvable (G ⧸ N)]
    (hMinimal : PrimeSpectrumMinimal G)
    (hCyclic : ∀ H : Subgroup G, Nat.Coprime (Nat.card N) (Nat.card H) → IsCyclic H) :
    IsCyclic (G ⧸ N) := by
  obtain ⟨U, hU⟩ := exists_subgroup_primeSpectrum_inter (primeSpectrum N)ᶜ (G ⧸ N)
  exact isCyclic_quotient_of_hall_and_coprime_subgroups N hMinimal U hU hCyclic

end Shumyatsky
