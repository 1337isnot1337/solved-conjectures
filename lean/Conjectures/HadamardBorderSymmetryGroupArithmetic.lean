import Conjectures.HadamardBorderSymmetryProjection

/-!
# The finite-group arithmetic after the symmetry obstructions

An injection into the actual units of `ZMod 149` puts the group order among
the divisors of 148. Cauchy's theorem then removes the factor 37 when no
element has order 37. The geometric symmetry argument supplies both input
hypotheses in the final assembly.
-/

namespace HadamardBorderSymmetry

local instance symmetryGroupArithmetic37Prime : Fact (Nat.Prime 37) := ⟨by norm_num⟩

theorem card_dvd_four_of_injective_units149 {G : Type*} [Group G]
    (f : G →* (ZMod 149)ˣ) (hf : Function.Injective f)
    (hno37 : ∀ g : G, orderOf g ≠ 37) : Nat.card G ∣ 4 := by
  let : Finite G := Finite.of_injective f hf
  have hdvd : Nat.card G ∣ 148 := by
    simpa only [units149_card] using Subgroup.card_dvd_of_injective f hf
  have hnot : ¬37 ∣ Nat.card G := by
    intro h
    obtain ⟨g, hg⟩ := exists_prime_orderOf_dvd_card' (G := G) 37 h
    exact hno37 g hg
  have hcop : Nat.Coprime (Nat.card G) 37 :=
    ((show Nat.Prime 37 by norm_num).coprime_iff_not_dvd.mpr hnot).symm
  exact hcop.dvd_mul_right.mp (show Nat.card G ∣ 4 * 37 from hdvd)

theorem card_le_four_of_injective_units149 {G : Type*} [Group G]
    (f : G →* (ZMod 149)ˣ) (hf : Function.Injective f)
    (hno37 : ∀ g : G, orderOf g ≠ 37) : Nat.card G ≤ 4 :=
  Nat.le_of_dvd (by decide) (card_dvd_four_of_injective_units149 f hf hno37)

theorem isCyclic_of_injective_units149 {G : Type*} [Group G]
    (f : G →* (ZMod 149)ˣ) (hf : Function.Injective f) : IsCyclic G := by
  let : IsCyclic (ZMod 149)ˣ := units149_isCyclic
  exact isCyclic_of_injective f hf

theorem subgroup_card_dvd_four_of_injective_multiplier149
    {Q : Type*} [AddGroup Q] (hQ : Nat.card Q = 4)
    (U : Subgroup (Multiplicative (AddAut (Q × ZMod 149))))
    (hinj : Function.Injective ((multiplierProjection149 hQ).comp U.subtype))
    (hno37 : ∀ u : U, orderOf (u : Multiplicative (AddAut (Q × ZMod 149))) ≠ 37) :
    Nat.card U ∣ 4 := by
  apply card_dvd_four_of_injective_units149
    ((multiplierProjection149 hQ).comp U.subtype) hinj
  intro u
  simpa only [Subgroup.orderOf_coe] using hno37 u

end HadamardBorderSymmetry
