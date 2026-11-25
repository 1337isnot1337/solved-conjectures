import Conjectures.HajduSarkozyProductsCounts
import Mathlib.Topology.Algebra.InfiniteSum.Real
import Mathlib.Topology.Algebra.InfiniteSum.NatInt

/-!
# Hajdu–Sárközy's shifted-product total primitivity conjecture

Nonnegative summable coefficient tails and the order of limits in the
recorded proof: first fix finitely many colors, then take the geometric
index to infinity, and finally let the coefficient tail tend to zero.
-/

open Classical Filter Finset Asymptotics
open scoped Topology

namespace Conjectures.HajduSarkozy.Products

noncomputable section

def tailMass (w : ℕ → ℝ) (T : ℕ) : ℝ :=
  (∑' i, w i) - ∑ i ∈ range T, w i

theorem tailMass_nonneg {w : ℕ → ℝ} (hw : ∀ i, 0 ≤ w i)
    (hsum : Summable w) (T : ℕ) : 0 ≤ tailMass w T := by
  exact sub_nonneg.mpr (hsum.sum_le_tsum (range T) (fun i _ => hw i))

theorem tailMass_tendsto {w : ℕ → ℝ} (hsum : Summable w) :
    Tendsto (tailMass w) atTop (𝓝 0) := by
  change Tendsto (fun T : ℕ => (∑' i, w i) - ∑ i ∈ range T, w i) atTop (𝓝 0)
  have hh : Tendsto (fun T : ℕ => (∑' i, w i) - ∑ i ∈ range T, w i)
      atTop (𝓝 ((∑' i, w i) - (∑' i, w i))) :=
    tendsto_const_nhds.sub hsum.hasSum.tendsto_sum_nat
  simpa only [sub_self] using hh

/-- Any finite set of tail indices is bounded by the whole nonnegative tail. -/
theorem sum_le_tailMass {w : ℕ → ℝ} (hw : ∀ i, 0 ≤ w i) (hsum : Summable w)
    (T : ℕ) (F : Finset ℕ) (hF : ∀ i ∈ F, T ≤ i) :
    ∑ i ∈ F, w i ≤ tailMass w T := by
  have hd : Disjoint (range T) F := by
    apply disjoint_left.mpr
    intro i hi hiF
    exact (Nat.not_le_of_gt (mem_range.mp hi)) (hF i hiF)
  have hh := hsum.sum_le_tsum (range T ∪ F) (fun i _ => hw i)
  rw [sum_union hd] at hh
  unfold tailMass
  linarith

/-- Uniform summable-tail bounds imply little-oh; the finite-color error may depend on the cutoff. -/
theorem uniform_tail_isLittleO {q C : ℝ} {f τ : ℕ → ℝ}
    (hq : 1 < q) (hf : ∀ n, 0 ≤ f n) (hτ : Tendsto τ atTop (𝓝 0))
    (hfinite : ∀ T : ℕ, ∃ g : ℕ → ℝ,
      g =o[atTop] (fun n => q^n) ∧ ∀ n, f n ≤ g n+C*τ T*q^n) :
    f =o[atTop] fun n => q^n := by
  have hct : Tendsto (fun T => C*τ T) atTop (𝓝 0) := by
    simpa only [mul_zero] using hτ.const_mul C
  apply IsLittleO.of_bound
  intro ε hε
  obtain ⟨T, hT⟩ := (hct.eventually (gt_mem_nhds (half_pos hε))).exists
  obtain ⟨g, hg, hbound⟩ := hfinite T
  filter_upwards [hg.bound (half_pos hε)] with n hn
  have hpow : 0 ≤ q^n := pow_nonneg (by linarith) n
  have hg' : g n ≤ (ε/2)*q^n := by
    apply (le_abs_self (g n)).trans
    simpa only [Real.norm_eq_abs, abs_of_nonneg hpow] using hn
  rw [Real.norm_of_nonneg (hf n), Real.norm_of_nonneg hpow]
  calc
    f n ≤ g n+C*τ T*q^n := hbound n
    _ ≤ (ε/2)*q^n+(ε/2)*q^n :=
      add_le_add hg' (mul_le_mul_of_nonneg_right hT.le hpow)
    _ = ε*q^n := by ring

end

end Conjectures.HajduSarkozy.Products
