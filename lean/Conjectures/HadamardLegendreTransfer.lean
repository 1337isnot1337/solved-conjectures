import Conjectures.HadamardLegendreCentering
import Conjectures.HadamardLegendreDomain

/-!
# Transport of actual Legendre rows and their full fixed groups

An additive coordinate equivalence preserves every entry, row sum and
correlation. Conjugation identifies the full row-fixing automorphism
subgroups, so the product-domain argument applies to every original
abelian group rather than a prescribed family of coordinate symmetries.
-/

namespace HadamardLegendre

open scoped BigOperators
open HadamardBorderNormalizationTransport

variable {G H : Type*} [AddCommGroup G] [AddCommGroup H]

def reindexRows (e : G ≃+ H) (f : Rows2 G) : Rows2 H :=
  fun i y => f i (e.symm y)

theorem reindexRows_rowSum [Fintype G] [Fintype H]
    (e : G ≃+ H) (f : Rows2 G) (i : Fin 2) :
    rowSum (reindexRows e f i) = rowSum (f i) :=
  Equiv.sum_comp e.symm.toEquiv (f i)

theorem reindexRows_pairCorrelation [Fintype G] [Fintype H]
    (e : G ≃+ H) (f : Rows2 G) (v : H) :
    pairCorrelation (reindexRows e f) v = pairCorrelation f (e.symm v) := by
  unfold pairCorrelation correlation
  apply Finset.sum_congr rfl
  intro i hi
  change (∑ y, f i (e.symm y) * f i (e.symm (y + v))) =
    ∑ x, f i x * f i (x + e.symm v)
  apply Fintype.sum_equiv e.symm.toEquiv
  intro y
  rw [map_add]
  rfl

theorem reindexRows_isLegendrePair [Fintype G] [Fintype H]
    (e : G ≃+ H) (f : Rows2 G) (hf : IsLegendrePair f) :
    IsLegendrePair (reindexRows e f) := by
  refine ⟨fun i y => hf.1 i (e.symm y), ?_⟩
  intro v hv
  rw [reindexRows_pairCorrelation]
  apply hf.2
  intro h
  exact hv (e.symm.injective (h.trans (map_zero e.symm).symm))

def conjugateAut (e : G ≃+ H) :
    Multiplicative (AddAut G) ≃* Multiplicative (AddAut H) :=
  (AddAut.congr e).toMultiplicative

theorem conjugateAut_apply (e : G ≃+ H)
    (u : Multiplicative (AddAut G)) (x : H) :
    (conjugateAut e u).toAdd x = e (u.toAdd (e.symm x)) := rfl

theorem conjugateAut_fixed_mem_iff (e : G ≃+ H) (f : Rows2 G)
    (u : Multiplicative (AddAut G)) :
    conjugateAut e u ∈ fixedMultiplierGroup (reindexRows e f) ↔
      u ∈ fixedMultiplierGroup f := by
  constructor
  · intro hu i x
    have h := hu i (e x)
    change f i (e.symm ((conjugateAut e u).toAdd (e x))) =
      f i (e.symm (e x)) at h
    simpa only [conjugateAut_apply, e.symm_apply_apply] using h
  · intro hu i x
    change f i (e.symm ((conjugateAut e u).toAdd x)) = f i (e.symm x)
    rw [conjugateAut_apply, e.symm_apply_apply]
    exact hu i (e.symm x)

def fixedMultiplierGroupEquiv (e : G ≃+ H) (f : Rows2 G) :
    fixedMultiplierGroup f ≃* fixedMultiplierGroup (reindexRows e f) :=
  let φ := conjugateAut e
  { toFun := fun u => ⟨φ u.val, (conjugateAut_fixed_mem_iff e f u.val).mpr u.property⟩
    invFun := fun v => ⟨φ.symm v.val,
      (conjugateAut_fixed_mem_iff e f (φ.symm v.val)).mp (by
        change φ (φ.symm v.val) ∈ fixedMultiplierGroup (reindexRows e f)
        rw [φ.apply_symm_apply]
        exact v.property)⟩
    left_inv := fun u => Subtype.ext (φ.symm_apply_apply u.val)
    right_inv := fun v => Subtype.ext (φ.apply_symm_apply v.val)
    map_mul' := fun u v => Subtype.ext (φ.map_mul u.val v.val) }

theorem card_fixedMultiplierGroup_reindex (e : G ≃+ H) (f : Rows2 G) :
    Nat.card (fixedMultiplierGroup f) =
      Nat.card (fixedMultiplierGroup (reindexRows e f)) :=
  Nat.card_congr (fixedMultiplierGroupEquiv e f).toEquiv

end HadamardLegendre
