module

public import Conjectures.ShumyatskyPrimeSpectrum
public import Mathlib.Data.ZMod.Units
public import Mathlib.GroupTheory.SpecificGroups.Cyclic
public import Mathlib.Tactic.Group

/-! Normalize a conjugate generating pair in a cyclic quotient.
This is the prescribed-residue step in the written singleton-factor
argument. The existence of the initial conjugate pair is a hypothesis. -/

@[expose] public section

namespace Shumyatsky

theorem exists_coprime_exponent_with_residue {m n k : ℕ} (hm : m ≠ 0)
    (hDvd : n ∣ m) (hk : k.Coprime n) :
    ∃ e : ℕ, e.Coprime m ∧ e ≡ k [MOD n] := by
  have : NeZero m := ⟨hm⟩
  obtain ⟨u, hu⟩ := ZMod.unitsMap_surjective hDvd (ZMod.unitOfCoprime k hk)
  refine ⟨(u : ZMod m).val, ZMod.val_coe_unit_coprime u, ?_⟩
  apply (ZMod.natCast_eq_natCast_iff _ _ n).1
  have h := congrArg Units.val hu
  rw [ZMod.unitsMap_val, ZMod.cast_eq_val] at h
  exact h

variable {G Q : Type*} [Group G] [CommGroup Q]

/-- Given a conjugate generating pair and a cyclic quotient, its first
    image can be any generator and the conjugator image can be any
    element of that quotient. -/
theorem exists_conjugate_pair_prescribing_cyclic_quotient [Finite G]
    (φ : G →* Q) (hSurj : Function.Surjective φ)
    (x g : G) (hGenerate : Subgroup.closure {x, g * x * g⁻¹} = ⊤)
    (c d : Q) (hc : Subgroup.zpowers c = ⊤) :
    ∃ a b : G, φ a = c ∧ φ b = d ∧ Subgroup.closure {a, b * a * b⁻¹} = ⊤ := by
  have : Finite Q := Finite.of_surjective φ hSurj
  let y := g * x * g⁻¹
  have hy : φ y = φ x := by
    change φ (g * x * g⁻¹) = φ x
    rw [map_mul, map_mul, map_inv]
    exact mul_inv_eq_iff_eq_mul.mpr (mul_comm _ _)
  have hQ : Subgroup.zpowers (φ x) = ⊤ := by
    have h := congrArg (fun H : Subgroup G => H.map φ) hGenerate
    rw [MonoidHom.map_closure, Set.image_insert_eq, Set.image_singleton, Subgroup.map_top,
      MonoidHom.range_eq_top.mpr hSurj] at h
    change Subgroup.closure {φ x, φ y} = ⊤ at h
    rw [hy, Set.pair_eq_singleton, ← Subgroup.zpowers_eq_closure] at h
    exact h
  have hCmem : c ∈ Subgroup.zpowers (φ x) := hQ.symm ▸ Subgroup.mem_top c
  obtain ⟨k, hk⟩ := mem_powers_iff_mem_zpowers.mpr hCmem
  change (φ x) ^ k = c at hk
  have hxMem : φ x ∈ Subgroup.zpowers ((φ x) ^ k) := by
    rw [hk, hc]
    exact Subgroup.mem_top _
  have hRelPrime : k.Coprime (orderOf (φ x)) := mem_zpowers_pow_iff.1 hxMem
  obtain ⟨e, hCoprime, hEMod⟩ := exists_coprime_exponent_with_residue
    (Nat.ne_of_gt (orderOf_pos x)) (orderOf_map_dvd φ x) hRelPrime
  let a := x ^ e
  have hA : φ a = c := by
    change φ (x ^ e) = c
    rw [map_pow, ← hk]
    exact pow_eq_pow_iff_modEq.mpr hEMod
  have hYOrder : orderOf y = orderOf x := orderOf_injective
    (MulAut.conj g : G →* G) (MulAut.conj g).injective x
  let H := Subgroup.closure ({a, y ^ e} : Set G)
  have haMem : a ∈ H := Subgroup.subset_closure (by simp)
  have hyMem : y ^ e ∈ H := Subgroup.subset_closure (by simp)
  have hx : x ∈ H := (Subgroup.zpowers_le.mpr haMem)
    (mem_zpowers_pow_iff.mpr hCoprime)
  have hyIn : y ∈ H := (Subgroup.zpowers_le.mpr hyMem)
    (mem_zpowers_pow_iff.mpr (hYOrder.symm ▸ hCoprime))
  have hTop : H = ⊤ := by
    apply top_unique
    rw [← hGenerate]
    apply (Subgroup.closure_le H).mpr
    intro u hu
    rcases Set.mem_insert_iff.mp hu with rfl | hu
    · exact hx
    · obtain rfl := Set.mem_singleton_iff.mp hu
      exact hyIn
  have hd : (φ g)⁻¹ * d ∈ Subgroup.zpowers c := hc.symm ▸ Subgroup.mem_top _
  obtain ⟨j, hj⟩ := mem_powers_iff_mem_zpowers.mpr hd
  change c ^ j = (φ g)⁻¹ * d at hj
  let b := g * a ^ j
  have hB : φ b = d := by simp [b, hA, hj]
  have hConj : b * a * b⁻¹ = y ^ e := by
    calc
      b * a * b⁻¹ = g * ((a ^ j) * a * (a ^ j)⁻¹) * g⁻¹ := by unfold b; group
      _ = g * a * g⁻¹ := by
        have he : (a ^ j) * a = a * (a ^ j) := (Commute.refl a).pow_left j
        rw [he, mul_assoc a (a ^ j), mul_inv_cancel, mul_one]
      _ = y ^ e := (MulAut.conj g).toMonoidHom.map_pow x e
  refine ⟨a, b, hA, hB, ?_⟩
  rw [hConj]
  exact hTop

end Shumyatsky
