import Conjectures.HadamardLegendreBasic
import Mathlib.Algebra.Group.End
import Mathlib.Algebra.Group.Subgroup.Basic
import Mathlib.Algebra.Module.BigOperators
import Mathlib.Tactic.Abel

/-!
# Centering actual Legendre rows

For a row of sum one, translating by its integer-weighted moment makes
the moment zero. An additive automorphism preserves that centered row
exactly if and only if it preserves the original row up to translation.
The construction is applied independently to the two actual rows.
-/

namespace HadamardLegendre

open scoped BigOperators
open HadamardBorderNormalizationTransport

variable {G : Type*} [AddCommGroup G]

def RowMultiplier (f : G → ℤ) (e : G ≃+ G) : Prop :=
  ∃ t : G, ∀ x, f (e x) = f (x + t)

/-- Separate translations are allowed for the two rows; row interchange
is not part of the multiplier group. -/
def commonMultiplierGroup (f : Rows2 G) :
    Subgroup (Multiplicative (AddAut G)) where
  carrier := {u | ∀ i, RowMultiplier (f i) u.toAdd}
  one_mem' := by
    intro i
    exact ⟨0, fun x => by simp⟩
  mul_mem' := by
    intro u v hu hv i
    obtain ⟨t, ht⟩ := hu i
    obtain ⟨s, hs⟩ := hv i
    refine ⟨v.toAdd.symm t + s, ?_⟩
    intro x
    change f i (u.toAdd (v.toAdd x)) = f i (x + (v.toAdd.symm t + s))
    rw [ht]
    have h := hs (x + v.toAdd.symm t)
    simpa only [map_add, v.toAdd.apply_symm_apply, add_assoc] using h
  inv_mem' := by
    intro u hu i
    obtain ⟨t, ht⟩ := hu i
    refine ⟨-u.toAdd t, ?_⟩
    intro x
    change f i (u.toAdd.symm x) = f i (x + -u.toAdd t)
    have h := ht (u.toAdd.symm x - t)
    rw [map_sub, u.toAdd.apply_symm_apply, sub_add_cancel] at h
    simpa only [sub_eq_add_neg] using h.symm

def fixedMultiplierGroup (f : Rows2 G) :
    Subgroup (Multiplicative (AddAut G)) where
  carrier := {u | ∀ i x, f i (u.toAdd x) = f i x}
  one_mem' := by intro i x; rfl
  mul_mem' := by
    intro u v hu hv i x
    change f i (u.toAdd (v.toAdd x)) = f i x
    rw [hu, hv]
  inv_mem' := by
    intro u hu i x
    change f i (u.toAdd.symm x) = f i x
    have h := hu i (u.toAdd.symm x)
    simpa only [u.toAdd.apply_symm_apply] using h.symm

theorem rowMultiplier_mul_sign_iff (f : G → ℤ) (e : G ≃+ G)
    (ε : ℤ) (hε : ε = 1 ∨ ε = -1) :
    RowMultiplier (fun x => ε * f x) e ↔ RowMultiplier f e := by
  rcases hε with rfl | rfl <;> simp [RowMultiplier]

section Moments

variable [Fintype G]

def moment (f : G → ℤ) : G := ∑ x, f x • x

def center (f : G → ℤ) : G → ℤ := fun x => f (x + moment f)

theorem rowSum_translate (f : G → ℤ) (t : G) :
    rowSum (fun x => f (x + t)) = rowSum f :=
  Equiv.sum_comp (Equiv.addRight t) f

theorem moment_translate (f : G → ℤ) (t : G) :
    moment (fun x => f (x + t)) = moment f - rowSum f • t := by
  calc
    moment (fun x => f (x + t)) = ∑ y, f y • (y - t) := by
      unfold moment
      apply Fintype.sum_equiv (Equiv.addRight t)
      intro x
      simp
    _ = moment f - rowSum f • t := by
      simp only [smul_sub, Finset.sum_sub_distrib, ← Finset.sum_smul, moment, rowSum]

theorem moment_comp_addEquiv (f : G → ℤ) (e : G ≃+ G) :
    moment (fun x => f (e x)) = e.symm (moment f) := by
  calc
    moment (fun x => f (e x)) = ∑ y, f y • e.symm y := by
      unfold moment
      apply Fintype.sum_equiv e.toEquiv
      intro x
      simp
    _ = e.symm (moment f) := by
      simp only [moment, map_sum, map_zsmul]

theorem rowSum_center (f : G → ℤ) : rowSum (center f) = rowSum f :=
  rowSum_translate f (moment f)

theorem moment_center (f : G → ℤ) (hf : rowSum f = 1) :
    moment (center f) = 0 := by
  change moment (fun x => f (x + moment f)) = 0
  rw [moment_translate, hf, one_zsmul, sub_self]

theorem center_fixed_of_rowMultiplier (f : G → ℤ) (e : G ≃+ G)
    (hf : rowSum f = 1) (he : RowMultiplier f e) :
    ∀ x, center f (e x) = center f x := by
  obtain ⟨t, ht⟩ := he
  have hm := congrArg moment (funext ht)
  rw [moment_comp_addEquiv, moment_translate, hf, one_zsmul] at hm
  have hshift : e.symm (moment f) + t = moment f := by
    rw [hm]
    abel
  intro x
  have h := ht (x + e.symm (moment f))
  simpa only [center, map_add, e.apply_symm_apply, add_assoc, hshift] using h

theorem rowMultiplier_of_center_fixed (f : G → ℤ) (e : G ≃+ G)
    (he : ∀ x, center f (e x) = center f x) : RowMultiplier f e := by
  refine ⟨moment f - e.symm (moment f), ?_⟩
  intro x
  have h := he (x - e.symm (moment f))
  change f (e (x - e.symm (moment f)) + moment f) =
    f ((x - e.symm (moment f)) + moment f) at h
  rw [map_sub, e.apply_symm_apply, sub_add_cancel] at h
  calc
    f (e x) = f ((x - e.symm (moment f)) + moment f) := h
    _ = f (x + (moment f - e.symm (moment f))) := by
      congr 1
      abel

theorem rowMultiplier_iff_center_fixed (f : G → ℤ) (e : G ≃+ G)
    (hf : rowSum f = 1) :
    RowMultiplier f e ↔ ∀ x, center f (e x) = center f x :=
  ⟨center_fixed_of_rowMultiplier f e hf, rowMultiplier_of_center_fixed f e⟩

def centeredRows (f : Rows2 G) : Rows2 G :=
  fun i => center (normalizeSigns f i)

theorem centeredRows_apply (f : Rows2 G) (i : Fin 2) (x : G) :
    centeredRows f i x =
      rowSum (f i) * f i (x + moment (normalizeSigns f i)) := rfl

theorem centeredRows_rowSum (f : Rows2 G) (hf : IsLegendrePair f) (i : Fin 2) :
    rowSum (centeredRows f i) = 1 := by
  rw [centeredRows, rowSum_center, normalizeSigns_rowSum f hf i]

theorem centeredRows_moment (f : Rows2 G) (hf : IsLegendrePair f) (i : Fin 2) :
    moment (centeredRows f i) = 0 :=
  moment_center (normalizeSigns f i) (normalizeSigns_rowSum f hf i)

theorem centeredRows_pairCorrelation (f : Rows2 G) (hf : IsLegendrePair f) (u : G) :
    pairCorrelation (centeredRows f) u = pairCorrelation f u := by
  calc
    pairCorrelation (centeredRows f) u =
        pairCorrelation (normalizeSigns f) u := by
      apply Finset.sum_congr rfl
      intro i hi
      exact correlation_translate (normalizeSigns f i)
        (moment (normalizeSigns f i)) u
    _ = pairCorrelation f u := normalizeSigns_pairCorrelation f hf u

theorem centeredRows_isLegendrePair (f : Rows2 G) (hf : IsLegendrePair f) :
    IsLegendrePair (centeredRows f) := by
  constructor
  · intro i x
    exact (normalizeSigns_isLegendrePair f hf).1 i
      (x + moment (normalizeSigns f i))
  · intro u hu
    rw [centeredRows_pairCorrelation f hf u]
    exact hf.2 u hu

/-- The original group, allowing independent row translations, is exactly
the subgroup fixing the two explicitly centered rows. -/
theorem commonMultiplierGroup_eq_fixed_centeredRows (f : Rows2 G)
    (hf : IsLegendrePair f) :
    commonMultiplierGroup f = fixedMultiplierGroup (centeredRows f) := by
  ext u
  change (∀ i, RowMultiplier (f i) u.toAdd) ↔
    ∀ i x, centeredRows f i (u.toAdd x) = centeredRows f i x
  apply forall_congr'
  intro i
  exact (rowMultiplier_mul_sign_iff (f i) u.toAdd (rowSum (f i))
    (rowSum_sign_of_legendre f hf i)).symm.trans
      (rowMultiplier_iff_center_fixed (normalizeSigns f i) u.toAdd
        (normalizeSigns_rowSum f hf i))

end Moments

end HadamardLegendre
