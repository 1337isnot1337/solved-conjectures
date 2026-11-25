module

public import Conjectures.LassalleBernsteinIntervals
public import Mathlib.Data.Nat.Factorial.BigOperators

@[expose] public section
namespace LassalleRefinement

private theorem max_zero_nat_sub_div (a b : ℕ) (n : ℝ) (hn : 0<n) :
    max 0 ((a:ℝ)/n-(b:ℝ)/n) = ((a-b:ℕ):ℝ)/n := by
  by_cases h : b≤a
  · have hr : (b:ℝ)≤a := by exact_mod_cast h
    have hp := div_le_div_of_nonneg_right hr hn.le
    rw [max_eq_right (sub_nonneg.mpr hp),Nat.cast_sub h,sub_div]
  · have hg : a≤b := by omega
    have hh : (a:ℝ)≤b := by exact_mod_cast hg
    have hp := div_le_div_of_nonneg_right hh hn.le
    rw [max_eq_left (sub_nonpos.mpr hp),Nat.sub_eq_zero_of_le hg,Nat.cast_zero,zero_div]

theorem bx_at_index {n : ℕ} (hn : 0<n) (a b r : ℕ) :
    bx ((a:ℝ)/n) (1/(n:ℝ)) b r = ((a-b-r:ℕ):ℝ)/n := by
  unfold bx
  rw [mul_one_div, max_zero_nat_sub_div _ _ _ (by exact_mod_cast hn),Nat.sub_sub]

theorem byy_at_index {n a : ℕ} (hn : 0<n) (ha : a≤n) (d b r : ℕ) :
    byy ((a:ℝ)/n) (1/(n:ℝ)) d b r = ((n-a-(d-b)-r:ℕ):ℝ)/n := by
  have h0 : (n:ℝ)≠0 := by exact_mod_cast hn.ne'
  have ht : 1-(a:ℝ)/n=((n-a:ℕ):ℝ)/n := by
    rw [Nat.cast_sub ha,sub_div,div_self h0]
  unfold byy
  rw [ht,mul_one_div,max_zero_nat_sub_div _ _ _ (by exact_mod_cast hn)]
  rw [Nat.sub_sub (n-a) (d-b) r]

theorem bd_at_index {n d r : ℕ} (hn : 0<n) (hr : d+r≤n) :
    bd (1/(n:ℝ)) d r = ((n-d-r:ℕ):ℝ)/n := by
  have h0 : (n:ℝ)≠0 := by exact_mod_cast hn.ne'
  unfold bd
  rw [mul_one_div,Nat.sub_sub,Nat.cast_sub hr,sub_div,div_self h0]

theorem product_descFactorial_over (a m : ℕ) (n : ℝ) :
    (∏ r ∈ Finset.range m, ((a-r:ℕ):ℝ)/n) = (a.descFactorial m:ℝ)/n^m := by
  rw [Finset.prod_div_distrib,Finset.prod_const,Finset.card_range,Nat.descFactorial_eq_prod_range]
  push_cast
  rfl

/-- The interval implementation's clipped real expression is exactly the
falling-factor Bernstein coefficient at every admissible integer index. -/
theorem bernsteinTerm_at_index {n a : ℕ} (hn : 0<n) (ha : a≤n)
    (d b i j : ℕ) (hd : i+j≤n-d) :
    bernsteinTerm ((a:ℝ)/n) (1/(n:ℝ)) d b i j =
      ((a-b).descFactorial i:ℝ)*((n-a-(d-b)).descFactorial j:ℝ) /
        ((n-d).descFactorial (i+j):ℝ) := by
  unfold bernsteinTerm
  have hx : (∏ r ∈ Finset.range i,bx ((a:ℝ)/n) (1/(n:ℝ)) b r) =
      ((a-b).descFactorial i:ℝ)/(n:ℝ)^i := by
    rw [←product_descFactorial_over]
    exact Finset.prod_congr rfl (fun r _ => bx_at_index hn a b r)
  have hy : (∏ r ∈ Finset.range j,byy ((a:ℝ)/n) (1/(n:ℝ)) d b r) =
      ((n-a-(d-b)).descFactorial j:ℝ)/(n:ℝ)^j := by
    rw [←product_descFactorial_over]
    exact Finset.prod_congr rfl (fun r _ => byy_at_index hn ha d b r)
  have hz : (∏ r ∈ Finset.range (i+j),bd (1/(n:ℝ)) d r) =
      ((n-d).descFactorial (i+j):ℝ)/(n:ℝ)^(i+j) := by
    rw [←product_descFactorial_over]
    apply Finset.prod_congr rfl
    intro r hr
    have hr' := Finset.mem_range.mp hr
    exact bd_at_index hn (by omega)
  rw [hx,hy,hz,pow_add]
  have hp : (n:ℝ)≠0 := by exact_mod_cast hn.ne'
  have hden : ((n-d).descFactorial (i+j):ℝ)≠0 := by
    exact_mod_cast (fun hn => (not_lt_of_ge hd) ((Nat.descFactorial_eq_zero_iff_lt).mp hn))
  field_simp

end LassalleRefinement
