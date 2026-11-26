import Conjectures.ChernFuLinThreeStatisticRoot
import Mathlib.RingTheory.PowerSeries.Substitution
import Mathlib.RingTheory.MvPowerSeries.LinearTopology
import Mathlib.Topology.Algebra.IsUniformGroup.Constructions

/-! # From the two flag-word recurrences to the weighted moment

The cumulative sums `p`, `q`, `w` in the recurrences start at index one;
using their first differences avoids any division by the catalytic variable.
-/

namespace Conjectures.ChernFuLinThreeStatistic.Kernel

open PowerSeries

variable {R : Type*} [CommRing R]

/-- `p n = ∑_{h=1}^n α h u^(n-h)`, `q n = ∑_{h=1}^n α h`, and
`w n = ∑_{h=1}^n β h`. The terminals are `v^n`, `g*v^n`. -/
structure Recurrence (x k u iz v g : R) where
  α : ℕ → R
  β : ℕ → R
  p : ℕ → R
  q : ℕ → R
  w : ℕ → R
  p0 : p 0 = 0
  q0 : q 0 = 0
  w0 : w 0 = 0
  ps : ∀ n, p (n+1) = u*p n + α (n+1)
  qs : ∀ n, q (n+1) = q n + α (n+1)
  ws : ∀ n, w (n+1) = w n + β (n+1)
  αs : ∀ n, α n = x*α (n+1)+k*u*iz*p n+x*(g*v^n+k*w (n+1)+p (n+1)-q (n+1))
  βs : ∀ n, β n = v^n+x*β (n+1)+k*w n+(1+k*u*iz)*p n-q n

private def shift (f : ℕ → R) (n : ℕ) := f (n+1)

private theorem shift_eq (f : ℕ → R) : X*mk (shift f) = mk f-C (f 0) := by
  unfold shift
  simpa using (sub_const_eq_X_mul_shift (mk f)).symm

private theorem mk_add (f g : ℕ → R) : mk (f+g) = mk f + mk g := by ext; simp
private theorem mk_sub (f g : ℕ → R) : mk (f-g) = mk f - mk g := by ext; simp
private theorem mk_scale (a : R) (f : ℕ → R) : mk (fun n => a*f n) = C a * mk f := by
  ext; simp

private theorem geom_eq (v : R) : (1-C v*X)*mk (fun n : ℕ => v^n) = 1 := by
  have h := shift_eq (fun n : ℕ => v^n)
  have hv : shift (fun n : ℕ => v^n) = fun n => v*v^n := funext fun n => pow_succ' ..
  rw [hv, mk_scale, pow_zero, map_one] at h
  linear_combination -h

/-- Evaluate at any admissible `s` with a ring homomorphism that fixes the
coefficient ring and sends the catalytic indeterminate to `s`. -/
theorem system_of_recurrence {x s k u iz z v g : R} (T : Recurrence x k u iz v g)
    (hu : u*(1-k) = 1) (hiz : z*iz = 1) (E : PowerSeries R →+* R)
    (hc : ∀ a, E (C a) = a) (hx : E X = s) :
    System s x k z (T.α 0) (T.β 0) 1 g (1-v*s) := by
  let J (f : ℕ → R) := E (mk f)
  have plus (f g : ℕ → R) : J (f+g) = J f + J g := by simp [J,mk_add]
  have minus (f g : ℕ → R) : J (f-g) = J f - J g := by simp [J,mk_sub]
  have scal (c : R) (f : ℕ → R) : J (fun i => c*f i) = c*J f := by simp [J,mk_scale,hc]
  have sh (f : ℕ → R) : s*J (shift f) = J f-f 0 := by
    simpa [J,hx,hc] using congrArg E (shift_eq f)
  let A := J T.α-T.α 0
  let B := J T.β-T.β 0
  let P := J T.p
  let Q := J T.q
  let W := J T.w
  let F := J fun n : ℕ => v^n
  let e := 1-v*s
  have he : e*F = 1 := by simpa [e,F,J,hc,hx] using congrArg E (geom_eq v)
  have hP : (k+s-1)*P = (k-1)*A := by
    have h : shift T.p = (fun n => u*T.p n) + shift T.α := funext T.ps
    have h' := sh T.p
    rw [h, plus, scal,T.p0,sub_zero,mul_add,sh] at h'
    dsimp only [P,A]; linear_combination (1-k)*h' - s*J T.p*hu
  have hQ : (s-1)*Q = -A := by
    have h : shift T.q = T.q + shift T.α := funext T.qs
    have h' := sh T.q
    rw [h, plus,T.q0,sub_zero,mul_add,sh] at h'
    dsimp [Q,A]; linear_combination h'
  have hW : (s-1)*W = -B := by
    have h : shift T.w = T.w + shift T.β := funext T.ws
    have h' := sh T.w
    rw [h, plus,T.w0,sub_zero,mul_add,sh] at h'
    dsimp [W,B]; linear_combination h'
  have ha : s*(A+T.α 0) = x*A + k*u*iz*s*P + x*(s*g*F + k*W + P-Q) := by
    have h : T.α = (fun n => x*shift T.α n) + (fun n => k*u*iz*T.p n) +
      (fun n => x*((((fun j : ℕ => g*v^j) + (fun j : ℕ => k*shift T.w j) + shift T.p - shift T.q) : ℕ → R) n)) := funext T.αs
    have h' := congrArg J h
    rw [plus,plus,scal,scal,scal,minus,plus,plus,scal,scal] at h'
    dsimp only [A,F,W,P,Q]
    linear_combination s*h' + x*sh T.α + x*k*sh T.w + x*sh T.p - x*sh T.q
      - x*k*T.w0 - x*T.p0 + x*T.q0
  have hb : s*(B+T.β 0) = s*F + x*B + s*k*W + s*(1+k*u*iz)*P-s*Q := by
    have h : T.β = (fun n : ℕ => v^n) + (fun n => x*shift T.β n) +
      (fun n => k*T.w n) + (fun n => (1+k*u*iz)*T.p n) - T.q := funext T.βs
    have h' := congrArg J h
    rw [minus,plus,plus,plus,scal,scal,scal] at h'
    dsimp only [B,F,W,P,Q]
    linear_combination s*h' + x*sh T.β
  have huv : z*(k-1)*u*iz = -1 := by linear_combination -z*iz*hu - hiz
  refine ⟨A,B,?_,?_⟩ <;> change e * _ = _ * _
  · unfold k11 k12 H
    linear_combination e*z*(s-1)*(k+s-1)*ha + x*s*z*(s-1)*(k+s-1)*g*he
      + e*z*(s-1)*(k*u*iz*s+x)*hP - e*x*z*(k+s-1)*hQ + e*x*k*z*(k+s-1)*hW
      + e*k*s*(s-1)*A*huv
  · unfold k21 k22 H
    linear_combination e*z*(s-1)*(k+s-1)*hb + s*z*(s-1)*(k+s-1)*he
      + e*s*z*(s-1)*(1+k*u*iz)*hP - e*s*z*(k+s-1)*hQ + e*s*k*z*(k+s-1)*hW
      + e*s*(s-1)*k*A*huv

private theorem scale_system {s x k z a b f g e : R} (h : System s x k z a b f g e) (d : R) :
    System s x k z a b (d*f) (d*g) (d*e) := by
  obtain ⟨A,B,ha,hb⟩ := h
  exact ⟨A,B,by linear_combination d*ha,by linear_combination d*hb⟩

open scoped MvPowerSeries.WithPiTopology PowerSeries.WithPiTopology in
private theorem catalytic_eval {K : Type*} [Field K] (s : PowerSeries K) (hs : constantCoeff s = 0) :
    ∃ E : PowerSeries (PowerSeries K) →+* PowerSeries K, (∀ a, E (C a) = a) ∧ E X = s := by
  let _ : UniformSpace K := ⊥
  let φ := RingHom.id (PowerSeries K)
  have hφ : Continuous φ := continuous_id
  have h : HasEval s := WithPiTopology.isTopologicallyNilpotent_of_constantCoeff_zero hs
  refine ⟨eval₂Hom hφ h, fun a => ?_, ?_⟩
  · rw [coe_eval₂Hom, eval₂_C]; rfl
  · rw [coe_eval₂Hom, eval₂_X]

/-- The ordinary and weighted recurrences imply `M = R + tR²`, with
`R = z(β₀-1)` and `M = z(β̃₀-1)`. This is an implication about recurrences;
applying it to permutation statistics requires the flag-word counting rules. -/
theorem moment_of_recurrences {K : Type*} [Field K] {t z : K}
    (ht : t ≠ 0) (hz : z ≠ 0) (hz' : z+1 ≠ 0)
    (u : PowerSeries K) (hu : u*(1-X*C t*C z) = 1)
    (T : Recurrence X (X*C t*C z) u (C z⁻¹) 1 1)
    (M : Recurrence X (X*C t*C z) u (C z⁻¹) u u) :
    C z*(M.β 0-1) = C z*(T.β 0-1) + C t*(C z*(T.β 0-1))^2 := by
  let x : PowerSeries K := X
  let k := x*C t*C z
  obtain ⟨r,hr0,hr,hrx,hHr,hHx,hk,hc,hD⟩ := formal_root ht hz hz'
  have hiz : C z*C z⁻¹ = 1 := by simp [← map_mul,hz]
  have systems (s : PowerSeries K) (hs : constantCoeff s = 0) :
      System s x k (C z) (T.α 0) (T.β 0) 1 1 (1-s) ∧
      System s x k (C z) (M.α 0) (M.β 0) (1-k) 1 (1-k-s) := by
    obtain ⟨E,h₁,h₂⟩ := catalytic_eval s hs
    constructor
    · simpa using system_of_recurrence T hu hiz E h₁ h₂
    · have h := scale_system (system_of_recurrence M hu hiz E h₁ h₂) (1-k)
      have hgu : (1-k)*u = 1 := by rwa [mul_comm]
      have hden : (1-k)*(1-u*s) = 1-k-s := by linear_combination -s*hgu
      simpa only [mul_one,hgu,hden] using h
  have h₁ := systems x constantCoeff_X
  have h₂ := systems r hr0
  have h := two_root_moment hr hrx hHr hHx hk hc hD h₁.1 h₂.1 h₁.2 h₂.2
  apply mul_left_cancel₀ (PowerSeries.X_ne_zero (R := K))
  linear_combination C z*h

end Conjectures.ChernFuLinThreeStatistic.Kernel
