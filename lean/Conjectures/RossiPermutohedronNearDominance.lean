module

public import Mathlib.Analysis.SpecificLimits.Basic
public import Mathlib.Analysis.Normed.Group.InfiniteSum
public import Mathlib.Topology.Algebra.InfiniteSum.Real
public import Mathlib.Tactic

@[expose] public section
namespace RossiPermutohedron
open scoped BigOperators

theorem majorant_to_right (a : ℕ→ℝ) (k : ℕ) {r : ℝ} (hr : 0≤r)
    (h : ∀ m, k≤m → a (m+1)≤r*a m) (i : ℕ) :
    a (k+i) ≤ r^i*a k := by
  induction i with
  | zero => simp
  | succ i ih =>
    calc
      _ ≤ r*a (k+i) := h (k+i) (by omega)
      _ ≤ r*(r^i*a k) := mul_le_mul_of_nonneg_left ih hr
      _ = _ := by rw [pow_succ]; ring

theorem majorant_to_left (a : ℕ→ℝ) (k : ℕ) {r : ℝ} (hr : 0≤r)
    (h : ∀ m, m<k → a m≤r*a (m+1)) (i : ℕ) (hi : i≤k) :
    a (k-i) ≤ r^i*a k := by
  induction i with
  | zero => simp
  | succ i ih =>
    have ht : k-(i+1) < k := by omega
    have he : k-(i+1)+1=k-i := by omega
    calc
      _ ≤ r*a (k-(i+1)+1) := h _ ht
      _ ≤ r*(r^i*a k) := by rw [he]; exact mul_le_mul_of_nonneg_left (ih (by omega)) hr
      _ = _ := by rw [pow_succ]; ring

theorem geometric_tail_hasSum {r : ℝ} (hr : 0≤r) (hr1 : r<1) :
    HasSum (fun m : ℕ => r^(m+1)) (r/(1-r)) := by
  rw [show r/(1-r)= (1-r)⁻¹*r by ring]
  simpa only [pow_succ] using (hasSum_geometric_of_lt_one hr hr1).mul_right r

theorem near_right_total_le (a : ℕ→ℝ) (k : ℕ) (h0 : ∀ i, 0≤a i)
    (h : ∀ m,k≤m → a (m+1)≤(1:ℝ)/4*a m) :
    ∑' m : ℕ,a (k+m+1) ≤ a k/3 := by
  have hS := (geometric_tail_hasSum (r := (1:ℝ)/4) (by norm_num) (by norm_num)).mul_right (a k)
  have hp (m : ℕ) : a (k+m+1) ≤ ((1:ℝ)/4)^(m+1)*a k := majorant_to_right a k (by norm_num) h (m+1)
  have hU := Summable.of_nonneg_of_le (fun m => h0 (k+m+1)) hp hS.summable
  have hh := hU.tsum_le_tsum hp hS.summable
  rw [hS.tsum_eq] at hh
  linarith

theorem near_left_total_le (a : ℕ→ℝ) (k : ℕ) (h0 : ∀ i, 0≤a i)
    (h : ∀ m,m<k → a m≤(1:ℝ)/16*a (m+1)) :
    ∑ m ∈ Finset.range k,a m ≤ a k/15 := by
  let r : ℝ := 1/16
  have hR : 0≤r := by norm_num [r]
  have h1 : r<1 := by norm_num [r]
  have hG := (geometric_tail_hasSum hR h1).mul_right (a k)
  have ht : (∑ m ∈ Finset.range k,r^(m+1)*a k) ≤ (r/(1-r))*a k :=
    hG.summable.sum_le_tsum _ (fun i _ => mul_nonneg (pow_nonneg hR _) (h0 k)) |>.trans_eq hG.tsum_eq
  have he : ∑ m ∈ Finset.range k,r^(k-m)*a k = ∑ m ∈ Finset.range k,r^(m+1)*a k := by
    rw [← Finset.sum_range_reflect (fun m => r^(m+1)*a k)]
    apply Finset.sum_congr rfl
    intro m hm
    have hi := Finset.mem_range.mp hm
    rw [show k-m=k-1-m+1 by omega]
  have hl : ∑ m ∈ Finset.range k,a m ≤ ∑ m ∈ Finset.range k,r^(k-m)*a k := by
    apply Finset.sum_le_sum
    intro m hm
    have hi := Finset.mem_range.mp hm
    have H := majorant_to_left a k hR h (k-m) (by omega)
    rw [show k-(k-m)=m by omega] at H
    exact H
  rw [he] at hl
  have hh := hl.trans ht
  norm_num [r] at hh
  linarith

/-- The alternating sum has the sign of its central term and loses
strictly less than half its magnitude to the two dominated tails. -/
theorem near_alternating_dominance (a : ℕ→ℝ) (k : ℕ) (h0 : ∀ i, 0≤a i) (hk : 0<a k)
    (ha : Summable a)
    (hR : ∀ m,k≤m → a (m+1)≤(1:ℝ)/4*a m)
    (hL : ∀ m,m<k → a m≤(1:ℝ)/16*a (m+1)) :
    a k/2 < (-1:ℝ)^k * ∑' m : ℕ,(-1:ℝ)^m*a m := by
  let f : ℕ→ℝ := fun m => (-1:ℝ)^m*a m
  let s : ℝ := (-1)^k
  let L : ℝ := ∑ m ∈ Finset.range k,f m
  let R : ℝ := ∑' m : ℕ,f (m+(k+1))
  have hfAbs (m : ℕ) : |f m|=a m := by
    simp [f,abs_mul,abs_pow,abs_of_nonneg (h0 m)]
  have hnorm : Summable (fun m => ‖f m‖) := by
    simp_rw [Real.norm_eq_abs,hfAbs]
    exact ha
  have hfn : Summable f := hnorm.of_norm
  have hLAbs : |L|≤a k/15 := by
    exact (Finset.abs_sum_le_sum_abs f (Finset.range k)).trans (by
      simp_rw [hfAbs]
      exact near_left_total_le a k h0 hL)
  have hRAbs : |R|≤a k/3 := by
    have hShift : Summable (fun m => ‖f (m+(k+1))‖) :=
      (summable_nat_add_iff (k+1)).mpr hnorm
    have H := norm_tsum_le_tsum_norm hShift
    simp only [Real.norm_eq_abs,hfAbs] at H
    have he : (fun m : ℕ => a (m+(k+1)))=fun m => a (k+m+1) := by
      funext m
      congr 1
      omega
    rw [he] at H
    exact H.trans (near_right_total_le a k h0 hR)
  have hErr : |s*(L+R)|≤a k/15+a k/3 := by
    rw [abs_mul,show |s|=1 by simp [s,abs_pow],one_mul]
    exact (abs_add_le L R).trans (add_le_add hLAbs hRAbs)
  have hSplit : (∑' m : ℕ,f m)=L+f k+R := by
    rw [← hfn.sum_add_tsum_nat_add (k+1),Finset.sum_range_succ]
  have hs : s*s=1 := by dsimp [s]; rw [←mul_pow]; norm_num
  change a k/2 < s*(∑' m : ℕ,f m)
  rw [hSplit]
  have hEq : s*(L+f k+R)=a k+s*(L+R) := by
    change s*(L+s*a k+R)=a k+s*(L+R)
    linear_combination a k*hs
  rw [hEq]
  linarith [(abs_le.mp hErr).1]

end RossiPermutohedron
