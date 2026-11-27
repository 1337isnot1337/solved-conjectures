import Mathlib

/-!
# Malek's conjecture

Candidate scalar reductions from `results/malek-subpermanent/proof.md`,
equations (13)–(18), (23)–(24). This is not a formalization of the matrix
conjecture. The scalar analytic hypotheses are explicit. The three initial
lemmas reuse the candidate recorded in issue #145 on 23 November 2026.
-/

namespace MalekSubpermanent

/-- Exact positive certificate for the cubic in equation (18). -/
theorem slice_cubic_pos (s : ℝ) (hs : 0 ≤ s) :
    0 < 56*s^3 + 59*s^2 - 118*s + 38 := by
  have h₁ : 0 ≤ 56 * (s - 5/9)^2 * (s + 10/9) := by positivity
  have h₂ : 0 ≤ 59 * (s - 893/1593)^2 := by positivity
  have h₃ : (0 : ℝ) < 10969/43011 := by norm_num
  have hid : 56*s^3 + 59*s^2 - 118*s + 38 =
      56 * (s - 5/9)^2 * (s + 10/9) +
        59 * (s - 893/1593)^2 + 10969/43011 := by ring
  rw [hid]
  exact add_pos_of_nonneg_of_pos (add_nonneg h₁ h₂) h₃

/-- The squared radical in equation (17) is strictly smaller than (1-s)^2. -/
theorem slice_radical_gap (n s : ℝ) (hn : 5 ≤ n) (hs : 0 ≤ s) (hs₁ : s ≤ 1) :
    (28/45 : ℝ) * ((1+(n-1)*s)*(5/(4*n)-s^2/2)) < (1-s)^2 := by
  let f : ℝ → ℝ := fun t => (1+(t-1)*s)*(5/(4*t)-s^2/2)
  have hn₀ : 0 < n := by linarith
  have hnn : 0 ≤ n-5 := sub_nonneg.mpr hn
  have hs₂ : 0 ≤ 1-s := sub_nonneg.mpr hs₁
  have hid : 4*n*(f 5-f n) = (n-5)*(1-s+2*n*s^3) := by
    dsimp [f]
    field_simp [ne_of_gt hn₀] <;> ring
  have hprod : 0 ≤ 4*n*(f 5-f n) := by
    rw [hid]
    exact mul_nonneg hnn (add_nonneg hs₂ (by positivity))
  have hdiff : f n ≤ f 5 := by
    by_contra! h
    have hneg : f 5-f n < 0 := sub_neg.mpr h
    exact (not_lt_of_ge hprod)
      (mul_neg_of_pos_of_neg (show 0 < 4*n by positivity) hneg)
  have hgap : (1-s)^2-(28/45 : ℝ)*f 5 =
      (56*s^3+59*s^2-118*s+38)/45 := by
    dsimp [f]
    ring
  have hgap_pos : 0 < (1-s)^2-(28/45 : ℝ)*f 5 := by
    rw [hgap]
    exact div_pos (slice_cubic_pos s hs) (by norm_num)
  change (28/45 : ℝ)*f n < (1-s)^2
  exact lt_of_le_of_lt
    (mul_le_mul_of_nonneg_left hdiff (by norm_num))
    (sub_pos.mp hgap_pos)

/-- Contradiction in equation (17). -/
theorem slice_contradiction (n s : ℝ) (hn : 5 ≤ n) (hs : 0 ≤ s) (hs₁ : s < 1)
    (hr : 0 ≤ (28/45 : ℝ)*((1+(n-1)*s)*(5/(4*n)-s^2/2))) :
    s + Real.sqrt ((28/45 : ℝ)*((1+(n-1)*s)*(5/(4*n)-s^2/2))) < 1 := by
  let r : ℝ := (28/45 : ℝ)*((1+(n-1)*s)*(5/(4*n)-s^2/2))
  have hgap : r < (1-s)^2 := slice_radical_gap n s hn hs hs₁.le
  have hsq : (Real.sqrt r)^2 = r := Real.sq_sqrt hr
  have hnon := Real.sqrt_nonneg r
  change s + Real.sqrt r < 1
  by_contra! h
  have h₁ : 0 ≤ Real.sqrt r-(1-s) := by linarith
  have h₂ : 0 ≤ Real.sqrt r+(1-s) := by linarith
  have hp := mul_nonneg h₁ h₂
  nlinarith only [hgap, hsq, hp]

/-- Conditional normalized form of (13). Here s = sqrt(d/d₀),
p = p_max, and u = sinh(R/2)^2. The root-movement estimate and
analytic cost estimate are hypotheses, not conclusions. -/
theorem normalized_slice_bound (n s d₀ F p u : ℝ)
    (hn : 5 ≤ n) (hs : 0 ≤ s) (hd₀ : 0 < d₀) (hd₀₁ : d₀ ≤ 1)
    (hF : 0 ≤ F) (hp : 0 ≤ p) (hu : 0 ≤ u)
    (hpmax : n*p ≤ 1+(n-1)*s)
    (hcost : F ≤ 1/4 → u ≤ (8/15)*(n*F)+(16/225)*(n*F)^2)
    (hroot : 1 ≤ s+Real.sqrt (p*u/d₀)) :
    5/(4*n)*d₀ ≤ F+s^2*d₀/2 := by
  by_contra! hbad
  have hn0 : 0 < n := by linarith
  have hnne : n ≠ 0 := ne_of_gt hn0
  let w : ℝ := 5/4-n*s^2/2
  have hBudget : n*F ≤ d₀*w := by
    have hm := mul_le_mul_of_nonneg_left hbad.le hn0.le
    have hId : n*(5/(4*n)*d₀) = 5/4*d₀ := by
      field_simp [hnne] <;> ring
    rw [hId] at hm
    dsimp [w]
    nlinarith only [hm]
  have hNF0 : 0 ≤ n*F := mul_nonneg hn0.le hF
  have hw0 : 0 ≤ w := by
    by_contra! hw
    exact (not_lt_of_ge (le_trans hNF0 hBudget)) (mul_neg_of_pos_of_neg hd₀ hw)
  have hwupper : w ≤ 5/4 := by
    dsimp [w]
    have hh : 0 ≤ n*s^2/2 := by positivity
    linarith only [hh]
  have hD : d₀*w ≤ (5/4 : ℝ) := calc
    d₀*w ≤ 1*w := mul_le_mul_of_nonneg_right hd₀₁ hw0
    _ = w := one_mul _
    _ ≤ 5/4 := hwupper
  have hnF : n*F ≤ (5/4 : ℝ) := le_trans hBudget hD
  have hFquarter : F ≤ 1/4 := by
    have h5F := mul_le_mul_of_nonneg_right hn hF
    linarith only [hnF, h5F]
  have hslt : s < 1 := by
    by_contra! h
    have hsSq : 1 ≤ s^2 := by
      nlinarith only [mul_nonneg (sub_nonneg.mpr h) (by linarith : 0 ≤ s+1)]
    have hsMul : n ≤ n*s^2 := by
      simpa using mul_le_mul_of_nonneg_left hsSq hn0.le
    dsimp [w] at hw0
    linarith only [hw0, hn, hsMul]
  have hNF2 : (n*F)^2 ≤ (5/4)*(d₀*w) := by
    calc
      (n*F)^2 = (n*F)*(n*F) := by ring
      _ ≤ (5/4)*(d₀*w) := mul_le_mul hnF hBudget hNF0 (by norm_num)
  have huBound : u ≤ (28/45)*d₀*w := by
    have hc := hcost hFquarter
    have hl := mul_le_mul_of_nonneg_left hBudget (by norm_num : (0 : ℝ) ≤ 8/15)
    have hq := mul_le_mul_of_nonneg_left hNF2 (by norm_num : (0 : ℝ) ≤ 16/225)
    nlinarith only [hc, hl, hq]
  have hprod : p*u ≤ d₀*((28/45)*((1+(n-1)*s)*(5/(4*n)-s^2/2))) := by
    have hpm := mul_le_mul_of_nonneg_right hpmax
      (show 0 ≤ (28/45 : ℝ)*d₀*w by positivity)
    have hpu := mul_le_mul_of_nonneg_left huBound hp
    have h1 := mul_le_mul_of_nonneg_left hpu hn0.le
    have hI : n*(d₀*((28/45)*((1+(n-1)*s)*(5/(4*n)-s^2/2)))) =
        (1+(n-1)*s)*((28/45)*d₀*w) := by
      dsimp [w]
      field_simp [hnne] <;> ring
    have hL : n*(p*u) ≤ (1+(n-1)*s)*((28/45)*d₀*w) := by
      nlinarith only [hpm,h1]
    rw [← hI] at hL
    by_contra! hlt
    exact (not_lt_of_ge hL) (mul_lt_mul_of_pos_left hlt hn0)
  have hratio : p*u/d₀ ≤ (28/45)*((1+(n-1)*s)*(5/(4*n)-s^2/2)) := by
    apply (div_le_iff₀ hd₀).2
    simpa only [mul_comm] using hprod
  have hr : 0 ≤ (28/45 : ℝ)*((1+(n-1)*s)*(5/(4*n)-s^2/2)) :=
    le_trans (div_nonneg (mul_nonneg hp hu) hd₀.le) hratio
  have hsqrt := Real.sqrt_le_sqrt hratio
  have hcontra := slice_contradiction n s hn hs hslt hr
  linarith only [hroot, hsqrt, hcontra]

/-- The final rational comparison in (23), uniformly for n ≥ 8. -/
theorem upper_gap (n : ℝ) (hn : 8 ≤ n) :
    n/((n-1)*(2*(n-2)^2-n)) < 5/(4*n^2) := by
  have hn0 : 0 < n := by linarith
  have hn8 : 0 ≤ n-8 := sub_nonneg.mpr hn
  have h1 : 0 < n-1 := by linarith
  have h2 : 0 < 2*(n-2)^2-n := by
    rw [show 2*(n-2)^2-n = 2*(n-8)^2+23*(n-8)+64 by ring]
    positivity
  have hpoly : 0 < 6*n^3-55*n^2+85*n-40 := by
    rw [show 6*n^3-55*n^2+85*n-40 =
      6*(n-8)^3+89*(n-8)^2+357*(n-8)+192 by ring]
    positivity
  apply (div_lt_div_iff₀ (mul_pos h1 h2) (by positivity : 0 < 4*n^2)).2
  nlinarith only [hpoly]

/-- Rational comparisons for the three initial upper constants in (23).
This does not prove that these constants evaluate the subpermanent bounds. -/
theorem initial_gaps :
    (3685/73728 : ℝ) < 5/(4*5^2) ∧
    (4767/156250 : ℝ) < 5/(4*6^2) ∧
    (4421129/201553920 : ℝ) < 5/(4*7^2) := by
  norm_num

/-- Conditional scalar endpoint of (24), once both matrix estimates
are supplied. The variables a and r stand for alpha and squared norm. -/
theorem transform_strict_of_estimates (n a r q q' b : ℝ)
    (ha : 0 < a) (hr : 0 < r) (hb : b < 5/(4*n^2))
    (hlo : Real.exp (5/(4*n^2)*a*r) ≤ q)
    (hhi : q' ≤ 1+b*a*r) : q' < q := by
  have hmul := mul_lt_mul_of_pos_right (mul_lt_mul_of_pos_right hb ha) hr
  have hexp := Real.add_one_le_exp (5/(4*n^2)*a*r)
  linarith only [hmul, hexp, hlo, hhi]

end MalekSubpermanent
