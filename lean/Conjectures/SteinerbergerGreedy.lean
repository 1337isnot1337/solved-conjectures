import Conjectures.SteinerbergerGreedyGrowth

/-!
# Steinerberger's greedy-energy Fourier conjecture

The exact logarithmic Fourier estimate proposed by Stefan Steinerberger in
*Some Open Problems*, 31 March 2026 revision, section 20, is false.  An actual
infinite singleton-start greedy sequence violates every logarithmic constant
at arbitrarily late prefixes.

Source: `results/steinerberger-greedy-fourier/PROOF.md`, especially its dyadic
Fourier calculation and alternating-binary lower bound, committed by Cinna
Davis in `34862f40d7a8b4ee923a5a9ea1f8a9de9a895e43`.  The admissible
sequence is classical van der Corput; Pausinger's earlier general greedy
characterization and Kritzinger's corresponding algorithm are credited in
`SteinerbergerGreedySequence`.  No claim about priority is needed or made.

Indices begin at zero: the source's `x₁` is our `x 0`, and its first `n` points
are `range n`.  The kernel is periodic, and minimization over all real
representatives is minimization over the circle.  The source's stronger
catalogue supplements (all tie-breaks and the sharp limsup constant) are not
asserted here; one admissible infinite output suffices for the conjecture's
unrestricted disproof.
-/

open Filter Asymptotics

namespace Conjectures.SteinerbergerGreedy

noncomputable section

/-- The literal asymptotic estimate for every sequence allowed by the source's greedy rule. -/
def GreedyFourierConjecture : Prop :=
  ∀ x : ℕ → ℝ, IsGreedy x →
    (fun n : ℕ => weightedSum x n) =O[atTop] (fun n : ℕ => Real.log (n:ℝ))

theorem vdc_not_isBigO :
    ¬ (fun n : ℕ => weightedSum vdc n) =O[atTop] (fun n : ℕ => Real.log (n:ℝ)) := by
  intro h
  obtain ⟨C, hC, hbound⟩ := h.exists_pos
  obtain ⟨N, hN⟩ := eventually_atTop.mp hbound.bound
  obtain ⟨n, hn, hfail⟩ := weightedSum_violates C hC.le N
  have hle := hN n hn
  simp only [Real.norm_eq_abs,
    abs_of_nonneg (weightedSum_nonneg vdc n),
    abs_of_nonneg (Real.log_natCast_nonneg n)] at hle
  exact (not_lt_of_ge hle) hfail

theorem conjecture_false : ¬ GreedyFourierConjecture := by
  intro h
  exact vdc_not_isBigO (h vdc vdc_isGreedy)

theorem counterexample :
    ∃ x : ℕ → ℝ, IsGreedy x ∧
      ∀ C : ℝ, 0 ≤ C → ∀ N : ℕ,
        ∃ n : ℕ, N ≤ n ∧ C * Real.log (n:ℝ) < weightedSum x n := by
  exact ⟨vdc, vdc_isGreedy, weightedSum_violates⟩

end
end Conjectures.SteinerbergerGreedy
