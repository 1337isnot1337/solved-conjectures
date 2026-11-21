import Conjectures.BernardiMoralesCounting

set_option linter.unusedSimpArgs false

namespace BernardiMorales

open scoped Classical
open Finset Matrix

variable {V Ω : Type*} [Fintype V] [DecidableEq V]

/-- Signed normalized intersection-event counts. On a nonempty sample,
this is the source probability determinant: for each permutation take the
uniform probability of the intersection of its entry events, then form the
signed sum. The count formula uses total rational division on empty samples. -/
noncomputable def probabilityDeterminant (A : Finset Ω) (M : Ω → Matrix V V ℚ) : ℚ :=
  ∑ σ : Equiv.Perm V, ((Equiv.Perm.sign σ : ℤ) : ℚ) *
    (((A.filter (fun ω => ∀ i, M ω (σ i) i = 1)).card : ℚ) / A.card)

theorem sum_det_eq_signed_event_counts (A : Finset Ω) (M : Ω → Matrix V V ℚ)
    (hM : ∀ ω ∈ A, ∀ i j, M ω i j = 0 ∨ M ω i j = 1) :
    (∑ ω ∈ A, (M ω).det) =
      ∑ σ : Equiv.Perm V, ((Equiv.Perm.sign σ : ℤ) : ℚ) *
        ((A.filter (fun ω => ∀ i, M ω (σ i) i = 1)).card : ℚ) := by
  simp_rw [Matrix.det_apply']
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro σ _
  rw [Finset.natCast_card_filter, Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro ω hω
  congr 1
  by_cases hall : ∀ i, M ω (σ i) i = 1
  · rw [ite_eq_left hall]
    apply Finset.prod_eq_one
    intro i _
    exact hall i
  · rw [ite_eq_right hall]
    push Not at hall
    obtain ⟨i, hi⟩ := hall
    apply Finset.prod_eq_zero (Finset.mem_univ i)
    rcases hM ω hω (σ i) i with hzero | hone
    · exact hzero
    · exact False.elim (hi hone)

theorem probabilityDeterminant_eq_average (A : Finset Ω) (M : Ω → Matrix V V ℚ)
    (hM : ∀ ω ∈ A, ∀ i j, M ω i j = 0 ∨ M ω i j = 1) :
    probabilityDeterminant A M = (∑ ω ∈ A, (M ω).det) / A.card := by
  rw [sum_det_eq_signed_event_counts A M hM, Finset.sum_div]
  simp only [probabilityDeterminant, mul_div_assoc]

theorem sourceEventMatrix_binary (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin r) (D : Finset V)
    (s : Fin r → V → Bool) (i j : V) :
    (sourceEventMatrix C root f D s : Matrix V V ℚ) i j = 0 ∨
      (sourceEventMatrix C root f D s : Matrix V V ℚ) i j = 1 := by
  simp only [sourceEventMatrix, indicatorJ, indicatorI]
  split_ifs <;> simp

/-- The normalized finite-count form of Conjecture 28. On a nonempty
admissible sample this is the source probability determinant. The identity
holds for every fixed surjection before any averaging over surjections. -/
theorem source_probability_determinant (C : CyclicOrder V) (root : V) {r : ℕ}
    (f : {i : V // i ≠ root} → Fin (r+1)) (hf : Function.Surjective f)
    (D : Finset V) (hD : root ∉ D) (p : V →₀ ℕ) :
    probabilityDeterminant
      ((Finset.univ : Finset (Fin (r+1) → V → Bool)).filter (fun s => tupleMembership s = p))
      (fun s => sourceEventMatrix C root f D s) =
    (((Finset.univ : Finset (Fin (r+1) → V → Bool)).filter
      (fun s => isTargetTuple root D s ∧ tupleMembership s = p)).card : ℚ) /
      ((Finset.univ : Finset (Fin (r+1) → V → Bool)).filter
        (fun s => tupleMembership s = p)).card := by
  rw [probabilityDeterminant_eq_average _ _
    (by intro s _ i j; exact sourceEventMatrix_binary C root f D s i j)]
  rw [source_event_membership_count C root f hf D hD p]

end BernardiMorales
