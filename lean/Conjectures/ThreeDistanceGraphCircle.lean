import Conjectures.LonelinessRational
import Conjectures.LonelinessCriticalBase
import Mathlib.Tactic.FieldSimp

namespace ThreeDistanceGraph

def circularNorm (P x : ℤ) : ℤ := min (x%P) (P-x%P)

theorem circularNorm_nonneg {P : ℤ} (hP : 0 < P) (x : ℤ) : 0 ≤ circularNorm P x := by
  have h0 := Int.emod_nonneg x (ne_of_gt hP)
  have h1 := Int.emod_lt_of_pos x hP
  exact le_min h0 (by omega)

theorem circularNorm_congr {P x y : ℤ} (h : x%P=y%P) :
    circularNorm P x=circularNorm P y := by simp only [circularNorm,h]

theorem circularNorm_add_mul (P x q : ℤ) :
    circularNorm P (x+q*P)=circularNorm P x := by
  simp only [circularNorm,Int.add_mul_emod_self_right]

theorem circularNorm_mul_mod (P c m : ℤ) :
    circularNorm P (c*m)=circularNorm P (c*(m%P)) := by
  apply circularNorm_congr
  simp only [Int.mul_emod,Int.emod_emod]

theorem circularNorm_neg {P : ℤ} (hP : 0 < P) (x : ℤ) :
    circularNorm P (-x)=circularNorm P x := by
  have hr0 := Int.emod_nonneg x (ne_of_gt hP)
  have hrP := Int.emod_lt_of_pos x hP
  unfold circularNorm
  rw [Int.neg_emod]
  by_cases hd : P ∣ x
  · have hr : x%P=0 := Int.emod_eq_zero_of_dvd hd
    simp [hd,hr,le_of_lt hP]
  · have habs : (P.natAbs:ℤ)=P := Int.natAbs_of_nonneg (le_of_lt hP)
    simp only [hd,ite_false,habs]
    have he : P-(P-x%P)=x%P := by omega
    rw [he,min_comm]

theorem circularNorm_le_abs {P : ℤ} (hP : 0 < P) (x n : ℤ) :
    circularNorm P x ≤ |x-P*n| := by
  have hr0 := Int.emod_nonneg x (ne_of_gt hP)
  have hrP := Int.emod_lt_of_pos x hP
  have hx := Int.emod_add_mul_ediv x P
  by_cases hn : n ≤ x/P
  · have hp := mul_nonneg (le_of_lt hP) (show 0 ≤ x/P-n by omega)
    have hh : x%P ≤ x-P*n := by nlinarith only [hp,hx]
    rw [abs_of_nonneg (by omega : 0 ≤ x-P*n)]
    exact (min_le_left _ _).trans hh
  · have hp := mul_le_mul_of_nonneg_left (show x/P+1 ≤ n by omega) (le_of_lt hP)
    have hh : P-x%P ≤ P*n-x := by nlinarith only [hp,hx]
    rw [abs_of_nonpos (by omega : x-P*n ≤ 0)]
    have hn : circularNorm P x ≤ P-x%P := min_le_right _ _
    omega

/-- Reflection to a representative in the first half of the circle preserves
the modular distance of every integer multiple. -/
theorem circularNorm_reflect {P : ℤ} (hP : 0 < P) (m : ℤ) :
    ∃ v : ℤ, 0 ≤ v ∧ 2*v ≤ P ∧ circularNorm P m=v ∧
      ∀ c : ℤ, circularNorm P (c*m)=circularNorm P (c*v) := by
  let r := m%P
  have hr0 : 0 ≤ r := Int.emod_nonneg _ (ne_of_gt hP)
  have hrP : r < P := Int.emod_lt_of_pos _ hP
  by_cases hr : 2*r ≤ P
  · refine ⟨r,hr0,hr,?_,?_⟩
    · exact min_eq_left (by omega)
    · intro c
      exact circularNorm_mul_mod P c m
  · refine ⟨P-r,by omega,by omega,?_,?_⟩
    · exact min_eq_right (by omega)
    · intro c
      rw [circularNorm_mul_mod P c m]
      change circularNorm P (c*r)=circularNorm P (c*(P-r))
      calc
        _ = circularNorm P (-(c*(P-r))+c*P) := by congr 1; ring
        _ = circularNorm P (-(c*(P-r))) := circularNorm_add_mul _ _ _
        _ = circularNorm P (c*(P-r)) := circularNorm_neg hP _

theorem one_even_pair_bound {P a m H : ℤ} (hP : 0 < P) (ha : 0 ≤ a)
    (h1 : H ≤ circularNorm P m) (h2 : H ≤ circularNorm P ((2*a)*m)) :
    (2*a+1)*H ≤ a*P := by
  obtain ⟨v,hv,hvP,he,hc⟩ := circularNorm_reflect hP m
  rw [he] at h1
  rw [hc] at h2
  have hvA : (2*a)*v ≤ P*a := by
    have hh := mul_nonneg ha (show 0 ≤ P-2*v by omega)
    nlinarith only [hh]
  have hh := h2.trans (circularNorm_le_abs hP ((2*a)*v) a)
  rw [abs_of_nonpos (by omega : (2*a)*v-P*a ≤ 0)] at hh
  have hm := mul_le_mul_of_nonneg_left h1 (show 0 ≤ 2*a by omega)
  nlinarith only [hm,hh]

theorem two_seven_pair_bound {P m H : ℤ} (hP : 0 < P)
    (hthreshold : 3*P ≤ 7*H)
    (h2 : H ≤ circularNorm P (2*m)) (h7 : H ≤ circularNorm P (7*m)) :
    H ≤ max (2*((2*P)/9)) (2*P-7*((2*P)/9+1)) := by
  obtain ⟨v,hv,hvP,_,hc⟩ := circularNorm_reflect hP m
  rw [hc] at h2 h7
  have hfirst := h2.trans (circularNorm_le_abs hP (2*v) 0)
  have hlast := h2.trans (circularNorm_le_abs hP (2*v) 1)
  simp only [mul_zero,sub_zero,abs_of_nonneg (by omega : 0 ≤ 2*v)] at hfirst
  rw [mul_one,abs_of_nonpos (by omega : 2*v-P ≤ 0)] at hlast
  have hv7 : 7*v ≤ 2*P := by omega
  have hsecond := h7.trans (circularNorm_le_abs hP (7*v) 2)
  rw [abs_of_nonpos (by omega : 7*v-P*2 ≤ 0)] at hsecond
  by_cases hq : v ≤ (2*P)/9
  · exact le_trans (by omega : H ≤ 2*((2*P)/9)) (le_max_left _ _)
  · exact le_trans (by omega : H ≤ 2*P-7*((2*P)/9+1)) (le_max_right _ _)

theorem two_five_pair_bound {P m H : ℤ} (hP : 0 < P)
    (hthreshold : 2*P ≤ 5*H)
    (h2 : H ≤ circularNorm P (2*m)) (h5 : H ≤ circularNorm P (5*m)) :
    H ≤ max (5*((2*P)/7)-P) (P-2*((2*P)/7+1)) := by
  obtain ⟨v,hv,hvP,_,hc⟩ := circularNorm_reflect hP m
  rw [hc] at h2 h5
  have hfirst := h2.trans (circularNorm_le_abs hP (2*v) 0)
  have hlast := h2.trans (circularNorm_le_abs hP (2*v) 1)
  simp only [mul_zero,sub_zero,abs_of_nonneg (by omega : 0 ≤ 2*v)] at hfirst
  rw [mul_one,abs_of_nonpos (by omega : 2*v-P ≤ 0)] at hlast
  have hv5 : P ≤ 5*v := by omega
  have hsecond := h5.trans (circularNorm_le_abs hP (5*v) 1)
  rw [mul_one,abs_of_nonneg (by omega : 0 ≤ 5*v-P)] at hsecond
  by_cases hq : v ≤ (2*P)/7
  · exact le_trans (by omega : H ≤ 5*((2*P)/7)-P) (le_max_left _ _)
  · exact le_trans (by omega : H ≤ P-2*((2*P)/7+1)) (le_max_right _ _)

theorem distance_grid (P m : ℤ) (hP : 0 < P) (d : ℕ) :
    Loneliness.distance ((d:ℝ)*((m:ℝ)/(P:ℝ))) =
      (circularNorm P ((d:ℤ)*m):ℝ)/(P:ℝ) := by
  have he : (d:ℝ)*((m:ℝ)/(P:ℝ)) = (((d:ℤ)*m:ℤ):ℝ)/(P:ℝ) := by push_cast; ring
  rw [he,Loneliness.distance_int_div _ _ hP]
  rfl

theorem clearance_grid_numerator (ds : List ℕ) (hne : ds ≠ []) (P m : ℤ) (hP : 0 < P) :
    ∃ H : ℤ, 0 ≤ H ∧ Loneliness.clearance ds ((m:ℝ)/(P:ℝ))=(H:ℝ)/(P:ℝ) ∧
      ∀ d ∈ ds, H ≤ circularNorm P ((d:ℤ)*m) := by
  obtain ⟨a,ha,he⟩ := Loneliness.clearance_eq_member hne ((m:ℝ)/(P:ℝ))
  let H := circularNorm P ((a:ℤ)*m)
  have heq : Loneliness.clearance ds ((m:ℝ)/(P:ℝ))=(H:ℝ)/(P:ℝ) := by
    rw [he,distance_grid _ _ hP]
  refine ⟨H,circularNorm_nonneg hP _,heq,?_⟩
  intro d hd
  have hh := Loneliness.clearance_le_of_mem hd ((m:ℝ)/(P:ℝ))
  rw [heq,distance_grid _ _ hP] at hh
  have hPR : (0:ℝ) < P := by exact_mod_cast hP
  exact_mod_cast (div_le_div_iff_of_pos_right hPR).mp hh

theorem value_lower_of_grid (ds : List ℕ) {P m H : ℤ} (hP : 0 < P)
    (hhalf : 2*H ≤ P) (h : ∀ d ∈ ds, H ≤ circularNorm P ((d:ℤ)*m)) :
    (H:ℝ)/(P:ℝ) ≤ Loneliness.value ds := by
  have hPR : (0:ℝ) < P := by exact_mod_cast hP
  apply le_trans (b:=Loneliness.clearance ds ((m:ℝ)/(P:ℝ)))
  · apply Loneliness.le_clearance
    · apply (div_le_iff₀ hPR).mpr
      have hh : (2:ℝ)*(H:ℝ) ≤ (P:ℝ) := by exact_mod_cast hhalf
      linarith
    · intro d hd
      rw [distance_grid _ _ hP]
      apply (div_le_div_iff_of_pos_right hPR).mpr
      exact_mod_cast h d hd
  · exact Loneliness.CriticalFamilies.le_value_any _ _

theorem circularNorm_lower {P H r x : ℤ} (_hP : 0 < P) (hH : 0 < H)
    (hlo : H ≤ r) (hhi : r ≤ P-H) (he : x%P=r%P) : H ≤ circularNorm P x := by
  rw [circularNorm_congr he]
  have hr0 : 0 ≤ r := by omega
  have hrP : r < P := by omega
  simp only [circularNorm,Int.emod_eq_of_lt hr0 hrP]
  exact le_min hlo (by omega)

end ThreeDistanceGraph
