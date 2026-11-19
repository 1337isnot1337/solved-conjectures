import Conjectures.HadamardLegendreCompression
import Conjectures.HadamardQuotient133Orbits

/-!
# Recovering the literal nine-class and three-layer data

A function invariant under the actual independent square-unit scalings
is recovered exactly from its values at the nine canonical points.
The same recovery is applied to each of three quotient layers. All sums
and correlations below are the original finite sums of those functions;
the class table is not an extra hypothesis.
-/

namespace HadamardLegendre

open scoped BigOperators
open HadamardBorderNormalizationTransport
open HadamardQuotient133

abbrev Quotient133 := ZMod 7 × ZMod 19

def SquareInvariant133 (f : Quotient133 → ℤ) : Prop :=
  ∀ (u : (ZMod 7)ˣ) (v : (ZMod 19)ˣ) (x : Quotient133),
    f (((u ^ 2 : (ZMod 7)ˣ) : ZMod 7) * x.1,
      ((v ^ 2 : (ZMod 19)ˣ) : ZMod 19) * x.2) = f x

def classRow133 (f : Quotient133 → ℤ) : Row :=
  fun i j => f (rep7 i, rep19 j)

theorem squareInvariant133_eq_of_classes
    (f : Quotient133 → ℤ) (hf : SquareInvariant133 f)
    (x y : Quotient133)
    (h7 : squareClass7 x.1 = squareClass7 y.1)
    (h19 : squareClass19 x.2 = squareClass19 y.2) :
    f y = f x := by
  obtain ⟨u, ⟨u', rfl⟩, hu⟩ := (squareClass7_eq_iff_square_unit x.1 y.1).mp h7
  obtain ⟨v, ⟨v', rfl⟩, hv⟩ := (squareClass19_eq_iff_square_unit x.2 y.2).mp h19
  simpa only [hu, hv] using hf u' v' x

theorem expand_classRow133 (f : Quotient133 → ℤ) (hf : SquareInvariant133 f)
    (x : Quotient133) :
    expand133 (classRow133 f) x = f x := by
  exact (squareInvariant133_eq_of_classes f hf
    (rep7 (squareClass7 x.1), rep19 (squareClass19 x.2)) x
    (squareClass7_rep7 _) (squareClass19_rep19 _)).symm

theorem weightedSum_classRow133 (f : Quotient133 → ℤ)
    (hf : SquareInvariant133 f) :
    weightedSum (classRow133 f) = rowSum f := by
  rw [← sum_expand133]
  exact Finset.sum_congr rfl (fun x _ => expand_classRow133 f hf x)

theorem correlation_classRow133 (f : Quotient133 → ℤ)
    (hf : SquareInvariant133 f) (t : Quotient133) :
    correlation133 (classRow133 f) t = correlation f t := by
  unfold correlation133 correlation
  apply Finset.sum_congr rfl
  intro x hx
  rw [expand_classRow133 f hf x, expand_classRow133 f hf (x + t)]

theorem pairCorrelation_classRows133 (f : Rows2 Quotient133)
    (hf : ∀ i, SquareInvariant133 (f i)) (t : Quotient133) :
    correlation133 (classRow133 (f 0)) t + correlation133 (classRow133 (f 1)) t =
      pairCorrelation f t := by
  rw [correlation_classRow133 (f 0) (hf 0), correlation_classRow133 (f 1) (hf 1)]
  exact (Fin.sum_univ_two (fun i => correlation (f i) t)).symm

theorem sum_squareClass19 (r : Triple) :
    (∑ z : ZMod 19, r (squareClass19 z)) = r 0 + 9 * (r 1 + r 2) := by
  change (∑ z : Fin 19, r (squareClass19 z)) = r 0 + 9 * (r 1 + r 2)
  norm_num [squareClass19, Fin.sum_univ_succ]
  ring

def classLayers133 (g : ZMod 3 → Quotient133 → ℤ) : Fin 3 → Row :=
  fun k => classRow133 (g k)

theorem expand_classLayers133 (g : ZMod 3 → Quotient133 → ℤ)
    (hg : ∀ k, SquareInvariant133 (g k)) (k : ZMod 3) (x : Quotient133) :
    expand133 (classLayers133 g k) x = g k x :=
  expand_classRow133 (g k) (hg k) x

theorem expand_project_classLayers133 (g : ZMod 3 → Quotient133 → ℤ)
    (hg : ∀ k, SquareInvariant133 (g k)) (x : ZMod 3 × ZMod 7) :
    expand21 (project21 (classLayers133 g)) x = ∑ z : ZMod 19, g x.1 (x.2, z) := by
  calc
    expand21 (project21 (classLayers133 g)) x =
        ∑ z : ZMod 19, (classLayers133 g x.1) (squareClass7 x.2) (squareClass19 z) :=
      (sum_squareClass19 ((classLayers133 g x.1) (squareClass7 x.2))).symm
    _ = ∑ z : ZMod 19, g x.1 (x.2, z) := by
      apply Finset.sum_congr rfl
      intro z hz
      exact expand_classLayers133 g hg x.1 (x.2, z)

theorem classLayers133_sum (g : ZMod 3 → Quotient133 → ℤ)
    (f : Quotient133 → ℤ) (hsum : ∀ x, (∑ k : ZMod 3, g k x) = f x)
    (i j : Fin 3) :
    (∑ k : Fin 3, classLayers133 g k i j) = classRow133 f i j :=
  hsum (rep7 i, rep19 j)

theorem correlation_project_classLayers133 (g : ZMod 3 → Quotient133 → ℤ)
    (hg : ∀ k, SquareInvariant133 (g k)) (t : ZMod 3 × ZMod 7) :
    correlation21 (project21 (classLayers133 g)) t =
      correlation (fun x : ZMod 3 × ZMod 7 => ∑ z : ZMod 19, g x.1 (x.2, z)) t := by
  unfold correlation21 correlation
  apply Finset.sum_congr rfl
  intro x hx
  rw [expand_project_classLayers133 g hg x, expand_project_classLayers133 g hg (x + t)]

theorem pairCorrelation_project_classLayers133
    (g : Fin 2 → ZMod 3 → Quotient133 → ℤ)
    (hg : ∀ i k, SquareInvariant133 (g i k)) (t : ZMod 3 × ZMod 7) :
    correlation21 (project21 (classLayers133 (g 0))) t +
        correlation21 (project21 (classLayers133 (g 1))) t =
      pairCorrelation (fun i (x : ZMod 3 × ZMod 7) =>
        ∑ z : ZMod 19, g i x.1 (x.2, z)) t := by
  rw [correlation_project_classLayers133 (g 0) (hg 0),
    correlation_project_classLayers133 (g 1) (hg 1)]
  simp only [pairCorrelation, Fin.sum_univ_two]

theorem odd_abs_le_three_values (z : ℤ) (habs : |z| ≤ 3) (hodd : z % 2 = 1) :
    z = -3 ∨ z = -1 ∨ z = 1 ∨ z = 3 := by
  have hz := abs_le.mp habs
  omega

end HadamardLegendre
