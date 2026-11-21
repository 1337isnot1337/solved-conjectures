import Conjectures.LopezPousoSeguraBesselConvex

open Set intervalIntegral
namespace BesselWeights

theorem midpoint_strict (g : ℝ → ℝ) (a : ℝ)
    (hc : ContinuousOn g (Icc a (a+2)))
    (hs : StrictConvexOn ℝ (Icc a (a+2)) g) :
     2*g (a+1) < ∫ x in a..a+2, g x := by
  let pair : ℝ → ℝ := fun x => (g x + g (2*a+2-x))/2
  have hp : ContinuousOn pair (Icc a (a+2)) := by
    dsimp [pair]
    refine (hc.add (hc.comp ?_ ?_)).div_const 2
    · fun_prop
    · intro x hx
      simp only [mem_Icc] at hx ⊢
      constructor <;> linarith [hx.1, hx.2]
  have hle : ∀ x ∈ Ioc a (a+2), g (a+1) ≤ pair x := by
    intro x hx
    have hx' : x ∈ Icc a (a+2) := ⟨le_of_lt hx.1,hx.2⟩
    have hy : 2*a+2-x ∈ Icc a (a+2) := by
      constructor <;> linarith [hx.1,hx.2]
    have hh := hs.convexOn.2 hx' hy (show (0:ℝ) ≤ 1/2 by norm_num)
      (show (0:ℝ) ≤ 1/2 by norm_num) (show (1/2:ℝ)+1/2=1 by norm_num)
    simp only [smul_eq_mul] at hh
    have he : (1/2:ℝ)*x+(1/2)*(2*a+2-x)=a+1 := by ring
    rw [he] at hh
    dsimp [pair]
    linarith
  have hlt : ∃ x ∈ Icc a (a+2), g (a+1) < pair x := by
    refine ⟨a, ⟨le_rfl, by linarith⟩, ?_⟩
    have hh := hs.2 (show a ∈ Icc a (a+2) by simp) (show a+2 ∈ Icc a (a+2) by simp)
      (show a ≠ a+2 by linarith) (show (0:ℝ)<1/2 by norm_num)
      (show (0:ℝ)<1/2 by norm_num) (show (1/2:ℝ)+1/2=1 by norm_num)
    simp only [smul_eq_mul] at hh
    have he : (1/2:ℝ)*a+(1/2)*(a+2)=a+1 := by ring
    rw [he] at hh
    dsimp [pair]
    convert hh using 1 <;> ring
  have hint := integral_lt_integral_of_continuousOn_of_le_of_exists_lt
    (show a<a+2 by linarith) continuousOn_const hp hle hlt
  have hi : IntervalIntegrable g MeasureTheory.volume a (a+2) := hc.intervalIntegrable_of_Icc (by linarith)
  have hreflect : IntervalIntegrable (fun x : ℝ => g (2*a+2-x)) MeasureTheory.volume a (a+2) := by
    apply ContinuousOn.intervalIntegrable_of_Icc (by linarith)
    exact (hc.comp (by fun_prop) (by intro x hx; constructor <;> linarith [hx.1,hx.2]))
  have hp_eq : (∫ x in a..a+2, pair x) = ∫ x in a..a+2, g x := by
    dsimp [pair]
    rw [integral_div, integral_add hi hreflect, integral_comp_sub_left]
    convert (show ((∫ x in a..a+2, g x) + (∫ x in a..a+2, g x))/2 = ∫ x in a..a+2, g x by ring) using 1 <;> congr 2 <;> ring
  rw [hp_eq] at hint
  simpa [integral_const, smul_eq_mul] using hint

noncomputable def E (g lam : ℝ → ℝ) (n : ℕ) : ℝ :=
  (∑ k ∈ Finset.range n, g (k+1))/2 - (lam n+lam (n+1))/4

theorem E_source_formula (g lam : ℝ → ℝ) (n : ℕ) :
    E g lam n = 2 * (∑ k ∈ Finset.range n, g (k+1)/4) - (lam n+lam (n+1))/4 := by
  unfold E
  rw [← Finset.sum_div]
  ring

theorem e_decreasing_and_negative (g lam : ℝ → ℝ)
    (hl0 : lam 0 = 0) (hl1 : 0 < lam 1)
    (hc : ∀ a : ℝ, 0 ≤ a → ContinuousOn g (Icc a (a+2)))
    (hs : ∀ a : ℝ, 0 ≤ a → StrictConvexOn ℝ (Icc a (a+2)) g)
    (hld : ContinuousOn lam (Ici 0)) (hd : ∀ x > 0, HasDerivAt lam (g x) x) :
    (∀ n, E g lam n < 0) ∧ StrictAnti (E g lam) := by
  have hstep (n : ℕ) : E g lam (n+1) < E g lam n := by
    have ht := midpoint_strict g n (hc n (by positivity)) (hs n (by positivity))
    have hi : IntervalIntegrable g MeasureTheory.volume n ((n:ℝ)+2) :=
      (hc n (by positivity)).intervalIntegrable_of_Icc (by linarith)
    have hlc : ContinuousOn lam (Icc (n:ℝ) ((n:ℝ)+2)) := hld.mono (fun _ hx => le_trans (Nat.cast_nonneg n) hx.1)
    rw [integral_eq_sub_of_hasDerivAt_of_le (by linarith) hlc (fun x hx => hd x (by linarith [hx.1, show (0:ℝ) ≤ (n:ℝ) from Nat.cast_nonneg n])) hi] at ht
    unfold E
    rw [Finset.sum_range_succ]
    push_cast at *
    have he : (n:ℝ)+1+1 = n+2 := by ring
    rw [he]
    linarith
  have hzero : E g lam 0 < 0 := by simp [E, hl0]; linarith
  constructor
  · intro n
    exact lt_of_le_of_lt (antitone_nat_of_succ_le (fun n => (hstep n).le) (Nat.zero_le n)) hzero
  · exact strictAnti_nat_of_succ_lt hstep
end BesselWeights
