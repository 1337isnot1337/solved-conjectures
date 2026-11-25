module

public import Conjectures.LassalleIntervalArithmetic

@[expose] public section
namespace LassalleRefinement

def Interval.divPos (A B : Interval) : Interval :=
  ⟨A.lo*intervalScale/B.hi,divUp (A.hi*intervalScale) B.lo⟩

theorem Interval.Contains.divPos {A B : Interval} {x y : ℝ}
    (hx : A.Contains x) (hy : B.Contains y) (ha : 0≤A.lo) (hb : 0<B.lo) :
    (A.divPos B).Contains (x/y) := by
  let P : ℝ := intervalScale
  have hp : 0<P := intervalScale_cast_pos
  have hbl : 0<(B.lo:ℝ) := by exact_mod_cast hb
  have hyPos : 0<y := pos_of_mul_pos_right (hbl.trans_le hy.1) hp.le
  have hbh : 0<(B.hi:ℝ) := (mul_pos hp hyPos).trans_le hy.2
  have hb' : 0<B.hi := by exact_mod_cast hbh
  have hxPos : 0≤x := nonneg_of_mul_nonneg_right ((by exact_mod_cast ha : (0:ℝ)≤A.lo).trans hx.1) hp
  have hxy : 0≤P*(x/y) := mul_nonneg hp.le (div_nonneg hxPos hyPos.le)
  have hm : (P*(x/y))*(P*y)=P*x*P := by field_simp
  have hlo : ((A.lo*intervalScale/B.hi:ℤ):ℝ)*B.hi≤(A.lo:ℝ)*P := by
    dsimp only [P]
    exact_mod_cast divDown_mul_le (A.lo*intervalScale) B.hi hb'
  have hhi : (A.hi:ℝ)*P≤(divUp (A.hi*intervalScale) B.lo:ℝ)*B.lo := by
    dsimp only [P]
    exact_mod_cast le_divUp_mul (A.hi*intervalScale) B.lo hb
  constructor
  · change ((A.lo*intervalScale/B.hi:ℤ):ℝ)≤P*(x/y)
    apply le_of_mul_le_mul_right _ hbh
    calc
      _ ≤ (A.lo:ℝ)*P := hlo
      _ ≤ P*x*P := mul_le_mul_of_nonneg_right hx.1 hp.le
      _ = (P*(x/y))*(P*y) := hm.symm
      _ ≤ (P*(x/y))*B.hi := mul_le_mul_of_nonneg_left hy.2 hxy
  · change P*(x/y)≤(divUp (A.hi*intervalScale) B.lo:ℝ)
    apply le_of_mul_le_mul_right _ hbl
    calc
      _ ≤ (P*(x/y))*(P*y) := mul_le_mul_of_nonneg_left hy.1 hxy
      _ = P*x*P := hm
      _ ≤ (A.hi:ℝ)*P := mul_le_mul_of_nonneg_right hx.2 hp.le
      _ ≤ _ := hhi

/-- Each numerator is clipped below at zero in the written box certificate. -/
theorem Interval.lo_nonneg_nonneg (A : Interval) : 0≤A.nonneg.lo := le_max_left ..

def Interval.inflate (A : Interval) (e : ℤ) : Interval := ⟨A.lo-e,A.hi+e⟩

theorem Interval.Contains.inflate {A : Interval} {x y : ℝ} {e : ℤ}
    (hx : A.Contains x)
    (he : (intervalScale:ℝ)*|y-x|≤(e:ℝ)) :
    (A.inflate e).Contains y := by
  unfold Interval.Contains at *
  simp only [Interval.inflate,Int.cast_sub,Int.cast_add]
  rw [mul_comm,← abs_of_nonneg intervalScale_cast_pos.le,mul_comm,←abs_mul,mul_sub,abs_le] at he
  constructor <;> linarith [hx.1,hx.2,he.1,he.2]

theorem Interval.lt_of_separated {A B : Interval} {x y : ℝ}
    (hx : A.Contains x) (hy : B.Contains y) (h : B.hi < A.lo) : y<x := by
  have hh : (B.hi:ℝ)<A.lo := by exact_mod_cast h
  exact lt_of_le_of_ne
    (le_of_mul_le_mul_left (hy.2.trans (hh.le.trans hx.1)) intervalScale_cast_pos)
    (fun he => by rw [he] at hy; linarith [hx.1,hy.2])

end LassalleRefinement
