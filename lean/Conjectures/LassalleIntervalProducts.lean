module
public import Conjectures.LassalleIntervalDivision
public import Conjectures.LassalleBesselConstants

@[expose] public section
namespace LassalleRefinement

def inat (n : ℕ) : Interval := ⟨(n:ℤ)*intervalScale,(n:ℤ)*intervalScale⟩

theorem inat_contains (n : ℕ) : (inat n).Contains n := by
  simp only [Interval.Contains,inat,Int.cast_mul,Int.cast_natCast]
  rw [mul_comm (n:ℝ)]
  exact ⟨le_rfl,le_rfl⟩

def intervalRatBounds (a b : ℚ) : Interval :=
  ⟨a.num*intervalScale/a.den,divUp (b.num*intervalScale) b.den⟩

theorem intervalRatBounds_contains {a b : ℚ} {x : ℝ}
    (hl : (a:ℝ)≤x) (hu : x≤(b:ℝ)) : (intervalRatBounds a b).Contains x := by
  have ha : (0:ℤ)<a.den := by exact_mod_cast a.den_pos
  have hb : (0:ℤ)<b.den := by exact_mod_cast b.den_pos
  have h'a : (0:ℝ)<a.den := by exact_mod_cast a.den_pos
  have h'b : (0:ℝ)<b.den := by exact_mod_cast b.den_pos
  have hal : ((a.num*intervalScale/a.den:ℤ):ℝ)*a.den ≤ (a.num:ℝ)*intervalScale := by
    exact_mod_cast divDown_mul_le (a.num*intervalScale) a.den ha
  have hbu : (b.num:ℝ)*intervalScale ≤ (divUp (b.num*intervalScale) b.den:ℝ)*b.den := by
    exact_mod_cast le_divUp_mul (b.num*intervalScale) b.den hb
  have eqa : (a:ℝ)*(a.den:ℝ)=a.num := by
    rw [Rat.cast_def]
    exact div_mul_cancel₀ _ h'a.ne'
  have eqb : (b:ℝ)*(b.den:ℝ)=b.num := by
    rw [Rat.cast_def]
    exact div_mul_cancel₀ _ h'b.ne'
  constructor
  · change ((a.num*intervalScale/a.den:ℤ):ℝ)≤(intervalScale:ℝ)*x
    apply le_of_mul_le_mul_right _ h'a
    calc
      _ ≤ (a.num:ℝ)*intervalScale := hal
      _ = ((intervalScale:ℝ)*(a:ℝ))*(a.den:ℝ) := by rw [mul_assoc,eqa,mul_comm]
      _ ≤ ((intervalScale:ℝ)*x)*(a.den:ℝ) :=
        mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hl intervalScale_cast_pos.le) h'a.le
  · change (intervalScale:ℝ)*x≤(divUp (b.num*intervalScale) b.den:ℤ)
    apply le_of_mul_le_mul_right _ h'b
    calc
      _ ≤ ((intervalScale:ℝ)*(b:ℝ))*(b.den:ℝ) :=
        mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_left hu intervalScale_cast_pos.le) h'b.le
      _ = (b.num:ℝ)*intervalScale := by rw [mul_assoc,eqb,mul_comm]
      _ ≤ _ := hbu

def intervalProd (f : ℕ→Interval) : ℕ→Interval
  | 0 => Interval.one
  | n+1 => (intervalProd f n).mul (f n)

theorem intervalProd_contains {f : ℕ→Interval} {g : ℕ→ℝ} (h : ∀ n,(f n).Contains (g n))
    (n : ℕ) : (intervalProd f n).Contains (∏ i ∈ Finset.range n,g i) := by
  induction n with
  | zero => simpa [intervalProd] using Interval.contains_one
  | succ n ih =>
    rw [intervalProd,Finset.prod_range_succ]
    exact ih.mul (h n)

def intervalSum (f : ℕ→Interval) : ℕ→Interval
  | 0 => Interval.zero
  | n+1 => (intervalSum f n).add (f n)

theorem intervalSum_contains {f : ℕ→Interval} {g : ℕ→ℝ} (h : ∀ n,(f n).Contains (g n))
    (n : ℕ) : (intervalSum f n).Contains (∑ i ∈ Finset.range n,g i) := by
  induction n with
  | zero => simpa [intervalSum] using Interval.contains_zero
  | succ n ih =>
    rw [intervalSum,Finset.sum_range_succ]
    exact ih.add (h n)

end LassalleRefinement
