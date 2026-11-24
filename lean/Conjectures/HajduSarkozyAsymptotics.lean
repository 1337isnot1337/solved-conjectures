import Mathlib.Analysis.Asymptotics.SpecificAsymptotics
import Mathlib.Algebra.Field.GeomSum
import Mathlib.Tactic

/-!
# Hajdu–Sárközy's shifted-power perturbation conjecture

Geometric summation preserves little-oh bounds.  Applying this twice removes
the logarithmic multiplicity of the geometric rectangles in the recorded
proof.  The squared smaller-side counts obey the same bound after embedding
their indices at the even integers.
-/

open Filter Finset Asymptotics

namespace Conjectures.HajduSarkozy

def prefixSum (f : ℕ → ℝ) (n : ℕ) : ℝ := ∑ i ∈ range n, f i

def doublePrefix (f : ℕ → ℝ) (n : ℕ) : ℝ :=
  ∑ t ∈ range (n+1), ∑ s ∈ range (t+1), f s

theorem geometric_prefix_tendsto {q : ℝ} (hq : 1 < q) :
    Tendsto (prefixSum fun n => q^n) atTop atTop := by
  apply tendsto_atTop_mono _ tendsto_natCast_atTop_atTop
  intro n
  calc
    (n : ℝ) = ∑ i ∈ range n, (1 : ℝ) := by simp
    _ ≤ ∑ i ∈ range n, q^i := by
      exact sum_le_sum fun i _ => one_le_pow₀ hq.le

theorem geometric_prefix_isBigO {q : ℝ} (hq : 1 < q) :
    (prefixSum fun n => q^n) =O[atTop] fun n => q^n := by
  apply IsBigO.of_bound (1/(q-1))
  filter_upwards [] with n
  have hsum : 0 ≤ prefixSum (fun n => q^n) n := by
    exact sum_nonneg fun i _ => pow_nonneg (by linarith) i
  rw [Real.norm_of_nonneg hsum, Real.norm_of_nonneg (pow_nonneg (by linarith : 0 ≤ q) n)]
  unfold prefixSum
  rw [geom_sum_eq (ne_of_gt hq)]
  calc
    (q^n-1)/(q-1) ≤ q^n/(q-1) := by gcongr; linarith
    _ = 1/(q-1)*q^n := by ring

theorem prefixSum_isLittleO {q : ℝ} {f : ℕ → ℝ} (hq : 1 < q)
    (hf : f =o[atTop] fun n => q^n) :
    prefixSum f =o[atTop] fun n => q^n := by
  have hh := hf.sum_range (fun n => pow_nonneg (by linarith : 0 ≤ q) n)
    (geometric_prefix_tendsto hq)
  exact hh.trans_isBigO (geometric_prefix_isBigO hq)

theorem shift_isLittleO {q : ℝ} {f : ℕ → ℝ} (_hq : 1 < q)
    (hf : f =o[atTop] fun n => q^n) :
    (fun n => f (n+1)) =o[atTop] fun n => q^n := by
  have hh := hf.comp_tendsto (tendsto_add_atTop_nat 1)
  have hb : (fun n : ℕ => q^(n+1)) =O[atTop] fun n => q^n := by
    simpa only [pow_succ, mul_comm] using
      (isBigO_refl (fun n : ℕ => q^n) atTop).const_mul_left q
  exact hh.trans_isBigO hb

theorem doublePrefix_isLittleO {q : ℝ} {f : ℕ → ℝ} (hq : 1 < q)
    (hf : f =o[atTop] fun n => q^n) :
    doublePrefix f =o[atTop] fun n => q^n := by
  have h₁ := shift_isLittleO hq (prefixSum_isLittleO hq hf)
  have h₂ := shift_isLittleO hq (prefixSum_isLittleO hq h₁)
  exact h₂

theorem half_square_isLittleO {q : ℝ} {f : ℕ → ℝ} (hq : 1 < q)
    (hf : f =o[atTop] fun n => q^n) :
    (fun n => (f (n/2))^2) =o[atTop] fun n => q^n := by
  have hhalf : Tendsto (fun n : ℕ => n/2) atTop atTop := by
    refine tendsto_atTop.2 fun n => ?_
    exact eventually_atTop.2 ⟨2*n, fun m hm => by omega⟩
  apply IsLittleO.of_bound
  intro ε hε
  let δ := min ε 1
  have hδ : 0 < δ := lt_min hε zero_lt_one
  have hδsq : δ^2 ≤ ε := by
    have h₁ : δ ≤ ε := min_le_left _ _
    have h₂ : δ ≤ 1 := min_le_right _ _
    nlinarith
  filter_upwards [(hf.comp_tendsto hhalf).bound hδ] with n hn
  change ‖f (n/2)‖ ≤ δ*‖q^(n/2)‖ at hn
  rw [Real.norm_of_nonneg (pow_nonneg (by linarith : 0 ≤ q) (n/2))] at hn
  rw [Real.norm_of_nonneg (pow_nonneg (by linarith : 0 ≤ q) n)]
  calc
    ‖(f (n/2))^2‖ = ‖f (n/2)‖^2 := norm_pow _ _
    _ ≤ (δ*q^(n/2))^2 := pow_le_pow_left₀ (norm_nonneg _) hn 2
    _ = δ^2*q^(n/2+n/2) := by rw [mul_pow, pow_two (q^(n/2)), ← pow_add]
    _ ≤ ε*q^n := mul_le_mul hδsq (pow_le_pow_right₀ hq.le (by omega))
      (by positivity) hε.le

theorem doublePrefix_nonneg {f : ℕ → ℝ} (hf : ∀ n, 0 ≤ f n) (n : ℕ) :
    0 ≤ doublePrefix f n := by
  exact sum_nonneg fun i _ => sum_nonneg fun j _ => hf j

end Conjectures.HajduSarkozy
