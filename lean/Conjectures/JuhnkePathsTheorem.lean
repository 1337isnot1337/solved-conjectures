import Conjectures.JuhnkeConjecture
import Conjectures.JuhnkePathsOriginal
import Conjectures.JuhnkePathsBoundaryConcavity
import Conjectures.JuhnkePathsSteps

/-!
# Juhnke's conjecture

Full all-dimensional formalization of Conjecture 6 in Martina Juhnke's
Problem 9, Oberwolfach Report 2/2026, pp. 149–150. `originalPathCount d k`
counts all positive-length east/north paths with exactly `k` steps from
`(2,1)` to either `(d-1,d)` or `(d,d-1)`. The representation is proved
equivalent to ordinary ordered lists of positive steps.

The proof is the existing `results/juhnke-lattice-paths/PROOF.md`: enumerate
maximal direction runs, prove log-concavity of their combined counts, and
apply polynomial translation and reversal. Dimensions two and three are
included. No diagonal-avoidance or coherent-path condition is imposed.
-/

namespace Juhnke

theorem originalPathPolynomial_strongLogConcave {d : ℕ} (hd : 2 ≤ d) :
    (∀ i, 0 ≤ (originalPathPolynomial d).coeff i) ∧
      StrongLogConcave (originalPathPolynomial d).coeff := by
  by_cases h2 : d = 2
  · subst d
    rw [originalPathPolynomial_two]
    exact ⟨one_coeff_nonneg, one_coeff_strongLogConcave⟩
  by_cases h3 : d = 3
  · subst d
    rw [originalPathPolynomial_three]
    exact ⟨dimension_three_coeff_nonneg, dimension_three_strongLogConcave⟩
  have hm : 1 ≤ d - 3 := by omega
  have hd' : d = (d - 3) + 3 := by omega
  rw [hd', originalPathPolynomial_translated]
  exact combined_pathPolynomial_strongLogConcave hm

theorem originalPathPolynomial_logConcave {d : ℕ} (hd : 2 ≤ d) :
    LogConcave (originalPathPolynomial d).coeff :=
  (originalPathPolynomial_strongLogConcave hd).2.logConcave

theorem originalPathPolynomial_unimodal {d : ℕ} (hd : 2 ≤ d) :
    Unimodal (originalPathPolynomial d).coeff := by
  have h := originalPathPolynomial_strongLogConcave hd
  exact polynomial_unimodal_of_strongLogConcave h.1 h.2

/-- The adjacent log-concavity inequalities for the original natural path counts. -/
theorem originalPathCount_logConcave {d : ℕ} (hd : 2 ≤ d) (k : ℕ) :
    originalPathCount d k * originalPathCount d (k + 2) ≤
      originalPathCount d (k + 1) ^ 2 := by
  have h := originalPathPolynomial_logConcave hd k
  simp only [originalPathPolynomial_coeff] at h
  exact_mod_cast h

/-- The exact original path-count sequence increases to a mode and decreases thereafter. -/
theorem originalPathCount_unimodal {d : ℕ} (hd : 2 ≤ d) :
    ∃ k : ℕ,
      (∀ i j, i ≤ j → j ≤ k → originalPathCount d i ≤ originalPathCount d j) ∧
      (∀ i j, k ≤ i → i ≤ j → originalPathCount d j ≤ originalPathCount d i) := by
  obtain ⟨k, hleft, hright⟩ := originalPathPolynomial_unimodal hd
  refine ⟨k, ?_, ?_⟩
  · intro i j hij hjk
    have h := hleft i j hij hjk
    simp only [originalPathPolynomial_coeff] at h
    exact_mod_cast h
  · intro i j hki hij
    have h := hright i j hki hij
    simp only [originalPathPolynomial_coeff] at h
    exact_mod_cast h

/-- Juhnke's Conjecture 6, for every dimension in its path convention. -/
theorem juhnke_conjecture (d : ℕ) (hd : 2 ≤ d) :
    (∀ k, originalPathCount d k * originalPathCount d (k + 2) ≤
      originalPathCount d (k + 1) ^ 2) ∧
    (∃ k : ℕ,
      (∀ i j, i ≤ j → j ≤ k → originalPathCount d i ≤ originalPathCount d j) ∧
      (∀ i j, k ≤ i → i ≤ j → originalPathCount d j ≤ originalPathCount d i)) :=
  ⟨originalPathCount_logConcave hd, originalPathCount_unimodal hd⟩

end Juhnke
