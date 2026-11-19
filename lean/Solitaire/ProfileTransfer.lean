import Mathlib.Analysis.Real.Sqrt
import Mathlib.Algebra.Order.Floor.Semiring
import Mathlib.Topology.Algebra.Ring.Real
import Mathlib.Topology.MetricSpace.Pseudo.Basic
import Mathlib.Order.Filter.AtTopBot.Archimedean
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.FieldSimp
import Mathlib.Tactic.Positivity

/-! The analytic part of the corrected solitaire theorem. The finite dynamics
must supply the explicit column and mass inequalities below. -/
namespace SolitaireGeneral

open Filter
open scoped Topology

noncomputable def profile (a : ℝ) (mass : ℕ) (p : ℕ → ℕ) (x : ℝ) : ℝ :=
  a/(mass : ℝ)*(p (Nat.floor (a*x)) : ℝ)

theorem profile_column_bound (a n s k r z : ℝ)
    (ha : 0 < a) (hs : 0 < s) (hsn : s ≤ n) (hk : 0 < k)
    (hz : 0 ≤ z) (hzmass : (k+1)*z ≤ s)
    (hdiff : |r-z| ≤ 2*s/(k*(k+1))) :
    |a/n*r-a/s*z| ≤ 2*a/(k*(k+1))+a*(n-s)/(n*(k+1)) := by
  have hn : 0 < n := hs.trans_le hsn
  have hkp : 0 < k+1 := by linarith
  have han : 0 ≤ a/n := div_nonneg ha.le hn.le
  have hcoeff : 0 ≤ a/s-a/n := by
    apply sub_nonneg.mpr
    apply (div_le_div_iff₀ hn hs).mpr
    nlinarith
  have hfirst : a/n*(2*s/(k*(k+1))) ≤ 2*a/(k*(k+1)) := by
    calc
      a/n*(2*s/(k*(k+1))) = (2*a/(k*(k+1)))*(s/n) := by ring
      _ ≤ 2*a/(k*(k+1)) := mul_le_of_le_one_right (by positivity)
        ((div_le_one hn).mpr hsn)
  have hsecond : (a/s-a/n)*z ≤ a*(n-s)/(n*(k+1)) := by
    calc
      (a/s-a/n)*z ≤ (a/s-a/n)*(s/(k+1)) :=
        mul_le_mul_of_nonneg_left ((le_div_iff₀ hkp).mpr (by nlinarith)) hcoeff
      _ = a*(n-s)/(n*(k+1)) := by field_simp
  calc
    |a/n*r-a/s*z| = |a/n*(r-z)-(a/s-a/n)*z| := by congr 1; ring
    _ ≤ |a/n*(r-z)|+|(a/s-a/n)*z| := abs_sub _ _
    _ = a/n*|r-z|+(a/s-a/n)*z := by
      rw [abs_mul, abs_of_nonneg han, abs_of_nonneg (mul_nonneg hcoeff hz)]
    _ ≤ a/n*(2*s/(k*(k+1)))+(a/s-a/n)*z :=
      add_le_add (mul_le_mul_of_nonneg_left hdiff han) le_rfl
    _ ≤ 2*a/(k*(k+1))+a*(n-s)/(n*(k+1)) := add_le_add hfirst hsecond

theorem column_error_bound (a ε k : ℝ) (ha : 0 < a) (hε : 0 < ε)
    (hk : 0 < k) (hleft : a*ε/2 ≤ k) (hright : a*ε ≤ k+1) :
    2*a/(k*(k+1)) ≤ 4/(a*ε^2) := by
  have hp : a^2*ε^2 ≤ 2*(k*(k+1)) := by
    have hm := mul_le_mul hleft hright (by positivity : 0 ≤ a*ε) hk.le
    nlinarith
  apply (div_le_div_iff₀ (by positivity : 0 < k*(k+1))
    (by positivity : 0 < a*ε^2)).mpr
  nlinarith [mul_le_mul_of_nonneg_left hp ha.le]

theorem mass_error_bound (a ε n s k : ℝ) (ha : 0 < a) (hε : 0 < ε)
    (hn : 0 < n) (hsn : s ≤ n) (hk : 0 < k+1)
    (hright : a*ε ≤ k+1) (hgap : n-s ≤ Real.sqrt (2*n)) :
    a*(n-s)/(n*(k+1)) ≤ Real.sqrt 2/(ε*Real.sqrt n) := by
  have hratio : a/(k+1) ≤ 1/ε := by
    apply (div_le_div_iff₀ hk hε).mpr
    simpa using hright
  have hmass : (n-s)/n ≤ Real.sqrt (2*n)/n :=
    (div_le_div_iff_of_pos_right hn).mpr hgap
  have hsq : 0 < Real.sqrt n := Real.sqrt_pos.mpr hn
  have hid : Real.sqrt (2*n)/n = Real.sqrt 2/Real.sqrt n := by
    rw [Real.sqrt_mul (by norm_num : (0 : ℝ) ≤ 2)]
    apply (div_eq_div_iff (ne_of_gt hn) (ne_of_gt hsq)).mpr
    calc
      (Real.sqrt 2*Real.sqrt n)*Real.sqrt n = Real.sqrt 2*(Real.sqrt n)^2 := by ring
      _ = Real.sqrt 2*n := by rw [Real.sq_sqrt hn.le]
  calc
    a*(n-s)/(n*(k+1)) = (a/(k+1))*((n-s)/n) := by field_simp
    _ ≤ (1/ε)*(Real.sqrt (2*n)/n) :=
      mul_le_mul hratio hmass (div_nonneg (sub_nonneg.mpr hsn) hn.le) (by positivity)
    _ = Real.sqrt 2/(ε*Real.sqrt n) := by rw [hid]; ring

/-- A uniform estimate, valid for every column to the right of ε. -/
theorem profile_difference_bound (a ε x : ℝ) (n s : ℕ) (r z : ℕ → ℕ)
    (ha : 0 < a) (hε : 0 < ε) (hx : ε ≤ x) (hscale : 2 ≤ a*ε)
    (hs : 0 < s) (hsn : s ≤ n)
    (hdiff : ∀ k, 0 < k → |(r k : ℝ)-(z k : ℝ)| ≤
      2*(s : ℝ)/((k : ℝ)*(k+1)))
    (hzmass : ∀ k, (k+1)*z k ≤ s)
    (hgap : (n : ℝ)-(s : ℝ) ≤ Real.sqrt (2*(n : ℝ))) :
    |profile a n r x-profile a s z x| ≤
      4/(a*ε^2)+Real.sqrt 2/(ε*Real.sqrt (n : ℝ)) := by
  let k := Nat.floor (a*x)
  have hfloor : a*x < (k : ℝ)+1 := Nat.lt_floor_add_one _
  have hax : a*ε ≤ a*x := mul_le_mul_of_nonneg_left hx ha.le
  have hleft : a*ε/2 ≤ (k : ℝ) := by linarith
  have hright : a*ε ≤ (k : ℝ)+1 := hax.trans hfloor.le
  have hk : (0 : ℝ) < k := by nlinarith
  have hkn : 0 < k := by exact_mod_cast hk
  have hsr : (0 : ℝ) < s := by exact_mod_cast hs
  have hsnr : (s : ℝ) ≤ n := by exact_mod_cast hsn
  have hnr : (0 : ℝ) < n := hsr.trans_le hsnr
  have hz : ((k : ℝ)+1)*(z k : ℝ) ≤ s := by exact_mod_cast hzmass k
  exact (profile_column_bound a n s k (r k) (z k) ha hsr hsnr hk
    (Nat.cast_nonneg _) hz (hdiff k hkn)).trans
    (add_le_add (column_error_bound a ε k ha hε hk hleft hright)
      (mass_error_bound a ε n s k ha hε hnr hsnr (by linarith) hright hgap))

/-- The exact finite input needed by the analytic argument. -/
structure ProfileComparison (n s : ℕ) (r z : ℕ → ℕ) : Prop where
  stable_pos : 0 < s
  stable_le : s ≤ n
  column_error : ∀ k, 0 < k → |(r k : ℝ)-(z k : ℝ)| ≤
    2*(s : ℝ)/((k : ℝ)*(k+1))
  column_mass : ∀ k, (k+1)*z k ≤ s
  mass_gap : (n : ℝ)-(s : ℝ) ≤ Real.sqrt (2*(n : ℝ))

theorem ProfileComparison.bound {n s : ℕ} {r z : ℕ → ℕ}
    (h : ProfileComparison n s r z) (a ε x : ℝ)
    (ha : 0 < a) (hε : 0 < ε) (hx : ε ≤ x) (hscale : 2 ≤ a*ε) :
    |profile a n r x-profile a s z x| ≤
      4/(a*ε^2)+Real.sqrt 2/(ε*Real.sqrt (n : ℝ)) :=
  profile_difference_bound a ε x n s r z ha hε hx hscale
    h.stable_pos h.stable_le h.column_error h.column_mass h.mass_gap

theorem profile_error_tendsto (a : ℕ → ℝ) (ha : Tendsto a atTop atTop)
    (ε : ℝ) (hε : 0 < ε) :
    Tendsto (fun n => 4/(a n*ε^2)+Real.sqrt 2/(ε*Real.sqrt (n : ℝ)))
      atTop (𝓝 0) := by
  have hfirst := (ha.atTop_mul_const (pow_pos hε 2)).const_div_atTop (4 : ℝ)
  have hsqrt : Tendsto (fun n : ℕ => Real.sqrt (n : ℝ)) atTop atTop :=
    Real.tendsto_sqrt_atTop.comp tendsto_natCast_atTop_atTop
  have hsecond := (hsqrt.const_mul_atTop hε).const_div_atTop (Real.sqrt 2)
  simpa using hfirst.add hsecond

/-- Uniform convergence on every interval bounded away from zero. -/
theorem uniform_profile_difference (a : ℕ → ℝ) (s : ℕ → ℕ)
    (r z : ℕ → ℕ → ℕ) (ha : Tendsto a atTop atTop)
    (hapos : ∀ n, 0 < a n)
    (hcomp : ∀ n, 0 < n → ProfileComparison n (s n) (r n) (z n))
    (ε : ℝ) (hε : 0 < ε) :
    TendstoUniformlyOn
      (fun n x => profile (a n) n (r n) x-profile (a n) (s n) (z n) x)
      (fun _ => 0) atTop (Set.Ici ε) := by
  apply Metric.tendstoUniformlyOn_iff.mpr
  intro δ hδ
  have herr := (profile_error_tendsto a ha ε hε).eventually (gt_mem_nhds hδ)
  have hscale := (ha.atTop_mul_const hε).eventually_ge_atTop 2
  filter_upwards [herr, hscale, eventually_ge_atTop 1] with n hn hscl hnpos
  intro x hx
  have hb := (hcomp n (by omega)).bound (a n) ε x (hapos n) hε hx hscl
  simpa only [Real.dist_eq, zero_sub, abs_neg] using hb.trans_lt hn

/-- Every pointwise stable profile limit transfers to the comparison sequence. -/
theorem profile_limit_transfer (a : ℕ → ℝ) (s : ℕ → ℕ)
    (r z : ℕ → ℕ → ℕ) (ha : Tendsto a atTop atTop)
    (hapos : ∀ n, 0 < a n)
    (hcomp : ∀ n, 0 < n → ProfileComparison n (s n) (r n) (z n))
    (x L : ℝ) (hx : 0 < x)
    (hz : Tendsto (fun n => profile (a n) (s n) (z n) x) atTop (𝓝 L)) :
    Tendsto (fun n => profile (a n) n (r n) x) atTop (𝓝 L) := by
  have hd := (uniform_profile_difference a s r z ha hapos hcomp x hx).tendsto_at
    (show x ∈ Set.Ici x by simp)
  simpa using hd.add hz

end SolitaireGeneral
