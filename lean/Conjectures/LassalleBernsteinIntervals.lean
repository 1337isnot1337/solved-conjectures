module
public import Conjectures.LassalleIntervalProducts

@[expose] public section
namespace LassalleRefinement

def xi (t z : Interval) (b r : ℕ) : Interval := (t.sub (z.scaleBy (b+r:ℕ))).nonneg
def yi (t z : Interval) (d b r : ℕ) : Interval :=
  ((Interval.one.sub t).sub (z.scaleBy (d-b+r:ℕ))).nonneg
def di (z : Interval) (d r : ℕ) : Interval :=
  Interval.one.sub (z.scaleBy (d+r:ℕ))

def denomI (z : Interval) (d n : ℕ) : Interval := intervalProd (di z d) n
def bernsteinI (t z : Interval) (d b i j : ℕ) : Interval :=
  (((intervalProd (xi t z b) i).mul (intervalProd (yi t z d b) j)).nonneg).divPos
    (denomI z d (i+j))

noncomputable def bx (t z : ℝ) (b r : ℕ) : ℝ := max 0 (t-(b+r:ℕ)*z)
noncomputable def byy (t z : ℝ) (d b r : ℕ) : ℝ := max 0 (1-t-(d-b+r:ℕ)*z)
noncomputable def bd (z : ℝ) (d r : ℕ) : ℝ := 1-(d+r:ℕ)*z

noncomputable def bernsteinTerm (t z : ℝ) (d b i j : ℕ) : ℝ :=
  ((∏ r ∈ Finset.range i,bx t z b r)*(∏ r ∈ Finset.range j,byy t z d b r)) /
    (∏ r ∈ Finset.range (i+j),bd z d r)

theorem bernsteinI_contains {T Z : Interval} {t z : ℝ} (ht : T.Contains t) (hz : Z.Contains z)
    (d b i j : ℕ) (hden : 0<(denomI Z d (i+j)).lo) :
    (bernsteinI T Z d b i j).Contains (bernsteinTerm t z d b i j) := by
  have hx : ∀ r, (xi T Z b r).Contains (bx t z b r) := by
    intro r
    simpa only [xi,bx,Int.cast_natCast,mul_comm] using
      (ht.sub (hz.scaleBy (b+r:ℕ))).nonneg
  have hy : ∀ r, (yi T Z d b r).Contains (byy t z d b r) := by
    intro r
    simpa only [yi,byy,Int.cast_natCast,mul_comm] using
      ((Interval.contains_one.sub ht).sub (hz.scaleBy (d-b+r:ℕ))).nonneg
  have hd : ∀ r, (di Z d r).Contains (bd z d r) := by
    intro r
    simpa only [di,bd,Int.cast_natCast,mul_comm] using
      (Interval.contains_one.sub (hz.scaleBy (d+r:ℕ)))
  have hn : 0≤(∏ r ∈ Finset.range i,bx t z b r)*(∏ r ∈ Finset.range j,byy t z d b r) :=
    mul_nonneg (Finset.prod_nonneg fun r _ => le_max_left ..)
      (Finset.prod_nonneg fun r _ => le_max_left ..)
  have hh := ((intervalProd_contains hx i).mul (intervalProd_contains hy j)).nonneg
  rw [max_eq_right hn] at hh
  exact hh.divPos (intervalProd_contains hd (i+j)) (Interval.lo_nonneg_nonneg _) hden

def coeffFactor (i j : ℕ) : ℕ :=
  i.factorial*(i+1).factorial*j.factorial*(j+1).factorial

def coeffI (i j : ℕ) : Interval :=
  (intervalRatBounds (rootLo^(i+j)/coeffFactor i j) (rootHi^(i+j)/coeffFactor i j)).scaleBy
    ((-1)^(i+j))

noncomputable def realCoeff (R : ℝ) (i j : ℕ) : ℝ := R^(i+j)/coeffFactor i j * (-1)^(i+j)

theorem coeffI_contains {R : ℝ} (hRlo : (rootLo:ℝ)≤R) (hRhi : R≤(rootHi:ℝ))
    (i j : ℕ) : (coeffI i j).Contains (realCoeff R i j) := by
  have hzq : (0:ℚ)≤rootLo := by decide +kernel
  have hz : (0:ℝ)≤(rootLo:ℝ) := by exact_mod_cast hzq
  have hf : 0≤(coeffFactor i j:ℝ) := Nat.cast_nonneg _
  have hl : ((rootLo^(i+j)/coeffFactor i j:ℚ):ℝ)≤R^(i+j)/coeffFactor i j := by
    push_cast
    exact div_le_div_of_nonneg_right (pow_le_pow_left₀ hz hRlo _) hf
  have hu : R^(i+j)/coeffFactor i j≤((rootHi^(i+j)/coeffFactor i j:ℚ):ℝ) := by
    push_cast
    exact div_le_div_of_nonneg_right (pow_le_pow_left₀ (hz.trans hRlo) hRhi _) hf
  simpa only [coeffI,realCoeff,Int.cast_pow,Int.cast_neg,Int.cast_one] using
    (intervalRatBounds_contains hl hu).scaleBy ((-1)^(i+j))

end LassalleRefinement
