module
public import Mathlib.Analysis.Complex.Exponential
import Mathlib.Analysis.Complex.ExponentialBounds
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Positivity
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Complex Finset
open scoped BigOperators

noncomputable def centeredBernoulliFactor (p θ : ℝ) : ℂ :=
  (1-(p:ℂ))*Complex.exp ((↑(-θ*p):ℂ)*Complex.I)+
    (p:ℂ)*Complex.exp ((↑(θ*(1-p)):ℂ)*Complex.I)

private theorem phase_norm (x : ℝ) : ‖Complex.exp ((x:ℂ)*Complex.I)‖=1 := by
  rw [Complex.norm_exp]
  simp

theorem norm_centeredBernoulliFactor_le {p : ℝ} (h₀ : 0≤p) (h₁ : p≤1) (θ : ℝ) :
    ‖centeredBernoulliFactor p θ‖≤1 := by
  unfold centeredBernoulliFactor
  have hp : 0≤1-p := sub_nonneg.mpr h₁
  simp_rw [← Complex.ofReal_one,← Complex.ofReal_sub]
  refine (norm_add_le _ _).trans ?_
  rw [norm_mul,norm_mul,phase_norm,phase_norm,Complex.norm_real,Complex.norm_real,
    Real.norm_of_nonneg hp,Real.norm_of_nonneg h₀]
  linarith

private theorem phase_taylor_error (x : ℝ) (hx : |x|≤1) :
    ‖Complex.exp ((x:ℂ)*Complex.I)-
      (1+(x:ℂ)*Complex.I-(x:ℂ)^2/2)‖≤3*|x|^3 := by
  let z : ℂ := (x:ℂ)*Complex.I
  have hz : ‖z‖=|x| := by unfold z; rw [norm_mul,Complex.norm_real,Complex.norm_I,mul_one,Real.norm_eq_abs]
  have he := Complex.norm_exp_sub_sum_le_norm_mul_exp z 3
  have hsum : (∑ m ∈ Finset.range 3,z^m/(m.factorial:ℂ))=
      1+(x:ℂ)*Complex.I-(x:ℂ)^2/2 := by
    simp only [Finset.sum_range_succ,Finset.sum_range_zero,pow_zero,pow_one]
    norm_num [z,Complex.I_sq,mul_pow]
    ring
  rw [hsum,hz] at he
  refine he.trans ?_
  rw [mul_comm (3:ℝ)]
  exact mul_le_mul_of_nonneg_left
    ((Real.exp_le_exp.mpr hx).trans Real.exp_one_lt_three.le) (by positivity)

/-- Quantitative one-coordinate bound, weighted by the actual variance.
The factor is the exact characteristic function of the centered
Bernoulli observation, not a normal approximation assumption. -/
theorem centeredBernoulliFactor_quadratic_error {p θ : ℝ}
    (h₀ : 0≤p) (h₁ : p≤1) (hθ : |θ|≤1) :
    ‖centeredBernoulliFactor p θ-(1-(↑(θ^2*p*(1-p)/2:ℝ):ℂ))‖ ≤
      3*|θ|^3*(p*(1-p)) := by
  let a := -θ*p
  let b := θ*(1-p)
  let q (x : ℝ) : ℂ := 1+(x:ℂ)*Complex.I-(x:ℂ)^2/2
  have hq : 0≤1-p := sub_nonneg.mpr h₁
  have hq' : 1-p≤1 := by linarith
  have ha : |a|=|θ| *p := by unfold a; rw [abs_mul,abs_neg,abs_of_nonneg h₀]
  have hb : |b|=|θ| *(1-p) := by unfold b; rw [abs_mul,abs_of_nonneg hq]
  have ha₁ : |a|≤1 := by
    rw [ha]; exact (mul_le_mul_of_nonneg_left h₁ (abs_nonneg θ)).trans (by simpa using hθ)
  have hb₁ : |b|≤1 := by
    rw [hb]; exact (mul_le_mul_of_nonneg_left hq' (abs_nonneg θ)).trans (by simpa using hθ)
  have hcenter : (↑(1-p):ℂ)*q a+(p:ℂ)*q b=1-(↑(θ^2*p*(1-p)/2:ℝ):ℂ) := by
    unfold q a b
    push_cast
    ring
  have hrew : centeredBernoulliFactor p θ-(1-(↑(θ^2*p*(1-p)/2:ℝ):ℂ)) =
      (↑(1-p):ℂ)*(Complex.exp ((a:ℂ)*Complex.I)-q a)+
        (p:ℂ)*(Complex.exp ((b:ℂ)*Complex.I)-q b) := by
    rw [← hcenter]
    unfold centeredBernoulliFactor a b
    push_cast
    ring
  rw [hrew]
  calc
    _ ≤ _ := norm_add_le _ _
    _ = (1-p)*‖Complex.exp ((a:ℂ)*Complex.I)-q a‖+
          p*‖Complex.exp ((b:ℂ)*Complex.I)-q b‖ := by
        rw [norm_mul,norm_mul,Complex.norm_real,Complex.norm_real,Real.norm_of_nonneg hq,Real.norm_of_nonneg h₀]
    _ ≤ (1-p)*(3*|a|^3)+p*(3*|b|^3) :=
      add_le_add (mul_le_mul_of_nonneg_left (phase_taylor_error a ha₁) hq)
        (mul_le_mul_of_nonneg_left (phase_taylor_error b hb₁) h₀)
    _ ≤ _ := by
      rw [ha,hb]
      have hp₂ : p^2≤p := by nlinarith [mul_nonneg h₀ hq]
      have hq₂ : (1-p)^2≤1-p := by nlinarith [mul_nonneg h₀ hq]
      have hm := mul_le_mul_of_nonneg_left (show p^2+(1-p)^2≤1 by linarith)
        (show 0≤3*|θ|^3*(p*(1-p)) by positivity)
      convert hm using 1 <;> ring

/-- A finite product estimate for factors in the closed unit disk. -/
theorem norm_prod_sub_prod_le_sum {ι : Type*} (S : Finset ι) (a b : ι→ℂ)
    (ha : ∀ i∈S,‖a i‖≤1) (hb : ∀ i∈S,‖b i‖≤1) :
    ‖(∏ i∈S,a i)-(∏ i∈S,b i)‖≤∑ i∈S,‖a i-b i‖ := by
  classical
  induction S using Finset.induction_on with
  | empty => simp
  | @insert i S hi ih =>
      have hia := ha i (Finset.mem_insert_self ..)
      have hib := hb i (Finset.mem_insert_self ..)
      have haS j (hj:j∈S) := ha j (Finset.mem_insert_of_mem hj)
      have hbS j (hj:j∈S) := hb j (Finset.mem_insert_of_mem hj)
      rw [Finset.prod_insert hi,Finset.prod_insert hi,Finset.sum_insert hi]
      have hprod : ‖∏ j∈S,a j‖≤1 := by
        rw [norm_prod]
        exact Finset.prod_le_one₀ (fun _ _=>norm_nonneg _) haS
      calc
        _ = ‖(a i-b i)*(∏ j∈S,a j)+b i*((∏ j∈S,a j)-(∏ j∈S,b j))‖ := by
          congr 1
          ring
        _ ≤ _ := norm_add_le _ _
        _ ≤ _ := by
          rw [norm_mul,norm_mul]
          exact add_le_add
            (mul_le_of_le_one_right (norm_nonneg _) hprod)
            ((mul_le_of_le_one_left (norm_nonneg _) hib).trans (ih haS hbS))

end PomeranceSarkozy
