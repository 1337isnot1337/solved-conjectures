module
public import Conjectures.PomeranceSarkozyBernoulliCharacteristic
import Mathlib.Analysis.Complex.Trigonometric
import Mathlib.Algebra.BigOperators.Field
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.Ring

@[expose] public section
namespace PomeranceSarkozy

open Complex Finset
open scoped BigOperators

theorem centeredBernoulliFactor_normal_error {p θ : ℝ}
    (h₀ : 0≤p) (h₁ : p≤1) (hθ : |θ|≤1) :
    ‖centeredBernoulliFactor p θ-Complex.exp (↑(-(θ^2*p*(1-p)/2):ℝ):ℂ)‖ ≤
      4*|θ| ^3*(p*(1-p)) := by
  let v := p*(1-p)
  let a := θ^2*v/2
  have hv : 0≤v := mul_nonneg h₀ (sub_nonneg.mpr h₁)
  have hv₁ : v≤1 := by unfold v; nlinarith [sq_nonneg p]
  have ha : 0≤a := by unfold a; positivity
  have hθsq : θ^2=|θ|^2 := (sq_abs θ).symm
  have hθ₂ : θ^2≤1 := by
    rw [hθsq]
    exact (pow_le_pow_left₀ (abs_nonneg _) hθ 2).trans_eq (by norm_num)
  have ha₁ : a≤1 := by
    unfold a
    have hb := mul_le_mul hθ₂ hv₁ hv zero_le_one
    linarith
  have he := Real.norm_exp_sub_one_sub_id_le (x:=-a) (by
    rw [Real.norm_eq_abs,abs_neg,abs_of_nonneg ha]; exact ha₁)
  have hreal : ‖(1-(a:ℂ))-Complex.exp ((-a:ℝ):ℂ)‖≤a^2 := by
    rw [← norm_neg,neg_sub,← Complex.ofReal_exp,← Complex.ofReal_one,← Complex.ofReal_sub,
      ← Complex.ofReal_sub,Complex.norm_real,show Real.exp (-a)-(1-a)=Real.exp (-a)-1-(-a) by ring]
    simpa only [norm_neg,Real.norm_of_nonneg ha] using he
  have h2 : a^2≤|θ| ^3*v := by
    have hv₂ : v^2≤v := by nlinarith [mul_nonneg hv (sub_nonneg.mpr hv₁)]
    have ht₄ : |θ| ^4≤|θ| ^3 := by
      rw [pow_succ]
      exact mul_le_of_le_one_right (by positivity) hθ
    calc
      _ = |θ| ^4*v^2/4 := by unfold a; rw [hθsq]; ring
      _ ≤ |θ| ^4*v^2 := by linarith [show 0≤|θ| ^4*v^2 by positivity]
      _ ≤ _ := mul_le_mul ht₄ hv₂ (sq_nonneg _) (by positivity)
  rw [show θ^2*p*(1-p)/2=a by unfold a v; ring]
  change ‖centeredBernoulliFactor p θ-Complex.exp ((-a:ℝ):ℂ)‖≤4*|θ| ^3*v
  calc
    _ ≤ ‖centeredBernoulliFactor p θ-(1-(a:ℂ))‖+
        ‖(1-(a:ℂ))-Complex.exp ((-a:ℝ):ℂ)‖ := norm_sub_le_norm_sub_add_norm_sub _ _ _
    _ ≤ 3*|θ| ^3*v+a^2 := by
      apply add_le_add _ hreal
      have h := centeredBernoulliFactor_quadratic_error h₀ h₁ hθ
      convert h using 2; unfold a v; push_cast; ring
    _ ≤ _ := by linarith [h2]

/-- A finite Berry-type Fourier estimate for independent, possibly
non-identical Bernoulli coordinates. It keeps the actual total variance. -/
theorem centeredBernoulliProduct_normal_error {ι : Type*} (S : Finset ι) (p : ι→ℝ)
    (hp : ∀ i∈S,0≤p i ∧ p i≤1) {θ : ℝ} (hθ : |θ|≤1) :
    ‖(∏ i∈S,centeredBernoulliFactor (p i) θ)-
      Complex.exp (↑(-(θ^2*(∑ i∈S,p i*(1-p i))/2):ℝ):ℂ)‖ ≤
      4*|θ| ^3*(∑ i∈S,p i*(1-p i)) := by
  let v (i : ι) : ℝ := p i*(1-p i)
  let b (i : ι) : ℂ := Complex.exp (↑(-(θ^2*v i/2):ℝ):ℂ)
  have hb (i : ι) (hi : i∈S) : ‖b i‖≤1 := by
    unfold b
    rw [Complex.norm_exp,Complex.ofReal_re,Real.exp_le_one_iff]
    have hv : 0≤v i := mul_nonneg (hp i hi).1 (sub_nonneg.mpr (hp i hi).2)
    exact neg_nonpos.mpr (by positivity)
  have hB : (∏ i∈S,b i)=Complex.exp (↑(-(θ^2*(∑ i∈S,v i)/2):ℝ):ℂ) := by
    have hsum : (∑ i∈S,-(θ^2*v i/2))= -(θ^2*(∑ i∈S,v i)/2) := by
      rw [Finset.sum_neg_distrib,← Finset.sum_div,← Finset.mul_sum]
    unfold b
    rw [← Complex.exp_sum]
    rw [← hsum]
    congr 1
    exact (map_sum Complex.ofRealHom _ _).symm
  change ‖_ - Complex.exp (↑(-(θ^2*(∑ i∈S,v i)/2):ℝ):ℂ)‖≤_
  rw [← hB]
  refine (norm_prod_sub_prod_le_sum S _ b (fun i hi=>norm_centeredBernoulliFactor_le (hp i hi).1 (hp i hi).2 θ) hb).trans ?_
  change (∑ i∈S,‖centeredBernoulliFactor (p i) θ-b i‖)≤4*|θ| ^3*(∑ i∈S,v i)
  rw [Finset.mul_sum]
  apply Finset.sum_le_sum
  intro i hi
  have h := centeredBernoulliFactor_normal_error (hp i hi).1 (hp i hi).2 hθ
  convert h using 2; unfold b v; push_cast; ring

end PomeranceSarkozy
