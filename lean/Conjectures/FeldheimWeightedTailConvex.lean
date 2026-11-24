import Conjectures.FeldheimWeightedTailBasic

/-!
# Feldheim–Feldheim’s weighted tail conjecture

A direct supporting-slope construction of the bounded convex approximation
used in §2 of the existing proof. A uniform chord error produces an actual
affine minorant through the value minus that error. Taking the supremum of
all affine minorants then gives the required convex function. This proves
the needed envelope bound without assuming a linear-programming reduction.
-/

open Set

namespace Conjectures.FeldheimWeightedTail

noncomputable section

theorem chord_slope_le {F : ℝ → ℝ} {T E x z y : ℝ}
    (hF : ChordBoundOn F T E) (hx : T ≤ x) (hxz : x < z) (hzy : z < y) :
    (F z-E-F x)/(z-x) ≤ (F y-(F z-E))/(y-z) := by
  have hxy : x < y := hxz.trans hzy
  have hh := hF x hx y hxy z ⟨hxz.le, hzy.le⟩
  have halg : ((y-z)/(y-x))*F x+((z-x)/(y-x))*F y =
      ((y-z)*F x+(z-x)*F y)/(y-x) := by ring
  rw [halg] at hh
  have hh' : F z-E ≤ ((y-z)*F x+(z-x)*F y)/(y-x) := by linarith
  have hm := (le_div_iff₀ (sub_pos.mpr hxy)).mp hh'
  apply (div_le_div_iff₀ (sub_pos.mpr hxz) (sub_pos.mpr hzy)).mpr
  nlinarith

/-- Every interior value minus the uniform chord error admits a global affine minorant. -/
theorem exists_affine_minorant_of_chord {F : ℝ → ℝ} {T E z : ℝ}
    (hF : ChordBoundOn F T E) (hE : 0 ≤ E) (hz : T < z) :
    ∃ s c : ℝ, (∀ x, T ≤ x → s*x+c ≤ F x) ∧ s*z+c = F z-E := by
  let L : Set ℝ := {p | ∃ x : ℝ, T ≤ x ∧ x < z ∧ p = (F z-E-F x)/(z-x)}
  have hL : L.Nonempty := ⟨(F z-E-F T)/(z-T), T, le_rfl, hz, rfl⟩
  have hB : BddAbove L := by
    refine ⟨(F (z+1)-(F z-E))/((z+1)-z), ?_⟩
    rintro p ⟨x, hx, hxz, rfl⟩
    exact chord_slope_le hF hx hxz (by linarith)
  let s := sSup L
  have hleft (x : ℝ) (hx : T ≤ x) (hxz : x < z) :
      (F z-E-F x)/(z-x) ≤ s := le_csSup hB ⟨x, hx, hxz, rfl⟩
  have hright (y : ℝ) (hzy : z < y) : s ≤ (F y-(F z-E))/(y-z) := by
    apply csSup_le hL
    rintro p ⟨x, hx, hxz, rfl⟩
    exact chord_slope_le hF hx hxz hzy
  refine ⟨s, F z-E-s*z, ?_, by ring⟩
  intro x hx
  rcases lt_trichotomy x z with hxz | rfl | hzx
  · have hh := (div_le_iff₀ (sub_pos.mpr hxz)).mp (hleft x hx hxz)
    nlinarith
  · linarith
  · have hh := (le_div_iff₀ (sub_pos.mpr hzx)).mp (hright x hzx)
    nlinarith

def minorantValues (F : ℝ → ℝ) (T x : ℝ) : Set ℝ :=
  {v | ∃ s c : ℝ, (∀ y, T ≤ y → s*y+c ≤ F y) ∧ v = s*x+c}

/-- The actual supremum of all affine minorants on the indicated half-line. -/
def convexMinorant (F : ℝ → ℝ) (T x : ℝ) : ℝ := sSup (minorantValues F T x)

theorem minorantValues_nonempty {F : ℝ → ℝ} {T x : ℝ}
    (hpos : ∀ y, T ≤ y → 0 ≤ F y) : (minorantValues F T x).Nonempty := by
  refine ⟨0, 0, 0, ?_, by ring⟩
  intro y hy
  simpa only [zero_mul, zero_add] using hpos y hy

theorem minorantValues_bddAbove {F : ℝ → ℝ} {T x : ℝ} (hx : T ≤ x) :
    BddAbove (minorantValues F T x) := by
  refine ⟨F x, ?_⟩
  rintro v ⟨s, c, hsc, rfl⟩
  exact hsc x hx

theorem convexMinorant_le {F : ℝ → ℝ} {T x : ℝ}
    (hpos : ∀ y, T ≤ y → 0 ≤ F y) (hx : T ≤ x) : convexMinorant F T x ≤ F x := by
  apply csSup_le (minorantValues_nonempty hpos)
  rintro v ⟨s, c, hsc, rfl⟩
  exact hsc x hx

theorem convexMinorant_nonneg {F : ℝ → ℝ} {T x : ℝ}
    (hpos : ∀ y, T ≤ y → 0 ≤ F y) (hx : T ≤ x) : 0 ≤ convexMinorant F T x := by
  apply le_csSup (minorantValues_bddAbove hx)
  refine ⟨0, 0, ?_, by ring⟩
  intro y hy
  simpa only [zero_mul, zero_add] using hpos y hy

/-- The constructed minorant is convex, with no envelope property left as a premise. -/
theorem convexMinorant_convex {F : ℝ → ℝ} {T : ℝ}
    (hpos : ∀ y, T ≤ y → 0 ≤ F y) :
    ConvexOn ℝ (Ici T) (convexMinorant F T) := by
  refine ⟨convex_Ici T, ?_⟩
  intro x hx y hy a b ha hb hab
  change convexMinorant F T (a*x+b*y) ≤ a*convexMinorant F T x+b*convexMinorant F T y
  apply csSup_le (minorantValues_nonempty hpos)
  rintro v ⟨s, c, hsc, rfl⟩
  have hx' : s*x+c ≤ convexMinorant F T x :=
    le_csSup (minorantValues_bddAbove hx) ⟨s, c, hsc, rfl⟩
  have hy' : s*y+c ≤ convexMinorant F T y :=
    le_csSup (minorantValues_bddAbove hy) ⟨s, c, hsc, rfl⟩
  calc
    s*(a*x+b*y)+c = a*(s*x+c)+b*(s*y+c) := by
      nlinarith [congrArg (fun u : ℝ => u*c) hab]
    _ ≤ a*convexMinorant F T x+b*convexMinorant F T y :=
      add_le_add (mul_le_mul_of_nonneg_left hx' ha) (mul_le_mul_of_nonneg_left hy' hb)

theorem le_convexMinorant_add {F : ℝ → ℝ} {T E x : ℝ}
    (hF : ChordBoundOn F T E) (hE : 0 ≤ E) (hx : T < x) :
    F x-E ≤ convexMinorant F T x := by
  obtain ⟨s, c, hsc, hvalue⟩ := exists_affine_minorant_of_chord hF hE hx
  apply le_csSup (minorantValues_bddAbove hx.le)
  exact ⟨s, c, hsc, hvalue.symm⟩

/-- The proved chord bound gives a bounded approximation on every interior point of the half-line. -/
theorem convexMinorant_approx {F : ℝ → ℝ} {T E x : ℝ}
    (hpos : ∀ y, T ≤ y → 0 ≤ F y)
    (hF : ChordBoundOn F T E) (hE : 0 ≤ E) (hx : T < x) :
    |F x-convexMinorant F T x| ≤ E := by
  have hlo := le_convexMinorant_add hF hE hx
  have hhi := convexMinorant_le hpos hx.le
  exact abs_le.mpr ⟨by linarith, by linarith⟩

end

end Conjectures.FeldheimWeightedTail
