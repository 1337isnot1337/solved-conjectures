import Conjectures.ChenKhareSahiCovers
import Conjectures.ChenKhareSahiReal
import Mathlib.Tactic.Positivity
import Mathlib.Algebra.BigOperators.Ring.Finset

set_option Elab.async false

namespace ChenKhareSahi

abbrev Part := ℕ × ℕ × ℕ

noncomputable def realMP (a : Part) (x y z : ℝ) : ℝ := realM a.1 a.2.1 a.2.2 x y z

def addPart (a b : Part) : Part := (a.1+b.1, a.2.1+b.2.1, a.2.2+b.2.2)

noncomputable def realCoeff (a b c : Part) : ℝ :=
  ((∑ e ∈ orbit a.1 a.2.1 a.2.2, ∑ f ∈ orbit b.1 b.2.1 b.2.2,
      if addPart e f = c then (1 : ℝ) else 0) * (orbit c.1 c.2.1 c.2.2).card) /
      ((orbit a.1 a.2.1 a.2.2).card * (orbit b.1 b.2.1 b.2.2).card)

theorem realCoeff_nonnegative (a b c : Part) : 0 ≤ realCoeff a b c := by
  unfold realCoeff
  positivity

/-! Exact natural coefficient checks and individual polynomial products. -/

private def coefficientCount (a b c : Part) : ℕ :=
  ∑ e ∈ orbit a.1 a.2.1 a.2.2, ∑ f ∈ orbit b.1 b.2.1 b.2.2,
    if addPart e f = c then 1 else 0

private theorem realCoeff_count (a b c : Part) :
    realCoeff a b c =
      ((coefficientCount a b c * (orbit c.1 c.2.1 c.2.2).card : ℕ) : ℝ) /
      (((orbit a.1 a.2.1 a.2.2).card * (orbit b.1 b.2.1 b.2.2).card : ℕ) : ℝ) := by
  simp [realCoeff, coefficientCount, Nat.cast_sum, Nat.cast_mul]

@[local simp] private theorem orbit_card_000 :
    (orbit 0 0 0).card = 1 := by decide

@[local simp] private theorem realMP_expand_000 (x y z : ℝ) :
    realMP (0,0,0) x y z = (x^0*y^0*z^0) / 1 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]

@[local simp] private theorem orbit_card_100 :
    (orbit 1 0 0).card = 3 := by decide

@[local simp] private theorem realMP_expand_100 (x y z : ℝ) :
    realMP (1,0,0) x y z = (x^0*y^0*z^1 + x^0*y^1*z^0 + x^1*y^0*z^0) / 3 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_200 :
    (orbit 2 0 0).card = 3 := by decide

@[local simp] private theorem realMP_expand_200 (x y z : ℝ) :
    realMP (2,0,0) x y z = (x^0*y^0*z^2 + x^0*y^2*z^0 + x^2*y^0*z^0) / 3 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_110 :
    (orbit 1 1 0).card = 3 := by decide

@[local simp] private theorem realMP_expand_110 (x y z : ℝ) :
    realMP (1,1,0) x y z = (x^0*y^1*z^1 + x^1*y^0*z^1 + x^1*y^1*z^0) / 3 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_300 :
    (orbit 3 0 0).card = 3 := by decide

@[local simp] private theorem realMP_expand_300 (x y z : ℝ) :
    realMP (3,0,0) x y z = (x^0*y^0*z^3 + x^0*y^3*z^0 + x^3*y^0*z^0) / 3 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_210 :
    (orbit 2 1 0).card = 6 := by decide

@[local simp] private theorem realMP_expand_210 (x y z : ℝ) :
    realMP (2,1,0) x y z = (x^0*y^1*z^2 + x^0*y^2*z^1 + x^1*y^0*z^2 + x^1*y^2*z^0 + x^2*y^0*z^1 + x^2*y^1*z^0) / 6 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_111 :
    (orbit 1 1 1).card = 1 := by decide

@[local simp] private theorem realMP_expand_111 (x y z : ℝ) :
    realMP (1,1,1) x y z = (x^1*y^1*z^1) / 1 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]

@[local simp] private theorem orbit_card_400 :
    (orbit 4 0 0).card = 3 := by decide

@[local simp] private theorem realMP_expand_400 (x y z : ℝ) :
    realMP (4,0,0) x y z = (x^0*y^0*z^4 + x^0*y^4*z^0 + x^4*y^0*z^0) / 3 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_310 :
    (orbit 3 1 0).card = 6 := by decide

@[local simp] private theorem realMP_expand_310 (x y z : ℝ) :
    realMP (3,1,0) x y z = (x^0*y^1*z^3 + x^0*y^3*z^1 + x^1*y^0*z^3 + x^1*y^3*z^0 + x^3*y^0*z^1 + x^3*y^1*z^0) / 6 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_220 :
    (orbit 2 2 0).card = 3 := by decide

@[local simp] private theorem realMP_expand_220 (x y z : ℝ) :
    realMP (2,2,0) x y z = (x^0*y^2*z^2 + x^2*y^0*z^2 + x^2*y^2*z^0) / 3 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_211 :
    (orbit 2 1 1).card = 3 := by decide

@[local simp] private theorem realMP_expand_211 (x y z : ℝ) :
    realMP (2,1,1) x y z = (x^1*y^1*z^2 + x^1*y^2*z^1 + x^2*y^1*z^1) / 3 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_500 :
    (orbit 5 0 0).card = 3 := by decide

@[local simp] private theorem realMP_expand_500 (x y z : ℝ) :
    realMP (5,0,0) x y z = (x^0*y^0*z^5 + x^0*y^5*z^0 + x^5*y^0*z^0) / 3 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_410 :
    (orbit 4 1 0).card = 6 := by decide

@[local simp] private theorem realMP_expand_410 (x y z : ℝ) :
    realMP (4,1,0) x y z = (x^0*y^1*z^4 + x^0*y^4*z^1 + x^1*y^0*z^4 + x^1*y^4*z^0 + x^4*y^0*z^1 + x^4*y^1*z^0) / 6 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_320 :
    (orbit 3 2 0).card = 6 := by decide

@[local simp] private theorem realMP_expand_320 (x y z : ℝ) :
    realMP (3,2,0) x y z = (x^0*y^2*z^3 + x^0*y^3*z^2 + x^2*y^0*z^3 + x^2*y^3*z^0 + x^3*y^0*z^2 + x^3*y^2*z^0) / 6 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_311 :
    (orbit 3 1 1).card = 3 := by decide

@[local simp] private theorem realMP_expand_311 (x y z : ℝ) :
    realMP (3,1,1) x y z = (x^1*y^1*z^3 + x^1*y^3*z^1 + x^3*y^1*z^1) / 3 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_221 :
    (orbit 2 2 1).card = 3 := by decide

@[local simp] private theorem realMP_expand_221 (x y z : ℝ) :
    realMP (2,2,1) x y z = (x^1*y^2*z^2 + x^2*y^1*z^2 + x^2*y^2*z^1) / 3 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_600 :
    (orbit 6 0 0).card = 3 := by decide

@[local simp] private theorem realMP_expand_600 (x y z : ℝ) :
    realMP (6,0,0) x y z = (x^0*y^0*z^6 + x^0*y^6*z^0 + x^6*y^0*z^0) / 3 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_510 :
    (orbit 5 1 0).card = 6 := by decide

@[local simp] private theorem realMP_expand_510 (x y z : ℝ) :
    realMP (5,1,0) x y z = (x^0*y^1*z^5 + x^0*y^5*z^1 + x^1*y^0*z^5 + x^1*y^5*z^0 + x^5*y^0*z^1 + x^5*y^1*z^0) / 6 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_420 :
    (orbit 4 2 0).card = 6 := by decide

@[local simp] private theorem realMP_expand_420 (x y z : ℝ) :
    realMP (4,2,0) x y z = (x^0*y^2*z^4 + x^0*y^4*z^2 + x^2*y^0*z^4 + x^2*y^4*z^0 + x^4*y^0*z^2 + x^4*y^2*z^0) / 6 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_411 :
    (orbit 4 1 1).card = 3 := by decide

@[local simp] private theorem realMP_expand_411 (x y z : ℝ) :
    realMP (4,1,1) x y z = (x^1*y^1*z^4 + x^1*y^4*z^1 + x^4*y^1*z^1) / 3 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_330 :
    (orbit 3 3 0).card = 3 := by decide

@[local simp] private theorem realMP_expand_330 (x y z : ℝ) :
    realMP (3,3,0) x y z = (x^0*y^3*z^3 + x^3*y^0*z^3 + x^3*y^3*z^0) / 3 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_321 :
    (orbit 3 2 1).card = 6 := by decide

@[local simp] private theorem realMP_expand_321 (x y z : ℝ) :
    realMP (3,2,1) x y z = (x^1*y^2*z^3 + x^1*y^3*z^2 + x^2*y^1*z^3 + x^2*y^3*z^1 + x^3*y^1*z^2 + x^3*y^2*z^1) / 6 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]
  all_goals ring

@[local simp] private theorem orbit_card_222 :
    (orbit 2 2 2).card = 1 := by decide

@[local simp] private theorem realMP_expand_222 (x y z : ℝ) :
    realMP (2,2,2) x y z = (x^2*y^2*z^2) / 1 := by
  norm_num [realMP, realM, orbit, Finset.sum_insert, Finset.sum_singleton]

@[local simp] private theorem coefficientCount_000_000_000 :
    coefficientCount (0,0,0) (0,0,0) (0,0,0) = 1 := by decide

private theorem product_pair_000_000 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (0,0,0) x y z =
      ((partitions 0).map (fun c => realCoeff (0,0,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_100_100 :
    coefficientCount (0,0,0) (1,0,0) (1,0,0) = 1 := by decide

private theorem product_pair_000_100 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (1,0,0) x y z =
      ((partitions 1).map (fun c => realCoeff (0,0,0) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_200_200 :
    coefficientCount (0,0,0) (2,0,0) (2,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_000_200_110 :
    coefficientCount (0,0,0) (2,0,0) (1,1,0) = 0 := by decide

private theorem product_pair_000_200 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (2,0,0) x y z =
      ((partitions 2).map (fun c => realCoeff (0,0,0) (2,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_110_200 :
    coefficientCount (0,0,0) (1,1,0) (2,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_110_110 :
    coefficientCount (0,0,0) (1,1,0) (1,1,0) = 1 := by decide

private theorem product_pair_000_110 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (1,1,0) x y z =
      ((partitions 2).map (fun c => realCoeff (0,0,0) (1,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_300_300 :
    coefficientCount (0,0,0) (3,0,0) (3,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_000_300_210 :
    coefficientCount (0,0,0) (3,0,0) (2,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_300_111 :
    coefficientCount (0,0,0) (3,0,0) (1,1,1) = 0 := by decide

private theorem product_pair_000_300 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (3,0,0) x y z =
      ((partitions 3).map (fun c => realCoeff (0,0,0) (3,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_210_300 :
    coefficientCount (0,0,0) (2,1,0) (3,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_210_210 :
    coefficientCount (0,0,0) (2,1,0) (2,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_000_210_111 :
    coefficientCount (0,0,0) (2,1,0) (1,1,1) = 0 := by decide

private theorem product_pair_000_210 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (2,1,0) x y z =
      ((partitions 3).map (fun c => realCoeff (0,0,0) (2,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_111_300 :
    coefficientCount (0,0,0) (1,1,1) (3,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_111_210 :
    coefficientCount (0,0,0) (1,1,1) (2,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_111_111 :
    coefficientCount (0,0,0) (1,1,1) (1,1,1) = 1 := by decide

private theorem product_pair_000_111 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (1,1,1) x y z =
      ((partitions 3).map (fun c => realCoeff (0,0,0) (1,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_400_400 :
    coefficientCount (0,0,0) (4,0,0) (4,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_000_400_310 :
    coefficientCount (0,0,0) (4,0,0) (3,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_400_220 :
    coefficientCount (0,0,0) (4,0,0) (2,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_400_211 :
    coefficientCount (0,0,0) (4,0,0) (2,1,1) = 0 := by decide

private theorem product_pair_000_400 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (4,0,0) x y z =
      ((partitions 4).map (fun c => realCoeff (0,0,0) (4,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_310_400 :
    coefficientCount (0,0,0) (3,1,0) (4,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_310_310 :
    coefficientCount (0,0,0) (3,1,0) (3,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_000_310_220 :
    coefficientCount (0,0,0) (3,1,0) (2,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_310_211 :
    coefficientCount (0,0,0) (3,1,0) (2,1,1) = 0 := by decide

private theorem product_pair_000_310 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (3,1,0) x y z =
      ((partitions 4).map (fun c => realCoeff (0,0,0) (3,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_220_400 :
    coefficientCount (0,0,0) (2,2,0) (4,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_220_310 :
    coefficientCount (0,0,0) (2,2,0) (3,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_220_220 :
    coefficientCount (0,0,0) (2,2,0) (2,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_000_220_211 :
    coefficientCount (0,0,0) (2,2,0) (2,1,1) = 0 := by decide

private theorem product_pair_000_220 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (2,2,0) x y z =
      ((partitions 4).map (fun c => realCoeff (0,0,0) (2,2,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_211_400 :
    coefficientCount (0,0,0) (2,1,1) (4,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_211_310 :
    coefficientCount (0,0,0) (2,1,1) (3,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_211_220 :
    coefficientCount (0,0,0) (2,1,1) (2,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_211_211 :
    coefficientCount (0,0,0) (2,1,1) (2,1,1) = 1 := by decide

private theorem product_pair_000_211 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (2,1,1) x y z =
      ((partitions 4).map (fun c => realCoeff (0,0,0) (2,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_500_500 :
    coefficientCount (0,0,0) (5,0,0) (5,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_000_500_410 :
    coefficientCount (0,0,0) (5,0,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_500_320 :
    coefficientCount (0,0,0) (5,0,0) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_500_311 :
    coefficientCount (0,0,0) (5,0,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_500_221 :
    coefficientCount (0,0,0) (5,0,0) (2,2,1) = 0 := by decide

private theorem product_pair_000_500 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (5,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (0,0,0) (5,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_410_500 :
    coefficientCount (0,0,0) (4,1,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_410_410 :
    coefficientCount (0,0,0) (4,1,0) (4,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_000_410_320 :
    coefficientCount (0,0,0) (4,1,0) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_410_311 :
    coefficientCount (0,0,0) (4,1,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_410_221 :
    coefficientCount (0,0,0) (4,1,0) (2,2,1) = 0 := by decide

private theorem product_pair_000_410 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (4,1,0) x y z =
      ((partitions 5).map (fun c => realCoeff (0,0,0) (4,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_320_500 :
    coefficientCount (0,0,0) (3,2,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_320_410 :
    coefficientCount (0,0,0) (3,2,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_320_320 :
    coefficientCount (0,0,0) (3,2,0) (3,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_000_320_311 :
    coefficientCount (0,0,0) (3,2,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_320_221 :
    coefficientCount (0,0,0) (3,2,0) (2,2,1) = 0 := by decide

private theorem product_pair_000_320 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (3,2,0) x y z =
      ((partitions 5).map (fun c => realCoeff (0,0,0) (3,2,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_311_500 :
    coefficientCount (0,0,0) (3,1,1) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_311_410 :
    coefficientCount (0,0,0) (3,1,1) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_311_320 :
    coefficientCount (0,0,0) (3,1,1) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_311_311 :
    coefficientCount (0,0,0) (3,1,1) (3,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_000_311_221 :
    coefficientCount (0,0,0) (3,1,1) (2,2,1) = 0 := by decide

private theorem product_pair_000_311 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (3,1,1) x y z =
      ((partitions 5).map (fun c => realCoeff (0,0,0) (3,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_221_500 :
    coefficientCount (0,0,0) (2,2,1) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_221_410 :
    coefficientCount (0,0,0) (2,2,1) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_221_320 :
    coefficientCount (0,0,0) (2,2,1) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_221_311 :
    coefficientCount (0,0,0) (2,2,1) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_221_221 :
    coefficientCount (0,0,0) (2,2,1) (2,2,1) = 1 := by decide

private theorem product_pair_000_221 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (2,2,1) x y z =
      ((partitions 5).map (fun c => realCoeff (0,0,0) (2,2,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_600_600 :
    coefficientCount (0,0,0) (6,0,0) (6,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_000_600_510 :
    coefficientCount (0,0,0) (6,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_600_420 :
    coefficientCount (0,0,0) (6,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_600_411 :
    coefficientCount (0,0,0) (6,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_600_330 :
    coefficientCount (0,0,0) (6,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_600_321 :
    coefficientCount (0,0,0) (6,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_600_222 :
    coefficientCount (0,0,0) (6,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_000_600 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (6,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (0,0,0) (6,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_510_600 :
    coefficientCount (0,0,0) (5,1,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_510_510 :
    coefficientCount (0,0,0) (5,1,0) (5,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_000_510_420 :
    coefficientCount (0,0,0) (5,1,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_510_411 :
    coefficientCount (0,0,0) (5,1,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_510_330 :
    coefficientCount (0,0,0) (5,1,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_510_321 :
    coefficientCount (0,0,0) (5,1,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_510_222 :
    coefficientCount (0,0,0) (5,1,0) (2,2,2) = 0 := by decide

private theorem product_pair_000_510 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (5,1,0) x y z =
      ((partitions 6).map (fun c => realCoeff (0,0,0) (5,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_420_600 :
    coefficientCount (0,0,0) (4,2,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_420_510 :
    coefficientCount (0,0,0) (4,2,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_420_420 :
    coefficientCount (0,0,0) (4,2,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_000_420_411 :
    coefficientCount (0,0,0) (4,2,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_420_330 :
    coefficientCount (0,0,0) (4,2,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_420_321 :
    coefficientCount (0,0,0) (4,2,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_420_222 :
    coefficientCount (0,0,0) (4,2,0) (2,2,2) = 0 := by decide

private theorem product_pair_000_420 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (4,2,0) x y z =
      ((partitions 6).map (fun c => realCoeff (0,0,0) (4,2,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_411_600 :
    coefficientCount (0,0,0) (4,1,1) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_411_510 :
    coefficientCount (0,0,0) (4,1,1) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_411_420 :
    coefficientCount (0,0,0) (4,1,1) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_411_411 :
    coefficientCount (0,0,0) (4,1,1) (4,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_000_411_330 :
    coefficientCount (0,0,0) (4,1,1) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_411_321 :
    coefficientCount (0,0,0) (4,1,1) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_411_222 :
    coefficientCount (0,0,0) (4,1,1) (2,2,2) = 0 := by decide

private theorem product_pair_000_411 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (4,1,1) x y z =
      ((partitions 6).map (fun c => realCoeff (0,0,0) (4,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_330_600 :
    coefficientCount (0,0,0) (3,3,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_330_510 :
    coefficientCount (0,0,0) (3,3,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_330_420 :
    coefficientCount (0,0,0) (3,3,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_330_411 :
    coefficientCount (0,0,0) (3,3,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_330_330 :
    coefficientCount (0,0,0) (3,3,0) (3,3,0) = 1 := by decide

@[local simp] private theorem coefficientCount_000_330_321 :
    coefficientCount (0,0,0) (3,3,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_330_222 :
    coefficientCount (0,0,0) (3,3,0) (2,2,2) = 0 := by decide

private theorem product_pair_000_330 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (3,3,0) x y z =
      ((partitions 6).map (fun c => realCoeff (0,0,0) (3,3,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_321_600 :
    coefficientCount (0,0,0) (3,2,1) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_321_510 :
    coefficientCount (0,0,0) (3,2,1) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_321_420 :
    coefficientCount (0,0,0) (3,2,1) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_321_411 :
    coefficientCount (0,0,0) (3,2,1) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_321_330 :
    coefficientCount (0,0,0) (3,2,1) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_321_321 :
    coefficientCount (0,0,0) (3,2,1) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_000_321_222 :
    coefficientCount (0,0,0) (3,2,1) (2,2,2) = 0 := by decide

private theorem product_pair_000_321 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (3,2,1) x y z =
      ((partitions 6).map (fun c => realCoeff (0,0,0) (3,2,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_000_222_600 :
    coefficientCount (0,0,0) (2,2,2) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_222_510 :
    coefficientCount (0,0,0) (2,2,2) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_222_420 :
    coefficientCount (0,0,0) (2,2,2) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_222_411 :
    coefficientCount (0,0,0) (2,2,2) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_222_330 :
    coefficientCount (0,0,0) (2,2,2) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_000_222_321 :
    coefficientCount (0,0,0) (2,2,2) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_000_222_222 :
    coefficientCount (0,0,0) (2,2,2) (2,2,2) = 1 := by decide

private theorem product_pair_000_222 (x y z : ℝ) :
    realMP (0,0,0) x y z * realMP (2,2,2) x y z =
      ((partitions 6).map (fun c => realCoeff (0,0,0) (2,2,2) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_100_000_100 :
    coefficientCount (1,0,0) (0,0,0) (1,0,0) = 1 := by decide

private theorem product_pair_100_000 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (0,0,0) x y z =
      ((partitions 1).map (fun c => realCoeff (1,0,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_100_100_200 :
    coefficientCount (1,0,0) (1,0,0) (2,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_100_110 :
    coefficientCount (1,0,0) (1,0,0) (1,1,0) = 2 := by decide

private theorem product_pair_100_100 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (1,0,0) x y z =
      ((partitions 2).map (fun c => realCoeff (1,0,0) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_200_300 :
    coefficientCount (1,0,0) (2,0,0) (3,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_200_210 :
    coefficientCount (1,0,0) (2,0,0) (2,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_200_111 :
    coefficientCount (1,0,0) (2,0,0) (1,1,1) = 0 := by decide

private theorem product_pair_100_200 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (2,0,0) x y z =
      ((partitions 3).map (fun c => realCoeff (1,0,0) (2,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_110_300 :
    coefficientCount (1,0,0) (1,1,0) (3,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_110_210 :
    coefficientCount (1,0,0) (1,1,0) (2,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_110_111 :
    coefficientCount (1,0,0) (1,1,0) (1,1,1) = 3 := by decide

private theorem product_pair_100_110 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (1,1,0) x y z =
      ((partitions 3).map (fun c => realCoeff (1,0,0) (1,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_300_400 :
    coefficientCount (1,0,0) (3,0,0) (4,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_300_310 :
    coefficientCount (1,0,0) (3,0,0) (3,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_300_220 :
    coefficientCount (1,0,0) (3,0,0) (2,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_300_211 :
    coefficientCount (1,0,0) (3,0,0) (2,1,1) = 0 := by decide

private theorem product_pair_100_300 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (3,0,0) x y z =
      ((partitions 4).map (fun c => realCoeff (1,0,0) (3,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_210_400 :
    coefficientCount (1,0,0) (2,1,0) (4,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_210_310 :
    coefficientCount (1,0,0) (2,1,0) (3,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_210_220 :
    coefficientCount (1,0,0) (2,1,0) (2,2,0) = 2 := by decide

@[local simp] private theorem coefficientCount_100_210_211 :
    coefficientCount (1,0,0) (2,1,0) (2,1,1) = 2 := by decide

private theorem product_pair_100_210 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (2,1,0) x y z =
      ((partitions 4).map (fun c => realCoeff (1,0,0) (2,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_111_400 :
    coefficientCount (1,0,0) (1,1,1) (4,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_111_310 :
    coefficientCount (1,0,0) (1,1,1) (3,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_111_220 :
    coefficientCount (1,0,0) (1,1,1) (2,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_111_211 :
    coefficientCount (1,0,0) (1,1,1) (2,1,1) = 1 := by decide

private theorem product_pair_100_111 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (1,1,1) x y z =
      ((partitions 4).map (fun c => realCoeff (1,0,0) (1,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_400_500 :
    coefficientCount (1,0,0) (4,0,0) (5,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_400_410 :
    coefficientCount (1,0,0) (4,0,0) (4,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_400_320 :
    coefficientCount (1,0,0) (4,0,0) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_400_311 :
    coefficientCount (1,0,0) (4,0,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_100_400_221 :
    coefficientCount (1,0,0) (4,0,0) (2,2,1) = 0 := by decide

private theorem product_pair_100_400 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (4,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (1,0,0) (4,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_310_500 :
    coefficientCount (1,0,0) (3,1,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_310_410 :
    coefficientCount (1,0,0) (3,1,0) (4,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_310_320 :
    coefficientCount (1,0,0) (3,1,0) (3,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_310_311 :
    coefficientCount (1,0,0) (3,1,0) (3,1,1) = 2 := by decide

@[local simp] private theorem coefficientCount_100_310_221 :
    coefficientCount (1,0,0) (3,1,0) (2,2,1) = 0 := by decide

private theorem product_pair_100_310 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (3,1,0) x y z =
      ((partitions 5).map (fun c => realCoeff (1,0,0) (3,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_220_500 :
    coefficientCount (1,0,0) (2,2,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_220_410 :
    coefficientCount (1,0,0) (2,2,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_220_320 :
    coefficientCount (1,0,0) (2,2,0) (3,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_220_311 :
    coefficientCount (1,0,0) (2,2,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_100_220_221 :
    coefficientCount (1,0,0) (2,2,0) (2,2,1) = 1 := by decide

private theorem product_pair_100_220 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (2,2,0) x y z =
      ((partitions 5).map (fun c => realCoeff (1,0,0) (2,2,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_211_500 :
    coefficientCount (1,0,0) (2,1,1) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_211_410 :
    coefficientCount (1,0,0) (2,1,1) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_211_320 :
    coefficientCount (1,0,0) (2,1,1) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_211_311 :
    coefficientCount (1,0,0) (2,1,1) (3,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_100_211_221 :
    coefficientCount (1,0,0) (2,1,1) (2,2,1) = 2 := by decide

private theorem product_pair_100_211 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (2,1,1) x y z =
      ((partitions 5).map (fun c => realCoeff (1,0,0) (2,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_500_600 :
    coefficientCount (1,0,0) (5,0,0) (6,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_500_510 :
    coefficientCount (1,0,0) (5,0,0) (5,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_500_420 :
    coefficientCount (1,0,0) (5,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_500_411 :
    coefficientCount (1,0,0) (5,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_100_500_330 :
    coefficientCount (1,0,0) (5,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_500_321 :
    coefficientCount (1,0,0) (5,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_100_500_222 :
    coefficientCount (1,0,0) (5,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_100_500 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (5,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (1,0,0) (5,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_410_600 :
    coefficientCount (1,0,0) (4,1,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_410_510 :
    coefficientCount (1,0,0) (4,1,0) (5,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_410_420 :
    coefficientCount (1,0,0) (4,1,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_410_411 :
    coefficientCount (1,0,0) (4,1,0) (4,1,1) = 2 := by decide

@[local simp] private theorem coefficientCount_100_410_330 :
    coefficientCount (1,0,0) (4,1,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_410_321 :
    coefficientCount (1,0,0) (4,1,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_100_410_222 :
    coefficientCount (1,0,0) (4,1,0) (2,2,2) = 0 := by decide

private theorem product_pair_100_410 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (4,1,0) x y z =
      ((partitions 6).map (fun c => realCoeff (1,0,0) (4,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_320_600 :
    coefficientCount (1,0,0) (3,2,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_320_510 :
    coefficientCount (1,0,0) (3,2,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_320_420 :
    coefficientCount (1,0,0) (3,2,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_100_320_411 :
    coefficientCount (1,0,0) (3,2,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_100_320_330 :
    coefficientCount (1,0,0) (3,2,0) (3,3,0) = 2 := by decide

@[local simp] private theorem coefficientCount_100_320_321 :
    coefficientCount (1,0,0) (3,2,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_100_320_222 :
    coefficientCount (1,0,0) (3,2,0) (2,2,2) = 0 := by decide

private theorem product_pair_100_320 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (3,2,0) x y z =
      ((partitions 6).map (fun c => realCoeff (1,0,0) (3,2,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_311_600 :
    coefficientCount (1,0,0) (3,1,1) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_311_510 :
    coefficientCount (1,0,0) (3,1,1) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_311_420 :
    coefficientCount (1,0,0) (3,1,1) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_311_411 :
    coefficientCount (1,0,0) (3,1,1) (4,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_100_311_330 :
    coefficientCount (1,0,0) (3,1,1) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_311_321 :
    coefficientCount (1,0,0) (3,1,1) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_100_311_222 :
    coefficientCount (1,0,0) (3,1,1) (2,2,2) = 0 := by decide

private theorem product_pair_100_311 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (3,1,1) x y z =
      ((partitions 6).map (fun c => realCoeff (1,0,0) (3,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_100_221_600 :
    coefficientCount (1,0,0) (2,2,1) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_221_510 :
    coefficientCount (1,0,0) (2,2,1) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_221_420 :
    coefficientCount (1,0,0) (2,2,1) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_221_411 :
    coefficientCount (1,0,0) (2,2,1) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_100_221_330 :
    coefficientCount (1,0,0) (2,2,1) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_100_221_321 :
    coefficientCount (1,0,0) (2,2,1) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_100_221_222 :
    coefficientCount (1,0,0) (2,2,1) (2,2,2) = 3 := by decide

private theorem product_pair_100_221 (x y z : ℝ) :
    realMP (1,0,0) x y z * realMP (2,2,1) x y z =
      ((partitions 6).map (fun c => realCoeff (1,0,0) (2,2,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_200_000_200 :
    coefficientCount (2,0,0) (0,0,0) (2,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_200_000_110 :
    coefficientCount (2,0,0) (0,0,0) (1,1,0) = 0 := by decide

private theorem product_pair_200_000 (x y z : ℝ) :
    realMP (2,0,0) x y z * realMP (0,0,0) x y z =
      ((partitions 2).map (fun c => realCoeff (2,0,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_110_000_200 :
    coefficientCount (1,1,0) (0,0,0) (2,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_000_110 :
    coefficientCount (1,1,0) (0,0,0) (1,1,0) = 1 := by decide

private theorem product_pair_110_000 (x y z : ℝ) :
    realMP (1,1,0) x y z * realMP (0,0,0) x y z =
      ((partitions 2).map (fun c => realCoeff (1,1,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_200_100_300 :
    coefficientCount (2,0,0) (1,0,0) (3,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_200_100_210 :
    coefficientCount (2,0,0) (1,0,0) (2,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_200_100_111 :
    coefficientCount (2,0,0) (1,0,0) (1,1,1) = 0 := by decide

private theorem product_pair_200_100 (x y z : ℝ) :
    realMP (2,0,0) x y z * realMP (1,0,0) x y z =
      ((partitions 3).map (fun c => realCoeff (2,0,0) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_110_100_300 :
    coefficientCount (1,1,0) (1,0,0) (3,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_100_210 :
    coefficientCount (1,1,0) (1,0,0) (2,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_110_100_111 :
    coefficientCount (1,1,0) (1,0,0) (1,1,1) = 3 := by decide

private theorem product_pair_110_100 (x y z : ℝ) :
    realMP (1,1,0) x y z * realMP (1,0,0) x y z =
      ((partitions 3).map (fun c => realCoeff (1,1,0) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_200_200_400 :
    coefficientCount (2,0,0) (2,0,0) (4,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_200_200_310 :
    coefficientCount (2,0,0) (2,0,0) (3,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_200_220 :
    coefficientCount (2,0,0) (2,0,0) (2,2,0) = 2 := by decide

@[local simp] private theorem coefficientCount_200_200_211 :
    coefficientCount (2,0,0) (2,0,0) (2,1,1) = 0 := by decide

private theorem product_pair_200_200 (x y z : ℝ) :
    realMP (2,0,0) x y z * realMP (2,0,0) x y z =
      ((partitions 4).map (fun c => realCoeff (2,0,0) (2,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_200_110_400 :
    coefficientCount (2,0,0) (1,1,0) (4,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_110_310 :
    coefficientCount (2,0,0) (1,1,0) (3,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_200_110_220 :
    coefficientCount (2,0,0) (1,1,0) (2,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_110_211 :
    coefficientCount (2,0,0) (1,1,0) (2,1,1) = 1 := by decide

private theorem product_pair_200_110 (x y z : ℝ) :
    realMP (2,0,0) x y z * realMP (1,1,0) x y z =
      ((partitions 4).map (fun c => realCoeff (2,0,0) (1,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_110_200_400 :
    coefficientCount (1,1,0) (2,0,0) (4,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_200_310 :
    coefficientCount (1,1,0) (2,0,0) (3,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_110_200_220 :
    coefficientCount (1,1,0) (2,0,0) (2,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_200_211 :
    coefficientCount (1,1,0) (2,0,0) (2,1,1) = 1 := by decide

private theorem product_pair_110_200 (x y z : ℝ) :
    realMP (1,1,0) x y z * realMP (2,0,0) x y z =
      ((partitions 4).map (fun c => realCoeff (1,1,0) (2,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_110_110_400 :
    coefficientCount (1,1,0) (1,1,0) (4,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_110_310 :
    coefficientCount (1,1,0) (1,1,0) (3,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_110_220 :
    coefficientCount (1,1,0) (1,1,0) (2,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_110_110_211 :
    coefficientCount (1,1,0) (1,1,0) (2,1,1) = 2 := by decide

private theorem product_pair_110_110 (x y z : ℝ) :
    realMP (1,1,0) x y z * realMP (1,1,0) x y z =
      ((partitions 4).map (fun c => realCoeff (1,1,0) (1,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_200_300_500 :
    coefficientCount (2,0,0) (3,0,0) (5,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_200_300_410 :
    coefficientCount (2,0,0) (3,0,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_300_320 :
    coefficientCount (2,0,0) (3,0,0) (3,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_200_300_311 :
    coefficientCount (2,0,0) (3,0,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_200_300_221 :
    coefficientCount (2,0,0) (3,0,0) (2,2,1) = 0 := by decide

private theorem product_pair_200_300 (x y z : ℝ) :
    realMP (2,0,0) x y z * realMP (3,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (2,0,0) (3,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_200_210_500 :
    coefficientCount (2,0,0) (2,1,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_210_410 :
    coefficientCount (2,0,0) (2,1,0) (4,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_200_210_320 :
    coefficientCount (2,0,0) (2,1,0) (3,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_200_210_311 :
    coefficientCount (2,0,0) (2,1,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_200_210_221 :
    coefficientCount (2,0,0) (2,1,0) (2,2,1) = 2 := by decide

private theorem product_pair_200_210 (x y z : ℝ) :
    realMP (2,0,0) x y z * realMP (2,1,0) x y z =
      ((partitions 5).map (fun c => realCoeff (2,0,0) (2,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_200_111_500 :
    coefficientCount (2,0,0) (1,1,1) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_111_410 :
    coefficientCount (2,0,0) (1,1,1) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_111_320 :
    coefficientCount (2,0,0) (1,1,1) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_111_311 :
    coefficientCount (2,0,0) (1,1,1) (3,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_200_111_221 :
    coefficientCount (2,0,0) (1,1,1) (2,2,1) = 0 := by decide

private theorem product_pair_200_111 (x y z : ℝ) :
    realMP (2,0,0) x y z * realMP (1,1,1) x y z =
      ((partitions 5).map (fun c => realCoeff (2,0,0) (1,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_110_300_500 :
    coefficientCount (1,1,0) (3,0,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_300_410 :
    coefficientCount (1,1,0) (3,0,0) (4,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_110_300_320 :
    coefficientCount (1,1,0) (3,0,0) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_300_311 :
    coefficientCount (1,1,0) (3,0,0) (3,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_110_300_221 :
    coefficientCount (1,1,0) (3,0,0) (2,2,1) = 0 := by decide

private theorem product_pair_110_300 (x y z : ℝ) :
    realMP (1,1,0) x y z * realMP (3,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (1,1,0) (3,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_110_210_500 :
    coefficientCount (1,1,0) (2,1,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_210_410 :
    coefficientCount (1,1,0) (2,1,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_210_320 :
    coefficientCount (1,1,0) (2,1,0) (3,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_110_210_311 :
    coefficientCount (1,1,0) (2,1,0) (3,1,1) = 2 := by decide

@[local simp] private theorem coefficientCount_110_210_221 :
    coefficientCount (1,1,0) (2,1,0) (2,2,1) = 2 := by decide

private theorem product_pair_110_210 (x y z : ℝ) :
    realMP (1,1,0) x y z * realMP (2,1,0) x y z =
      ((partitions 5).map (fun c => realCoeff (1,1,0) (2,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_110_111_500 :
    coefficientCount (1,1,0) (1,1,1) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_111_410 :
    coefficientCount (1,1,0) (1,1,1) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_111_320 :
    coefficientCount (1,1,0) (1,1,1) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_111_311 :
    coefficientCount (1,1,0) (1,1,1) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_110_111_221 :
    coefficientCount (1,1,0) (1,1,1) (2,2,1) = 1 := by decide

private theorem product_pair_110_111 (x y z : ℝ) :
    realMP (1,1,0) x y z * realMP (1,1,1) x y z =
      ((partitions 5).map (fun c => realCoeff (1,1,0) (1,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_200_400_600 :
    coefficientCount (2,0,0) (4,0,0) (6,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_200_400_510 :
    coefficientCount (2,0,0) (4,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_400_420 :
    coefficientCount (2,0,0) (4,0,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_200_400_411 :
    coefficientCount (2,0,0) (4,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_200_400_330 :
    coefficientCount (2,0,0) (4,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_400_321 :
    coefficientCount (2,0,0) (4,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_200_400_222 :
    coefficientCount (2,0,0) (4,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_200_400 (x y z : ℝ) :
    realMP (2,0,0) x y z * realMP (4,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (2,0,0) (4,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_200_310_600 :
    coefficientCount (2,0,0) (3,1,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_310_510 :
    coefficientCount (2,0,0) (3,1,0) (5,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_200_310_420 :
    coefficientCount (2,0,0) (3,1,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_310_411 :
    coefficientCount (2,0,0) (3,1,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_200_310_330 :
    coefficientCount (2,0,0) (3,1,0) (3,3,0) = 2 := by decide

@[local simp] private theorem coefficientCount_200_310_321 :
    coefficientCount (2,0,0) (3,1,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_200_310_222 :
    coefficientCount (2,0,0) (3,1,0) (2,2,2) = 0 := by decide

private theorem product_pair_200_310 (x y z : ℝ) :
    realMP (2,0,0) x y z * realMP (3,1,0) x y z =
      ((partitions 6).map (fun c => realCoeff (2,0,0) (3,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_200_220_600 :
    coefficientCount (2,0,0) (2,2,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_220_510 :
    coefficientCount (2,0,0) (2,2,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_220_420 :
    coefficientCount (2,0,0) (2,2,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_200_220_411 :
    coefficientCount (2,0,0) (2,2,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_200_220_330 :
    coefficientCount (2,0,0) (2,2,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_220_321 :
    coefficientCount (2,0,0) (2,2,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_200_220_222 :
    coefficientCount (2,0,0) (2,2,0) (2,2,2) = 3 := by decide

private theorem product_pair_200_220 (x y z : ℝ) :
    realMP (2,0,0) x y z * realMP (2,2,0) x y z =
      ((partitions 6).map (fun c => realCoeff (2,0,0) (2,2,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_200_211_600 :
    coefficientCount (2,0,0) (2,1,1) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_211_510 :
    coefficientCount (2,0,0) (2,1,1) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_211_420 :
    coefficientCount (2,0,0) (2,1,1) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_211_411 :
    coefficientCount (2,0,0) (2,1,1) (4,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_200_211_330 :
    coefficientCount (2,0,0) (2,1,1) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_200_211_321 :
    coefficientCount (2,0,0) (2,1,1) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_200_211_222 :
    coefficientCount (2,0,0) (2,1,1) (2,2,2) = 0 := by decide

private theorem product_pair_200_211 (x y z : ℝ) :
    realMP (2,0,0) x y z * realMP (2,1,1) x y z =
      ((partitions 6).map (fun c => realCoeff (2,0,0) (2,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_110_400_600 :
    coefficientCount (1,1,0) (4,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_400_510 :
    coefficientCount (1,1,0) (4,0,0) (5,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_110_400_420 :
    coefficientCount (1,1,0) (4,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_400_411 :
    coefficientCount (1,1,0) (4,0,0) (4,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_110_400_330 :
    coefficientCount (1,1,0) (4,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_400_321 :
    coefficientCount (1,1,0) (4,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_110_400_222 :
    coefficientCount (1,1,0) (4,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_110_400 (x y z : ℝ) :
    realMP (1,1,0) x y z * realMP (4,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (1,1,0) (4,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_110_310_600 :
    coefficientCount (1,1,0) (3,1,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_310_510 :
    coefficientCount (1,1,0) (3,1,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_310_420 :
    coefficientCount (1,1,0) (3,1,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_110_310_411 :
    coefficientCount (1,1,0) (3,1,0) (4,1,1) = 2 := by decide

@[local simp] private theorem coefficientCount_110_310_330 :
    coefficientCount (1,1,0) (3,1,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_310_321 :
    coefficientCount (1,1,0) (3,1,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_110_310_222 :
    coefficientCount (1,1,0) (3,1,0) (2,2,2) = 0 := by decide

private theorem product_pair_110_310 (x y z : ℝ) :
    realMP (1,1,0) x y z * realMP (3,1,0) x y z =
      ((partitions 6).map (fun c => realCoeff (1,1,0) (3,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_110_220_600 :
    coefficientCount (1,1,0) (2,2,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_220_510 :
    coefficientCount (1,1,0) (2,2,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_220_420 :
    coefficientCount (1,1,0) (2,2,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_220_411 :
    coefficientCount (1,1,0) (2,2,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_110_220_330 :
    coefficientCount (1,1,0) (2,2,0) (3,3,0) = 1 := by decide

@[local simp] private theorem coefficientCount_110_220_321 :
    coefficientCount (1,1,0) (2,2,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_110_220_222 :
    coefficientCount (1,1,0) (2,2,0) (2,2,2) = 0 := by decide

private theorem product_pair_110_220 (x y z : ℝ) :
    realMP (1,1,0) x y z * realMP (2,2,0) x y z =
      ((partitions 6).map (fun c => realCoeff (1,1,0) (2,2,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_110_211_600 :
    coefficientCount (1,1,0) (2,1,1) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_211_510 :
    coefficientCount (1,1,0) (2,1,1) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_211_420 :
    coefficientCount (1,1,0) (2,1,1) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_211_411 :
    coefficientCount (1,1,0) (2,1,1) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_110_211_330 :
    coefficientCount (1,1,0) (2,1,1) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_110_211_321 :
    coefficientCount (1,1,0) (2,1,1) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_110_211_222 :
    coefficientCount (1,1,0) (2,1,1) (2,2,2) = 3 := by decide

private theorem product_pair_110_211 (x y z : ℝ) :
    realMP (1,1,0) x y z * realMP (2,1,1) x y z =
      ((partitions 6).map (fun c => realCoeff (1,1,0) (2,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_300_000_300 :
    coefficientCount (3,0,0) (0,0,0) (3,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_300_000_210 :
    coefficientCount (3,0,0) (0,0,0) (2,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_300_000_111 :
    coefficientCount (3,0,0) (0,0,0) (1,1,1) = 0 := by decide

private theorem product_pair_300_000 (x y z : ℝ) :
    realMP (3,0,0) x y z * realMP (0,0,0) x y z =
      ((partitions 3).map (fun c => realCoeff (3,0,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_210_000_300 :
    coefficientCount (2,1,0) (0,0,0) (3,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_210_000_210 :
    coefficientCount (2,1,0) (0,0,0) (2,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_210_000_111 :
    coefficientCount (2,1,0) (0,0,0) (1,1,1) = 0 := by decide

private theorem product_pair_210_000 (x y z : ℝ) :
    realMP (2,1,0) x y z * realMP (0,0,0) x y z =
      ((partitions 3).map (fun c => realCoeff (2,1,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_111_000_300 :
    coefficientCount (1,1,1) (0,0,0) (3,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_000_210 :
    coefficientCount (1,1,1) (0,0,0) (2,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_000_111 :
    coefficientCount (1,1,1) (0,0,0) (1,1,1) = 1 := by decide

private theorem product_pair_111_000 (x y z : ℝ) :
    realMP (1,1,1) x y z * realMP (0,0,0) x y z =
      ((partitions 3).map (fun c => realCoeff (1,1,1) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_300_100_400 :
    coefficientCount (3,0,0) (1,0,0) (4,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_300_100_310 :
    coefficientCount (3,0,0) (1,0,0) (3,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_300_100_220 :
    coefficientCount (3,0,0) (1,0,0) (2,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_300_100_211 :
    coefficientCount (3,0,0) (1,0,0) (2,1,1) = 0 := by decide

private theorem product_pair_300_100 (x y z : ℝ) :
    realMP (3,0,0) x y z * realMP (1,0,0) x y z =
      ((partitions 4).map (fun c => realCoeff (3,0,0) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_210_100_400 :
    coefficientCount (2,1,0) (1,0,0) (4,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_210_100_310 :
    coefficientCount (2,1,0) (1,0,0) (3,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_210_100_220 :
    coefficientCount (2,1,0) (1,0,0) (2,2,0) = 2 := by decide

@[local simp] private theorem coefficientCount_210_100_211 :
    coefficientCount (2,1,0) (1,0,0) (2,1,1) = 2 := by decide

private theorem product_pair_210_100 (x y z : ℝ) :
    realMP (2,1,0) x y z * realMP (1,0,0) x y z =
      ((partitions 4).map (fun c => realCoeff (2,1,0) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_111_100_400 :
    coefficientCount (1,1,1) (1,0,0) (4,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_100_310 :
    coefficientCount (1,1,1) (1,0,0) (3,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_100_220 :
    coefficientCount (1,1,1) (1,0,0) (2,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_100_211 :
    coefficientCount (1,1,1) (1,0,0) (2,1,1) = 1 := by decide

private theorem product_pair_111_100 (x y z : ℝ) :
    realMP (1,1,1) x y z * realMP (1,0,0) x y z =
      ((partitions 4).map (fun c => realCoeff (1,1,1) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_300_200_500 :
    coefficientCount (3,0,0) (2,0,0) (5,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_300_200_410 :
    coefficientCount (3,0,0) (2,0,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_300_200_320 :
    coefficientCount (3,0,0) (2,0,0) (3,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_300_200_311 :
    coefficientCount (3,0,0) (2,0,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_300_200_221 :
    coefficientCount (3,0,0) (2,0,0) (2,2,1) = 0 := by decide

private theorem product_pair_300_200 (x y z : ℝ) :
    realMP (3,0,0) x y z * realMP (2,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (3,0,0) (2,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_300_110_500 :
    coefficientCount (3,0,0) (1,1,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_300_110_410 :
    coefficientCount (3,0,0) (1,1,0) (4,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_300_110_320 :
    coefficientCount (3,0,0) (1,1,0) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_300_110_311 :
    coefficientCount (3,0,0) (1,1,0) (3,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_300_110_221 :
    coefficientCount (3,0,0) (1,1,0) (2,2,1) = 0 := by decide

private theorem product_pair_300_110 (x y z : ℝ) :
    realMP (3,0,0) x y z * realMP (1,1,0) x y z =
      ((partitions 5).map (fun c => realCoeff (3,0,0) (1,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_210_200_500 :
    coefficientCount (2,1,0) (2,0,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_210_200_410 :
    coefficientCount (2,1,0) (2,0,0) (4,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_210_200_320 :
    coefficientCount (2,1,0) (2,0,0) (3,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_210_200_311 :
    coefficientCount (2,1,0) (2,0,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_210_200_221 :
    coefficientCount (2,1,0) (2,0,0) (2,2,1) = 2 := by decide

private theorem product_pair_210_200 (x y z : ℝ) :
    realMP (2,1,0) x y z * realMP (2,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (2,1,0) (2,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_210_110_500 :
    coefficientCount (2,1,0) (1,1,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_210_110_410 :
    coefficientCount (2,1,0) (1,1,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_210_110_320 :
    coefficientCount (2,1,0) (1,1,0) (3,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_210_110_311 :
    coefficientCount (2,1,0) (1,1,0) (3,1,1) = 2 := by decide

@[local simp] private theorem coefficientCount_210_110_221 :
    coefficientCount (2,1,0) (1,1,0) (2,2,1) = 2 := by decide

private theorem product_pair_210_110 (x y z : ℝ) :
    realMP (2,1,0) x y z * realMP (1,1,0) x y z =
      ((partitions 5).map (fun c => realCoeff (2,1,0) (1,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_111_200_500 :
    coefficientCount (1,1,1) (2,0,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_200_410 :
    coefficientCount (1,1,1) (2,0,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_200_320 :
    coefficientCount (1,1,1) (2,0,0) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_200_311 :
    coefficientCount (1,1,1) (2,0,0) (3,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_111_200_221 :
    coefficientCount (1,1,1) (2,0,0) (2,2,1) = 0 := by decide

private theorem product_pair_111_200 (x y z : ℝ) :
    realMP (1,1,1) x y z * realMP (2,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (1,1,1) (2,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_111_110_500 :
    coefficientCount (1,1,1) (1,1,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_110_410 :
    coefficientCount (1,1,1) (1,1,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_110_320 :
    coefficientCount (1,1,1) (1,1,0) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_110_311 :
    coefficientCount (1,1,1) (1,1,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_111_110_221 :
    coefficientCount (1,1,1) (1,1,0) (2,2,1) = 1 := by decide

private theorem product_pair_111_110 (x y z : ℝ) :
    realMP (1,1,1) x y z * realMP (1,1,0) x y z =
      ((partitions 5).map (fun c => realCoeff (1,1,1) (1,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_300_300_600 :
    coefficientCount (3,0,0) (3,0,0) (6,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_300_300_510 :
    coefficientCount (3,0,0) (3,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_300_300_420 :
    coefficientCount (3,0,0) (3,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_300_300_411 :
    coefficientCount (3,0,0) (3,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_300_300_330 :
    coefficientCount (3,0,0) (3,0,0) (3,3,0) = 2 := by decide

@[local simp] private theorem coefficientCount_300_300_321 :
    coefficientCount (3,0,0) (3,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_300_300_222 :
    coefficientCount (3,0,0) (3,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_300_300 (x y z : ℝ) :
    realMP (3,0,0) x y z * realMP (3,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (3,0,0) (3,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_300_210_600 :
    coefficientCount (3,0,0) (2,1,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_300_210_510 :
    coefficientCount (3,0,0) (2,1,0) (5,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_300_210_420 :
    coefficientCount (3,0,0) (2,1,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_300_210_411 :
    coefficientCount (3,0,0) (2,1,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_300_210_330 :
    coefficientCount (3,0,0) (2,1,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_300_210_321 :
    coefficientCount (3,0,0) (2,1,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_300_210_222 :
    coefficientCount (3,0,0) (2,1,0) (2,2,2) = 0 := by decide

private theorem product_pair_300_210 (x y z : ℝ) :
    realMP (3,0,0) x y z * realMP (2,1,0) x y z =
      ((partitions 6).map (fun c => realCoeff (3,0,0) (2,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_300_111_600 :
    coefficientCount (3,0,0) (1,1,1) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_300_111_510 :
    coefficientCount (3,0,0) (1,1,1) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_300_111_420 :
    coefficientCount (3,0,0) (1,1,1) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_300_111_411 :
    coefficientCount (3,0,0) (1,1,1) (4,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_300_111_330 :
    coefficientCount (3,0,0) (1,1,1) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_300_111_321 :
    coefficientCount (3,0,0) (1,1,1) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_300_111_222 :
    coefficientCount (3,0,0) (1,1,1) (2,2,2) = 0 := by decide

private theorem product_pair_300_111 (x y z : ℝ) :
    realMP (3,0,0) x y z * realMP (1,1,1) x y z =
      ((partitions 6).map (fun c => realCoeff (3,0,0) (1,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_210_300_600 :
    coefficientCount (2,1,0) (3,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_210_300_510 :
    coefficientCount (2,1,0) (3,0,0) (5,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_210_300_420 :
    coefficientCount (2,1,0) (3,0,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_210_300_411 :
    coefficientCount (2,1,0) (3,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_210_300_330 :
    coefficientCount (2,1,0) (3,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_210_300_321 :
    coefficientCount (2,1,0) (3,0,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_210_300_222 :
    coefficientCount (2,1,0) (3,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_210_300 (x y z : ℝ) :
    realMP (2,1,0) x y z * realMP (3,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (2,1,0) (3,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_210_210_600 :
    coefficientCount (2,1,0) (2,1,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_210_210_510 :
    coefficientCount (2,1,0) (2,1,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_210_210_420 :
    coefficientCount (2,1,0) (2,1,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_210_210_411 :
    coefficientCount (2,1,0) (2,1,0) (4,1,1) = 2 := by decide

@[local simp] private theorem coefficientCount_210_210_330 :
    coefficientCount (2,1,0) (2,1,0) (3,3,0) = 2 := by decide

@[local simp] private theorem coefficientCount_210_210_321 :
    coefficientCount (2,1,0) (2,1,0) (3,2,1) = 2 := by decide

@[local simp] private theorem coefficientCount_210_210_222 :
    coefficientCount (2,1,0) (2,1,0) (2,2,2) = 6 := by decide

private theorem product_pair_210_210 (x y z : ℝ) :
    realMP (2,1,0) x y z * realMP (2,1,0) x y z =
      ((partitions 6).map (fun c => realCoeff (2,1,0) (2,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_210_111_600 :
    coefficientCount (2,1,0) (1,1,1) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_210_111_510 :
    coefficientCount (2,1,0) (1,1,1) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_210_111_420 :
    coefficientCount (2,1,0) (1,1,1) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_210_111_411 :
    coefficientCount (2,1,0) (1,1,1) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_210_111_330 :
    coefficientCount (2,1,0) (1,1,1) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_210_111_321 :
    coefficientCount (2,1,0) (1,1,1) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_210_111_222 :
    coefficientCount (2,1,0) (1,1,1) (2,2,2) = 0 := by decide

private theorem product_pair_210_111 (x y z : ℝ) :
    realMP (2,1,0) x y z * realMP (1,1,1) x y z =
      ((partitions 6).map (fun c => realCoeff (2,1,0) (1,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_111_300_600 :
    coefficientCount (1,1,1) (3,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_300_510 :
    coefficientCount (1,1,1) (3,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_300_420 :
    coefficientCount (1,1,1) (3,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_300_411 :
    coefficientCount (1,1,1) (3,0,0) (4,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_111_300_330 :
    coefficientCount (1,1,1) (3,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_300_321 :
    coefficientCount (1,1,1) (3,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_111_300_222 :
    coefficientCount (1,1,1) (3,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_111_300 (x y z : ℝ) :
    realMP (1,1,1) x y z * realMP (3,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (1,1,1) (3,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_111_210_600 :
    coefficientCount (1,1,1) (2,1,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_210_510 :
    coefficientCount (1,1,1) (2,1,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_210_420 :
    coefficientCount (1,1,1) (2,1,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_210_411 :
    coefficientCount (1,1,1) (2,1,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_111_210_330 :
    coefficientCount (1,1,1) (2,1,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_210_321 :
    coefficientCount (1,1,1) (2,1,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_111_210_222 :
    coefficientCount (1,1,1) (2,1,0) (2,2,2) = 0 := by decide

private theorem product_pair_111_210 (x y z : ℝ) :
    realMP (1,1,1) x y z * realMP (2,1,0) x y z =
      ((partitions 6).map (fun c => realCoeff (1,1,1) (2,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_111_111_600 :
    coefficientCount (1,1,1) (1,1,1) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_111_510 :
    coefficientCount (1,1,1) (1,1,1) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_111_420 :
    coefficientCount (1,1,1) (1,1,1) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_111_411 :
    coefficientCount (1,1,1) (1,1,1) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_111_111_330 :
    coefficientCount (1,1,1) (1,1,1) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_111_111_321 :
    coefficientCount (1,1,1) (1,1,1) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_111_111_222 :
    coefficientCount (1,1,1) (1,1,1) (2,2,2) = 1 := by decide

private theorem product_pair_111_111 (x y z : ℝ) :
    realMP (1,1,1) x y z * realMP (1,1,1) x y z =
      ((partitions 6).map (fun c => realCoeff (1,1,1) (1,1,1) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_400_000_400 :
    coefficientCount (4,0,0) (0,0,0) (4,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_400_000_310 :
    coefficientCount (4,0,0) (0,0,0) (3,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_400_000_220 :
    coefficientCount (4,0,0) (0,0,0) (2,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_400_000_211 :
    coefficientCount (4,0,0) (0,0,0) (2,1,1) = 0 := by decide

private theorem product_pair_400_000 (x y z : ℝ) :
    realMP (4,0,0) x y z * realMP (0,0,0) x y z =
      ((partitions 4).map (fun c => realCoeff (4,0,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_310_000_400 :
    coefficientCount (3,1,0) (0,0,0) (4,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_310_000_310 :
    coefficientCount (3,1,0) (0,0,0) (3,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_310_000_220 :
    coefficientCount (3,1,0) (0,0,0) (2,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_310_000_211 :
    coefficientCount (3,1,0) (0,0,0) (2,1,1) = 0 := by decide

private theorem product_pair_310_000 (x y z : ℝ) :
    realMP (3,1,0) x y z * realMP (0,0,0) x y z =
      ((partitions 4).map (fun c => realCoeff (3,1,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_220_000_400 :
    coefficientCount (2,2,0) (0,0,0) (4,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_220_000_310 :
    coefficientCount (2,2,0) (0,0,0) (3,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_220_000_220 :
    coefficientCount (2,2,0) (0,0,0) (2,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_220_000_211 :
    coefficientCount (2,2,0) (0,0,0) (2,1,1) = 0 := by decide

private theorem product_pair_220_000 (x y z : ℝ) :
    realMP (2,2,0) x y z * realMP (0,0,0) x y z =
      ((partitions 4).map (fun c => realCoeff (2,2,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_211_000_400 :
    coefficientCount (2,1,1) (0,0,0) (4,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_000_310 :
    coefficientCount (2,1,1) (0,0,0) (3,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_000_220 :
    coefficientCount (2,1,1) (0,0,0) (2,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_000_211 :
    coefficientCount (2,1,1) (0,0,0) (2,1,1) = 1 := by decide

private theorem product_pair_211_000 (x y z : ℝ) :
    realMP (2,1,1) x y z * realMP (0,0,0) x y z =
      ((partitions 4).map (fun c => realCoeff (2,1,1) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_400_100_500 :
    coefficientCount (4,0,0) (1,0,0) (5,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_400_100_410 :
    coefficientCount (4,0,0) (1,0,0) (4,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_400_100_320 :
    coefficientCount (4,0,0) (1,0,0) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_400_100_311 :
    coefficientCount (4,0,0) (1,0,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_400_100_221 :
    coefficientCount (4,0,0) (1,0,0) (2,2,1) = 0 := by decide

private theorem product_pair_400_100 (x y z : ℝ) :
    realMP (4,0,0) x y z * realMP (1,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (4,0,0) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_310_100_500 :
    coefficientCount (3,1,0) (1,0,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_310_100_410 :
    coefficientCount (3,1,0) (1,0,0) (4,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_310_100_320 :
    coefficientCount (3,1,0) (1,0,0) (3,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_310_100_311 :
    coefficientCount (3,1,0) (1,0,0) (3,1,1) = 2 := by decide

@[local simp] private theorem coefficientCount_310_100_221 :
    coefficientCount (3,1,0) (1,0,0) (2,2,1) = 0 := by decide

private theorem product_pair_310_100 (x y z : ℝ) :
    realMP (3,1,0) x y z * realMP (1,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (3,1,0) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_220_100_500 :
    coefficientCount (2,2,0) (1,0,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_220_100_410 :
    coefficientCount (2,2,0) (1,0,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_220_100_320 :
    coefficientCount (2,2,0) (1,0,0) (3,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_220_100_311 :
    coefficientCount (2,2,0) (1,0,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_220_100_221 :
    coefficientCount (2,2,0) (1,0,0) (2,2,1) = 1 := by decide

private theorem product_pair_220_100 (x y z : ℝ) :
    realMP (2,2,0) x y z * realMP (1,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (2,2,0) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_211_100_500 :
    coefficientCount (2,1,1) (1,0,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_100_410 :
    coefficientCount (2,1,1) (1,0,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_100_320 :
    coefficientCount (2,1,1) (1,0,0) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_100_311 :
    coefficientCount (2,1,1) (1,0,0) (3,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_211_100_221 :
    coefficientCount (2,1,1) (1,0,0) (2,2,1) = 2 := by decide

private theorem product_pair_211_100 (x y z : ℝ) :
    realMP (2,1,1) x y z * realMP (1,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (2,1,1) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_400_200_600 :
    coefficientCount (4,0,0) (2,0,0) (6,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_400_200_510 :
    coefficientCount (4,0,0) (2,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_400_200_420 :
    coefficientCount (4,0,0) (2,0,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_400_200_411 :
    coefficientCount (4,0,0) (2,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_400_200_330 :
    coefficientCount (4,0,0) (2,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_400_200_321 :
    coefficientCount (4,0,0) (2,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_400_200_222 :
    coefficientCount (4,0,0) (2,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_400_200 (x y z : ℝ) :
    realMP (4,0,0) x y z * realMP (2,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (4,0,0) (2,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_400_110_600 :
    coefficientCount (4,0,0) (1,1,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_400_110_510 :
    coefficientCount (4,0,0) (1,1,0) (5,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_400_110_420 :
    coefficientCount (4,0,0) (1,1,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_400_110_411 :
    coefficientCount (4,0,0) (1,1,0) (4,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_400_110_330 :
    coefficientCount (4,0,0) (1,1,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_400_110_321 :
    coefficientCount (4,0,0) (1,1,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_400_110_222 :
    coefficientCount (4,0,0) (1,1,0) (2,2,2) = 0 := by decide

private theorem product_pair_400_110 (x y z : ℝ) :
    realMP (4,0,0) x y z * realMP (1,1,0) x y z =
      ((partitions 6).map (fun c => realCoeff (4,0,0) (1,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_310_200_600 :
    coefficientCount (3,1,0) (2,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_310_200_510 :
    coefficientCount (3,1,0) (2,0,0) (5,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_310_200_420 :
    coefficientCount (3,1,0) (2,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_310_200_411 :
    coefficientCount (3,1,0) (2,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_310_200_330 :
    coefficientCount (3,1,0) (2,0,0) (3,3,0) = 2 := by decide

@[local simp] private theorem coefficientCount_310_200_321 :
    coefficientCount (3,1,0) (2,0,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_310_200_222 :
    coefficientCount (3,1,0) (2,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_310_200 (x y z : ℝ) :
    realMP (3,1,0) x y z * realMP (2,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (3,1,0) (2,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_310_110_600 :
    coefficientCount (3,1,0) (1,1,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_310_110_510 :
    coefficientCount (3,1,0) (1,1,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_310_110_420 :
    coefficientCount (3,1,0) (1,1,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_310_110_411 :
    coefficientCount (3,1,0) (1,1,0) (4,1,1) = 2 := by decide

@[local simp] private theorem coefficientCount_310_110_330 :
    coefficientCount (3,1,0) (1,1,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_310_110_321 :
    coefficientCount (3,1,0) (1,1,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_310_110_222 :
    coefficientCount (3,1,0) (1,1,0) (2,2,2) = 0 := by decide

private theorem product_pair_310_110 (x y z : ℝ) :
    realMP (3,1,0) x y z * realMP (1,1,0) x y z =
      ((partitions 6).map (fun c => realCoeff (3,1,0) (1,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_220_200_600 :
    coefficientCount (2,2,0) (2,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_220_200_510 :
    coefficientCount (2,2,0) (2,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_220_200_420 :
    coefficientCount (2,2,0) (2,0,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_220_200_411 :
    coefficientCount (2,2,0) (2,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_220_200_330 :
    coefficientCount (2,2,0) (2,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_220_200_321 :
    coefficientCount (2,2,0) (2,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_220_200_222 :
    coefficientCount (2,2,0) (2,0,0) (2,2,2) = 3 := by decide

private theorem product_pair_220_200 (x y z : ℝ) :
    realMP (2,2,0) x y z * realMP (2,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (2,2,0) (2,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_220_110_600 :
    coefficientCount (2,2,0) (1,1,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_220_110_510 :
    coefficientCount (2,2,0) (1,1,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_220_110_420 :
    coefficientCount (2,2,0) (1,1,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_220_110_411 :
    coefficientCount (2,2,0) (1,1,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_220_110_330 :
    coefficientCount (2,2,0) (1,1,0) (3,3,0) = 1 := by decide

@[local simp] private theorem coefficientCount_220_110_321 :
    coefficientCount (2,2,0) (1,1,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_220_110_222 :
    coefficientCount (2,2,0) (1,1,0) (2,2,2) = 0 := by decide

private theorem product_pair_220_110 (x y z : ℝ) :
    realMP (2,2,0) x y z * realMP (1,1,0) x y z =
      ((partitions 6).map (fun c => realCoeff (2,2,0) (1,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_211_200_600 :
    coefficientCount (2,1,1) (2,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_200_510 :
    coefficientCount (2,1,1) (2,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_200_420 :
    coefficientCount (2,1,1) (2,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_200_411 :
    coefficientCount (2,1,1) (2,0,0) (4,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_211_200_330 :
    coefficientCount (2,1,1) (2,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_200_321 :
    coefficientCount (2,1,1) (2,0,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_211_200_222 :
    coefficientCount (2,1,1) (2,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_211_200 (x y z : ℝ) :
    realMP (2,1,1) x y z * realMP (2,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (2,1,1) (2,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_211_110_600 :
    coefficientCount (2,1,1) (1,1,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_110_510 :
    coefficientCount (2,1,1) (1,1,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_110_420 :
    coefficientCount (2,1,1) (1,1,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_110_411 :
    coefficientCount (2,1,1) (1,1,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_211_110_330 :
    coefficientCount (2,1,1) (1,1,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_211_110_321 :
    coefficientCount (2,1,1) (1,1,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_211_110_222 :
    coefficientCount (2,1,1) (1,1,0) (2,2,2) = 3 := by decide

private theorem product_pair_211_110 (x y z : ℝ) :
    realMP (2,1,1) x y z * realMP (1,1,0) x y z =
      ((partitions 6).map (fun c => realCoeff (2,1,1) (1,1,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_500_000_500 :
    coefficientCount (5,0,0) (0,0,0) (5,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_500_000_410 :
    coefficientCount (5,0,0) (0,0,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_500_000_320 :
    coefficientCount (5,0,0) (0,0,0) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_500_000_311 :
    coefficientCount (5,0,0) (0,0,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_500_000_221 :
    coefficientCount (5,0,0) (0,0,0) (2,2,1) = 0 := by decide

private theorem product_pair_500_000 (x y z : ℝ) :
    realMP (5,0,0) x y z * realMP (0,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (5,0,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_410_000_500 :
    coefficientCount (4,1,0) (0,0,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_410_000_410 :
    coefficientCount (4,1,0) (0,0,0) (4,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_410_000_320 :
    coefficientCount (4,1,0) (0,0,0) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_410_000_311 :
    coefficientCount (4,1,0) (0,0,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_410_000_221 :
    coefficientCount (4,1,0) (0,0,0) (2,2,1) = 0 := by decide

private theorem product_pair_410_000 (x y z : ℝ) :
    realMP (4,1,0) x y z * realMP (0,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (4,1,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_320_000_500 :
    coefficientCount (3,2,0) (0,0,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_320_000_410 :
    coefficientCount (3,2,0) (0,0,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_320_000_320 :
    coefficientCount (3,2,0) (0,0,0) (3,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_320_000_311 :
    coefficientCount (3,2,0) (0,0,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_320_000_221 :
    coefficientCount (3,2,0) (0,0,0) (2,2,1) = 0 := by decide

private theorem product_pair_320_000 (x y z : ℝ) :
    realMP (3,2,0) x y z * realMP (0,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (3,2,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_311_000_500 :
    coefficientCount (3,1,1) (0,0,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_311_000_410 :
    coefficientCount (3,1,1) (0,0,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_311_000_320 :
    coefficientCount (3,1,1) (0,0,0) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_311_000_311 :
    coefficientCount (3,1,1) (0,0,0) (3,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_311_000_221 :
    coefficientCount (3,1,1) (0,0,0) (2,2,1) = 0 := by decide

private theorem product_pair_311_000 (x y z : ℝ) :
    realMP (3,1,1) x y z * realMP (0,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (3,1,1) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_221_000_500 :
    coefficientCount (2,2,1) (0,0,0) (5,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_221_000_410 :
    coefficientCount (2,2,1) (0,0,0) (4,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_221_000_320 :
    coefficientCount (2,2,1) (0,0,0) (3,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_221_000_311 :
    coefficientCount (2,2,1) (0,0,0) (3,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_221_000_221 :
    coefficientCount (2,2,1) (0,0,0) (2,2,1) = 1 := by decide

private theorem product_pair_221_000 (x y z : ℝ) :
    realMP (2,2,1) x y z * realMP (0,0,0) x y z =
      ((partitions 5).map (fun c => realCoeff (2,2,1) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_500_100_600 :
    coefficientCount (5,0,0) (1,0,0) (6,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_500_100_510 :
    coefficientCount (5,0,0) (1,0,0) (5,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_500_100_420 :
    coefficientCount (5,0,0) (1,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_500_100_411 :
    coefficientCount (5,0,0) (1,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_500_100_330 :
    coefficientCount (5,0,0) (1,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_500_100_321 :
    coefficientCount (5,0,0) (1,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_500_100_222 :
    coefficientCount (5,0,0) (1,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_500_100 (x y z : ℝ) :
    realMP (5,0,0) x y z * realMP (1,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (5,0,0) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_410_100_600 :
    coefficientCount (4,1,0) (1,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_410_100_510 :
    coefficientCount (4,1,0) (1,0,0) (5,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_410_100_420 :
    coefficientCount (4,1,0) (1,0,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_410_100_411 :
    coefficientCount (4,1,0) (1,0,0) (4,1,1) = 2 := by decide

@[local simp] private theorem coefficientCount_410_100_330 :
    coefficientCount (4,1,0) (1,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_410_100_321 :
    coefficientCount (4,1,0) (1,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_410_100_222 :
    coefficientCount (4,1,0) (1,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_410_100 (x y z : ℝ) :
    realMP (4,1,0) x y z * realMP (1,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (4,1,0) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_320_100_600 :
    coefficientCount (3,2,0) (1,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_320_100_510 :
    coefficientCount (3,2,0) (1,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_320_100_420 :
    coefficientCount (3,2,0) (1,0,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_320_100_411 :
    coefficientCount (3,2,0) (1,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_320_100_330 :
    coefficientCount (3,2,0) (1,0,0) (3,3,0) = 2 := by decide

@[local simp] private theorem coefficientCount_320_100_321 :
    coefficientCount (3,2,0) (1,0,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_320_100_222 :
    coefficientCount (3,2,0) (1,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_320_100 (x y z : ℝ) :
    realMP (3,2,0) x y z * realMP (1,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (3,2,0) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_311_100_600 :
    coefficientCount (3,1,1) (1,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_311_100_510 :
    coefficientCount (3,1,1) (1,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_311_100_420 :
    coefficientCount (3,1,1) (1,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_311_100_411 :
    coefficientCount (3,1,1) (1,0,0) (4,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_311_100_330 :
    coefficientCount (3,1,1) (1,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_311_100_321 :
    coefficientCount (3,1,1) (1,0,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_311_100_222 :
    coefficientCount (3,1,1) (1,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_311_100 (x y z : ℝ) :
    realMP (3,1,1) x y z * realMP (1,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (3,1,1) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_221_100_600 :
    coefficientCount (2,2,1) (1,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_221_100_510 :
    coefficientCount (2,2,1) (1,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_221_100_420 :
    coefficientCount (2,2,1) (1,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_221_100_411 :
    coefficientCount (2,2,1) (1,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_221_100_330 :
    coefficientCount (2,2,1) (1,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_221_100_321 :
    coefficientCount (2,2,1) (1,0,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_221_100_222 :
    coefficientCount (2,2,1) (1,0,0) (2,2,2) = 3 := by decide

private theorem product_pair_221_100 (x y z : ℝ) :
    realMP (2,2,1) x y z * realMP (1,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (2,2,1) (1,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]
  all_goals ring

@[local simp] private theorem coefficientCount_600_000_600 :
    coefficientCount (6,0,0) (0,0,0) (6,0,0) = 1 := by decide

@[local simp] private theorem coefficientCount_600_000_510 :
    coefficientCount (6,0,0) (0,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_600_000_420 :
    coefficientCount (6,0,0) (0,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_600_000_411 :
    coefficientCount (6,0,0) (0,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_600_000_330 :
    coefficientCount (6,0,0) (0,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_600_000_321 :
    coefficientCount (6,0,0) (0,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_600_000_222 :
    coefficientCount (6,0,0) (0,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_600_000 (x y z : ℝ) :
    realMP (6,0,0) x y z * realMP (0,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (6,0,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_510_000_600 :
    coefficientCount (5,1,0) (0,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_510_000_510 :
    coefficientCount (5,1,0) (0,0,0) (5,1,0) = 1 := by decide

@[local simp] private theorem coefficientCount_510_000_420 :
    coefficientCount (5,1,0) (0,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_510_000_411 :
    coefficientCount (5,1,0) (0,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_510_000_330 :
    coefficientCount (5,1,0) (0,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_510_000_321 :
    coefficientCount (5,1,0) (0,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_510_000_222 :
    coefficientCount (5,1,0) (0,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_510_000 (x y z : ℝ) :
    realMP (5,1,0) x y z * realMP (0,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (5,1,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_420_000_600 :
    coefficientCount (4,2,0) (0,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_420_000_510 :
    coefficientCount (4,2,0) (0,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_420_000_420 :
    coefficientCount (4,2,0) (0,0,0) (4,2,0) = 1 := by decide

@[local simp] private theorem coefficientCount_420_000_411 :
    coefficientCount (4,2,0) (0,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_420_000_330 :
    coefficientCount (4,2,0) (0,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_420_000_321 :
    coefficientCount (4,2,0) (0,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_420_000_222 :
    coefficientCount (4,2,0) (0,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_420_000 (x y z : ℝ) :
    realMP (4,2,0) x y z * realMP (0,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (4,2,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_411_000_600 :
    coefficientCount (4,1,1) (0,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_411_000_510 :
    coefficientCount (4,1,1) (0,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_411_000_420 :
    coefficientCount (4,1,1) (0,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_411_000_411 :
    coefficientCount (4,1,1) (0,0,0) (4,1,1) = 1 := by decide

@[local simp] private theorem coefficientCount_411_000_330 :
    coefficientCount (4,1,1) (0,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_411_000_321 :
    coefficientCount (4,1,1) (0,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_411_000_222 :
    coefficientCount (4,1,1) (0,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_411_000 (x y z : ℝ) :
    realMP (4,1,1) x y z * realMP (0,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (4,1,1) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_330_000_600 :
    coefficientCount (3,3,0) (0,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_330_000_510 :
    coefficientCount (3,3,0) (0,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_330_000_420 :
    coefficientCount (3,3,0) (0,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_330_000_411 :
    coefficientCount (3,3,0) (0,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_330_000_330 :
    coefficientCount (3,3,0) (0,0,0) (3,3,0) = 1 := by decide

@[local simp] private theorem coefficientCount_330_000_321 :
    coefficientCount (3,3,0) (0,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_330_000_222 :
    coefficientCount (3,3,0) (0,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_330_000 (x y z : ℝ) :
    realMP (3,3,0) x y z * realMP (0,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (3,3,0) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_321_000_600 :
    coefficientCount (3,2,1) (0,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_321_000_510 :
    coefficientCount (3,2,1) (0,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_321_000_420 :
    coefficientCount (3,2,1) (0,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_321_000_411 :
    coefficientCount (3,2,1) (0,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_321_000_330 :
    coefficientCount (3,2,1) (0,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_321_000_321 :
    coefficientCount (3,2,1) (0,0,0) (3,2,1) = 1 := by decide

@[local simp] private theorem coefficientCount_321_000_222 :
    coefficientCount (3,2,1) (0,0,0) (2,2,2) = 0 := by decide

private theorem product_pair_321_000 (x y z : ℝ) :
    realMP (3,2,1) x y z * realMP (0,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (3,2,1) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

@[local simp] private theorem coefficientCount_222_000_600 :
    coefficientCount (2,2,2) (0,0,0) (6,0,0) = 0 := by decide

@[local simp] private theorem coefficientCount_222_000_510 :
    coefficientCount (2,2,2) (0,0,0) (5,1,0) = 0 := by decide

@[local simp] private theorem coefficientCount_222_000_420 :
    coefficientCount (2,2,2) (0,0,0) (4,2,0) = 0 := by decide

@[local simp] private theorem coefficientCount_222_000_411 :
    coefficientCount (2,2,2) (0,0,0) (4,1,1) = 0 := by decide

@[local simp] private theorem coefficientCount_222_000_330 :
    coefficientCount (2,2,2) (0,0,0) (3,3,0) = 0 := by decide

@[local simp] private theorem coefficientCount_222_000_321 :
    coefficientCount (2,2,2) (0,0,0) (3,2,1) = 0 := by decide

@[local simp] private theorem coefficientCount_222_000_222 :
    coefficientCount (2,2,2) (0,0,0) (2,2,2) = 1 := by decide

private theorem product_pair_222_000 (x y z : ℝ) :
    realMP (2,2,2) x y z * realMP (0,0,0) x y z =
      ((partitions 6).map (fun c => realCoeff (2,2,2) (0,0,0) c * realMP c x y z)).sum := by
  norm_num [partitions, realCoeff_count]

set_option maxHeartbeats 1000000 in
theorem product_decomposition (n m : ℕ) (h : n+m ≤ 6) (a b : Part)
    (ha : a ∈ partitions n) (hb : b ∈ partitions m) (x y z : ℝ) :
    realMP a x y z * realMP b x y z =
      ((partitions (n+m)).map (fun c => realCoeff a b c * realMP c x y z)).sum := by
  have hn : n ≤ 6 := by omega
  have hm : m ≤ 6 := by omega
  interval_cases n
  all_goals interval_cases m
  all_goals try omega
  all_goals simp only [partitions, List.mem_cons, List.not_mem_nil, or_false] at ha hb
  all_goals rcases ha with rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals rcases hb with rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals
    simp only [
      product_pair_000_000,
      product_pair_000_100,
      product_pair_000_200,
      product_pair_000_110,
      product_pair_000_300,
      product_pair_000_210,
      product_pair_000_111,
      product_pair_000_400,
      product_pair_000_310,
      product_pair_000_220,
      product_pair_000_211,
      product_pair_000_500,
      product_pair_000_410,
      product_pair_000_320,
      product_pair_000_311,
      product_pair_000_221,
      product_pair_000_600,
      product_pair_000_510,
      product_pair_000_420,
      product_pair_000_411,
      product_pair_000_330,
      product_pair_000_321,
      product_pair_000_222,
      product_pair_100_000,
      product_pair_100_100,
      product_pair_100_200,
      product_pair_100_110,
      product_pair_100_300,
      product_pair_100_210,
      product_pair_100_111,
      product_pair_100_400,
      product_pair_100_310,
      product_pair_100_220,
      product_pair_100_211,
      product_pair_100_500,
      product_pair_100_410,
      product_pair_100_320,
      product_pair_100_311,
      product_pair_100_221,
      product_pair_200_000,
      product_pair_110_000,
      product_pair_200_100,
      product_pair_110_100,
      product_pair_200_200,
      product_pair_200_110,
      product_pair_110_200,
      product_pair_110_110,
      product_pair_200_300,
      product_pair_200_210,
      product_pair_200_111,
      product_pair_110_300,
      product_pair_110_210,
      product_pair_110_111,
      product_pair_200_400,
      product_pair_200_310,
      product_pair_200_220,
      product_pair_200_211,
      product_pair_110_400,
      product_pair_110_310,
      product_pair_110_220,
      product_pair_110_211,
      product_pair_300_000,
      product_pair_210_000,
      product_pair_111_000,
      product_pair_300_100,
      product_pair_210_100,
      product_pair_111_100,
      product_pair_300_200,
      product_pair_300_110,
      product_pair_210_200,
      product_pair_210_110,
      product_pair_111_200,
      product_pair_111_110,
      product_pair_300_300,
      product_pair_300_210,
      product_pair_300_111,
      product_pair_210_300,
      product_pair_210_210,
      product_pair_210_111,
      product_pair_111_300,
      product_pair_111_210,
      product_pair_111_111,
      product_pair_400_000,
      product_pair_310_000,
      product_pair_220_000,
      product_pair_211_000,
      product_pair_400_100,
      product_pair_310_100,
      product_pair_220_100,
      product_pair_211_100,
      product_pair_400_200,
      product_pair_400_110,
      product_pair_310_200,
      product_pair_310_110,
      product_pair_220_200,
      product_pair_220_110,
      product_pair_211_200,
      product_pair_211_110,
      product_pair_500_000,
      product_pair_410_000,
      product_pair_320_000,
      product_pair_311_000,
      product_pair_221_000,
      product_pair_500_100,
      product_pair_410_100,
      product_pair_320_100,
      product_pair_311_100,
      product_pair_221_100,
      product_pair_600_000,
      product_pair_510_000,
      product_pair_420_000,
      product_pair_411_000,
      product_pair_330_000,
      product_pair_321_000,
      product_pair_222_000
    ]

end ChenKhareSahi
