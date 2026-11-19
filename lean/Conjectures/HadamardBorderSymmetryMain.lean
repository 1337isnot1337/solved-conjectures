import Conjectures.HadamardBorderSymmetryKernel
import Conjectures.HadamardBorderSymmetryGroupArithmetic

/-!
# The full common multiplier group of an actual border core

The group contains exactly the additive automorphisms that preserve all four
given sign rows. The autocorrelation equations force its order to divide four.
The actual evaluation action then has at least 151 orbits. Neither an orbit
decomposition nor a bound on the symmetry group is a hypothesis.
-/

noncomputable section

namespace HadamardBorderSymmetry

variable {Q : Type*} [AddCommGroup Q]

/-- All fixed-origin additive automorphisms preserving the four actual rows. -/
def commonMultiplierGroup149 (F : BorderRows Q) :
    Subgroup (Multiplicative (AddAut (Q × ZMod 149))) where
  carrier g := ∀ i (x : Q × ZMod 149),
    F i (g • x).1 (g • x).2 = F i x.1 x.2
  one_mem' := by
    intro i x
    simp only [one_smul]
  mul_mem' {g h} hg hh := by
    intro i x
    simpa only [mul_smul] using (hg i (h • x)).trans (hh i x)
  inv_mem' {g} hg := by
    intro i x
    simpa only [smul_inv_smul] using (hg i (g⁻¹ • x)).symm

@[simp] theorem mem_commonMultiplierGroup149 (F : BorderRows Q)
    (g : Multiplicative (AddAut (Q × ZMod 149))) :
    g ∈ commonMultiplierGroup149 F ↔ ∀ i (x : Q × ZMod 149),
      F i (g • x).1 (g • x).2 = F i x.1 x.2 := Iff.rfl

theorem common_multiplier_preserves_rows149 (F : BorderRows Q)
    (g : commonMultiplierGroup149 F) (i : Fin 4) (x : Q × ZMod 149) :
    F i (g • x).1 (g • x).2 = F i x.1 x.2 := g.property i x

variable [Fintype Q] [DecidableEq Q]

/-- A common symmetry with trivial cyclic-factor multiplier is the identity. -/
theorem symmetry_subgroup_multiplier_injective149 (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F)
    (U : Subgroup (Multiplicative (AddAut (Q × ZMod 149))))
    (hU : U ≤ commonMultiplierGroup149 F) :
    Function.Injective
      ((multiplierProjection149 (by simpa only [Nat.card_eq_fintype_card] using hQ)).comp
        U.subtype) := by
  let hQN : Nat.card Q = 4 := by
    simpa only [Nat.card_eq_fintype_card] using hQ
  apply (injective_iff_map_eq_one _).mpr
  intro u hu
  have hmult : multiplierProjection149 hQN (u : Multiplicative (AddAut (Q × ZMod 149))) = 1 := hu
  have hquot : quotientProjection149 hQN (u : Multiplicative (AddAut (Q × ZMod 149))) = 1 := by
    apply Multiplicative.toAdd.injective
    change (quotientProjection149 hQN (u : Multiplicative (AddAut (Q × ZMod 149)))).toAdd = 0
    by_contra hne
    apply quotient_automorphism_symmetry_impossible F hQ hF _ hne
    intro i q z
    have hv := hU u.property i (q, z)
    change F i ((u : Multiplicative (AddAut (Q × ZMod 149))).toAdd (q, z)).1
      ((u : Multiplicative (AddAut (Q × ZMod 149))).toAdd (q, z)).2 = F i q z at hv
    simpa only [automorphism_product_apply149 hQN, hmult, Units.val_one, one_mul] using hv
  have he : (u : Multiplicative (AddAut (Q × ZMod 149))) = 1 :=
    projections149_jointly_injective hQN _ 1
      (by simpa only [map_one] using hquot) (by simpa only [map_one] using hmult)
  exact Subtype.ext he

/-- No element of any common symmetry subgroup has order 37. -/
theorem symmetry_subgroup_no_order37_149 (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F)
    (U : Subgroup (Multiplicative (AddAut (Q × ZMod 149))))
    (hU : U ≤ commonMultiplierGroup149 F) (u : U) :
    orderOf (u : Multiplicative (AddAut (Q × ZMod 149))) ≠ 37 := by
  let hQN : Nat.card Q = 4 := by
    simpa only [Nat.card_eq_fintype_card] using hQ
  intro hu
  apply order37_fiber_symmetry_impossible F hQ hF
    (multiplierProjection149 hQN (u : Multiplicative (AddAut (Q × ZMod 149))))
    (order37_multiplierProjection149 hQN _ hu)
  intro i q z
  have hv := hU u.property i (q, z)
  change F i ((u : Multiplicative (AddAut (Q × ZMod 149))).toAdd (q, z)).1
    ((u : Multiplicative (AddAut (Q × ZMod 149))).toAdd (q, z)).2 = F i q z at hv
  simpa only [order37_automorphism_apply149 hQN _ hu] using hv

/-- The order bound for every subgroup preserving the given four rows. -/
theorem symmetry_subgroup_card_dvd_four149 (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F)
    (U : Subgroup (Multiplicative (AddAut (Q × ZMod 149))))
    (hU : U ≤ commonMultiplierGroup149 F) : Nat.card U ∣ 4 := by
  apply subgroup_card_dvd_four_of_injective_multiplier149
    (by simpa only [Nat.card_eq_fintype_card] using hQ) U
    (symmetry_subgroup_multiplier_injective149 F hQ hF U hU)
  exact symmetry_subgroup_no_order37_149 F hQ hF U hU

theorem symmetry_subgroup_isCyclic149 (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F)
    (U : Subgroup (Multiplicative (AddAut (Q × ZMod 149))))
    (hU : U ≤ commonMultiplierGroup149 F) : IsCyclic U :=
  isCyclic_of_injective_units149
    ((multiplierProjection149 (by simpa only [Nat.card_eq_fintype_card] using hQ)).comp
      U.subtype) (symmetry_subgroup_multiplier_injective149 F hQ hF U hU)

theorem symmetry_subgroup_orbit_count_ge_151 (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F)
    (U : Subgroup (Multiplicative (AddAut (Q × ZMod 149))))
    (hU : U ≤ commonMultiplierGroup149 F) :
    151 ≤ Nat.card (MulAction.orbitRel.Quotient U (Q × ZMod 149)) :=
  automorphism_orbit_count_ge_151
    (by simpa only [Nat.card_eq_fintype_card] using hQ) U
    (symmetry_subgroup_card_dvd_four149 F hQ hF U hU)

/-- The full common multiplier group has order dividing four. -/
theorem common_multiplier_card_dvd_four (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F) :
    Nat.card (commonMultiplierGroup149 F) ∣ 4 :=
  symmetry_subgroup_card_dvd_four149 F hQ hF (commonMultiplierGroup149 F) le_rfl

theorem common_multiplier_card_le_four (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F) :
    Nat.card (commonMultiplierGroup149 F) ≤ 4 :=
  Nat.le_of_dvd (by decide) (common_multiplier_card_dvd_four F hQ hF)

theorem common_multiplier_isCyclic (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F) :
    IsCyclic (commonMultiplierGroup149 F) :=
  symmetry_subgroup_isCyclic149 F hQ hF (commonMultiplierGroup149 F) le_rfl

/-- Each generator has at least 151 actual sign orbits under all common multipliers. -/
theorem common_multiplier_orbit_count_ge_151 (F : BorderRows Q)
    (hQ : Fintype.card Q = 4) (hF : IsBorderCore149 F) :
    151 ≤ Nat.card
      (MulAction.orbitRel.Quotient (commonMultiplierGroup149 F) (Q × ZMod 149)) :=
  symmetry_subgroup_orbit_count_ge_151 F hQ hF (commonMultiplierGroup149 F) le_rfl

end HadamardBorderSymmetry
