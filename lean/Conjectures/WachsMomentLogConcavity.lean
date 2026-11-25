module
public import Mathlib.Algebra.BigOperators.Ring.Finset
public import Mathlib.Basic.Real.Basic
public import Mathlib.Tactic

@[expose] public section
namespace WachsCompleteGraph

def PositiveLogConcave (f : ℕ → ℝ) : Prop :=
  (∀ n, 0<f n) ∧ ∀ n, f n*f (n+2) ≤ (f (n+1))^2

theorem positive_logConcave_ratio_antitone {f : ℕ → ℝ} (h : PositiveLogConcave f) :
    Antitone fun n => f (n+1)/f n := by
  apply antitone_nat_of_succ_le
  intro n
  exact (div_le_div_iff₀ (h.1 (n+1)) (h.1 n)).mpr (by simpa [mul_comm,pow_two] using h.2 n)

theorem positive_logConcave_cross {f : ℕ → ℝ} (h : PositiveLogConcave f) {i j : ℕ} (hij : i≤j) :
    f i*f (j+1) ≤ f j*f (i+1) := by
  have hh := (div_le_div_iff₀ (h.1 j) (h.1 i)).mp (positive_logConcave_ratio_antitone h hij)
  simpa only [mul_comm (f (j+1)),mul_comm (f (i+1))] using hh

/-- A scalar two-by-two Cauchy–Binet identity over a finite index set.
It makes the order-two Toeplitz argument independent of matrix notation. -/
theorem finite_minor_expansion (A B C D : ℕ → ℝ) (N : ℕ) :
    (∑ i ∈ Finset.range N,A i*C i)*(∑ i ∈ Finset.range N,B i*D i) -
      (∑ i ∈ Finset.range N,A i*D i)*(∑ i ∈ Finset.range N,B i*C i) =
    ∑ j ∈ Finset.range N,∑ i ∈ Finset.range j,
      (A i*B j-A j*B i)*(C i*D j-C j*D i) := by
  induction N with
  | zero => simp
  | succ N ih =>
    simp only [Finset.sum_range_succ (n:=N)]
    rw [← ih]
    have h : (∑ i ∈ Finset.range N,(A i*B N-A N*B i)*(C i*D N-C N*D i)) =
        (∑ i ∈ Finset.range N,A i*C i)*(B N*D N) +
        (A N*C N)*(∑ i ∈ Finset.range N,B i*D i) -
        (∑ i ∈ Finset.range N,A i*D i)*(B N*C N) -
        (A N*D N)*(∑ i ∈ Finset.range N,B i*C i) := by
      simp only [Finset.sum_mul,Finset.mul_sum,← Finset.sum_add_distrib,← Finset.sum_sub_distrib]
      apply Finset.sum_congr rfl
      intro i _
      ring
    rw [h]
    ring

end WachsCompleteGraph
