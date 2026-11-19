import Conjectures.HadamardLegendreOrderThreeFibers
import Conjectures.HadamardLegendreProjection
import Conjectures.HadamardLegendreCentering

/-!
# No nontrivial multiplier can act only on the order-nine factor

An actual order-three automorphism on that factor forces each of the
133 row fibres to contribute at least nineteen to compressed energy.
One row alone would therefore contribute at least 2527, whereas the
original pair correlation equation gives total energy 2390.
Cauchy's theorem and the fixed-subgroup count then remove the entire
kernel of the actual unit-multiplier projection for every odd-order
row-fixing subgroup.
-/

namespace HadamardLegendre

open scoped BigOperators
open HadamardBorderNormalizationTransport
open HadamardBorderConstruction

theorem compress_prodMap_id
    {R Q H : Type*} [AddCommGroup R] [AddCommGroup Q] [AddCommGroup H]
    [Fintype R] [Fintype Q] [Fintype H] [DecidableEq Q] [DecidableEq H]
    (π : R →+ Q) (f : R × H → ℤ) (q : Q) (z : H) :
    compress (π.prodMap (AddMonoidHom.id H)) f (q, z) =
      compress π (fun r => f (r, z)) q := by
  change (∑ x : R × H, if (π x.1, x.2) = (q, z) then f x else 0) =
    ∑ r, if π r = q then f (r, z) else 0
  rw [Fintype.sum_prod_type]
  apply Finset.sum_congr rfl
  intro r hr
  by_cases h : π r = q <;> simp [h]

variable {R : Type*} [AddCommGroup R] [Fintype R]

theorem no_legendre_order_three_on_nine_factor
    (hR : Nat.card R = 9) (f : Rows2 (R × ZMod 133)) (hf : IsLegendrePair f)
    (u : Multiplicative (AddAut R)) (hu : u ^ 3 = 1) (hne : u ≠ 1)
    (hinv : ∀ i r z, f i (u.toAdd r, z) = f i (r, z)) : False := by
  classical
  let S := automorphismFixedSubgroup u
  let Q := R ⧸ S
  let : Fintype Q := Fintype.ofFinite Q
  let π := QuotientAddGroup.mk' S
  let ρ := π.prodMap (AddMonoidHom.id (ZMod 133))
  have hπ := QuotientAddGroup.mk'_surjective S
  have hρ : Function.Surjective ρ := by
    rintro ⟨q, z⟩
    obtain ⟨r, hr⟩ := hπ q
    exact ⟨(r, z), Prod.ext hr rfl⟩
  have hQ : Fintype.card Q = 3 := by
    simpa only [Nat.card_eq_fintype_card] using order_three_quotient_card hR u hu hne
  have hcardR : Fintype.card R = 9 := by
    simpa only [Nat.card_eq_fintype_card] using hR
  have hcardG : Fintype.card (R × ZMod 133) = 1197 := by
    rw [Fintype.card_prod, hcardR, ZMod.card]
  have hcount := fintype_card_eq_card_mul_kernel_card ρ hρ
  rw [hcardG, Fintype.card_prod, hQ, ZMod.card] at hcount
  have hker : Nat.card ρ.ker = 3 := by omega
  have henergy := compressed_pair_energy ρ hρ f hf
  rw [hcardG, hker] at henergy
  norm_num at henergy
  have hrow : 2527 ≤ ∑ x : Q × ZMod 133, (compress ρ (f 0) x) ^ 2 := by
    calc
      2527 = ∑ _z : ZMod 133, (19 : ℤ) := by norm_num
      _ ≤ ∑ z : ZMod 133, ∑ q : Q, (compress π (fun r => f 0 (r, z)) q) ^ 2 := by
        apply Finset.sum_le_sum
        intro z hz
        exact order_three_compressed_energy_ge hR u hu hne
          (fun r => f 0 (r, z)) (fun r => hf.1 0 (r, z)) (fun r => hinv 0 r z)
      _ = ∑ x : Q × ZMod 133, (compress ρ (f 0) x) ^ 2 := by
        rw [Fintype.sum_prod_type_right]
        apply Finset.sum_congr rfl
        intro z hz
        apply Finset.sum_congr rfl
        intro q hq
        rw [compress_prodMap_id]
  have hrow1 : 0 ≤ ∑ x : Q × ZMod 133, (compress ρ (f 1) x) ^ 2 :=
    Finset.sum_nonneg (fun _ _ => sq_nonneg _)
  rw [Fin.sum_univ_two] at henergy
  omega

theorem multiplierProjection133_injective_on_odd_fixed
    (hR : Nat.card R = 9) (f : Rows2 (R × ZMod 133)) (hf : IsLegendrePair f)
    (U : Subgroup (Multiplicative (AddAut (R × ZMod 133))))
    (hU : U ≤ fixedMultiplierGroup f) (hodd : Odd (Nat.card U)) :
    Function.Injective ((multiplierProjection133 hR).comp U.subtype) := by
  let : Finite (AddAut (R × ZMod 133)) := Finite.of_injective
    (fun e : AddAut (R × ZMod 133) => (e : (R × ZMod 133) → (R × ZMod 133)))
    DFunLike.coe_injective
  let φ := (multiplierProjection133 hR).comp U.subtype
  have hker : Nat.card φ.ker = 1 := by
    by_contra hne
    obtain ⟨p, hp, hpd⟩ := Nat.exists_prime_and_dvd hne
    let : Fact p.Prime := ⟨hp⟩
    obtain ⟨k, hk⟩ := exists_prime_orderOf_dvd_card' (G := φ.ker) p hpd
    let κ : φ.ker →* Multiplicative (AddAut (R × ZMod 133)) :=
      U.subtype.comp φ.ker.subtype
    have hκ : Function.Injective κ := U.subtype_injective.comp φ.ker.subtype_injective
    have hkn : k ≠ 1 := by
      intro h
      rw [h, orderOf_one] at hk
      exact hp.ne_one hk.symm
    have hκn : κ k ≠ 1 := by
      intro h
      apply hkn
      apply hκ
      simpa only [map_one] using h
    have hprojection : multiplierProjection133 hR (κ k) = 1 := k.property
    have hnine : nineProjection133 hR (κ k) ≠ 1 := by
      intro h
      apply hκn
      exact projections133_jointly_injective hR (κ k) 1
        (by simpa only [map_one] using h)
        (by simpa only [map_one] using hprojection)
    have hkp : k ^ p = 1 := by rw [← hk]; exact pow_orderOf_eq_one k
    have hninepow : (nineProjection133 hR (κ k)) ^ p = 1 := by
      rw [← map_pow, ← map_pow, hkp, map_one, map_one]
    have hp2 : p ≠ 2 := by
      intro hp2
      apply hodd.not_even
      apply even_iff_two_dvd.mpr
      rw [← hp2]
      exact hpd.trans φ.ker.card_subgroup_dvd_card
    have hp3 := (prime_automorphism_fixed_card_nine hR
      (nineProjection133 hR (κ k)) hp hp2 hninepow hnine).1
    have hpow3 : (nineProjection133 hR (κ k)) ^ 3 = 1 := by
      simpa only [hp3] using hninepow
    have hfix : ∀ i x, f i ((κ k).toAdd x) = f i x := hU k.val.property
    apply no_legendre_order_three_on_nine_factor hR f hf
      (nineProjection133 hR (κ k)) hpow3 hnine
    intro i r z
    have h := hfix i (r, z)
    rw [automorphism_product_apply133 hR (κ k) r z, hprojection] at h
    simpa only [Units.val_one, one_mul] using h
  exact (MonoidHom.ker_eq_bot_iff φ).mp (φ.ker.eq_bot_of_card_eq hker)

theorem odd_fixed_multiplier_card_dvd_twenty_seven
    (hR : Nat.card R = 9) (f : Rows2 (R × ZMod 133)) (hf : IsLegendrePair f)
    (U : Subgroup (Multiplicative (AddAut (R × ZMod 133))))
    (hU : U ≤ fixedMultiplierGroup f) (hodd : Odd (Nat.card U)) :
    Nat.card U ∣ 27 :=
  card_dvd_twenty_seven_of_injective_projection
    ((multiplierProjection133 hR).comp U.subtype)
    (multiplierProjection133_injective_on_odd_fixed hR f hf U hU hodd) hodd

end HadamardLegendre
