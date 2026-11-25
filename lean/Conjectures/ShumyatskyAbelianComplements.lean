module

public import Mathlib.Algebra.Group.IsCommutative
public import Mathlib.GroupTheory.GroupAction.ConjAct
public import Mathlib.GroupTheory.OrderOfElement
public import Mathlib.Algebra.BigOperators.Group.Finset.Basic
public import Mathlib.Tactic.Group

/-! Conjugate complements of an abelian kernel by taking the product
of a cocycle over a finite complement of coprime order. -/

@[expose] public section

open scoped BigOperators

namespace Shumyatsky

variable {G Q H A : Type*} [Group G] [Group Q] [Group H] [CommGroup A]

private theorem power_injective_of_coprime_card (m : ℕ) (h : m.Coprime (Nat.card A)) :
    Function.Injective (fun a : A => a ^ m) := by
  intro u v huv
  change u ^ m = v ^ m at huv
  apply mul_inv_eq_one.mp
  have hPow : (u * v⁻¹) ^ m = 1 := by
    rw [mul_pow, inv_pow, huv, mul_inv_cancel]
  have hOrder : orderOf (u * v⁻¹) ∣ 1 := by
    rw [← h.gcd_eq_one]
    exact Nat.dvd_gcd (orderOf_dvd_of_pow_eq_one hPow) (orderOf_dvd_natCard _)
  exact orderOf_eq_one_iff.mp (Nat.dvd_one.mp hOrder)

/-- For finite coprime orders, an abelian-valued multiplicative
    cocycle is given by conjugation by a single element. -/
theorem exists_principal_cocycle_of_coprime_card [Finite H] [Finite A]
    (ρ : H →* MulAut A) (δ : H → A) (hCoprime : (Nat.card H).Coprime (Nat.card A))
    (hCocycle : ∀ x y, δ (x * y) = δ x * (ρ x) (δ y)) :
    ∃ a : A, ∀ x, δ x = a * ((ρ x) a)⁻¹ := by
  classical
  let _ := Fintype.ofFinite H
  let norm := ∏ x : H, δ x
  have hNorm (x : H) : norm = δ x ^ Nat.card H * (ρ x) norm := by
    calc
      norm = ∏ y : H, δ (x * y) := (Equiv.prod_comp (Equiv.mulLeft x) δ).symm
      _ = ∏ y : H, δ x * (ρ x) (δ y) := Finset.prod_congr rfl (fun y _ => hCocycle x y)
      _ = δ x ^ Nat.card H * (ρ x) norm := by
        rw [Finset.prod_mul_distrib, Finset.prod_const, Finset.card_univ, Fintype.card_eq_nat_card]
        simp only [norm, map_prod]
  have hInj := power_injective_of_coprime_card (A := A) (Nat.card H) hCoprime
  obtain ⟨a, ha⟩ := Finite.surjective_of_injective hInj norm
  change a ^ Nat.card H = norm at ha
  refine ⟨a, fun x => hInj ?_⟩
  change δ x ^ Nat.card H = (a * ((ρ x) a)⁻¹) ^ Nat.card H
  rw [mul_pow, inv_pow, ← map_pow, ha]
  exact (eq_mul_inv_iff_mul_eq).2 (hNorm x).symm

open scoped IsMulCommutative in
/-- Two complements of a finite abelian kernel are conjugate by a
    kernel element when the orders of kernel and quotient are coprime.
    The two restricted quotient maps are the given complement data. -/
theorem exists_kernel_conjugating_complements [Finite G]
    (φ : G →* Q) [IsMulCommutative φ.ker] (J K : Subgroup G)
    (hJ : Function.Bijective (φ.comp J.subtype))
    (hK : Function.Bijective (φ.comp K.subtype))
    (hCoprime : (Nat.card J).Coprime (Nat.card φ.ker)) :
    ∃ a : φ.ker, K = J.map (MulAut.conj (a : G)) := by
  let f := MulEquiv.ofBijective (φ.comp J.subtype) hJ
  let g := MulEquiv.ofBijective (φ.comp K.subtype) hK
  let matchLift := f.trans g.symm
  have hSame (x : J) : φ ((matchLift x : K) : G) = φ (x : G) := g.apply_symm_apply (f x)
  let ρ : J →* MulAut φ.ker := (MulAut.conjNormal (H := φ.ker)).comp J.subtype
  let δ (x : J) : φ.ker :=
    ⟨(matchLift x : G) * (x : G)⁻¹, MonoidHom.mem_ker.mpr (by rw [map_mul, map_inv, hSame, mul_inv_cancel])⟩
  have hCocycle (x y : J) : δ (x * y) = δ x * (ρ x) (δ y) := by
    apply Subtype.ext
    change (matchLift (x * y) : G) * ((x * y : J) : G)⁻¹ =
      ((matchLift x : G) * (x : G)⁻¹) *
        ((x : G) * ((matchLift y : G) * (y : G)⁻¹) * (x : G)⁻¹)
    rw [map_mul]
    change (matchLift x : G) * (matchLift y : G) * ((x : G) * (y : G))⁻¹ = _
    group
  obtain ⟨a, ha⟩ := exists_principal_cocycle_of_coprime_card ρ δ hCoprime hCocycle
  have hConj (x : J) : (matchLift x : G) = (a : G) * (x : G) * (a : G)⁻¹ := by
    have h := congrArg Subtype.val (ha x)
    change (matchLift x : G) * (x : G)⁻¹ =
      (a : G) * ((x : G) * (a : G) * (x : G)⁻¹)⁻¹ at h
    have h' := congrArg (fun z : G => z * (x : G)) h
    convert h' using 1 <;> group
  refine ⟨a, ?_⟩
  ext x
  constructor
  · intro hx
    obtain ⟨y, hy⟩ := matchLift.surjective ⟨x, hx⟩
    refine Subgroup.mem_map.mpr ⟨y, y.property, ?_⟩
    change (a : G) * (y : G) * (a : G)⁻¹ = x
    rw [← hConj y]
    exact congrArg Subtype.val hy
  · intro hx
    obtain ⟨y, hy, hEq⟩ := Subgroup.mem_map.mp hx
    let z : J := ⟨y, hy⟩
    change (a : G) * (z : G) * (a : G)⁻¹ = x at hEq
    rw [← hConj z] at hEq
    exact hEq ▸ (matchLift z).property

end Shumyatsky
