import Conjectures.HadamardLegendreProjection
import Conjectures.HadamardLegendreQuotientModel
import Mathlib.Algebra.Group.Units.Equiv

/-!
# Actual quotient maps used by the order-27 obstruction

The maps retain the order-three quotient of the order-nine factor and
use the Chinese remainder equivalence on the cyclic factor. Their kernel
sizes, iterated-compression identities and equivariance are proved from
these maps, rather than supplied as finite-data assumptions.
-/

noncomputable section

namespace HadamardLegendre

open scoped BigOperators
open HadamardBorderNormalizationTransport

def crt133 : ZMod 133 ≃+* Quotient133 :=
  ZMod.chineseRemainder (by decide : Nat.Coprime 7 19)

def unitsCRT133 : (ZMod 133)ˣ ≃* ((ZMod 7)ˣ × (ZMod 19)ˣ) :=
  (Units.mapEquiv crt133.toMulEquiv).trans MulEquiv.prodUnits

theorem crt133_mul_unit (u : (ZMod 133)ˣ) (z : ZMod 133) :
    crt133 ((u : ZMod 133) * z) =
      (((unitsCRT133 u).1 : ZMod 7) * (crt133 z).1,
        ((unitsCRT133 u).2 : ZMod 19) * (crt133 z).2) := by
  rw [map_mul]
  rfl

def unitScale {n : ℕ} (u : (ZMod n)ˣ) : ZMod n ≃+ ZMod n :=
  { u.mulLeft with map_add' := fun x y => mul_add (u : ZMod n) x y }

def productUnitScale (v : (ZMod 7)ˣ × (ZMod 19)ˣ) :
    Quotient133 ≃+ Quotient133 :=
  (unitScale v.1).prodCongr (unitScale v.2)

def layerUnitScale (v : (ZMod 7)ˣ × (ZMod 19)ˣ) :
    (ZMod 3 × Quotient133) ≃+ (ZMod 3 × Quotient133) :=
  (AddEquiv.refl (ZMod 3)).prodCongr (productUnitScale v)

variable {R : Type*} [AddCommGroup R]

def productMultiplierProjection133 (hR : Nat.card R = 9) :
    Multiplicative (AddAut (R × ZMod 133)) →* ((ZMod 7)ˣ × (ZMod 19)ˣ) :=
  unitsCRT133.toMonoidHom.comp (multiplierProjection133 hR)

def cyclicQuotient133 : R × ZMod 133 →+ Quotient133 :=
  crt133.toAddEquiv.toAddMonoidHom.comp (AddMonoidHom.snd R (ZMod 133))

def layerQuotient133 (ρ : R →+ ZMod 3) : R × ZMod 133 →+ ZMod 3 × Quotient133 :=
  ρ.prodMap crt133.toAddEquiv.toAddMonoidHom

def marginQuotient21 (ρ : R →+ ZMod 3) : R × ZMod 133 →+ ZMod 3 × ZMod 7 :=
  ρ.prodMap ((AddMonoidHom.fst (ZMod 7) (ZMod 19)).comp
    crt133.toAddEquiv.toAddMonoidHom)

def forgetLayer133 : ZMod 3 × Quotient133 →+ Quotient133 :=
  AddMonoidHom.snd (ZMod 3) Quotient133

def forgetNineteen21 : ZMod 3 × Quotient133 →+ ZMod 3 × ZMod 7 :=
  (AddMonoidHom.id (ZMod 3)).prodMap (AddMonoidHom.fst (ZMod 7) (ZMod 19))

theorem cyclicQuotient133_surjective :
    Function.Surjective (cyclicQuotient133 (R := R)) := by
  intro z
  exact ⟨(0, crt133.symm z), crt133.apply_symm_apply z⟩

theorem layerQuotient133_surjective (ρ : R →+ ZMod 3)
    (hρ : Function.Surjective ρ) : Function.Surjective (layerQuotient133 ρ) := by
  rintro ⟨k, z⟩
  obtain ⟨r, hr⟩ := hρ k
  exact ⟨(r, crt133.symm z), Prod.ext hr (crt133.apply_symm_apply z)⟩

theorem marginQuotient21_surjective (ρ : R →+ ZMod 3)
    (hρ : Function.Surjective ρ) : Function.Surjective (marginQuotient21 ρ) := by
  rintro ⟨k, z⟩
  obtain ⟨r, hr⟩ := hρ k
  refine ⟨(r, crt133.symm (z, 0)), Prod.ext hr ?_⟩
  change (crt133 (crt133.symm (z, 0))).1 = z
  rw [crt133.apply_symm_apply]

theorem quotient133_card : Nat.card Quotient133 = 133 := by
  rw [Nat.card_eq_fintype_card]
  norm_num [Quotient133]

theorem quotient_layer_card : Nat.card (ZMod 3 × Quotient133) = 399 := by
  rw [Nat.card_prod, quotient133_card, Nat.card_eq_fintype_card, ZMod.card]

theorem quotient_margin_card : Nat.card (ZMod 3 × ZMod 7) = 21 := by
  rw [Nat.card_prod, Nat.card_eq_fintype_card, Nat.card_eq_fintype_card,
    ZMod.card, ZMod.card]

omit [AddCommGroup R] in
theorem product_domain_card1197 (hR : Nat.card R = 9) :
    Nat.card (R × ZMod 133) = 1197 := by
  rw [Nat.card_prod, hR, Nat.card_eq_fintype_card, ZMod.card]

theorem cyclicQuotient133_kernel_card (hR : Nat.card R = 9) :
    Nat.card (cyclicQuotient133 (R := R)).ker = 9 := by
  have h := AddSubgroup.card_ker_mul_card_of_surjective
    (cyclicQuotient133_surjective (R := R))
  rw [quotient133_card, product_domain_card1197 hR] at h
  omega

theorem layerQuotient133_kernel_card (hR : Nat.card R = 9)
    (ρ : R →+ ZMod 3) (hρ : Function.Surjective ρ) :
    Nat.card (layerQuotient133 ρ).ker = 3 := by
  have h := AddSubgroup.card_ker_mul_card_of_surjective (layerQuotient133_surjective ρ hρ)
  rw [quotient_layer_card, product_domain_card1197 hR] at h
  omega

theorem marginQuotient21_kernel_card (hR : Nat.card R = 9)
    (ρ : R →+ ZMod 3) (hρ : Function.Surjective ρ) :
    Nat.card (marginQuotient21 ρ).ker = 57 := by
  have h := AddSubgroup.card_ker_mul_card_of_surjective (marginQuotient21_surjective ρ hρ)
  rw [quotient_margin_card, product_domain_card1197 hR] at h
  omega

theorem forgetLayer_comp_layerQuotient133 (ρ : R →+ ZMod 3) :
    forgetLayer133.comp (layerQuotient133 ρ) = cyclicQuotient133 := by
  ext x <;> rfl

theorem forgetNineteen_comp_layerQuotient133 (ρ : R →+ ZMod 3) :
    forgetNineteen21.comp (layerQuotient133 ρ) = marginQuotient21 ρ := by
  ext x <;> rfl

theorem compress_snd_sum {A B : Type*} [AddCommGroup A] [AddCommGroup B]
    [Fintype A] [Fintype B] [DecidableEq B] (g : A × B → ℤ) (b : B) :
    compress (AddMonoidHom.snd A B) g b = ∑ a, g (a, b) := by
  change (∑ x : A × B, if x.2 = b then g x else 0) = _
  rw [Fintype.sum_prod_type]
  simp only [Fintype.sum_ite_eq']

theorem compress_fst_sum {A B : Type*} [AddCommGroup A] [AddCommGroup B]
    [Fintype A] [Fintype B] [DecidableEq A] (g : A × B → ℤ) (a : A) :
    compress (AddMonoidHom.fst A B) g a = ∑ b, g (a, b) := by
  change (∑ x : A × B, if x.1 = a then g x else 0) = _
  rw [Fintype.sum_prod_type, Finset.sum_comm]
  simp only [Fintype.sum_ite_eq']

theorem compress_forgetNineteen21 (g : ZMod 3 × Quotient133 → ℤ)
    (q : ZMod 3 × ZMod 7) :
    compress forgetNineteen21 g q = ∑ z : ZMod 19, g (q.1, (q.2, z)) := by
  calc
    compress forgetNineteen21 g q =
        compress (AddMonoidHom.fst (ZMod 3 × ZMod 7) (ZMod 19))
          (fun x => g (x.1.1, (x.1.2, x.2))) q := by
      apply Fintype.sum_equiv (Equiv.prodAssoc (ZMod 3) (ZMod 7) (ZMod 19)).symm
      intro x
      rfl
    _ = ∑ z : ZMod 19, g (q.1, (q.2, z)) := compress_fst_sum _ q

theorem sum_layer_compression [Fintype R]
    (ρ : R →+ ZMod 3) (f : R × ZMod 133 → ℤ) (z : Quotient133) :
    (∑ k : ZMod 3, compress (layerQuotient133 ρ) f (k, z)) =
      compress cyclicQuotient133 f z := by
  have h := compress_comp (layerQuotient133 ρ) forgetLayer133 f z
  rw [forgetLayer_comp_layerQuotient133] at h
  exact (compress_snd_sum (compress (layerQuotient133 ρ) f) z).symm.trans h

theorem sum_nineteen_layer_compression [Fintype R]
    (ρ : R →+ ZMod 3) (f : R × ZMod 133 → ℤ) (q : ZMod 3 × ZMod 7) :
    (∑ z : ZMod 19, compress (layerQuotient133 ρ) f (q.1, (q.2, z))) =
      compress (marginQuotient21 ρ) f q := by
  have h := compress_comp (layerQuotient133 ρ) forgetNineteen21 f q
  rw [forgetNineteen_comp_layerQuotient133] at h
  exact (compress_forgetNineteen21 (compress (layerQuotient133 ρ) f) q).symm.trans h

theorem cyclicQuotient133_equivariant (hR : Nat.card R = 9)
    (e : Multiplicative (AddAut (R × ZMod 133))) (x : R × ZMod 133) :
    cyclicQuotient133 (e.toAdd x) =
      productUnitScale (productMultiplierProjection133 hR e) (cyclicQuotient133 x) := by
  rcases x with ⟨r, z⟩
  rw [automorphism_product_apply133 hR e r z]
  exact crt133_mul_unit (multiplierProjection133 hR e) z

theorem layerQuotient133_equivariant (hR : Nat.card R = 9)
    (ρ : R →+ ZMod 3) (e : Multiplicative (AddAut (R × ZMod 133)))
    (hρe : ∀ r, ρ ((nineProjection133 hR e).toAdd r) = ρ r)
    (x : R × ZMod 133) :
    layerQuotient133 ρ (e.toAdd x) =
      layerUnitScale (productMultiplierProjection133 hR e) (layerQuotient133 ρ x) := by
  rcases x with ⟨r, z⟩
  rw [automorphism_product_apply133 hR e r z]
  exact Prod.ext (hρe r) (crt133_mul_unit (multiplierProjection133 hR e) z)

end HadamardLegendre
