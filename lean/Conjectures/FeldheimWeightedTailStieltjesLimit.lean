import Conjectures.FeldheimWeightedTailStieltjesGrid

/-!
# Feldheim–Feldheim’s weighted tail conjecture

Convergence of the right-endpoint partition integrals, including at atoms.
This supplies the limiting step in §4, equation (9), of the recorded proof
at `2f800fa5191a1d747f126fa20f7e9c2b3730b085`.
-/

open Set MeasureTheory Filter Finset
open scoped Topology

namespace Conjectures.FeldheimWeightedTail

noncomputable section

theorem stieltjesStep_tendsto_of_mem {f : ℝ → ℝ} {a b x : ℝ} (hab : a < b)
    (hx : x ∈ Ioc a b) (hf : ContinuousWithinAt f (Ici x) x) :
    Tendsto (fun n : ℕ => stieltjesStep f a b (n+1) x) atTop (𝓝 (f x)) := by
  choose i hi hc using fun n : ℕ => exists_stieltjesGrid_cell (Nat.succ_pos n) hx
  let q : ℕ → ℝ := fun n => stieltjesGrid a b (n+1) (i n+1)
  have hlow (n : ℕ) : x ≤ q n := (hc n).2
  have hupp (n : ℕ) : q n ≤ x+(b-a)/(↑(n+1):ℝ) := by
    have hs := stieltjesGrid_step a b (n+1) (i n)
    have hl := (hc n).1
    dsimp only [q]
    linarith
  have hmesh : Tendsto (fun n : ℕ => (b-a)/(↑(n+1):ℝ)) atTop (𝓝 0) := by
    simpa only [Nat.cast_add, Nat.cast_one, mul_one_div, mul_zero] using
      (tendsto_one_div_add_atTop_nhds_zero_nat (𝕜 := ℝ)).const_mul (b-a)
  have hu : Tendsto (fun n : ℕ => x+(b-a)/(↑(n+1):ℝ)) atTop (𝓝 x) := by
    simpa only [add_zero] using tendsto_const_nhds.add hmesh
  have hq : Tendsto q atTop (𝓝 x) :=
    tendsto_of_tendsto_of_tendsto_of_le_of_le tendsto_const_nhds hu hlow hupp
  have hqi : Tendsto q atTop (𝓝[Ici x] x) :=
    tendsto_nhdsWithin_iff.mpr ⟨hq, Eventually.of_forall hlow⟩
  have hlim := hf.tendsto.comp hqi
  have heq : (fun n : ℕ => stieltjesStep f a b (n+1) x) = fun n => f (q n) := by
    funext n
    exact stieltjesStep_eq_of_mem hab (Nat.succ_pos n) (hi n) (hc n)
  rw [heq]
  exact hlim

theorem stieltjesStep_tendsto {f : ℝ → ℝ} {a b : ℝ} (hab : a < b)
    (hf : ∀ x, ContinuousWithinAt f (Ici x) x) (x : ℝ) :
    Tendsto (fun n : ℕ => stieltjesStep f a b (n+1) x) atTop
      (𝓝 ((Ioc a b).indicator f x)) := by
  by_cases hx : x ∈ Ioc a b
  · rw [indicator_of_mem hx]
    exact stieltjesStep_tendsto_of_mem hab hx (hf x)
  · rw [indicator_of_notMem hx]
    have heq : (fun n : ℕ => stieltjesStep f a b (n+1) x) = fun _ => 0 := by
      funext n
      exact stieltjesStep_eq_zero_of_notMem hab (Nat.succ_pos n) hx
    rw [heq]
    exact tendsto_const_nhds

theorem integral_stieltjesStep_tendsto {f : ℝ → ℝ} {a b B : ℝ} (hab : a < b)
    (hf : ∀ x, ContinuousWithinAt f (Ici x) x) (hB : 0 ≤ B)
    (hbound : ∀ x ∈ Icc a b, ‖f x‖ ≤ B)
    (μ : Measure ℝ) [IsFiniteMeasure μ] :
    Tendsto (fun n : ℕ => ∫ x, stieltjesStep f a b (n+1) x ∂μ) atTop
      (𝓝 (∫ x in Ioc a b, f x ∂μ)) := by
  have hh := tendsto_integral_of_dominated_convergence (μ := μ) (fun _ : ℝ => B)
    (fun n => (stieltjesStep_measurable f a b (n+1)).aestronglyMeasurable)
    (integrable_const B)
    (fun n => Eventually.of_forall (stieltjesStep_norm_le hab (Nat.succ_pos n) hB hbound))
    (Eventually.of_forall (stieltjesStep_tendsto hab hf))
  simpa only [integral_indicator measurableSet_Ioc] using hh

end

end Conjectures.FeldheimWeightedTail
