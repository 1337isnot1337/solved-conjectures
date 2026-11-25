module

public import Mathlib.Basic.Real.Basic
public import Mathlib.Tactic

@[expose] public section
namespace LassalleRefinement

/-- The denominator of the original fixed-point certificate. -/
def intervalScale : ℤ := 2^50

theorem intervalScale_pos : 0 < intervalScale := by decide

theorem intervalScale_cast_pos : 0<(intervalScale:ℝ) := by exact_mod_cast intervalScale_pos

structure Interval where
  lo : ℤ
  hi : ℤ
  deriving DecidableEq, Repr

def Interval.Contains (I : Interval) (x : ℝ) : Prop :=
  (I.lo:ℝ) ≤ (intervalScale:ℝ)*x ∧ (intervalScale:ℝ)*x ≤ (I.hi:ℝ)

def Interval.add (A B : Interval) : Interval := ⟨A.lo+B.lo,A.hi+B.hi⟩
def Interval.neg (A : Interval) : Interval := ⟨-A.hi,-A.lo⟩
def Interval.sub (A B : Interval) : Interval := A.add B.neg
def Interval.zero : Interval := ⟨0,0⟩
def Interval.one : Interval := ⟨intervalScale,intervalScale⟩
def Interval.nonneg (A : Interval) : Interval := ⟨max 0 A.lo,max 0 A.hi⟩

def divUp (a b : ℤ) : ℤ := -((-a)/b)

theorem divDown_mul_le (a b : ℤ) (hb : 0<b) : a/b*b≤a :=
  Int.ediv_mul_le _ hb.ne'

theorem le_divUp_mul (a b : ℤ) (hb : 0<b) : a≤divUp a b*b := by
  rw [divUp,neg_mul]
  linarith [divDown_mul_le (-a) b hb]

theorem Interval.contains_zero : Interval.zero.Contains 0 := by simp [Interval.zero,Interval.Contains]

theorem Interval.contains_one : Interval.one.Contains 1 := by simp [Interval.one,Interval.Contains]

theorem Interval.Contains.add {A B : Interval} {x y : ℝ}
    (hx : A.Contains x) (hy : B.Contains y) : (A.add B).Contains (x+y) := by
  unfold Interval.Contains at *
  simp only [Interval.add,Int.cast_add,mul_add]
  exact ⟨add_le_add hx.1 hy.1,add_le_add hx.2 hy.2⟩

theorem Interval.Contains.neg {A : Interval} {x : ℝ}
    (hx : A.Contains x) : A.neg.Contains (-x) := by
  unfold Interval.Contains at *
  simpa only [Interval.neg,Int.cast_neg,mul_neg] using
    (show -(A.hi:ℝ) ≤ -((intervalScale:ℝ)*x) ∧ -((intervalScale:ℝ)*x) ≤ -(A.lo:ℝ) from
      ⟨neg_le_neg hx.2,neg_le_neg hx.1⟩)

theorem Interval.Contains.sub {A B : Interval} {x y : ℝ}
    (hx : A.Contains x) (hy : B.Contains y) : (A.sub B).Contains (x-y) := by
  simpa only [sub_eq_add_neg,Interval.sub] using hx.add hy.neg

theorem Interval.Contains.nonneg {A : Interval} {x : ℝ}
    (hx : A.Contains x) : A.nonneg.Contains (max 0 x) := by
  unfold Interval.Contains at *
  simp only [Interval.nonneg,Int.cast_max,Int.cast_zero]
  rw [mul_max_of_nonneg _ _ intervalScale_cast_pos.le,mul_zero]
  exact ⟨max_le_max le_rfl hx.1,max_le_max le_rfl hx.2⟩

def Interval.scaleBy (A : Interval) (c : ℤ) : Interval :=
  if c≥0 then ⟨A.lo*c,A.hi*c⟩ else ⟨A.hi*c,A.lo*c⟩

theorem Interval.Contains.scaleBy {A : Interval} {x : ℝ}
    (hx : A.Contains x) (c : ℤ) : (A.scaleBy c).Contains (x*c) := by
  unfold Interval.Contains at *
  rw [←mul_assoc]
  unfold Interval.scaleBy
  split_ifs with h
  · have hc : (0:ℝ)≤c := by exact_mod_cast h
    simp only [Int.cast_mul]
    exact ⟨mul_le_mul_of_nonneg_right hx.1 hc,mul_le_mul_of_nonneg_right hx.2 hc⟩
  · have hc : (c:ℝ)≤0 := by exact_mod_cast le_of_not_ge h
    simp only [Int.cast_mul]
    exact ⟨mul_le_mul_of_nonpos_right hx.2 hc,mul_le_mul_of_nonpos_right hx.1 hc⟩

def cornerLower (A B : Interval) : ℤ :=
  min (min (A.lo*B.lo) (A.lo*B.hi)) (min (A.hi*B.lo) (A.hi*B.hi))
def cornerUpper (A B : Interval) : ℤ :=
  max (max (A.lo*B.lo) (A.lo*B.hi)) (max (A.hi*B.lo) (A.hi*B.hi))

def Interval.mul (A B : Interval) : Interval :=
  ⟨cornerLower A B / intervalScale,divUp (cornerUpper A B) intervalScale⟩

private theorem mul_bounds_linear (a x lo hi L U : ℝ)
    (hx : lo≤x ∧ x≤hi) (hlo : L≤a*lo ∧ a*lo≤U) (hhi : L≤a*hi ∧ a*hi≤U) :
    L≤a*x ∧ a*x≤U := by
  by_cases h : 0≤a
  · exact ⟨hlo.1.trans (mul_le_mul_of_nonneg_left hx.1 h),
      (mul_le_mul_of_nonneg_left hx.2 h).trans hhi.2⟩
  · have h' := le_of_not_ge h
    exact ⟨hhi.1.trans (mul_le_mul_of_nonpos_left hx.2 h'),
      (mul_le_mul_of_nonpos_left hx.1 h').trans hlo.2⟩

private theorem product_corners {A B : Interval} {x y : ℝ}
    (hx : A.Contains x) (hy : B.Contains y) :
    (cornerLower A B:ℝ)≤((intervalScale:ℝ)*x)*((intervalScale:ℝ)*y) ∧
      ((intervalScale:ℝ)*x)*((intervalScale:ℝ)*y)≤(cornerUpper A B:ℝ) := by
  let M : ℝ := cornerLower A B
  let N : ℝ := cornerUpper A B
  have h1 : M≤(A.lo:ℝ)*B.lo ∧ (A.lo:ℝ)*B.lo≤N := by
    simp only [M,N,cornerLower,cornerUpper,Int.cast_min,Int.cast_max,Int.cast_mul]
    exact ⟨(min_le_left ..).trans (min_le_left ..),(le_max_left ..).trans (le_max_left ..)⟩
  have h2 : M≤(A.lo:ℝ)*B.hi ∧ (A.lo:ℝ)*B.hi≤N := by
    simp only [M,N,cornerLower,cornerUpper,Int.cast_min,Int.cast_max,Int.cast_mul]
    exact ⟨(min_le_left ..).trans (min_le_right ..),(le_max_right ..).trans (le_max_left ..)⟩
  have h3 : M≤(A.hi:ℝ)*B.lo ∧ (A.hi:ℝ)*B.lo≤N := by
    simp only [M,N,cornerLower,cornerUpper,Int.cast_min,Int.cast_max,Int.cast_mul]
    exact ⟨(min_le_right ..).trans (min_le_left ..),(le_max_left ..).trans (le_max_right ..)⟩
  have h4 : M≤(A.hi:ℝ)*B.hi ∧ (A.hi:ℝ)*B.hi≤N := by
    simp only [M,N,cornerLower,cornerUpper,Int.cast_min,Int.cast_max,Int.cast_mul]
    exact ⟨(min_le_right ..).trans (min_le_right ..),(le_max_right ..).trans (le_max_right ..)⟩
  have h5 := mul_bounds_linear (A.lo:ℝ) ((intervalScale:ℝ)*y) _ _ _ _ hy h1 h2
  have h6 := mul_bounds_linear (A.hi:ℝ) ((intervalScale:ℝ)*y) _ _ _ _ hy h3 h4
  rw [mul_comm (A.lo:ℝ)] at h5
  rw [mul_comm (A.hi:ℝ)] at h6
  rw [mul_comm ((intervalScale:ℝ)*x)]
  exact mul_bounds_linear ((intervalScale:ℝ)*y) ((intervalScale:ℝ)*x) _ _ _ _ hx h5 h6

theorem Interval.Contains.mul {A B : Interval} {x y : ℝ}
    (hx : A.Contains x) (hy : B.Contains y) : (A.mul B).Contains (x*y) := by
  have hb := product_corners hx hy
  have hl : ((cornerLower A B / intervalScale:ℤ):ℝ)*(intervalScale:ℝ)≤cornerLower A B := by
    exact_mod_cast divDown_mul_le (cornerLower A B) intervalScale intervalScale_pos
  have hu : (cornerUpper A B:ℝ)≤(divUp (cornerUpper A B) intervalScale:ℝ)*(intervalScale:ℝ) := by
    exact_mod_cast le_divUp_mul (cornerUpper A B) intervalScale intervalScale_pos
  have he : ((intervalScale:ℝ)*x)*((intervalScale:ℝ)*y)=((intervalScale:ℝ)*(x*y))*intervalScale := by ring
  rw [he] at hb
  exact ⟨le_of_mul_le_mul_right (hl.trans hb.1) intervalScale_cast_pos,
    le_of_mul_le_mul_right (hb.2.trans hu) intervalScale_cast_pos⟩

end LassalleRefinement
