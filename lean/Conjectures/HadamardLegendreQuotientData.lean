import Conjectures.HadamardLegendreQuotientMaps
import Conjectures.HadamardLegendreFullImage
import Conjectures.HadamardLegendreInvariantQuotient
import Conjectures.HadamardLegendreKernel

/-!
# Finite quotient data forced by an actual multiplier group of order 27

This file constructs the nine-class rows and their three-layer lifts
from the original sign rows. It derives the entry bounds, parity, row
sums, both complete correlation tables and the layer-sum identities.
The finite no-lift theorem can therefore be applied without assuming
any of these conditions separately.
-/

noncomputable section

namespace HadamardLegendre

open scoped BigOperators
open HadamardBorderNormalizationTransport HadamardBorderConstruction
open HadamardQuotient133

structure QuotientData133 where
  rows : Fin 2 → Row
  layers : Fin 2 → Fin 3 → Row
  bounded : ∀ i j k, -9 ≤ rows i j k ∧ rows i j k ≤ 9 ∧ rows i j k % 2 = 1
  row_sum : ∀ i, weightedSum (rows i) = 1
  correlation133 : ∀ t, HadamardQuotient133.correlation133 (rows 0) t +
    HadamardQuotient133.correlation133 (rows 1) t = if t = 0 then 2378 else -18
  layer_bound : ∀ i k j l, |layers i k j l| ≤ 3 ∧ layers i k j l % 2 = 1
  layer_sum : ∀ i j l, (∑ k, layers i k j l) = rows i j l
  correlation21 : ∀ t,
    HadamardQuotient133.correlation21 (project21 (layers 0)) t +
      HadamardQuotient133.correlation21 (project21 (layers 1)) t =
        if t = 0 then 2282 else -114

variable {R : Type*} [AddCommGroup R] [Fintype R]

def quotientRows133 (f : Rows2 (R × ZMod 133)) : Rows2 Quotient133 :=
  fun i => compress cyclicQuotient133 (f i)

def quotientLayers133 (ρ : R →+ ZMod 3) (f : Rows2 (R × ZMod 133)) :
    Fin 2 → ZMod 3 → Quotient133 → ℤ :=
  fun i k z => compress (layerQuotient133 ρ) (f i) (k, z)

def quotientMargins21 (ρ : R →+ ZMod 3) (f : Rows2 (R × ZMod 133)) :
    Rows2 (ZMod 3 × ZMod 7) :=
  fun i => compress (marginQuotient21 ρ) (f i)

theorem quotientRows133_squareInvariant
    (hR : Nat.card R = 9) (f : Rows2 (R × ZMod 133))
    (U : Subgroup (Multiplicative (AddAut (R × ZMod 133))))
    (hU : U ≤ fixedMultiplierGroup f)
    (hfull : ∀ (v7 : (ZMod 7)ˣ) (v19 : (ZMod 19)ˣ),
      ∃ u : U, productMultiplierProjection133 hR u.val = (v7 ^ 2, v19 ^ 2))
    (i : Fin 2) : SquareInvariant133 (quotientRows133 f i) := by
  intro v7 v19 z
  obtain ⟨u, hu⟩ := hfull v7 v19
  have h := compress_equivariant (cyclicQuotient133 (R := R)) u.val.toAdd
    (productUnitScale (productMultiplierProjection133 hR u.val))
    (cyclicQuotient133_equivariant hR u.val) (f i) (hU u.property i) z
  rw [hu] at h
  exact h

theorem quotientLayers133_squareInvariant
    (hR : Nat.card R = 9) (f : Rows2 (R × ZMod 133))
    (U : Subgroup (Multiplicative (AddAut (R × ZMod 133))))
    (hU : U ≤ fixedMultiplierGroup f)
    (hfull : ∀ (v7 : (ZMod 7)ˣ) (v19 : (ZMod 19)ˣ),
      ∃ u : U, productMultiplierProjection133 hR u.val = (v7 ^ 2, v19 ^ 2))
    (ρ : R →+ ZMod 3)
    (hρ : ∀ (u : U) r, ρ ((nineProjection133 hR u.val).toAdd r) = ρ r)
    (i : Fin 2) (k : ZMod 3) :
    SquareInvariant133 (quotientLayers133 ρ f i k) := by
  intro v7 v19 z
  obtain ⟨u, hu⟩ := hfull v7 v19
  have h := compress_equivariant (layerQuotient133 ρ) u.val.toAdd
    (layerUnitScale (productMultiplierProjection133 hR u.val))
    (layerQuotient133_equivariant hR ρ u.val (hρ u))
    (f i) (hU u.property i) (k, z)
  rw [hu] at h
  exact h

theorem quotientRows133_correlation (hR : Nat.card R = 9)
    (f : Rows2 (R × ZMod 133)) (hf : IsLegendrePair f) (t : Quotient133) :
    pairCorrelation (quotientRows133 f) t = if t = 0 then 2378 else -18 := by
  have hcard : Fintype.card (R × ZMod 133) = 1197 := by
    simpa only [Nat.card_eq_fintype_card] using product_domain_card1197 hR
  change pairCorrelation (fun i => compress cyclicQuotient133 (f i)) t = _
  rw [compressed_pairCorrelation_formula cyclicQuotient133
    cyclicQuotient133_surjective f hf t, cyclicQuotient133_kernel_card hR, hcard]
  by_cases ht : t = 0 <;> norm_num [ht]

theorem quotientMargins21_correlation (hR : Nat.card R = 9)
    (f : Rows2 (R × ZMod 133)) (hf : IsLegendrePair f)
    (ρ : R →+ ZMod 3) (hρ : Function.Surjective ρ) (t : ZMod 3 × ZMod 7) :
    pairCorrelation (quotientMargins21 ρ f) t = if t = 0 then 2282 else -114 := by
  have hcard : Fintype.card (R × ZMod 133) = 1197 := by
    simpa only [Nat.card_eq_fintype_card] using product_domain_card1197 hR
  change pairCorrelation (fun i => compress (marginQuotient21 ρ) (f i)) t = _
  rw [compressed_pairCorrelation_formula (marginQuotient21 ρ)
    (marginQuotient21_surjective ρ hρ) f hf t,
    marginQuotient21_kernel_card hR ρ hρ, hcard]
  by_cases ht : t = 0 <;> norm_num [ht]

theorem quotientRows133_bound_parity (hR : Nat.card R = 9)
    (f : Rows2 (R × ZMod 133)) (hf : IsLegendrePair f)
    (i : Fin 2) (z : Quotient133) :
    |quotientRows133 f i z| ≤ 9 ∧ quotientRows133 f i z % 2 = 1 := by
  have hb := abs_compress_le_kernel_card cyclicQuotient133
    cyclicQuotient133_surjective (f i) (hf.1 i) z
  have hp := compress_mod_two cyclicQuotient133
    cyclicQuotient133_surjective (f i) (hf.1 i) z
  rw [cyclicQuotient133_kernel_card hR] at hb hp
  norm_num only at hb hp
  exact ⟨hb, hp⟩

theorem quotientLayers133_bound_parity (hR : Nat.card R = 9)
    (f : Rows2 (R × ZMod 133)) (hf : IsLegendrePair f)
    (ρ : R →+ ZMod 3) (hρ : Function.Surjective ρ)
    (i : Fin 2) (k : ZMod 3) (z : Quotient133) :
    |quotientLayers133 ρ f i k z| ≤ 3 ∧ quotientLayers133 ρ f i k z % 2 = 1 := by
  have hb := abs_compress_le_kernel_card (layerQuotient133 ρ)
    (layerQuotient133_surjective ρ hρ) (f i) (hf.1 i) (k, z)
  have hp := compress_mod_two (layerQuotient133 ρ)
    (layerQuotient133_surjective ρ hρ) (f i) (hf.1 i) (k, z)
  rw [layerQuotient133_kernel_card hR ρ hρ] at hb hp
  norm_num only at hb hp
  exact ⟨hb, hp⟩

theorem quotientRows133_rowSum (f : Rows2 (R × ZMod 133)) (i : Fin 2) :
    rowSum (quotientRows133 f i) = rowSum (f i) := by
  unfold quotientRows133
  exact compressed_rowSum cyclicQuotient133 (f i)

theorem quotientData133_of_compressed_invariance
    (hR : Nat.card R = 9) (f : Rows2 (R × ZMod 133))
    (hf : IsLegendrePair f) (hsum : ∀ i, rowSum (f i) = 1)
    (ρ : R →+ ZMod 3) (hρ : Function.Surjective ρ)
    (h133 : ∀ i, SquareInvariant133 (quotientRows133 f i))
    (hlayers : ∀ i k, SquareInvariant133 (quotientLayers133 ρ f i k)) :
    Nonempty QuotientData133 := by
  refine ⟨{
    rows := fun i => classRow133 (quotientRows133 f i)
    layers := fun i => classLayers133 (quotientLayers133 ρ f i)
    bounded := ?_
    row_sum := ?_
    correlation133 := ?_
    layer_bound := ?_
    layer_sum := ?_
    correlation21 := ?_ }⟩
  · intro i j k
    obtain ⟨hb, hp⟩ := quotientRows133_bound_parity hR f hf i (rep7 j, rep19 k)
    exact ⟨(abs_le.mp hb).1, (abs_le.mp hb).2, hp⟩
  · intro i
    exact (weightedSum_classRow133 (quotientRows133 f i) (h133 i)).trans
      ((quotientRows133_rowSum f i).trans (hsum i))
  · intro t
    exact (pairCorrelation_classRows133 (quotientRows133 f) h133 t).trans
      (quotientRows133_correlation hR f hf t)
  · intro i k j l
    exact quotientLayers133_bound_parity hR f hf ρ hρ i k (rep7 j, rep19 l)
  · intro i j l
    exact classLayers133_sum (quotientLayers133 ρ f i) (quotientRows133 f i)
      (sum_layer_compression ρ (f i)) j l
  · intro t
    rw [pairCorrelation_project_classLayers133 _ hlayers]
    have heq :
        (fun i (x : ZMod 3 × ZMod 7) => ∑ z : ZMod 19,
          quotientLayers133 ρ f i x.1 (x.2, z)) = quotientMargins21 ρ f := by
      funext i x
      exact sum_nineteen_layer_compression ρ (f i) x
    rw [heq]
    exact quotientMargins21_correlation hR f hf ρ hρ t

/-- An actual row-fixing subgroup of order 27 forces all finite no-lift data. -/
theorem quotientData133_of_fixed_card27
    (hR : Nat.card R = 9) (f : Rows2 (R × ZMod 133))
    (hf : IsLegendrePair f) (hsum : ∀ i, rowSum (f i) = 1)
    (U : Subgroup (Multiplicative (AddAut (R × ZMod 133))))
    (hU : U ≤ fixedMultiplierGroup f) (hcard : Nat.card U = 27) :
    Nonempty QuotientData133 := by
  have hodd : Odd (Nat.card U) := by rw [hcard]; decide
  let φ := (productMultiplierProjection133 hR).comp U.subtype
  have hφ : Function.Injective φ :=
    unitsCRT133.injective.comp
      (multiplierProjection133_injective_on_odd_fixed hR f hf U hU hodd)
  have hfull (v7 : (ZMod 7)ˣ) (v19 : (ZMod 19)ˣ) :
      ∃ u : U, productMultiplierProjection133 hR u.val = (v7 ^ 2, v19 ^ 2) :=
    exists_preimage_square_of_card_twenty_seven φ hφ hcard v7 v19
  obtain ⟨ρ, hρ, _, hρfix⟩ := exists_invariant_quotient_three hR
    hcard.dvd
    ((nineProjection133 hR).comp U.subtype)
  exact quotientData133_of_compressed_invariance hR f hf hsum ρ hρ
    (quotientRows133_squareInvariant hR f U hU hfull)
    (quotientLayers133_squareInvariant hR f U hU hfull ρ hρfix)

end HadamardLegendre
