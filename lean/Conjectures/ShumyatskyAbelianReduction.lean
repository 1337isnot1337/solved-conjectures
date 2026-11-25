module

public import Conjectures.ShumyatskyAbelianMinimalNormal

/-! Reduce the exact finite-group conjecture to prime-spectrum-minimal
groups with no abelian minimal normal subgroup. The proof uses the
actual quotient order and the verified abelian lift. -/

@[expose] public section

namespace Shumyatsky

universe u

/-- Generation by an element and one of its conjugates. -/
def HasConjugateGenerators (G : Type*) [Group G] : Prop :=
  ∃ x g : G, Subgroup.closure {x, g * x * g⁻¹} = ⊤

/-- The abelian minimal-normal case reduces to a strictly smaller
    quotient, so it suffices to treat the groups with no such subgroups. -/
theorem minimal_generation_of_nonabelian_minimal_normal_case
    (hCase : ∀ (G : Type u) [Group G] [Finite G], PrimeSpectrumMinimal G →
      (∀ N : Subgroup G, IsMinimalNormalSubgroup N → ¬IsMulCommutative N) →
        HasConjugateGenerators G) :
    ∀ (G : Type u) [Group G] [Finite G], PrimeSpectrumMinimal G →
      HasConjugateGenerators G := by
  let P (n : ℕ) := ∀ (G : Type u) [Group G] [Finite G], Nat.card G = n →
    PrimeSpectrumMinimal G → HasConjugateGenerators G
  have hAll (n : ℕ) : P n := by
    induction n using Nat.strong_induction_on with
    | h n ih =>
      intro G _ _ hCard hMinimal
      by_cases hAbelian : ∃ N : Subgroup G, IsMinimalNormalSubgroup N ∧ IsMulCommutative N
      · obtain ⟨N, hN, hAb⟩ := hAbelian
        have : N.Normal := hN.normal
        have : IsMulCommutative N := hAb
        have : Nontrivial N := N.nontrivial_iff_ne_bot.mpr hN.neBot
        have hOne : Nat.card N ≠ 1 := by
          intro he
          have hSub := (Nat.card_eq_one_iff_unique.mp he).1
          obtain ⟨a, b, hab⟩ := exists_pair_ne N
          exact hab (hSub.elim a b)
        have hCardN : 1 < Nat.card N := by
          have hPos : 0 < Nat.card N := Nat.card_pos
          omega
        have hSmall : Nat.card (G ⧸ N) < n := by
          calc
            Nat.card (G ⧸ N) = Nat.card (G ⧸ N) * 1 := by rw [mul_one]
            _ < Nat.card (G ⧸ N) * Nat.card N := Nat.mul_lt_mul_of_pos_left hCardN Nat.card_pos
            _ = Nat.card G := (Subgroup.card_eq_card_quotient_mul_card_subgroup N).symm
            _ = n := hCard
        let f := QuotientGroup.mk' N
        have hSurj : Function.Surjective f := QuotientGroup.mk'_surjective N
        obtain ⟨q, r, hQ⟩ := ih (Nat.card (G ⧸ N)) hSmall (G ⧸ N) rfl
          (hMinimal.of_surjective f hSurj)
        obtain ⟨x, hx⟩ := hSurj q
        obtain ⟨g, hg⟩ := hSurj r
        apply exists_lift_across_abelian_minimal_normal N hN hMinimal x g
        change Subgroup.closure {f x, f g * f x * (f g)⁻¹} = ⊤
        rwa [hx, hg]
      · exact hCase G hMinimal (fun N hN hAb => hAbelian ⟨N, hN, hAb⟩)
  intro G _ _ hMinimal
  exact hAll (Nat.card G) G rfl hMinimal

/-- The exact prime-spectrum statement follows from the remaining
    nonabelian minimal-normal case. -/
theorem conjecture_of_nonabelian_minimal_normal_case
    (hCase : ∀ (G : Type u) [Group G] [Finite G], PrimeSpectrumMinimal G →
      (∀ N : Subgroup G, IsMinimalNormalSubgroup N → ¬IsMulCommutative N) →
        HasConjugateGenerators G)
    (G : Type u) [Group G] [Finite G] :
    ∃ a b : G, IsConj a b ∧ primeSpectrum (Subgroup.closure {a, b}) = primeSpectrum G := by
  apply conjecture_of_minimal _ G
  intro H _ _ hMin
  obtain ⟨a, g, ha⟩ := minimal_generation_of_nonabelian_minimal_normal_case hCase H hMin
  exact ⟨a, g * a * g⁻¹, isConj_iff.mpr ⟨g, rfl⟩, ha⟩

end Shumyatsky
